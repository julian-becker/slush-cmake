cmake_minimum_required(VERSION 3.5)
project(<%= libraryName1 %>)

add_library(${PROJECT_NAME} library_main.cpp)
add_library(${PROJECT_NAME}::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

target_include_directories(${PROJECT_NAME}
  PUBLIC
    include
    ${CMAKE_BINARY_DIR}/include
)

include(GenerateExportHeader)
generate_export_header(${PROJECT_NAME}
  EXPORT_FILE_NAME ${CMAKE_BINARY_DIR}/include/${PROJECT_NAME}/export.h
  EXPORT_MACRO_NAME <%= libraryName1 %>_API
)
