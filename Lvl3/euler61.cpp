#include <iostream>
#include <map>
#include <vector>
#include <algorithm>
using namespace std;

enum fig {
     triangle,
     square,
     pentagonal,
     hexagonal,
     heptagonal,
     octagonal
};

typedef struct number {
     enum fig type;
     int num;
} number;

map<int, vector<number> > numbers;

void gen_map() {
     int n = 1;
     while (true) {
          int t = n*(n+1)/2,
               s = n*n,
               p = n*(3*n-1)/2,
               hex = n*(2*n-1),
               hep = n*(5*n-3)/2,
               o = n*(3*n-2);
          if (t > 9999) {
               break;
          }
          if (t >= 1000 && t <= 9999) {
               int h = t / 100;
               number num; num.type = triangle; num.num = t;
               if (numbers.count(h) == 0) {
                    vector<number> aux;
                    aux.push_back(num);
                    numbers[h] = aux;
               } else {
                    numbers[h].push_back(num);
               }
          }
          if (s >= 1000 && s <= 9999) {
               int h = s / 100;
               number num; num.type = square; num.num = s;
               if (numbers.count(h) == 0) {
                    vector<number> aux;
                    aux.push_back(num);
                    numbers[h] = aux;
               } else {
                    numbers[h].push_back(num);
               }
          }
          if (p >= 1000 && p <= 9999) {
               int h = p / 100;
               number num; num.type = pentagonal; num.num = p;
               if (numbers.count(h) == 0) {
                    vector<number> aux;
                    aux.push_back(num);
                    numbers[h] = aux;
               } else {
                    numbers[h].push_back(num);
               }
          }
          if (hex >= 1000 && hex <= 9999) {
               int h = hex / 100;
               number num; num.type = hexagonal; num.num = hex;
               if (numbers.count(h) == 0) {
                    vector<number> aux;
                    aux.push_back(num);
                    numbers[h] = aux;
               } else {
                    numbers[h].push_back(num);
               }
          }
          if (hep >= 1000 && hep <= 9999) {
               int h = hep / 100;
               number num; num.type = heptagonal; num.num = hep;
               if (numbers.count(h) == 0) {
                    vector<number> aux;
                    aux.push_back(num);
                    numbers[h] = aux;
               } else {
                    numbers[h].push_back(num);
               }
          }
          if (o >= 1000 && o <= 9999) {
               int h = o / 100;
               number num; num.type = octagonal; num.num = o;
               if (numbers.count(h) == 0) {
                    vector<number> aux;
                    aux.push_back(num);
                    numbers[h] = aux;
               } else {
                    numbers[h].push_back(num);
               }
          }
          ++n;
     }
}

vector<number> answer;
vector<bool> types;

bool is_there(number num) {
     for (unsigned i = 0; i < answer.size(); ++i) {
          if (answer[i].num == num.num) return true;
     }
     return false;
}

bool comp(number a, number b) {
     return a.num < b.num;
}

bool is_cyclic(int s) {
     sort(answer.begin(), answer.end(), comp);
     do {
          bool flag = true;
          for (int i = 0; i < s; ++i) {
               if (answer[(i+1)%s].num/100 != answer[i].num%100) {
                    flag = false;
                    break;
               }
          }
          if (flag == true) return true;
     } while (next_permutation(answer.begin(), answer.end(), comp));
     return false;
}

void find_next(int n, int s) {
     if (answer.size() == (unsigned)s) {
          if (is_cyclic(s) == true) {
               int sum = 0;
               sort(answer.begin(), answer.end(), comp);
               for (unsigned i = 0; i < answer.size(); ++i) {
                    cout << answer[i].num << " : " << answer[i].type << ' ';
                    sum += answer[i].num;
               }
               cout << endl << "sum = " << sum << endl;
               exit(0);
          }
     }
     vector<number> vec = numbers[n%100];
     for (unsigned i = 0; i < vec.size(); ++i) {
          if (types[vec[i].type] == false && (is_there(vec[i]) == false) && vec[i].type < s) {
               answer.push_back(vec[i]);
               types[vec[i].type] = true;
               find_next(vec[i].num, s);
          }
     }
}

void find_sets(int s) {
     for (unsigned key = 0; key <= 99; ++key) {
          vector<number> vec = numbers[key];
          for (unsigned i = 0; i < vec.size(); ++i) {
               if (vec[i].type < s) {
                    for (int j = 0; j < s; ++j) types.push_back(false);
                    types[vec[i].type] = true;
                    answer.push_back(vec[i]);
                    find_next(vec[i].num, s);
                    answer.clear();
                    types.clear();
               }
          }
     }
}

int main() {
     gen_map();
     find_sets(6);
     return 0;
}
