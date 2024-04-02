#include<iostream>
using namespace std;

const int upper_limit = 4000000;
int answer;

int main(){
  int Fib_2 = 1, Fib_1 = answer = 2;
  for(; ;){
    int Fib = Fib_1 + Fib_2;
    if(Fib > upper_limit) break;
    if((Fib&1) == 0) answer += Fib;
    Fib_2 = Fib_1;
    Fib_1 = Fib;
  }

  cout << answer << endl;
  return 0;
}
