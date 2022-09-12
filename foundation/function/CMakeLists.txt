function(hello name)
    message("hello, ${name}")
endfunction(hello name)

hello(world)

function(foo)
    message("argc: ${ARGC}")        # argument count
    message("argv: ${ARGV}")        # argument vector
    message("argv2: ${ARGV2}")      # third argument
    list(GET ARGV 2 item)
    message("argv[2] = ${item}")    # retrieve third argument by index
endfunction(foo)

foo(3 1 4 1 5 9 2 6)

function(sort)
    set(values ${ARGV})
    set(index 0)
    math(EXPR max_index "${ARGC}-1")
    while(index LESS ${max_index})
        math(EXPR current_index "${index}+1")
        set(min_index ${current_index})
        set(min_value 0)
        list(GET values ${min_index} min_value)
        while(${current_index} LESS ${ARGC})
            set(current_value 0)
            list(GET values ${current_index} current_value)
            if (${current_value} LESS ${min_value})
                set(min_index ${current_index})
                set(min_value ${current_value})
            endif()
            math(EXPR current_index "${current_index}+1")
        endwhile(${current_index} LESS ${ARGC})

        list(GET values ${index} value)
        if (${value} GREATER ${min_value})
            list(REMOVE_AT values ${index})
            list(INSERT values ${index} ${min_value})
            list(REMOVE_AT values ${min_index})
            list(INSERT values ${min_index} ${value})
        endif (${value} GREATER ${min_value})

        math(EXPR index "${index}+1")
    endwhile(index LESS ${max_index})

    message("result: ${values}")
endfunction(sort)

set(nums 3 1 4 1 5 9 2 6)
sort(${nums})
list(SORT nums)
message("result: ${nums}")
