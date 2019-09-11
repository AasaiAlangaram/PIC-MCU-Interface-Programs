#include<htc.h>
#include<stdio.h>
#define _XTAL_FREQ 20000000
#define lcd PORTC
#define rs RB0
#define en RB1
__CONFIG(0x3F3A);
void delay(int a)
{
while(a--);
}
void display(char d,int e)
{
lcd=d;
rs=e;
en=1;
delay(50);
en=0;
delay(50);
}
void init()
{
display(0x38,0);display(0x06,0);display(0x0C,0);display(0x01,0);
}
int main()
{
int i,j=0;
unsigned char c[4];
unsigned int f;
TRISC=0;
TRISB=0;
TRISD=0;
PORTD=0;
lcd=0;
void init();

ADCON1=0x80;
ADCON0=0x01;
while(1)
{


delay(50);
ADCON0|=0x04;
while(ADCON0==0x04);
f=ADRESL|ADRESH<<8;
if(f>512)
PORTD=0x01;
else
PORTD=0;
display(0x80,0);
sprintf(c,"%04u",f);
for(i=0;i<4;i++)
{
display(c[i],1);
}
}
return 0;
}
