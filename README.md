# [Grid Engine](https://github.com/dev3097/grid-engine)

## Summary
Grid Engine is a graphics engine developed with the OpenGL API.

## Getting Started
Grid has a single dependency: [cmake](http://www.cmake.org/download/), which is used to generate platform-specific makefiles or project files. Start by cloning this repository, making sure to pass the `--recursive` flag to grab all the dependencies. If you forgot, then you can `git submodule update --init` instead.

```bash
git clone --recursive https://github.com/dev3097/grid-engine.git
```
Now configure vcpkg, a Microsoft library that allows you to add external library dependencies in a very simple way.

```bash
.\vcpkg\bootstrap-vcpkg.bat
```
Now install all the libraries that make up the graphics engine with each command and description:

Functionality           | Library                                               | Comand vcpkg
----------------------- | ----------------------------------------------------- | -----------------
Mesh Loading            | [assimp](https://github.com/assimp/assimp)            | .\vcpkg\vcpkg install assimp:x64-windows
Physics                 | [physx](https://github.com/NVIDIAGameWorks/PhysX)     | .\vcpkg\vcpkg install physx:x64-windows
OpenGL Function Loader  | [glew](https://github.com/nigels-com/glew)            | .\vcpkg\vcpkg install glew:x64-windows
Windowing and Input     | [glfw](https://github.com/glfw/glfw)                  | .\vcpkg\vcpkg install glfw3:x64-windows
OpenGL Mathematics      | [glm](https://github.com/g-truc/glm)                  | .\vcpkg\vcpkg install glm:x64-windows
Texture Loading         | [stb](https://github.com/nothings/stb)                | .\vcpkg\vcpkg install stb:x64-windows
Graphical User Interface| [imgui](https://github.com/ocornut/imgui)             | .\vcpkg\vcpkg install imgui[core,glfw-binding,opengl3-binding,docking-experimental]:x64-windows

Now generate a project file or makefile for your platform. If you want to use a particular IDE, make sure it is installed; don't forget to set the Start-Up Project in Visual Studio or the Target in Xcode.

```bash
# UNIX Makefile
cmake ..

# Mac OSX
cmake -G "Xcode" ..

# Microsoft Windows
cmake -G "Visual Studio 16" ..
cmake -G "Visual Studio 16 Win64" ..
...
```
