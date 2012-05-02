// Found the algorithm here:
// http://www.blackpawn.com/texts/pointinpoly/default.html
// Really nice use of linear algebra.

#include <iostream>
#include <vector>
#include <fstream>
using namespace std;

double dot(vector<double> a, vector<double> b) {
     return (a[0]*b[0] + a[1]*b[1]);
}

vector<double> sub(vector<double> a, vector<double> b) {
     vector<double> c;
     for (unsigned i = 0; i < a.size(); ++i) {
          c.push_back(a[i] - b[i]);
     }
     return c;
}

bool inside(vector<double> a, vector<double> b, vector<double> c) {
     vector<double> v0, v1, v2;
     vector<double> ori(2,0);
     v0 = sub(c, a);
     v1 = sub(b, a);
     v2 = sub(ori, a);
     double d00 = dot(v0,v0);
     double d01 = dot(v0,v1);
     double d02 = dot(v0,v2);
     double d11 = dot(v1,v1);
     double d12 = dot(v1,v2);
     double inv = 1.0 / (d00*d11 - d01*d01);
     double u = (d11*d02 - d01*d12) * inv;
     double v = (d00*d12 - d01*d02) * inv;
     return (u >= 0 && v >= 0 && (u+v < 1));
}

int main() {
     vector<double> a(2,0), b(2,0), c(2,0);
     fstream f("/tmp/triangles.txt");
     int count = 0;
     for (int i = 0; i < 1000; ++i) {
          char ch;
          f >> a[0]; f >> ch; f >> a[1]; f >> ch;
          f >> b[0]; f >> ch; f >> b[1]; f >> ch;
          f >> c[0]; f >> ch; f >> c[1];
          count += (inside(a,b,c) == true)? 1 : 0;
     }
     cout << count << endl;
     return 0;
}
