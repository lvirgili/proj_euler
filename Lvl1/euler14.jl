function collatz_length(n)
    s = 1
    while n != 1
        if n % 2 == 0
            n /= 2
        else
            n = 3n + 1
        end
        s += 1
    end
    s
end


function euler14(n)
    max = -1
    x = -1
    for i=1:n
        cur = collatz_length(i)
        if cur > max
            max = cur
            x = i
        end
    end
    print(x)
    print(" ")
    println(max)
end
