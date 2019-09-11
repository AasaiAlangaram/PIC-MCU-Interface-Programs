#include<pic.h>
void delay(unsigned int a)
{
	while(a--);
}
void main()
{
	TRISB=0x00;
	PORTB=0xFF;
	delay(10000);
	PORTB=0x00;
	delay(10000);
}