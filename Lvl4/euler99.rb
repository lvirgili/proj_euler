def euler
  f = File.new("/tmp/base_exp.txt")
  numbers = Array.new()
  cont = 1
  while line = f.gets
    line.chomp
    x,y = line.split(',')
    x = x.to_i
    y = y.to_i
    numbers << [cont, y * Math.log10(x)]
    cont += 1
  end
  numbers.sort! {|x,y| x[1] <=> y[1]}
  p numbers.last
  f.close
end

euler
