Our implementation of the fork() and exec() clock timer program is relatively intuitive.
When a process is forked, the fork() system call is executed, there are three cases for
its return value: (i) 0 is returned to the child process, (ii) any positive value is returned
to the parent process and this is the process id of the child process, and (iii) a negative
value indicates that the work was not able to be successful.

The first if statement catches failed forks, if a fork fails then the program as a whole is terminated,
if the fork is successful then the program continues execution. When the proc_id is 0, exec is called to
replace that process with the xclock program, if the program cannot be located in the specified path then
exec will return a negative value and terminate that process. Simultaneously, the parent process uses time
objects defined in the ctime library to print out to the console the system clock every 10 seconds.

An interesting thing of note is that once the fork has been called, the parent process is independent of the child,
the child however terminates when the parent does also. In the case that the fork succeeds but the exec does not,
the child process will terminate but the parent process still continues printing the time to the terminal.