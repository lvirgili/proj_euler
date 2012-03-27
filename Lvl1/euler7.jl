primes = [2,3]
function gen_primes_up_to(n)
    i = 5
    num_primes = 2
    while num_primes < n
        flag = true
        for j in 2:sqrt(i)
            if i % j == 0
                flag = false
                break
            end
        end
        if flag == true
            global primes = cat(1, primes, [i])
            num_primes += 1
        end
        i += 2
    end
end

function euler7(n)
    gen_primes_up_to(n)
    println(primes[n])
end