# The relevant math is here:
# http://en.wikipedia.org/wiki/Pell_number#Approximation_to_the_square_root_of_two

def ndigs(x)
  x.to_s().length
end

def gen_pell(n)
  pell = Array.new(n)
  pell[0] = 0; pell[1] = 1
  2.upto(n) do | n |
    pell[n] = 2*pell[n-1] + pell[n-2]
  end
  pell
end

def euler57(n)
  c = 0
  pell = gen_pell(n)
  2.upto(n) do | k |
    num = pell[k-1] + pell[k]
    den = pell[k]
    if ndigs(num) > ndigs(den)
      c += 1
    end
  end
  c
end

puts euler57(1000)
