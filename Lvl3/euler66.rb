def euler(n)
  max = 0
  d_max = 0
  2.upto(n) do |i|
    if Math.sqrt(i).floor != Math.sqrt(i)
      exp = Array.new()
      n = Math.sqrt(i)
      a = n.floor
      exp.insert(-1, a)
      m = 0
      d = 1
      limit = 2*a
      while true
        m = d * a - m
        d = (i - m*m) / d
        a = ((Math.sqrt(i) + m) / d).floor
        exp.insert(-1,a)
        num = 1
        den = exp.last
        (exp.length - 2).downto(1) do |x|
          num = exp[x]*den + num
          aux = den
          den = num
          num = aux
        end
        num = exp[0]*den + num
        if (num*num - i*den*den) == 1
          if max < num
            max = num
            d_max = i
          end
          break
        end
      end
    end
  end
  puts d_max
end

euler(1000)
