def euler(n)
  a, b, r, s = 3, 7, 0, 1
  n.downto(2) do |q|
    p = (a*q - 1) / b
    if p*s > r*q then s, r = q, p end
  end
  puts "#{r} // #{s}"
end

euler(1000000)
