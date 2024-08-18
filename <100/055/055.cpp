#include<iostream>
#include<algorithm>
using namespace std;


string add(string a, string b){
  string s = "";
  int n = a.size(), carry = 0;
  reverse(a.begin(), a.end()), reverse(b.begin(), b.end());

  for(int i = 0; i < n; ++i){
    int a_i = a[i] - '0', b_i = b[i] - '0';
    carry += a_i + b_i;

    s += (carry % 10) + '0';
    carry /= 10;
  }

  reverse(s.begin(), s.end());
  if(carry > 0){
    s = to_string(carry) + s;
  }
  return s;
}


string Lychrel_process(string s){
  string t = s;
  reverse(t.begin(), t.end());
  return add(s, t);
}


bool is_palindrome(string s){
  int n = s.size();
  for(int i = 0; i < n/2; ++i){
    if(s[i] != s[n-1-i]){
      return false;
    }
  }

  return true;
}


bool dfs(string s, int cnt=0){
  ++cnt;
  if(50 <= cnt){
    return true;
  }
  string next_s = Lychrel_process(s);

  if(is_palindrome(next_s)){
    return false;
  }

  return dfs(next_s, cnt);
}


bool is_Lychrel(int n){
  string s = to_string(n);
  return dfs(s);
}


int main(){
  int upper_limit = 10000, answer = 0;
  for(int n = 1; n < upper_limit; ++n)if(is_Lychrel(n)){
    answer += 1;
  }

  cout << answer << endl;
  return 0;
}
