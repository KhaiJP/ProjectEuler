#include<iostream>
#include<algorithm>
#include<vector>
using namespace std;


string to_string_sort(int n){
  string s = to_string(n);
  sort(s.begin(), s.end());
  return s;
}


bool is_ok(int x){
  string s = to_string_sort(x);
  for(int i = 2; i <= 6; ++i){
    string t = to_string_sort(i*x);
    if(t != s){
      return false;
    }
  }

  return true;
}


int main(){
  for(int i = 125874; ; ++i)if(is_ok(i)){
    cout << i << endl;
    return 0;
  }
}
