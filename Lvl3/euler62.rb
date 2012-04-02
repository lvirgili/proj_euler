# Adjusting the min variable and the limit to generate the cubes the
# program generates lots of numbers with the property.

def gen_cubes(limit)
  x = 1
  h = Hash.new()
  while x <= limit
    num = x**3
    arr = num.to_s.split(//)
    arr.sort!
    h[x] = arr
    x += 1
  end
  h
end

def euler62(n)
  cubes = gen_cubes(100000)
  rev_cubes = Hash.new()
  cubes.each do
    |key, value|
    if rev_cubes.has_key?(value) == false then rev_cubes[value] = Array.new() end
    rev_cubes[value].insert(-1,key)
    rev_cubes[value].sort!
  end
  min = 99999999999999
  rev_cubes.each {|x, array| if array.size == n && array[0]**3 < min then min = array[0]**3; puts array[0]**3 end}
end

euler62(5)
