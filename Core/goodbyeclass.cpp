#include "goodbyeclass.h"

namespace jlu
{
    Goodbye::Goodbye()
    {
        std::cout << "Se ejecuta el constructor de la clase Goodbye." << std::endl;
    }

    Goodbye::~Goodbye()
    {
        std::cout << "Destructor de la clase Goodbye... " << std::endl;
    }

    void Goodbye::printBye(const std::string name)
    {
        std::cout << "¡Adiós! " << name << " que te vaya bonito..." << std::endl;
    }
} // namespace jl