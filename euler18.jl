function euler18()
    m = dlmread("/tmp/euler.txt", ' ', Int)
    i = 15
    while i > 1
        j = i
        while j > 1
            x = m[i,j]; y = m[i,j-1]
            m[i-1,j-1] += max(x,y)
            j -= 1
        end
        i -= 1
    end
    println(m[1,1])
end