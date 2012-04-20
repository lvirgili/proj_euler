#include <iostream>
#include <fstream>
using namespace std;

int main() {
     int n = 80;
     int matrix[80][80];
     ifstream f("/tmp/matrix.txt");
     for (int i = 0; i < n; ++i) {
          for (int j = 0; j < n; ++j) {
               f >> matrix[i][j];
               f.ignore(1, ',');
          }
     }
     for (int i = n-2; i >= 0; --i) {
          matrix[n-1][i] += matrix[n-1][i+1];
          matrix[i][n-1] += matrix[i+1][n-1];
     }
     for (int i = n-2; i >= 0; --i) {
          for (int j = n-2; j >= 0; --j) {
               matrix[i][j] += min(matrix[i+1][j], matrix[i][j+1]);
          }
     }
     cout << matrix[0][0] << endl;
     return 0;
}
