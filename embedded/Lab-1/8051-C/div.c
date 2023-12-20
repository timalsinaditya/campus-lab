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
	unsigned int quotient = 0;
	unsigned char remainder =0;
	DBYTE [0x3E] = 0xAF;

	remainder = DBYTE [0x3E];
	
	while( remainder >= 0x12){
		quotient++;
		remainder -= 0x12;
	}
	
	DBYTE [0x19] = remainder;
	DBYTE [0x1A] = quotient;
	
	P0 = 0x00;
	
	while(1) {
		P0= remainder;
		delay(1000);
		P0= quotient;
		delay(1000);
}
}