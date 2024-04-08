#include<iostream>
using namespace std;
using ll = int64_t;

const ll mod = 1e10;
ll answer;

ll naive_pow(ll base, ll power){
  if(power == 1) return base % mod;
  return base * naive_pow(base, power-1) % mod;
}

int main(){
  for(ll i = 1; i <= 1000; ++i){
    answer = (answer + naive_pow(i, i)) % mod;
  }

  cout << answer << endl;
}