//It overflowed, then I had to use gmp, which significantly slowed
//it. Still under one minute, though.

#include <iostream>
#include <vector>
#include <algorithm>
#include <gmpxx.h>
using namespace std;

typedef struct num {
     mpz_class n;
     unsigned long rad;
} num;

unsigned L = 100000;
vector<num> arr;
vector<bool> primes(L+1, true);

void gen_primes() {
     primes[0] = primes[1] = false;
     for (unsigned i = 2; i <= L; ++i) {
          if (primes[i] == true) {
               unsigned k = i+i;
               while (k <= L) {
                    primes[k] = false;
                    k += i;
               }
          }
     }
}

bool comp(num x, num y) {
     if (x.rad != y.rad) {
          return x.rad < y.rad;
     }
     return x.n < y.n;
}

int main() {
     gen_primes();
     num one = {1, 1};
     arr.push_back(one);
     for (unsigned i = 2; i <= L; ++i) {
          if (primes[i] == true) {
               mpz_class n(i), mult;
               unsigned s = arr.size();
               while (n <= L) {
                    for (unsigned j = 0; j < s; ++j) {
                         mult = arr[j].n * n;
                         if (mult <= L) {
                              num x = {mult, arr[j].rad * i};
                              arr.push_back(x);
                         }
                    }
                    n *= i;
               }
          }
     }
     sort(arr.begin(), arr.end(), comp);
      cout << arr[9999].n << endl;

     return 0;
}
