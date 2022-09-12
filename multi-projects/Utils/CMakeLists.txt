cmake_minimum_required(VERSION 3.8)

# define project and set attributes
project(Utils LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 11)
set(USE_FOLDERS ON)

# implement common steps by including external cmake files
include("${PROJECT_SOURCE_DIR}/../GroupFiles.cmake")
include("${PROJECT_SOURCE_DIR}/../IncludeDirectories.cmake")

# set output directory
set(output_dir "${PROJECT_BINARY_DIR}/../..")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${output_dir})
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${output_dir})

# define macros
add_definitions(-D UTILS_EXPORTS)

# define target object
file(GLOB_RECURSE h_files *.h)
file(GLOB_RECURSE cpp_files *.cpp)
add_library(${PROJECT_NAME} SHARED ${cpp_files} ${h_files})
