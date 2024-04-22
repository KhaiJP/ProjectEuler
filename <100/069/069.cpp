#include<iostream>
#include<map>
#include<vector>
#include<algorithm>
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


double totientRate(int n){
  double phi = totient(n);
  double rate = n / phi;
  return rate;
}


int main(){
  int upper_limit = 1000000;
  vector<double> totientRates(upper_limit+1);
  for(int i = 0; i <= upper_limit; ++i){
    totientRates[i] = totientRate(i);
  }

  auto itr = max_element(totientRates.begin(), totientRates.end());
  int index = distance(totientRates.begin(), itr);

  cout << index << endl;
  return 0;
}
