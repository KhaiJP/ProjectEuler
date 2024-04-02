#include<iostream>
using namespace std;

int answer;

int main(){
  for(int i = 1; i < 1000; ++i){
    if(i%3 == 0 || i%5 == 0){
      answer += i;
    }
  }

  cout << answer << endl;
  return 0;
}
