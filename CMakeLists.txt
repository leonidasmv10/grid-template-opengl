cmake_minimum_required(VERSION 3.0)
SET(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake")

project(Grid)
file(GLOB_RECURSE fileCollection "Engine/*.cpp")

SET(Tutorial_VERSION_MAJOR 1)
SET(Tutorial_VERSION_MINOR 0)

add_subdirectory(Core)

# -- GENERAMOS EL ARCHIVO *.h EN EL QUE TENDREMOS LOS VALORES DE LAS VARIABLES
configure_file(${PROJECT_SOURCE_DIR}/config.h.in ${PROJECT_SOURCE_DIR}/config.h)

find_package(glfw3 CONFIG REQUIRED)
find_package(GLEW REQUIRED)
find_package(imgui CONFIG REQUIRED)
find_package(imguizmo CONFIG REQUIRED)
find_package(glm CONFIG REQUIRED)
find_package(assimp CONFIG REQUIRED)
find_package(soil2 CONFIG REQUIRED)
find_package(freetype CONFIG REQUIRED)

find_library(OPENVR_LIBRARY openvr_api)

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

add_executable(${PROJECT_NAME} ${fileCollection})


target_link_libraries(${PROJECT_NAME} PRIVATE glfw)
target_link_libraries(${PROJECT_NAME} PRIVATE GLEW::GLEW)
target_link_libraries(${PROJECT_NAME} PRIVATE imgui::imgui)
target_link_libraries(${PROJECT_NAME} PRIVATE imguizmo::imguizmo)
target_link_libraries(${PROJECT_NAME} PRIVATE glm::glm)
target_link_libraries(${PROJECT_NAME} PRIVATE assimp::assimp)
target_link_libraries(${PROJECT_NAME} PRIVATE soil2)
target_link_libraries(${PROJECT_NAME} PRIVATE freetype)

target_link_libraries(${PROJECT_NAME} PUBLIC ${OPENVR_LIBRARY})

target_link_libraries(${PROJECT_NAME} PUBLIC CoreLib)

# physx link
target_link_libraries(${PROJECT_NAME} PUBLIC ${PHYSX1_LIBRARY} ${PHYSX2_LIBRARY} 
${PHYSX3_LIBRARY} ${PHYSX4_LIBRARY} ${PHYSX5_LIBRARY} ${PHYSX6_LIBRARY} ${PHYSX7_LIBRARY} 
${PHYSX8_LIBRARY} ${PHYSX9_LIBRARY} ${PHYSX10_LIBRARY} ${PHYSX11_LIBRARY} ${PHYSX12_LIBRARY} 
${PHYSX13_LIBRARY} ${PHYSX14_LIBRARY})

target_include_directories(${PROJECT_NAME} PUBLIC
                          "${PROJECT_BINARY_DIR}"
                          "${PROJECT_SOURCE_DIR}/Core"
                          )

# message("OUTPUT: " ${PHYSX14_LIBRARY})