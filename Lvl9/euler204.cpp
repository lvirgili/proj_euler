#include <iostream>
#include <vector>
using namespace std;

const unsigned long long L = 1000000000;
const unsigned n = 100;
vector<short> arr(L+1, 1);

void populate() {
     arr[0] = 3;
     arr[1] = 2;
     for (unsigned long long i = 2; i <= L; ++i) {
          if (arr[i] == 1) { //prime
               unsigned long long k = i;
               while (k <= L) {
                    if (i <= n) {
                         arr[k] = 2;
                    } else {
                         arr[k] = 3;
                    }
                    k += i;
               }
          }
     }
}

int main() {
     populate();
     unsigned long cnt = 0;
     for (unsigned long long i = 1; i <= L; ++i) {
          if (arr[i] < 3) {
               ++cnt;
          }
     }
     cout << cnt << endl;
     return 0;
}
