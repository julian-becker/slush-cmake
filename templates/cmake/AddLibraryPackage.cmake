include_guard(GLOBAL)

list(INSERT CMAKE_PREFIX_PATH 0 "${PROJECT_BINARY_DIR}/modules")

include(CMakeParseArguments)

macro(add_library_package)
  cmake_parse_arguments(LIBRARY_PACKAGE "" "DIRECTORY;TARGET;LIBRARY" "" ${ARGN})
  if(NOT LIBRARY_PACKAGE_DIRECTORY)
    set(LIBRARY_PACKAGE_DIRECTORY "${LIBRARY_PACKAGE_LIBRARY}")
  endif()
  if(NOT LIBRARY_PACKAGE_TARGET)
    set(LIBRARY_PACKAGE_TARGET "${LIBRARY_PACKAGE_LIBRARY}")
  endif()

  # message("Adding library ${LIBRARY_PACKAGE_LIBRARY}")

  add_subdirectory(${LIBRARY_PACKAGE_DIRECTORY})
  export(TARGETS ${LIBRARY_PACKAGE_TARGET} FILE "${PROJECT_BINARY_DIR}/targets/${LIBRARY_PACKAGE_TARGET}Targets.cmake" )

  file(WRITE "${PROJECT_BINARY_DIR}/cmake/${LIBRARY_PACKAGE_TARGET}Config.cmake.in" "
  if(NOT TARGET ${LIBRARY_PACKAGE_TARGET})
    include(${PROJECT_BINARY_DIR}/targets/${LIBRARY_PACKAGE_TARGET}Targets.cmake )
  endif()
  ")

  configure_file(
  	"${PROJECT_BINARY_DIR}/cmake/${LIBRARY_PACKAGE_TARGET}Config.cmake.in"
  	"${PROJECT_BINARY_DIR}/modules/${LIBRARY_PACKAGE_TARGET}Config.cmake"
  )
  unset(LIBRARY_MODULE_DIRECTORY)
  unset(LIBRARY_MODULE_TARGET)
endmacro(add_library_package)
