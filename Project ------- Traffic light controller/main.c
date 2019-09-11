#include<pic.h>
//#include<string.h>
#define EN RD0
#define RS RD1
#include"LCD 4 BIT.h"

char night_mode;
void interrupt ext()
{
		if(INTF==1)
		{	
			night_mode=1;
			INTF=0;
			RB1=1;
			delay(60000);
			delay(60000);
			RB1=0;
		}

}
void Timer_Delay_1Sec(unsigned int j)
{	
	for(int k=0;k<j;k++)
	{
	for(int i=0;i<=20;i++)
	{
	T0CS=0;//Clock Source by Internal
	T0SE=0;//Rising Edge or 0 to 1 Transition
	PSA=0;//Prescaler only for Timer
	PS0=PS1=PS2=1;//Set Prescale value with 256//Highest
	TMR0=60;//Load Value is 60
	while(T0IF==0);//wait for Timer interrupt flag set
	T0IF=0;//Clear the Interrpt Flag.
	//TMR0=0;
	}
	}
}

void a_way(char R,char Y,char G)
{
	RB7=R;
	RC0=Y;
	RC1=G;

}

void b_way(char R,char Y,char G)
{
	RC2=R;
	RC3=Y;
	RC4=G;

}
void c_way(char R,char Y,char G)
{
	RC5=R;
	RC6=Y;
	RC7=G;

}

void main()
{	
	TRISD=0x00;
	TRISB=0x01;	
	TRISC=0x00;
	PORTD=PORTC=0x00;
	PORTB=0x01;
	RB1=0;
	GIE=1;
	PEIE=1;
	INTE=1;
	INTEDG=0;
	RBPU=0;
	lcd_initialize();
	display("Traffic Light",13);
	lcd_command(0xC0);
	display("Controller",10);
	Timer_Delay_1Sec(3);
	night_mode=0;

	while(1)
	{
	if(night_mode==0)
	{	
		a_way(0,0,1);		b_way(1,0,0);		c_way(1,0,0);

		Timer_Delay_1Sec(7);

		a_way(0,0,1);		b_way(0,1,0);		c_way(1,0,0);

		Timer_Delay_1Sec(2);

		a_way(1,0,0);		b_way(0,0,1);		c_way(1,0,0);

		Timer_Delay_1Sec(7);

		a_way(1,0,0);		b_way(0,0,1);		c_way(0,1,0);

		Timer_Delay_1Sec(2);

		a_way(1,0,0);		b_way(1,0,0);		c_way(0,0,1);

		Timer_Delay_1Sec(7);

		a_way(0,1,0);		b_way(1,0,0);		c_way(0,0,1);

		Timer_Delay_1Sec(2);
		
		
	}
	
	if(night_mode)
	{
		a_way(0,1,0);		b_way(0,1,0);		c_way(0,1,0);	

	//	for(int i=0;i<=60;i++) 
		Timer_Delay_1Sec(1);

		a_way(0,0,0);		b_way(0,0,0);		c_way(0,0,0);

	//	for(int i=0;i<=60;i++)
		 Timer_Delay_1Sec(1);

	}
	
	}
}