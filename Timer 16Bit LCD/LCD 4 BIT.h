#define RS RD0
#define EN RD1

void delay(unsigned int a)
{
	while(a--);
}

void lcd_command(unsigned char command)
{
	unsigned char temp;
	PORTD=command&0xF0;
	RS=0;
	RW=0;
	EN=1;
	delay(200);
	EN=0;
	temp=command<<4;
	PORTD=temp&0xF0;
	RS=0;
	RW=0;
	EN=1;
	delay(200);
	EN=0;

}
void lcd_data(unsigned char data)
{
	unsigned char temp1;
	PORTD=data&0xF0;
	RS=1;
	RW=0;
	EN=1;
	delay(200);
	EN=0;
	temp1=data<<4;//right shift
	PORTD=temp1&0xF0;
	RS=1;
	RW=0;
	EN=1;
	delay(200);
	EN=0;


}
void lcd_initialize()
{
	lcd_command(0x02);//return home
	lcd_command(0x2C);//4bit mode
	lcd_command(0x06);//entry mode
	lcd_command(0x0c);//cursor OFF
	lcd_command(0x01);//clears lcd screen
	lcd_command(0x80);//1st line ast column
}
void display(const unsigned char *word,unsigned char len)
{
	unsigned char a;
	for(a=0;a<=len;a++)
		{
			lcd_data(word[a]);
		}

}
