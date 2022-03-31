add_library(GRID_CORE pch.cpp)
include(thirdparty/CMakeLists.txt)

file(GLOB API_FILES    
    "API/*.cpp" "API/*.h"  
)

file(GLOB RA_FILES    
    "RA/*.cpp" "RA/*.h"
)

source_group("API" FILES ${API_FILES})
source_group("RA" FILES ${RA_FILES})

target_precompile_headers(GRID_CORE PRIVATE 
"$<$<COMPILE_LANGUAGE:CXX>:${CMAKE_CURRENT_SOURCE_DIR}/pch.h>")

target_sources(GRID_CORE PRIVATE ${API_FILES} ${RA_FILES})



                                