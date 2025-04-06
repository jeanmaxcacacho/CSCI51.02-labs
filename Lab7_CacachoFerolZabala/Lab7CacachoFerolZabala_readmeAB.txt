Code A:
The program takes in a sequence of positive integers from stdin and transforms
these integers depending on its index's parity. Integers located within even
indexes are cubed while integers in odd indexes are negated. This operation is
done concurrently, for each integer in the sequence an individual thread is instantiated.

Code B:
The program accepts an arbitrary N and X value from the user through stdin, N represents
the amount of threads to instantiate and X the radian value to operate on. What effectively
happens is that N threads are instantiated to calculate sin(x) through the Taylor expansion.

Because of the COMPUTE_LIMIT and the representational limits of the long double type, the program
produces garbage outputs for large X values.