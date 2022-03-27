#include <iostream>
#include "fibonacci.h"
#include "Matrix.h"
#include "Dummy.h"
using namespace std;


int main() {
	setlocale(LC_ALL, "Norwegian");
	int valg;
	cout << "Velg fra menyen:" << endl;
	cout << "1 for fibonacci" << endl;
	cout << "2 for matriser" << endl;
	cout << "3 for cstring-funksjoner" << endl;
	cout << "4 for å finne snittet over 5 år" << endl;
	cout << "5 for å spille mastermind" << endl;
	cout << "0 for å avslutte" << endl;
	cin >> valg;
	if (valg == 1) {
		createFibonacci();
		main();
	}
	else if (valg == 2) {
		Matrix mat(4, 5);
		cout << mat;
		Matrix mate(4);
		cout << mate;
		/*
		mat.~Matrix();
		mate.~Matrix();
		cout << mate;
		*/
		main();
	}
	else if (valg == 3) {
		dummyTest();
		main();
	}
	else if (valg == 4) {
		Matrix mat(4, 8);
		Matrix mate(mat);
		mat.~Matrix();
		cout << mat << endl;
		cout << mate << endl;
		Matrix test(5, 6);
		test.set(3, 4, 314);
		Matrix dummy;
		dummy = test;
		Matrix test2(5, 6);
		cout << dummy << endl;
		for (int i = 0; i < 5; i++) {
			for (int j = 0; j < 6; j++) {
				test.set(i, j, i + j);
				test2.set(i, j, i*j);
			}
		}
		cout << test << endl;
		cout << test2 << endl;
		test + test2;
		test += test2;
		cout << test << endl;
		main();
	}
	else if (valg == 5) {
		main();
	}
	else if (valg == 0) {
		return 0;
	}
	else {
		cout << "Ditt svar er ugyldig, vennligst prøv igjen" << endl;
		main();
	};
};