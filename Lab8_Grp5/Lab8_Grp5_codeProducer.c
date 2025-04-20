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
    if (shmID == -1) {
        perror("shmget");
        fclose(filePtr);
        exit(1);
    }

    char* data = (char*)shmat(shmID, NULL, 0);
    if (data == (char*)-1) {
        perror("shmat");
        shmctl(shmID, IPC_RMID, NULL);
        fclose(filePtr);
        exit(1);
    }

    int semID = semget(SEM_KEY, 1, IPC_CREAT | 0666);
    if (semID == -1) {
        perror("semget");
        shmdt(data);
        shmctl(shmID, IPC_RMID, NULL);
        fclose(filePtr);
        exit(1);
    }

    // init semaphore, starts unlocked
    semctl(semID, 0, SETVAL, 1);

    // data transfer is sequential, write until buffer is full
    // once buffer is full reader starts, while reading can't write
    // once reader is done start writing again until full buffer
    // each iteration of the loop will fill the buffer up/reach EOF
    // the first thing that always happens is writing the first chunk
    // to the shared memory, ALWAYS that's what will happen
    // once the first chunk gets written, the producer will wait

    char* buffer = (char*)malloc((size_t) shmSize+1); // we're transferring shmSize bytes at a time
    if (buffer == NULL) {
        perror("malloc");
        shmdt(data);
        shmctl(shmID, IPC_RMID, NULL);
        semctl(semID, 0, IPC_RMID);
        fclose(filePtr);
        exit(1);
    }

    size_t bytesRead; // fread returns # of elements read
    int chunkIndex = 1;
    while ((bytesRead = fread(buffer, 1, shmSize, filePtr)) > 0) {
        sem_wait(semID); // this works since we init the semaphore set to 1
        buffer[bytesRead] = '\0'; // null terminate each chunk | ok so it's actually being written now kekW
        printf("Chunk %d:\n", chunkIndex);
        fwrite(buffer, 1, bytesRead + 1, stdout); // write to terminal as visual indicator
        printf("\n");
        memcpy(data, buffer, bytesRead + 1); // write to shared memory
        chunkIndex++;
        sem_post(semID);
        sleep(2); // how many seconds I have to execute on the other terminal lmfao
    }
    sem_wait(semID);
    data[0] = '\0'; // signal done producing
    sem_post(semID);

    free(buffer);
    fclose(filePtr);
    shmdt(data);

    shmctl(shmID, IPC_RMID, NULL);
    semctl(semID, 0, IPC_RMID);

    return 0;
}