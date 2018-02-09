include_guard(GLOBAL)

list(INSERT CMAKE_PREFIX_PATH 0 "${PROJECT_BINARY_DIR}/modules")

include(CMakeParseArguments)

macro(add_module)
  cmake_parse_arguments(ADD_MODULE "" "DIRECTORY;TARGET;NAME" "" ${ARGN})
  if(NOT ADD_MODULE_DIRECTORY)
    set(ADD_MODULE_DIRECTORY "${ADD_MODULE_NAME}")
  endif()
  if(NOT ADD_MODULE_TARGET)
    set(ADD_MODULE_TARGET "${ADD_MODULE_NAME}")
  endif()

  add_subdirectory(${ADD_MODULE_DIRECTORY})
  export(TARGETS ${ADD_MODULE_TARGET} FILE "${PROJECT_BINARY_DIR}/targets/${ADD_MODULE_TARGET}Targets.cmake" )

  file(WRITE "${PROJECT_BINARY_DIR}/cmake/${ADD_MODULE_TARGET}Config.cmake.in" "
    if(NOT TARGET ${ADD_MODULE_TARGET})
      include(${PROJECT_BINARY_DIR}/targets/${ADD_MODULE_TARGET}Targets.cmake )
    endif()
  ")

  configure_file(
  	"${PROJECT_BINARY_DIR}/cmake/${ADD_MODULE_TARGET}Config.cmake.in"
  	"${PROJECT_BINARY_DIR}/modules/${ADD_MODULE_TARGET}Config.cmake"
  )
  unset(ADD_MODULE_DIRECTORY)
  unset(ADD_MODULE_TARGET)
  unset(ADD_MODULE_NAME)
endmacro(add_module)
