opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 6379"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_lcd_initialize
	FNCALL	_main,_keypad
	FNCALL	_lcd_initialize,_lcd_command
	FNCALL	_keypad,_lcd_data
	FNCALL	_keypad,_lcd_command
	FNCALL	_lcd_command,_delay
	FNCALL	_lcd_data,_delay
	FNROOT	_main
	global	_PORTD
psect	text98,local,class=CODE,delta=2
global __ptext98
__ptext98:
_PORTD	set	8
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_RB3
_RB3	set	51
	global	_RB5
_RB5	set	53
	global	_RB6
_RB6	set	54
	global	_RB7
_RB7	set	55
	global	_RD0
_RD0	set	64
	global	_RD1
_RD1	set	65
	global	_TRISB
_TRISB	set	134
	global	_TRISD
_TRISD	set	136
	global	_RW
_RW	set	1186
	file	"Keypad & LCD.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initationation code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_lcd_command
?_lcd_command:	; 0 bytes @ 0x0
	global	?_keypad
?_keypad:	; 0 bytes @ 0x0
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	?_lcd_data
?_lcd_data:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_lcd_initialize
?_lcd_initialize:	; 0 bytes @ 0x0
	global	delay@a
delay@a:	; 2 bytes @ 0x0
	ds	2
	global	??_lcd_command
??_lcd_command:	; 0 bytes @ 0x2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	??_lcd_data
??_lcd_data:	; 0 bytes @ 0x2
	ds	2
	global	lcd_data@temp1
lcd_data@temp1:	; 1 bytes @ 0x4
	global	lcd_command@temp
lcd_command@temp:	; 1 bytes @ 0x4
	ds	1
	global	lcd_command@command
lcd_command@command:	; 1 bytes @ 0x5
	global	lcd_data@data
lcd_data@data:	; 1 bytes @ 0x5
	ds	1
	global	??_lcd_initialize
??_lcd_initialize:	; 0 bytes @ 0x6
	global	??_keypad
??_keypad:	; 0 bytes @ 0x6
	global	??_main
??_main:	; 0 bytes @ 0x6
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6       6
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;; COMMON:	_lcd_initialize->_lcd_command
;; COMMON:	_keypad->_lcd_data
;; COMMON:	_keypad->_lcd_command
;; Critical Paths (_lcd_command)
;; COMMON:	_lcd_command->_delay

;; Critical Paths (_lcd_data)
;; COMMON:	_lcd_data->_delay

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0

;;
;;Call Graph Tables:

;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _main                                                 0     0      0     180
;;                     _lcd_initialize
;;                             _keypad
;; ---------------------------------------------------------------------------------
;; (1) _lcd_initialize                                       0     0      0      60
;;                        _lcd_command
;; ---------------------------------------------------------------------------------
;; (1) _keypad                                               0     0      0     120
;;                           _lcd_data
;;                        _lcd_command
;; ---------------------------------------------------------------------------------
;; (0) _lcd_command                                          4     4      0      60
;;                                              2 COMMON     4     4      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (0) _lcd_data                                             4     4      0      60
;;                                              2 COMMON     4     4      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (4294967295) _delay                                       2     0      2      15
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum call depth -1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _lcd_command (ROOT)
;;   _delay
;;
;; _lcd_data (ROOT)
;;   _delay
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;COMMON               E      6       6       1       42.9%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;BITBANK0            50      0       0       3        0.0%
;;BANK0               50      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;DATA                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BANK3               60      0       0       8        0.0%
;;BANK2               60      0       0       9        0.0%
;;ABS                  0      0       0      10        0.0%
;;BITBANK3            60      0       0      11        0.0%
;;BITBANK2            60      0       0      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 82 in file "D:\TI\PIC course\Keypad & LCD\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_initialize
;;		_keypad
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\TI\PIC course\Keypad & LCD\main.c"
	line	82
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	83
	
l1881:	
;main.c: 83: TRISD=0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	84
	
l1883:	
;main.c: 84: TRISB=0X70;
	movlw	(070h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	85
	
l1885:	
;main.c: 85: lcd_initialize();
	fcall	_lcd_initialize
	line	86
;main.c: 86: while(1)
	
l631:	
	line	88
	
l1887:	
;main.c: 87: {
;main.c: 88: keypad();
	fcall	_keypad
	line	89
	
l632:	
	line	86
	goto	l631
	
l633:	
	line	90
	
l634:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_initialize
psect	text99,local,class=CODE,delta=2
global __ptext99
__ptext99:

;; *************** function _lcd_initialize *****************
;; Defined at:
;;		line 46 in file "D:\TI\PIC course\Keypad & LCD\LCD 4BIT.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_command
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text99
	file	"D:\TI\PIC course\Keypad & LCD\LCD 4BIT.h"
	line	46
	global	__size_of_lcd_initialize
	__size_of_lcd_initialize	equ	__end_of_lcd_initialize-_lcd_initialize
	
_lcd_initialize:	
	opt	stack 2
; Regs used in _lcd_initialize: [wreg+status,2+status,0+pclath+cstack]
	line	47
	
l1879:	
;LCD 4BIT.h: 47: lcd_command(0x02);
	movlw	(02h)
	fcall	_lcd_command
	line	48
;LCD 4BIT.h: 48: lcd_command(0x2C);
	movlw	(02Ch)
	fcall	_lcd_command
	line	49
;LCD 4BIT.h: 49: lcd_command(0x06);
	movlw	(06h)
	fcall	_lcd_command
	line	50
;LCD 4BIT.h: 50: lcd_command(0x0c);
	movlw	(0Ch)
	fcall	_lcd_command
	line	51
;LCD 4BIT.h: 51: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	52
;LCD 4BIT.h: 52: lcd_command(0x80);
	movlw	(080h)
	fcall	_lcd_command
	line	53
	
l571:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_initialize
	__end_of_lcd_initialize:
;; =============== function _lcd_initialize ends ============

	signat	_lcd_initialize,88
	global	_keypad
psect	text100,local,class=CODE,delta=2
global __ptext100
__ptext100:

;; *************** function _keypad *****************
;; Defined at:
;;		line 23 in file "D:\TI\PIC course\Keypad & LCD\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_data
;;		_lcd_command
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text100
	file	"D:\TI\PIC course\Keypad & LCD\main.c"
	line	23
	global	__size_of_keypad
	__size_of_keypad	equ	__end_of_keypad-_keypad
	
_keypad:	
	opt	stack 2
; Regs used in _keypad: [wreg+status,2+status,0+pclath+cstack]
	line	24
	
l1853:	
;main.c: 24: RB0=1;RB1=0;RB2=0;RB3=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7
	bcf	(49/8),(49)&7
	bcf	(50/8),(50)&7
	bcf	(51/8),(51)&7
	line	25
;main.c: 25: if(RB5==1)
	btfss	(53/8),(53)&7
	goto	u2181
	goto	u2180
u2181:
	goto	l580
u2180:
	line	27
	
l1855:	
;main.c: 26: {
;main.c: 27: lcd_data('1');while(RB5);
	movlw	(031h)
	fcall	_lcd_data
	goto	l581
	
l582:	
	
l581:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(53/8),(53)&7
	goto	u2191
	goto	u2190
u2191:
	goto	l582
u2190:
	
l583:	
	line	28
	
l580:	
	line	29
;main.c: 28: }
;main.c: 29: if(RB6==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(54/8),(54)&7
	goto	u2201
	goto	u2200
u2201:
	goto	l584
u2200:
	line	31
	
l1857:	
;main.c: 30: {
;main.c: 31: lcd_data('2');while(RB6);
	movlw	(032h)
	fcall	_lcd_data
	goto	l585
	
l586:	
	
l585:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(54/8),(54)&7
	goto	u2211
	goto	u2210
u2211:
	goto	l586
u2210:
	
l587:	
	line	32
	
l584:	
	line	33
;main.c: 32: }
;main.c: 33: if(RB7==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(55/8),(55)&7
	goto	u2221
	goto	u2220
u2221:
	goto	l588
u2220:
	line	35
	
l1859:	
;main.c: 34: {
;main.c: 35: lcd_data('3');while(RB7);
	movlw	(033h)
	fcall	_lcd_data
	goto	l589
	
l590:	
	
l589:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(55/8),(55)&7
	goto	u2231
	goto	u2230
u2231:
	goto	l590
u2230:
	
l591:	
	line	36
	
l588:	
	line	38
;main.c: 36: }
;main.c: 38: RB0=0;RB1=1;RB2=0;RB3=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(48/8),(48)&7
	bsf	(49/8),(49)&7
	bcf	(50/8),(50)&7
	bcf	(51/8),(51)&7
	line	39
;main.c: 39: if(RB5==1)
	btfss	(53/8),(53)&7
	goto	u2241
	goto	u2240
u2241:
	goto	l592
u2240:
	line	41
	
l1861:	
;main.c: 40: {
;main.c: 41: lcd_data('4');while(RB5);
	movlw	(034h)
	fcall	_lcd_data
	goto	l593
	
l594:	
	
l593:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(53/8),(53)&7
	goto	u2251
	goto	u2250
u2251:
	goto	l594
u2250:
	
l595:	
	line	42
	
l592:	
	line	43
;main.c: 42: }
;main.c: 43: if(RB6==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(54/8),(54)&7
	goto	u2261
	goto	u2260
u2261:
	goto	l596
u2260:
	line	45
	
l1863:	
;main.c: 44: {
;main.c: 45: lcd_data('5');while(RB6);
	movlw	(035h)
	fcall	_lcd_data
	goto	l597
	
l598:	
	
l597:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(54/8),(54)&7
	goto	u2271
	goto	u2270
u2271:
	goto	l598
u2270:
	
l599:	
	line	46
	
l596:	
	line	47
;main.c: 46: }
;main.c: 47: if(RB7==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(55/8),(55)&7
	goto	u2281
	goto	u2280
u2281:
	goto	l600
u2280:
	line	49
	
l1865:	
;main.c: 48: {
;main.c: 49: lcd_data('6');while(RB7);
	movlw	(036h)
	fcall	_lcd_data
	goto	l601
	
l602:	
	
l601:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(55/8),(55)&7
	goto	u2291
	goto	u2290
u2291:
	goto	l602
u2290:
	
l603:	
	line	50
	
l600:	
	line	52
;main.c: 50: }
;main.c: 52: RB0=0;RB1=0;RB2=1;RB3=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(48/8),(48)&7
	bcf	(49/8),(49)&7
	bsf	(50/8),(50)&7
	bcf	(51/8),(51)&7
	line	53
;main.c: 53: if(RB5==1)
	btfss	(53/8),(53)&7
	goto	u2301
	goto	u2300
u2301:
	goto	l604
u2300:
	line	55
	
l1867:	
;main.c: 54: {
;main.c: 55: lcd_data('7');while(RB5);
	movlw	(037h)
	fcall	_lcd_data
	goto	l605
	
l606:	
	
l605:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(53/8),(53)&7
	goto	u2311
	goto	u2310
u2311:
	goto	l606
u2310:
	
l607:	
	line	56
	
l604:	
	line	57
;main.c: 56: }
;main.c: 57: if(RB6==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(54/8),(54)&7
	goto	u2321
	goto	u2320
u2321:
	goto	l608
u2320:
	line	59
	
l1869:	
;main.c: 58: {
;main.c: 59: lcd_data('8');while(RB6);
	movlw	(038h)
	fcall	_lcd_data
	goto	l609
	
l610:	
	
l609:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(54/8),(54)&7
	goto	u2331
	goto	u2330
u2331:
	goto	l610
u2330:
	
l611:	
	line	60
	
l608:	
	line	61
;main.c: 60: }
;main.c: 61: if(RB7==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(55/8),(55)&7
	goto	u2341
	goto	u2340
u2341:
	goto	l612
u2340:
	line	63
	
l1871:	
;main.c: 62: {
;main.c: 63: lcd_data('9');while(RB7);
	movlw	(039h)
	fcall	_lcd_data
	goto	l613
	
l614:	
	
l613:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(55/8),(55)&7
	goto	u2351
	goto	u2350
u2351:
	goto	l614
u2350:
	
l615:	
	line	64
	
l612:	
	line	66
;main.c: 64: }
;main.c: 66: RB0=0;RB1=0;RB2=0;RB3=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(48/8),(48)&7
	bcf	(49/8),(49)&7
	bcf	(50/8),(50)&7
	bsf	(51/8),(51)&7
	line	67
;main.c: 67: if(RB5==1)
	btfss	(53/8),(53)&7
	goto	u2361
	goto	u2360
u2361:
	goto	l616
u2360:
	line	69
	
l1873:	
;main.c: 68: {
;main.c: 69: lcd_data('*');while(RB5);
	movlw	(02Ah)
	fcall	_lcd_data
	goto	l617
	
l618:	
	
l617:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(53/8),(53)&7
	goto	u2371
	goto	u2370
u2371:
	goto	l618
u2370:
	
l619:	
	line	70
	
l616:	
	line	71
;main.c: 70: }
;main.c: 71: if(RB6==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(54/8),(54)&7
	goto	u2381
	goto	u2380
u2381:
	goto	l620
u2380:
	line	73
	
l1875:	
;main.c: 72: {
;main.c: 73: lcd_data('0');while(RB6);
	movlw	(030h)
	fcall	_lcd_data
	goto	l621
	
l622:	
	
l621:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(54/8),(54)&7
	goto	u2391
	goto	u2390
u2391:
	goto	l622
u2390:
	
l623:	
	line	74
	
l620:	
	line	75
;main.c: 74: }
;main.c: 75: if(RB7==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(55/8),(55)&7
	goto	u2401
	goto	u2400
u2401:
	goto	l624
u2400:
	line	78
	
l1877:	
;main.c: 76: {
;main.c: 78: lcd_command(0x01);while(RB7);
	movlw	(01h)
	fcall	_lcd_command
	goto	l625
	
l626:	
	
l625:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(55/8),(55)&7
	goto	u2411
	goto	u2410
u2411:
	goto	l626
u2410:
	
l627:	
	line	79
	
l624:	
	line	80
	
l628:	
	return
	opt stack 0
GLOBAL	__end_of_keypad
	__end_of_keypad:
;; =============== function _keypad ends ============

	signat	_keypad,88
	global	_lcd_command
psect	text101,local,class=CODE,delta=2
global __ptext101
__ptext101:

;; *************** function _lcd_command *****************
;; Defined at:
;;		line 9 in file "D:\TI\PIC course\Keypad & LCD\LCD 4BIT.h"
;; Parameters:    Size  Location     Type
;;  command         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  command         1    5[COMMON] unsigned char 
;;  temp            1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay
;; This function is called by:
;;		_lcd_initialize
;;		_keypad
;; This function uses a non-reentrant model
;;
psect	text101
	file	"D:\TI\PIC course\Keypad & LCD\LCD 4BIT.h"
	line	9
	global	__size_of_lcd_command
	__size_of_lcd_command	equ	__end_of_lcd_command-_lcd_command
	
_lcd_command:	
	opt	stack 1
; Regs used in _lcd_command: [wreg+status,2+status,0+pclath+cstack]
;lcd_command@command stored from wreg
	line	11
	movwf	(lcd_command@command)
	
l1827:	
;LCD 4BIT.h: 10: unsigned char temp;
;LCD 4BIT.h: 11: PORTD=command&0xF0;
	movf	(lcd_command@command),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	12
	
l1829:	
;LCD 4BIT.h: 12: RD0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7
	line	13
	
l1831:	
;LCD 4BIT.h: 13: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	14
	
l1833:	
;LCD 4BIT.h: 14: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	line	15
	
l1835:	
;LCD 4BIT.h: 15: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	16
	
l1837:	
;LCD 4BIT.h: 16: RD1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	17
	
l1839:	
;LCD 4BIT.h: 17: temp=command<<4;
	movf	(lcd_command@command),w
	movwf	(??_lcd_command+0)+0
	movlw	(04h)-1
u2175:
	clrc
	rlf	(??_lcd_command+0)+0,f
	addlw	-1
	skipz
	goto	u2175
	clrc
	rlf	(??_lcd_command+0)+0,w
	movwf	(??_lcd_command+1)+0
	movf	(??_lcd_command+1)+0,w
	movwf	(lcd_command@temp)
	line	18
	
l1841:	
;LCD 4BIT.h: 18: PORTD=temp&0xF0;
	movf	(lcd_command@temp),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	19
	
l1843:	
;LCD 4BIT.h: 19: RD0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7
	line	20
	
l1845:	
;LCD 4BIT.h: 20: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	21
	
l1847:	
;LCD 4BIT.h: 21: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	line	22
	
l1849:	
;LCD 4BIT.h: 22: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	23
	
l1851:	
;LCD 4BIT.h: 23: RD1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	25
	
l565:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_command
	__end_of_lcd_command:
;; =============== function _lcd_command ends ============

	signat	_lcd_command,4216
	global	_lcd_data
psect	text102,local,class=CODE,delta=2
global __ptext102
__ptext102:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 27 in file "D:\TI\PIC course\Keypad & LCD\LCD 4BIT.h"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    5[COMMON] unsigned char 
;;  temp1           1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay
;; This function is called by:
;;		_keypad
;;		_display
;; This function uses a non-reentrant model
;;
psect	text102
	file	"D:\TI\PIC course\Keypad & LCD\LCD 4BIT.h"
	line	27
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 1
; Regs used in _lcd_data: [wreg+status,2+status,0+pclath+cstack]
;lcd_data@data stored from wreg
	line	29
	movwf	(lcd_data@data)
	
l1801:	
;LCD 4BIT.h: 28: unsigned char temp1;
;LCD 4BIT.h: 29: PORTD=data&0xF0;
	movf	(lcd_data@data),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	30
	
l1803:	
;LCD 4BIT.h: 30: RD0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(64/8),(64)&7
	line	31
	
l1805:	
;LCD 4BIT.h: 31: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	32
	
l1807:	
;LCD 4BIT.h: 32: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	line	33
	
l1809:	
;LCD 4BIT.h: 33: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	34
	
l1811:	
;LCD 4BIT.h: 34: RD1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	35
	
l1813:	
;LCD 4BIT.h: 35: temp1=data<<4;
	movf	(lcd_data@data),w
	movwf	(??_lcd_data+0)+0
	movlw	(04h)-1
u2165:
	clrc
	rlf	(??_lcd_data+0)+0,f
	addlw	-1
	skipz
	goto	u2165
	clrc
	rlf	(??_lcd_data+0)+0,w
	movwf	(??_lcd_data+1)+0
	movf	(??_lcd_data+1)+0,w
	movwf	(lcd_data@temp1)
	line	36
	
l1815:	
;LCD 4BIT.h: 36: PORTD=temp1&0xF0;
	movf	(lcd_data@temp1),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	37
	
l1817:	
;LCD 4BIT.h: 37: RD0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(64/8),(64)&7
	line	38
	
l1819:	
;LCD 4BIT.h: 38: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	39
	
l1821:	
;LCD 4BIT.h: 39: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	line	40
	
l1823:	
;LCD 4BIT.h: 40: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	41
	
l1825:	
;LCD 4BIT.h: 41: RD1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	44
	
l568:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
	global	_delay
psect	text103,local,class=CODE,delta=2
global __ptext103
__ptext103:

;; *************** function _delay *****************
;; Defined at:
;;		line 4 in file "D:\TI\PIC course\Keypad & LCD\LCD 4BIT.h"
;; Parameters:    Size  Location     Type
;;  a               2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_command
;;		_lcd_data
;; This function uses a non-reentrant model
;;
psect	text103
	file	"D:\TI\PIC course\Keypad & LCD\LCD 4BIT.h"
	line	4
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 0
; Regs used in _delay: [wreg]
	line	5
	
l1557:	
;LCD 4BIT.h: 5: while(a--);
	goto	l559
	
l560:	
	
l559:	
	
l1559:	
	movlw	low(01h)
	subwf	(delay@a),f
	movlw	high(01h)
	skipc
	decf	(delay@a+1),f
	subwf	(delay@a+1),f
	movlw	high(0FFFFh)
	xorwf	((delay@a+1)),w
	skipz
	goto	u1475
	movlw	low(0FFFFh)
	xorwf	((delay@a)),w
u1475:

	skipz
	goto	u1471
	goto	u1470
u1471:
	goto	l560
u1470:
	
l561:	
	line	6
	
l562:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
psect	text104,local,class=CODE,delta=2
global __ptext104
__ptext104:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
