#include <pic.h>
#define M1 RC0
#define M2 RC1
////LCD PIN DECLARATION///

#define RS RD0
#define EN RD1

#include "LCD 4 BIT.h"
///////////////////////////////////////////////////////
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

#include "Keypad 4x3.h"
//////////////////////////////////////////////////////
char i;
void motor_forward()
{	
	M1=1;M2=0;

}
void motor_reverse()
{	
	M1=0;M2=1;

}
void motor_off()
{	
	M1=M2=0;
}
void main()
{
	TRISD=0x00;
	TRISB=0xF0;
	TRISC=0x00;
	
	lcd_initialize();
	i=0;
	motor_off();
	while(1)
	{
		keypad();		
	
	}	
}