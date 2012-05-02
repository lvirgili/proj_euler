#include <iostream>
#include <iomanip>
#include <vector>
using namespace std;

bool is_bouncy(unsigned long x) {
     vector<unsigned long> arr, aux;
     while (x > 0) {
          arr.push_back(x % 10);
          x /= 10;
     }
     bool inc = true, dec = true;
     for (unsigned i = 0; i < arr.size()-1; ++i) {
          if (arr[i] < arr[i+1]) {
               inc = false;
               break;
          }
     }
     for (unsigned i = 0; i < arr.size()-1; ++i) {
          if (arr[i] > arr[i+1]) {
               dec = false;
               break;
          }
     }
     return !(inc || dec);
}

int main() {
     unsigned count = 0;
     unsigned long i = 1;
     unsigned long total = 0;
     unsigned long prop = 99, p = 0;
     while (p < prop) {
          ++total;
          if (is_bouncy(i) == true) ++count;
          p = count*100.0 / total;
          ++i;
     }
     cout << i-1 << endl;
     return 0;
}
