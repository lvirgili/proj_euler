//Really forced it. I thought it would follow the same pattern as 114,
//but it didn't. Then the function that I used to generate the
//patterns solved it under one minute. So...

#include <iostream>
using namespace std;

unsigned long long cnt = 1;

int n = 50;
int m = 50;

void put(int size, int pos, int min) {
     if (pos + size <= n) {
          ++cnt;
     } else {
          return;
     }
     for (int new_size = min; new_size <= n; ++new_size) {
          for (int new_pos = pos + size + 1; new_pos <= n; ++new_pos) {
               put(new_size, new_pos, min);
          }
     }
}

int main() {
     for (; ; ++n) {
          for (int size = m; size <= n; ++size) {
               for (int pos = 0; pos <= (n - size); ++pos) {
                    put(size, pos, m);
               }
          }
          cout << n << ' ' << cnt << endl;
          if (cnt > 1000000) break;
          cnt = 1;
     }
     cout << endl;
     return 0;
}
