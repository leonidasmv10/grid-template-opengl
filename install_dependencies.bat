@echo off

echo Extract modules...
git submodule update --init --recursive

echo Configure vcpkg...
call .\vcpkg\bootstrap-vcpkg.bat

echo Install glfw3...
call .\vcpkg\vcpkg install glfw3:x64-windows

echo Install glew...
call .\vcpkg\vcpkg install glew:x64-windows

echo Install glm...
call .\vcpkg\vcpkg install glm:x64-windows

echo Install stb...
call .\vcpkg\vcpkg install stb:x64-windows

echo Install imgui...
call .\vcpkg\vcpkg install imgui[core,glfw-binding,opengl3-binding,docking-experimental]:x64-windows

echo Install imguizmo...
call .\vcpkg\vcpkg install imguizmo:x64-windows

echo Install assimp...
call .\vcpkg\vcpkg install assimp:x64-windows

echo Install physx...
call .\vcpkg\vcpkg install physx:x64-windows

echo Install spdlog...
call .\vcpkg\vcpkg install spdlog:x64-windows

echo Building CMake...
call cmake -G "Visual Studio 17 2022" -B "build"

echo Installation completed.
pause
