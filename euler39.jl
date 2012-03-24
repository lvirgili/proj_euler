# Just used the formula in wikipedia to generate the triples.

function euler39()
    count = zeros(Int,1000)
    s = Set()
    for m in 2:100, n in 1:m-1
        for k in 1:1000
            per = k*(2m*m + 2m*n)
            arr = [k*(m*m-n*n),2*k*m*n,k*(m*m+n*n)]
            sort!(arr)
            if per <= 1000 && has(s,arr) == false
                add(s,arr)
                count[per] += 1
            end
        end
    end
    max = 0
    p = 0
    for i in 1:length(count)
        if max < count[i]
            p = i
            max = count[i]
        end
    end
    println(strcat(p, " ", max))
end