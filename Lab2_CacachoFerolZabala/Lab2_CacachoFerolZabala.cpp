#include <iostream>
#include <string>
using namespace std;


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
