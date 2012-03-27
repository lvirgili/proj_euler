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

function f(n,a,b)
    return (n*n + a*n + b)
end

function is_prime(x, primes)
    if x <= 0
        return false
    end
    if x <= 1000
        return primes[x]
    end
    for i in 1:sqrt(x)
        if primes[i] == true && x % i == 0
            return false
        end
    end
    true
end

function euler27()
    primes = gen_primes_up_to(1000)
    n_primes = 0
    gr_a = 0
    gr_b = 0
    for a in -1000:1000
        for b in 1:length(primes)
            if primes[b] == false
                continue
            end
            p = 0
            n = 0
            while true
                cur = f(n,a,b)
                if is_prime(cur,primes) == false
                    if p > n_primes
                        (n_primes,gr_a,gr_b) = (p,a,b)
                    end
                    break
                end
                p += 1
                n += 1
            end
        end
    end
    println(dec(gr_a*gr_b))
end