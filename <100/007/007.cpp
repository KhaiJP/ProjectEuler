#include<iostream>
using namespace std;

// expecting 10001st prime number appears below 20*10001
// as frequency of prime number appearance decreases at the speed of 1/log(x)
// and 1/log(20*10001) = 1 / 12 -> roughly up to 20000th primes appear below 20*10001
const int upper_limit = 20*10001;
bool isPrime[20*10001];
int cnt, answer;

void Eratosthenes(){
  for(int i = 2; i < upper_limit; ++i) isPrime[i] = true;
  
  for(int i = 2; i < upper_limit; ++i)if(isPrime[i]){
    cnt += 1;
    if(cnt == 10001){
      answer = i;
      return;
    }
    for(int j = i; j < upper_limit; j+=i) isPrime[j] = false;
  }
}

int main(){
  Eratosthenes();
  cout << answer << endl;
  return 0;
}
