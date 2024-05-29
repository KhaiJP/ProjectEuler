#include<iostream>
#include<vector>
using namespace std;
#define MAX 1000000


bool isPrime[MAX+10];


void Eratosthenes(){
  for(int i = 2; i < MAX; ++i){
    isPrime[i] = true;
  }
  for(int i = 2; i < MAX; ++i)if(isPrime[i]){
    for(int j = 2*i ; j < MAX; j += i){
      isPrime[j] = false;
    }    
  }
}


vector<int> pfxPrimes(int upper_limit){
  vector<int> pfx = {2};
  for(int i = 3; i < MAX; ++i)if(isPrime[i]){
    int a = pfx.back() + i;
    if(a >= upper_limit) break;
    pfx.push_back(a);
  }

  return pfx;
}


int solve(vector<int> &v){
  int sequence = 0;
  int answer   = 0;
  int N = v.size();
  for(int k = N-1; k >= 0; --k){
    if(sequence > k) break;
    int pk = v[k];
    for(int j = 0; j < k; ++j){
      int delta = k - j;
      if(delta < sequence) break;

      int pj  = v[j];
      int gap = pk - pj;
      if(isPrime[gap]){
        sequence = delta;
        answer   = gap;
        break;
      }
    }
  }

  return answer;
}


int main(){
  Eratosthenes();
  int upper_limit = 1000000;
  vector<int> pfx = pfxPrimes(upper_limit);
  cout << solve(pfx) << endl;
  return 0;
}
