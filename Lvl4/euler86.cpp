// It is easy to notice the strategy if you planify the cuboid.  When
// there is a solution you just have to calculate the number of
// combinations that add up to that and that's it.
// Hated this problem. Don't like geometry.

#include <iostream>
#include <cmath>
using namespace std;

int main() {
     unsigned long L = 1000000;
     unsigned long sum  = 0;
     unsigned long a = 1;
     while (sum < L) {
          for (unsigned long b = 3; b <= 2*a; ++b) {
               if (sqrt(a*a + b*b) == floor(sqrt(a*a + b*b))) {
                    sum += (b <= a) ? b / 2 : 1 + (a - (b+1)/2);
               }
          }
          ++a;
     }
     cout << a-1 << endl;
     return 0;
}
