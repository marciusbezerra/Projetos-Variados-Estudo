
#include <string>
#include <iostream>
#include <fstream>

using namespace std;

void main() {
	ifstream in("texto.txt");
	string s, line;
	while (getline(in,line))
		s+=line + "\n";
	cout << s;
}