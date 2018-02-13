#define CATCH_CONFIG_MAIN  // This tells Catch to provide a main() - only do this in one cpp file
#include <catch.hpp>
#include <<%= libraryName2 %>/<%= libraryName2 %>.h>

TEST_CASE("<%= libraryName2 %>_api_foobar returns nineteen","[<%= libraryName2 %>_api_foobar]") {
    REQUIRE(19 == <%= libraryName2 %>_api());
}
