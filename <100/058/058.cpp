#include<iostream>
#include<vector>
using namespace std;


vector<int> Eratosthenes(int upper_limit){
  vector<int> primes = {2};
  vector<bool> isprime(upper_limit + 1, true);
  for(int i = 3; i <= upper_limit; i += 2)if(isprime[i]){
    primes.push_back(i);
    for(int j = 2*i; j <= upper_limit; j += i){
      isprime[j] = false;
    }
  }

  return primes;
}


int fa(int n){ return (2*n+1) * (2*n+1); }
int fb(int n){ return fa(n) - 2*n; }
int fc(int n){ return fb(n) - 2*n; }
int fd(int n){ return fc(n) - 2*n; }


bool is_prime(int n, vector<int> &primes){
  auto itr = lower_bound(primes.begin(), primes.end(), n);
  return itr != primes.end() && *itr == n;
}


int num_primes(int n, vector<int> &primes){
  int count = 0;
  count += (int)is_prime(fa(n), primes);
  count += (int)is_prime(fb(n), primes);
  count += (int)is_prime(fc(n), primes);
  count += (int)is_prime(fd(n), primes);
  return count;
}


int dfs(vector<int> &primes, int n = 0, int count = 0){
  if(0 < n && 10 * count <= (4*n + 1)){
    return 2*n + 1;
  }
  ++n;
  count += num_primes(n, primes);
  return dfs(primes, n, count);
}


int main(){
  int upper_limit = 800000000;
  auto primes = Eratosthenes(upper_limit);
  cout << dfs(primes) << endl;
  return 0;
}
