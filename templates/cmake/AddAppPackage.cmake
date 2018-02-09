include_guard(GLOBAL)

list(INSERT CMAKE_PREFIX_PATH 0 "${PROJECT_BINARY_DIR}/modules")

include(CMakeParseArguments)

macro(add_app_package)
  cmake_parse_arguments(APP_PACKAGE "" "DIRECTORY;TARGET;APP" "" ${ARGN})
  if(NOT APP_PACKAGE_DIRECTORY)
    set(APP_PACKAGE_DIRECTORY "${APP_PACKAGE_APP}")
  endif()
  if(NOT APP_PACKAGE_TARGET)
    set(APP_PACKAGE_TARGET "${APP_PACKAGE_APP}")
  endif()

  add_subdirectory(${APP_PACKAGE_DIRECTORY})
  export(TARGETS ${APP_PACKAGE_TARGET} FILE "${PROJECT_BINARY_DIR}/targets/${APP_PACKAGE_TARGET}Targets.cmake" )

  file(WRITE "${PROJECT_BINARY_DIR}/cmake/${APP_PACKAGE_TARGET}Config.cmake.in" "
  if(NOT TARGET ${APP_PACKAGE_TARGET})
    include(${PROJECT_BINARY_DIR}/targets/${APP_PACKAGE_TARGET}Targets.cmake )
  endif()
  ")

  configure_file(
  	"${PROJECT_BINARY_DIR}/cmake/${APP_PACKAGE_TARGET}Config.cmake.in"
  	"${PROJECT_BINARY_DIR}/modules/${APP_PACKAGE_TARGET}Config.cmake"
  )
  unset(APP_MODULE_DIRECTORY)
  unset(APP_MODULE_TARGET)
endmacro(add_app_package)
