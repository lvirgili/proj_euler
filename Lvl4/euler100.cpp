// I manipulated a bit the proportion and got to a relation for
// b. Then, generating some b, I noticed they were separated by a
// factor of approximately 5.82842. It solves the problem pretty fast.

#include <iostream>
#include <gmpxx.h>
using namespace std;

mpz_class black(mpz_class k) {
     mpz_class aux(2*k*k + 2);
     if (mpz_perfect_square_p(aux.get_mpz_t()) != 0) {
          mpz_sqrt(aux.get_mpz_t(), aux.get_mpz_t());
          return (8 + 4*aux) / 16;
     } else {
          return 0;
     }
}

mpz_class red(mpz_class black) {
     mpz_class aux(8*black*black - 8*black + 1);
     mpz_sqrt(aux.get_mpz_t(), aux.get_mpz_t());
     return (1 - 2*black + aux) / 2;
}

int main() {
     char L[] = "1000000000000";
     char S[] = "1";
     mpz_class l(L), i(S);
     for (;; ++i) {
          mpz_class b(black(i));
          if (b > 0) {
               mpz_class r(red(b));
               cout << b << ' ' << r << ' ' << b+r << ' ' << i << endl;
               mpf_class aux_i(i.get_str());
               aux_i *= 5.82842;
               mpz_set_f(i.get_mpz_t(), aux_i.get_mpf_t());
               if (b+r >= l) break;
          }
     }
     return 0;
}
