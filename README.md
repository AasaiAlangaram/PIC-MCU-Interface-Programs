# PIC-MCU-Interaface-Programs
------------------------------
### CourseWork
--------------
This repo contain all peripheral interface programs with pic16f877a\
1.Led\
2.Lcd(16*2)\
3.Keypad\
4.7-Segment Display\
5.PWM Control\
6.Timer 8-Bit\
7.Timer 16-Bit\
8.Uart\
9.Interrupt\
10.Eeprom\
11.Ccp\
12.Adc\
13.I2c\
14.Spi\
15.3-Way Traffic Control Project

The Code was written in MPLAB X IDE and it's simulated in Proteus simulation tool & tetsed in PIC Development board.\
Link to purchase development board https://www.pantechsolutions.net/pic-development-board or else you can develop your own board.
:+1:

### INTERFACING DIGITAL IO
-------------------------------
-- To understand about the registers used in configuring digital I/O.\
-- To know about the basic concept of input/output devices such as Led, Relay, Motors, Switch, Digital sensors, Matrix keypad and seven segment.\
-- To understand the programming concept for interfacing those I/O devices with pic microcontroller.

***REGISTERS USED***:\
***TRIS – Directional Register***\
-- It is 8 bit register. \
-- This register states either the pin act as input (<) or output (>).\
-- If TRIS bit is 1 = Input\
-- If TRIS bit is 0 = Output

Syntax:\
`
TRISX=0b8bit_binary_value; (or) 
TRISX=0X8bit_hexadecimal_value;
`

For Example:\
-- RB2 = INPUT\
-- RB5 = OUTPUT

Hence 
`TRISB=0X04; (or) TRISB=0b00000100; (or) TRISB5=0;TRISB2=1;`

|  | RB7 | RB6 | RB5 | RB4 | RB3 | RB2 | RB1 | RB0 |
| ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- |
| TRISB=0X04 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 |

***PORT – Value Register***\
-- It is 8 bit register.\
-- This register states the value of the pin is whether high or low\
-- If PORT bit is 1 5V.\
-- If PORT bit is 0  0V.

Syntax:\
`PORTX=0b8bit_binary_value;   (or) PORTX=0X8bit_hexadecimal_value;`

For Example:\
-- RB5 = 5V (High state)\
-- Rest of pins in PORTB = 0V (Low state)\
Hence
`PORTB=0X20; (or) PORTB=0b00100000; (or) RB5=1;RB0=RB1=RB2=RB3=RB4=RB6=RB7=0;`

### Happy Coding:computer:
