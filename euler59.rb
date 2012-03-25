# This one was more to learn more ruby than to solve the problem
# itself. To solve it, I brute forced the possible keys, found some
# possibilities and filtered it knowing that the text was a bible
# passage.

def read_file
  file = File.new("/tmp/cipher1.txt", "r")
  text = Array.new()
  line = file.gets
  line.chomp!()
  line.split(/,/).each {
    | num |
    text.push(Integer(num))
  }
  file.close
  return text
end

def largest_key(freq)
  freq.sort { | a , b | a[1] <=> b[1] }.last
end

def check_key(freq)
  max = largest_key(freq)
  if Integer(max.first).chr != ' '
    return false
  end
  freq.delete(max.first)
  max = largest_key(freq)
  if Integer(max.first).chr != 'e'
    return false
  end
  freq.delete(max.first)
  max = largest_key(freq)
  if Integer(max.first).chr != 'h'
    return false
  end
  freq.delete(max.first)
  max = largest_key(freq)
  if Integer(max.first).chr != 't'
    return false
  end
  freq.delete(max.first)

  return true
end

def decode(text, key)
  i = 0
  freq = Hash.new(0)
  text.each do
    | ch |
    new_ch = ch ^ (key[i])
    freq[new_ch] += 1
    i = (i + 1) % 3
  end
  return freq
end

def print_decoded(text, key)
  i = 0
  s = 0
  text.each do
    | ch |
    s += (ch ^ key[i])
    print (ch ^ key[i]).chr
    i = (i + 1) % 3
  end
  puts
  puts s
end

def possible_keys()
  text = read_file()
   97.upto(122) do | a |
    97.upto(122) do | b |
      97.upto(122) do | c |
        freq = decode(text, [a,b,c])
        if check_key(freq) == true
          puts "#{a} #{b} #{c}"
          print_decoded(text, [a,b,c])
        end
      end
    end
  end
end

def euler59()
  text = read_file()
  print_decoded(text, [99,111,100])
end
possible_keys()
