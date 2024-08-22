cmake_minimum_required(VERSION 3.22.1)

project(WINDOWTEST VERSION 1.0)

find_package(OpenGL REQUIRED)

configure_file(
  windowTestConfigure.h.in
  windowTestConfigure.h
)

add_executable(${PROJECT_NAME} main.cpp)

target_include_directories(
  ${PROJECT_NAME}
  PUBLIC ${PROJECT_BINARY_DIR}
)

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