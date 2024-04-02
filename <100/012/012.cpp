#include<iostream>
#include<map>
using namespace std;
using ll = int64_t;

ll upper_limit = 1000000;

ll get_triangle_num(ll n){
  return n * (n+1) / 2;
}

map<ll, ll> prime_factoring(ll n){
  map<ll, ll> m;
  while(n%2 == 0){
    ++m[2];
    n /= 2;
  }

  for(ll i = 3; i*i <= n; i+=2){
    while(n%i == 0){
      ++m[i];
      n /= i;
    }
  }

  if(n > 1) ++m[n];

  return m;
}

ll get_num_divisors(ll n){
  map<ll, ll> m = prime_factoring(n);
  ll num = 1;
  for(auto p : m){
    num *= p.second + 1;
  }

  return num;
}


int main(){
  for(int i = 10; i < upper_limit; ++i){
    ll n = get_triangle_num(i);
    ll num_divisors = get_num_divisors(n);
    if(num_divisors > 500){
      cout << n << endl;
      return 0;
    }
  }

  cout << "No number below " << upper_limit << " has over five hundred divisors." << endl;
  return 0;
}
