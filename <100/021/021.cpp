#include<iostream>
using namespace std;
#define MAX 10000

const int upper_limit = MAX;
int d[MAX+10], answer;

void eval_d(int n){
  int tmp = 0;
  for(int i = 1; i*i <= n; ++i)if(n%i == 0){
    tmp += i + n/i;
    if(i*i == n) tmp -= i;
  }
  tmp -= n;
  d[n] = tmp;
  return ;
}


int main(){
  //eval_d(220);
  for(int n = 2; n < upper_limit; ++n){
    eval_d(n);
  }

  for(int n = 2; n < upper_limit; ++n){
    int m = d[n];
    if(m < upper_limit && d[m] == n && m != n){
      answer += n;
    }
  }

  cout << answer << endl;
  return 0;
}
