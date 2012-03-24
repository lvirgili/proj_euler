function euler26()
    max = 0
    d = 0
    for i in 2:1000
        j = 1
        if gcd(10,i) == 1
            while true
                if powermod(10,j,i) == 1
                    break
                end
                j += 1
            end
        end
        if j > max
            max = j
            d = i
        end
    end
    println(d)
end