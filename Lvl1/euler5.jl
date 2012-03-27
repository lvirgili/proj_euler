function euler5(x)
    cur::Uint64 = 1
    for i in 2:x
        cur = lcm(cur, i)
    end
    cur
end

println(dec(euler5(20)))
