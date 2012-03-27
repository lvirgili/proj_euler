function sumdigitston(x,n)
    str = string(x)
    sum = 0
    for i in 1:length(str)
        sum += parse_int(Int,str[i:i],10)^n
    end
    sum
end

function euler30(n)
    sum::Uint64 = 0
    for i in 10:10^(n+1)
        if sumdigitston(i,n) == i
            println(i)
            sum += i
        end
    end
    dec(sum)
end