cmake_minimum_required(VERSION 3.5)
project(<%= libraryName2 %> LANGUAGES CXX)

find_package(<%= libraryName1 %> REQUIRED)

add_library(${PROJECT_NAME} src/library_main.cpp)
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
  EXPORT_MACRO_NAME <%= LIBRARYNAME2 %>_API
)


include(GNUInstallDirs)

install(
    TARGETS  ${PROJECT_NAME}
    EXPORT   ${PROJECT_NAME}Config
    ARCHIVE  DESTINATION ${CMAKE_INSTALL_LIBDIR}
    LIBRARY  DESTINATION ${CMAKE_INSTALL_LIBDIR}
    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

install(DIRECTORY include/${PROJECT_NAME} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
install(DIRECTORY ${CMAKE_BINARY_DIR}/include/${PROJECT_NAME} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
install(EXPORT <%= libraryName2 %>Config DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake)
