#include<pic.h>
#define sw TRISBbits.TRISC4
void main()
{
	TRISBbits.TRISC4=1;
while(1)
{
	if(TRISBbits.TRISC4==1)
	{
		RB0=1;
	}
	else	RB0=0;
}
}