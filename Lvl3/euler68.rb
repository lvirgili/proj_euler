def ind(x)
  min = 1000
  ind = 0
  x.each_index {|i| if x[i][0] < min then ind = i; min = x[i][0] end}
  ind
end

def euler(n)
  max = Array.new(n,0).to_s
  a = [1,2,3,4,5,6,7,8,9,10].to_a
  a.permutation(3).to_a.each do |b|
    sum = b.inject(0) {|s,i| s + i}
    c = [1,2,3,4,5,6,7,8,9,10] - b
    c.permutation(2).to_a.each do |d|
      e = d.insert(1,b[2])
      if sum != e.inject(0) {|s,i| s + i} then next end
      f = [1,2,3,4,5,6,7,8,9,10] - b - e
      f.permutation(2).to_a.each do |g|
        h = g.insert(1,e[2])
        if sum != h.inject(0) {|s,i| s + i} then next end
        i = [1,2,3,4,5,6,7,8,9,10] - b - e - h
        i.permutation(2).to_a.each do |j|
          k = j.insert(1,h[2])
          if sum != k.inject(0) {|s,i| s + i} then next end
          l = [1,2,3,4,5,6,7,8,9,10] - b - e - h - k
          l.insert(1,k[2])
          l.insert(2,b[1])
          if sum != l.inject(0) {|s,i| s + i} then next end
          m = [b,e,h,k,l]
          index = ind(m)
          n = [m[index], m[(index+1)%5], m[(index+2)%5], m[(index+3)%5], m[(index+4)%5]]
          if n.to_s > max && n.to_s.length == 16 then max = n.to_s; puts "#{n.to_s} #{n.to_s.length}" end
        end
      end
    end
  end
end

euler(10)
