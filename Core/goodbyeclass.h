#include <iostream>
#include <string>

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