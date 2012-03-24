function euler19()
    s::Int = 1
    total = 0
    for i in 1900:2000
        for j in 1:12
            if s == 0 && i > 1900
                total += 1
            end
            if j == 1 || j == 3 || j == 5 || j == 7 || j == 8 || j == 10 || j == 12
                s += 3
                s = rem(s,7)
                continue
            end
            if j == 4 || j == 6 || j == 9 || j == 11
                s += 2
                s = rem(s,7)
                continue
            end
            if j == 2 && i % 4 == 0 && i != 1900
                println(i)
                s += 1
                s = rem(s,7)
                continue
            end
        end
    end
    println(dec(total))
end