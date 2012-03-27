primes = [2,3]
function gen_primes_up_to(n)
    for i in 5:n
        flag = true
        for j in 2:sqrt(i)
            if i % j == 0
                flag = false
                break
            end
        end
        if flag == true
            global primes = cat(1, primes, [i])
        end
    end
end

function euler3(n)
    gen_primes_up_to(sqrt(n))
    max = 0
    for i in 1:length(primes)
        if n % primes[i] == 0 && max < primes[i]
            max = primes[i]
        end
    end
    max
end
