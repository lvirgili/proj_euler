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

function euler10(n)
    primes = gen_primes_up_to(n)
    sum::Uint64 = 0
    for i in 1:n
        if primes[i] == true
            sum += i
        end
    end
    println(dec(sum))
end