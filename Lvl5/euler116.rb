class Integer
  def fac
    (1..self).inject(:*)
  end
end

def euler(btiles)
  combs = 0
  (2..4).each do |tsize|
    1.upto((Float(btiles) / tsize).floor) do |i|
      black = i
      rest = (btiles - i * tsize)
      if rest == 0
        combs += 1
      else
        combs += (black + rest).fac / (rest.fac * black.fac)
      end
    end
  end
  combs
end

puts euler(50)
