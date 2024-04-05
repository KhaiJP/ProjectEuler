#include<iostream>
using namespace std;
#define MAX_PRIME 2002000

const int max_ab = 1000;
int answer_a, answer_b, answer, longest_streak;
bool isPrime[MAX_PRIME];

void Eratosthenes(){
  for(int i = 2; i < MAX_PRIME; ++i) isPrime[i] = true;
  for(int i = 2; i < MAX_PRIME; ++i)if(isPrime[i]){
    for(int j = 2*i; j < MAX_PRIME; j += i) isPrime[j] = false;
  }
}

int f(int n, int a, int b){
  return n*n + a*n + b;
}

int eval_streak(int a, int b){
  int streak = 0;
  for(int n = 0; ; ++n){
    int fn = f(n, a, b);
    if(fn < 0 || !isPrime[fn]) break;
    ++streak;
  }

  return streak;
}


int main(){
  Eratosthenes();

  for(int a = -max_ab; a <= max_ab; ++a){
    for(int b = -max_ab; b <= max_ab; ++b){
      int streak = eval_streak(a, b);
      if(longest_streak < streak){
        longest_streak = streak;
        answer_a = a;
        answer_b = b;
        answer = a*b;
      }
    }
  }

  cout << answer_a << ' ' << answer_b << ' ' << answer << ' ' << longest_streak << endl;
  return 0;
}