cmake_minimum_required(VERSION 3.22.1)

project(window_test)

add_executable(${PROJECT_NAME} main.cpp)

find_package(OpenGL REQUIRED)
add_subdirectory(Adder)

include(FetchContent)
FetchContent_Declare(
  glfw
  GIT_REPOSITORY https://github.com/glfw/glfw.git
)
FetchContent_MakeAvailable(glfw)

target_include_directories(${PROJECT_NAME}
    PUBLIC Adder
)

target_link_directories(${PROJECT_NAME}
    PRIVATE Adder
)

target_link_libraries(${PROJECT_NAME} adder OpenGL::GL glfw)