#include<iostream>
#include<vector>
#include<numeric>
#include<boost/multiprecision/cpp_int.hpp>
#include<time.h>
using namespace std;
// namespace mp = boost::multiprecision;
using Bint   = boost::multiprecision::cpp_int;
using P      = pair<Bint, Bint>;


Bint digitSum(Bint n){
  if(n == 0) return (Bint)0;
  else       return n%(Bint)10 + digitSum(n/(Bint)10);
}


P reproduce_continued_fraction(vector<int> &V){
  Bint n = 0, d = 1;
  Bint N = V.size();

  while(V.size()){
    Bint tmp = d;
    Bint k = V.back();
    d = d*V.back() + n;
    V.pop_back();
    n = tmp;
    Bint hcf = gcd(n, d);
    n /= hcf, d /= hcf;
  }

  swap(n, d);
  return {n, d};
}


vector<int> generate_E(int sz){
  vector<int> V;
  if(sz == 0) return V;
  V.push_back((int)2);
  if(sz == 1) return V;
  V.push_back((int)1);
  if(sz == 2) return V;
  V.push_back((int)2);
  if(sz == 3) return V;

  int i = 1, j = 2;
  while((int)V.size() < sz){
    if(i > 0) V.push_back((int)1);
    else{
      V.push_back((int)2*j);
      ++j;
    }

    i = (i+1) % 3;
  }

  return V;
}


Bint solve(){
  vector<int> V = generate_E(100);

  P p = reproduce_continued_fraction(V);
  Bint answer = digitSum(p.first);
  return answer;
  return 1;
}

int main(){
  clock_t start = clock();
  Bint answer = solve();
  clock_t end = clock();
  const double time = static_cast<double>(end - start) / CLOCKS_PER_SEC;

  cout << answer << endl;
  cout << time << " sec" << endl;
}
