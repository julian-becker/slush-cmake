#include <<%= libraryName1 %>/export.h>
#include <iostream>

<%= LIBRARYNAME1 %>_API int <%= libraryName1 %>_api()
{
    std::cout << "hello from <%= libraryName1 %>" << std::endl;
    return 42;
}
