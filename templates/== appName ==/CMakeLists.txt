cmake_minimum_required(VERSION 3.5)
project(<%= appName %>)

find_package(<%= libraryName1 %> REQUIRED)
find_package(<%= libraryName2 %> REQUIRED)

add_executable(${PROJECT_NAME} main.cpp)
target_link_libraries(${PROJECT_NAME}
  PRIVATE
    <%= libraryName1 %>::<%= libraryName1 %>
    <%= libraryName2 %>::<%= libraryName2 %>
)
