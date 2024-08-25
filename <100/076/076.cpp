#include<iostream>
#include<vector>
using namespace std;


int partition(int n, int k, vector<vector<int>> &memo){
  if(n < k){
    return 0;
  }
  if(n == k){
    memo[n][k] = 1;
    return memo[n][k];
  }
  if(n < (int)memo.size() && k < (int)memo[0].size() && 0 < memo[n][k]){
    return memo[n][k];
  }

  int nk1 = partition(n, k+1, memo);
  int nkk = 0;
  if(0 < k){
    nkk = partition(n-k, k, memo);
  }

  memo[n][k] = nk1 + nkk;
  return memo[n][k];
}


int main(){
  vector memo(110, vector<int>(110, 0));
  cout << partition(100, 1, memo) - 1 << endl;
  return 0;
}
