#include <<%= libraryName1 %>/export.h>
#include <iostream>

<%= libraryName1 %>_API int <%= libraryName1 %>_api()
{
    std::cout << "hello from <%= libraryName1 %>" << std::endl;
    return 42;
}
