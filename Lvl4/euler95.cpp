#include <iostream>
#include <vector>
#include <map>
using namespace std;

unsigned n = 1000000;
map<unsigned, unsigned> chain_size;
vector<unsigned> max_chain;
vector<unsigned> primes;

void gen_primes() {
     primes.push_back(2);
     for (unsigned i = 3; i < n; ++i) {
          bool flag = true;
          for (unsigned j = 0; j < primes.size(); ++j) {
               if (i % primes[j] == 0) {
                    flag = false;
                    break;
               }
          }
          if (flag == true) {
               primes.push_back(i);
          }
     }
}

unsigned sum_factors(unsigned num) {
     unsigned sum = 1, x = num;
     for (unsigned i = 0; i < primes.size(); ++i) {
          if (primes[i] * primes[i] > x) {
               break;
          }
          unsigned lsum = sum;
          while (x % primes[i] == 0) {
               x /= primes[i];
               sum = sum*primes[i] + lsum;
          }
     }
     if (num > 1) {
          sum *= (x + 1);
     }
     return sum - num;
}
long find(vector<unsigned> v, unsigned x) {
     for (unsigned i = 0; i < v.size(); ++i) {
          if (v[i] == x) {
               return i;
          }
     }
     return -1;
}

void gen_chain(unsigned num) {
     vector<unsigned> chain;
     unsigned x = num;
     chain.push_back(x);
     while (x < n) {
          if (chain_size.count(x) == 1) {
               chain_size[num] = chain_size[x];
               break;
          } else {
               x = sum_factors(x);
               long i = find(chain, x);
               if (i != -1) {
                    chain_size[num] = chain.size() - i;
                    chain.push_back(x);
                    break;
               }
               chain.push_back(x);
          }
     }
     if (chain_size[num] > max_chain.size() && chain.front() == chain.back()) {
          max_chain = chain;
          for (unsigned i = 0; i < max_chain.size(); ++i) {
               cout << max_chain[i] << ' ';
          }
          cout << endl << endl;
     }
}

int main() {
     gen_primes();

     for (unsigned i = 1; i <= n; ++i) {
          gen_chain(i);
     }

     return 0;
}
