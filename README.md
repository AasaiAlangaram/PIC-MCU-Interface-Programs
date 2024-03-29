# PIC-MCU-Interaface-Programs
------------------------------
## CourseWork
--------------
This repo contain all peripheral interface programs with pic16f877a :boy:

### Table of Contents :clipboard:

[1.Led](https://github.com/AasaiAlangaram/PIC-MCU-Interface-Programs/tree/master/led)\
[2.Lcd(16*2)](https://github.com/AasaiAlangaram/PIC-MCU-Interface-Programs/tree/master/LCD%2016X2)\
[3.Keypad](https://github.com/AasaiAlangaram/PIC-MCU-Interface-Programs/tree/master/Keypad%20%26%20LCD)\
[4.7-Segment Display](https://github.com/AasaiAlangaram/PIC-MCU-Interface-Programs/tree/master/7segment)\
[5.PWM Control](https://github.com/AasaiAlangaram/PIC-MCU-Interface-Programs/tree/master/PWM)\
[6.Timer 8-Bit](https://github.com/AasaiAlangaram/PIC-MCU-Interface-Programs/tree/master/Timer%20LED)\
[7.Timer 16-Bit](https://github.com/AasaiAlangaram/PIC-MCU-Interface-Programs/tree/master/Timer%2016Bit%20LCD)\
[8.Uart](https://github.com/AasaiAlangaram/PIC-MCU-Interface-Programs/tree/master/UART)\
[9.Interrupt](https://github.com/AasaiAlangaram/PIC-MCU-Interface-Programs/tree/master/Interrupt%207seg%20%26%20LED)\
[10.Eeprom](https://github.com/AasaiAlangaram/PIC-MCU-Interface-Programs/tree/master/EEPROM)\
[11.Ccp](https://github.com/AasaiAlangaram/PIC-MCU-Interface-Programs/tree/master/CCP%20Lcd%20%26%20button)\
[12.Adc](https://github.com/AasaiAlangaram/PIC-MCU-Interface-Programs/tree/master/ADC%20%26%20LCD)\
[13.I2c](https://github.com/AasaiAlangaram/PIC-MCU-Interface-Programs/tree/master/I2C)\
[14.Adc-8channel](https://github.com/AasaiAlangaram/PIC-MCU-Interface-Programs/tree/master/8%20channel%20ADC%20%26%20LCD)\
[15.Spi]()\
[15.3-Way Traffic Control Project](https://github.com/AasaiAlangaram/PIC-MCU-Interface-Programs/tree/master/Project%20-------%20Traffic%20light%20controller)

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

### LED INTREFACING
***LED:***\
![image](https://user-images.githubusercontent.com/43054456/68385684-a9e3e700-019d-11ea-84c3-465b725ef5c1.png)\
Led is a two terminal output device. The terminals called Anode and cathode. Led emit lights or conducts only when it is under forward biased condition.

***Applications***

![image](https://user-images.githubusercontent.com/43054456/68385668-a3ee0600-019d-11ea-8919-c548efa9de9e.png)
![image](https://user-images.githubusercontent.com/43054456/68385699-b10af500-019d-11ea-8ef5-4c8f43d59525.png)
![image](https://user-images.githubusercontent.com/43054456/68385716-b8320300-019d-11ea-9ecf-556b4ebe6cfd.png)

### Happy Coding:computer:
