#include<pic.h>
#include "LCD 4 BIT.h"
void adc_read()
{
	unsigned int temp;
	temp=ADRESH<<8;
	temp=temp+ADRESL;
	ADIF=0;
}
void main()
{
	TRISD=0x00;
	TRISA=0xFF;
	TRISE=0xFF;
	ADCON1=0x80;
	ADCON0=0x41;
	lcd_initialize();
	display("8 ch ADC",8);
	delay(60000);
	while(1)
	{
		delay(1000);
		ADCON0=(ADCON0|0x04);
		while(ADIF==0);
		adc_read();
		
	}
	
		
}