#include<iostream>
using namespace std;

int answer;

bool isPalindrome(int n){
  string s = to_string(n);
  int m = s.size();
  for(int i = 0; i < m/2; ++i)if(s[i] != s[m-1-i]){
    return false;
  }
  return true;
}

int main(){
  for(int i = 100; i < 1000; ++i)for(int j = 100; j < 1000; ++j){
    int n = i*j;
    if(isPalindrome(n)) answer = max(answer, n);
  }

  cout << answer << endl;
  return 0;
}
