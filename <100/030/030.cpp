#include<iostream>
#include<cmath>
using namespace std;

// let us consider if there exists an upper limit of the number enjoying the condition.
// the maximum m-digit number is apprently m * 9^5 = 59049m bu< 60000m. to enjoy the condition,
// this number must be greater than or equal to 10^(m-1) (note 10^m is m+1-digit number).
// for m = 7, 60000m = 420,000 < 1,000,000 = 10^(m-1) -> m <= 6 -> no number greater than 360000 enjoy the condition.
const int power = 5, upper_limit = 360000;
int answer;

bool is_ok(int n){
  int m = n, target = 0;
  while(m > 0){
    target += pow(m%10, power);
    m /= 10;
  }

  return target == n;
}


int main(){
  for(int n = 2; n < upper_limit; ++n){
    if(is_ok(n)) answer += n;
  }

  cout << answer << endl;
  return 0;
}