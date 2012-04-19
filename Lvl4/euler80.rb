## Used the algorithm here:
## http://en.wikipedia.org/wiki/Methods_of_computing_square_roots#Decimal_.28base_10.29

def euler(limit)
  sum = 0
  2.upto(limit) do |i|
    if Math.sqrt(i) == Math.sqrt(i).floor then next end
    c = i
    it = 0
    max = 100
    p = 0
    while it < max
      x = 0
      while x*(20*p+x) <= c
        x += 1
      end
      x -= 1
      y = x*(20*p+x)
      c -= y
      p = (10*p + x).floor
      c *= 100
      sum += x
      it += 1
    end
  end
  puts sum
end

euler(100)
