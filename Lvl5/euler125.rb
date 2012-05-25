## Not the fastest ever, but it gets the job done in 40s. Fun to
## notice that there are sums that are reachable in more than one way.

def is_pal?(x)
  x.to_s == x.to_s.reverse
end

def euler(l)
  sq = Array.new(Math.sqrt(l)-1) {|x| (x+1)*(x+1)}
  sums = []
  sq.each.with_index do |n, i|
    sum = n
    ((i+1)...sq.length).each  do |j|
      sum += sq[j]
      if sum >= l then next end
      sums << sum
    end
  end
  p sums.uniq.keep_if {|x| is_pal?(x)}.inject(:+)
end

euler(10**8)
