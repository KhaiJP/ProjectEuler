#include<iostream>
#include<set>
using namespace std;


multiset<int> prime_factors(int n){
  multiset<int> s;
  for(int i = 2; i*i <= n; ++i){
    while(n%i == 0){
      s.insert(i);
      n /= i;
    }
  }

  if(n > 1){
    s.insert(n);
  }

  return s;
}


multiset<int> collect_neumerators(int n, int r){
  multiset<int> neumerators;
  for(int i = 0; i < r; ++i){
    auto s = prime_factors(n-i);
    for(auto a : s){
      neumerators.insert(a);
    }
  }
  return neumerators;
}


multiset<int> collect_denominators(int r){
  multiset<int> denominators;
  for(int i = 2; i <= r; ++i){
    auto s = prime_factors(i);
    for(auto a : s){
      denominators.insert(a);
    }
  }
  return denominators;
}


multiset<int> reduction(multiset<int> neumerators, multiset<int> denominators){
  for(auto a : denominators){
    auto itr = neumerators.find(a);
      neumerators.erase(itr);
  }

  return neumerators;
}


int multiply(multiset<int> s, int limit = 1000000){
  int result = 1;
  for(int a : s){
    result *= a;
    if(1 < limit && limit < result){
      return limit + 1;
    }
  }

  return result;
}


bool is_ok(int n, int r){
  auto neumeratos = collect_neumerators(n, r);
  auto denominators = collect_denominators(r);
  auto neumerators_ = reduction(neumeratos, denominators);
  int limit = 1e6;
  int result = multiply(neumerators_, limit);

  return limit < result;
}


int main(){
  int count = 0;
  for(int n = 1; n <= 100; ++n){
    for(int r = 0; r <= n; ++r){
      if(is_ok(n, r)){
        ++count;
      }
    }
  }

  cout << count << endl;
  return 0;
}
