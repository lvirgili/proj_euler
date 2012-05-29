#include <iostream>
#include <vector>
using namespace std;

const unsigned long L = 10000000;
vector<int> ndivs(L, 1);

void populate() {
     for (unsigned long i = 2; i < L; ++i) {
          unsigned long k = i;
          while (k < L) {
               ++ndivs[k];
               k += i;
          }
     }
}

int main() {
     populate();
     unsigned long cnt = 0;
     for (unsigned i = 1; i < L-1; ++i) {
          if (ndivs[i] == ndivs[i+1]) {
               ++cnt;
          }
     }
     cout << cnt << endl;
     return 0;
}
