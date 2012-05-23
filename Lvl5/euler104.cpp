#include <iostream>
#include <gmpxx.h>
#include <cstring>
#include <string>
#include <algorithm>
#include <sstream>
using namespace std;

bool check(unsigned long n) {
     mpz_class fib(1);
     mpz_fib_ui(fib.get_mpz_t(), n);
     char *num = mpz_get_str(NULL, 10, fib.get_mpz_t());
     string s;
     for (int i = 0; i < 9; ++i) {
          s.push_back(num[i]);
     }
     sort(s.begin(), s.end());
     if (strcmp("123456789", s.c_str()) == 0) {
          return true;
     } else {
          return false;
     }
}

int main() {
     unsigned long a = 1, b = 1, i = 3;
     while (true) {
          unsigned long aux = a;
          a = b;
          b = (aux + b) % 1000000000;
          stringstream ss;
          ss << b;
          string s = ss.str();
          sort(s.begin(), s.end());
          if (strcmp("123456789", s.c_str()) == 0) {
               bool w = check(i);
               if (w == true) {
                    cout << i << endl;
                    break;
               }
          }
          ++i;
     }
     return 0;
}
