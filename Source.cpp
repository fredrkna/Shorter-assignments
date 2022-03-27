

//2.a
#include <iostream>
double max(double a, double b) {
	if (a > b) {
		std::cout << "A is greater than B" << std::endl;
		return a;
	}
	else {
		std::cout << "B is greater than or equal A" << std::endl;
		return b;
	};
}

//2.c
#include <iostream>
int fibonacci(int n) {
	int a = 0;
	int b = 1;
	std::cout << "Fibonacci numbers:" << std::endl;
	for (int x = 1; x < n + 1; x++) {
		std::cout << x << b << std::endl;
		int temp = b;
		b = b + a;
		a = temp;
	};
	std::cout << "----" << std::endl;
	return b;
}

//2.d
#include <iostream>
int squareNumberSum(int n) {
	int totalSum = 0;
	for (int i = 1; i < n; i++) {
		totalSum += i * i;
		std::cout << i * i << std::endl;
	}
	return totalSum;
}

//2.e
#include <iostream>
int triangleNumbersBelow(int n) {
	int acc = 1;
	int num = 2;
	std::cout << "Triangle numbers below " << n << ":" << std::endl;
	while (acc<n) {
		std::cout << acc << std::endl;
		acc += num;
		num += 1;
	}
	std::cout << "" << std::endl;
	return 0;
}
bool isTriangleNumber(int number) {
	int acc = 1;
	while (number>0) {
		number -= acc;
		acc++;
	}
	return number == 0;
}

//2.f
#include <iostream>
bool isPrime(int n) {
	bool primeness = true;
	for (int j = 2; j < n; j++) {
		if (n%j == 0) {
			primeness = false;
			break;
		}
	}
	return primeness;
}

//2.g
#include <iostream>
int naivePrimeNumberSearch(int n) {
	for (int number = 2; number < n; number++) {
		if (isPrime(number)) {
			std::cout << number << "is a prime" << std::endl;
		}
	}
	return 0;
}

//2.h
#include <iostream>
int findGreatestDivisor(int n) {
	for (int divisor = n - 1; divisor > 0; divisor--) {
		if (n%divisor == 0) {
			return divisor;
		}
	}
}


//2.b
#include <iostream>
int main() {
	std::cout << "Oppgave a)" << std::endl;
	std::cout << max(5, 6) << std::endl;
	//	std::cout << "Oppgave c)" << std::endl;
	//	std::cout << fibonacci(5) << std::endl;
	std::cout << "Oppgave d)" << std::endl;
	std::cout << squareNumberSum(5) << std::endl;
	std::cout << "Oppgave e)" << std::endl;
	triangleNumbersBelow(12);
	std::cout << "Oppgave f)" << std::endl;
	std::cout << isTriangleNumber(11) << std::endl;
	std::cout << "Oppgave g)" << std::endl;
	std::cout << findGreatestDivisor(20) << std::endl;
	return 0;
}
