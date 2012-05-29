## This one was just disgusting.  Using the reasoning of problem 108,
## I guessed the number of primes and used this set of primes as
## having a variable power, while the rest had multiplicity 1; then I
## generated in a very ugly C++ program the possibilities and used
## this one to find the smaller number.  Did not like this one, didn't
## learn anything new excepting improving my guessing skills...

def euler
  n = []
  primes = [2,3,5,7,11]
  last = 13 * 17 * 19 * 23 * 29 * 31 * 37
  f = File.new("sets.txt", "r")
  f.each do |line|
    line.chomp!
    number = 1
    line.split(' ').each.with_index do |p, i|
      number *= primes[i]**Integer(p)
    end
    number *= last
    n << number
  end
  p n.min
  f.close
end
euler
