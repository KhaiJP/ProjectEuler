#include<iostream>
using namespace std;

const int upper_limit = 10000000;
int answer, factorial_of[10];

int eval_factorial(int n){
  if(n == 1 || n == 0) return 1;
  return n * eval_factorial(n-1);
}

bool is_ok(int n){
  int buf = n, s = 0;
  while(n){
    s += factorial_of[n%10];
    n /= 10;
  }

  return s == buf;
}


int main(){
  for(int i = 0; i < 10; ++i) factorial_of[i] = eval_factorial(i);

  for(int i = 10; i < upper_limit; ++i){
    if(is_ok(i)) answer += i;
  }

  cout << answer << endl;
  return 0;
}