// Used the method here:
// http://en.wikipedia.org/wiki/Methods_of_computing_square_roots#Continued_fraction_expansion
// to calculate the expansion and found here:
// http://www.math.princeton.edu/mathlab/jr02fall/Periodicity/mariusjp.pdf
// that the limit for the expansion is 2*(a_0).

#include <iostream>
#include <cmath>
using namespace std;

int main() {
     unsigned sum = 0;
     unsigned max = 10000;
     for (unsigned i = 2; i <= max; ++i) {
          if (floor(sqrt(i)) != sqrt(i)) {
               double n = sqrt(i);
               unsigned a = floor(n);
               int m = 0;
               int d = 1;
               unsigned limit = 2 * a;
               unsigned c = 0;
               while (a != limit) {
                    ++c;
                    m = d * a - m;
                    d = (i - m*m) / d;
                    a = floor((sqrt(i)+m)/d);
               }
               if (c % 2 != 0) {
                    ++sum;
               }
          }
     }
     cout << sum << endl;
     return 0;
}
