## It is the translation of problem 76 code. It takes 2 minutes. I
## suppose it could be improved if I knew more ruby.

def gen_pent(l)
  pent = Array.new()
  pent.insert(-1, 0)
  j, pent1, pent2 = 1, 0, 0
  while pent1 <= l || pent2 <= l
    pent1 = (3*j*j - j) / 2
    pent2 = (3*j*j + j) / 2
    pent.insert(-1, pent1, pent2)
    j += 1
  end
  pent
end

def gen_p(l)
  pent = gen_pent(l)
  p = Array.new(l+1, 0)
  p[0] = 1
  0.upto(l) do |i|
    j, signal = 1, 1
    while (i+pent[j] <= l) || (i + pent[j+1] <= l)
      if i+pent[j] <= l then p[i+pent[j]] += p[i] * signal end
      if i+pent[j+1] <= l then p[i+pent[j+1]] += p[i] * signal end
      j += 2
      signal *= -1
    end
  end
  p
end

def euler(l)
  p = gen_p(l)
  puts p.index { |x| x%1000000 == 0 }
end

euler(100000)
