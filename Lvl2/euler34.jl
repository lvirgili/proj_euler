function euler34()
    answer::Uint64 = 0
    for i in 3:100000
        num = i
        l = floor(log10(i)+1)
        sum::Int64 = 0
        while num > 0
            dig = div(num,pow(10,l-1))
            sum += factorial(int(dig))
            num = rem(num,pow(10,l-1))
            l -= 1
        end
        if sum == i
            answer += i
        end
    end
    dec(answer)
end