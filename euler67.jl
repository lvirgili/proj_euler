function get_matrix()
    f = open("/tmp/triangle.txt")
    a = Array(Int, 100, 100)
    for i in 1:100
        row = split(chomp(readline(f)), ' ', false)
        for j in 1:i
            a[i,j] = int(row[j])
        end
        for j in i+1:100
            a[i,j] = 0
        end
    end
    a
end

function euler67()
    m = get_matrix()
    i = 100
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