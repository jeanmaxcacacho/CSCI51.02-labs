#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/sem.h>

#define SHM_KEY 1234
#define SEM_KEY 4567

void sem_wait(int semID) {
    struct sembuf op;

    op.sem_num = 0;
    op.sem_op = -1;
    op.sem_flg = SEM_UNDO;

    semop(semID, &op, 1);
}

void sem_post(int semID) {
    struct sembuf op;

    op.sem_num = 0;
    op.sem_op = +1;
    op.sem_flg = SEM_UNDO;

    semop(semID, &op, 1);
}

// ./consumer <out_text> <shm_size>
int main(int argc, char* argv[]) {
    if (argc != 3) {
        printf("Usage: %s <out_text> <shm_size>", argv[0]);
        exit(1);
    }

    char* filePath = argv[1];
    int shmSize = atoi(argv[2]);

    if (shmSize <= 0) {
        printf("Invalid shm_size specified.");
        exit(1);
    }

    FILE* filePtr = fopen(filePath, "w");
    if (!filePtr) {
        perror("fopen");
        exit(1);
    }

    // consumer perms are only 0666, no semaphore init
    int shmID = shmget(SHM_KEY, (size_t) shmSize, 0666);
    char* data = (char*)shmat(shmID, NULL, 0);

    int semID = semget(SEM_KEY, 1, 0666);

    // TODO: implement writing to out.txt and proper loop termination

    char* buffer = (char*)malloc((size_t) shmSize+1);
    int chunkIndex = 1;
    while (/*read from shared memory*/ 1) {
        sem_wait(semID);

        if (data[0] == '\0') {
            sem_post(semID);
            break;
        }

        memcpy(buffer, data, shmSize + 1);
        // buffer[shmSize] = '\0'; // just in case (safety)

        // if (strlen(buffer) == 0) {
        //     sem_post(semID);
        //     break;
        // }

        printf("Chunk %d:\n %s\n", chunkIndex, buffer);
        fwrite(buffer, 1, strlen(buffer), filePtr);

        chunkIndex++;

        memset(buffer, 0, shmSize + 1);
        sem_post(semID);
        sleep(2);
    }

    return 0;
}