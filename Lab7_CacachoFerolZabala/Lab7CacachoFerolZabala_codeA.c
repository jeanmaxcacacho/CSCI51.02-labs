#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

/*
  1. pass an int to the run() function of a thread
  2. dynamically create pthread_t array, size equal to argc - 1; exit if argc == 1
  3. int passed should be index of the thread in the array
  4. assume all arguments execept first are positive, place them in int arr[]
     if x is even arr[x] cubed
     if x is odd arr[x] negated
  5. print results: "arr[x] (old) has been replaced with arr[x] (new)"
*/

int* arr;

void* run(void* indexPtr) {
  int index = *(int*)indexPtr;
  int oldVal = arr[index];

  if (index%2 == 0) {
    arr[index] = arr[index] * arr[index] * arr[index];
  } else {
    arr[index] = -arr[index];
  }

  printf("arr[%d](%d) has been replaced with arr[%d](%d)\n", index, oldVal, index, arr[index]);
  free(indexPtr);
  pthread_exit(NULL);
}

int main(int argc, char* argv[]) {
  if (argc==1) {
    printf("Error! No arguments detected in stdin!\n");
    abort();
  }

  int argCount = argc - 1;
  arr = (int*)malloc(sizeof(int)*argCount);
  pthread_t* threads = (pthread_t*)malloc(sizeof(pthread_t)*argCount);

  for (int i=0; i<argCount; i++) {
    arr[i] = atoi(argv[i+1]);
  }

  for (int i=0; i<argCount; i++) {
    int* index = malloc(sizeof(int));
    *index = i;
    pthread_create(&threads[i], NULL, run, index);
  }

  for (int i=0; i<argCount; i++) {
    pthread_join(threads[i], NULL);
  }

  free(arr);
  free(threads);

  return 0;
}