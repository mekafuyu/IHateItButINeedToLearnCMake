cmake_minimum_required(VERSION 3.22.1)

project(testsome)

add_executable(${PROJECT_NAME} main.cpp)
target_link_directories(${PROJECT_NAME} PRIVATE ${CMAKE_SOURCE_DIR}/cpp/buildwsl/)
target_link_libraries(${PROJECT_NAME} stupidymath)