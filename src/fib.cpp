#include <stdio.h>
#include "../inc/fib.h"

void printFib(int n)
{
	int t1 = 0, t2 = 1, nextTerm = 0;

	printf("%d\n%d\n", t1, t2);

	nextTerm = t1 + t2;

	while(nextTerm <= n)
	{
		printf("%d\n", nextTerm);
		t1 = t2;
		t2 = nextTerm;
		nextTerm = t1 + t2;
	}
}
