function tot(n)
    t = 1
    for i in 2:floor(n/2)
        if n % i == 0
            t += i
        end
    end
    t
end

function euler21()
    sum::Uint64 = 0
    check = trues(10000)
    for i in 1:10000
        x = tot(i)
        y = tot(x)
        if i == y && i != x && check[i] == true && check[x] == true
            print(i);print(" ");println(x);
            sum += i; sum += x; check[i] = false; check[x] = false
        end
    end
    println(dec(sum))
end