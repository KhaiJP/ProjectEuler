#include<iostream>
#include<algorithm>
#include<set>
using namespace std;

// consider patterns that a*b = c is pandigital. for the sake of simplist we write n-digit as n-d.
// 1 * 23456 = 23456, 9 * 234 = 2106-> 1-d * 5-d = 5-d or 6-d, 1-d * 3-d = 3-d or 4-d -> cannot be 1-9 pandigital.
// by doing the same analysis, pandigital set is 1-d * 4-d = 4-d or 2-d * 3-d = 4*d.
const string target = "123456789";
int answer;
set<int> S;

bool check(int a, int b, int c){
  string s = to_string(a) + to_string(b) + to_string(c);
  sort(s.begin(), s.end());
  return s == target;
}

int main(){
  // check 1-d * 4-d = 4-d
  for(int a = 1; a < 10; ++a)for(int b = 1234; b < 10000; ++b){
    int c = a * b;
    if(check(a, b, c)) S.insert(c);
  }
  // check 2-d * 3-d = 4-d
  for(int a = 12; a < 100; ++a)for(int b = 123; b < 1000; ++b){
    int c = a * b;
    if(check(a, b, c)) S.insert(c);
  }

  for(int c : S) answer += c;
  cout << answer << endl;
  return 0;
}