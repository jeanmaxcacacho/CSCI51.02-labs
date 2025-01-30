#include <iostream>
#include <string>
using namespace std;


int main() {
    int numLines;
    cin >> numLines;

    if (cin.fail()) {
        cout << "Error: First line in input text file is not an integer!" << endl;
        return 1;
    }

    for (int currentLine = 1; currentLine <= numLines; currentLine++) {
        int x, y;
        string str;

        cin >> x >> y;

        if (cin.fail()) {
            cout << "Error: Invalid input detected, not both coordinates of Agent#" << currentLine << " are integers!" << endl;
            return 1;
        }

        if (cin.peek() == '\n' || cin.eof()) {
            cout << "Error: Invalid input detected, Agent#" << currentLine << " message does not exist!" << endl;
            return 1;
        }

        getline(cin >> ws, str);

        cout << "Agent#" << currentLine << " is at (" <<  x << ", " << y << ")" << endl;
        cout << "Says: " << str << endl;
    }

    if (!(cin.eof())) {
        cout << "Error: Amount of lines below the first line does not match N!" << endl;
        return 1;
    }

    return 0;
}