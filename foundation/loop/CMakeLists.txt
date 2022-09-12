set(values 3 1 4 1 5 9 2 6)

# traverse elements one by one
foreach(item ${values})
    message("item: ${item}")
endforeach(item ${values})

# traverse elements in a range
list(LENGTH values len)
math(EXPR max_index "${len}-1")
foreach(index RANGE ${max_index})
    list(GET values ${index} item)
    message("values[${index}] = ${item}")
endforeach(index RANGE ${max_index})

set(index 0)
while(index LESS ${len})
    list(GET values ${index} item)
    message("values[${index}] = ${item}")
    math(EXPR index "${index}+1")
endwhile(index LESS ${len})

foreach(index RANGE 3 7)                # [3, 4, 5, 6, 7]
    message("index: ${index}")
endforeach(index RANGE 3 7)

foreach(index RANGE 3 7 2)              # [3, 5, 7] 
    message("index: ${index}")    
endforeach(index RANGE 3 7 2)
