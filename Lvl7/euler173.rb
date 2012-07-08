def euler(limit)
  cnt = 0
  empty_square_sides = Array.new(limit) {|i| i+1}
  empty_square_sides.delete_if {|e| (e+2)**2 - e**2 > limit}
  empty_square_sides.each do |empty_side|
    lam_side = empty_side + 2
    total = lam_side ** 2 - empty_side ** 2
    while total <= limit
      lam_side += 2
      total = lam_side ** 2 - empty_side ** 2
      cnt += 1
    end
  end
  puts cnt
end

euler(1000000)
