#include<iostream>
#include<set>
#include<vector>
#include<tuple>
#include<algorithm>
#include<numeric>
#include<time.h>
using namespace std;
using ll   = int64_t;
using i128 = __int128_t;
using P    = pair<i128, i128>;
using TP   = tuple<i128, i128, i128>;


i128 max_D=1000, max_binary=35;


// smaler*smaler <= target < bigger*bigger
i128 findSqrt(i128 smaler, i128 target, i128 bigger){
  if(smaler + 1 == bigger) return smaler;
  i128 mid = (smaler + bigger) / 2;
  i128 m2 = mid * mid;
  if(m2 <= target) return findSqrt(mid, target, bigger);
  else             return findSqrt(smaler, target, mid);
}


TP findFirst(i128 n){
  i128 s = findSqrt(0, n, max_binary);
  TP t = make_tuple(n, s, n-s*s);
  return t;
}


i128 findPeriod_(vector<TP> &V, TP t){
  auto itr = find(V.begin(), V.end(), t);
  i128 p = distance(itr, V.end());
  return p;
}


void find_continued_fraction(TP tk, vector<i128> &V, set<TP> &S){
  // check supplemental.md to see the meanings of variables and the strategy.
  auto [nk, bk, dk] = tk;
  i128 sk = findSqrt((i128)0, nk, max_binary) + bk;
  i128 ak = sk / dk;
  i128 ck = dk * ak - bk;

  i128 dk1 = nk - ck*ck;
  i128 hcf = gcd(dk, dk1);
  dk /= hcf,  dk1 /= hcf;

  i128 nk1 = dk * dk * nk;
  i128 bk1 = dk * ck;
  TP tk1 = make_tuple(nk1, bk1, dk1);
  
  if(S.count(tk1) == 1) return ;
  
  V.push_back(ak);
  S.insert(tk1);
  find_continued_fraction(tk1, V, S);
}


P reproduce_continued_fraction(vector<i128> &V){
  i128 n = 0, d = 1;
  i128 N = V.size();

  for(i128 i = N-1; i >= 0; --i){
    i128 tmp = d;
    d = d*V[i] + n;
    n = tmp;
    i128 hcf = gcd(n, d);
    n /= hcf, d /= hcf;
  }

  swap(n, d);
  return {n, d};
}


P even_case(vector<i128> &V){
  return reproduce_continued_fraction(V);
}


P odd_case(vector<i128> &V, i128 D){
  auto [x, y] = reproduce_continued_fraction(V);
  i128 X = x*x + D*y*y, Y = 2*x*y;
  return {X, Y};
}


ll solve(){
  ll answer = 0;
  i128 max_x  = 0;
 
  for(i128 D = 2; D <= max_D; ++D){
    TP t0 = findFirst(D);
    auto [_, a, d] = t0;
    if(d == 0) continue;

    vector<i128> V;
    set<TP> S;
    V.push_back(a);
    S.insert(t0);

    find_continued_fraction(t0, V, S);

    i128 period = V.size();
    P p;
    if(period % 2 == 0) p = even_case(V);
    else                p = odd_case(V, D);
    i128 x = p.first;
    if(max_x < x){
      max_x = x;
      answer = D;
    }
  }

  return answer;
}


int main(){
  clock_t start = clock();
  ll answer = solve();
  clock_t end = clock();
  const double time = static_cast<double>(end - start) / CLOCKS_PER_SEC;

  cout << answer << endl;
  cout << time << " sec" << endl;
}
