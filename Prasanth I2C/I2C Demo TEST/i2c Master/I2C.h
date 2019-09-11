//I2C COMMUNICATION//
//I2C MASTER MODE//

void i2c_sspifclr()
{
	while(SSPIF==0);	// while(!SSPIF);
	SSPIF=0;
	}

void i2c_start()
{
	SEN=1;
	while(SEN==1);
	i2c_sspifclr();
}
	
void i2c_stop()
{
	PEN=1;
	while(PEN==1);
	i2c_sspifclr();
	}	
	
void i2c_repeated_start()
{
	RSEN=1;
	while(RSEN==1);
	i2c_sspifclr();
	}
	
void i2c_acknowledgement()  
{
	ACKDT=0;
	ACKEN=1;
	while(ACKEN==1);
	i2c_sspifclr();
	}

void i2c_no_acknowledgement()
{
	ACKDT=1;
	ACKEN=1;
	while(ACKEN==1);
	i2c_sspifclr();
	}
	
void i2c_receive_enable()
{
	RCEN=1;
}
	
void i2c_receive_disable()
{
	RCEN=0;
	}
	
void i2c_wait()
{
	while((SSPCON2 & 0x1F)||(SSPSTAT & 0x04));
	}
	
void i2c_write(unsigned char write)
{
	SSPBUF=write;
	i2c_wait();
	i2c_sspifclr();
	}		

unsigned char i2c_read(void)
{
	unsigned char Buffer;
	i2c_receive_enable();
	while(!BF);
	Buffer=SSPBUF;
	i2c_wait();
	return Buffer;
	}
	