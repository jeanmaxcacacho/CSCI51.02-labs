#include <iostream>
#include <vector>
#include <cmath>

using namespace std;

// Function to compute Manhattan distance between two 3D points
int manhattanDistance(const vector<int>& p1, const vector<int>& p2) {
    return abs(p1[0] - p2[0]) + abs(p1[1] - p2[1]) + abs(p1[2] - p2[2]);
}

int main() {
    int T;
    cin >> T; 
    
    while (T--) {
        int N;
        cin >> N; // Number of points
        
        vector<vector<int>> points(N, vector<int>(3));
        
        for (int i = 0; i < N; i++) {
            cin >> points[i][0] >> points[i][1] >> points[i][2];
        }
        
        for (int i = 0; i < N - 1; i++) {
            cout << manhattanDistance(points[i], points[i + 1]) << endl;
        }
        
        if (T > 0) cout << endl; // Separate test cases with a blank line
    }
    
    return 0;
}
