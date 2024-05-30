#include<iostream>
#include<set>
using namespace std;


set<int> primeFactors(int n){
  set<int> pfs;

  for(int i = 2; i*i <=n; ++i)if(n%i == 0){
    pfs.insert(i);
    while(n%i == 0) n /= i;
  }

  if(n > 1) pfs.insert(n);
  return pfs;
}


bool areGoodFour(int n){
  set<set<int>> S;
  for(int i = 0; i < 4; ++i){
    int m = n + i;
    set<int> pfs = primeFactors(m);
    if((int)pfs.size() != 4) return false;
    S.insert(pfs);
  }

  return (int)S.size() == 4;
}


int main(){
  for(int i = 2; i < 1000000; ++i)if(areGoodFour(i)){
    cout << i << endl;
    return 0;
  }

  cout << -1 << endl;
  return 0;
}
