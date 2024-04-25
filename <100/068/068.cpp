#include<iostream>
#include<algorithm>
#include<vector>
using namespace std;
using ll = int64_t;


vector<ll> V = {1,2,3,4,5,6,7,8,9,10};
ll answer;
ll gon_table[5][3], num_sum_table[5];
string digit_sum_table[5];


void set_table(){
  gon_table[0][0] = V[0], gon_table[0][1] = V[1], gon_table[0][2] = V[2];
  gon_table[1][0] = V[3], gon_table[1][1] = V[2], gon_table[1][2] = V[4];
  gon_table[2][0] = V[5], gon_table[2][1] = V[4], gon_table[2][2] = V[6];
  gon_table[3][0] = V[7], gon_table[3][1] = V[6], gon_table[3][2] = V[8];
  gon_table[4][0] = V[9], gon_table[4][1] = V[8], gon_table[4][2] = V[1];
}


bool is_ok(){
  // preprocessing
  for(int i = 0; i < 5; ++i){
    num_sum_table[i] = 0;
    digit_sum_table[i] = "";
    for(int j = 0; j < 3; ++j){
      num_sum_table[i] += gon_table[i][j];
      digit_sum_table[i] += to_string(gon_table[i][j]);
    }
  }

  // check if the sums are identical
  for(int i = 0; i < 4; ++i){
    if(num_sum_table[i] != num_sum_table[i+1]) return false;
  }

  // check if the top is numerically lowest
  for(int i = 1; i < 5; ++i){
    if(stol(digit_sum_table[i]) < stol(digit_sum_table[0])) return false;
  }


  return true;
}


ll make_candidate(){
  string s = "";
  for(int i = 0; i < 5; ++i)for(int j = 0; j < 3; ++j){
    s += to_string(gon_table[i][j]);
  }

  if((int)s.size() == 17) return -1;
  return stol(s);
}



int main(){
  // naive brute-force
  do{
    set_table();
    if(!is_ok()) continue;
    answer = max(answer, make_candidate());
  }while(next_permutation(V.begin(), V.end()));

  cout << answer << endl;
  return 0;
}
