#include<pic.h>
#include "LCD 4 BIT.h"
void main()
{	
	unsigned char temp,a,b,c,d;
	TRISD=0x00;// PORT D As OUTPUT to LCD
	TRISA=0x10;//PORT A ///RA4 Only the input and Remainings Are Output
	T0CS=1;///Timer0 Gets External Clock sources
	T0SE=0;//Timer 0 has Low to High Transitions
	lcd_initialize();//Initialize LCD
	display("Counter",7);//Display Something
	delay(10000);//
	TMR0=0;//Initialize 0 at first time
	while(1)
	{
		temp=TMR0;//Copy the Timer0 register value to Temp
		a=temp%10;///Last digit  on A//1"s
		b=temp/10;///Remaining 2 digits in b
		c=b%10;//middle bit in c//10"s
		d=b/10;//first didit///100"s
		lcd_command(0xC0);//Second Line
		lcd_data(d+0x30);//value to char(ASCII)
		lcd_data(c+0x30);
		lcd_data(a+0x30);		
	}	
}