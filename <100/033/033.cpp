#include<iostream>
#include<numeric>
using namespace std;
using P = pair<int, int>;


P calc_proper_fraction(P p){
  int n = p.first, d = p.second;
  if(n == 0 || d == 0){
    return {0, 0};
  }
  int g = gcd(n, d);
  return {n/g, d/g};
}


P pseudo_reduction(P p){
  string ns = to_string(p.first), ds = to_string(p.second);
  if(ns[0] == ds[0]){
    int n = ns[1] - '0';
    int d = ds[1] - '0';
    return calc_proper_fraction({n, d});
  }
  if(ns[0] == ds[1]){
    int n = ns[1] - '0';
    int d = ds[0] - '0';
    return calc_proper_fraction({n, d});
  }
  if(ns[1] == ds[0]){
    int n = ns[0] - '0';
    int d = ds[1] - '0';
    return calc_proper_fraction({n, d});
  }
  if(ns[1] == ds[1]){
    int n = ns[0] - '0';
    int d = ds[0] - '0';
    return calc_proper_fraction({n, d});
  }

  return {101, 100};
}


int main(){
  int final_n = 1, final_d = 1;
  for(int d = 12; d < 100; ++d){
    for(int n = 11; n < d; ++n){
      if(d % 10 == 0 && n % 10 == 0){
        continue;
      }
      P p = {n, d};
      P proper_p = calc_proper_fraction(p);
      P pseudo_p = pseudo_reduction(p);
      if(pseudo_p != p && pseudo_p == proper_p){
        final_n *= proper_p.first;
        final_d *= proper_p.second;
      }
    }
  }

  cout << calc_proper_fraction({final_n, final_d}).second << endl;
}
