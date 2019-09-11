#include<pic.h>
#include "LCD 4 BIT.h"
unsigned char byte;
unsigned char name[]="JEYA KUMAR";
/*void delay(unsigned int a)
{
	while(a--);

}*/
void write_byte_to_EE(unsigned char data,const unsigned char address)
{
	EEADR=address;
	EEDATA=data;
	EEPGD=0;//access data memory
	WREN=1;//write enable
	EECON2=0x55;
	EECON2=0xAA;
	WR=1;//write control bit
	while(EEIF==0);
	WREN=0;
	EEIF=0;
}
void read_byte_from_EE(const unsigned char address)
{
	EEADR=address;
	EEPGD=0;
	RD=1;
	byte=EEDATA;
	
	
}

void main()
{	unsigned int address=0;
	TRISD=0x00;
	EEDATA=EEADR=0X00;
	lcd_initialize();
	display("EEPROM",6);
	delay(60000);
	while(1)
	{	
			lcd_command(0x01);
		//	read_byte_from_EE(0x0A);
		//	lcd_data(byte);
			
			//delay(6000);
		for(int i=0;i<10;i++)
		{	
			
			write_byte_to_EE(name[i],0x00+i);
			//address++;
			
		}
		
		//read_byte_from_EE(0x01);
		
		for(int i=0;i<10;i++)
		{	
			lcd_command(0xC0+i);
			read_byte_from_EE(0x00+i);
			//address++;
			lcd_data(byte);
		}
			delay(60000);
		
	}
}
