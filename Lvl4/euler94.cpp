// Some manipulation of the "half" of the triangles results in Pell's
// equation.

#include <iostream>
#include <cmath>
using namespace std;

int main() {
     unsigned long L = 1000000000;
     unsigned long x = 2, y = 1;
     unsigned long sum = 0;
     while (true) {
          unsigned long a = 2*x + 1;
          double area = y * (x + 2) / 3;
          if (a > L) break;
          if (a % 3 == 0 && floor(area) == area) {
               a /= 3;
               if (3*a + 1 < L)
                    sum += 3*a + 1;
          }
          a = 2*x - 1;
          area = y * (x - 2) / 3;
          if (a % 3 == 0 && floor(area) == area) {
               a /= 3;
               if (3*a - 1 < L) {
                    sum += 3*a - 1;
               }
          }
          unsigned long tempx = 2*x + 3*y;
          y = 2*y + x;
          x = tempx;
     }
     //Remove the 1 1 2 case
     cout << sum-2 << endl;

     return 0;
}
