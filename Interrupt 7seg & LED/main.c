#include<pic.h>
void delay(unsigned int a)
{	while(a--);
}
unsigned char seg[]={0x3F,0X06,0X5B,0X4F,0X66,0X6D,0X7D,0X07,0X7F,0X6F};
void interrupt ext()
{
	if(INTF==1)
	{
		RC0=1;
		delay(60000);
	delay(60000);
		RC0=0;
	
		INTF=0;
	}
}
void main()
{	unsigned int i;
	TRISD=0x00;//OUTPUT //7SEG
	TRISC=0X00;//OUTPUT //LED
	TRISB=0x01;//RB0 IS INPUT
	PORTC=0X00;
	GIE=1;//GLOBAL INTERRUPT ENABLE
	INTE=1;//INTERRUPT ENABLE
	RBPU=0;//INTERNAL PULL UP
	INTEDG=0;//FALLING EDGE IS SELECTED
while(1)
{	
	for(int i=0;i<=9;i++)
	{
		PORTD=seg[i];
		delay(10000);
	}
}
}