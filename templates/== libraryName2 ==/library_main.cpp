#include <<%= libraryName1 %>/<%= libraryName1 %>.h>
#include <iostream>

void <%= libraryName2 %>_api()
{
    std::cout << "hello from <%= libraryName2 %>" << std::endl;
    std::cout << "calling <%= libraryName1 %>" << std::endl;

    <%= libraryName1 %>_api();

    std::cout << "back in <%= libraryName2 %>" << std::endl;
}
