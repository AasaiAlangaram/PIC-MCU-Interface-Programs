#include<pic.h>
#define RS RD0
#define EN RD1
char count[4] =0;
#include "LCD 4 BIT.h"
void main()
{
	unsigned int a,b,c,d,e=0;
	
	TRISB=0x03;
	TRISD=0x00;
	PORTD=0x00;
	PORTB=0x03;
	lcd_initialize();
	lcd_command(0x85);
	display("Counter",7);
	lcd_command(0xC0);
	display("Push the Bottons",16);
	delay(50000);
	lcd_command(0x01);
	display("000",3);
	while(1)
	{
		if(RB0==0)
		{
			a++;while(RB0==0);
			count[3]=a%10; 
				//	b= a%10 ;
			count[2]=a/10; 
				//	c= a/10 ;
  			count[1]=count[2]%10; 
				//	d= c%10 ;
			count[0]=count[2]/10;
				//	e= c/10;
					
			lcd_command(0x80);
			/*lcd_data(e|0x30);
			lcd_data(d|0x30);			
			lcd_data(b|0x30);
			/*for(int i=0;i<3;i++)
			{
			//lcd_data(count[i]+ 0x30);	
			}
			delay(100);
			*/
			lcd_data(count + 0x30);	
		}
	
		if(RB1==0)
		{
			a--;while(RB1==0);
			if(a==0){a=0;}
			b= a%10 ;
			c= a/10 ;
  			d= c%10 ;
			e=c/10;
			lcd_command(0x80);
			lcd_data(e|0x30);
			lcd_data(d|0x30);			
			lcd_data(b|0x30);
			delay(10000);
		}
		

	}
	
}