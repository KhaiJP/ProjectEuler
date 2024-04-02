#include<iostream>
#include<map>
using namespace std;
using ll = int64_t;

ll answer = 1;
map<ll, ll> m;

void div(ll n){
  map<ll, ll> tmp;
  while(n%2 == 0){
    ++tmp[2];
    n /= 2;
  }

  for(ll i = 3; i*i <= n; i+=2){
    while(n%i == 0){
      ++tmp[i];
      n /= i;
    }
  }
  if(n > 1) ++tmp[n];

  for(auto p : tmp){
    ll prime = p.first, power = p.second;
    m[prime] = max(m[prime], power);
  }

  return ;
}


int main(){
  for(ll i = 2; i <= 20; ++i){
    div(i);
  }
  for(auto p : m){
    for(ll i = 0; i < p.second; ++i) answer *= p.first;
  }

  cout << answer << endl;
  return 0;
}
