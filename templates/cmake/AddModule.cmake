include_guard(GLOBAL)

list(INSERT CMAKE_PREFIX_PATH 0 "${PROJECT_BINARY_DIR}/modules")

include(CMakeParseArguments)


## add_module(NAME       <name of module>
##           [DIRECTORY  <directory of module>]              # defaults to the given NAME
##           [TARGET     <name of the target of the module>] # defaults to the given NAME
## )
macro(add_module)
  cmake_parse_arguments(ADD_MODULE "" "NAME;DIRECTORY;TARGET" "" ${ARGN})
  if(NOT ADD_MODULE_DIRECTORY)
    set(ADD_MODULE_DIRECTORY "${ADD_MODULE_NAME}")
  endif()
  if(NOT ADD_MODULE_TARGET)
    set(ADD_MODULE_TARGET "${ADD_MODULE_NAME}")
  endif()

  add_subdirectory(${ADD_MODULE_DIRECTORY} ${ADD_MODULE_UNPARSED_ARGUMENTS})
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
