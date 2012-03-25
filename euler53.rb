# This method was found here: http://snippets.dzone.com/tag/binomial

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

def euler53(n,max)
  cont = 0
  1.upto(n) {
    | i |
    limit = i/2 - 1
    1.upto(limit) {
      | j |
      if i.choose(j) > max
        cont += 2
        if j == limit
          cont = cont + 2 - (i % 2 != 0 ? 1 : 0)
        end
      end
    }
  }
  cont
end

puts euler53(100,1000000)
