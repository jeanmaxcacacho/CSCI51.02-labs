#include <iostream>

using namespace std;

int russianPeasant(int x, int y);

int main(void) {
    int x = 7;

    cout << "Product of 7 and 45: " << russianPeasant(x, 45) << endl;
    cout << "Product of 7 and -2: " << russianPeasant(x, -2) << endl;
    cout << "Product of 7 and 0: " << russianPeasant(x, 0) << endl;

    // expected values are 315, -14, and 0
    return 0;
}

int russianPeasant(int x, int y) {
    if (x == 0 || y == 0) return 0;

    bool isNegative = (x < 0) ^ (y < 0);

    x = abs(x);
    y = abs(y);

    int product = 0;

    while (y > 0) {
        if (y & 1) product += x;
        
        x <<= 1;
        y >>= 1;
    }

    if (isNegative) product = -product;

    return product;
}