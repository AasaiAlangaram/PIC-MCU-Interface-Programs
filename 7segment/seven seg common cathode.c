#include<pic.h>
void delay(unsigned int a)
{
while(a--);
}
unsigned char seg[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
void main()
{
	TRISD=0x00;
	PORTD=0x00;

		while(1)
		{
			for(int i=0;i<10;i++)
			{
				PORTD=seg[i];
				delay(30000);
			}
		}
}