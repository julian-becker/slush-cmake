cmake_minimum_required(VERSION 3.5)

include(cmake/AddLibraryPackage.cmake)
include(cmake/AddAppPackage.cmake)

add_library_package(LIBRARY <%= libraryName1 %>)
add_library_package(LIBRARY <%= libraryName2 %>)

add_app_package(APP <%= appName %>)
