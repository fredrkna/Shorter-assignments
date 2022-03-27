#include <iostream>
#include "Car.h"
#include "Person.h"
#include <string>
using namespace std;


int main() {
	setlocale(LC_ALL, "Norwegian");
	cout << "Tast 1 for Car og Person" << endl;
	cout << "Tast 2 for oppgave 3" << endl;
	cout << "Tast 3 for oppgave 4 del 1" << endl;
	cout << "Tast 4 for oppgave 4 del 2" << endl;
	cout << "Tast 5 for blackjack" << endl;
	cout << "Tast 0 for å avslutte" << endl;
	int test;
	cin >> test;
	if (test == 1) {
		Car bil(1);
		cout << bil.hasFreeSeats() <<  endl;
		bil.reserveFreeSeat();
		cout << bil.hasFreeSeats() << endl;
		Person erik("Hallo.com", "Erik", &bil);
		cout << erik.hasAvailableSeats() << endl;
		Person mona("Hei.com", "Mona");
		if (erik < mona) {
			cout << "Erik er før Mona" << endl;
		}
		cout << erik;
		cout << mona;
		main();
	}
	else if (test == 2) {
		
		main();
	}
	else if (test == 3) {
		
		main();
	}
	else if (test == 4) {
		
		main();
	}

	else if (test == 5) {
		
		main();
	}

	else if (test == 0) {
		return 0;
	}
	else {
		cout << "Du tastet en ugyldig verdi. Vennligst prøv igjen." << endl;
		main();
	}
}