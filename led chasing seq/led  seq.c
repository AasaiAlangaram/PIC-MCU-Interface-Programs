#include<pic.h>
void delay(unsigned int a)
{
while(a--);
}
char a[8]={0x01,0x02,0x04,0x08,0x10,0x20,0x40,0x80};
void forward()
{						PORTD=0x01;
						for(int i=0;i<8;i++)
						{	
							delay(10000);
							PORTD=PORTD<<1;
							delay(10000);
						}
						

}
void reverse()
{						
						PORTD=0x80;
					for(int i=0;i<8;i++)
						{	
							delay(10000);
							PORTD=PORTD>>1;
							delay(10000);
						}
						

}
void mix()
{						PORTD=0x81;
					for(int i=0;i<4;i++)
						{	
							delay(10000);
							PORTD=PORTD>>1&0xF0;
							
												
							delay(10000);
						}

}
void main()
{
		TRISD=0x00;
		PORTD=0x01;
		while(1)
		{					
						
					for(int i=0;i<=4;i++)
					{
						forward();
					}

					delay(20000);
					PORTD=0x00;
					for(int i=0;i<=4;i++)
					{
						reverse();
					}

					


		}
		
}
/*
void main()
{
TRISD=0x00;
PORTD=0xAA;
delay(10000);
PORTD=0x55;
delay(10000);
}

*/	