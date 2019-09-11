#include<pic.h>
////LCD PIN DECLARATION///

#define RS RD0
#define EN RD1

//KEYPAD DECLARATION///
// ROWS///

#define R1 RB0
#define R2 RB1
#define R3 RB2
#define R4 RB3

// COLUMNS ///
#define C1 RB5
#define C2 RB6
#define C3 RB7

#include "LCD 4BIT.h"

void keypad()
{
	R1=1;R2=0;R3=0;R4=0;//ROW 1 IS ON REMAININGS ARE OFF
	if(C1==1)
	{
		lcd_data('1');while(C1);
	}
	if(C2==1)
	{
		lcd_data('2');while(C2);
	}
	if(C3==1)
	{
		lcd_data('3');while(C3);
	}

	R1=0;R2=1;R3=0;R4=0;//ROW 2 IS ON REMAININGS ARE OFF
	if(C1==1)
	{
		lcd_data('4');while(C1);
	}
	if(C2==1)
	{
		lcd_data('5');while(C2);
	}
	if(C3==1)
	{
		lcd_data('6');while(C3);
	}

	R1=0;R2=0;R3=1;R4=0;//ROW 3 IS ON REMAININGS ARE OFF
	if(C1==1)
	{
		lcd_data('7');while(C1);
	}
	if(C2==1)
	{
		lcd_data('8');while(C2);
	}
	if(C3==1)
	{
		lcd_data('9');while(C3);
	}

	R1=0;R2=0;R3=0;R4=1;//ROW 4 IS ON REMAININGS ARE OFF
	if(C1==1)
	{
		lcd_data('*');while(C1);
	}
	if(C2==1)
	{
		lcd_data('0');while(C2);
	}
	if(C3==1)
	{
		//lcd_data('#');while(C3);
		lcd_command(0x01);while(C3);
	}
}
void main()
{ 		
		TRISD=0X00;//LCD ON THIS PORTD
		TRISB=0X70;//1111 0000 HIGHER NIBBLE ARE COLUMNS ///LOWER NIBBLE ARE ROWS
		lcd_initialize();
		while(1)
		{
		keypad();
		}
}