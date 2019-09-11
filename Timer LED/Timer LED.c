#include<pic.h>
void reload();void interrupt ISR();
void Timer0_Delay()
{	for(int i=0;i<=19;i++)
	{
TMR0IE=1;
GIE=1;
T0IF=0;//Clear the Interrpt Flag.
	T0CS=0;//Clock Source by Internal
	T0SE=0;//Rising Edge or 0 to 1 Transition
	PSA=0;//Prescaler only for Timer
	PS0=PS1=PS2=1;//Set Prescale value with 256//Highest
	reload();
	//while(T0IF==0);//wait for Timer interrupt flag set
	
	//TMR0=0;
	}
}
void interrupt ISR()
{
if(TMR0IF==1)
{
PORTB=0xff;
TMR0IF=0;reload();
}
}
void main()
{
	TRISD=0x00;PORTD=0x00;
	while(1)
	{
	
		
		Timer0_Delay();
		
	}

}/*
#include<pic.h>

void main()		
{
TRISD=0X00;		//configuring the ports as output
PORTD=0X00;		 //configuring the ports as low
T0CS=1;			//select as counter
TMR0=0x00;		//initiate timer register
while(1)
{
PORTD=TMR0;		//reading the timer register
}
}










*/
void reload()
{
TMR0=60;//Load Value is 60
}