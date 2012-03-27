# Cannot think in a better solution for this one.

function euler31()
    sum = 1
    for a in 0:1:200, b in 0:100, c in 0:40, d in 0:20, e in 0:10, f in 0:4, g in 0:2
        if +(a,2b,5c,10d,20e,50f,100g) == 200
            sum += 1
        end
    end
    sum
end