def check(cube1, cube2)
  numbers = []
  squares = Array.new(9) {|i| (i+1)*(i+1)}
  cube1.each do |c1|
    cube2.each do |c2|
      str1 = c1 + c2
      str2 = c2 + c1
      numbers << str1.to_i
      numbers << str2.to_i
    end
  end
  if squares - numbers == [] then true else false end
end

def euler
  sum = 0
  digits = Array.new(10) {|i| i.to_s}
  digits.combination(6).to_a.each do |cube1|
    digits.combination(6).to_a.each do |cube2|
      cube1 << "6" if cube1.include?("9") && cube1.include?("6") == false
      cube1 << "9" if cube1.include?("6") && cube1.include?("9") == false
      cube2 << "6" if cube2.include?("9") && cube2.include?("6") == false
      cube2 << "9" if cube2.include?("6") && cube2.include?("9") == false
      if check(cube1, cube2) == true
        sum += 1
      end
    end
  end
  p sum/2 #As we count each twice
end

euler
