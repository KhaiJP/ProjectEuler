#include<iostream>
#include<vector>
#include<set>
using namespace std;


int proper_divisors_sum(int n){
  // trial division; slow but enough
  int sum = 0;
  for(int i = 1; i*i <= n; ++i)if(n%i == 0){
    sum += i + n/i;
    if(i*i == n){
      sum -= i;
    }
  }

  return sum - n;
}


bool is_abundant(int n){
  return n < proper_divisors_sum(n);
}

vector<int> get_abundant_numbers(int upper_limit){
  vector<int> abundants = {};
  for(int i = 1; i <= upper_limit; ++i)if(is_abundant(i)){
    abundants.push_back(i);
  }

  return abundants;
}


int solve(vector<int> &abundants, int upper_limit){
  int result = 0, num_abundants = abundants.size();
  set<int> s;
  for(int n = 1; n <= upper_limit; ++n){
    s.insert(n);
  }
  
  for(int i = 0; i < num_abundants; ++i){
    for(int j = i; j < num_abundants; ++j){
      int sum = abundants[i] + abundants[j];
      s.erase(sum);
    }
  }

  for(int a : s){
    result += a;
  }

  return result;
}


int main(){
  int upper_limit = 28123;
  auto abundants = get_abundant_numbers(upper_limit);
  cout << solve(abundants, upper_limit) << endl;
  return 0;
}
