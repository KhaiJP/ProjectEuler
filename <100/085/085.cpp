#include<iostream>
using namespace std;


int area(int m, int n){
  int tn = n * (n+1) / 2;
  int tm = m * (m+1) / 2;
  return tn * tm;
}


int main(){
  int minimum = 1e9, target = 2e6;
  int answer;

  for(int m = 1; m <= 200; ++m)for(int n = m; n <= 200; ++n){
    int a = area(m, n);
    int gap = abs(a - target);
    if(gap < minimum){
      minimum = gap;
      answer = m * n;
    }
  }

  cout << answer << endl;
  return 0;
}
