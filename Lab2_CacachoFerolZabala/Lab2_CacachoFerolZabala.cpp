#include <iostream>
#include <string>
using namespace std;

/*
    EXPECTED OUTPUT IS

    Agent#1 is at (19,88)
    Says: hello there
    Agent#2 is at (1,2)
    Says: 3
    Agent#3 is at (9,9)
    Says: 9 9
*/

int main() {
    int numLines;
    cin >> numLines;

    for (int currentLine = 1; currentLine <= numLines; currentLine++) {
        int x, y;
        string str;

        cin >> x >> y;
        getline(cin >> ws, str);

        cout << "Agent#" << currentLine << " is at (" <<  x << ", " << y << ")" << endl;
        cout << "Says: " << str << endl;
    }

    return 0;
}
