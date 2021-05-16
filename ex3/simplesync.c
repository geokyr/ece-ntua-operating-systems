/*
 * simplesync.c
 *
 * A simple synchronization exercise.
 *
 * Vangelis Koukis <vkoukis@cslab.ece.ntua.gr>
 * Operating Systems course, ECE, NTUA
 *
 */

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>

/* 
 * POSIX thread functions do not return error numbers in errno,
 * but in the actual return value of the function call instead.
 * This macro helps with error reporting in this case.
 */
#define perror_pthread(ret, msg) \
	do { errno = ret; perror(msg); } while (0)

#define N 10000000

/* Dots indicate lines where you are free to insert code at will */
/* ... */
#if defined(SYNC_ATOMIC) ^ defined(SYNC_MUTEX) == 0
# error You must #define exactly one of SYNC_ATOMIC or SYNC_MUTEX.
#endif

#if defined(SYNC_ATOMIC)
# define USE_ATOMIC_OPS 1
#else
# define USE_ATOMIC_OPS 0
#endif

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

void *increase_fn(void *arg)
{
	int i, ret;
	volatile int *ip = arg;
	
	fprintf(stderr, "About to increase variable %d times\n", N);
	for (i = 0; i < N; i++) {
		if (USE_ATOMIC_OPS) {
			/* ... */
			/* You can modify the following line */
			__sync_add_and_fetch(ip, 1);
			/* ... */
		} else {
			/* ... */
			ret = pthread_mutex_lock(&mutex);
			if (ret) {
				perror_pthread(ret, "pthread_mutex_lock");
				exit(1);
			}
			/* You cannot modify the following line */
			++(*ip);
			/* ... */
			ret = pthread_mutex_unlock(&mutex);
			if (ret) {
				perror_pthread(ret, "pthread_mutex_unlock");
				exit(1);
			}
		}
	}
	fprintf(stderr, "Done increasing variable.\n");

	return NULL;
}

void *decrease_fn(void *arg)
{
	int i, ret;
	volatile int *ip = arg;

	fprintf(stderr, "About to decrease variable %d times\n", N);
	for (i = 0; i < N; i++) {
		if (USE_ATOMIC_OPS) {
			/* ... */
			/* You can modify the following line */
			__sync_sub_and_fetch(ip, 1);
			/* ... */
		} else {
			/* ... */
			ret = pthread_mutex_lock(&mutex);
			if (ret) {
				perror_pthread(ret, "pthread_mutex_lock");
				exit(1);
			}
			/* You cannot modify the following line */
			--(*ip);
			/* ... */
			ret = pthread_mutex_unlock(&mutex);
			if (ret) {
				perror_pthread(ret, "pthread_mutex_unlock");
				exit(1);
			}
		}
	}
	fprintf(stderr, "Done decreasing variable.\n");
	
	return NULL;
}


int main(int argc, char *argv[])
{
	int val, ret, ok;
	pthread_t t1, t2;

	/*
	 * Initial value
	 */
	val = 0;

	/*
	 * Create threads
	 */
	ret = pthread_create(&t1, NULL, increase_fn, &val);
	if (ret) {
		perror_pthread(ret, "pthread_create");
		exit(1);
	}
	ret = pthread_create(&t2, NULL, decrease_fn, &val);
	if (ret) {
		perror_pthread(ret, "pthread_create");
		exit(1);
	}

	/*
	 * Wait for threads to terminate
	 */
	ret = pthread_join(t1, NULL);
	if (ret)
		perror_pthread(ret, "pthread_join");
	ret = pthread_join(t2, NULL);
	if (ret)
		perror_pthread(ret, "pthread_join");

	/*
	 * Is everything OK?
	 */
	ok = (val == 0);

	printf("%sOK, val = %d.\n", ok ? "" : "NOT ", val);

	return ok;
}

/* 	Αρχικά, παρατηρούμε ότι αφού μεταγλωττίσουμε το πρόγραμμα, η έξοδος των δύο 
	εκτελέσιμων είναι NOT OK, ακολουθούμενη από μία εμφανώς τυχαία τιμή της
	μεταβλητής val του προγράμματος. Αυτό συμβαίνει διότι στον κώδικα μας
	έχουμε δύο νήματα τα οποία εκτελούν κάποια αριθμητική πράξη στην ίδια μεταβλήτη,
	προκαλώντας έτσι ένα race condition. Ως αποτέλεσμα, λόγω του τυχαίου τρόπου
	επιλογής σειράς εκτέλεσης, η τιμή της μεταβλητής val, παίρνει κάθε φορά τυχαίες
	τιμές και όχι την τιμή 0 που θα περιμέναμε μετά από ισόποσες αυξήσεις και 
	μειώσεις της.

	Όπως βλέπουμε με την χρήση της εντολής make προκύπτουν δυο εκτελέσιμα αρχεία απο
	το ίδιο αρχείο κώδικα simplesync.c. Το γεγονός αυτό οφείλεται στην χρήση του -D 
	flag και ενός μέρους του κώδικας μας, ο οποίος επιτρέπει μέσω του ορισμού ενός
	macro (-D[name]) να διαλέξουμε για κάθε αρχείο τους μηχανισμούς εκτέλεσης του 
	κώδικα μας, με βάση τα if conditions και το flag USE_ATOMIC_OPS. Αυτό λαμβάνει
	τιμή 1 εάν έχουμε ορίσει ως macro το SYNC_ATOMIC και τιμή 0 εάν έχουμε ορίσει ως
	macro το SYNC_MUTEX, μέσω της εντολής -DSYNC_[ATOMIC,MUTEX] μέσα στο Makefile μας.

	1.
	Με συγχρονισμό:
		
		oslaba40@os-node1:~/ex3$ time ./simplesync-atomic
		About to increase variable 10000000 times
		About to decrease variable 10000000 times
		Done decreasing variable.
		Done increasing variable.
		OK, val = 0.

		real    0m0.421s
		user    0m0.832s
		sys     0m0.004s
	
		oslaba40@os-node1:~/ex3$ time ./simplesync-mutex
		About to increase variable 10000000 times
		About to decrease variable 10000000 times
		Done increasing variable.
		Done decreasing variable.
		OK, val = 0.

		real    0m26.772s
		user    0m27.092s
		sys     0m26.440s
	
	Χωρίς συγχρονισμό:

		oslaba40@os-node1:~/ex3$ time ./simplesync-atomic
		About to increase variable 10000000 times
		About to decrease variable 10000000 times
		Done increasing variable.
		Done decreasing variable.
		NOT OK, val = -3374558.

		real    0m0.039s
		user    0m0.072s
		sys     0m0.000s

		oslaba40@os-node1:~/ex3$ time ./simplesync-mutex
		About to increase variable 10000000 times
		About to decrease variable 10000000 times
		Done increasing variable.
		Done decreasing variable.
		NOT OK, val = -9991389.

		real    0m0.039s
		user    0m0.072s
		sys     0m0.000s

	Παρατηρούμε πως ο χρόνος που απαιτούν τα εκτελέσιμα με συγχρονισμό είναι μεγαλύτερος
	από αυτόν που απαιτούν τα εκτελέσιμα χωρίς συγχρονισμό, καθώς στην υλοποίηση με
	συγχρονισμό, υπάρχει η καθυστέρηση που προκαλείται είτε από την ενεργό αναμονή 
	είτε από τις κλήσεις συστήματος, αφού έχουμε μόνο ένα νήμα κάθε φορά σε κάθε κρίσιμο
	τμήμα του κώδικα, σε αντίθεση με την περίπτωση που δεν έχουμε συγχρονισμό και όλα
	τα νήματα μπορούν να έχουν πρόσβαση στο κρίσιμο τμήμα ταυτόχρονα.

	2. 
	Παρατηρούμε ότι η χρήση ατομικών λειτουργιών είναι πιο γρήγορη από την χρήση
	POSIX mutexes, διότι έχουμε μόνο δύο νήματα που διεκδικούν την είσοδο στο κρίσιμο
	τμήμα κώδικα όπου εκτελείται μόνο μία αύξηση ή μείωση μιας μεταβλητής, επομένως 
	νήματα με πολύ μικρά διαστήματα αναμονής. Σε αυτήν την περίπτωση, συμφέρει η 
	χρήση των ατομικών λειτουργιών και όχι η χρήση του αμοιβαίου αποκλεισμού με αναστολή
	εκτέλεσης, η οποία χρησιμοποιεί πολλαπλές κλήσεις συστήματος, σε αντίθεση με την
	πρώτη που χρησιμοποιεί μόνο απλές εντολές Assembly χωρίς να αναστέλει και να ξυπνάει
	τα νήματα.

	3.
	Για να δημιουργήσουμε το αρχείο Assembly χρησιμοποιούμε την εντολή:
		oslaba40@os-node1:~/ex3$ gcc -Wall -O2 -pthread -DSYNC_ATOMIC -S -g -o simplesync-atomic.s simplesync.c
	
	Για την ατομική λειτουργία __sync_add_and_fetch(ip, 1):
	
		.loc 1 51 4 view .LVU17
		lock addl	$1, (%rbx)

	Για την ατομική λειτουργία __sync_sub_and_fetch(ip, 1):
	
		.loc 1 85 4 view .LVU47
		lock subl	$1, (%rbx)

	4.
	Για να δημιουργήσουμε το αρχείο Assembly χρησιμοποιούμε την εντολή:
		oslaba40@os-node1:~/ex3$ gcc -Wall -O2 -pthread -DSYNC_MUTEX -S -g -o simplesync-mutex.s simplesync.c

	Για τα δύο σημεία που καλούμε την λειτουργία pthread_mutex_lock():

		.loc 1 55 10 is_stmt 0 view .LVU22
		movq	%r13, %rdi
		call	pthread_mutex_lock@PLT
		
		.loc 1 89 10 is_stmt 0 view .LVU81
		movq	%r13, %rdi
		call	pthread_mutex_lock@PLT
*/