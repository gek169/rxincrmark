#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
#include <time.h>
volatile unsigned long x = 0;

int main(void){
	x = 0;
	do{
		x++;
	}while(x < 0xffFFff);
	/**/
	return 0;
}
