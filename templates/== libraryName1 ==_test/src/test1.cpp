#include <iostream>
#include <<%= libraryName1 %>/<%= libraryName1 %>.h>
#include <gtest/gtest.h>

TEST(<%= libraryName1 %>_api_foobar, returns_the_ultimate_result) {
    ASSERT_EQ(42, <%= libraryName1 %>_api());
}
