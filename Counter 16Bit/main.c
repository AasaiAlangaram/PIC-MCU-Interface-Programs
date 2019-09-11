#include<pic.h>
#include"LCD 4 BIT.h"


void main()
{		TRISD=0x00;//LCD OUTPUT
		TRISC=0x03;//RC0 RC1 INPUT

		TMR1L=0x00;//
		TMR1H=0x00;//
		T1CON=0x03;//

		lcd_initialize();
		display("Counter",6);
		while(1)
		{
			

		}


		
		
}