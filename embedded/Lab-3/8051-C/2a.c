#include<reg51.h>

sbit out = P2^0;

void delay5ms(){ //because 13 bit cannot provide 10ms delay
	TMOD = 0x00;
	TH0 = 0x72;
	TL0 = 0xF8;
	TR0 = 1;
	while (TF0 == 0);
	TF0 = 0;
	TR0 = 0;
}

void delay10ms() {
	delay5ms();
	delay5ms();
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