function euler29(n)
    sum::Int64 = (n-1)^2
    for i in 2:(n-1)
        j = i*i
        while j <= n
            sum = sum - floor(n*log10(i)/log10(j)) + 1
            j *= i
        end
    end
    dec(sum)
end