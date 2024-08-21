#include<iostream>
#include<vector>
using namespace std;


bool is_ok(int n, vector<int> &v){
  string mult_result = "";
  for(auto a : v){
    mult_result += a + '0';
  }
  while(mult_result.back() == '0'){
    mult_result.pop_back();
  }

  return (int)mult_result.size() == n;
}


int check(int n){
  vector<int> multiply_result(30, 0);
  int carry = 0, count = 0;
  multiply_result[0] = 1;

  for(int i = 1; ; ++i){
    for(int j = 0; j < 30; ++j){
      int tmp = multiply_result[j] * n + carry;
      multiply_result[j] = tmp % 10;
      carry = tmp / 10;
    }

    if(is_ok(i, multiply_result)){
      ++count;
    }
    else{
      return count;
    }
  }
}


int main(){
  int answer = 0;
  for(int i = 1; i < 10; ++i){
    answer += check(i);
  }

  cout << answer << endl;
  return 0;
}
