cmake_minimum_required(VERSION 3.5)

list(INSERT CMAKE_MODULE_PATH 0 ${CMAKE_CURRENT_LIST_DIR}/cmake)
list(INSERT CMAKE_PREFIX_PATH 0 ${CMAKE_CURRENT_LIST_DIR}/cmake)

include(AddModule)
include(AddExternalModule)
include(SetupGoogleTest)

add_module(NAME <%= libraryName1 %>)
add_module(NAME <%= libraryName2 %>)
add_module(NAME <%= appName %>)
add_subdirectory(doc)

setup_googletest()
enable_testing()

add_module(NAME <%= libraryName1 %>_test)
add_module(NAME <%= libraryName2 %>_test)

