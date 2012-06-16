def sum_of_digits(num)
  return 0 if num < 10
  num.to_s.each_char.to_a.inject(0) {|s, x| s += Integer(x)}
end

def euler
  powers = Hash.new([])
  2.upto(100) do |base|
    powers[base] = Array.new
    1.upto(20) do |power|
      powers[base] << base ** power
    end
  end
  seq = []
  powers.each_key do |key|
    powers[key].each do |p|
      sum = sum_of_digits(p)
      if powers[sum].include?(p)
        seq << p
      end
    end
  end
  puts seq.uniq.sort[29]
end

euler
