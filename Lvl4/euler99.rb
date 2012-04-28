def euler
  max = 0
  num = 0
  f = File.new("/tmp/base_exp.txt")
  cont = 1
  while line = f.gets
    line.chomp
    x,y = line.split(',')
    x = x.to_i
    y = y.to_i
    z = y * Math.log10(x)
    if z > max then max, num = z, cont end
    cont += 1
  end
  p num
  f.close
end

euler
