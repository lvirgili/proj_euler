# Just generate primes, take the ones that have repeated digits and
# substitute those. Count the resulting primes and be happy.

require 'set'

def gen_primes(n)
  p = Array.new(n+1, true)
  p[0] = false; p[1] = false
  2.upto(n) do | i |
    if p[i] == true
      k = i + i
      while k <= n
        p[k] = false
        k += i
      end
    end
  end
  p
end

def test_subs(p,pos_arr,primes)
  count = 0
  xs = Array.new()
  start = pos_arr.member?(0) ? 1 : 0
  start.upto(9) do | dig |
    x = p.to_s.scan(/\d/)
    pos_arr.each { | pos | x[pos] = dig }
    if primes[x.to_s.to_i] == true
      count += 1
      xs.insert(-1,x.to_s.to_i)
    end
  end
  if count == 8
    puts xs
    Process.exit
  end
end

def rep_digits(x,primes)
  s = x.to_s().scan(/\d/)
  for i in 0..(s.length()-2)
    aux = Set.new()
    for j in (i+1)..(s.length()-2)
      if s[i] == s[j]
        aux.add(i)
        aux.add(j)
        test_subs(x,aux.to_a(),primes)
      end
    end
  end
end

def euler51(n)
  p = gen_primes(n)
  56000.upto(n) do | num |
    if p[num] == true
      rep_digits(num,p)
    end
  end
end

euler51(1000000)
