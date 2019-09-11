#include<pic.h>
#include "LCD 4 BIT.h"
void Timer1_Delay()
{	TMR1H=0x00;//LOAD 0B FOR HIGHER ORDER
	TMR1L=0x64;//LOAD DB FOR LOWER ORDER
	T1CON=0x39;//0011 1001 ///PRESCALER AS 8 AND TIMER 1 OSCEN SET AND TIMER1 ON
	while(TMR1IF==0);
	T1CON=0x38;//TMR1ON=0////
	TMR1IF=0;

}
void main()
{	
	unsigned char temp,a,b,c,d,q,w;
	TRISD=0x00;//OUTPUT FOR LCD
	PORTD=0x00;
	TRISC=0x00;
	PORTC=0x00;

	
	lcd_initialize();
	
	delay(10000);
//	lcd_command(0x01);
	while(1)
	{PORTC=0xff;
		Timer1_Delay();
		PORTC=0x00;
		Timer1_Delay();
		
				for(int s=0;s<60;s++)
					{
						lcd_command(0x80);
						display("H",1);
						lcd_command(0xC0);
						w=s%10;//FOR 1"S DIGIT
						q=s/10;//FOR 10"S DIGIT
				
						lcd_data(q+0x30);
						lcd_data(w+0x30);
						for(int i=0;i<60;i++)
						{
							lcd_command(0x83);
							display("M",1);
							lcd_command(0xC3);
							
							a=i%10;//FOR 1"S DIGIT
							b=i/10;//FOR 10"S DIGIT
				
							lcd_data(b+0x30);
							lcd_data(a+0x30);
					//Timer1_Delay();
					//Timer1_Delay();
				

							for(int j=0;j<60;j++)
							{
								lcd_command(0x86);
								display("S",1);
								lcd_command(0xC6);
								
								c=j%10;//FOR 1"S DIGIT
								d=j/10;//FOR 10"S DIGIT
				
								lcd_data(d+0x30);
								lcd_data(c+0x30);
								Timer1_Delay();
								Timer1_Delay();
							}

				}
		}
	}

}
/*
void main()
{
TRISC=0x00;
PORTC=0x00;

while(1)
{
PORTC=0Xff;
Timer1_Delay();
		PORTC=0x00;
		Timer1_Delay();
}
}
*/