

#include <string>
#include <fstream> //ifstream e ofstream

using namespace std;

void main() {
	ifstream in("Texto.txt");   //Abre para ler
	ofstream out("Texto1.txt"); //Abre para escrever
	string s;
	while (getline(in,s)) //pega uma linha
		out << s << "\n"; //cria uma linha
}