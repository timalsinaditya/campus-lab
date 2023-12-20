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
	unsigned char insert=0x40, target= 0x61,temp;
	unsigned char flag;
	unsigned int i, j=0;
	
	for(i=0; i<0x21 ; i++) {
	DBYTE[insert]= i;
	insert++;
	}
	
	insert=0x40;
	while(insert<0x61){
		flag=1;
    if (DBYTE[insert] > 1) {
        for (i = 2; i <= DBYTE[insert] / 2; ++i) {
            if (DBYTE[insert] % i == 0) {
                flag = 0; 
                break;
            }
        }

        if (flag) {
            DBYTE[target++] = DBYTE[insert]; 
        }
    }
		insert++;
	}
	
}