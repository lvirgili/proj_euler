// I altered the input file with before running this. That mix of
// numbers and chars annoyed me.
// It is a really crappy implementation of Prim's algorithm.

#include <iostream>
#include <vector>
using namespace std;

vector<vector<int> > adj;
unsigned total = 0;
const unsigned nvertex = 40;

void fill_adj() {
     for (unsigned i = 0; i < nvertex; ++i) {
          vector<int> aux;
          for (unsigned j = 0; j < nvertex; ++j) {
               int x; cin >> x;
               if (x != 1000 && i > j) {
                    total += x;
               }
               aux.push_back(x);
          }
          adj.push_back(aux);
     }
}

void stupid_prim() {
     vector<int> prnt(nvertex, -1);
     prnt[0] = 0;
     while (true) {
          int v0, w0;
          int min_cst = 1000;
          for (unsigned w = 0; w < adj.size(); ++w) {
               if (prnt[w] == -1) {
                    for (unsigned v = 0; v < adj[w].size(); ++v) {
                         if (prnt[v] != -1 && min_cst > adj[v][w]) {
                              min_cst = adj[v][w];
                              v0 = v;
                              w0 = w;
                         }
                    }
               }
          }
          if (min_cst == 1000) {
               break;
          }
          prnt[w0] = v0;
     }
     unsigned new_total = 0;
     for (unsigned i = 1; i < prnt.size(); ++i) {
          new_total += adj[prnt[i]][i];
     }
     cout << total << endl;
     cout << new_total << endl;
     cout << total - new_total << endl;
}

int main() {
     fill_adj();
     stupid_prim();
     return 0;
}
