#include<iostream>
#include<tuple>
#include<numeric>
using namespace std;
using TP = tuple<int, int, int>;
#define MAX 1500000

const int max_L = MAX;
int answer, cnt[MAX+10];

TP primitivePythagoreanGenerator(int n, int m){
  if(n <= m || gcd(n, m) > 1 || (n&1)^(m&1) == 0){
    return make_tuple(-1, -1, -1);
  }
  int a = n*n - m*m, b = 2*n*m, c = n*n + m*m;
  if(b < a) swap(a, b);

  return make_tuple(a, b, c);
}


int main(){
  for(int n = 2; n*n < max_L; ++n){
    for(int m = 1; m < n; ++m){
      auto [a, b, c] = primitivePythagoreanGenerator(n, m);
      if(a < 0) continue;
      int L = a + b + c;
      int buf = L;
      while(L <= max_L){
        ++cnt[L];
        L += buf;
      }
    }
  }

  for(int l = 3; l <= max_L; ++l)if(cnt[l] == 1){
    ++answer;
  }

  cout << answer << endl;
  return 0;
}
