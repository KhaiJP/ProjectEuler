#include<iostream>
#include<fstream>
#include<vector>
using namespace std;

int H=80, W=80;

vector<vector<string>> readline(string filename){
  ifstream in(filename);
  cin.rdbuf(in.rdbuf());

  vector<vector<string>> V;
  for(int h = 0; h < H; ++h){
    vector<string> tmpV;
    string longString; cin >> longString;
    string tmpS = "";
    for(auto c : longString){
      if(c == ','){
        tmpV.push_back(tmpS);
        tmpS = "";
      }
      else{
        tmpS += c;
      }
    }
    tmpV.push_back(tmpS);
    V.push_back(tmpV);
  }
  
  return V;
}


vector<vector<int>> to_int(vector<vector<string>> &v){
  int H_ = v.size(), W_ = v[0].size();
  vector V(H_, vector<int>(W_, 0));
  for(int h = 0; h < H_; ++h)for(int w = 0; w < W_; ++w){
    V[h][w] = stoi(v[h][w]);
  }

  return V;
}


int main(){
  string filename = "081.txt";
  vector<vector<string>> tmp = readline(filename);
  vector<vector<int>>      V = to_int(tmp);

  vector dp(H, vector<int>(W, 1e9));
  dp[0][0] = V[0][0];
  for(int h = 0; h < H; ++h)for(int w = 0; w < W; ++w){
    if(w+1 < W) dp[h][w+1] = min(dp[h][w+1], dp[h][w] + V[h][w+1]);
    if(h+1 < H) dp[h+1][w] = min(dp[h+1][w], dp[h][w] + V[h+1][w]);
  }

  cout << dp[H-1][W-1] << endl;
  return 0;
}
