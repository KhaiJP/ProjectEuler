#include<iostream>
using namespace std;

int dp[210], coins[] = {1, 2, 5, 10, 20, 50, 100, 200};
const int target = 200, N = 8;
int main(){
  dp[0] = 1;
  for(int i = 0; i < N; ++i){
    for(int m = 0; m < target; ++m){
      int nm = m + coins[i];
      if(nm > target) break;
      dp[nm] += dp[m];
    }
  }

  cout << dp[target] << endl;
  return 0;
}