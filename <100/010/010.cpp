#include<iostream>
using namespace std;
using ll = int64_t;
// typedef int64_t ll;

const ll upper_limit = 2000000;
ll answer;
// additional 10 is just for buffer
bool isPrime[2000010];

ll Eratosthenes(){
  for(ll i = 2; i < upper_limit; ++i) isPrime[i] = true;
  for(ll i = 2; i < upper_limit; ++i)if(isPrime[i]){
    answer += i;
    for(ll j = 2*i; j < upper_limit; j += i) isPrime[j] = false;
  }

  return answer;
}

int main(){
  cout << Eratosthenes() << endl;
  return 0;
}
