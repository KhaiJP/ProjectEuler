#include<iostream>
#include<vector>
#include<set>
using namespace std;
#define K 12000
#define MAX 24000


int min_prod_sum[K+10];


int sum(vector<int> &v){
  int r = 0;
  for(int a : v) r += a;
  return r;
}


int prod(vector<int> &v){
  int r = 1;
  for(int a : v) r *= a;
  return r;
}


void register_(vector<int> &v){
  int p = prod(v), s = sum(v);
  int delta = p - s;
  if(delta < 0) return ;

  int k = (int)v.size() + delta;
  if(k <= (int)K) min_prod_sum[k] = min(min_prod_sum[k], p);

  return ;
}


void dfs(vector<int> &v){
  int tmp_size = v.size();
  if(tmp_size > K) return ;

  int r = 2;
  if(tmp_size > 0){
    register_(v);
    int r = v.back();
  }

  int p = prod(v);

  for(int i = r; p*i <= MAX; ++i){
    int p = prod(v) * i;
    v.push_back(i);
    dfs(v);
    v.pop_back();
  }
}


int main(){
  for(int k = 2; k <= K; ++k) min_prod_sum[k] = 1e9;

  vector<int> v;
  dfs(v);

  set<int> s;
  int answer = 0;
  for(int k = 2; k <= K; ++k) s.insert(min_prod_sum[k]);

  for(auto a : s) answer += a;

  cout << answer << endl;
  return 0;
}
