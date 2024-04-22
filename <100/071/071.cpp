#include<iostream>
#include<set>
#include<numeric>
using namespace std;
using P = pair<int, int>;


bool compare(P p1, P p2){
  int n1 = p1.first, d1 = p1.second;
  int n2 = p2.first, d2 = p2.second;

  return n1*d2 >= n2*d1;
}


int main(){
  set<P, decltype(compare)*> S(compare);
  const int max_d = 1e6;

  for(int d = 9; d <= max_d; ++d){
    int n = 3*d / 7;
    while(n > 1){
      if(gcd(n, d) == 1) break;
      --n;
    }

    if(n > 0) S.insert({n, d});
  }


  if(S.size() == 0) cout << -1 << endl;
  else cout << S.begin()->first << endl;
  return 0;
}
