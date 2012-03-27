function mod_power(x,y,m)
    p::Uint64 = x
    for i in 2:y
        p = mod(p*x,m)
    end
    p
end

function euler97()
    x = mod_power(2,7830457,10000000000)
    x = (x * 28433) % 10000000000
    x += 1
    x
end