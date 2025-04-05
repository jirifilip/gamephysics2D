cmake_minimum_required(VERSION 3.30)
project(GamePhysics VERSION 0.1)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

find_package(glfw3)
find_package(glad)
find_package(glm)

include_directories(include)
include_directories(${glfw3_INCLUDE_DIR})
include_directories(${glad_INCLUDE_DIR})
include_directories(${glm_INCLUDE_DIR})

add_executable(GamePhysics src/main.cpp)

target_link_libraries(
    ${PROJECT_NAME}
    glfw
    glad::glad
    glm::glm
)