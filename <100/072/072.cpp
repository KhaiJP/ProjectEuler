#include<iostream>
#include<numeric>
using namespace std;


int main(){
  const int max_d = 12000;
  int answer = 0;

  // naive brute-force;
  for(int d = max_d; d > 2; --d){
    // n/d < 1/2  <==> n < d/2  ==> max_n = d/2 - 1if d%2 == 0 else d/2.
    int n = d/2 - 1 + (d%2);
    while(3*n > d){
      answer += gcd(n, d) == 1;
      --n;
    }
  }

  cout << answer << endl;
  return 0;
}
