cmake_minimum_required(VERSION 3.5)
project(mylib)

add_library(${PROJECT_NAME} mylib.cpp)

include(GenerateExportHeader)
target_include_directories(${PROJECT_NAME}
  PUBLIC
    include
    ${CMAKE_BINARY_DIR}/include
)

generate_export_header(${PROJECT_NAME}
  EXPORT_FILE_NAME ${CMAKE_BINARY_DIR}/include/${PROJECT_NAME}/export.h
  EXPORT_MACRO_NAME MYLIB_API
)
