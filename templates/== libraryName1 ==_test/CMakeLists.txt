cmake_minimum_required(VERSION 3.5)
project(<%= libraryName1 %>_test)

find_package(GTest REQUIRED)
find_package(<%= libraryName1 %> REQUIRED)

add_executable(${PROJECT_NAME} test1.cpp)
target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_14)

target_link_libraries(${PROJECT_NAME}
  PRIVATE
    <%= libraryName1 %>::<%= libraryName1 %>
    GTest::Main
)

add_test(
  NAME    ${PROJECT_NAME}
  COMMAND $<TARGET_FILE:${PROJECT_NAME}>
)
