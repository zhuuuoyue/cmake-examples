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

file(GLOB_RECURSE srcs *.h *.hpp *.hxx *.cpp *.cxx *.c)
foreach(filename ${srcs})
    group_file(${filename})
endforeach(filename ${srcs})

