r = @spawn rand(2,2)

s = @spawn 1 + fetch(r)

println(fetch(s))