#include <iostream>
#include <ctime>
#include "utilities.h"
#include "tests.h"
#include "Mastermind.h"
using namespace std;

// I 1.a vil v0 fortsatt v�re verdien den ble initiert til, alts� 5.
//I 1.e b�r funksjonen bruke pekere ellers har den ingen virkning utenfor funksjonen.


int main() {
	setlocale(LC_ALL, "Norwegian");
	srand(time(nullptr));
	int valg;
	cout << "Velg fra menyen:" << endl;
	cout << "1 for callby-funksjoner" << endl;
	cout << "2 for table-funksjoner" << endl;
	cout << "3 for cstring-funksjoner" << endl;
	cout << "4 for � finne snittet over 5 �r" << endl;
	cout << "5 for � spille mastermind" << endl;
	cout << "0 for � avslutte" << endl;
	cin >> valg;
	if (valg == 1) {
		testCallByValue();
		testCallByPointer();
		main();
	}
	else if (valg == 2) {
		testTableSorting();
		main();
	}
	else if (valg == 3) {
		testCStrings();
		main();
	}
	else if (valg == 4) {
		testCStrings5();
		main();
	}
	else if (valg == 5) {
		playMastermind();
		main();
	}
	else if (valg == 0) {
		return 0;
	}
	else {
		cout << "Ditt svar er ugyldig, vennligst pr�v igjen" << endl;
		main();
	};
};