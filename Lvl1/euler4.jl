function euler4(n)
    max::Uint64 = 0
    for i in 10^(n-1):10^n, j in 10^(n-1):10^n
        if string(i*j) == reverse(string(i*j)) && max < i*j
            max = i*j
        end
    end
    return max
end

print(dec(euler4(3)))