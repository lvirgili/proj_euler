// The fun part was finding out that out of a non solution you can get
// one solution: if you have x1, x2,..., xn that are not a solution,
// adding k = prod(xi) - sum(xi) ones will result in a solution.  So I
// just had to find all different factorings of numbers and "pad" them
// with ones.

#include <iostream>
#include <vector>
#include <set>
#include <algorithm>
using namespace std;

int L = 13000;
vector<set<vector<int> > > facts;
vector<bool> primes(L+1, true);
vector<int> minimum(L+1, 0x7fffff);

void gen_primes() {
     primes[0] = primes[1] = false;
     for (int i = 2; i <= L; ++i) {
          if (primes[i] == true) {
               int k = i + i;
               while (k <= L) {
                    primes[k] = false;
                    k += i;
               }
          }
     }
}

void gen_factors(int n) {
     if (primes[n] == true) {
          vector<int> aux; aux.push_back(1); aux.push_back(n);
          facts[n].insert(aux);
          return;
     }
     for (int i = 2; i <= n/2; ++i) {
          if (n % i == 0) {
               int div = n / i;
               vector<int> aux;
               aux.push_back(i); aux.push_back(div);
               sort(aux.begin(), aux.end());
               facts[n].insert(aux);
               if (primes[div] == true) continue;
               set<vector<int> >::iterator it;
               for (it = facts[div].begin(); it != facts[div].end(); ++it) {
                    vector<int> aux2 = *it;
                    vector<int> aux3(1,i);
                    for (unsigned k = 0; k < aux2.size(); ++k) {
                         aux3.push_back(aux2[k]);
                    }
                    sort(aux3.begin(), aux3.end());
                    facts[n].insert(aux3);
               }
          }
     }

}

unsigned sum(vector<int> f) {
     unsigned sum = 0;
     for (unsigned i = 0; i < f.size(); ++i) {
          sum += f[i];
     }
     return sum;
}

int main() {
     for (int i = 0; i <= L; ++i) {
          set<vector<int> > aux;
          facts.push_back(aux);
     }
     gen_primes();
     for (int i = 2; i <= L; ++i) {
          gen_factors(i);
     }
     for (int i = 4; i <= L; ++i) {
          if (primes[i] == false) {
               set<vector<int> >::iterator it;
               for (it = facts[i].begin(); it != facts[i].end(); ++it) {
                    vector<int> f = *it;
                    if (f[0] == 1) continue;
                    unsigned s = sum(f);
                    unsigned l = f.size();
                    if (s != (unsigned)i) {
                         l += i - s;
                    }
                    if (i < minimum[l]) {
                         minimum[l] = i;
                    }
               }
          }
     }
     set<int> m;
     unsigned long sum = 0;
     for (int i = 2; i <= 12000; ++i) {
          if (m.count(minimum[i]) == 0) {
               sum += minimum[i];
               m.insert(minimum[i]);
          }
     }
     cout << sum << endl;
     return 0;
}
