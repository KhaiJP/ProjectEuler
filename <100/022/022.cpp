#include<iostream>
#include<algorithm>
#include<fstream>
#include<vector>
using namespace std;


string trim(string s){
  s.erase(0, 1);
  s.pop_back();
  return s;
}


vector<string> read_file(string filename){
  ifstream in(filename);
  cin.rdbuf(in.rdbuf());

  string long_string;
  cin >> long_string;
  long_string += ',';

  vector<string> result = {};
  string tmp_string = "";
  for(auto c : long_string){
    if(c == ','){
      string s = trim(tmp_string);
      result.push_back(s);
      tmp_string = "";
    }

    else{
      tmp_string += c;
    }
  }

  return result;
}


int eval_name_score(string name){
  int result = 0;
  for(char c : name){
    result += c - 'A' + 1;
  }

  return result;
}


int solve(vector<string> names){
  int answer = 0;
  for(int i = 0; i < (int)names.size(); ++i){
    string &name = names[i];
    int name_score = eval_name_score(name);
    answer += (i+1) * name_score;
  }

  return answer;
}


int main(){
  string filename = "022.txt";
  auto names = read_file(filename);
  sort(names.begin(), names.end());
  int answer = solve(names);
  cout << answer << endl;
  return 0;
}
