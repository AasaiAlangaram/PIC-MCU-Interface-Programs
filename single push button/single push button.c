#include<pic.h>
void main()
{
	TRISC=0xFF;
	TRISB=0x00;
if(RC0==1)
{
//	while(RC0);
	RB0=~RB0;
}

}