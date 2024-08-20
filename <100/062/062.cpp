#include<iostream>
#include<algorithm>
#include<map>
#include<set>
using namespace std;
using ll = int64_t;


ll solve(ll upper_limit){
  map<string, ll> count_memo, minimum_memo;
  for(ll i = 346; i < upper_limit; ++i){
    ll cubed = i * i * i;
    string s = to_string(cubed);
    sort(s.begin(), s.end());
    ++count_memo[s];
    if(minimum_memo.count(s) == 0){
      minimum_memo[s] = cubed;
    }
  }

  set<ll> candidates;
  for(auto p : count_memo)if(p.second == 5){
    candidates.insert(minimum_memo[p.first]);
  }

  if(candidates.empty()){
    return -1;
  }
  return *candidates.begin();
}


int main(){
  ll upper_limit = 100000;
  cout << solve(upper_limit) << endl;
  return 0;
}
