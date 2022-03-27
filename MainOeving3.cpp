#include <iostream>
#include "Cannonball.h"
#include "utilities.h"
using namespace std;


int main() {
	setlocale(LC_ALL, "Norwegian");
	cout << "Tast 1 for å teste og 2 for å spille spill:" << endl;
	int test;
	cin >> test;
	if (test == 1) {
		printTime(50000);
		double initVelocityY;
		double initVelocityX;
		double initPositionX;
		double initPositionY;
		double time;
		cout << "Velg startfart i y-retning: " << endl;
		cin >> initVelocityY;
		cout << "Velg startfart i x-retning: " << endl;
		cin >> initVelocityX;
		cout << "Velg startposisjon i y-retning: " << endl;
		cin >> initPositionY;
		cout << "Velg startposisjon i x-etning: " << endl;
		cin >> initPositionX;
		cout << "Velg tid: " << endl;
		cin >> time;
		cout << "Fart i y-retning = " << velY(initVelocityY, time) << endl;
		cout << "Posisjon i x-retning = " << posX(initPositionX, initVelocityX, time) << endl;
		cout << "Posisjon i y-retning = " << posY(initPositionY, initVelocityY, time) << endl;
		cout << "Flygetid = " << flightTime(initVelocityY) << endl;
		double theta;
		double absVelocity;
		getUserInput(&theta, &absVelocity);
		double velocityX;
		double velocityY;
		getVelocityVector(degToRad(theta), absVelocity, &velocityX, &velocityY);
		double dis;
		std::cout << "Hva er avstanden til målet?" << std::endl;
		std::cin >> dis;
		std::cout << "Avstand tilbakelagt: " << getDistanceTraveled(velocityX, velocityY) << std::endl;
		std::cout << "Avvik fra målet: " << targetPractice(dis, velocityX, velocityY) << std::endl;
		int lower;
		std::cout << "Velg nedre grense:" << std::endl;
		std::cin >> lower;
		int upper;
		std::cout << "Velg øvre grense:" << std::endl;
		std::cin >> upper;
		int random = randomWithLimits(lower, upper);
		std::cout << "Tallet ble " << random << std::endl;
	}
	else if (test == 2) {
		playTargetPractice();
	}
	else {
		main();
	};
	int fornoyd;
	cout << "Tast 1 for nye verdier. Tast 0 for å avslutte: " << std::endl;
	cin >> fornoyd;
	if (fornoyd == 1) {
		main();
	}
	else {
		return 0;
	}


}