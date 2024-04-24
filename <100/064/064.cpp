#include<iostream>
#include<set>
#include<vector>
#include<tuple>
#include<algorithm>
#include<numeric>
using namespace std;
using ll = int64_t;
using TP = tuple<ll, ll, ll>;


const ll max_N = 1e4, max_binary = 100;
ll answer;


// smaller*smaller <= target < bigger*bigger
ll findSqrt(ll smaller, ll target, ll bigger){
  if(smaller + 1 == bigger) return smaller;
  ll mid = (smaller + bigger) / 2;
  ll m2 = mid * mid;
  if(m2 <= target) return findSqrt(mid, target, bigger);
  else             return findSqrt(smaller, target, mid);
}


TP findFirst(ll n){
  ll s = findSqrt(0, n, max_binary);
  ll d1 = n - s*s;
  ll n1 = n;
  ll b1 = s;
  TP t = make_tuple(n1, b1, d1);
  return t;
}


ll findPeriod_(vector<TP> &V, TP t){
  auto itr = find(V.begin(), V.end(), t);
  ll p = distance(itr, V.end());
  return p;
}


ll findPeriod(TP tk, vector<TP> &V, set<TP> &S){
  auto [nk, bk, dk] = tk;
  ll sk = findSqrt((ll)0, nk, max_binary) + bk;
  ll ak = sk / dk;
  ll ck = dk*ak - bk;

  ll dk1 = nk - ck*ck;
  ll hcf = gcd(dk, dk1);
  dk /= hcf,  dk1 /= hcf;

  ll nk1 = dk * dk * nk;
  ll bk1 = dk * ck;
  TP tk1 = make_tuple(nk1, bk1, dk1);
  if(S.count(tk1) == 1) return findPeriod_(V, tk1);
  
  S.insert(tk1);
  V.push_back(tk1);
  return findPeriod(tk1, V, S);
}


int main(){
  for(ll i = 2; i <= max_N; ++i){
    TP t1 = findFirst(i);
    auto [_1, _2, d] = t1;
    // d == 0  <==>  i is squared number such as 4 or 9
    if(d == 0) continue;
    vector<TP> V;
    set<TP> S;
    V.push_back(t1);
    S.insert(t1);
    ll p = findPeriod(t1, V, S);
    answer += p&1;
  }

  cout << answer << endl;
  return 0;
}