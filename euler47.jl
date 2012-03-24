## My first solution took some time (it was the stupid one). This one
## is based on Brian's python code in the forum.

function euler47()
    fac = zeros(Int,1000000)
    n = 0
    for i in 2:length(fac)
        if fac[i] == 0
            n = 0
            x = 2i
            while x < length(fac)
                fac[x] += 1
                x += i
            end
        elseif fac[i] == 4
            n += 1
            if n == 4
                println(i-3)
                break
            end
        else
            n = 0
        end
    end
end