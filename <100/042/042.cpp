#include<iostream>
#include<fstream>
using namespace std;


string line, filename = "042.txt";


bool has_inverse(int n, int (*f)(int)){
  int ok = 1e3, ng = 0;
  while(ok - ng > 1){
    int mid = (ok + ng) / 2;
    if(f(mid) >= n) ok = mid;
    else            ng = mid;
  }

  return f(ok) == n; 
}


int triangle_prod(int n){ return n * (n + 1) / 2; }
bool is_triangle(int n){ return has_inverse(n, triangle_prod); }


int name_to_num(string s){
  int result = 0;
  for(auto c : s)if(isupper(c)){
    result += c - 'A' + 1;
  }

  return result;
}


int main(){
  int answer = 0;
  
  ifstream file(filename);
  while(getline(file, line, ',')){
    int n = name_to_num(line);
    if(is_triangle(n)){
      ++answer;
    }
  }

  cout << answer << endl;
  return 0;
}
