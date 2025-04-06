Code A:
The program takes in a sequence of positive integers from stdin and transforms
these integers depending on its parity. Even integers are cubed while odd integers
are negated. This operation is done concurrently, for each integer in the sequence
an individual thread is instantiated.

Code B:
The program accepts an arbitrary N and X value from the user through stdin, N represents
the amount of threads to instantiate and X the value to operate on. What effectively happens
is that N threads are instantiated to calculate sin(x) through the functions Taylor expansion.

X is automatically assumed to be in radians. Because of the COMPUTE_LIMIT and the
representational limits of the long double type, the program produces garbage outputs
for very large X values.