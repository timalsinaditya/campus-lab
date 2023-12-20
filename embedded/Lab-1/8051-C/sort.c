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

void bubble_sort(unsigned char insert, unsigned char n) {
		unsigned int i=0, j=0;
		unsigned char temp;
		for(i=0;i<n-1; i++)
		{
		insert=0x60;
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
}

void selection2_sort(unsigned char insert, unsigned int n) {
	unsigned int i, j, max_index;
	unsigned char temp;
	
	for(i=insert; i< insert+n-1; i++)
	{
		max_index = i;
		for(j=i+1; j<n+insert; j++) {
			if(DBYTE[j] > DBYTE[max_index]) {
				max_index = j;
			}
		}
		    temp = DBYTE[max_index];
        DBYTE[max_index] = DBYTE[i];
        DBYTE[i] = temp;
	}
}	

void main() {
	unsigned char insert=0x60, temp;
	unsigned int i=0, j=0, n=0;
	unsigned char numbers[] = {0xA5, 0xFD, 0x67, 0x42, 0xDF, 0x9A, 0x84, 0x1B, 0xC7, 0x31};
	
	for(i=0; i<10 ; i++) {
	DBYTE[insert]= numbers[i];
	insert++;
	n++;
	}
	insert = 0x60;
	selection2_sort(insert, n);
	
	P0=0x00;
	while(1) {
	insert=0x60;
		for(i=0; i<10;i++){
			P0= DBYTE [insert];
			delay(1000);
			insert++;
		}
	}
}