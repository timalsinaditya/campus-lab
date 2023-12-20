#include <absacc.h>
#include <reg51.h>
#include <stdio.h>

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
	unsigned char accumulator = 0x6B;
	
	accumulator = ((accumulator & 0x0F) << 4 | (accumulator &0xF0) >> 4);
	
	P0=0x00;
	
	while(1) {
		P0= accumulator;
	}
}
	