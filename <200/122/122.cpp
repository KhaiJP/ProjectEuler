#include<iostream>
#include<set>
#include<queue>
using namespace std;
#define MAX 200

int shortest_chain_lengths[MAX + 10];
set< set<int> > chain_pool[MAX + 10];
priority_queue< pair<int, set<int> > > q;


void Dijkstra_like(){
  shortest_chain_lengths[1] = 1;
  set<int> tmp = {1};
  q.push({-1, tmp});


  while(q.size()){
    int n = -q.top().first;
    set<int> s = q.top().second;
    q.pop();

    if(s.size() > (*chain_pool[n].begin()).size()){
      continue;
    }
    int l = s.size();

    for(auto itr1 = s.begin(); itr1 != s.end(); ++itr1){
      for(auto itr2 = itr1; itr2 != s.end(); ++itr2){
        int a = *itr1, b = *itr2;
        int c = a + b;

        // no need to search
        if(c > MAX){
          break;
        }

        // restrict the newcomer to be greater than any other so as to prune the tree
        if(c <= (int)*s.rbegin()){
          continue;
        }

        // non-shortest is not required
        if(shortest_chain_lengths[c] < l+1){
          continue;
        }

        // new shortest chain
        if(l+1 < shortest_chain_lengths[c]){
          // update the chain length
          shortest_chain_lengths[c] = l + 1;

          // update the chain pool
          s.insert(c);
          auto singleton = {s};
          chain_pool[c] = singleton;
          
          // update the priority queue
          q.push({-c, s});

          s.erase(c);
        }

        // different path could yield different results for n > c
        else{
          s.insert(c);
          // already-found path is not interesting though. 
          if(chain_pool[c].count(s) == 1){
            s.erase(c);
            continue;
          }

          // update the chain pool
          chain_pool[c].insert(s);

          // update the priority queue
          q.push({-c, s});

          s.erase(c);
        }
      }
    }
  }
}


void preprocess(){
  for(int i = 1; i <= MAX; ++i){
    shortest_chain_lengths[i] = MAX+10;

    set<int> s;
    for(int j = 1; j <= i; ++j){
      s.insert(j);
    }

    chain_pool[i].insert(s);
  }
}


int sum_chain_lengths(){
  int total = 0;
  for(int i = 1; i <= MAX; ++i){
    total += shortest_chain_lengths[i] - 1;
  }

  return total;
}


int main(){
  preprocess();
  Dijkstra_like();
  cout << sum_chain_lengths() << endl;
  return 0;
}