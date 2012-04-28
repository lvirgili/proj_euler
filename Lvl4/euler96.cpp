#include <iostream>
#include <fstream>
#include <vector>
#include <cstdlib>
using namespace std;

int grid[9][9];
vector<pair<int,int> > squares;

pair<int,int> sub_grid(int i, int j) {
     int line = (i / 3) * 3,
          col = (j / 3) * 3;
     return make_pair(line, col);
}

bool check_conflicts(int i, int j) {
     for (int l = 0; l < 9; ++l) {
          if (l != j) {
               if (grid[i][j] == grid[i][l]) {
                    return true;
               }
          }
          if (l != i) {
               if (grid[i][j] == grid[l][j]) {
                    return true;
               }
          }
     }
     pair<int,int> p = sub_grid(i,j);
     for (int l = p.first; l < p.first+3; ++l) {
          for (int c = p.second; c < p.second+3; ++c) {
               if (l != i && c != j) {
                    if (grid[i][j] == grid[l][c]) {
                         return true;
                    }
               }
          }
     }
     return false;
}

void solve() {
     unsigned i = 0;
     while (i < squares.size()) {
          int line = squares[i].first,
               col = squares[i].second;
          ++grid[line][col];
          if (grid[line][col] == 10) {
               grid[line][col] = 0;
               --i;
               continue;
          }
          if (check_conflicts(line, col) == false) {
               ++i;
          } else {
               if (grid[line][col] > 9) {
                    grid[line][col] = 0;
                    --i;
               }
          }
     }
}

int main() {
     ifstream f("/tmp/sudoku.txt");
     unsigned long sum = 0;
     for (int sud = 0; sud < 50; ++sud) {
          string s; getline(f, s);
          for (int i = 0; i < 9; ++i) {
               string line; getline(f, line);
               for (int j = 0; j < 9; ++j) {
                    grid[i][j] = line[j] - 48;
                    squares.push_back(make_pair(i,j));
                    if (grid[i][j] != 0) {
                         squares.pop_back();
                    }
               }
          }
          solve();
          sum += (100*grid[0][0] + 10*grid[0][1] + grid[0][2]);
          squares.clear();
     }
     f.close();
     cout << sum << endl;
     return 0;
}
