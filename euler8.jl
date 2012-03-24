function gen_string(path)
    str = ""
    file = open(path)
    for line in LineIterator(file)
        str = strcat(str, chomp(line))
    end
    return str
end

function euler8()
    num = gen_string("/tmp/euler8.txt")
    cur = 0
    for i in 1:length(num)-5
        prod = 1
        for j in i:i+4
            prod *= parse_int(Int, num[j:j],10)
        end
        if prod > cur
            cur = prod
        end
    end
    println(cur)
end