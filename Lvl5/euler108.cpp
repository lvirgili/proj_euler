#include <iostream>
#include <vector>
using namespace std;

unsigned long L = 1000000;
vector<vector<int> > primes;

void gen_prime_powers() {
     for (unsigned long i = 2; i < L; ++i) {
          if (primes[i].size() == 0) {
               unsigned long k = i+i;
               while (k < L) {
                    unsigned long cp = k;
                    int divs = 0;
                    while (cp % i == 0) {
                         ++divs;
                         cp /= i;
                    }
                    primes[k].push_back(divs);
                    k += i;
               }
          }
     }
}

int main() {
     for (unsigned i = 0; i < L; ++i) {
          vector<int> aux; primes.push_back(aux);
     }
     gen_prime_powers();
     for (unsigned i = 2; i < L; ++i) {
          if (primes[i].size() != 0) {
               unsigned long prod = 1;
               for (unsigned j = 0; j < primes[i].size(); ++j) {
                    prod *= (primes[i][j]*2 + 1);
                    if (prod >= 2000) {
                         cout << i << endl;
                         return 0;
                    }
               }
          }
     }
     return 0;
}
