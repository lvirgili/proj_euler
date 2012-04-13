def sum_digits(x)
  sum = 0
  x.to_s.each_char {|c| sum += c.to_i}
  sum
end

def euler(n)
  expansion = Array.new()
  expansion.insert(0, 2)
  k = 1
  1.upto(n-1) do |i|
    if i % 3 == 2
      expansion[i] = 2*k
      k += 1
    else
      expansion[i] = 1
    end
  end
  num = 1
  den = expansion[n-1]
  (n-2).downto(1) do |x|
    num = expansion[x]*den + num
    aux = den
    den = num
    num = aux
  end
  num = expansion[0]*den + num
  puts sum_digits(num)
end

euler(100)
