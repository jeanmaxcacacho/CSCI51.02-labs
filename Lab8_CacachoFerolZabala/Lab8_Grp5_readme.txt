Our lab assignment output consists of two C programs: (i) one that reads from
a text file and writes to shared memory, (ii) another that reads from the
shared memory and writes to another text file. Synchronization is achieved
between the two programs using one semaphore that controls process access
to the shared memory.

Both programs function by accsesing an intermediate storage buffer accompanied
by the shared memory data segment. The producer initializes the semaphore to 1,
an "unlocked" state; the write loop starts with a wait followed by a post signal.
This setup allows the producer to execute first, writing the first chunk of data
into memory; after this, control is passed to the consumer program which reads
from the shared memory and writes to a specified output file.

Data is transferred in chunks as specified by the argv elements passed in by the
program user. Both producer and writer send streams to stdout to provide an indicator
of chunk content when a chunk is sent and/or received. Once the producer no longer
reads any elements from a file (facilitated by stdio's fread), the write loop is broken;
the prodcuer sends a single '\0' character to the consumer which also "signals" the
consumer to stop its read/write loop.