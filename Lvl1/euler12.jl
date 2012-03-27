function gen_triangle(n)
    s::Uint64 = n * (n+1) / 2

end

function num_divisors(n)
    num::Uint64 = 0
    for i in 1:sqrt(n)
        if n % i == 0
            num += 2
        end
    end
    num
end

function euler12(n)
    i::Uint64 = 1
    while true
        tri = gen_triangle(i)
        ndiv = num_divisors(tri)
        if ndiv >= n
            println(dec(i))
            println(dec(tri))
            println(dec(ndiv))
            break
        end
        i += 1
    end
end