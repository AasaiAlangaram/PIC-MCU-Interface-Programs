#include<pic.h>
#define LED1 RB0
#define LED2 RB1
#define LED3 RB2
void main()
{
	TRISB=0x00;
	TRISC=0x80;
	SPEN=1;
	SPBRG=25;
	BRGH=1;
	//CREN=1;//
	RCSTA=0x90;//continuous enable
	LED1=LED2=LED3=0;
	while(1)
	{	
		if(RCREG==0x31)
		{
			LED1=1;
		}
		if(RCREG==0x32)
		{
			LED2=1;
		}
		if(RCREG==0x33)
		{
			LED3=1;
		}
		if(RCREG==0x34)
		{
			LED1=LED2=LED3=0;
		}
	}


}