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
	unsigned char insert=0x50, temp;
	unsigned int i=0, j=0, n=0;
	unsigned char numbers[] = {0xD6, 0xF2, 0xE4, 0xA8, 0xCE, 0xB9, 0xFA, 0xAE, 0xBA, 0xCC};
	
	for(i=0; i<10 ; i++) {
	DBYTE[insert]= numbers[i];
	insert++;
	n++;
	}
	
	for(i=0;i<n-1; i++)
	{
		insert=0x50;
		for(j=0;j<n-1-i;j++)
		{
			if(DBYTE[insert+1] < DBYTE[insert])
			{
				temp= DBYTE[insert];
				DBYTE [insert] = DBYTE [insert+1];
				DBYTE [insert+1]=temp;
			}
		insert++;
		}
	}
	P0=0x00;
	while(1) {
		P0= DBYTE [0x50];
		delay(1000);
		P0= DBYTE [0x59];
		delay(1000);
	}
}
