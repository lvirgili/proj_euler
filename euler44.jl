function gen_pent(n)
    p = IntSet()
    for i in 1:n
        add(p,int(i*(3i-1)/2))
    end
    p
end

function euler44()
    p = gen_pent(10000)
    for i in p, j in p
        s = i + j
        d = abs(i-j)
        if has(p,s) == true && has(p,d) == true
            println(strcat(i," ",j))
        end
    end
end