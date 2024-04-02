#include<iostream>
using namespace std;

int target = 1000;

int main(){
  // brute-force search
  for(int a = 1; a < target; ++a){
    for(int b = a; a+b < target; ++b){
      int c = target - (a + b);
      if(a*a + b*b == c*c){
        cout << a*b*c << endl;
        return 0;
      }
    }
  }
}
