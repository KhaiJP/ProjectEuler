#include<iostream>
#include<fstream>
#include<sstream>
#include<queue>
#include<vector>
#include<map>
using namespace std;
using P = pair<int, int>;

int total, L=40, parent[45];
bool spanned[45];
vector<int> E[45];
map<P, int> W;


void readCSV(string filename){
  string line, val;
  ifstream file(filename);

  int me = 0;
  while(getline(file, line)){
    istringstream i_stream(line);
    int you = -1;
    while(getline(i_stream, val, ',')){
      ++you;
      if(val == "-" || val == "\n") continue;
      E[me].push_back(you);
      int num = stoi(val);
      W[{me, you}] = num;
      total += num;
    }
    ++me;
  }

  total /= 2;
}


int leader_of(int a){
  if(parent[a] == a) return a;
  int p = leader_of(parent[a]);
  parent[a] = p;
  return p;
}


bool merge(int a, int b){
  int leader_a = leader_of(a), leader_b = leader_of(b);
  if(leader_a == leader_b) return false;
  parent[leader_a] = leader_b;
  return true;
}


int Kruskal(){
  for(int i = 0; i < L; ++i) parent[i] = i;


  priority_queue<P> q;
  for(auto v : E[0]) q.push( { -W[{0, v}], v} );
  spanned[0] = true;

  int spanning_cost = 0;

  while(!q.empty()){
    int w = -q.top().first, u = q.top().second;
    q.pop();
    
    if(spanned[u]) continue;

    for(auto v : E[u])if(!spanned[v]){
      q.push( {-W[{u, v}], v} );
    }
    spanning_cost += w * (merge(0, u));
    spanned[u] = true;
  }

  return spanning_cost;
}


int main(){
  string filename = "107.txt";
  readfile(filename);

  cout << total - Kruskal() << endl;
  return 0;
}
