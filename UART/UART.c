#include<pic.h>
void delay(unsigned int a)
{
	while(a--);

}
void main()
{
	TRISC=0x00;
	SYNC=0;
	TXEN=1;
	BRGH=1;
	SPBRG=25;
	SPEN=1;
	TXREG='A';
	while(1)
	{
			TXREG='A';
			//if(TRMT==0);
			/*TXREG='B';
			if(TRMT==0);
			delay(60000);*/
			
	}

}