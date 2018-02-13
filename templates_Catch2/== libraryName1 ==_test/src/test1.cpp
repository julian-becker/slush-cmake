#define CATCH_CONFIG_MAIN  // This tells Catch to provide a main() - only do this in one cpp file
#include <catch.hpp>
#include <<%= libraryName1 %>/<%= libraryName1 %>.h>

TEST_CASE("<%= libraryName1 %>_api_foobar returns the ultimate result","[<%= libraryName1 %>_api_foobar]") {
    REQUIRE(42 == <%= libraryName1 %>_api());
}
