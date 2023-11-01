# ece-ntua-operating-systems

Lab Assignments for the [Operating Systems](https://www.ece.ntua.gr/en/undergraduate/courses/3136) course, during the 6th semester of the School of Electrical and Computer Engineering at the National Technical University of Athens.

## Lab Assignments

There were 4 lab assignments in total. Each assignment had a few problems to solve. The assignments covered the general principles of Operating Systems and provided a hands-on experience with the Linux kernel, using the C programming language and Bash, a Unix shell. 

The concepts involved in each assignment can be found below.

## Lab 01 - Introduction to Programming Environment

- Copying files
- Creating a new file by merging two input files
- Writing to file descriptors
- Handling command-line arguments
- Specifying input and output files via the command line
- Graceful error handling for missing input files

[]()

- Creating object files
- Linking object files to produce an executable
- Creating a Makefile for automating the build process
- Using `strace` for debugging and tracing system calls
- Working with Linux file paths and directories


## Lab 02 - Process Management and Inter-Process Communication

- Creating and managing processes
- Process tree structure and hierarchy
- Using `fork()` and `wait()` system calls
- Handling multiple processes concurrently
- Sending and receiving signals between processes
- Using signals like `SIGSTOP` and `SIGCONT` to control processes
- Implementing signal-based process synchronization
- Implementing recursive functions for tree-like data structures
- Traversing and manipulating recursive structures
- Using pipes for communication between processes
- Coordinating data exchange between parent and child processes
- Performing parallel computation in a tree structure
- Distributing computation tasks to multiple processes
- Aggregating results from multiple processes
- Debugging and diagnosing issues in concurrent programs
- Implementing error handling to identify and address programmatic errors
- Utilizing system calls like `raise()` and `strace` for process control and monitoring

## Lab 03 - Synchronization

- Understanding multithreading and POSIX thread programming
- Exploring synchronization mechanisms, including mutexes, semaphores, and condition variables defined by POSIX
- Using atomic operations, such as those provided by the GCC compiler, for synchronization
- Understanding process management and how to create and manage processes
- Working with signals for process control and communication
- Implementing parallel computation techniques in a multithreaded environment
- Debugging concurrent programs and measuring performance
- Implementing and parallelizing the calculation of the Mandelbrot set
- Using tools like `time` to measure program execution time and analyzing the performance of parallelized code
- Handling terminal interactions and restoring the terminal to its previous state

## Lab 04 - Virtual Memory Mechanisms

- Understanding the concept of virtual memory in operating systems
- Exploring system calls related to memory management, such as `mmap()`
- Studying the memory map of a process using `/proc/[pid]/maps`
- Using `mmap()` to allocate memory and create a memory map
- Examining the virtual and physical addresses associated with memory mapping
- Investigating the effect of zeroing out a buffer on memory mapping
- Mapping a file into the process's address space
- Reading and printing the content of the mapped file
- Observing the changes in the memory map after mapping a file
- Utilizing `fork()` to create a new process
- Comparing the memory maps of the parent and child processes
- Identifying and printing the physical addresses of private buffers
- Creating a shared memory buffer using `mmap()` for inter-process communication
- Writing and reading data from shared memory
- Investigating the impact of shared memory on memory mapping
- Employing semaphores to synchronize processes
- Placing semaphores in shared memory to enable inter-process synchronization
- Analyzing the performance of semaphore-based synchronization
- Comparing the performance of the multithreaded and multiprocess implementations
- Adapting the Mandelbrot set computation to parallel processing
- Distributing workload across processes for efficient parallelization
- Drawing conclusions about the performance of the processes-based implementation
- Analyzing the impact of shared memory and synchronization mechanisms