#include<iostream>
using namespace std;
using ll = int64_t;


ll triangle(ll n){ return n * (n+1) / 2;}
ll pentagonal(ll n){ return n * (3*n-1) / 2;}
ll hexagonal(ll n){ return n * (2*n-1);}

ll inverse(ll smaller, ll n, ll bigger, ll(*f)(ll)){
  if(smaller + 1 == bigger) return smaller;
  ll mid = (bigger + smaller) / 2;
  ll fm  = f(mid);
  if(fm <= n) return inverse(mid, n , bigger, f);
  else        return inverse(smaller, n, mid, f);
}


bool has_inverse(ll n, ll (*f)(ll)){
  ll smaller = 0, bigger = 1000000000;
  return n == f(inverse(smaller, n, bigger, f));
}
bool is_triangle(ll n){ return has_inverse(n, triangle);}
bool is_pentagonal(ll n){ return has_inverse(n, pentagonal);}


int main(){
  for(int n = 144; ; ++n){
    ll hex_n = hexagonal(n);
    if(is_triangle(hex_n) && is_pentagonal(hex_n)){
      cout << hex_n << endl;
      return 0;
    }
  }

  cout << -1 << endl;
  return 0;
}
