function(sign num)
    if(num EQUAL 0)
        message(zero)
    elseif(num GREATER 0)
        message(positive)
    else()
        message(negative)
    endif(num EQUAL 0)
endfunction(sign num)

sign(-1)    # negative
sign(0)     # zero
sign(1)     # positive
