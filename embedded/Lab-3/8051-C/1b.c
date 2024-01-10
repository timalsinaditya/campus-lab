#include<reg51.h>

sbit out = P2^0;

void delay3ms(){
	TMOD = 0x10;
	TH1 = 0xF5;
	TL1 = 0x33;
	TR1 = 1;
	while (TF1 == 0);
	TF1 = 0;
	TR1 = 0;
}

void main() {
	while(1) {
		out = 0x01;
		delay3ms();
		out = 0x00;
		delay3ms();
		delay3ms();
		delay3ms();
		delay3ms();
	}
}
	
