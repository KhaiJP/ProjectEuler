#include<iostream>
#include<time.h>
using namespace std;
#define MAX 100

const int max_a = MAX, max_b = MAX;
int answer, digit[220], carry[220], max_d = 220;


void initialize(){
  for(int d = 0; d < max_d; ++d){
    carry[d] = 0;
    digit[d] = 0;
  }

  digit[0] = 1;
  return ;
}


void _power(int a){
  for(int d = 0; d < max_d; ++d){
    digit[d]   = digit[d]*a + carry[d];
    carry[d+1] = digit[d] / 10;
    digit[d]   = digit[d] % 10;
  }

  return ;
}


int power(int a, int b){
  initialize();
  for(int i = 0; i < b; ++i){
    _power(a);
  }

  int s = 0;
  for(int d = 0; d < max_d; ++d){
    s += digit[d];
  }
  return s;
}


int main(){
  clock_t start = clock();
  for(int a = 1; a < max_a; ++a)for(int b = 0; b < max_b; ++b){
    answer = max(answer, power(a, b));
  }

  clock_t end = clock();
  const double time = static_cast<double>(end - start) / CLOCKS_PER_SEC;

  cout << answer << endl;
  cout << time << " sec" << endl;  
  return 0;
}