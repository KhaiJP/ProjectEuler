#include<iostream>
#include<queue>
using namespace std;


int get_d(int n, queue<int> &q, int l = 0, int ans=1){
  if(q.empty()){
    return ans;
  }

  string sn = to_string(n);
  int sl = sn.size();
  int fr = q.front();
  if(fr <= l + sl){
    q.pop();
    for(int i = 0; i < sl; ++i){
      if(l + i + 1 == fr){
        int d = sn[i] - '0';
        return get_d(n+1, q, l+sl, d*ans);
      }
    }
  }

  return get_d(n+1, q, l+sl, ans);
}


int main(){
  queue<int> q;
  q.push(1); q.push(10); q.push(100); q.push(1000); q.push(10000); q.push(100000); q.push(1000000);
  cout << get_d(1, q) << endl;
  return 0;
}
