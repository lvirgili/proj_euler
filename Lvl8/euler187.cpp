#include <iostream>
#include <vector>
using namespace std;

const unsigned long L = 100000000;
vector<int> arr(L, 0);

void populate() {
     for (unsigned long i = 2; i < L; ++i) {
          if (arr[i] == 0) {
               unsigned long k = i + i;
               while (k < L) {
                    unsigned long c = k;
                    while (c % i == 0) {
                         ++arr[k];
                         c /= i;
                    }
                    k += i;
               }
          }
     }
}

int main() {
     populate();
     unsigned long cnt = 0;
     for (unsigned i = 4; i < L; ++i) {
          if (arr[i] == 2) {
               ++cnt;
          }
     }
     cout << cnt << endl;
     return 0;
}
