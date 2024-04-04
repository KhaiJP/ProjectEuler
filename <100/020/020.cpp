#include<iostream>
using namespace std;
#define MAX 200
// 100! < 100^100 = 10^200

const int upper_limit = MAX;
int digit[MAX+10], carry[MAX+10], answer;

void multiply(int n){
  for(int d = 0; d < upper_limit; ++d){
    digit[d]   = n*digit[d] + carry[d];
    carry[d+1] = digit[d] / 10;
    digit[d]   = digit[d] % 10;
  }
}

int main(){
  digit[0] = 1;
  for(int n = 2; n <= 100; ++n) multiply(n);

  for(int d = 0; d < upper_limit; ++d) answer += digit[d];

  cout << answer << endl;
  return 0;
}
