#include <iostream>
#include <GLFW/glfw3.h>
#include "adder.hpp"
#include "windowTestConfigure.h"

int main()
{
    std::cout << stupidymath::add(2, 3) << std::endl;
    std::cout << WINDOWTEST_VERSION_MAJOR << "." << WINDOWTEST_VERSION_MINOR << std::endl;

    GLFWwindow* window;

    /* Initialize the library */
    if (!glfwInit())
        return -1;

    /* Create a windowed mode window and its OpenGL context */
    window = glfwCreateWindow(640, 480, "Hello World", NULL, NULL);
    if (!window)
    {
        glfwTerminate();
        return -1;
    }

    /* Make the window's context current */
    glfwMakeContextCurrent(window);

    /* Loop until the user closes the window */
    while (!glfwWindowShouldClose(window))
    {
        /* Render here */
        glClear(GL_COLOR_BUFFER_BIT);

        /* Swap front and back buffers */
        glfwSwapBuffers(window);

        /* Poll for and process events */
        glfwPollEvents();
    }

    glfwTerminate();

    return 0; 
}
