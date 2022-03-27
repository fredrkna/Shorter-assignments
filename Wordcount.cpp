#include <iostream>
#include <map>
#include <string>
#include "Wordcount.h"
using namespace std;

void Wordcount::addWord(std::string ord) {
	words.insert(make_pair(ord, 1));
}

ostream& operator<<(ostream& os, const Wordcount& telling) {
	for (auto elem : telling.words) {
		os << elem.first << ": " << elem.second << endl;
	}
	return os;
}

void Wordcount::updateWord(string ord) {
	words[ord]++;
}

bool Wordcount::wordInMap(std::string ord) {
	if (words.count(ord)) {
		return true;
	}
	else {
		return false;
	}
}
