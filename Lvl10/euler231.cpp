#include <iostream>
#include <vector>
#include <cmath>
using namespace std;

const unsigned long long n = 20000000, k = 15000000;
vector<bool> primes(n, true);

void populate() {
     primes[0] = primes[1] = false;
     for (unsigned long long i = 2; i < n; ++i) {
          if (primes[i] == true) {
               unsigned long long k = i+i;
               while (k < n) {
                    primes[k] = false;
                    k += i;
               }
          }
     }
}

int main() {
     populate();
     vector<unsigned long long> factors;
     for (unsigned long long i = 2; i < n; ++i) {
          if (primes[i] == true) {
               for (unsigned c = 0; c < 100; ++c) {
                    double aux;
                    double nm = modf((double)n/p, &aux);
                    double km = modf((double)k/p, &aux);
                    if (km > nm) {
                         factors.push_back(i);
                    }
                    p *= i;
               }
          }
     }
     unsigned long long sum = 0;
     for (unsigned i = 0; i < factors.size(); ++i) {
          sum += factors[i];
     }
     cout << sum << endl;
     return 0;
}
