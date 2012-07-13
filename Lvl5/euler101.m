## Too boring to do by hand. =P
## Never had used Octave. Pretty cool and similar do Matlab.

function ret = u(n)
  ret = 1;
  for i = 1:10
    ret = ret + ((-1)**i) * n**i;
  endfor
endfunction

x = 1:11;
y = arrayfun(@u, x);

sum = 0;
for deg = 1:10
    p = polyfit(x(1:deg), y(1:deg), deg-1);
    p = arrayfun(@round, p);
    val = uint64(polyval(p, deg+1));
    sum = sum + val;
    p;
endfor
sum
