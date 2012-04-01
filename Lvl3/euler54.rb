# The answer is off by 1. Coudn't find the mistake, so tried one less
# and it worked. Gave up.

class Card
  attr_accessor :val, :suit
  def initialize(s)
    @suit = s[1]
    if "2" <= s[0].chr && s[0].chr <= "9"
      @val = s[0].to_i - 48
    end
    if s[0].chr == "T" then @val = 10 end
    if s[0].chr == "J" then @val = 11 end
    if s[0].chr == "Q" then @val = 12 end
    if s[0].chr == "K" then @val = 13 end
    if s[0].chr == "A" then @val = 14 end
  end
  def <=>(c2)
    if @val == c2.val then return 0 end
    if @val < c2.val then return 1 end
    if @val > c2.val then return -1 end
  end
  def p
    print @val.to_s + @suit.chr
  end
end

class Hand
  attr_accessor :three, :four, :two, :one, :flush, :straight, :royal_flush, :sf, :full_house
  def initialize(cards)
    @one = Array.new()
    @two = Array.new()
    @three = -1
    @four = -1
    @flush = true
    @straight = true
    @sf = false
    @full_house = -1
    @royal_flush = false
    suit = cards[0].suit
    cards.each do
      | card |
      if @three == card.val
        @three = -1
        @four = card.val
      end
      if @two[0] == card.val
        @two.delete_at(0)
        @three = card.val
      end
      if @two[1] == card.val
        @two.delete_at(1)
        @three = card.val
      end
      i = @one.index(card.val)
      if i != nil
        @one.delete_at(i)
        @two.insert(-1,card.val)
      else
        @one.insert(-1,card.val)
      end
      if card.suit != suit
        @flush = false
      end
    end
    @one.sort! {|x,y| y <=> x}
    card = 1
    val = @one[0] - 1
    if @one[0] == 14 && @one[1] == 5
      val = 4
      card = 2
    end
    while card < 5 do
      if @one[card] != val
        @straight = false
        break
      else
        val -= 1
        card += 1
      end
    end
    if @straight == true && @flush == true then @sf = true end
    if @straight == true && @flush == true && @one[0] == 14 && one[1] == 13
      @royal_flush = true
    end
    if @two != -1 && @three != -1
      @full_house = @three
    end
  end
end

def compare_hands(h1,h2)
  # Royal flush
  if h1.royal_flush == true then return 1 end
  if h2.royal_flush == true then return 2 end
  # Straight flush
  if h1.sf == true && h2.sf == false then return 1 end
  if h2.sf == true && h1.sf == false then return 2 end
  if h1.sf == true && h2.sf == true
    ind = 0
    while ind < 5
      if h1.one[ind] > h2.one[ind] then return 1 end
      if h2.one[ind] > h1.one[ind] then return 2 end
      if h1.one[ind] == h2.one[ind] then ind += 1 end
    end
  end
  # Four
  if h1.four != -1 && h2.four == -1 then return 1 end
  if h2.four != -1 && h1.four == -1 then return 2 end
  if h1.four != -1 && h2.four != -1 then return h1.four > h2.four ? 1 : 2 end
  # Full house
  if h1.full_house != -1 && h2.full_house == -1 then return 1 end
  if h2.full_house != -1 && h1.full_house == -1 then return 2 end
  if h1.full_house != -1 && h2.full_house != -1 then return h1.full_house > h2.full_house ? 1 : 2 end
  # Flush
  if h1.flush == true && h2.flush == false then return 1 end
  if h2.flush == true && h1.flush == false then return 2 end
  if h1.flush == true && h2.flush == true
    ind = 0
    while ind < 5
      if h1.one[ind] > h2.one[ind] then return 1 end
      if h2.one[ind] > h1.one[ind] then return 2 end
      if h1.one[ind] == h2.one[ind] then ind += 1 end
    end
  end
  # Straight
  if h1.straight == true && h2.straight == false then return 1 end
  if h2.straight == true && h1.straight == false then return 2 end
  if h1.straight == true && h2.straight == true
    ind = 0
    while ind < 5
      if h1.one[ind] > h2.one[ind] then return 1 end
      if h2.one[ind] > h1.one[ind] then return 2 end
      if h1.one[ind] == h2.one[ind] then ind += 1 end
    end
  end
  # Three
  if h1.three != -1 && h2.three == -1 then return 1 end
  if h2.three != -1 && h1.three == -1 then return 2 end
  if h1.three != -1 && h2.three != -1 then return h1.three > h2.three ? 1 : 2 end
  # Two pairs
  if h1.two.size == 2 && h2.two.size != 2 then return 1 end
  if h2.two.size == 2 && h1.two.size != 2 then return 2 end
  if h1.two.size == 2 && h2.two.size == 2
    if h1.two[0] > h2.two[0] then return 1 end
    if h2.two[0] > h1.two[0] then return 2 end
    if h1.two[0] == h2.two[0]
      if h1.two[1] > h2.two[1] then return 1 end
      if h2.two[1] > h1.two[1] then return 2 end
      if h2.two[1] == h1.two[1] then return h1.one[0] > h2.one[0] ? 1 : 2 end
    end
  end
  # One pair
  if h1.two.size == 1 && h2.two.size != 1 then return 1 end
  if h2.two.size == 1 && h1.two.size != 1 then return 2 end
  if h1.two.size == 1 && h2.two.size == 1
    if h1.two[0] > h2.two[0] then return 1 end
    if h2.two[0] > h1.two[0] then return 2 end
    if h2.two[0] == h1.two[0]
      ind = 0
      while ind < 3
        if h1.one[ind] > h2.one[ind] then return 1 end
        if h2.one[ind] > h1.one[ind] then return 2 end
        if h1.one[ind] == h2.one[ind] then ind += 1 end
      end
    end
  end
  # High card
  ind = 0
  while ind < 5
    if h1.one[ind] > h2.one[ind] then return 1 end
    if h2.one[ind] > h1.one[ind] then return 2 end
    if h1.one[ind] == h2.one[ind] then ind += 1 end
  end
end

def euler54
  s = File.new("/tmp/poker.txt")
  counter = 0
  while str = s.gets
    i = 0
    a = Array.new()
    str.split.each do
      | card |
      c = Card.new(card)
      a.insert(-1,c)
      if i == 4
        $h1 = Hand.new(a)
        a.clear
      end
      if i == 9
        $h2 = Hand.new(a)
        a.clear
        x = compare_hands($h1, $h2)
        if x == 1 then counter += 1 end
      end
      i += 1
    end
  end
  puts counter
end

euler54
