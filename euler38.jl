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

function euler38()
    digs = [1,2,3,4,5,6,7,8,9]
    for i in 1:100000
        j = 1
        a = []
        while true
            num = i * j
            global arr = to_array(num)
            a = vcat(a,arr)
            if length(a) >= 9
                break
            end
            j += 1
        end
        b = sort(a)
        flag = true
        if length(b) != 9
            flag = false
        else
            for k in 1:9
                if digs[k] != b[k]
                    flag = false
                    break
                end
            end
        end
        if flag == true
            println(to_num(a))
        end
    end
end