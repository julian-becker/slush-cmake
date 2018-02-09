cmake_minimum_required(VERSION 3.5)
project(<%= libraryName2 %>_test)

find_package(GTest REQUIRED)
find_package(<%= libraryName2 %> REQUIRED)

add_executable(${PROJECT_NAME} test1.cpp)

target_link_libraries(${PROJECT_NAME}
  PRIVATE
    <%= libraryName2 %>::<%= libraryName2 %>
    GTest::Main
)

add_test(
  NAME    ${PROJECT_NAME}
  COMMAND $<TARGET_FILE:${PROJECT_NAME}>
)
