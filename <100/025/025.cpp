#include<iostream>
using namespace std;
#define MAX 1000

// Fib[i][j] : j-th digit of F_{n-2+i}. all the history other than last 2 terms are discarded
int Fib[3][MAX + 10], carry[MAX + 10];
// the Fibonacci seq diverges O(1.6^n) (1.6 is rough value of the golden ratio).
// log10(1.6) ~ 0.2 -> Fibonacci would achieve 1000-digits around 5000, at least no greater than 100,000
const int target_digit = MAX, max_loop = 10 * MAX;

void update_Fib(){
  for(int d = 0; d < target_digit+10; ++d){
    Fib[2][d]  = Fib[1][d] + Fib[0][d] + carry[d];
    carry[d+1] = Fib[2][d] / 10;
    Fib[2][d]  = Fib[2][d] % 10;
    // make F_{n-2} <- F_{n-1} and F_{n-1} <- F_n for next loop
    Fib[0][d]  = Fib[1][d];
    Fib[1][d]  = Fib[2][d];
  }

  return ;
}

bool is_ok(){
  return Fib[2][target_digit - 1] > 0;
}

int main(){
  Fib[0][0] = Fib[1][0] = 1;

  // index -> F_index
  int index = 2;
  while(index < max_loop){
    ++index;
    update_Fib();
    if(is_ok()){
      cout << index << endl;
      return 0;
    }
  }
}