#include <iostream>
using namespace std;

int main() {
     int L = 50;
     unsigned cnt = 3*L*L;
     for (int x1 = 2; x1 <= L; ++x1) {
          for (int x2 = 1; x2 < x1; ++x2) {
               for (int y = 1; y <= L; ++y) {
                    if ((x2*x2 + y*y - x1*x2) == 0) {
                         cnt += 2;
                    }
               }
          }
     }
     for (int x1 = 2; x1 <= L; ++x1) {
          for (int x2 = 1; x2 < x1; ++x2) {
               for (int y2 = 2; y2 <= L; ++y2) {
                    for (int y1 = 1; y1 < y2; ++y1) {
                         if ((x1*x1 + y1*y1 - x1*x2 - y1*y2) == 0) {
                              cnt += 2;
                         }
                    }
               }
          }
     }
     cout << cnt << endl;
     return 0;
}
