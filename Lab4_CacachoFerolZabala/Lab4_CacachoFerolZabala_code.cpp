#include <iostream>

using namespace std;

int manMult(int x, int y);

int main(void) {
    cout << "2 and 3: " << manMult(2, 3) << endl;
    cout << "12 and 12: " << manMult(12, 12) << endl;
    cout << "9 and 4: " << manMult(9, 4) << endl;
    cout << "-2 and 5: " << manMult(-2, 5) << endl;
    cout << "-2 and -14: " << manMult(-2, -14) << endl;

    // expected to see 6, 144, 36, -10, and 28 respectively

    return 0;
}

int manMult(int x, int y) {
    bool isNegative = (x < 0) ^ (y < 0);

    x = abs(x);
    y = abs(y);

    int product = 0;
    int current_x = x;

    while (y > 0) {
        if (y & 1) {
            product += current_x;
        }
        current_x <<= 1;
        y >>= 1;
    }

    return isNegative ? -product : product;
}