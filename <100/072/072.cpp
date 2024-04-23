#include<iostream>
#include<set>
#include<numeric>
#include<time.h>
using namespace std;


int main(){
  clock_t start = clock();

  set<pair<int, int>> S;
  const int max_d = 12000;

  // naive brute-force; takes 5 secs, not super fast but enough
  for(int d = max_d; d > 2; --d){
    // n/d < 1/2  <==> n < d/2  ==> max_n = d/2 - 1if d%2 == 0 else d/2.
    int n = d/2 - 1 + (d%2);
    while(3*n > d){
      if(gcd(n, d) == 1) S.insert({n, d});
      --n;
    }
  }

  clock_t end = clock();
  const double time = static_cast<double>(end - start) / CLOCKS_PER_SEC;

  cout << S.size() << endl;
  cout << time << " sec" << endl;
  return 0;
}
