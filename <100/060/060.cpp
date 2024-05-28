#include<iostream>
#include<set>
#include<vector>
#include<algorithm>
#include<time.h>
using namespace std;
using ll = int64_t;


bool isPrime[20000000];
set<ll> primes, sums, for_check;


void Eratosthenes(){
  for(ll i = 2; i < 20000000; ++i){
    isPrime[i] = true;
  }
  for(ll i = 2; i < 20000000; ++i)if(isPrime[i]){
    for(ll j = 2*i; j < 20000000; j+=i){
      isPrime[j] = false;
    }
    if(i < 9999) primes.insert(i);
    for_check.insert(i);
  }
}


bool check(vector<ll> &v, ll p){
  string ps = to_string(p);
  for(ll q : v){
    if(q == 0) continue;
    string qs = to_string(q);
    
    ll pq = stol(ps+qs);
    if(pq < 20000000 && !isPrime[pq]) return false;
    for(auto p_ : for_check){
      if(pq < p_*p_) break;
      if(pq%p_ == 0) return false;
    }
    for_check.insert(pq);

    ll qp = stol(qs+ps);
    if(qp < 20000000 && !isPrime[qp]) return false;
    for(auto p_ : for_check){
      if(qp < p_*p_) break;
      if(qp%p_ == 0) return false;
    }
    for_check.insert(qp);
  }

  return true;
}


void dfs(vector<ll> &v){
  if((int)v.size() == 6){
    ll sum_ = 0;
    for(ll p : v) sum_ += p;
    sums.insert(sum_);
    return ;
  }

  ll l = v.back();
  auto itr = primes.upper_bound(l);
  while(itr != primes.end()){
    ll p = *itr;
    ++itr;
    if(!check(v, p)) continue;

    v.push_back(p);
    dfs(v);
    v.pop_back();
  }
}


int main(){
  clock_t start = clock();
  Eratosthenes();

  vector<ll> empty_;
  empty_.push_back(0);

  dfs(empty_);
  clock_t end = clock();
  const double time = static_cast<double>(end - start) / CLOCKS_PER_SEC;
  cout << time << " sec" <<endl;

  cout << *sums.begin() << endl;
  return 0;
}
