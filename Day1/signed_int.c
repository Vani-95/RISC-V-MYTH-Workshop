#include <stdio.h>
#include <math.h>

int main() {
		long long int max= (long long int) (pow(2,63) -1);
		long long int min= (long long int) (pow(2,63) * -1);
		printf("Highest signed integer number is %lld\n",max);
		printf("Lowest signed integer number is %lld\n",min);	
		return 0;
}
