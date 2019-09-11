#include<pic.h>
#include"I2C.h"

static bit rs@((unsigned)&PORTD*8+0);
static bit rw@((unsigned)&PORTD*8+1);
static bit en@((unsigned)&PORTD*8+2);

void delay(unsigned int Delay)
{
while(Delay--);
}

void lcd_command(unsigned char com)
{
unsigned char mand;
PORTD=com&0xf0;
rs=0;
rw=0;
en=1;
delay(10);
en=0;
mand=com<<4;
PORTD=mand&0xf0;
rs=0;
rw=0;
en=1;
delay(10);
en=0;
}
void lcd_init()
{
lcd_command(0x02);
lcd_command(0x2c);
lcd_command(0x06);
lcd_command(0x0c);
lcd_command(0x01);
lcd_command(0x80);
}
void lcd_data(unsigned char da)
{
unsigned char ta;
PORTD=da&0xf0;
en=1;
rs=1;
rw=0;
delay(10);
en=0;
ta=da<<4;
PORTD=ta;//&0xf0;
en=1;
rs=1;
rw=0;
delay(10);
en=0;
}

void lcd_display(const unsigned char*word,unsigned int n)
{
unsigned char l;
for(l=0;l<n;l++)
{
lcd_data(word[l]);
}
}

void port_init(void)
{			
TRISD=0X00;
PORTD=0X00;
}

void i2c_init()
{
	TRISC3=1;	//SCL_DIR = 1;
	TRISC4=1;	//SDA_DIR = 1;
	SSPSTAT=0x80;
	SSPCON=0x28;   // master
    //SSPCON=0x26;   // slave
	SSPADD=0x28;	// ((_XTAL_FREQ/4000)/I2C_SPEED) - 1;
	}
	
void main()
{
	port_init();
	lcd_init();
	i2c_init();

unsigned char masda;
lcd_command(0x80);
delay(100);
lcd_display("EFY TECH CENTER",14);

delay(50000);	

	while(1)
	{


// DATA WRITE  ************************************
		i2c_start();
		
		i2c_write(0x02);
		
		i2c_write('A');
				
		i2c_stop();
		
		delay(10000);
//  ************************************


/*
// DATA READ  ************************************
		i2c_start();
		i2c_write(0x03);

		i2c_receive_enable();
		i2c_no_acknowledgement();
		masda=SSPBUF;

		i2c_receive_disable();
		i2c_stop();
		
		lcd_command(0xC0);
		lcd_data(masda);

//  ************************************

*/

}
}
		