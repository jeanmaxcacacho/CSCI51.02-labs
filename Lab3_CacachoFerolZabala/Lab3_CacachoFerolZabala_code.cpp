#include <iostream>
#include "Lab3_CacachoFerolZabala_struct.hpp"

using namespace std;

int main(void) {
    IntStack intStack = IntStack();
    intStack.push(6);
    intStack.push(5);
    intStack.push(4);
    intStack.push(3);
    intStack.push(2);
    intStack.push(1);

    // expected here is 1
    cout << "The stack's current top is '" << intStack.top->data << "'." << endl;

    intStack.pop();
    intStack.pop();
    // expected here is 3
    cout << "The stack's current top is '" << intStack.top->data << "'." << endl;
    // expected here is still 3
    cout << "The stack's current top is '" << intStack.peek() << "'." << endl;
    return 0;
    // 3 4 5 6 will get printed to console because of the destructor
}