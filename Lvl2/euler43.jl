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

function to_num(arr)
    num::Uint = 0
    j = 0
    for i in length(arr):-1:1
        num += uint64(arr[i]*pow(10,j))
        j += 1
    end
    num
end

function euler43()
    digs = [0,1,2,3,4,5,6,7,8,9]
    primes = [2,3,5,7,11,13,17]
    sum::Uint64 = 0
    for i in 1:factorial(length(digs))
        arr = nthperm(digs,i)
        k = 1
        flag = true
        for j in 2:8
            num = to_num(arr[j:j+2])
            if num % primes[k] != 0
                flag = false
                break
            end
            k += 1
        end
        if flag == true
            sum += to_num(arr)
        end
    end
    dec(sum)
end