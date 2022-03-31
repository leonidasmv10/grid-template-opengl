SET(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake")
find_package(spdlog CONFIG REQUIRED)

add_executable(LIB_CORE "${CMAKE_CURRENT_LIST_DIR}/thirdparty.cpp")

target_link_libraries(LIB_CORE PRIVATE spdlog::spdlog spdlog::spdlog_header_only)