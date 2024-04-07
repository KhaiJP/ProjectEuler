#include<iostream>
#include<algorithm>
using namespace std;
using ll = int64_t;

// if a is 5-digit number, string(a) + string(2*a) is 10- or 11-digit number
// -> upper limit is 9999. 9999 is not pandigital, uppper limit can be reduced to 9876
const ll upper_limit = 9876;
ll answer;
const string reference = "123456789";

bool is_pandigital(string s){
  sort(s.begin(), s.end());
  return s == reference;
}

void check(int n){
  string tmp = "";
  ll streak = 0;
  while(tmp.size() < reference.size()){
    ++streak;
    tmp += to_string(n*streak);
  }

  if(tmp.size() > reference.size()) return ;
  if(streak > 1 && is_pandigital(tmp)){
    ll tmp_l = stol(tmp);
    if(answer < tmp_l) answer = tmp_l;
  }
}


int main(){
  for(int i = 1; i <= upper_limit; ++i){
    check(i);
  }

  cout << answer << endl;
  return 0;
}