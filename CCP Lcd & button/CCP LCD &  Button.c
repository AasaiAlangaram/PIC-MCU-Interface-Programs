#include<pic.h>
#include "LCD 4 Bit.h"

void t1_delay()
{
	T1CON=0x38;//1:8 prescalar value,oscillator enable 
	TMR1H=0X00;
	TMR1L=0X00;
	TMR1ON=1;//enable timer 1
	while(TMR1IF==0);
	TMR1IF=0;
}
void main()
{
	unsigned int temp,a,b,c,d,e,f,g,h;
	TRISC=0x04;
	TRISD=0x00;
	PORTC=0x00;
	PORTD=0x00;
	CCP1CON=0x05;//set comapre when Rising Edge
	lcd_initialize();
	display("CCP",3);
	delay(60000);
	lcd_command(0x01);
	display("Capture value is",15);
	delay(60000);
	while(1)
	{	
		t1_delay();//call timer
		lcd_command(0xC0);
		while(CCP1IF==0);//wait for ccp interrupt flag
		CCP1IF=0;
		
		temp=CCPR1H<<8;
		temp=temp+CCPR1L;
		a=temp%10;
		b=temp/10;
		c=b%10;
		d=b/10;
		e=d%10;
		f=d/10;
		g=f%10;
		h=f/10;
		
		lcd_data(h+0x30);
		lcd_data(g+0x30);
		lcd_data(e+0x30);
		lcd_data(c+0x30);
		lcd_data(a+0x30);
	

		
	}

}