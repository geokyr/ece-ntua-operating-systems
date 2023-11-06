# ece-ntua-operating-systems

Lab Assignments for the [Operating Systems](https://www.ece.ntua.gr/en/undergraduate/courses/3136) course, during the 6th semester of the School of Electrical and Computer Engineering at the National Technical University of Athens.

## Contributors

- [Georgios Kyriakopoulos](https://github.com/geokyr)
- [Serafeim Tzelepis](https://github.com/sertze)

## Lab Assignments

There were 4 lab assignments in total. Each assignment had a few problems to solve. The assignments covered the general principles of Operating Systems and provided a hands-on experience with the Linux kernel, using the C programming language and Bash, a Unix shell. 

The concepts involved in each assignment can be found below.

## Lab 01 - Unix Programming Environment

- Working with Linux file paths and directories
- Creating a new file by merging two input files
- Writing to files using file descriptors
- Specifying input and output files via the command line with proper error handling
- Handling command-line arguments
- Creating and linking object files to produce an executable
- Creating a Makefile for automating the build process
- Using `strace` for debugging and tracing system calls

## Lab 02 - Process Management and Inter-Process Communication

- Creating and managing processes concurrently
- Process tree structure and hierarchy
- Using `fork()` and `wait()` system calls
- Sending and receiving signals between processes, like `SIGSTOP` and `SIGCONT` to control processes and synchronize their execution
- Traversing and manipulating recursive structures
- Using pipes for coordinating data exchange between parent and child processes
- Performing parallel computation in a tree structure, by distributing computation tasks to multiple processes
- Aggregating results from multiple processes
- Implementing error handling to identify and diagnose programmatic errors
- Utilizing system calls like `raise()` and `strace` for process control and monitoring

## Lab 03 - Synchronization

- Understanding multithreading and POSIX thread programming
- Exploring synchronization mechanisms, including mutexes, semaphores, and condition variables defined by POSIX
- Using atomic operations, such as those provided by the GCC compiler, for synchronization
- Implementing parallel computation techniques in a multithreaded environment
- Debugging concurrent programs and measuring performance
- Implementing and parallelizing the calculation of the Mandelbrot set
- Using tools like `time` to measure program execution time and analyzing the performance of parallelized code
- Handling terminal interactions and restoring the terminal to its previous state after program interruption

## Lab 04 - Virtual Memory Mechanisms

- Understanding the concept of virtual memory in operating systems
- Studying the memory map of a process using `/proc/[pid]/maps`
- Using `mmap()` to allocate memory and create a memory map
- Examining the virtual and physical addresses associated with memory mapping
- Mapping a file into the process's address space and then reading and printing the content of it, while observing the changes in the memory map
- Creating a new process using `fork()` and comparing the memory maps of the parent and child processes
- Creating a shared memory buffer using `mmap()` for inter-process communication
- Writing and reading data from shared memory
- Employing semaphores to synchronize processes and placing them in shared memory to enable inter-process synchronization
- Adapting the Mandelbrot set computation to parallel processing
- Distributing workload across processes for efficient parallelization
