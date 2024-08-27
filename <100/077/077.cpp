#include<iostream>
#include<vector>
using namespace std;
using Memo = vector<vector<int>>;
using Row = vector<int>;


Row Eratosthenes(int upper_limit){
  Row primes = {2};
  vector<bool> isprime(upper_limit+1, true);

  for(int i = 3; i <= upper_limit; i += 2)if(isprime[i]){
    primes.push_back(i);
    for(int j = 2*i; j <= upper_limit; j += i){
      isprime[j] = false;
    }
  }

  return primes;
}


bool is_prime(int n, Row primes){
  auto itr = lower_bound(primes.begin(), primes.end(), n);
  return itr != primes.end() && *itr == n;
}


int partition(int n, int k, Memo &memo, Row &primes){
  if(n == 0) return memo[n][k] = 1;
  if(k == 0) return 0;
  if(0 < memo[n][k]) return memo[n][k];
  int a = partition(n, k-1, memo, primes);
  int b;
  if(is_prime(k, primes) && k <= n){
    b = partition(n-k, k, memo, primes);
  }else{
    b = 0;
  }

  memo[n][k] = a + b;
  return memo[n][k];
}


bool achieved_target(int n, Memo &memo, Row &primes){
  int target = 5000;
  int p = partition(n, n, memo, primes);
  return target < p;
}


int main(){
  int upper_limit= 200;
  auto primes = Eratosthenes(upper_limit);
  Memo memo(upper_limit+210, Row(upper_limit+210, 0));
  for(int n = 2; n < upper_limit; ++n){
    if(achieved_target(n, memo, primes)){
      cout << n << endl;
      return 0;
    }
  }

  cout << "\nnot found\n";
  return 0;
}
