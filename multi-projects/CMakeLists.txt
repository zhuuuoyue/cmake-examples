cmake_minimum_required(VERSION 3.8)

project(MProjects LANGUAGES CXX)
add_subdirectory(Utils)
add_subdirectory(App)

add_dependencies(App Utils)

# set current project as startup project
set_property(DIRECTORY PROPERTY VS_STARTUP_PROJECT App)
