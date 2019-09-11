#include<pic.h>

#define rs RE0
#define rw RE1	
#define en RE2

void delay(unsigned int y)
{
while(y--);
}

void lcd_command(unsigned char com)
{
	PORTD=com;
	rs=0;
	rw=0;
	en=1;
	delay(200);
	en=0;
}

void lcd_data(unsigned char data)
{
	PORTD=data;
	rs=1;
	rw=0;
	en=1;
	delay(200);
	en=0;
}

void lcdinti()
{
	lcd_command(0X38);
	lcd_command(0X06);
	lcd_command(0X0C);
	lcd_command(0X01);
	lcd_command(0X80);
}

void main()
{
	ADCON1=0X06;
	TRISE=0X00;
	TRISD=0X00;
	TRISC=0XFF;
	PORTE=PORTD=0X00;
	lcdinti();
	SSPSTAT=0x80;
	SSPCON=0x26;
	SSPADD=0X80;
	while(1)
	{
lcd_command(0X80);
	unsigned char a;
	while(SSPIF==0);
	SSPIF=0;
a=SSPBUF;
	delay(1000);
	lcd_data(a);
	}
	}

