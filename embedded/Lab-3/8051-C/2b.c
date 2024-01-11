#include<reg51.h>

sbit out = P2^0;

void delay10ms(){
	TMOD = 0x10;
	TH1 = 0xDB;
	TL1 = 0xF0;
	TR1 = 1;
	while (TF1 == 0);
	TF1 = 0;
	TR1 = 0;
}

void delay50ms() {
	delay10ms();
	delay10ms();
	delay10ms();
	delay10ms();
	delay10ms();
}

void main() {
	unsigned int i =0;
	while(1) {
		out = 0x01;
		delay50ms();
		out = 0x00;
		delay50ms();
		for(i =0 ; i< 10; ++i){
		out = 0x01;
		delay10ms();
		out = 0x00;
		delay10ms();
		}
	}
}