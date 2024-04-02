#include<iostream>
using namespace std;
// using ll = int64_t;
typedef int64_t ll;
#define SIZE 20

ll L = SIZE, dp[SIZE+5][SIZE+5];

int main(){
  dp[0][0] = 1;
  
  for(ll i = 0; i <= L; ++i)for(ll j = 0; j <= L; ++j){
    dp[i+1][j] += dp[i][j];
    dp[i][j+1] += dp[i][j];
  }

  cout << dp[L][L] << endl;
  return 0;
}
