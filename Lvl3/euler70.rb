## Using the fact that if the composite number is the product of just
## two primes it is quite fast. To understand that, assume n = p1*p2
## and m = p1*p2*p3, r = n/phi(n) and r' = m/phi(m). r/r' = (p3-1)/p3,
## which is less than one.

def gen_primes(n)
  $p = Array.new()
  $p.insert(0,2,3)
  5.upto(n) do |i|
    flag = true
    2.upto(Math.sqrt(i).ceil) {|j| if i % j == 0 then flag = false; break end}
    if flag == true then $p.insert(-1,i) end
  end
  p
end

def tot(p1,p2)
  (p1-1) * (p2-1)
end

def is_perm(n,t)
  n.to_s.chars.sort == t.to_s.chars.sort
end

def euler(n)
  gen_primes(Math.sqrt(n).ceil * 1.2)
  min = 5.0
  $p.each do |p1|
    $p.each do |p2|
      x = p1 * p2
      if x <= n
        t = tot(p1,p2)
        if is_perm(x,t) && Float(x)/t < min then puts "#{x} #{t} #{Float(x)/t}"; min = Float(x)/t end
      end
    end
  end
end

euler(10000000)
