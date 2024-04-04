#include<iostream>
#include<fstream>
using namespace std;
#define MAX 100

int H = MAX, answer, dp[MAX+5][MAX+5], F[MAX+5][MAX+5];
string filename = "067.txt";

int main(){
  ifstream in(filename);
  cin.rdbuf(in.rdbuf());

  for(int h = 0; h < H; ++h){
    for(int c = 0; c <= h; ++c){
      cin >> F[h][c];
    }
  }

  dp[0][0] = F[0][0];
  for(int h = 0; h < H-1; ++h){
    for(int c = 0; c <= h; ++c){
      for(int d = 0; d <= 1; ++d){
        int c_ = c + d;
        if(h+1 < c_) continue;
        dp[h+1][c_] = max(dp[h+1][c_], dp[h][c] + F[h+1][c_]);
      }
    }
  }

  for(int c = 0; c < H; ++c) answer = max(answer, dp[H-1][c]);

  cout << answer << endl;
  return 0;
}
