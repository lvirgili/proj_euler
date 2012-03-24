# Wikipedia, again, has the test for a pentagonal. Note that every
# hexagonal number is also a triangle one, so no need to check for
# it.

function is_pent(x)
    n = (sqrt(24*x + 1) + 1) / 6
    n == int(n)
end

function euler45()
    i::Uint64 = 1
    while true
        n = i*(2i-1)
        if is_pent(n) == true
            println(dec(n))
        end
        i += 1
    end
end
