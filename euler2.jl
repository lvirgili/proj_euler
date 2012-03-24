# Generating the fibonacci sequence using the usual recursion is one
# of the slowest things ever. Therefore, I used the matrix form
# representation that can be found here:
# http://en.wikipedia.org/wiki/Fibonacci_number#Matrix_form As the
# matrix is symmetric I used an array to store it. The rest is
# straightforward.

function fib(n)
    F = Array(Uint64, 3)
    F = [1, 1, 0]
    G = Array(Uint64, 3)
    G = [1, 1, 0]
    for i in 2:n
        G = [G[1]*F[1] + G[2]*F[2], G[1]*F[2] + G[2]*F[3], G[2]*F[2] + G[3]*F[3]]
    end
    return G[1]
end

function euler2(n)
    x = fib(1)
    sum::Uint64 = 0
    i = 0
    while x < n
        if x % 2 == 0
            sum += x
        end
        i += 1
        x = fib(i)
    end
    sum
end
