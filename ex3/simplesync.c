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

// pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t mutex;

void *increase_fn(void *arg)
{
	int i;
	volatile int *ip = arg;
	
	fprintf(stderr, "About to increase variable %d times\n", N);
	for (i = 0; i < N; i++) {
		if (USE_ATOMIC_OPS) {
			/* ... */
			/* You can modify the following line */
			__sync_add_and_fetch(&ip, 1);
			if(!ip) {
				perror("sync_add_and_fetch");
				exit(1);
			}
			/* ... */
		} else {
			/* ... */
			//pthread_mutex_lock(&mutex);
			int ret1 = pthread_mutex_lock(&mutex);
			if (ret1) {
				perror_pthread(ret1, "pthread_mutex_lock");
				exit(1);
			}
			/* You cannot modify the following line */
			++(*ip);
			/* ... */
			//pthread_mutex_unlock(&mutex);
			int ret2 = pthread_mutex_unlock(&mutex);
			if (ret2) {
				perror_pthread(ret2, "pthread_mutex_unlock");
				exit(1);
			}
		}
	}
	fprintf(stderr, "Done increasing variable.\n");

	return NULL;
}

void *decrease_fn(void *arg)
{
	int i;
	volatile int *ip = arg;

	if (pthread_mutex_init(&mutex, NULL) != 0) {
        printf("\n mutex init has failed\n");
        exit(1);
    }

	fprintf(stderr, "About to decrease variable %d times\n", N);
	for (i = 0; i < N; i++) {
		if (USE_ATOMIC_OPS) {
			/* ... */
			/* You can modify the following line */
			__sync_sub_and_fetch(&ip, -5);
			if(!ip) {
				perror("sync_sub_and_fetch");
				exit(1);
			}
			/* ... */
		} else {
			/* ... */
			// pthread_mutex_lock(&mutex);
			int ret1 = pthread_mutex_lock(&mutex);
			if (ret1) {
				perror_pthread(ret1, "pthread_mutex_lock");
				exit(1);
			}
			/* You cannot modify the following line */
			--(*ip);
			/* ... */
			//pthread_mutex_unlock(&mutex);
			int ret2 = pthread_mutex_unlock(&mutex);
			if (ret2) {
				perror_pthread(ret2, "pthread_mutex_unlock");
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

/* 1.
	Με συγχρονισμό:
		george@George:~/oslab/ex3$ time ./simplesync-mutex
		About to increase variable 10000000 times
		About to decrease variable 10000000 times
		Done decreasing variable.
		Done increasing variable.
		OK, val = 0.

		real    0m0.864s
		user    0m1.195s
		sys     0m0.488s

		george@George:~/oslab/ex3$ time ./simplesync-atomic
		About to increase variable 10000000 times
		About to decrease variable 10000000 times
		Done decreasing variable.
		Done increasing variable.
		OK, val = 0.

		real    0m0.133s
		user    0m0.233s
		sys     0m0.020s

	Χωρίς συγχρονισμό:
		george@George:~/oslab/ex3$ time ./simplesync-mutex
		About to increase variable 10000000 times
		About to decrease variable 10000000 times
		Done decreasing variable.
		Done increasing variable.
		NOT OK, val = -922775.

		real    0m0.026s
		user    0m0.042s
		sys     0m0.001s

		george@George:~/oslab/ex3$ time ./simplesync-atomic
		About to increase variable 10000000 times
		About to decrease variable 10000000 times
		Done decreasing variable.
		Done increasing variable.
		NOT OK, val = 2361942.

		real    0m0.028s
		user    0m0.036s
		sys     0m0.001s

	Παρατηρούμε πως ο χρόνος που απαιτούν τα εκτελέσιμα με συγχρονισμό είναι μεγαλύτερος
	από αυτόν που απαιτούν τα εκτελέσιμα χωρίς συγχρονισμό, καθώς στην υλοποίηση με
	συγχρονισμό, υπάρχει η καθυστέρηση που προκαλείται είτε από τον αμοιβαίο αποκλεισμό 
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

*/