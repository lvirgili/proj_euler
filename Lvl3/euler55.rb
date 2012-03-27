# Brute force runs in ~1s.

def is_pal(n)
  n == Integer(n.to_s().reverse(),10)
end

def reverse_and_add(n)
  c = 0
  10.upto(n) do | i |
    it = 0
    n = i
    flag = true
    while it <= 50
      n += Integer(n.to_s().reverse(),10)
      it += 1
      if is_pal(n) == true
        flag = false
        break
      end
    end
    if flag == true
      c += 1
    end
  end
  c
end

puts reverse_and_add(9999)
