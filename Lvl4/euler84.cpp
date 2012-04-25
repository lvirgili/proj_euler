// I "simulated" the game. Between quotes as it seems to be wrong. To
// get to the answer I tried permutations of the 5 most visited in my
// simulation.

#include <iostream>
#include <ctime>
#include <cstdlib>
#include <algorithm>
#include <numeric>
using namespace std;

#define jail 10
#define go 0
#define c3 11
#define e3 24
#define h2 39
#define r1 5

const int n = 4;
const int bsize = 40;
int board[40];
int cccards[] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
int chcards[] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};

int main() {
     int ndubs = 0;
     int pos = go;
     for (int i = 0; i < bsize; ++i) {
          board[i] = 0;
     }
     srand(time(NULL));
     random_shuffle(cccards, cccards+16);
     random_shuffle(chcards, chcards+16);
     int cccard = 0, chcard = 0;
     for (long turn = 0; turn < 100000; ++turn) {
          int d1 = rand()%n + 1;
          int d2 = rand()%n + 2;
          bool to_jail = false;
          if (d1 == d2) {
               ++ndubs;
               if (ndubs == 3) {
                    to_jail = true;
                    ndubs = 0;
               }
          } else {
               ndubs = 0;
          }
          if (to_jail == true) {
               pos = jail;
          } else {
               pos = (pos+d1+d2) % bsize;
          }
          if (pos == 30) {
               pos = jail;
          }
          if (pos == 2 || pos == 17 || pos == 33) {
               int cc = cccards[cccard];
               cccard = (cccard+1)%16;
               if (cc == 1) pos = go;
               if (cc == 2) pos = jail;
          }
          if (pos == 7 || pos == 22 || pos == 36) {
               int ch = chcards[chcard];
               chcard = (chcard+1)%16;
               if (ch == 1) pos = go;
               if (ch == 2) pos = jail;
               if (ch == 3) pos = c3;
               if (ch == 4) pos = e3;
               if (ch == 5) pos = h2;
               if (ch == 6) pos = r1;
               if (ch == 7 || ch == 8) {
                    if (pos == 7) pos = 15;
                    if (pos == 22) pos = 25;
                    if (pos == 36) pos = 5;
               }
               if (ch == 9) {
                    if (pos == 7 || pos == 36) pos = 12;
                    if (pos == 22) pos = 28;
               }
               if (ch == 10) {
                    pos -= 3;
                    if (pos == 33) {
                         int cc = cccards[cccard];
                         cccard = (cccard+1)%16;
                         if (cc == 1) pos = go;
                         if (cc == 2) pos = jail;
                    }
               }
          }
          ++board[pos];
     }
     long tot = accumulate(board, board+bsize, 0);
     int first = distance(board, max_element(board, board + bsize));
     cout << first << ": " << 100.0*board[first]/tot << endl;
     board[first] = 0;
     int second = distance(board, max_element(board, board + bsize));
     cout << second << ": " << 100.0*board[second]/tot << endl;
     board[second] = 0;
     int third = distance(board, max_element(board, board + bsize));
     cout << third << ": " << 100.0*board[third]/tot << endl;
     board[third] = 0;
     int fourth = distance(board, max_element(board, board + bsize));
     cout << fourth << ": " << 100.0*board[fourth]/tot << endl;
     board[fourth] = 0;
     int fifth = distance(board, max_element(board, board + bsize));
     cout << fifth << ": " << 100.0*board[fifth]/tot << endl;

     return 0;
}
