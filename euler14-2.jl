# This version uses "dynamic programmng" and is, therefore, faster.

function len_collatz(n)
    len = zeros(Int, n)
    len[1] = 1
    for i = 2:n
        s = 0
        x = i
        while x >= 1
            if x <= n
                if len[x] == 0
                    x = x%2 == 0 ? x/2 : 3x+1
                    s += 1
                else
                    len[i] = len[x] + s
                    break
                end
            else
                x = x%2 == 0 ? x/2 : 3x+1
                s += 1
            end
        end
    end
    len
end

function euler14(n)
    len = len_collatz(n)
    x = 0; max = 0
    for i in 1:n
        if len[i] > max
            max = len[i]; x = i
        end
    end
    println(strcat(string(x), " "))
end