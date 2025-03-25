#include <iostream>
#include <unistd.h> // fork() and sleep() come from here
#include <ctime>

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
        int counter = 1; // start at 1st print-out

        while (true) {
            time_t now = time(nullptr);
            tm *t = localtime(&now);
            printf("[%04d-%02d-%02d] %02d:%02d:%02d\n",
                   t->tm_year + 1900, t->tm_mon + 1, t->tm_mday,
                   t->tm_hour, t->tm_min, t->tm_sec);
            if (counter == 3) {
                counter == 0;
                printf("\"This program has gone on for far too long. Type Ctrl+C to abort this timer application.\"\n");
            }
            counter++;
            sleep(10);
        }
    }

    return 0;
}