#include<iostream>
#include<algorithm>
using namespace std;
#define MAX 10000000


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
}


bool isPandigital(int n){
  string s = to_string(n);
  sort(s.begin(), s.end());
  for(int i = 0; i < (int)s.size(); ++i){
    if(s[i] != (char)('1' + i)) return false;
  }
  return true;
}


int main(){
  Eratosthenes();
  for(int i = 7654321; i > 0; --i){
    if(isPrime[i] && isPandigital(i)){
      cout << i << endl;
      return 0;
    }
  }
}
