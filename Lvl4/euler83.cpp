// It's a dijkstra. Believe me. =P

#include <iostream>
#include <fstream>
#include <map>
#include <vector>
using namespace std;

const int n = 80;
const int inf = ~0;
int matrix[80][80];
vector<pair<int,int> > pq;
map<pair<int,int>, int> cst;
map<pair<int,int>, pair<int,int> > prnt;
map<pair<int,int>, vector<pair<int, int> > > adj;

pair<int,int> pop_min() {
     int min_ind = 0;
     int min = cst[pq[0]];
     unsigned i;
     for (i = 1; i < pq.size(); ++i) {
          if (cst[pq[i]] < min) {
               min = cst[pq[i]];
               min_ind = i;
          }
     }
     pair<int,int> p = pq[min_ind];
     pq.erase(pq.begin()+min_ind);
     return p;
}

vector<pair<int,int> > neigh(int i, int j, int n) {
     vector<pair<int,int> > ne;
     if (i > 0 && i < n-1 && j > 0 && j < n-1) {
          ne.push_back(make_pair(i+1,j));
          ne.push_back(make_pair(i-1,j));
          ne.push_back(make_pair(i,j+1));
          ne.push_back(make_pair(i,j-1));
          return ne;
     }
     if (i == 0) {
          if (j == 0) {
               ne.push_back(make_pair(i+1,j));
               ne.push_back(make_pair(i,j+1));
               return ne;
          }
          if (j == n-1) {
               ne.push_back(make_pair(i+1,j));
               ne.push_back(make_pair(i,j-1));
               return ne;
          }
          ne.push_back(make_pair(i,j+1));
          ne.push_back(make_pair(i,j-1));
          ne.push_back(make_pair(i+1,j));
          return ne;
     }
     if (i == n-1) {
          if (j == 0) {
               ne.push_back(make_pair(i-1,j));
               ne.push_back(make_pair(i,j+1));
               return ne;
          }
          if (j == n-1) {
               ne.push_back(make_pair(i-1,j));
               ne.push_back(make_pair(i,j-1));
               return ne;
          }
          ne.push_back(make_pair(i,j+1));
          ne.push_back(make_pair(i,j-1));
          ne.push_back(make_pair(i-1,j));
          return ne;
     }
     if (j == 0) {
          ne.push_back(make_pair(i,j+1));
          ne.push_back(make_pair(i-1,j));
          ne.push_back(make_pair(i+1,j));
          return ne;
     }
     if (j == n-1) {
          ne.push_back(make_pair(i+1,j));
          ne.push_back(make_pair(i,j-1));
          ne.push_back(make_pair(i-1,j));
          return ne;
     }
     return ne;
}

int main() {
     ifstream f("/tmp/matrix.txt");
     for (int i = 0; i < n; ++i) {
          for (int j = 0; j < n; ++j) {
               f >> matrix[i][j];
               f.ignore(1, ',');
          }
     }
     for (int i = 0; i < n; ++i) {
          for (int j = 0; j < n; ++j) {
               vector<pair<int,int> > ne = neigh(i, j, n);
               adj.insert(make_pair(make_pair(i,j), ne));
               prnt.insert(make_pair(make_pair(i,j), make_pair(-1,-1)));
          }
     }
     for (int i = 0; i < n; ++i) {
          for (int j = 0; j < n; ++j) {
               cst.insert(make_pair(make_pair(i,j), inf));
          }
     }

     cst[make_pair(0,0)] = matrix[0][0];
     prnt[make_pair(0,0)] = make_pair(0,0);
     pq.push_back(make_pair(0,0));

     while (pq.empty() == false) {
          pair<int, int> v = pop_min();
          vector<pair<int, int> > ne = adj[v];
          for (unsigned i = 0; i < ne.size(); ++i) {
               if (cst[ne[i]] == inf) {
                    cst[ne[i]] = cst[v] + matrix[ne[i].first][ne[i].second];
                    prnt[ne[i]] = v;
                    pq.push_back(ne[i]);
               } else {
                    if (cst[ne[i]] > cst[v]+matrix[ne[i].first][ne[i].second]) {
                         cst[ne[i]] = cst[v]+matrix[ne[i].first][ne[i].second];
                         prnt[ne[i]] = v;
                    }
               }
          }

     }

     cout << cst[make_pair(n-1,n-1)] << endl;

     return 0;
}
