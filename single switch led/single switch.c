#include<pic.h>
#define led RB0
#define sw RB1
__CONFIG(HS&LVPDIS&BOREN&WDTDIS);
void delay(unsigned int a)
{	while(a--);
}
int status;
void main()
{
	TRISB=0xF0;
	status,led=0;
	 while(1)
		{
			if(status==0&&sw==1)
			{	delay(10000);
				if(sw==1)
				{
				led=1;
				status=1;
				//delay(10000);
				}	
			}
			if(status==1&&sw==1)
			{	delay(10000);
				if(sw==1)
				{
				led=0;
				status=0;
				//delay(10000);
			
				}	
			}
		}

}