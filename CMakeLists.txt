cmake_minimum_required(VERSION 3.14)

SET(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake")
SET(GRID_VERSION_MAX 1.2)
# string(APPEND GRID_PATH "${CMAKE_CURRENT_SOURCE_DIR}")

project(grid)

file(GLOB_RECURSE MAIN
         RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
         ${CMAKE_CURRENT_SOURCE_DIR}/Engine/*.cpp 
         ${CMAKE_CURRENT_SOURCE_DIR}/Engine/*.h)

file(GLOB_RECURSE SCENE_SCRIPTS
         RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
         ${CMAKE_CURRENT_SOURCE_DIR}/Engine/Scene/*.cpp
         ${CMAKE_CURRENT_SOURCE_DIR}/Engine/Scene/*.h)

source_group("Scenes" FILES ${SCENE_SCRIPTS})

# -- GENERAMOS EL ARCHIVO *.h EN EL QUE TENDREMOS LOS VALORES DE LAS VARIABLES
configure_file(${PROJECT_SOURCE_DIR}/config.h.in ${PROJECT_SOURCE_DIR}/config.h)

find_path(STB_INCLUDE_DIRS "stb.h")

find_package(Stb REQUIRED)
find_package(glfw3 CONFIG REQUIRED)
find_package(GLEW REQUIRED)
find_package(imgui CONFIG REQUIRED)
find_package(imguizmo CONFIG REQUIRED)
find_package(glm CONFIG REQUIRED)
find_package(assimp CONFIG REQUIRED)


# physx library
find_library(PHYSX1_LIBRARY LowLevel_static_64)
find_library(PHYSX2_LIBRARY LowLevelAABB_static_64)
find_library(PHYSX3_LIBRARY LowLevelDynamics_static_64)
find_library(PHYSX4_LIBRARY PhysX_64)
find_library(PHYSX5_LIBRARY PhysXCharacterKinematic_static_64)
find_library(PHYSX6_LIBRARY PhysXCommon_64)
find_library(PHYSX7_LIBRARY PhysXCooking_64)
find_library(PHYSX8_LIBRARY PhysXExtensions_static_64)
find_library(PHYSX9_LIBRARY PhysXFoundation_64)
find_library(PHYSX10_LIBRARY PhysXPvdSDK_static_64)
find_library(PHYSX11_LIBRARY PhysXTask_static_64)
find_library(PHYSX12_LIBRARY PhysXVehicle_static_64)
find_library(PHYSX13_LIBRARY SceneQuery_static_64)
find_library(PHYSX14_LIBRARY SimulationController_static_64)

add_executable(${PROJECT_NAME} ${MAIN} ${SCENE_SCRIPTS})

target_link_libraries(${PROJECT_NAME} PRIVATE glfw)
target_link_libraries(${PROJECT_NAME} PRIVATE GLEW::GLEW)
target_link_libraries(${PROJECT_NAME} PRIVATE imgui::imgui)
target_link_libraries(${PROJECT_NAME} PRIVATE imguizmo::imguizmo)
target_link_libraries(${PROJECT_NAME} PRIVATE glm::glm)
target_link_libraries(${PROJECT_NAME} PRIVATE assimp::assimp)

target_link_libraries(${PROJECT_NAME} PUBLIC ${EXTRA_LIBS})

# physx link
target_link_libraries(${PROJECT_NAME} PUBLIC ${PHYSX1_LIBRARY} ${PHYSX2_LIBRARY} 
${PHYSX3_LIBRARY} ${PHYSX4_LIBRARY} ${PHYSX5_LIBRARY} ${PHYSX6_LIBRARY} ${PHYSX7_LIBRARY} 
${PHYSX8_LIBRARY} ${PHYSX9_LIBRARY} ${PHYSX10_LIBRARY} ${PHYSX11_LIBRARY} ${PHYSX12_LIBRARY} 
${PHYSX13_LIBRARY} ${PHYSX14_LIBRARY})

target_include_directories(${PROJECT_NAME} PUBLIC "${PROJECT_BINARY_DIR}" ${EXTRA_INCLUDES})
target_include_directories(${PROJECT_NAME} PRIVATE ${Stb_INCLUDE_DIR})
target_precompile_headers(${PROJECT_NAME} PRIVATE 
"$<$<COMPILE_LANGUAGE:CXX>:${CMAKE_CURRENT_SOURCE_DIR}/Engine/pch.h>")


message("OUTPUT: " ${PROJECT_SOURCE_DIR}/Core)