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

function to_array(num)
    l = int(floor(log10(num)+1)); i = 1
    arr = Array(Int32,l)
    while num > 0
        dig = div(num,pow(10,l-1))
        arr[i] = dig
        num = rem(num,pow(10,l-1))
        l -= 1
        i += 1
    end
    arr
end

function to_num(arr)
    j = 0
    num = 0
    for i in length(arr):-1:1
        num += arr[i]*pow(10,j)
        j += 1
    end
    num
end

function next_rotation(arr)
    for i in 1:length(arr)-1
        t = arr[i]
        arr[i] = arr[i+1]
        arr[i+1] = t
    end
    arr
end

function euler35()
    cont = 0
    primes = gen_primes_up_to(1000000)
    for i in 2:1000000
        if primes[i] == true
            arr = to_array(i)
            flag = true
            for j in 1:length(arr)-1
                arr = next_rotation(arr)
                num = to_num(arr)
                if primes[num] == false
                    flag = false
                    break
                end
            end
            if flag == true
                cont += 1
            end
        end
    end
    cont
end