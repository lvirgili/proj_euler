require 'prime'

Prime.each.with_index do |p, i|
  index = i+1
  if index.odd? == true && 2 * index * p > 10**10
    puts index
    break
  end
end
