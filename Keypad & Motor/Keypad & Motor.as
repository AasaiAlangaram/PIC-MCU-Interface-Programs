opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 6738"

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
	FNCALL	_keypad,_lcd_command
	FNCALL	_keypad,_display
	FNCALL	_keypad,_lcd_data
	FNCALL	_display,_lcd_data
	FNCALL	_lcd_initialize,_lcd_command
	FNCALL	_lcd_data,_delay
	FNCALL	_lcd_command,_delay
	FNROOT	_main
	global	_i
	global	_PORTD
psect	text108,local,class=CODE,delta=2
global __ptext108
__ptext108:
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
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RD0
_RD0	set	64
	global	_RD1
_RD1	set	65
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
	global	_RW
_RW	set	1186
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_1:	
	retlw	77	;'M'
	retlw	111	;'o'
	retlw	116	;'t'
	retlw	111	;'o'
	retlw	114	;'r'
	retlw	32	;' '
	retlw	70	;'F'
	retlw	111	;'o'
	retlw	114	;'r'
	retlw	119	;'w'
	retlw	97	;'a'
	retlw	114	;'r'
	retlw	100	;'d'
	retlw	0
psect	strings
	
STR_2:	
	retlw	77	;'M'
	retlw	111	;'o'
	retlw	116	;'t'
	retlw	111	;'o'
	retlw	114	;'r'
	retlw	32	;' '
	retlw	82	;'R'
	retlw	101	;'e'
	retlw	118	;'v'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	115	;'s'
	retlw	101	;'e'
	retlw	0
psect	strings
	
STR_3:	
	retlw	77	;'M'
	retlw	111	;'o'
	retlw	116	;'t'
	retlw	111	;'o'
	retlw	114	;'r'
	retlw	32	;' '
	retlw	83	;'S'
	retlw	116	;'t'
	retlw	111	;'o'
	retlw	112	;'p'
	retlw	0
psect	strings
	file	"Keypad & Motor.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_i:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	?_lcd_command
?_lcd_command:	; 0 bytes @ 0x0
	global	?_lcd_data
?_lcd_data:	; 0 bytes @ 0x0
	global	?_lcd_initialize
?_lcd_initialize:	; 0 bytes @ 0x0
	global	?_keypad
?_keypad:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	delay@a
delay@a:	; 2 bytes @ 0x0
	ds	2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	??_lcd_command
??_lcd_command:	; 0 bytes @ 0x2
	global	??_lcd_data
??_lcd_data:	; 0 bytes @ 0x2
	ds	2
	global	lcd_command@temp
lcd_command@temp:	; 1 bytes @ 0x4
	global	lcd_data@temp1
lcd_data@temp1:	; 1 bytes @ 0x4
	ds	1
	global	lcd_command@command
lcd_command@command:	; 1 bytes @ 0x5
	global	lcd_data@data
lcd_data@data:	; 1 bytes @ 0x5
	ds	1
	global	??_lcd_initialize
??_lcd_initialize:	; 0 bytes @ 0x6
	global	?_display
?_display:	; 0 bytes @ 0x6
	global	display@len
display@len:	; 1 bytes @ 0x6
	ds	1
	global	??_display
??_display:	; 0 bytes @ 0x7
	ds	1
	global	display@word
display@word:	; 1 bytes @ 0x8
	ds	1
	global	display@a
display@a:	; 1 bytes @ 0x9
	ds	1
	global	??_keypad
??_keypad:	; 0 bytes @ 0xA
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0xB
;;Data sizes: Strings 39, constant 0, data 0, bss 1, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     11      12
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; display@word	PTR const unsigned char  size(1) Largest target is 14
;;		 -> STR_3(CODE[11]), STR_2(CODE[14]), STR_1(CODE[14]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_keypad
;;   _keypad->_display
;;   _display->_lcd_data
;;   _lcd_initialize->_lcd_command
;;   _lcd_data->_delay
;;   _lcd_command->_delay
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0     300
;;                     _lcd_initialize
;;                             _keypad
;; ---------------------------------------------------------------------------------
;; (1) _keypad                                               1     1      0     240
;;                                             10 COMMON     1     1      0
;;                        _lcd_command
;;                            _display
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (2) _display                                              4     3      1     120
;;                                              6 COMMON     4     3      1
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_initialize                                       0     0      0      60
;;                        _lcd_command
;; ---------------------------------------------------------------------------------
;; (2) _lcd_data                                             4     4      0      60
;;                                              2 COMMON     4     4      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (2) _lcd_command                                          4     4      0      60
;;                                              2 COMMON     4     4      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (3) _delay                                                2     0      2      15
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd_initialize
;;     _lcd_command
;;       _delay
;;   _keypad
;;     _lcd_command
;;       _delay
;;     _display
;;       _lcd_data
;;         _delay
;;     _lcd_data
;;       _delay
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      B       C       1       85.7%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       4       2        0.0%
;;ABS                  0      0       C       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      10      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 42 in file "C:\Users\blackrider\Desktop\PIC course\Keypad & Motor\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_lcd_initialize
;;		_keypad
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\blackrider\Desktop\PIC course\Keypad & Motor\main.c"
	line	42
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	43
	
l1908:	
;main.c: 43: TRISD=0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	44
	
l1910:	
;main.c: 44: TRISB=0xF0;
	movlw	(0F0h)
	movwf	(134)^080h	;volatile
	line	45
	
l1912:	
;main.c: 45: TRISC=0x00;
	clrf	(135)^080h	;volatile
	line	47
	
l1914:	
;main.c: 47: lcd_initialize();
	fcall	_lcd_initialize
	line	48
	
l1916:	
;main.c: 48: i=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_i)
	line	49
	
l1918:	
;main.c: 49: RC0=RC1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(57/8),(57)&7
	bcf	(56/8),(56)&7
	goto	l1920
	line	50
;main.c: 50: while(1)
	
l642:	
	line	52
	
l1920:	
;main.c: 51: {
;main.c: 52: keypad();
	fcall	_keypad
	goto	l1920
	line	54
	
l643:	
	line	50
	goto	l1920
	
l644:	
	line	55
	
l645:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_keypad
psect	text109,local,class=CODE,delta=2
global __ptext109
__ptext109:

;; *************** function _keypad *****************
;; Defined at:
;;		line 4 in file "C:\Users\blackrider\Desktop\PIC course\Keypad & Motor\Keypad 4x3.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_command
;;		_display
;;		_lcd_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text109
	file	"C:\Users\blackrider\Desktop\PIC course\Keypad & Motor\Keypad 4x3.h"
	line	4
	global	__size_of_keypad
	__size_of_keypad	equ	__end_of_keypad-_keypad
	
_keypad:	
	opt	stack 4
; Regs used in _keypad: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	5
	
l1876:	
;Keypad 4x3.h: 5: RB0=1;RB1=0;RB2=0;RB3=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7
	bcf	(49/8),(49)&7
	bcf	(50/8),(50)&7
	bcf	(51/8),(51)&7
	line	6
;Keypad 4x3.h: 6: if(RB5==1)
	btfss	(53/8),(53)&7
	goto	u2181
	goto	u2180
u2181:
	goto	l582
u2180:
	line	7
	
l1878:	
;Keypad 4x3.h: 7: { lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	8
	
l1880:	
;Keypad 4x3.h: 8: display("Motor Forward",13);while(RB5);
	movlw	(0Dh)
	movwf	(??_keypad+0)+0
	movf	(??_keypad+0)+0,w
	movwf	(?_display)
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_display
	goto	l583
	
l584:	
	
l583:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(53/8),(53)&7
	goto	u2191
	goto	u2190
u2191:
	goto	l583
u2190:
	
l585:	
	line	9
;Keypad 4x3.h: 9: RC0=1;RC1=0;
	bsf	(56/8),(56)&7
	bcf	(57/8),(57)&7
	line	10
	
l582:	
	line	11
;Keypad 4x3.h: 10: }
;Keypad 4x3.h: 11: if(RB6==1)
	btfss	(54/8),(54)&7
	goto	u2201
	goto	u2200
u2201:
	goto	l586
u2200:
	line	12
	
l1882:	
;Keypad 4x3.h: 12: { lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	13
	
l1884:	
;Keypad 4x3.h: 13: display("Motor Reverse",13);while(RB6);
	movlw	(0Dh)
	movwf	(??_keypad+0)+0
	movf	(??_keypad+0)+0,w
	movwf	(?_display)
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_display
	goto	l587
	
l588:	
	
l587:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(54/8),(54)&7
	goto	u2211
	goto	u2210
u2211:
	goto	l587
u2210:
	
l589:	
	line	14
;Keypad 4x3.h: 14: RC0=0;RC1=1;
	bcf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	line	15
	
l586:	
	line	16
;Keypad 4x3.h: 15: }
;Keypad 4x3.h: 16: if(RB7==1)
	btfss	(55/8),(55)&7
	goto	u2221
	goto	u2220
u2221:
	goto	l590
u2220:
	line	17
	
l1886:	
;Keypad 4x3.h: 17: { lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	18
	
l1888:	
;Keypad 4x3.h: 18: display("Motor Stop",10);while(RB7);
	movlw	(0Ah)
	movwf	(??_keypad+0)+0
	movf	(??_keypad+0)+0,w
	movwf	(?_display)
	movlw	((STR_3-__stringbase))&0ffh
	fcall	_display
	goto	l591
	
l592:	
	
l591:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(55/8),(55)&7
	goto	u2231
	goto	u2230
u2231:
	goto	l591
u2230:
	
l593:	
	line	19
;Keypad 4x3.h: 19: RC0=0;RC1=0;
	bcf	(56/8),(56)&7
	bcf	(57/8),(57)&7
	line	20
	
l590:	
	line	22
;Keypad 4x3.h: 20: }
;Keypad 4x3.h: 22: RB0=0;RB1=1;RB2=0;RB3=0;
	bcf	(48/8),(48)&7
	bsf	(49/8),(49)&7
	bcf	(50/8),(50)&7
	bcf	(51/8),(51)&7
	line	23
;Keypad 4x3.h: 23: if(RB5==1)
	btfss	(53/8),(53)&7
	goto	u2241
	goto	u2240
u2241:
	goto	l594
u2240:
	line	25
	
l1890:	
;Keypad 4x3.h: 24: {
;Keypad 4x3.h: 25: lcd_data('4');while(RB5);
	movlw	(034h)
	fcall	_lcd_data
	goto	l595
	
l596:	
	
l595:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(53/8),(53)&7
	goto	u2251
	goto	u2250
u2251:
	goto	l595
u2250:
	goto	l594
	
l597:	
	line	26
	
l594:	
	line	27
;Keypad 4x3.h: 26: }
;Keypad 4x3.h: 27: if(RB6==1)
	btfss	(54/8),(54)&7
	goto	u2261
	goto	u2260
u2261:
	goto	l598
u2260:
	line	29
	
l1892:	
;Keypad 4x3.h: 28: {
;Keypad 4x3.h: 29: lcd_data('5');while(RB6);
	movlw	(035h)
	fcall	_lcd_data
	goto	l599
	
l600:	
	
l599:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(54/8),(54)&7
	goto	u2271
	goto	u2270
u2271:
	goto	l599
u2270:
	goto	l598
	
l601:	
	line	30
	
l598:	
	line	31
;Keypad 4x3.h: 30: }
;Keypad 4x3.h: 31: if(RB7==1)
	btfss	(55/8),(55)&7
	goto	u2281
	goto	u2280
u2281:
	goto	l602
u2280:
	line	33
	
l1894:	
;Keypad 4x3.h: 32: {
;Keypad 4x3.h: 33: lcd_data('6');while(RB7);
	movlw	(036h)
	fcall	_lcd_data
	goto	l603
	
l604:	
	
l603:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(55/8),(55)&7
	goto	u2291
	goto	u2290
u2291:
	goto	l603
u2290:
	goto	l602
	
l605:	
	line	34
	
l602:	
	line	36
;Keypad 4x3.h: 34: }
;Keypad 4x3.h: 36: RB0=0;RB1=0;RB2=1;RB3=0;
	bcf	(48/8),(48)&7
	bcf	(49/8),(49)&7
	bsf	(50/8),(50)&7
	bcf	(51/8),(51)&7
	line	37
;Keypad 4x3.h: 37: if(RB5==1)
	btfss	(53/8),(53)&7
	goto	u2301
	goto	u2300
u2301:
	goto	l606
u2300:
	line	39
	
l1896:	
;Keypad 4x3.h: 38: {
;Keypad 4x3.h: 39: lcd_data('7');while(RB5);
	movlw	(037h)
	fcall	_lcd_data
	goto	l607
	
l608:	
	
l607:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(53/8),(53)&7
	goto	u2311
	goto	u2310
u2311:
	goto	l607
u2310:
	goto	l606
	
l609:	
	line	40
	
l606:	
	line	41
;Keypad 4x3.h: 40: }
;Keypad 4x3.h: 41: if(RB6==1)
	btfss	(54/8),(54)&7
	goto	u2321
	goto	u2320
u2321:
	goto	l610
u2320:
	line	43
	
l1898:	
;Keypad 4x3.h: 42: {
;Keypad 4x3.h: 43: lcd_data('8');while(RB6);
	movlw	(038h)
	fcall	_lcd_data
	goto	l611
	
l612:	
	
l611:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(54/8),(54)&7
	goto	u2331
	goto	u2330
u2331:
	goto	l611
u2330:
	goto	l610
	
l613:	
	line	44
	
l610:	
	line	45
;Keypad 4x3.h: 44: }
;Keypad 4x3.h: 45: if(RB7==1)
	btfss	(55/8),(55)&7
	goto	u2341
	goto	u2340
u2341:
	goto	l614
u2340:
	line	47
	
l1900:	
;Keypad 4x3.h: 46: {
;Keypad 4x3.h: 47: lcd_data('9');while(RB7);
	movlw	(039h)
	fcall	_lcd_data
	goto	l615
	
l616:	
	
l615:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(55/8),(55)&7
	goto	u2351
	goto	u2350
u2351:
	goto	l615
u2350:
	goto	l614
	
l617:	
	line	48
	
l614:	
	line	50
;Keypad 4x3.h: 48: }
;Keypad 4x3.h: 50: RB0=0;RB1=0;RB2=0;RB3=1;
	bcf	(48/8),(48)&7
	bcf	(49/8),(49)&7
	bcf	(50/8),(50)&7
	bsf	(51/8),(51)&7
	line	51
;Keypad 4x3.h: 51: if(RB5==1)
	btfss	(53/8),(53)&7
	goto	u2361
	goto	u2360
u2361:
	goto	l618
u2360:
	line	53
	
l1902:	
;Keypad 4x3.h: 52: {
;Keypad 4x3.h: 53: lcd_data('*');while(RB5);
	movlw	(02Ah)
	fcall	_lcd_data
	goto	l619
	
l620:	
	
l619:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(53/8),(53)&7
	goto	u2371
	goto	u2370
u2371:
	goto	l619
u2370:
	goto	l618
	
l621:	
	line	54
	
l618:	
	line	55
;Keypad 4x3.h: 54: }
;Keypad 4x3.h: 55: if(RB6==1)
	btfss	(54/8),(54)&7
	goto	u2381
	goto	u2380
u2381:
	goto	l622
u2380:
	line	57
	
l1904:	
;Keypad 4x3.h: 56: {
;Keypad 4x3.h: 57: lcd_data('0');while(RB6);
	movlw	(030h)
	fcall	_lcd_data
	goto	l623
	
l624:	
	
l623:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(54/8),(54)&7
	goto	u2391
	goto	u2390
u2391:
	goto	l623
u2390:
	goto	l622
	
l625:	
	line	58
	
l622:	
	line	59
;Keypad 4x3.h: 58: }
;Keypad 4x3.h: 59: if(RB7==1)
	btfss	(55/8),(55)&7
	goto	u2401
	goto	u2400
u2401:
	goto	l630
u2400:
	line	62
	
l1906:	
;Keypad 4x3.h: 60: {
;Keypad 4x3.h: 62: lcd_command(0x01);while(RB7);
	movlw	(01h)
	fcall	_lcd_command
	goto	l627
	
l628:	
	
l627:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(55/8),(55)&7
	goto	u2411
	goto	u2410
u2411:
	goto	l627
u2410:
	goto	l630
	
l629:	
	goto	l630
	line	63
	
l626:	
	line	64
	
l630:	
	return
	opt stack 0
GLOBAL	__end_of_keypad
	__end_of_keypad:
;; =============== function _keypad ends ============

	signat	_keypad,88
	global	_display
psect	text110,local,class=CODE,delta=2
global __ptext110
__ptext110:

;; *************** function _display *****************
;; Defined at:
;;		line 55 in file "C:\Users\blackrider\Desktop\PIC course\Keypad & Motor\LCD 4 BIT.h"
;; Parameters:    Size  Location     Type
;;  word            1    wreg     PTR const unsigned char 
;;		 -> STR_3(11), STR_2(14), STR_1(14), 
;;  len             1    6[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  word            1    8[COMMON] PTR const unsigned char 
;;		 -> STR_3(11), STR_2(14), STR_1(14), 
;;  a               1    9[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_lcd_data
;; This function is called by:
;;		_keypad
;; This function uses a non-reentrant model
;;
psect	text110
	file	"C:\Users\blackrider\Desktop\PIC course\Keypad & Motor\LCD 4 BIT.h"
	line	55
	global	__size_of_display
	__size_of_display	equ	__end_of_display-_display
	
_display:	
	opt	stack 4
; Regs used in _display: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;display@word stored from wreg
	line	57
	movwf	(display@word)
	
l1868:	
;LCD 4 BIT.h: 56: unsigned char a;
;LCD 4 BIT.h: 57: for(a=0;a<=len;a++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(display@a)
	goto	l1874
	line	58
	
l577:	
	line	59
	
l1870:	
;LCD 4 BIT.h: 58: {
;LCD 4 BIT.h: 59: lcd_data(word[a]);
	movf	(display@a),w
	addwf	(display@word),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	line	57
	
l1872:	
	movlw	(01h)
	movwf	(??_display+0)+0
	movf	(??_display+0)+0,w
	addwf	(display@a),f
	goto	l1874
	
l576:	
	
l1874:	
	movf	(display@a),w
	subwf	(display@len),w
	skipnc
	goto	u2171
	goto	u2170
u2171:
	goto	l1870
u2170:
	goto	l579
	
l578:	
	line	62
	
l579:	
	return
	opt stack 0
GLOBAL	__end_of_display
	__end_of_display:
;; =============== function _display ends ============

	signat	_display,8312
	global	_lcd_initialize
psect	text111,local,class=CODE,delta=2
global __ptext111
__ptext111:

;; *************** function _lcd_initialize *****************
;; Defined at:
;;		line 46 in file "C:\Users\blackrider\Desktop\PIC course\Keypad & Motor\LCD 4 BIT.h"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_lcd_command
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text111
	file	"C:\Users\blackrider\Desktop\PIC course\Keypad & Motor\LCD 4 BIT.h"
	line	46
	global	__size_of_lcd_initialize
	__size_of_lcd_initialize	equ	__end_of_lcd_initialize-_lcd_initialize
	
_lcd_initialize:	
	opt	stack 5
; Regs used in _lcd_initialize: [wreg+status,2+status,0+pclath+cstack]
	line	47
	
l1866:	
;LCD 4 BIT.h: 47: lcd_command(0x02);
	movlw	(02h)
	fcall	_lcd_command
	line	48
;LCD 4 BIT.h: 48: lcd_command(0x2C);
	movlw	(02Ch)
	fcall	_lcd_command
	line	49
;LCD 4 BIT.h: 49: lcd_command(0x06);
	movlw	(06h)
	fcall	_lcd_command
	line	50
;LCD 4 BIT.h: 50: lcd_command(0x0c);
	movlw	(0Ch)
	fcall	_lcd_command
	line	51
;LCD 4 BIT.h: 51: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	52
;LCD 4 BIT.h: 52: lcd_command(0x80);
	movlw	(080h)
	fcall	_lcd_command
	line	53
	
l573:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_initialize
	__end_of_lcd_initialize:
;; =============== function _lcd_initialize ends ============

	signat	_lcd_initialize,88
	global	_lcd_data
psect	text112,local,class=CODE,delta=2
global __ptext112
__ptext112:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 27 in file "C:\Users\blackrider\Desktop\PIC course\Keypad & Motor\LCD 4 BIT.h"
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay
;; This function is called by:
;;		_display
;;		_keypad
;; This function uses a non-reentrant model
;;
psect	text112
	file	"C:\Users\blackrider\Desktop\PIC course\Keypad & Motor\LCD 4 BIT.h"
	line	27
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 5
; Regs used in _lcd_data: [wreg+status,2+status,0+pclath+cstack]
;lcd_data@data stored from wreg
	line	29
	movwf	(lcd_data@data)
	
l1840:	
;LCD 4 BIT.h: 28: unsigned char temp1;
;LCD 4 BIT.h: 29: PORTD=data&0xF0;
	movf	(lcd_data@data),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	30
	
l1842:	
;LCD 4 BIT.h: 30: RD0=1;
	bsf	(64/8),(64)&7
	line	31
	
l1844:	
;LCD 4 BIT.h: 31: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	32
	
l1846:	
;LCD 4 BIT.h: 32: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	line	33
	
l1848:	
;LCD 4 BIT.h: 33: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	34
	
l1850:	
;LCD 4 BIT.h: 34: RD1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	35
	
l1852:	
;LCD 4 BIT.h: 35: temp1=data<<4;
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
	
l1854:	
;LCD 4 BIT.h: 36: PORTD=temp1&0xF0;
	movf	(lcd_data@temp1),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	37
	
l1856:	
;LCD 4 BIT.h: 37: RD0=1;
	bsf	(64/8),(64)&7
	line	38
	
l1858:	
;LCD 4 BIT.h: 38: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	39
	
l1860:	
;LCD 4 BIT.h: 39: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	line	40
	
l1862:	
;LCD 4 BIT.h: 40: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	41
	
l1864:	
;LCD 4 BIT.h: 41: RD1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	44
	
l570:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
	global	_lcd_command
psect	text113,local,class=CODE,delta=2
global __ptext113
__ptext113:

;; *************** function _lcd_command *****************
;; Defined at:
;;		line 9 in file "C:\Users\blackrider\Desktop\PIC course\Keypad & Motor\LCD 4 BIT.h"
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay
;; This function is called by:
;;		_lcd_initialize
;;		_keypad
;; This function uses a non-reentrant model
;;
psect	text113
	file	"C:\Users\blackrider\Desktop\PIC course\Keypad & Motor\LCD 4 BIT.h"
	line	9
	global	__size_of_lcd_command
	__size_of_lcd_command	equ	__end_of_lcd_command-_lcd_command
	
_lcd_command:	
	opt	stack 5
; Regs used in _lcd_command: [wreg+status,2+status,0+pclath+cstack]
;lcd_command@command stored from wreg
	line	11
	movwf	(lcd_command@command)
	
l1814:	
;LCD 4 BIT.h: 10: unsigned char temp;
;LCD 4 BIT.h: 11: PORTD=command&0xF0;
	movf	(lcd_command@command),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	12
	
l1816:	
;LCD 4 BIT.h: 12: RD0=0;
	bcf	(64/8),(64)&7
	line	13
	
l1818:	
;LCD 4 BIT.h: 13: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	14
	
l1820:	
;LCD 4 BIT.h: 14: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	line	15
	
l1822:	
;LCD 4 BIT.h: 15: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	16
	
l1824:	
;LCD 4 BIT.h: 16: RD1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	17
	
l1826:	
;LCD 4 BIT.h: 17: temp=command<<4;
	movf	(lcd_command@command),w
	movwf	(??_lcd_command+0)+0
	movlw	(04h)-1
u2155:
	clrc
	rlf	(??_lcd_command+0)+0,f
	addlw	-1
	skipz
	goto	u2155
	clrc
	rlf	(??_lcd_command+0)+0,w
	movwf	(??_lcd_command+1)+0
	movf	(??_lcd_command+1)+0,w
	movwf	(lcd_command@temp)
	line	18
	
l1828:	
;LCD 4 BIT.h: 18: PORTD=temp&0xF0;
	movf	(lcd_command@temp),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	19
	
l1830:	
;LCD 4 BIT.h: 19: RD0=0;
	bcf	(64/8),(64)&7
	line	20
	
l1832:	
;LCD 4 BIT.h: 20: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	21
	
l1834:	
;LCD 4 BIT.h: 21: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	line	22
	
l1836:	
;LCD 4 BIT.h: 22: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	23
	
l1838:	
;LCD 4 BIT.h: 23: RD1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	25
	
l567:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_command
	__end_of_lcd_command:
;; =============== function _lcd_command ends ============

	signat	_lcd_command,4216
	global	_delay
psect	text114,local,class=CODE,delta=2
global __ptext114
__ptext114:

;; *************** function _delay *****************
;; Defined at:
;;		line 4 in file "C:\Users\blackrider\Desktop\PIC course\Keypad & Motor\LCD 4 BIT.h"
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
psect	text114
	file	"C:\Users\blackrider\Desktop\PIC course\Keypad & Motor\LCD 4 BIT.h"
	line	4
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 5
; Regs used in _delay: [wreg]
	line	5
	
l1018:	
;LCD 4 BIT.h: 5: while(a--);
	goto	l1020
	
l562:	
	goto	l1020
	
l561:	
	
l1020:	
	movlw	low(01h)
	subwf	(delay@a),f
	movlw	high(01h)
	skipc
	decf	(delay@a+1),f
	subwf	(delay@a+1),f
	movlw	high(0FFFFh)
	xorwf	((delay@a+1)),w
	skipz
	goto	u15
	movlw	low(0FFFFh)
	xorwf	((delay@a)),w
u15:

	skipz
	goto	u11
	goto	u10
u11:
	goto	l1020
u10:
	goto	l564
	
l563:	
	line	6
	
l564:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
psect	text115,local,class=CODE,delta=2
global __ptext115
__ptext115:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
