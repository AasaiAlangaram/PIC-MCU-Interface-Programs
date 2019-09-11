#include<pic.h>
__CONFIG ( HS & WDTDIS & BOREN & LVPDIS );
#define RS RD0
#define EN RD1
#include "LCD 4 BIT.h"
#include "pwm.h"
void main()
{	
	unsigned int temp,a,b,c,d,e,f,z;
		
	ADCON1=0x8E;//ADFM Right justified and AN0 only as analog
	ADCON0=0x41;
	TRISD=0x00;//D as output
	PORTD=0x00;
	TRISA=0xFF;//A as input
	TRISB=0X00;
	PORTB=0X00;
	TRISC=0X00;
	lcd_initialize();
	display("ADC TEST",7);
	delay(100000);
	lcd_command(0x01);
	while(1)
	{
	delay(1000);
	ADCON0=(ADCON0|0x04);//enabling the GO/DONE Bit
	while(ADIF==0);//waiting for ADC Interrupt
	temp=ADRESH<<8;//left shift 8times for placing ADRESH's LSB 2 bits 
	temp=temp+ADRESL;//Adding 8bit From ADRESL and add Shifted Temp value
	ADIF=0;//Clearing ADC interrupt Flag
	a=temp%10;//1"s Digit
	b=temp/10;//
	c=b%10;//10"s Digit
	d=b/10;
	e=d%10;//100"s Digit
	f=d/10;//1000"s Digit
	
	lcd_command(0x80);
	lcd_data(f+0x30);
	lcd_data(e+0x30);
	lcd_data(c+0x30);
	lcd_data(a+0x30);
	delay(60000);
	if(temp>250 && temp<499)
	{
		PORTB=0X01;
		CCP1CON=0X2C;
		PWM_1();
	
	
	}
	else if(temp>500 && temp<749)
	{
	PORTB=0x02;
	CCP1CON=0X2C;
		PWM_2();
	

	}
	else if(temp>750)
	{
	PORTB=0x04;
	CCP1CON=0X2C;
		PWM_3();
	
		}
	else
	{
	PORTB=0x00;
	}
	
	}
}