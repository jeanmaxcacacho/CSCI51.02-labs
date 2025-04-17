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

// ./producer <source_text> <shm_size>
int main(int argc, char* argv[]) {
    if (argc != 3) {
        printf("Usage: %s <source_text> <shm_size>\n", argv[0]);
        exit(1);
    }

    char* filePath = argv[1];
    int shmSize = atoi(argv[2]);

    if (shmSize <= 0) {
        printf("Invalid shm_size specified.");
        exit(1);
    }

    FILE* filePtr = fopen(filePath, "r");
    if (!filePtr) {
        perror("fopen");
        exit(1);
    }

    // so once done with input validation init IPC constructs
    int shmID = shmget(SHM_KEY, (size_t) shmSize, IPC_CREAT | 0666);
    char* data = (char*)shmat(shmID, NULL, 0);

    int semID = semget(SEM_KEY, 1, IPC_CREAT | 0666);
    semctl(semID, 0, SETVAL, 1);

    // data transfer is sequential, write until buffer is full
    // once buffer is full reader starts, while reading can't write
    // once reader is done start writing again until full buffer

    return 0;
}