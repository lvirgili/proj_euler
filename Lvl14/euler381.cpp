// First I calculated the (p-2)!... by calculating inverses starting
// from -1 (Wilson's theorem). Then, in the forums, I found this
// closed formula for the s(p).

#include <iostream>
#include <vector>
#include <gmpxx.h>
using namespace std;

unsigned long L = 100000000;
vector<bool> primes(L, true);

mpz_class s(unsigned long p) {
     return 3 * ((p-1) / 2) * ((p-1) / 2) * ((p-1) / 2) % p;
}

mpz_class solve() {
     primes[0] = primes[1] = false;
     mpz_class sum(0);
     for (unsigned long i = 2; i < L; ++i) {
          if (primes[i] == true) {
               sum += s(i);
               unsigned long k = i+i;
               while (k < L) {
                    primes[k] = false;
                    k += i;
               }
          }
     }
     return sum;
}

int main() {
     cout << solve() << endl;
     return 0;
}
