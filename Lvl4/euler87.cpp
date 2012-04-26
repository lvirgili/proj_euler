#include <iostream>
#include <vector>
#include <set>
using namespace std;

unsigned long limit = 50000000;
vector<unsigned long> ps, pc, pq;

void gen_primes() {
     bool cubes = true, quads = true;
     for (unsigned long i = 2; i*i <= limit; ++i) {
          bool flag = true;
          for (unsigned j = 2; j*j <= i; ++j) {
               if (i % j == 0) {
                    flag = false;
                    break;
               }
          }
          if (flag == true) {
               if (i*i < limit)
                    ps.push_back(i*i);
               if (cubes && i*i*i < limit)
                    pc.push_back(i*i*i);
               else
                    cubes = false;
               if (quads && i*i*i*i < limit)
                    pq.push_back(i*i*i*i);
               else
                    quads = false;
          }
     }
}

int main() {
     gen_primes();
     set<unsigned long> numbers;
     for (unsigned i = 0; i < ps.size(); ++i) {
          for (unsigned j = 0; j < pc.size(); ++j) {
               for (unsigned k = 0; k < pq.size(); ++k) {
                    unsigned long num = ps[i] + pc[j] + pq[k];
                    if (num < limit) {
                         numbers.insert(num);
                    } else {
                         break;
                    }
               }
          }
     }
     cout << numbers.size() << endl;
     return 0;
}
