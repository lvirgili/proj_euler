function mod_power(x,y,m)
    p::Uint64 = x
    for i in 2:y
        p = mod(p*x,m)
    end
    p
end

function euler48()
    sum::Uint64 = 0
    m::Uint64 = 10000000000
    for i in 1:1000
        sum = sum + mod_power(i,i,m)
    end
    sum = mod(sum,m)
    dec(sum)
end