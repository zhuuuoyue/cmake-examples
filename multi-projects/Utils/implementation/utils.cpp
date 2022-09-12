#include "utils.h"
#include <iostream>

void utils::hello(const std::string& name)
{
    if (name.empty())
    {
        std::cout << "hello" << std::endl;
    }
    else
    {
        std::cout << "hello " << name << std::endl;
    }
}
