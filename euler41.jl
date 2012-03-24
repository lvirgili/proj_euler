function to_num(arr)
    j = 0
    num = 0
    for i in length(arr):-1:1
        num += arr[i]*pow(10,j)
        j += 1
    end
    num
end

function euler41()
    digs = [1,2,3,4,5,6,7]
    max = 0
    for i in 1:factorial(length(digs))
        arr = nthperm(digs,i)
        num = to_num(arr)
        flag = true
        for j in 2:int(sqrt(num))
            if num % j == 0
                flag = false
                break
            end
        end
        if flag == true
            println(num)
            if max < num
                max = num
            end
        end
    end
    max
end