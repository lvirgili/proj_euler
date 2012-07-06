//Again I brute forced it for small values of n and found a pattern.

#include <iostream>
#include <vector>
#include <gmpxx.h>
using namespace std;

int main() {
     int ind = 0;
     vector<mpz_class> vals = {15, 29, 56, 108, 208};
     mpz_class x = 208;
     for (int n = 10; n <= 50; ++n) {
          x = (x * 2 - vals[ind]);
          vals.push_back(x);
          ++ind;
     }
     cout << x << endl;
     return 0;
}
