function gen_primes_up_to(n)
    primes = trues(convert(Int,n))
    primes[1] = false
    for i in 2:n
        if primes[i] == 1
            p = 2i
            while p <= n
                primes[p] = false
                p += i
            end
        end
    end
    primes
end

function euler3(n)
    plist = gen_primes_up_to(ceil(sqrt(n))+1)
    max = 0
    for i in 1:length(plist)
        if plist[i] == true && n % i == 0 && max < i
            max = i
        end
    end
    println(max)
end