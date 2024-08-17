#include<iostream>
#include<vector>
using namespace std;


/** 
 * collect prime numbers up to upper_limit by Eratosthenes sieve
 */
vector<int> Eratosthenes(int uppper_limit){
  vector<int> primes = {2};
  vector<bool> isPrime(uppper_limit + 1, true);
  for(int i = 3; i <= uppper_limit; i += 2)if(isPrime[i]){
    primes.push_back(i);
    for(int j = 2*i; j <= uppper_limit; j += i){
      isPrime[j] = false;
    }
  }

  return primes;
}


/**
 * check if n is prime number
 */
bool isprime(int n, vector<int> &primes){
  auto itr = lower_bound(primes.begin(), primes.end(), n);
  if(itr == primes.end()){
    return false;
  }

  int m = *itr;
  return n == m;
}


/**
 * find where n contains digit t
 * e.g. n = 56003, t = 0 -> {2, 3}
 */
vector<int> find_places(int n, int t){
  string ns = to_string(n);
  char tc   = t + '0';
  vector<int> results;
  for(int i = 0; i < (int)ns.size(); ++i)if(ns[i] == tc){
    results.push_back(i);
  }

  return results;
}


/**
 * replace digits, specified by places, of n to t. if leading 0 happens, then return -1 instead.
 * e.g. n = 56003, t = 4, places = {2, 3} -> 56443
 *      n = 56003, t = 0, places = {0, 1} -> -1 (leading 0 is no allowed)
 */
int replace_num(int n, int t, vector<int> &places){
  string ns = to_string(n);
  char   tc = t + '0';
  if(places.empty() || places[0] == 0 && t == 0){
    return -1;
  }
  for(int i : places){
    ns[i] = tc;
  }

  int reuslt = stoi(ns);
  return reuslt;
}


/**
 * check if replace t in n generates 8 prime numbers
 */
bool is_ok(int n, int t, vector<int> &primes){
  auto places = find_places(n, t);
  if((int)places.size() != 3){
    return false;
  }

  int count = 0;
  for(int m = 0; m < 10; ++m){
    int n_ = replace_num(n, m, places);
    if(isprime(n_, primes)){
      ++count;
    }
  }

  return count == 8;
}


int solve(int upper_limit){
  auto primes = Eratosthenes(upper_limit);
  for(int n = 56004; n <= upper_limit; ++n){
    for(int t = 0; t < 2; ++t){  // t = t' > 1 is ok, t = 1 is also ok
      if(is_ok(n, t, primes)){
        return n;
      }
    }
  }

  return -1;
}


int main(){
  int upper_limit = 1e7;
  cout << solve(upper_limit) << endl;
  return 0;
}
