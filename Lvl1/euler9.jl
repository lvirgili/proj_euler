function is_trip(a,b,c)
    return a^2 == b^2 + c^2
end

function euler9(p)
    for i = 1:p
        j = 999
        while j > 0
            k = p - i - j
            if is_trip(i, j, k) == true
                println(prod([i j k]))
                return
            end
            j -= 1
        end
    end
end