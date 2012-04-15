#include <iostream>
#include <set>
using namespace std;

unsigned long fac[] = {1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880};

unsigned long facsum(unsigned long n) {
     unsigned long sum = 0;
     while (n > 0) {
          sum += fac[n%10];
          n /= 10;
     }
     return sum;
}

int main() {
     unsigned n = 1000000;
     unsigned long sum = 0;
     for (unsigned i = 1; i < n; ++i) {
          set<unsigned long> s;
          unsigned long x = i;
          while (s.count(x) == 0) {
               s.insert(x);
               x = facsum(x);
          }
          if (s.size() == 60) {
               ++sum;
          }
     }
     cout << sum << endl;
     return 0;
}
