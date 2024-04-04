#include<iostream>
#include<algorithm>
using namespace std;

string S = "0123456789";
int cnt = 1000000;

int main(){
  do{
    --cnt;
    if(cnt == 0){
      cout << S << endl;
      return 0;
    }
  }while(next_permutation(S.begin(), S.end()));

  return 0;
}
