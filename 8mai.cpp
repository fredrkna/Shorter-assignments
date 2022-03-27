#include <iostream>
#include <fstream>
#include <string>
#include <cctype>
#include "CourseCatalog.h"
#include <sstream>
#include "Wordcount.h"
using namespace std;


int main() {
	setlocale(LC_ALL, "Norwegian");
	int valg;
	cout << "Velg fra menyen:" << endl;
	cout << "1 for å skrive til fil ord for ord" << endl;
	cout << "2 for å lage et nytt dokument med linjenummere" << endl;
	cout << "3 for tegnstatistikk" << endl;
	cout << "4 for emnekoder" << endl;
	cout << "5 for ordstatistikk" << endl;
	cout << "0 for å avslutte" << endl;
	cin >> valg;
	if (valg == 1) {
		string tittel;
		cout << "Hva skal dokumentet hete?" << endl;
		cin >> tittel;
		ofstream output;
		output.open(tittel);
		if (output.fail()) {
			cout << "Error opening file" << endl;
			exit(1);
		}
		cout << "Skriv inn ordet du vil legge til i filen. Skriv \"quit\" for å avslutte." << endl;
		string streng;
		cin >> streng;
		while (streng != "quit") {
			output << streng << " ";
			cin >> streng;
		}
		output.close();
		main();
	}
	else if (valg == 2) {
		string tittelny;
		string tittelgammel;
		cout << "Hva skal det nye dokumentet hete?" << endl;
		cin >> tittelny;
		cout << "Hvilket dokument vil du hente fra?" << endl;
		cin >> tittelgammel;
		ifstream inputfile;
		ofstream output;
		inputfile.open(tittelgammel);
		output.open(tittelny);
		if (inputfile.fail() || output.fail()) {
			cout << "Error opening file!" << endl;
			exit(1);
		}
		string streng;
		int size = 256;
		int teller = 1;
		while (!inputfile.eof()) {
			getline(inputfile, streng);
			output << teller << ": " << streng << endl;
			teller++;
		}
		output.close();
		inputfile.close();
		main();
	}
	else if (valg == 3) {
		string tittel;
		cout << "Hvilket dokument vil du føre statistikk fra?" << endl;
		cin >> tittel;
		ifstream inputfile;
		inputfile.open(tittel);
		if (inputfile.fail()) {
			cout << "Error opening file!" << endl;
			exit(1);
		}
		char tegn;
		int total = 0;
		int bokstaver[26] = { 0 };
		while (inputfile >> tegn) {
			if (isalpha(tegn)) {
				tegn = tolower(tegn);
				bokstaver[tegn - 'a']++;
				total++;
			}
		}
		inputfile.close();
		cout << "Character statistics: " << endl;
		cout << "Total numbers of characters: " << total << endl;
		for (int i=0; i < 26; i++) {
			int tall = 97 + i;
			cout << (char)tall << ": " << bokstaver[i] << '\t';
			if ((i+1) % 4 == 0) {
				cout << endl;
			}
		}
		main();
	}
	else if (valg == 4) {
		CourseCatalog emner;
		emner.addCourse("Informasjonsteknologi grunnkurs", "TDT4110");
		emner.addCourse("Prosedyre - og objektorientert programmering", "TDT4102");
		emner.addCourse("Matematikk 1", "TMA4100");
		cout << emner;
		cout << endl;
		emner.updateCourse("C++", "TDT4102");
		cout << emner;
		main();
	}
	else if (valg == 5) {
		char alfabet[] = "qwertyuiopasdfghjklzxcvbnm";
		cout << "Fra hvilket dokument vil du føre statistikk?" << endl;
		string tittel;
		cin >> tittel;
		ifstream inputfile;
		inputfile.open(tittel);
		if (inputfile.fail()) {
			cout << "Error opening file!" << endl;
			exit(1);
		}
		string linje;
		string ord;
		Wordcount words;
		int lengdeOrd = 0;
		string lengsteOrd;
		int antallLinjer=0;
		int antallOrd=0;
		while (getline(inputfile, linje)) {
			stringstream ss(linje);
			while (ss >> ord) {				string nyttOrd;				for (int i = 0; i < ord.length(); i++) {					if (isalpha(ord[i])) {						nyttOrd += (char)tolower(ord[i]);					}				}				if (words.wordInMap(nyttOrd)) {					words.updateWord(nyttOrd);				}				else {					words.updateWord(nyttOrd);				}				antallOrd++;				if (nyttOrd.length() > lengdeOrd) {					lengsteOrd = nyttOrd;					lengdeOrd = nyttOrd.length();				}			}
			antallLinjer++;
		}
		inputfile.close();
		cout << "Ordstatistikk" << endl;
		cout << "Lengste ordet: " << lengsteOrd << endl;
		cout << "Antall ord: " << antallOrd << endl;
		cout << "Antall linjer: " << antallLinjer << endl;
		cout << words;
		main();
	}
	else if (valg == 0) {
		return 0;
	}
	else {
		cout << "Ditt svar er ugyldig, vennligst prøv igjen" << endl;
		main();
	}
}