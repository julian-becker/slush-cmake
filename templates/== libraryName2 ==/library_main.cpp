#include <<%= libraryName2 %>/<%= libraryName2 %>.h>
#include <<%= libraryName1 %>/<%= libraryName1 %>.h>
#include <iostream>

int <%= libraryName2 %>_api()
{
    std::cout << "hello from <%= libraryName2 %>" << std::endl;
    std::cout << "calling <%= libraryName1 %>" << std::endl;

    int const result = <%= libraryName1 %>_api();

    std::cout << "back in <%= libraryName2 %>" << std::endl;
    return result - 23;
}
