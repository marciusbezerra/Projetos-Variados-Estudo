
#include <string>
#include <iostream>

using namespace std;

void main() {
	string s1, s2; //strings vazias
	string s3 = "Hello Word!! "; // Inicializada
	string s4("Eu sou"); //Tambem inicializada
	s2 = " 8-";
	s1 = s3 + " " + s4;
	s1 += " Marcius";
	cout << s1 + s2 + ")" << endl;
}