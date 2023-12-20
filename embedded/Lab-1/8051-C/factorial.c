#include<stdio.h>
#include<absacc.h>
#include<reg51.h>

void delay(unsigned int count) {
	unsigned int i;
	while(count)
		{
			i=115;
			while(i>0) {
				i--;
			}
			count--;
		}
}

void main() {
	unsigned char R3 = 0x5;
	unsigned int i, factorial = 1, target = 0x60, remainder;
	unsigned char STORAGE[50];
	
	for(i=1; i<=R3; i++) {
		factorial *= i;
	}
	
	while(factorial != 0) {
		remainder = factorial % 16;
		if (remainder < 10) {
			STORAGE[target] = remainder + '0';
			} else {
			STORAGE[target] = remainder + 55;
			}
			target ++;
			factorial /= 16;
		}
}