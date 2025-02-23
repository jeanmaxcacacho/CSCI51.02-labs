#include <iostream>

using namespace std;

int russianPeasant(int x, int y);

int main(void) {
    // cout << "Product of 2 and 3: " << russianPeasant(2, 3) << endl;
    // cout << "Product of 12 and 12: " << russianPeasant(12, 12) << endl;
    // cout << "Product of 9 and 4: " << russianPeasant(9, 4) << endl;
    // cout << "Product of -2 and 5: " << russianPeasant(-2, 5) << endl;
    // cout << "Product of -2 and -14: " << russianPeasant(-2, -14) << endl;
    // cout << "Product of -9 and 100: " << russianPeasant(-9, 100) << endl;

    int x = 7;

    cout << "Product of 7 and 45: " << russianPeasant(x, 45) << endl;
    cout << "Product of 7 and -2: " << russianPeasant(x, -2) << endl;
    cout << "Product of 7 and 0: " << russianPeasant(x, 0) << endl;

    // expected values are 315, -14, and 0
    return 0;
}

// https://www.youtube.com/watch?v=N_RC0skbReU
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