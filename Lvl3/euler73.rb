## Slow. Took almost 1 minute.

require 'rational'

def euler(n)
  cnt = 0
  3.upto(n) do |x|
    ((x/3) + 1).upto((x/2)) {|y| if x.gcd(y) == 1 then cnt += 1 end}
  end
  puts cnt
end

euler(12000)
