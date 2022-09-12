# define a list
set(values 3 1 4 1 5 9 2 6)

# retrieve length of the given list
list(LENGTH values length)
message("length: ${length}")            # length: 8

# retrieve element value using position index
set(index 0)
set(value 0)
while(index LESS ${length})
    list(GET values ${index} value)
    message("values[${index}] = ${value}")
    math(EXPR index "${index}+1")
endwhile(index LESS ${length})

# join all elements using given separator
list(JOIN values = result)
message("join result: ${result}")       # join result: 3=1=4=1=5=9=2=6

# extract elements from specified position index
list(SUBLIST values 3 3 substr)
message("sub-string: ${substr}")        # sub-string: 1;5;9

# find the given element in the list, and return its index. if not found, -1 will be returned
list(FIND values 1 index)
message("index: ${index}")              # index: 1

# filter

# APPEND
list(APPEND values 5 3 5 8)
message("values: ${values}")            # values: 3;1;4;1;5;9;2;6;5;3;5;8

# insert element in specified position
list(INSERT values 1 ".")
message("values: ${values}")            # values: 3;.;1;4;1;5;9;2;6;5;3;5;8

# remove element in specified position
list(REMOVE_AT values 1)
message("values: ${values}")            # values: 3;1;4;1;5;9;2;6;5;3;5;8

# remove element in the front
list(POP_FRONT values)
message("values: ${values}")            # values: 1;4;1;5;9;2;6;5;3;5;8

# insert element in the front
list(PREPEND values 3)
message("values: ${values}")            # values: 3;1;4;1;5;9;2;6;5;3;5;8

# remove element in the back
list(POP_BACK values)
message("values: ${values}")            # values: 3;1;4;1;5;9;2;6;5;3;5

# remove duplicated elements
list(REMOVE_DUPLICATES values)
message("values: ${values}")            # values: 3;1;4;5;9;2;6

# remove elements equal to the given value
list(REMOVE_ITEM values 3)
message("values: ${values}")            # values: 1;4;5;9;2;6

# sort all values
list(SORT values)
message("values: ${values}")            # values: 1;2;4;5;6;9

# reverse all values
list(REVERSE values)
message("values: ${values}")            # values: 9;6;5;4;2;1

# transform elements in list one by one
set(values a b c x y z)
message("values: ${values}")            # values: a;b;c;x;y;z

list(TRANSFORM values APPEND _)
message("values: ${values}")            # values: a_;b_;c_;x_;y_;z_

list(TRANSFORM values PREPEND _)
message("values: ${values}")            # values: _a_;_b_;_c_;_x_;_y_;_z_

list(TRANSFORM values TOUPPER)
message("values: ${values}")            # values: _A_;_B_;_C_;_X_;_Y_;_Z_

list(TRANSFORM values TOLOWER)
message("values: ${values}")            # values: _a_;_b_;_c_;_x_;_y_;_z_

list(TRANSFORM values REPLACE _ " ")
message("values: ${values}")            # values:  a ; b ; c ; x ; y ; z

list(TRANSFORM values STRIP)
message("values: ${values}")            # values: a;b;c;x;y;z
