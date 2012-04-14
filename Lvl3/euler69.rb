## The trick is not to calculate the totients. Just notice that:
## n <= 10 -> 6
## n <= 100 -> 30 = 6*5
## n <= 1000 -> 210 = 7*6*5
## and so on.

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

def euler(n)
  gen_primes(Math.sqrt(n).ceil)
  i = 1
  ans = 2
  while ans*$p[i] <= n
    ans *= $p[i]
    i += 1
  end
  puts ans
end

euler(1000000)
