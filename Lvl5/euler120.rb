require 'set'
def find_max(a)
  vals = Set.new()
  n = 0
  max = 0
  while true
    num = (2 * a * n) % (a*a)
    if num > max then max = num end
    if vals.include?(num) then break end
    vals.add(num)
    n += 1
  end
  max
end

p 3.upto(1000).to_a.inject(0) {|s,a| s += find_max(a)}
