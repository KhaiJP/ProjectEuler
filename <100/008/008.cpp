#include<iostream>
#include<fstream>
using namespace std;
using ll = int64_t;

ll N, num_digits = 13;
string S, line, filename = "008.txt";

ll solve(){
  ll Max = 0;

  for(int i = 0; i < N-num_digits; ++i){
    ll m = 1;
    for(int d = 0; d < num_digits; ++d) m *= S[i+d] - '0';
    Max = max(Max, m);
  }

  return Max;
}

int main(){
  ifstream file(filename);

  while( getline(file, line) ){
    S += line;
  }

  N = S.size();
  cout << solve() << endl;
  return 0;
}
