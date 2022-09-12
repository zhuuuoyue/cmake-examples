cmake_minimum_required(VERSION 3.8)

# group file using filter
function(group_file full_path)
    get_filename_component(dir ${full_path} DIRECTORY)
    string(LENGTH ${dir} len)
    string(LENGTH ${PROJECT_SOURCE_DIR} src_dir_len)
    set(filter "")
    if(NOT ${len} EQUAL ${src_dir_len})
        string(LENGTH ${PROJECT_SOURCE_DIR} offset)
        math(EXPR offset "${offset}+1")
        math(EXPR len "${len}-${offset}")
        string(SUBSTRING ${dir} ${offset} ${len} filter)
    endif(${len} EQUAL ${src_dir_len})
    source_group("${filter}" FILES ${full_path})
endfunction(group_file full_path)

# define project and set attributes
project(App LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 11)
set(USE_FOLDERS ON)

# include folds containing header files and group header files
file(GLOB_RECURSE h_files *.h)
set(include_folds ${PROJECT_SOURCE_DIR})
foreach(h_file ${h_files})
    get_filename_component(dir ${h_file} DIRECTORY)
    list(APPEND include_folds ${dir})
    group_file(${h_file})
endforeach(h_file ${h_files})
list(REMOVE_DUPLICATES include_folds)
include_directories(${include_folds})

# group source files
file(GLOB_RECURSE cpp_files *.cpp)
foreach(cpp_file ${cpp_files})
    group_file(${cpp_file})
endforeach(cpp_file ${cpp_files})

# set output directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/..")

# define target object
add_executable(${PROJECT_NAME} ${cpp_files} ${h_files})
# set current project as startup project
set_property(DIRECTORY PROPERTY VS_STARTUP_PROJECT ${PROJECT_NAME})