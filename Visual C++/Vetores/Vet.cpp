
#include <string>
#include <iostream>
#include <fstream>
#include <vector>

using namespace std;

void main() {
	vector<string> v;
	ifstream in("..\\Arquivo\\Texto.txt");
	string linha;
	while (getline(in,linha)) v.push_back(linha);
	for (int i=0;i<v.size();i++) cout << i << ": " << v[i] << endl;
}