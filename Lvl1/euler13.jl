function read(file)
    a = open(file)
    b = Array(Int,100,50)
    l = 1
    for i in LineIterator(a)
        str = reverse(chomp(i))
        for j in 1:50
            b[l,j] = parse_int(Int,str[j:j],10)
        end
        l += 1
    end
    b
end

function euler12()
    m = read("/tmp/file.txt")
    for i in 2:100, j in 1:50
        m[i,j] += m[i-1,j]
        if m[i,j] >= 10 && j < 50
            m[i,j+1] += div(m[i,j],10)
            m[i,j] = rem(m[i,j],10)
        end
    end
    j = 50
    c = 0
    while c < 10
        print(m[100,j])
        c += length(string(m[100,j]))
        j -= 1
    end
end