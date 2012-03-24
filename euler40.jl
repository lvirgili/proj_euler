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

function euler40()
    l = 0
    i = 1
    targ = 1
    prod = 1
    while targ <= 1000000
        x = to_array(i)
        l += length(x)
        if l >= targ
            l -= length(x)
            for j in 1:length(x)
                l += 1
                if l == targ
                    println(x[j])
                    prod *= x[j]
                    targ *= 10
                end
            end
        end
        i += 1
    end
    prod
end