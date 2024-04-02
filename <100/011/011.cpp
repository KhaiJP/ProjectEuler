#include<iostream>
#include<fstream>
using namespace std;

int DR[] = {0, 1, 1,  1};
int DC[] = {1, 0, 1, -1};

int F[25][25], H=20, W=20, answer;
string filename = "011.txt";

int check(int r, int c){
  int Max = 0;
  for(int k = 0; k < 4; ++k){
    int tmp = 1;
    if( r + 3*DR[k] < 0 ) continue;
    if( c + 3*DC[k] < 0 ) continue;
    if( r + 3*DR[k] >= H ) continue;
    if( c + 3*DC[k] >= W ) continue;
    for(int d = 0; d < 4; ++d) tmp *= F[r+d*DR[k]][c+d*DC[k]];
    Max = max(Max, tmp);
  }

  return Max;
}


int main(){
  ifstream in(filename);
  cin.rdbuf(in.rdbuf());

  for(int i = 0; i < H; ++i){
    for(int j = 0; j < W; ++j){
      cin >> F[i][j];
    }
  }

  for(int i = 0; i < H; ++i){
    for(int j = 0; j < W; ++j){
      answer = max(answer, check(i, j));
    }
  }

  cout << answer << endl;
  return 0;
}
