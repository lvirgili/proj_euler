# Guess it is time to implement a decent primalty test...

def is_prime(x)
  2.upto(Math.sqrt(x).ceil) { | num | if x % num == 0 then return false end }
  true
end

def euler58(prop)
  n = 1
  total = 1
  p = 0
  while true
    ur = (2*n - 1)*2*n + 1
    if is_prime(ur) == true then p += 1 end
    ul = (2*n)**2 + 1
    if is_prime(ul) == true then p += 1 end
    dl = (2*n + 1)*2*n + 1
    if is_prime(dl) == true then p += 1 end
    total += 4
    if Float(p)/total < prop then return (2*n + 1) end
    n += 1
  end
end

puts euler58(0.10)
