cmake_minimum_required(VERSION 3.5)

list(INSERT CMAKE_MODULE_PATH 0 ${CMAKE_CURRENT_LIST_DIR}/cmake)

include(AddModule)
include(GitClone)

add_module(NAME <%= libraryName1 %>)
add_module(NAME <%= libraryName2 %>)

add_module(NAME <%= appName %>)

git_clone(
  URL https://github.com/google/googletest.git
  BRANCH release-1.8.0
  CHECKOUT_DIR external/googletest
  QUIET
)

add_module(
  NAME gtest
  DIRECTORY external/googletest
)


enable_testing()
add_module(NAME <%= libraryName1 %>_test)
add_module(NAME <%= libraryName2 %>_test)
