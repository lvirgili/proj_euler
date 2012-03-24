function euler1()
    s = 0
    for i in 1:999
        if i % 3 == 0 || i % 5 == 0 && i % 15 != 0
            s += i
        end
    end
    println(s)
end

euler1()
