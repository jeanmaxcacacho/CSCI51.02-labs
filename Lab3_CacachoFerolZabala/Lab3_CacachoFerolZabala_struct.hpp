#include <iostream>
using namespace std;

struct IntNode {
    int data;
    IntNode* next;

    IntNode(int data) {
        this->data = data;
        this->next = nullptr;
    }
};

// implement push, pop, and peek
// stack top is the head of linkedlist

struct IntStack {
    IntNode* top;

    // init the data structure to be empty
    IntStack() {
        this->top = nullptr;
    }

    // just check for stack underflow
    bool isEmpty() {
        return top == nullptr;
    }

    void push(int data) {
        IntNode* newNode = new IntNode(data);
        newNode->next = top;
        this->top = newNode;
        cout << "'" << top->data << "' has been pushed onto the stack." << endl;
    }

    int pop() {
        if (isEmpty()) {
            cout << "Stack is empty, nothing to pop." << endl;
            return 0;
        }

        IntNode* temp = top;
        int temp2 = temp->data;
        this->top = top->next;
        delete temp;

        cout << "'" << temp2 << "' has been popped from the stack." << endl;

        return temp2;
    }

    int peek() {
        if (isEmpty()) {
            cout << "Stack is empty, nothing to peek." << endl;
            return 0;
        }

        return top->data;
    }

    ~IntStack() {
        while(!isEmpty()) {
            pop();
        }
    }

};