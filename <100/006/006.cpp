#include<iostream>
using namespace std;

int sum_linear(int t){
  return t*(t+1)/2;
}

int sum_square(int t){
  return t*(t+1)*(2*t+1)/6;
}

int solve(){
  int s2 = sum_square(100);
  int s  = sum_linear(100);
  return s*s - s2;
}


int main(){
  cout << solve() << endl;
  return 0;
}
