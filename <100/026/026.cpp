#include<iostream>
#include<set>
using namespace std;
#define MAX 1000

int answer, period;
const int max_loop = MAX, max_d = MAX;

int get_period(int n){
  int r = 10;
  set<int> s; s.insert(r);

  int num_loop = 0;
  while(num_loop < max_loop){
    ++num_loop;
    bool flag = r%n == 0;
    r = (r%n) * 10;

    if(flag || s.count(r) == 1){
      return num_loop;
    }

    s.insert(r);
  }

  return -1;
}


int main(){
  for(int n = 2; n < max_d; ++n){
    int n_period = get_period(n);
    if(period < n_period){
      period = n_period;
      answer = n;
    }
  }

  cout << answer << ' ' << period << endl;
  return 0;
}
