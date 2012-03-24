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
    arr = zeros(Int32,l)
    while num > 0
        dig = div(num,pow(10,l-1))
        arr[i] = dig
        num = num % pow(10,l-1)
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

function euler49()
    p = gen_primes_up_to(1000000)
    for i in 1000:9999
        if p[i] == true
            arr = to_array(i)
            diff = 0
            digs = sort(arr)
            for j in 2:factorial(length(arr))
                perm = nthperm(arr,j)
                x = to_num(perm)
                if x <= 9999 && p[x] == true && x > i
                    diff = x - i
                    if x+diff <= 9999 && p[x+diff] == true
                        flag = true
                        check = to_array(x+diff)
                        sort!(check)
                        for k in 1:length(check)
                            if check[k] != digs[k]
                                flag = false
                            end
                        end
                        if flag == true
                            printf("%d %d %d\n",x-diff,x,x+diff)
                            break
                        end
                    end
                end
            end
        end
    end
end