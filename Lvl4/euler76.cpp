// Used the information here:
// http://en.wikipedia.org/wiki/Partition_(number_theory)#Partition_function_formulas
// and used a 'sieve' to calculate the number of partitions.

#include <iostream>
#include <vector>
using namespace std;

unsigned long L = 100;
vector<unsigned long> p(L+1, 0), pent;

void gen_pent() {
     pent.push_back(0);
     long j = 1;
     unsigned long pent1 = 0, pent2 = 0;
     while (pent1 <= L || pent2 <= L) {
          pent1 = (3*j*j - j) / 2;
          pent2 = (3*j*j + j) / 2;
          pent.push_back(pent1); pent.push_back(pent2);
          ++j;
     }
}

void gen_p() {
     p[0] = 1;
     for (unsigned i = 0; i <= L; ++i) {
          unsigned j = 1;
          int signal = 1;
          while ((i+pent[j]) <= L || (i+pent[j+1]) <= L) {
               if (i+pent[j] <= L) {
                    p[i+pent[j]] += p[i] * signal;
               }
               if (i+pent[j+1] <= L) {
                    p[i+pent[j+1]] += p[i] * signal;
               }
               j += 2;
               signal *= -1;
          }
     }
}

int main() {
     gen_pent();
     gen_p();
     cout << p[L] << endl;
     return 0;
}
