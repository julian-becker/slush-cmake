#include <<%= libraryName1 %>/<%= libraryName1 %>.h>
#include <<%= libraryName2 %>/<%= libraryName2 %>.h>
#include <iostream>

int main()
{
    <%= libraryName1 %>_api();
    <%= libraryName2 %>_api();
    std::cout << "hello world from <%= appName %>" << std::endl;
}
