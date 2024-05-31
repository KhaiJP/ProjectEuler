#include<iostream>
using namespace std;
#define MAX 2000000


bool isPrime[MAX];


void Eratosthenes(){
  for(int i = 2; i < MAX; ++i){
    isPrime[i] = true;
  }
  for(int i = 2; i < MAX; ++i)if(isPrime[i]){
    for(int j = 2*i; j < MAX; j += i){
      isPrime[j] = false;
    }
  }

  return ;
}


bool enjoyGBconjecture(int n){
  for(int i = 1; i*i < n; ++i){
    int p = n - 2 * i*i;
    if(isPrime[p]) return true;
  }

  return false;
}


int solve(){
  for(int i = 35; i < MAX; i += 2)if(!isPrime[i] && !enjoyGBconjecture(i)){
    return i;
  }

  cout << "no odd composite, up to " << MAX << ", has been found that breaks GB conjecture" << endl;
  return -1;
}


int main(){
  Eratosthenes();
  cout << solve() << endl;
  return 0;
}
