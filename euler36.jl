function euler36()
    sum = 0
    for i in 1:1000000
        b = bin(i)
        str = string(i)
        if b == reverse(b) && str == reverse(str)
            println(i)
            sum += i
        end
    end
    sum
end