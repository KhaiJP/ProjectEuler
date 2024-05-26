#include<iostream>
#include<set>
#include<vector>
using namespace std;


vector<int> power_vector(int a, int b){
  vector<int> res(205, 0), carry(205, 0);
  res[0] = 1;
  for(int _ = 0; _ < b; ++_){
    for(int k = 0; k <= 200; ++k){
      res[k]  = a*res[k] + carry[k];
      carry[k+1] = res[k] / 10;
      res[k]  = res[k] % 10;
    }
  }

  return res;
}


int main(){
  set<vector<int>> S;
  for(int a = 2; a <= 100; ++a){
    for(int b = 2; b <= 100; ++b){
      vector<int> v = power_vector(a, b);
      S.insert(v);
    }
  }


  int answer = S.size();
  cout << answer << endl;
  return 0;
}
