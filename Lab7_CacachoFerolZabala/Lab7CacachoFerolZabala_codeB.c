/*
  arbitrary number of threads to compute sin(x), access same entry function

  N is an integer > 0, number of threads to spawn
  X is any real number, argument to sin func
*/

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <math.h>
#include <unistd.h>
