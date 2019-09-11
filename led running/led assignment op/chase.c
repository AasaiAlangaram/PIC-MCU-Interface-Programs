#include<pic.h>
void delay(unsigned int a)
{
	while(a--);
}
void main()
{ 
	TRISB=0x00;
	PORTB=0x00;
	while(1)
	{
	PORTB=0x01;
	for(int i=0;i<8;i++)
	{
	
	delay(10000);

	PORTB=PORTB<<1;
	
	}
	
	}
}