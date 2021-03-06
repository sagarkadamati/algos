#include "TeluguAksharam.h"

TeluguAksharam::TeluguAksharam() {
	achchu.second = "";
	deergam.second = "";
	isSpecial = false;
	// setupFont(*lut)((*lut));
}

TeluguAksharam::TeluguAksharam(TeluguDict &l, queue< pair<unsigned short, string> > &backup) {
	achchu.second = "";
	deergam.second = "";
	isSpecial = false;

	lut = &l;

	while (!backup.empty()) {
		vothulu.push_back(backup.front());
		backup.pop();
	} 
}

TeluguAksharam::~TeluguAksharam() {
}

string TeluguAksharam::toString() {
	string s = achchu.second;

	// cout << achchu.second << endl;

	for(vector< pair<unsigned short, string> >::iterator c = vothulu.begin(); c != vothulu.end(); c++) {
		// s += "్" + c->second;
		s += c->second;
	}

	s += deergam.second;
	s += sarga.second;
	return s;
}

void TeluguAksharam::insertVothu(unsigned short c, queue< pair<unsigned short, string> > &backup) {
	if ((*lut)[c].second == string("ర")) {
		backup.push(make_pair(c, "్" + (*lut)[c].second));
	} else {
		vothulu.push_back(make_pair(c, "్" + (*lut)[c].second));
	}
}

void TeluguAksharam::insert(unsigned short c, queue< pair<unsigned short, string> > &backup) {
	if (lut->isSkip(c)) {
		return;
	} else if (lut->isAchu(c)) {
		achchu = (*lut)[c];
		// cout << achchu.second << "  " << (*lut)[c].second << endl;
	} else if (lut->isDeergam(c)) {
		lut->getNewDeergam(deergam.first, c, achchu, deergam, vothulu);
	} else if (lut->isVothu(c)) {
		if ((*lut)[c].second == string("్ర")) {
			backup.push(make_pair(c, (*lut)[c].second));
		} else {
			lut->fillVothulu(c, achchu, deergam, vothulu);
		}
	} else if (lut->isSarga(c)) {
		sarga = (*lut)[c];
	} else if (lut->isAksharam(c)) {
		lut->fillAksharam(c, achchu, deergam, vothulu);
	} else if (lut->isSpecial(c)) {
		achchu = (*lut)[c];
		isSpecial = true;
	} else {
		// cout << "Not found in (*lut)" << endl;
	}
}