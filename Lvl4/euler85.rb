## In a PxQ grid, there are (P+1) horizontal lines and (Q+1)
## vertical. To make a rectangle we have to choose 2 vertical and 2
## horizontal. The rest is generating a lot of grids and picking the
## one that minimized the difference between the number of rectangles
## and 2000000.

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

def euler(n)
  min = n*1.5
  min_area = 0
  1.upto(100) do |p|
    1.upto(100) do |q|
      ntri = (p+1).choose(2) * (q+1).choose(2)
      if ntri > n * 0.99 && ntri < n * 1.01
        if (ntri-n).abs < min then min = ntri; min_area = p*q end
      end
    end
  end
  puts "#{min} #{min_area}"
end

euler(2000000)
