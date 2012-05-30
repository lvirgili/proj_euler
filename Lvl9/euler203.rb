## Used the binary representation of integers to generate squarefree
## numbers. Then just did the intersectio of those with the ones in
## the Pascal's triangle.

require 'prime'

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

$primes = Prime.each(1000).to_a

def gen_squarefree_number(num)
  s = 1
  num.to_s(2).reverse.each_char.with_index {|c,i| s *= $primes[i]**c.to_i}
  s
end

def euler(line)
  sq_free = [1]
  nums = []
  1.upto(10**5) {|i| sq_free << gen_squarefree_number(i)}
  2.upto(line-1) do |l|
    0.upto(line/2) do |n|
      nums << l.choose(n)
    end
  end
  p (nums & sq_free).inject(:+)
end

euler(51)
