#include <iostream>
#include <map>
using namespace std;

unsigned long gcd(unsigned long a, unsigned long b) {
     unsigned long c;
     while (b != 0) {
          c = a % b;
          a = b;
          b = c;
     }
     return a;
}

int main() {
     unsigned long L = 1500000;
     map<unsigned long, unsigned long> p;
     map<unsigned long, unsigned long>::iterator it;
     for (unsigned long m = 2; m*m <= L; ++m) {
          for (unsigned long n = 1; n < m; ++n) {
               if (gcd(m,n) == 1 && (m-n) % 2 == 1) {
                    unsigned long k = 1;
                    unsigned long sum = 0;
                    while (sum <= L) {
                         unsigned long a = k*(m*m - n*n),
                              b = k*(2*m*n),
                              c = k*(m*m + n*n);
                         sum = a + b + c;
                         ++p[sum];
                         ++k;
                    }
               }
          }
     }
     unsigned long cnt = 0;
     for (it = p.begin(); it != p.end(); ++it) {
          if (it->second == 1 && it->first <= L) {
               ++cnt;
          }
     }
     cout << cnt << endl;
     return 0;
}
