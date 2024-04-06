#include<iostream>
#include<set>
using namespace std;
#define MAX 1000000

bool isPrime[MAX+10], isCircular[MAX+10], visited[MAX+10];
int answer;
const int upper_limit = MAX;

void Eratosthenes(){
  for(int i = 2; i < upper_limit; ++i) isPrime[i] = true;
  for(int i = 2; i < upper_limit; ++i)if(isPrime[i]){
    for(int j = 2*i; j < upper_limit; j += i) isPrime[j] = false;
  }

  return ;
}

bool check(int n){
  // store all the rotations
  set<int> storage;
  // make rotations through string
  string s = to_string(n);
  int N = s.size();
  // monitor if all the rotations are prime
  bool flag = true;

  // check all rotations
  for(int start = 0; start < N; ++start){
    string tmp = "";
    for(int i = 0; i < N; ++i){
      int j = (start + i) % N;
      tmp += s[j];
    }
    int m = stoi(tmp);
    visited[m] = true;
    storage.insert(m);
    flag = flag && isPrime[m];
  }

  if(flag)for(int p : storage) isCircular[p] = true;
  return flag;
}


int main(){
  Eratosthenes();

  for(int i = 2; i < upper_limit; ++i)if(isPrime[i]){
    if(visited[i]) answer += isCircular[i];
    else answer += check(i);
  }

  cout << answer << endl;
}