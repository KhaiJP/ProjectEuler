#include<iostream>
using namespace std;
using ll = int64_t;

const ll upper_limit = 600851475143;
ll answer;
bool isPrime[10000000];

void Eratosthenes(){
  for(ll i = 2; i*i <= upper_limit; ++i) isPrime[i] = true;

  for(ll i = 2; i*i <= upper_limit; ++i)if(isPrime[i]){
    for(ll j = 2*i; j*j <= upper_limit; j += i) isPrime[j] = false;
  }
  return ;
}

int main(){
  Eratosthenes();
  for(ll i = 3; i*i <= upper_limit; i += 2){
    if(isPrime[i] && upper_limit%i == 0) answer = i;
  }

  cout << answer << endl;
  return 0;
}
