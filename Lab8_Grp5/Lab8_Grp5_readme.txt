Our lab assignment output consists of two C programs: (i) one that reads from
a text file and writes to shared memory, (ii) another that reads from the
shared memory and writes to another text file. Synchronization is achieved
between the two programs using one semaphore that controls process access
to the shared memory segment.

Both programs function by accessing an intermediate storage buffer that acts
as the shared memory's "instance" in that program. The producer initializes the
semaphore to 1, an "unlocked" state; the write loop starts with a wait followed
by a post signal. This setup allows the producer to execute first, writing the
first chunk of data into memory. After, control is passed to the consumer program
which reads from the shared memory and writes to a specified output file.

Data is transferred in chunk sizes specified by argv[2] passed in by the program user.
Both producer and consumer write streams to stdout to provide a visual indicator of chunk
content when a chunk is sent and/or received. Once the producer no longer reads any elements
from a file (facilitated by stdio's fread), the write loop is broken; the producer sends
a single '\0' character to the consumer which "signals" the consumer to stop its read/write loop.