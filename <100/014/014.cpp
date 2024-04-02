#include<iostream>
using namespace std;
typedef int64_t ll;
#define MAX 1000000

ll answer, cnt[MAX+10], max_cnt;
const ll upper_limit = MAX;

ll Collatz(ll n){
  if(n < upper_limit && 0 < cnt[n]){
    return cnt[n];
  }

  ll m = n;
  if(m&1) m = 3*m + 1;
  else    m = m/2;
  ll C = Collatz(m)+1;

  if(n < upper_limit) cnt[n] = C;
  return C;
}

int main(){
  cnt[1] = 1;

  for(ll i = 1; i < upper_limit; ++i){
    ll C = Collatz(i);
    if(max_cnt < C){
      max_cnt = C;
      answer = i;
    }
  }

  cout << answer << endl;
  return 0;
}
