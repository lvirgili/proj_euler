def sum_digits(x)
  s = x.to_s
  sum = 0
  s.each_char { | c | sum += c.to_i }
  sum
end

def euler56(n)
  max = 0
  1.upto(n) do | a |
    1.upto(n) do | b |
      if sum_digits(a ** b) > max then max = sum_digits(a ** b) end
    end
  end
  puts max
end

euler56(100)
