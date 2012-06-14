#include <iostream>
#include <vector>
#include <iomanip>
using namespace std;

int sum(const vector<int>& v) {
     int s = 0;
     for (auto e : v) {
          s += e;
     }
     return s;
}

int main() {
     vector<int> pir(37, 0);
     vector<int> cube(37, 0);
     for (int d1 = 1; d1 < 5; ++d1)
          for (int d2 = 1; d2 < 5; ++d2)
               for (int d3 = 1; d3 < 5; ++d3)
                    for (int d4 = 1; d4 < 5; ++d4)
                         for (int d5 = 1; d5 < 5; ++d5)
                              for (int d6 = 1; d6 < 5; ++d6)
                                   for (int d7 = 1; d7 < 5; ++d7)
                                        for (int d8 = 1; d8 < 5; ++d8)
                                             for (int d9 = 1; d9 < 5; ++d9)
                                                  ++pir[d1+d2+d3+d4+d5+d6+d7+d8+d9];

     for (int d1 = 1; d1 < 7; ++d1)
          for (int d2 = 1; d2 < 7; ++d2)
               for (int d3 = 1; d3 < 7; ++d3)
                    for (int d4 = 1; d4 < 7; ++d4)
                         for (int d5 = 1; d5 < 7; ++d5)
                              for (int d6 = 1; d6 < 7; ++d6)
                                   ++cube[d1+d2+d3+d4+d5+d6];

     double win = 0.0;
     for(int i = 9; i <= 36; ++i) {
          double r = (double)pir[i] / pir_total;
          int sum = 0;
          for (int j = 6; j < i; ++j) {
               sum += cube[j];
          }
          r *= ((double)sum / cube_total);
          win += r;
     }
     cout << setprecision(7) << win << endl;

     return 0;
}
