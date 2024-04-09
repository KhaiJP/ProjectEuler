#include<iostream>
#include<algorithm>
using namespace std;


string to_binary(int n){
  string s = "";
  while(n > 0){
    s += to_string(n&1);
    n >>= 1;
  }

  return s;
}


bool is_palindrome(string s){
  string t = s;
  reverse(t.begin(), t.end());
  return t == s;
}


bool both_palindrome(int n){
  return is_palindrome(to_string(n)) && is_palindrome(to_binary(n));
}


int main(){
  int answer = 0;
  const int upper_limit = 1e6;
  for(int n = 1; n < upper_limit; ++n){
    if(both_palindrome(n)) answer += n;
  }

  cout << answer << endl;
  return 0;
}