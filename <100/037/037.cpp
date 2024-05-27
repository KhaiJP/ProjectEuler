#include<iostream>
using namespace std;
#define UPPER_LIMIT 1000000

bool isPrime[UPPER_LIMIT];


void Eratosthenes(){
  for(int i = 2; i < UPPER_LIMIT; ++i) isPrime[i] = true;

  for(int i = 2; i < UPPER_LIMIT; ++i)if(isPrime[i]){
    for(int j = 2*i; j < UPPER_LIMIT; j += i){
      isPrime[j] = false;
    }
  }
}


int naive_pow(int n){
  int r = 1;
  while(n > 0){
    --n;
    r *= 10;
  }
  return r;
}


int clip_left(int n){
  string ns   = to_string(n);
  int ord     = ns.size() - 1;
  int divisor = naive_pow(ord);
  return n % divisor; 
}


int clip_right(int n){
  return n / 10;
}


bool truncatable(int n, int (*direc)(int)){
  while(n > 0){
    if(!isPrime[n]) return false;
    n = direc(n);
  }

  return true;
}


int main(){
  Eratosthenes();
  int answer = 0, target = 11, cnt = 0;
  for(int i = 11; i < UPPER_LIMIT; ++i){
    if(truncatable(i, clip_right) && truncatable(i, clip_left)){
      answer += i;
      ++cnt;
      if(cnt == target){
        cout << answer << endl;
        return 0;
      }
    }
  }

  cout << "only " << cnt << " both-truncatable primes have been found" << endl;
  return 0;
}
