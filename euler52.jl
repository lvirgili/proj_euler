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

function euler52(n)
    i = 1
    while true
        x = i
        arr = to_array(i)
        sort!(arr)
        flag = true
        for j in 2:n
            if flag == false
                break
            end
            y = x * j
            aux = to_array(y)
            sort!(aux)
            for k in 1:length(aux)
                if arr[k] != aux[k]
                    flag = false
                    break
                end
            end
        end
        if flag == true
            println(x)
            break
        end
    i += 1
    end
end