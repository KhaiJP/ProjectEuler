#include<iostream>
#include<set>
#include<vector>
#include<tuple>
#include<algorithm>
#include<numeric>
using namespace std;
using TP = tuple<int, int, int>;


const int max_N = 1e4, max_binary = 101;
int answer;


// smaller*smaller <= target < bigger*bigger
int findSqrt(int smaller, int target, int bigger){
  if(smaller + 1 == bigger) return smaller;
  int mid = (smaller + bigger) / 2;
  int m2 = mid * mid;
  if(m2 <= target) return findSqrt(mid, target, bigger);
  else             return findSqrt(smaller, target, mid);
}


TP findFirst(int n){
  int s = findSqrt(0, n, max_binary);
  TP t = make_tuple(n, s, n-s*s);
  return t;
}


int findPeriod_(vector<TP> &V, TP t){
  auto itr = find(V.begin(), V.end(), t);
  int p = distance(itr, V.end());
  return p;
}


int findPeriod(TP tk, vector<TP> &V, set<TP> &S){
  // check supplemental.md to see the meanings of variables and the strategy.
  auto [nk, bk, dk] = tk;
  int sk = findSqrt((int)0, nk, max_binary) + bk;
  int ak = sk / dk;
  int ck = dk * ak - bk;

  int dk1 = nk - ck*ck;
  int hcf = gcd(dk, dk1);
  dk /= hcf,  dk1 /= hcf;

  int nk1 = dk * dk * nk;
  int bk1 = dk * ck;
  TP tk1 = make_tuple(nk1, bk1, dk1);
  if(S.count(tk1) == 1) return findPeriod_(V, tk1);
  
  S.insert(tk1);
  V.push_back(tk1);
  return findPeriod(tk1, V, S);
}


int main(){
  for(int i = 2; i <= max_N; ++i){
    TP t1 = findFirst(i);
    auto [_1, _2, d] = t1;
    // d == 0  <==>  i is squared number such as 4 or 9
    if(d == 0) continue;

    vector<TP> V;
    set<TP> S;
    V.push_back(t1);
    S.insert(t1);
    int p = findPeriod(t1, V, S);
    answer += p&1;
  }

  cout << answer << endl;
  return 0;
}
