// Stupid brute force. Takes 12s.

#include <iostream>
#include <gmpxx.h>
#include <string>
using namespace std;

bool check(string s) {
     if (s[0] == '1' && s[2] == '2' && s[4] == '3' &&
         s[6] == '4' && s[8] == '5' && s[10] == '6' &&
         s[12] == '7' && s[14] == '8' && s[16] == '9' && s[18]) {
          return true;
     }

     return false;
}
int main() {
     unsigned long n = 1010101010;
     unsigned long l = 1389026630;
     mpz_class sq(0);
     while (n < l) {
          mpz_ui_pow_ui(sq.get_mpz_t(), n, 2);
          if (check(sq.get_str()) == true) {
               cout << n << ' ' << sq << endl;
               break;
          }
          n += 10;
     }
     return 0;
}
