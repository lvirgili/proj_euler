function gen_abundants(n)
    ab = ones(Int,1)
    ab[1] = 12
    for i in 13:n
        sum::Int = 0
        for j in 1:div(i,2)
            if i % j == 0
                sum += j
            end
        end
        if sum > i
            ab = hcat(ab,i)
        end
    end
    ab
end

function euler23()
    ab = gen_abundants(29000)
    nums = trues(29000)
    for i in 1:length(ab), j in 1:length(ab)
        x = ab[i] + ab[j]
        if x <= 29000
            nums[x] = false
        end
    end
    sum::Uint64 = 0
    for i in 1:29000
        if nums[i] == true
            sum += i
        end
    end
    print(dec(sum))
end