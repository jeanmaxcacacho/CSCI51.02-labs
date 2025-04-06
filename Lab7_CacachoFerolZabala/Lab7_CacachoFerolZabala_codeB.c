/*
  arbitrary number of threads to compute sin(x), access same entry function

  N is an integer > 0, number of threads to spawn
  X is any real number, argument to sin func

  ./a.out < N X

  thread 0: 0, N, 2N, 3N, 4N
  thread 1: 1, N+1, 2N+2, 3N+1, 4N+1

  BONECA AMBALABU

  thread N-1: N-1, 2N-1, 3N-1, 4N-1

  get sin through taylor expansion:
  x/1 - x^3/3! + x^5/5! - x^7/7! + x^9/9!

  Each thread will compute enough terms assigned to them until the term last
  computed has an absolute value less than 10^-16
*/

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <math.h>
#include <unistd.h>

#define COMPUTE_LIMIT 1e-16

long double* toSum;
int N;
long double X;

long double power(long double base, int exp) {
    long double result = 1.0;
    for (int i=0; i<exp; i++) {
        result *= base;
    }
    return result;
}

long double factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
}

void* compute_terms(void* arg) {
    int thread_id = *(int*)arg;
    int k = thread_id;
    long double term;
    toSum[thread_id] = 0.0;

    while (1) {
        int sign = (k%2==0) ? 1: - 1;
        long double numerator = power(X, 2*k + 1);
        long double denominator = factorial(2*k + 1);
        term = sign * numerator/denominator;

        if (fabsl(term) < COMPUTE_LIMIT) {
            break;
        }

        toSum[thread_id] += term;
        k += N;
    }

}

int main(int argc, char* argv[]) {
    if (argc != 3) {
        printf("Usage: %s N X\n", argv[0]);
        return -1;
    }

    N = atoi(argv[1]);
    X = strtold(argv[2], NULL);

    if (N <= 0) {
        printf("Error: N must be a positive integer.\n");
        return -1;
    }

    pthread_t* threads = malloc(sizeof(pthread_t) * N);
    toSum = malloc(sizeof(long double) * N);

    for (int i=0; i<N; i++) {
        int* thread_id = malloc(sizeof(int));
        *thread_id = i;
        pthread_create(&threads[i], NULL, compute_terms, thread_id);
    }

    for (int i=0; i<N; i++) {
        pthread_join(threads[i], NULL);
    }

    long double final_sum = 0.0;
    for (int i=0; i<N; i++) {
        final_sum += toSum[i];
    }

    printf("Fake sin(%.15Lf) = %.15Lf\n", X, final_sum);
    printf("Real sin(%.15Lf) = %.15Lf\n", X, sinl(X));

    free(threads);
    free(toSum);

    return 0;
}