function euler6(n)
    sum_of_squares = sum([ x^2 | x = 1:n])
    println(dec(sum_of_squares))
    square_of_sum = sum(1:n)^2
    println(dec(square_of_sum))
    println(dec(square_of_sum - sum_of_squares))
end