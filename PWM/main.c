#include<pic.h>
void PWM()
{	
	PR2=100;//640usec
	CCPR1L=(PR2*0.75);
	T2CON=0X79;//16bit postscaler and 16 bit prescaler
	TMR2=0;
	TMR2ON=1;
	while(TMR2IF==0);
	TMR2IF=0;
	TMR2ON=0;

}

void main()
{
	
	TRISC=0X00;
	CCP1CON=0X0C;//pwm mode selected
	while(1)
	{	
		PWM();
	}
	

}
