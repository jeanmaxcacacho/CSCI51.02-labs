#include <iostream>
#include <vector>
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
    vector<string> strings;
    string word;

    while (cin >> word) {
        strings.push_back(word);
    }

    printf("Agent#1 is at (%s,%s)\n", strings[1].c_str(), strings[2].c_str());
    printf("Says: %s %s\n", strings[3].c_str(), strings[4].c_str());
    printf("Agent#2 is at (%s, %s)\n", strings[5].c_str(), strings[6].c_str());
    printf("Says: %s\n", strings[7].c_str());
    printf("Agent#3 is at (%s, %s)\n", strings[8].c_str(), strings[9].c_str());
    printf("Says: %s %s\n", strings[10].c_str(), strings[11].c_str());

    return 0;
}
