#include <stdio.h>

int main() {
	int i, sum=0, n=10;
	for(i=1; i<=n; ++i) {
	sum= sum+i;
	}
	printf("The sum of numbers from 1 to %d is %d\n",n,sum);
	return 0;
}
