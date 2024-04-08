#include<iostream>
#include<algorithm>
using namespace std;
using ll = int64_t;

string S = "0123456789";
ll answer, primes[7] = {2, 3, 5, 7, 11, 13, 17};


bool is_ok(string S){
  for(int i = 0; i < 7; ++i){
    string tmp = "";
    for(int j = 1; j <= 3; ++j){
      tmp += S[i+j];
    }
    ll tmp_l = stol(tmp);
    if(tmp_l % primes[i] != 0){
      return false;
    }
  }

  return true;
}

int main(){
  do{
    if(is_ok(S)){
      answer += stol(S);
    }
  }while(next_permutation(S.begin(), S.end()));

  cout << answer << endl;
  return 0;
}