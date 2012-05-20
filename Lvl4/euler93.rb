## I built hashes of value -> expression and combined them. Pretty fun
## problem.

def build_base_hashes(s)
  h1 = Hash.new()
  h2 = Hash.new()
  operators = ["+", "-", "*", "/"]
  s.each_index do |i|
    h1[eval s[i]] = Array.new
    h1[eval s[i]] << "(" + s[i] + ")"
    s.each_index do |j|
      if j < i
        operators.each do |op|
          str = "(" + s[i] + op + s[j] + ")"
          expr = eval str
          if expr == 0 then next end
          if expr < 0
            str = "(" + e2 + op + e1 + ")"
            expr *= -1
          end
          if op == "/" && (eval s[i] + "%" + s[j]) != 0 then next end
          h2[expr] = Array.new if h2[expr].nil? == true
          h2[expr] << str if h2[expr].include?(str) == false
        end
      end
    end
  end
  return h1,h2
end

def build_3_hash(h1, h2)
  h3 = Hash.new()
  operators = ["+", "-", "*", "/"]
  h1.each_pair do |k1,v1|
    v1.each do |e1|
      h2.each_pair do |k2, v2|
        v2.each do |e2|
          operators.each do |op|
            str = "(" + e1 + op + e2 + ")"
            if str[2] == str[6] || str[2] == str[8] then next end
            expr = eval str
            if expr == 0 then next end
            if expr < 0
              str = "(" + e2 + op + e1 + ")"
              expr *= -1
            end
            if op == "/" && k1 % k2 != 0 then next end
            h3[expr] = Array.new() if h3[expr].nil? == true
            h3[expr] << str if h3[expr].include?(str) == false
          end
        end
      end
    end
  end
  h3
end

def build_4_hash(h1, h2, h3)
  h4 = Hash.new()
  operators = ["+", "-", "*", "/"]
  #h1 op h3
  h1.each_pair do |k1,v1|
    v1.each do |e1|
      h3.each_pair do |k3,v3|
        v3.each do |e2|
          operators.each do |op|
            str = "(" + e1 + op + e2 + ")"
            next if str[2] == str[7] || str[2] == str[11] || str[2] == str[13]
            expr = eval str
            if expr == 0 then next end
            if expr < 0
              str = "(" + e2 + op + e1 + ")"
              expr *= -1
            end
            if op == "/" && k1 % k3 != 0 then next end
            h4[expr] = Array.new if h4[expr].nil? == true
            h4[expr] << str if h4[expr].include?(str) == false
          end
        end
      end
    end
  end
  #h2 op h2
  h2.each_pair do |k1,v1|
    v1.each do |e1|
      h2.each_pair do |k3,v3|
        v3.each do |e2|
          operators.each do |op|
            str = "(" + e1 + op + e2 + ")"
            next if str[2] == str[8] || str[2] == str[10]
            next if str[4] == str[8] || str[4] == str[10]
            expr = eval str
            if expr == 0 then next end
            if expr < 0
              str = "(" + e2 + op + e1 + ")"
              expr *= -1
            end
            if op == "/" && k1 % k3 != 0 then next end
            h4[expr] = Array.new if h4[expr].nil? == true
            h4[expr] << str if h4[expr].include?(str) == false
          end
        end
      end
    end
  end
  h4
end

def get_max(arr)
  aux = arr.delete_if {|x| x-1 != arr.index(x)}
  aux.last
end

def euler
  max = 0
  max_set = []
  # I just tried with these numbers and it worked.
  numbers = %w{1 2 3 4 5 6 7 8 9}
  numbers.permutation(4).to_a.each do |set|
    flag = true
    0.upto(2) {|i| if set[i+1] < set[i] then flag = false end}
    if flag == true
      h1,h2 = build_base_hashes(set)
      h3 = build_3_hash(h1,h2)
      h4 = build_4_hash(h1,h2,h3)
      arr = h4.keys.sort
      m = get_max(arr)
      if m > max then max = m; max_set = set end
    end
  end
  p "#{max_set.inspect} #{max}"
end

euler
