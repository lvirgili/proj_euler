// I tried using set intersection in ruby but it took too long. Then I
// tried the stupid approach and it gives the answer pretty fast. Oh
// well, who cares for elegancy?

#include <iostream>
#include <vector>
#include <cmath>
using namespace std;

vector<unsigned long> primes;

void gen_primes() {
     primes.push_back(3);
     for (unsigned long i = 7; i < 10000; i += 2) {
          bool flag = true;
          for (unsigned long j = 3; j*j <= i; ++j) {
               if (i % j == 0) {
                    flag = false;
                    break;
               }
          }
          if (flag == true) {
               primes.push_back(i);
          }
     }
}

bool is_prime(unsigned long x) {
     for (unsigned i = 2; i*i <= x; ++i) {
          if (x % i == 0) {
               return false;
          }
     }
     return true;
}

bool check_primalty(unsigned long i, unsigned long j) {
     int i_s = floor(log10(i)+1);
     int j_s = floor(log10(j)+1);
     unsigned long num = i * pow(10,j_s) + j;
     if (is_prime(num) == false) {
          return false;
     }
     num = (unsigned long)j * pow(10,i_s) + i;
     if (is_prime(num) == false) {
          return false;
     }
     return true;
}

int main() {
     gen_primes();
     for (unsigned i = 0; i < primes.size(); ++i) {
          for (unsigned j = i+1; j < primes.size(); ++j) {
               if (check_primalty(primes[i], primes[j]) == true) {
                    for (unsigned k = j+1; k < primes.size(); ++k) {
                         if (check_primalty(primes[i], primes[k]) == true &&
                             check_primalty(primes[j], primes[k]) == true) {
                              for (unsigned l = k+1; l < primes.size(); ++l) {
                                   if (check_primalty(primes[i], primes[l]) == true &&
                                       check_primalty(primes[j], primes[l]) == true &&
                                       check_primalty(primes[k], primes[l]) == true) {
                                        for (unsigned m = l+1; m < primes.size(); ++m) {
                                             if (check_primalty(primes[i], primes[m]) == true &&
                                                 check_primalty(primes[j], primes[m]) == true &&
                                                 check_primalty(primes[k], primes[m]) == true &&
                                                 check_primalty(primes[l], primes[m]) == true) {
                                                  cout << primes[i] << ' ' << primes[j] << ' ' << primes[k] << ' ' << primes[l] << ' ' << primes[m] << ' ';
                                                  cout << primes[i] + primes[j] + primes[k] +  primes[l] + primes[m] << endl;
                                                  return 0;
                                             }
                                        }
                                   }
                              }
                         }
                    }
               }
          }
     }
     return 0;
}
