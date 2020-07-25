
#include <iostream>
#include <vector>

using namespace std;

void main() {
	vector<int> v;
	for (int i=0;i<1000;i++) v.push_back(i);
	for (i=0;i<v.size();i++) cout << v[i] << ", ";
	cout << "\n";
	for (i=0;i<v.size();i++) v[i] *= 100;
	for (i=0;i<v.size();i++) cout << v[i] << ", ";
	cout << endl;
}