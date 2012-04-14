## It's a sieve of Eratosthenes that calculates the totients, which
## are summed.

def euler(n)
  sum = 0
  phi = Array.new(n+1) {|x| x}
  phi[0], phi[1], phi[2] = 0, 1, 2
  2.upto(n) do |i|
    if phi[i] == i
      j = 2*i
      while j < (n+1)
        phi[j] *= i - 1
        phi[j] /= i
        j += i
      end
      phi[i] -= 1
    end
    sum += phi[i]
  end
  puts sum
end

euler(1000000)
