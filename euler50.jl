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

function euler50(n)
    primes = gen_primes_up_to(n)
    m = 0; p = 0
    for i in 2:n-1
        if primes[i] == true
            sum = i; fat = 1
            for j in i+1:n
                if primes[j] == true
                    sum += j; fat += 1
                    if sum > n break end
                    if primes[sum] == true
                        if fat > m
                            m = fat; p = sum
                        end
                    end
                end
            end
        end
    end
    printf("%d %d\n", p, m)
end