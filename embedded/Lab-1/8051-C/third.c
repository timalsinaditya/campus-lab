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
	unsigned int i=0;
	unsigned int result=0;
	
	DBYTE [0x22] = 0xFF;
	DBYTE [0x15] = 0xDE;
	
	for(i=0; i<DBYTE [0x15]; i++)
	{
		result += DBYTE[0x22];
		
	}
	
	DBYTE [0x1A] = (result & 0xFF00) >> 8;
	DBYTE [0x19] = (result & 0x00FF);
	
	P0=0x00;
	
	while(1)
	{
		P0= DBYTE[0x1A];
		delay(1000);
		P0= DBYTE[0x19];
		delay(1000);
	}
}