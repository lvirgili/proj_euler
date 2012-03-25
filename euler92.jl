# Happy numbers! They are only ~15% of the numbers =(

function sum_digits_squared(x)
    sum::Int = 0
    while x != 0
        sum += (x % 10)^2
        x = div(x,10)
    end
    sum
end

function gen_chains(n)
    chains = fill(-1,2n)
    chains[1] = 0
    chains[89] = 1
    for i in 1:n
        x = i
        chain_so_far = IntSet()
        while chains[x] == -1
            add(chain_so_far,x)
            x = sum_digits_squared(x)
        end
        for e in chain_so_far
            chains[e] = chains[x]
        end
    end
    chains
end

function euler92(n)
    c = gen_chains(100)
    sum = 0
    for i in 1:n
        x = i
        while x > 100
            x = sum_digits_squared(x)
        end
        if c[x] == 1
            sum += 1
        end
    end
    sum
end