#include <iostream>

using namespace std;

// INPUT

// First line of input consists of a single integer ​T​ denoting the
// number of test cases, followed by ​T​ sets of lines describing each test case.

// Each test case starts with a line containing a single integer ​N​ (​N​ > 1) denoting 
// the number of points in the list, followed by ​N​ lines which describes all 3D points
// in the list (1 line = 1 3D point). Each line contains 3 integers ​x​, ​y​, and ​z​ which 
// corresponds to the x, y, and z coordinate of the point respectively.

// OUTPUT

// For each test case, there should be exactly ​N​-1 lines containing the Manhattan distance 
// between adjacent points in the list. Output for each test case should be separated by a single blank line.

// SAMPLE TEST CASES

/*
    2
    3
    5 5 5
    10 10 10
    12 13 14
    15
    9
    

    2
    9 1 7
    10 2 8
    3
*/

struct Point3D {
    int x;
    int y;
    int z;
};

int manhattanDist(Point3D* p1, Point3D* p2) {
    return abs(p1->x - p2->x) + abs(p1->y - p2->y) + abs(p1->z - p2->z);
}

int main(void) {
    int T;
    cin >> T;

    if (cin.fail() || T <= 0) {
        cerr << "Invalid value for T! Program terminated!" << endl;
        return -1;
    }

    for (int i=0; i < T; i++) {
        if (i > 0) cout << endl;

        int N; // redeclare N for each test case
        cin >> N;
            if (cin.fail() || N < 2) {
                cerr << "Invalid value for N! Program terminated!" << endl;
                return -1;
            }
        Point3D testPoints[N];

        for (int j=0; j < N; j++) {
            // at this point we're effectively at the "end" of each test case in text file
            cin >> testPoints[j].x >> testPoints[j].y >> testPoints[j].z;
            if (cin.fail()) {
                cerr << "Invalid value for one or more of the coordinates! Program terminated!" << endl;
                return -1;
            }
        }

        for (int k=0; k < N-1; k++) {
            cout << manhattanDist(&testPoints[k], &testPoints[k+1]) << endl;
        }
    }
    return 0;
}