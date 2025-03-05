The program accepts input via stdin; in our testing we redirected a plain text
file containing the test values to our compiled executable. Our program handles
errors by terminating execution and not outputting garbage values. It will be written
to the console when cin.fail() is true, however the program itself does not have logic
to "correct" values.

Improperly formatted input will yield invalid values for the coordinates
because of how values are read from cin, garbage values will be printed onto the stream with output from
stderror. Streams read from cin after the main for loop will still output the correct manahattan distances
however will terminate the program with an error.

The variable T is initialized from the top of the plain text file, the next expected value
is then N. T is used as the main value to "iterate over" as this contains the amount of test
cases inside a text file. For initializing Point3D struct instances inside the array however
we iterate over N as this is the value that specifies the amount of points in each test case.

Values following N are then expected to tbe coordinates of the Point3D instances to be initialized.

    for (int j=0; j < N; j++) {
        // at this point we're effectively at the "end" of each test case in text file
        cin >> testPoints[j].x >> testPoints[j].y >> testPoints[j].z;
    }

Once cin has reached the "end" of a test case in the input text file (newline character followed
by whitespace), the next nested for loop commences.

    for (int k=0; k < N-1; k++) {
        cout << manhattanDist(&testPoints[k], &testPoints[k+1]) << endl;
    }

This effectively prints out to the console the manhattan distances of the adjacent points p_(i) and p_(i+1)
contained in the test case. The whole base for loop starts with `if(i > 0) cout << endl;` to have a line of
whitespace between each set of manhattan distances.