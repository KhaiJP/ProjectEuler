#include<iostream>
using namespace std;
using ll = int64_t;
#define MAX 10000000

ll p[MAX], target=1e6;


ll pentagonal_prod(ll n){ return n * (3*n - 1) / 2; }


ll partition(ll n){
  ll val = 0;
  for(ll i = 1; ; ++i){
    ll coeff = i%2 == 0 ? -1 : 1;

    ll k = pentagonal_prod(i);
    if(n-k < 0) return p[n] = val;
    val = (val + coeff * p[n-k]) % target;

    k = pentagonal_prod(-i);
    if(n-k < 0) return p[n] = val;
    val = (val + coeff * p[n-k]) % target;
  }
}


int main(){
  p[0] = 1;
  for(ll n = 1; n <= MAX; ++n){
    if(partition(n) == 0){
      cout << n << endl;
      return 0;
    }
  }

  cout << -1 << endl;
  return 0;
}
