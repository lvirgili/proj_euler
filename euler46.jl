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

function gen_squares(n)
    s = falses(n)
    for i in 1:floor(sqrt(n))
        s[i*i] = true
    end
    s
end

function euler46()
    p = gen_primes_up_to(10000)
    s = gen_squares(100000)
    for i in 9:2:length(p)
        if p[i] == false
            flag = false
            for j in 1:i-1
                if p[j] == false
                    continue
                else
                    num = i - j
                    num /= 2
                    if s[num] == true
                        flag = true
                    end
                end
            end
            if flag == false
                println(i)
            end
        end
    end
end