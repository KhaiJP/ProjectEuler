#include<iostream>
using namespace std;
#define MAX 1000000


bool isprime[MAX+10];


void Eratosthenes(){
  for(int i = 2; i < MAX; ++i){
    isprime[i] = true;
  }
  for(int i = 2; i < MAX; ++i)if(isprime[i]){
    for(int j = 2*i; j < MAX; j += i){
      isprime[j] = false;
    }
  }
}


int neighbour_cubed_gap(int n){
  return (n+1)*(n+1)*(n+1) - n*n*n;
}


int main(){
  Eratosthenes();

  int answer = 0;
  for(int l = 1; ; ++l){
    int gap = neighbour_cubed_gap(l);
    
    if(MAX <= gap){
      break;
    }

    if(isprime[gap]){
      ++answer;
    }
  }

  cout << answer << endl;
  return 0;
}
