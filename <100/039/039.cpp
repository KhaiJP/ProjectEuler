#include<iostream>
#include<algorithm>
#include<queue>
#include<vector>
#include<set>
#include<numeric>
using namespace std;
#define MAX 1000

const int upper_limit = MAX;
int cnt[MAX+10];
set<vector<int>> S;

vector<int> Pythagorean_generator(int n, int m){
  // '' (n^2-m^2)^2 + (2nm)^2 = (n^2 + m^2)^2 '' yields Pythagorean set
  vector<int> v(4);
  v[0] = n*n - m*m, v[1] = 2*n*m, v[2] = n*n + m*m;
  v[3] = v[0] + v[1] + v[2];
  sort(v.begin(), v.end());

  return v;
}

int main(){
  for(int n = 1; n < 500; ++n)for(int m = 1; m < n; ++m){
    // make primitive Pythagorean triples(PPT)
    if(gcd(n, m) > 1 || (n&1)^(m&1) == 0) continue;
    vector<int> v = Pythagorean_generator(n, m);

    // latter condition: in the case there exixt multipe (n, m) that generate the same PPT
    if(v[3] > upper_limit || S.count(v) == 1) continue;
    S.insert(v);

    // count PPT and non-PPT
    int p = v[3];
    while(p <= upper_limit){
      ++cnt[p];
      p += v[3];
    }
  }

  // use excess memory area to make code simpler.
  priority_queue<pair<int, int>> q;
  for(int i = 1; i <= upper_limit; ++i)if(cnt[i] > 0){
    q.push( {cnt[i], i} );
  }

  cout << q.top().second << endl;
  return 0;
}