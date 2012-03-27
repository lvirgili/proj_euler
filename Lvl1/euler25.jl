# Clearly calculating the number wouldn't be practical. So just use
# its approximate form and calculate the number of digits.

function euler25()
    phi = (1+sqrt(5))/2
    x = log10(phi)
    y = log10(sqrt(5))
    i = 1
    while true
        if int(ceil(i*x -y)) == 1000
            println(dec(i))
            break
        end
        i += 1
    end
end