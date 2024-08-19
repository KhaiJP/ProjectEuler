#include<iostream>
#include<fstream>
#include<vector>
#include<string>
using namespace std;


vector<int> read_file(string filename){
  ifstream file(filename);
  vector<int> result;
  string line;
  while(getline(file, line, ',')){
    int n = stoi(line);
    result.push_back(n);
  }

  return result;
}


string xor_s(vector<int> &numbers, vector<int> keys){
  int nn = numbers.size(), kn = keys.size();
  string result;
  for(int i = 0; i < nn; ++i){
    char c  = (numbers[i]) ^ (keys[i%kn] + 'a');
    result.push_back(c);
  }

  return result;
}


bool includesEuler(string message){
  string target = "Euler";
  auto p = message.find(target);
  return p != string::npos;
}


int sum_message(string message){
  int result = 0;
  for(char c : message){
    result += (int)c;
  }

  return result;
}


int solve(string filename){
  auto numbers = read_file(filename);
  for(int k1 = 0; k1 < 26; ++k1)for(int k2 = 0; k2 < 26; ++k2)for(int k3 = 0; k3 < 26; ++k3){
    string message = xor_s(numbers, {k1, k2, k3});
    if(includesEuler(message)){
      cout << message << '\n';
      return sum_message(message);
    }
  }

  return -1;
}


int main(){
  string filename = "059.txt";
  cout << solve(filename) << endl;
  return 0;
}