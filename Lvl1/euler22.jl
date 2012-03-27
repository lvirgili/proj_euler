function euler22()
    f = open("/tmp/names.txt")
    list = []
    names = readall(f)
    list = split(names,",")
    list = sort(list)
    total::Uint64 = 0
    for i in 1:length(list)
        str = list[i]
        sum::Uint64 = 0
        for j in 1:length(str)
            if iswalpha(str[j])
                sum += int(str[j] - 'A' + 1)
            end
        end
        total += sum*i
    end
    println(dec(total))
end