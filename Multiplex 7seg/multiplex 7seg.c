#include<pic.h>
#define s1 RC0
#define s2 RC1
void delay(unsigned int a)
{
while(a--);
}
int a,b;
unsigned char seg[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
void main()
{
	TRISD=0x00;
	TRISC=0x00;
	PORTD=0x00;
	PORTC=0x00;
		while(1)
		{
			for(int i=0;i<99;i++)
			{	
				a=i%10;
				b=i/10;
				
				PORTD=seg[a];
				s1=0;
				delay(200000);
				s1=1;				
				
				PORTD=seg[b];
				s2=0;
				delay(200000);
				s2=1;
				
				
			}
		}
}