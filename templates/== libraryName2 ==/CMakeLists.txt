cmake_minimum_required(VERSION 3.5)
project(<%= libraryName2 %>)

find_package(<%= libraryName1 %> REQUIRED)

add_library(${PROJECT_NAME} library_main.cpp)
add_library(${PROJECT_NAME}::${PROJECT_NAME} ALIAS ${PROJECT_NAME})
target_compile_features(${PROJECT_NAME} PUBLIC cxx_std_14)

target_include_directories(${PROJECT_NAME}
  PUBLIC
    include
    ${CMAKE_BINARY_DIR}/include
)

target_link_libraries(${PROJECT_NAME}
  PRIVATE
    <%= libraryName1 %>::<%= libraryName1 %>
)

include(GenerateExportHeader)
generate_export_header(${PROJECT_NAME}
  EXPORT_FILE_NAME ${CMAKE_BINARY_DIR}/include/${PROJECT_NAME}/export.h
  EXPORT_MACRO_NAME <%= libraryName2 %>_API
)
