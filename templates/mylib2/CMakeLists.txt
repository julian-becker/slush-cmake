cmake_minimum_required(VERSION 3.5)
project(mylib2)

find_package(mylib REQUIRED)

add_library(${PROJECT_NAME} mylib2.cpp)
target_link_libraries(${PROJECT_NAME} mylib)

add_executable(${PROJECT_NAME}_test main.cpp)
target_link_libraries(${PROJECT_NAME}_test ${PROJECT_NAME})
