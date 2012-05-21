def euler
  sum = 0
  f = File.new("/tmp/roman.txt")
  while line = f.gets
    line.chomp
    a = line.size
    line.gsub!("DCCCC", "CM")
    line.gsub!("LXXXX", "XC")
    line.gsub!("VIIII", "IX")
    line.gsub!("XXXX", "XL")
    line.gsub!("CCCC", "CD")
    line.gsub!("IIII", "IV")
    b = line.size
    sum += a - b
  end
  f.close
  p sum
end

euler()
