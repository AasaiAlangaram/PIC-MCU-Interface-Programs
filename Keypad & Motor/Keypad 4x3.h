

void keypad()
{
	R1=1;R2=0;R3=0;R4=0;//ROW 1 IS ON REMAININGS ARE OFF
	if(C1==1)
	{	lcd_command(0x01);
		display("Motor Forward",13);while(C1);
		M1=1;M2=0;
	}
	if(C2==1)
	{	lcd_command(0x01);
		display("Motor Reverse",13);while(C2);
		M1=0;M2=1;
	}
	if(C3==1)
	{	lcd_command(0x01);
		display("Motor Stop",10);while(C3);
		M1=0;M2=0;
	}

	R1=0;R2=1;R3=0;R4=0;//ROW 2 IS ON REMAININGS ARE OFF
	if(C1==1)
	{
		lcd_data('4');while(C1);
	}
	if(C2==1)
	{
		lcd_data('5');while(C2);
	}
	if(C3==1)
	{
		lcd_data('6');while(C3);
	}

	R1=0;R2=0;R3=1;R4=0;//ROW 3 IS ON REMAININGS ARE OFF
	if(C1==1)
	{
		lcd_data('7');while(C1);
	}
	if(C2==1)
	{
		lcd_data('8');while(C2);
	}
	if(C3==1)
	{
		lcd_data('9');while(C3);
	}

	R1=0;R2=0;R3=0;R4=1;//ROW 4 IS ON REMAININGS ARE OFF
	if(C1==1)
	{
		lcd_data('*');while(C1);
	}
	if(C2==1)
	{
		lcd_data('0');while(C2);
	}
	if(C3==1)
	{
		//lcd_data('#');while(C3);
		lcd_command(0x01);while(C3);
	}
}
