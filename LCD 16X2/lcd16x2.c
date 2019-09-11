#include<pic.h>
__CONFIG(HS&LVPDIS&BOREN&WDTDIS);
#define RS RB0
#define RW RB1
#define EN RB2
char name[]="THICK INDIA";
void delay(unsigned int a)
{
	while(a--);
}
void lcd_command(unsigned char command)
{	
	PORTC=command;
	RS=0;
	RW=0;
	EN=1;
	delay(200);
	EN=0;
}
void lcd_data(unsigned char data)
{	
	PORTC=data;
	RS=1;
	RW=0;
	EN=1;
	delay(200);
	EN=0;
}
void lcd_initialize()
{
	lcd_command(0x38);
	lcd_command(0x06);
	lcd_command(0x0c);
	lcd_command(0x01);
	//lcd_command(0x80);
}

void main()
{
	TRISC=0x00;
	TRISB=0x00;
	PORTC=PORTB=0x00;
	lcd_initialize	();
	while(1)
	{
		lcd_command(0x81);
		for(int a=0;a<=12;a++)
		{
			lcd_data(name[a]);
			delay(1000);
		}

	
		
	}
}