cmake_minimum_required(VERSION 3.5)
project(<%= appName %> LANGUAGES CXX)

find_package(<%= libraryName1 %> REQUIRED)
find_package(<%= libraryName2 %> REQUIRED)

add_executable(${PROJECT_NAME} src/main.cpp)

target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_14)

target_link_libraries(${PROJECT_NAME}
  PRIVATE
    <%= libraryName1 %>::<%= libraryName1 %>
    <%= libraryName2 %>::<%= libraryName2 %>
)

install(TARGETS ${PROJECT_NAME} DESTINATION bin)
