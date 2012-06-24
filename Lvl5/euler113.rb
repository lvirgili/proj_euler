## http://math.stackexchange.com/questions/10839/combinatorial-counting
## Amazing!

class Integer
  def choose(k)
    return 0 if (k > self)
    n = self
    r = 1
    1.upto(k) do |d|
      r *= n
      r /= d
      n -= 1
    end
    return r
  end
end

puts 110.choose(10) + 109.choose(9) - 1002
