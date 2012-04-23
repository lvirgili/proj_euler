#include <iostream>
#include <fstream>
#include <algorithm>
using namespace std;

int main() {
     int n = 80;
     int matrix[80][80];
     int aux[80];
     ifstream f("/tmp/matrix.txt");
     for (int i = 0; i < n; ++i) {
          for (int j = 0; j < n; ++j) {
               f >> matrix[i][j];
               f.ignore(1, ',');
          }
     }
     for (int i = 0; i < n; ++i) {
          aux[i] = matrix[i][n-1];
     }
     for (int j = n-2; j >= 0; --j) {
          aux[0] += matrix[0][j];
          for (int i = 1; i < n; ++i) {
               aux[i] = matrix[i][j] + min(aux[i], aux[i-1]);
          }
          for (int i = n-2; i >= 0; --i) {
               aux[i] = min(aux[i], aux[i+1] + matrix[i][j]);
          }
     }
     cout << *min_element(aux, aux+n) << endl;
     return 0;
}
