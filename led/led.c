#include<pic.h>
void delay(unsigned int a)
{
while(a--);
}

void main()
{
TRISB=0x00;
PORTB=0xFF;
delay(1000);
PORTB=0x00;
delay(1000);
}