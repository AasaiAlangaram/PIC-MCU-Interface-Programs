#include<pic.h>
__CONFIG(HS&LVPDIS&BOREN&WDTDIS);
void delay(unsigned int a)
{
	while(a--);
}
char led[8]={0x01,0x02,0x04,0x08,0x10,0x20,0x40,0x80};
void main()
{	
	TRISB=0x00;
while(1)
{
	for(int i=0;i<8;i++)
{
	PORTB=led[i];
	delay(20000);
}	
	
}

}
