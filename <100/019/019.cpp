#include<iostream>
using namespace std;

int answer, days[2][12] = {{31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31},
                           {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}};
// M: 0, 1, 2, .., 11 -> Jan, Feb, Mar, ... , Dec.
// D 0, 1, 2, ... -> 1st, 2nd, 3rd, ...
// day 0, 1, 2, ..., 6 -> Sun, Mon, Tue, ... , Sat
int Y = 1900, M = 0, D = 0, day = 1;
bool isLeap;

bool judgeLeap(int Y){
  if(Y%4 != 0) return false;
  if(Y%400 == 0) return true;
  return Y%100 != 0;
}

int main(){
  // for avoidance of infinite loop
  int safe = 0;
  while(!(Y==2001 && M == 0 && D == 0) && safe < 365*200){
    ++safe;
    if(Y > 1900 && D == 0 && day == 0) ++answer;
    day = (day+1) % 7;
    ++D;
    if(D == days[isLeap][M]){
      D = 0;
      ++M;
      if(M == 12){
        M = 0;
        ++Y;
        isLeap = judgeLeap(Y);
      }
    }
  }

  cout << answer << endl;
  // check if the calculation is done successfully
  cout << safe << endl;
  return 0;
}
