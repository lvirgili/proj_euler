def euler
  turns = 15
  prob = 0.0
  (1...2**turns).each do |outcome|
    str = outcome.to_s(2).rjust(turns, "0").reverse
    if str.count("1") > str.count("0")
      this_prob = 1.0
      str.each_char.with_index do |disk,i|
        if disk == "1"
          this_prob *= (1.0 / (i+2))
        else
          this_prob *= (Float(i+1) / (i+2))
        end
      end
      prob += this_prob
    end
  end
  puts ((1 - prob) / prob).ceil
end

euler
