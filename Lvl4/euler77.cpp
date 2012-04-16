// The first before last comment contains the solution. Just coded it.
// http://math.stackexchange.com/questions/89240/prime-partition

#include <iostream>
#include <vector>
using namespace std;

long L = 1000;
vector<long> primes;
vector<long> sop(L+1, 0);
vector<long> ppart(L+1, 0);

void gen_primes() {
     primes.push_back(2); primes.push_back(3);
     for (long i = 5; i <= L; i += 2) {
          bool flag = true;
          for (long j = 3; j*j <= i; j += 2) {
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

void gen_sop() {
     for (unsigned i = 0; i < primes.size(); ++i) {
          long k = primes[i];
          while (k <= L) {
               long j = k, ind = k;
               if (j % primes[i] == 0) {
                    sop[ind] += primes[i];
                    ppart[ind] += primes[i];
                    while (j % primes[i] == 0) {
                         j /= primes[i];
                    }
               }
               k += primes[i];
          }
     }
}

void pp() {
     for (unsigned i = 2; i < sop.size(); ++i) {
          for (unsigned j = 1; j < i; ++j) {
               ppart[i] += sop[j] * ppart[i-j];
          }
          ppart[i] /= i;
     }
}

int main() {
     gen_primes();
     gen_sop();
     pp();
     for (long i = 2; i <= L; ++i) {
          if (ppart[i] > 5000) {
               cout << i << ' ' << ppart[i] << endl;
               break;
          }
     }
     return 0;
}
