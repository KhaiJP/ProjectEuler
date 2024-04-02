#include<iostream>
using namespace std;

int results[350], carry[350], answer;
const int power = 1000;

void mutiply2(){
  for(int d = 0; d < 350; ++d){
    results[d] = 2*results[d] + carry[d];
    carry[d+1] = results[d] / 10;
    results[d] = results[d] % 10;
  }

  return ;
}

int main(){
  results[0] = 1;
  for(int i = 0; i < power; ++i){
    mutiply2();
  }

  for(int d = 0; d < 350; ++d){
    answer += results[d];
  }

  cout << answer << endl;
  return 0;
}
