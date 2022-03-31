add_library(GRID_CORE Core.cpp)
include(thirdparty/CMakeLists.txt)

file(GLOB API_FILES    
    "API/*.cpp" "API/*.h"  
)

file(GLOB RA_FILES    
    "RA/*.cpp" "RA/*.h"
)

source_group("API" FILES ${API_FILES})
source_group("RA" FILES ${RA_FILES})

target_sources(GRID_CORE PRIVATE ${API_FILES} ${RA_FILES})

                                