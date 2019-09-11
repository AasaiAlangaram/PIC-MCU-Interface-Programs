#include<pic.h>

void delay(unsigned int y)
	{
		while(y--);
	}

void intr_clr()
	{
		while(SSPIF==0);
		SSPIF=0;
	}

void start()
	{
		SEN=1;
		while(SEN==1);
		intr_clr();
	}

void wait()
	{
		while((SSPSTAT & 0X04)||(SSPCON2 & 0X1F));
	}

void write(unsigned char a)
	{
		SSPBUF=a;
		wait();
		intr_clr();
	}

void stop()
	{
		PEN=1;
		while(PEN==1);
		intr_clr();
	}

void main()
{
	TRISC=0Xff;
	SSPSTAT=0X80;
	SSPCON=0X28;
	SSPADD=0x28;
while(1)
	{
		start();
		write(0x80);
		write('B');
		stop();
		delay(10000);
	}
}

		