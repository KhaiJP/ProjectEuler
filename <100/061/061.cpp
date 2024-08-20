#include<iostream>
#include<algorithm>
#include<vector>
using namespace std;
using GeoVect = vector<int>;
using Chain = vector<int>;

int triangle_prod(int n){ return n * (n+1) / 2; }
int squared_prod(int n){ return n * n; }
int pentagonal_prod(int n){ return n * (3*n-1) / 2; }
int hexagonal_prod(int n){ return n * (2*n-1); }
int heptagonal_prod(int n){ return n * (5*n-3) / 2; }
int octagonal_prod(int n){ return n * (3*n-2); }


GeoVect eval_geo_vect(int (*f)(int)){
  vector<int> v;
  for(int i = 1; ; ++i){
    int t = f(i);
    if(t < 1000) continue;
    if(9999 < t) return v;
    v.push_back(t);
  }
}


vector<GeoVect> eval_geo_vects(){
  auto tris = eval_geo_vect(triangle_prod);
  auto sqrs = eval_geo_vect(squared_prod);
  auto pens = eval_geo_vect(pentagonal_prod);
  auto hexs = eval_geo_vect(hexagonal_prod);
  auto heps = eval_geo_vect(heptagonal_prod);
  auto octs = eval_geo_vect(octagonal_prod);
  return {tris, sqrs, pens, hexs, heps, octs};
}


bool is_chain(int pre, int now){
  if(pre == 0){
    return true;
  }
  int tail = pre % 100;
  int head = now / 100;
  // cout << tail << ' ' << head << '\n';
  return tail == head;
}


void dfs(vector<int> &v_idx, vector<GeoVect> &geo_vects, vector<Chain> &chains, Chain &chain, int n = 0, int pre = 0){
  if(n == (int)v_idx.size()){
    if(is_chain(chain[n-1], chain[0])){
      chains.push_back(chain);
    }
    return ;
  }
  GeoVect &gv = geo_vects[v_idx[n]];
  for(auto a : gv){
    if(is_chain(pre, a)){
      chain.push_back(a);
      dfs(v_idx, geo_vects, chains, chain, n+1, a);
      chain.pop_back();
    }
  }
}


int collect(vector<Chain> &chains){
  int result = 0;
  for(auto chain : chains){
    for(auto a : chain){
      result += a;
    }
  }

  return result;
}


int main(){
  vector<GeoVect> geo_vects = eval_geo_vects();
  vector<int> v_idx_(geo_vects.size()-1);
  for(int i = 0; i < (int)geo_vects.size(); ++i){
    v_idx_[i] = i+1;
  }

  vector<Chain> chains;
  do{
    vector<int> v_idx = {0};
    for(auto a : v_idx_) v_idx.push_back(a);

    Chain chain;
    dfs(v_idx, geo_vects, chains, chain);
  }while(next_permutation(v_idx_.begin(), v_idx_.end()));

  cout << collect(chains) << endl;
  return 0;
}
