/*
 * mmap.c
 *
 * Examining the virtual memory of processes.
 *
 * Operating Systems course, CSLab, ECE, NTUA
 *
 */

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <sys/mman.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
#include <stdint.h>
#include <signal.h>
#include <sys/wait.h>

#include "help.h"

#define RED     "\033[31m"
#define RESET   "\033[0m"


char *heap_private_buf;
char *heap_shared_buf;

char *file_shared_buf;

uint64_t buffer_size;
off_t size;

/*
 * Child process' entry point.
 */
void child(void)
{
	uint64_t pa;

	/*
	 * Step 7 - Child
	 */
	if (0 != raise(SIGSTOP))
		die("raise(SIGSTOP)");
	/*
	 * TODO: Write your code here to complete child's part of Step 7.
	 */
	printf("Child's Virtual Memory Map\n");
	show_maps();

	/*
	 * Step 8 - Child
	 */
	if (0 != raise(SIGSTOP))
		die("raise(SIGSTOP)");
	/*
	 * TODO: Write your code here to complete child's part of Step 8.
	 */
	pa = get_physical_address((uint64_t)heap_private_buf);
	if(pa) {
		printf("Child: 0x%lu\n", pa);
	}

	/*
	 * Step 9 - Child
	 */
	if (0 != raise(SIGSTOP))
		die("raise(SIGSTOP)");
	/*
	 * TODO: Write your code here to complete child's part of Step 9.
	 */
	int i;
	for(i = 0; i < get_page_size(); i++){
		heap_private_buf[i] = 2;
	}
	
	pa = get_physical_address((uint64_t)heap_private_buf);
	if(pa) {
		printf("Child: 0x%lu\n", pa);
	}

	/*
	 * Step 10 - Child
	 */
	if (0 != raise(SIGSTOP))
		die("raise(SIGSTOP)");
	/*
	 * TODO: Write your code here to complete child's part of Step 10.
	 */
	for(i = 0; i < get_page_size(); i++){
		heap_shared_buf[i] = 3;
	}
	
	pa = get_physical_address((uint64_t)heap_shared_buf);
	if(pa) {
		printf("Child: 0x%lu\n", pa);
	}

	/*
	 * Step 11 - Child
	 */
	if (0 != raise(SIGSTOP))
		die("raise(SIGSTOP)");
	/*
	 * TODO: Write your code here to complete child's part of Step 11.
	 */
	if (mprotect(heap_shared_buf, buffer_size, PROT_READ) == -1) {
        	perror("Failed to remove write protection on child process.");
	}
	
	printf("Child:\n");
	show_va_info((uint64_t)heap_shared_buf);
	show_maps();

	/*
	 * Step 12 - Child
	 */
	/*
	 * TODO: Write your code here to complete child's part of Step 12.
	 */
	if(munmap(heap_private_buf, 2 * get_page_size()) == -1) {
		perror("Failed to unmap heap_private_buf.");
	}
	if(munmap(heap_shared_buf, get_page_size()) == -1) {
		perror("Failed to unmap heap_shared_buf.");
	}
	if(munmap(file_shared_buf, size) == -1) {
		perror("Failed to unmap file_shared_buf.");
	}
	
	printf("Child:\n");
	show_va_info((uint64_t)heap_private_buf);
	show_va_info((uint64_t)heap_shared_buf);
	show_va_info((uint64_t)file_shared_buf);
	printf("\n");
}

/*
 * Parent process' entry point.
 */
void parent(pid_t child_pid)
{
	uint64_t pa;
	int status;

	/* Wait for the child to raise its first SIGSTOP. */
	if (-1 == waitpid(child_pid, &status, WUNTRACED))
		die("waitpid");

	/*
	 * Step 7: Print parent's and child's maps. What do you see?
	 * Step 7 - Parent
	 */
	printf(RED "\nStep 7: Print parent's and child's map.\n" RESET);
	press_enter();

	/*
	 * TODO: Write your code here to complete parent's part of Step 7.
	 */
	printf("Parent's Virtual Memory Map\n");
	show_maps();

	if (-1 == kill(child_pid, SIGCONT))
		die("kill");
	if (-1 == waitpid(child_pid, &status, WUNTRACED))
		die("waitpid");


	/*
	 * Step 8: Get the physical memory address for heap_private_buf.
	 * Step 8 - Parent
	 */
	printf(RED "\nStep 8: Find the physical address of the private heap "
		"buffer (main) for both the parent and the child.\n" RESET);
	press_enter();

	/*
	 * TODO: Write your code here to complete parent's part of Step 8.
	 */
	pa = get_physical_address((uint64_t)heap_private_buf);
	if(pa) {
		printf("Parent: 0x%lu\n", pa);
	}

	if (-1 == kill(child_pid, SIGCONT))
		die("kill");
	if (-1 == waitpid(child_pid, &status, WUNTRACED))
		die("waitpid");


	/*
	 * Step 9: Write to heap_private_buf. What happened?
	 * Step 9 - Parent
	 */
	printf(RED "\nStep 9: Write to the private buffer from the child and "
		"repeat step 8. What happened?\n" RESET);
	press_enter();

	/*
	 * TODO: Write your code here to complete parent's part of Step 9.
	 */
	pa = get_physical_address((uint64_t)heap_private_buf);
	if(pa) {
		printf("Parent: 0x%lu\n", pa);
	}

	if (-1 == kill(child_pid, SIGCONT))
		die("kill");
	if (-1 == waitpid(child_pid, &status, WUNTRACED))
		die("waitpid");


	/*
	 * Step 10: Get the physical memory address for heap_shared_buf.
	 * Step 10 - Parent
	 */
	printf(RED "\nStep 10: Write to the shared heap buffer (main) from "
		"child and get the physical address for both the parent and "
		"the child. What happened?\n" RESET);
	press_enter();

	/*
	 * TODO: Write your code here to complete parent's part of Step 10.
	 */
	pa = get_physical_address((uint64_t)heap_shared_buf);
	if(pa) {
		printf("Parent: 0x%lu\n", pa);
	}

	if (-1 == kill(child_pid, SIGCONT))
		die("kill");
	if (-1 == waitpid(child_pid, &status, WUNTRACED))
		die("waitpid");


	/*
	 * Step 11: Disable writing on the shared buffer for the child
	 * (hint: mprotect(2)).
	 * Step 11 - Parent
	 */
	printf(RED "\nStep 11: Disable writing on the shared buffer for the "
		"child. Verify through the maps for the parent and the "
		"child.\n" RESET);
	press_enter();

	/*
	 * TODO: Write your code here to complete parent's part of Step 11.
	 */
	printf("Parent:\n");
	show_va_info((uint64_t)heap_shared_buf);
	show_maps();
	
	if (-1 == kill(child_pid, SIGCONT))
		die("kill");
	if (-1 == waitpid(child_pid, &status, 0))
		die("waitpid");


	/*
	 * Step 12: Free all buffers for parent and child.
	 * Step 12 - Parent
	 */

	/*
	 * TODO: Write your code here to complete parent's part of Step 12.
	 */
	if(munmap(heap_private_buf, 2 * get_page_size()) == -1) {
		perror("Failed to unmap heap_private_buf.");
	}
	if(munmap(heap_shared_buf, get_page_size()) == -1) {
		perror("Failed to unmap heap_shared_buf.");
	}
	if(munmap(file_shared_buf, size) == -1) {
		perror("Failed to unmap file_shared_buf.");
	}
	
	printf("Parent:\n");
	show_va_info((uint64_t)heap_private_buf);
	show_va_info((uint64_t)heap_shared_buf);
	show_va_info((uint64_t)file_shared_buf);
	printf("\n");
}

int main(void)
{
	pid_t mypid, p;
	int fd = -1;
	uint64_t pa;

	mypid = getpid();
	buffer_size = 1 * get_page_size();

	/*
	 * Step 1: Print the virtual address space layout of this process.
	 */
	printf(RED "\nStep 1: Print the virtual address space map of this "
		"process [%d].\n" RESET, mypid);
	press_enter();
	/*
	 * TODO: Write your code here to complete Step 1.
	 */
	show_maps();

	/*
	 * Step 2: Use mmap to allocate a buffer of 1 page and print the map
	 * again. Store buffer in heap_private_buf.
	 */
	printf(RED "\nStep 2: Use mmap(2) to allocate a private buffer of "
		"size equal to 1 page and print the VM map again.\n" RESET);
	press_enter();
	/*
	 * TODO: Write your code here to complete Step 2.
	 */
	heap_private_buf = mmap(NULL, buffer_size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, fd, 0);
	if(heap_private_buf == MAP_FAILED){
		perror("Failed to create new mapping (heap_private_buf - Step 2)");
	}
	
	printf("\nThe Virtual Address Area, the Permissions etc. of the heap_private_buf is:\n");
	show_va_info((uint64_t)heap_private_buf);
	show_maps();

	/*
	 * Step 3: Find the physical address of the first page of your buffer
	 * in main memory. What do you see?
	a */
	printf(RED "\nStep 3: Find and print the physical address of the "
		"buffer in main memory. What do you see?\n" RESET);
	press_enter();
	/*
	 * TODO: Write your code here to complete Step 3.
	 */
	pa = get_physical_address((uint64_t)heap_private_buf);
	if(pa) {
		printf("0x%lu\n", pa);
	}
	/*
	 * Step 4: Write zeros to the buffer and repeat Step 3.
	 */
	printf(RED "\nStep 4: Initialize your buffer with zeros and repeat "
		"Step 3. What happened?\n" RESET);
	press_enter();
	/*
	 * TODO: Write your code here to complete Step 4.
	 */
	int i;
	for(i = 0; i < get_page_size(); i++){
		heap_private_buf[i] = 0;
	}
	
	pa = get_physical_address((uint64_t)heap_private_buf);
	if(pa) {
		printf("0x%lu\n", pa);
	}

	/*
	 * Step 5: Use mmap(2) to map file.txt (memory-mapped files) and print
	 * its content. Use file_shared_buf.
	 */
	printf(RED "\nStep 5: Use mmap(2) to read and print file.txt. Print "
		"the new mapping information that has been created.\n" RESET);
	press_enter();
	/*
	 * TODO: Write your code here to complete Step 5.
	 */
	fd = open("file.txt", O_RDONLY);
	struct stat buf;
	fstat(fd, &buf);
	size = buf.st_size;
	
	// fseek(fd, 0, SEEK_END);
	// size = ftell(fp);
	// fseek(fd, 0, SEEK_SET);

	file_shared_buf = mmap(NULL, size, PROT_READ, MAP_PRIVATE, fd, 0);
	if(file_shared_buf == MAP_FAILED){
		perror("Failed to create new mapping (file_shared_buf - Step 5)");
	}
	
	for(i = 0; i < size; i++) {
		printf("%c", file_shared_buf[i]);
	}
	
	printf("\nThe Virtual Address Area, the Permissions etc. of the file_shared_buf is:\n");
	show_va_info((uint64_t)file_shared_buf);
	show_maps();

	/*
	 * Step 6: Use mmap(2) to allocate a shared buffer of 1 page. Use
	 * heap_shared_buf.
	 */
	printf(RED "\nStep 6: Use mmap(2) to allocate a shared buffer of size "
		"equal to 1 page. Initialize the buffer and print the new "
		"mapping information that has been created.\n" RESET);
	press_enter();
	/*
	 * TODO: Write your code here to complete Step 6.
	 */
	heap_shared_buf = mmap(NULL, buffer_size, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
	if(heap_shared_buf == MAP_FAILED){
		perror("Failed to create new mapping (heap_shared_buf - Step 6)");
	}

	for(i = 0; i < get_page_size(); i++){
		heap_shared_buf[i] = 1;
	}
	
	printf("\nThe Virtual Address Area, the Permissions etc. of the heap_shared_buf is:\n");
	show_va_info((uint64_t)heap_shared_buf);
	show_maps();

	p = fork();
	if (p < 0)
		die("fork");
	if (p == 0) {
		child();
		return 0;
	}

	parent(p);

	if (-1 == close(fd))
		perror("close");
	return 0;
}

