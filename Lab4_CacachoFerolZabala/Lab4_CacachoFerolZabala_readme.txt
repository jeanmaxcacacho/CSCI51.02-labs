Our C++ program implements a modified version of the russian peasant algorithm through an iterative approach. The motivation
behind the implementation of this specific algorithm lies in the hint provided in the lab specs about simulating the approach in
"x multiplied by 19" only through addition and bit shifting where we found a recursive problem of breaking down the coefficient
into the largest perfect powers of 2.

In the case of the example 19x:
19 = 16 + 3
19 = 16 + 2 + 1 (2^4 + 2^1 + 2^0 | 0b10011)

While our approach is iterative the method is the same and takes advantage of the binary representation of numbers.

Tracing the function call russianPeasant(x, 19)

step 0:
y = 0b10011
product = 0

step 1:
y & 1 is true 
product += x (x) 
shift x to the left by 1 (x is now 2x)
shift y to the right by 1 (y is now 0b1001)

step 2:
y & 1 is true
product += 2x (x + 2x)
shift x to the left by 1 (x is now 4x)
shift y to the right by 1 (y is now 0b100)

step 3:
y & 1 is false
product += 0 (x + 2x)
shift x to the left by 1 (x is now 8x)
shift y to the right by 1 (y is now 0b10)

step 4:
y & 1 is false
product += 0 (x + 2x)
shift x to the left by 1 (x is now 16x)
shift y to the right by 1 (y is now 0b1)

step 5:
y & 1 is true (x + 2x + 16x)
product += 16x
shift x to the left by 1 (x is now 32x)
shift y to the right by 1 (y is now 0b0)

step 6:
y == 0; loop terminates
return product 19x

Sign checking occurs at the start through a XOR check `bool isNegative = (a < 0) ^ (b < 0)`, this will only return true if a or b is negative but not both.
At the end the sign is applied depending on the truth value of isNegative. This works since |ab| = |-1 * ab|, we only need to apply the sign at the end of
the multiplication. Since sign application is applied based on the XOR check at the end along with the equality earlier stated, both function parameters are
passed into the abs() function after the XOR check. The runtime of this algorithm is logarithmic, in each iteration y is halved taking at most ⌈log(y)⌉ iterations
to reach 0, all other operations are assumed to have constant time complexity.