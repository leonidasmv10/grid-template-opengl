#include <iostream>
#include <string>
#include <spdlog/spdlog.h>
#ifndef GoodbyeLib
#define GoodbyeLib

namespace jlu
{
    class Goodbye
    {
        public:
            Goodbye();
            ~Goodbye();
            void printBye(const std::string name);
    };
} // namespace jlu
#endif