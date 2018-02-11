cmake_minimum_required(VERSION 3.5)

list(INSERT CMAKE_MODULE_PATH 0 ${CMAKE_CURRENT_LIST_DIR}/cmake)
list(INSERT CMAKE_PREFIX_PATH 0 ${CMAKE_CURRENT_LIST_DIR}/cmake)

include(AddModule)
include(AddExternalModule)

add_module(NAME <%= libraryName1 %>)
add_module(NAME <%= libraryName2 %>)
add_module(NAME <%= appName %>)


set(CMAKE_MACOSX_RPATH 1)
add_external_module(
  NAME         GTest
  TARGETS      gtest_main gtest
  URL          https://github.com/google/googletest.git
  BRANCH       release-1.8.0
  CHECKOUT_DIR external/googletest
  DIRECTORY    external/googletest
  QUIET
)

## The target GTest::Main is expected to be provided via find_package(GTest)
## Since the library itself doesn't define it, we have to do it ourselves
add_library(GTest::Main ALIAS gtest_main)

enable_testing()
add_module(NAME <%= libraryName1 %>_test)
add_module(NAME <%= libraryName2 %>_test)
