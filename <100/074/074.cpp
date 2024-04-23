#include<iostream>
#include<set>
#include<time.h>
using namespace std;
using ll = int64_t;

ll factorial(ll n){
  if(n <= 1) return 1;
  else return n * factorial(n-1);
}


ll digitFactorialSum(ll n){
  if(n == 0) return 0;
  ll r = factorial(n%10);
  return r + digitFactorialSum(n/10);
}


ll evalLoopSize(ll n){
  set<ll> S;
  while(S.count(n) == 0){
    S.insert(n);
    n = digitFactorialSum(n);
  }

  return S.size();
}


int main(){
  clock_t start = clock();

  ll upper_limit = 1e6;
  ll answer = 0;

  // naive brute-force without memorization; 10 sec to execute
  for(ll n = 1; n < upper_limit; ++n){
    ll loop_size = evalLoopSize(n);
    answer += loop_size == 60;
  }

  clock_t end = clock();
  const double time = static_cast<double>(end - start) / CLOCKS_PER_SEC;

  cout << answer << endl;
  cout << time << " sec" << endl;
  return 0;
}