#include<iostream>
#include<algorithm>
using namespace std;
#define MAX 100000


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


bool arePerms(int n, int m){
  string sn = to_string(n);
  sort(sn.begin(), sn.end());
  string sm = to_string(m);
  sort(sm.begin(), sm.end());

  return sn == sm;
}


int main(){
  Eratosthenes();

  for(int p1 = 1489; p1 < MAX; p1 += 2)if(isPrime[p1]){
    for(int p2 = p1+2; p2 < MAX; p2 += 2)if(isPrime[p2]){
      if(!arePerms(p1, p2)) continue;
      int delta = p2 - p1;
      int p3 = p2 + delta;
      if(p3 < MAX && isPrime[p3] && arePerms(p3, p1)){
        cout << p1 << p2 << p3 << endl;
        return 0;
      }
    }
  }
}
