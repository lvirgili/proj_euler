// Brute force.

#include <iostream>
#include <gmpxx.h>
#include <string>
#include <algorithm>
#include <thread>
#include <atomic>
using namespace std;

atomic<int> cnt(0);

bool reversible(unsigned long n) {
     if (n % 10 == 0) return false;
     mpz_class x(n);
     string s = x.get_str();
     reverse(s.begin(), s.end());
     mpz_class y(s);
     mpz_class sum(x+y);
     s = sum.get_str();
     for (unsigned i = 0; i < s.size(); ++i) {
          if (s[i] == '0' || s[i] == '2' || s[i] == '4' ||
              s[i] == '6' || s[i] == '8') {
               return false;
          }
     }
     return true;
}

void c(unsigned long start, unsigned long end) {
     for (unsigned long i = start; i < end; ++i) {
          if (reversible(i) == true) {
               cnt.fetch_add(1);
          }
     }

}

int main() {
     for (unsigned long i = 10; i < 10000; ++i) {
          if (reversible(i) == true) {
               ++cnt;
          }
     }
     cout << cnt << endl;
     thread t[4];
     unsigned long s = 100000, e = 100000000;
     for (int i = 0; i < 4; ++i) {
          t[i] = thread(c, s + i*(e-s)/4, s + (i+1)*(e-s)/4);
     }
     for (int i = 0; i < 4; ++i) {
          t[i].join();
     }
     cout << cnt << endl;
     return 0;
}
