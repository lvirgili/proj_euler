## It just prints all pairs and I checked for the largest (the first,
## coincidently).

def ndig(num)
  if num == 0 then return 1 end
  (Math.log10(num) + 1).floor
end

def gen_squares(max)
  $s = Hash.new
  1.upto(9) {|i| $s[i] = Array.new()}
  1.upto(max) {|i| if i*i <= max then $s[ndig(i*i)] << i*i else break end}
end

def is_word_pair(word1, word2, square)
  convert = Hash.new()
  sq_str = square.to_s.split(//)
  0.upto(word1.size-1) {|i| convert[word1[i]] = sq_str[i]}
  val = 0
  0.upto(word2.size-1) do |i|
    val *= 10
    val += convert[word2[i]].to_i
  end
  if $s[word1.size].include?(val)
    p "#{word1} #{word2} #{square} #{val}"
  end
end

def euler
  f = File.new("/tmp/words.txt")
  anagrams = Hash.new()
  while line = f.gets
    line.chomp!
    line.split(',').each do |x|
      x.delete!('\"')
      if anagrams.has_key?(x.chars.sort.join) == true
        anagrams[x.chars.sort.join] << x
      else
        anagrams[x.chars.sort.join] = Array.new()
        anagrams[x.chars.sort.join] << x
      end
    end
  end
  pair = Array.new()
  anagrams.each_key do |k|
    if anagrams[k].size > 1
      pair << anagrams[k]
    end
  end
  f.close
  gen_squares(999999999)
  pair.each do |words|
    digs = words.first.size
    un = words.first.chars.to_a.uniq.size
    $s[digs].each do |square|
      if square.to_s.split(//).uniq.size == un
        word1 = words.first
        for i in 1..(words.size-1)
          word2 = words[i]
          is_word_pair(word1, word2, square)
        end
      end
    end
  end
end

euler
