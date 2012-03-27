# This is just a matter of finding the patterns in each diagonal.

function euler28()
    sum::Uint64 = 1
    for n in 1:500
        sum += (2n+1)^2
        sum += 2n*(2n+1) + 1
        sum += (2n)^2 + 1
        sum += 2n*(2n-1) + 1
    end
    println(dec(sum))
end