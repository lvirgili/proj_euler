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

function euler37()
    cont = 0
    sum = 0
    primes = gen_primes_up_to(1000000)
    for i in 10:length(primes)
        if primes[i] == true
            flag = true
            arr = to_array(i)
            for j in 1:length(arr)
                num = to_num(arr[j:length(arr)])
                if primes[num] == false
                    flag = false
                    break
                end
            end
            for j in length(arr):-1:1
                num = to_num(arr[1:j])
                if primes[num] == false
                    flag = false
                    break
                end
            end
            if flag == true
                println(i)
                sum += i
            end
        end
    end
    sum
end