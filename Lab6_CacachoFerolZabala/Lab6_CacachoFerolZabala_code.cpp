#include <iostream>
#include <unistd.h>

using namespace std;

int main(int argc, char* argv[]) {
    pid_t proc_id = fork();

    if (proc_id < 0) {
        cout << "Fork failed!" << endl;
        return -1;
    } else if (proc_id == 0) {
        if (execv("/usr/bin/xclock", argv) == -1) {
            cout << "Program was not able to run! Terminate process!" << endl;
            return -1;
        }
    } else {
        cout << "I am your parent nigga!" << endl;
    }

    return 0;
}