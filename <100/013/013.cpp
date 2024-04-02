#include<iostream>
#include<fstream>
using namespace std;

// F[i][d]: the d-th digit of the number of i-th row. F[H][d] is the carry.
// R[d]: the d-th digit of the addition
int H = 100, W = 50, F[110][60], R[60];
string filename = "013.txt", answer;

int main(){
  ifstream in(filename); 
  cin.rdbuf(in.rdbuf());

  for(int i = 0; i < H; ++i){
    for(int j = 1; j <= W; ++j){
      char c; cin >> c;
      F[i][W-j] = c - '0';
    }
  }

  for(int d = 0; d < W; ++d){
    for(int i = 0; i <= H; ++i){
      R[d] += F[i][d];
    }
    F[H][d+1] = R[d]/10;
    R[d] = R[d] % 10;
  }

  answer = to_string(F[H][W]);
  for(int d = W-1; d >= 0 && (int)answer.size() < 10; --d){
    answer += to_string(R[d]);
  }

  cout << answer << endl;
  return 0;
}

