//I first made a recursive solution. It was too slow, but it generated
//the output until 35. Then I picked the pattern.

#include <iostream>
using namespace std;

int main() {
     int add = 1;
     unsigned long long x = 4, y = 7;
     for (int i = 6; i <= 50; ++i) {
          if (i % 3 == 0) {
               add *= -1;
               unsigned long long sum = x + y;
               x = y;
               y = sum;
          } else {
               unsigned long long sum = x + y + add;
               x = y;
               y = sum;
          }
     }
     cout << y << endl;
     return 0;
}
