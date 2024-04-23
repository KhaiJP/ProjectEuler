#include<iostream>
#include<fstream>
#include<vector>
#include<queue>
#include<tuple>
using namespace std;
using TP = tuple<int, int, int>;

int H=80, W=80;
int DH[] = {-1, 1, 0};
int DW[] = { 0, 0, 1};


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


int Dijkstra(vector<vector<int>> &V){
  priority_queue<TP> q;
  vector dp(H, vector<int>(W, 1e9));
  for(int h = 0; h < H; ++h){
    dp[h][0] = V[h][0];
    TP t = make_tuple(-dp[h][0], h, 0);
    q.push(t);
  }

  while(q.size()){
    auto [d, h, w] = q.top();
    d = -d;
    q.pop();

    if(d > dp[h][w]) continue;

    for(int k = 0; k < 3; ++k){
      int nh = h + DH[k];
      int nw = w + DW[k];

      if(nh < 0 || H <= nh || nw < 0 || W <= nw) continue;
      if(dp[nh][nw] <= dp[h][w] + V[nh][nw]) continue;
      dp[nh][nw] = dp[h][w] + V[nh][nw];
      TP t = make_tuple(-dp[nh][nw], nh, nw);
      q.push(t);
    }
  }

  int min_d = 1e9;
  for(int h = 0; h < H; ++h) min_d = min(min_d, dp[h][W-1]);
  return min_d;
}


int main(){
  string filename = "082.txt";
  vector<vector<string>> tmp = readline(filename);
  vector<vector<int>>      V = to_int(tmp);

  cout << Dijkstra(V) << endl;
  return 0;
}
