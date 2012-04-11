def digits(x)
  (Math.log10(x)+1).floor
end

def euler63
  sum = 0
  1.upto(25) do |n| # I guessed the limit
    x = 1
    while true
      if digits(x**n) == n then sum += 1 end
      if digits(x**n) > n then break end
      x += 1
    end
    n += 1
  end
  puts sum
end

euler63
