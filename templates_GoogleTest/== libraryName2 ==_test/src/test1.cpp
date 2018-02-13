#include <iostream>
#include <<%= libraryName2 %>/<%= libraryName2 %>.h>
#include <gtest/gtest.h>

TEST(<%= libraryName2 %>_api_foobar, returns_nineteen) {
    ASSERT_EQ(19, <%= libraryName2 %>_api());
}
