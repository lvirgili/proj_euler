function gen_triangles(n)
    a = falses(n*n)
    for i in 1:n
        a[i*(i+1)/2] = true
    end
    a
end

function euler42()
    f = open("/tmp/words.txt")
    list = []
    names = readall(f)
    list = split(names,",")
    total::Uint64 = 0
    tri = gen_triangles(10000)
    for i in 1:length(list)
        str = list[i]
        sum::Uint64 = 0
        for j in 1:length(str)
            if iswalpha(str[j])
                sum += int(str[j] - 'A' + 1)
            end
        end
        if tri[sum] == true
            println(strcat(str, " ", dec(sum)))
            total += 1
        end
    end
    println(dec(total))
end