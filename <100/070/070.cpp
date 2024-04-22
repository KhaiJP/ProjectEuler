#include<iostream>
#include<map>
#include<vector>
#include<algorithm>
#include<cmath>
#include<time.h>
using namespace std;


map<int, int> prime_factorization(int n){
  map<int, int> pf;
  while(n % 2 == 0){
    ++pf[2];
    n /= 2;
  }

  for(int i = 3; i*i <= n; i += 2){
    while (n%i == 0){
      ++pf[i];
      n /= i;
    }
  }

  if(n > 1) ++pf[n];

  return pf;
}


// for positive integer n = \prod_{k} p_k ^{r_k}, Euler's totient function can be calculated as
// phi(n) = n * \prod_{k} (1 - 1/p_k)
double totient(int n){
  if(n <= 0) return 0;

  map<int, int> pf = prime_factorization(n);
  double phi = n;
  for(auto p : pf){
    double tmp = p.first;
    phi *= (1 - (double)1 / tmp);
  }

  return phi;
}


bool arePermutes(int n, int m){
  string s = to_string(n), t = to_string(m);
  sort(s.begin(), s.end()), sort(t.begin(), t.end());
  return s == t;
}

double totientRate(int n){
  int phi = floor(totient(n)+0.0000001);
  if(arePermutes(n, phi)){
    double phi_ = phi;
    double rate = n / phi_;
    return rate;
  }
  return 1e7;
}


int main(){
  // this algorithm is slow for C++; it takes 20 secs to execute
  clock_t start = clock();

  int upper_limit = 1e7;
  vector<double> totientRates(upper_limit-2);
  for(int i = 2; i < upper_limit; ++i){
    totientRates[i-2] = totientRate(i);
  }

  auto itr = min_element(totientRates.begin(), totientRates.end());
  int index = distance(totientRates.begin(), itr) + 2;

  clock_t end = clock();
  const double time = static_cast<double>(end - start) / CLOCKS_PER_SEC;

  cout << index << endl;
  cout << time << " sec" << endl;
  return 0;
}
