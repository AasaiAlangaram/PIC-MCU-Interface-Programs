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
	FNCALL	_main,_lcd_command
	FNCALL	_main,_display
	FNCALL	_main,_delay
	FNCALL	_display,_lcd_data
	FNCALL	_lcd_initialize,_lcd_command
	FNCALL	_lcd_data,_delay
	FNCALL	_lcd_command,_delay
	FNROOT	_main
	global	_PORTD
psect	text90,local,class=CODE,delta=2
global __ptext90
__ptext90:
_PORTD	set	8
	global	_PORTE
_PORTE	set	9
	global	_RE0
_RE0	set	72
	global	_RE1
_RE1	set	73
	global	_RE2
_RE2	set	74
	global	_TRISD
_TRISD	set	136
	global	_TRISE
_TRISE	set	137
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
	retlw	106	;'j'
	retlw	101	;'e'
	retlw	121	;'y'
	retlw	97	;'a'
	retlw	32	;' '
	retlw	107	;'k'
	retlw	117	;'u'
	retlw	109	;'m'
	retlw	97	;'a'
	retlw	114	;'r'
	retlw	0
psect	strings
	file	"LCD_4BIT .as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

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
	global	??_main
??_main:	; 0 bytes @ 0xA
	ds	1
;;Data sizes: Strings 11, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     11      11
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; display@word	PTR const unsigned char  size(1) Largest target is 11
;;		 -> STR_1(CODE[11]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_display
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
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 1     1      0     255
;;                                             10 COMMON     1     1      0
;;                     _lcd_initialize
;;                        _lcd_command
;;                            _display
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _display                                              4     3      1     120
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
;; (1) _lcd_command                                          4     4      0      60
;;                                              2 COMMON     4     4      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _delay                                                2     0      2      15
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd_initialize
;;     _lcd_command
;;       _delay
;;   _lcd_command
;;     _delay
;;   _display
;;     _lcd_data
;;       _delay
;;   _delay
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      B       B       1       78.6%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;ABS                  0      0       0       3        0.0%
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
;;DATA                 0      0       0      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 10 in file "C:\Users\blackrider\Desktop\PIC course\4 Bit LCD\main.c"
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
;;      Temps:          1       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_initialize
;;		_lcd_command
;;		_display
;;		_delay
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\blackrider\Desktop\PIC course\4 Bit LCD\main.c"
	line	10
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	12
	
l1808:	
;main.c: 12: TRISD=0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	13
;main.c: 13: TRISE=0x00;
	clrf	(137)^080h	;volatile
	line	15
;main.c: 15: PORTD=PORTE=0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(9)	;volatile
	clrf	(8)	;volatile
	line	16
	
l1810:	
;main.c: 16: lcd_initialize();
	fcall	_lcd_initialize
	goto	l1812
	line	18
;main.c: 18: while(1)
	
l580:	
	line	20
	
l1812:	
;main.c: 19: {
;main.c: 20: lcd_command(0x80);
	movlw	(080h)
	fcall	_lcd_command
	line	22
	
l1814:	
;main.c: 22: display("jeya kumar",10);
	movlw	(0Ah)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_display)
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_display
	line	23
	
l1816:	
;main.c: 23: delay(20000);
	movlw	low(04E20h)
	movwf	(?_delay)
	movlw	high(04E20h)
	movwf	((?_delay))+1
	fcall	_delay
	goto	l1812
	line	26
	
l581:	
	line	18
	goto	l1812
	
l582:	
	line	28
	
l583:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_display
psect	text91,local,class=CODE,delta=2
global __ptext91
__ptext91:

;; *************** function _display *****************
;; Defined at:
;;		line 55 in file "C:\Users\blackrider\Desktop\PIC course\4 Bit LCD\4Bit_LCD.h"
;; Parameters:    Size  Location     Type
;;  word            1    wreg     PTR const unsigned char 
;;		 -> STR_1(11), 
;;  len             1    6[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  word            1    8[COMMON] PTR const unsigned char 
;;		 -> STR_1(11), 
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text91
	file	"C:\Users\blackrider\Desktop\PIC course\4 Bit LCD\4Bit_LCD.h"
	line	55
	global	__size_of_display
	__size_of_display	equ	__end_of_display-_display
	
_display:	
	opt	stack 5
; Regs used in _display: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;display@word stored from wreg
	line	57
	movwf	(display@word)
	
l1800:	
;4Bit_LCD.h: 56: unsigned char a;
;4Bit_LCD.h: 57: for(a=0;a<=len;a++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(display@a)
	goto	l1806
	line	58
	
l575:	
	line	59
	
l1802:	
;4Bit_LCD.h: 58: {
;4Bit_LCD.h: 59: lcd_data(word[a]);
	movf	(display@a),w
	addwf	(display@word),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	line	57
	
l1804:	
	movlw	(01h)
	movwf	(??_display+0)+0
	movf	(??_display+0)+0,w
	addwf	(display@a),f
	goto	l1806
	
l574:	
	
l1806:	
	movf	(display@a),w
	subwf	(display@len),w
	skipnc
	goto	u2171
	goto	u2170
u2171:
	goto	l1802
u2170:
	goto	l577
	
l576:	
	line	62
	
l577:	
	return
	opt stack 0
GLOBAL	__end_of_display
	__end_of_display:
;; =============== function _display ends ============

	signat	_display,8312
	global	_lcd_initialize
psect	text92,local,class=CODE,delta=2
global __ptext92
__ptext92:

;; *************** function _lcd_initialize *****************
;; Defined at:
;;		line 46 in file "C:\Users\blackrider\Desktop\PIC course\4 Bit LCD\4Bit_LCD.h"
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
psect	text92
	file	"C:\Users\blackrider\Desktop\PIC course\4 Bit LCD\4Bit_LCD.h"
	line	46
	global	__size_of_lcd_initialize
	__size_of_lcd_initialize	equ	__end_of_lcd_initialize-_lcd_initialize
	
_lcd_initialize:	
	opt	stack 5
; Regs used in _lcd_initialize: [wreg+status,2+status,0+pclath+cstack]
	line	47
	
l1798:	
;4Bit_LCD.h: 47: lcd_command(0x02);
	movlw	(02h)
	fcall	_lcd_command
	line	48
;4Bit_LCD.h: 48: lcd_command(0x2C);
	movlw	(02Ch)
	fcall	_lcd_command
	line	49
;4Bit_LCD.h: 49: lcd_command(0x06);
	movlw	(06h)
	fcall	_lcd_command
	line	50
;4Bit_LCD.h: 50: lcd_command(0x0c);
	movlw	(0Ch)
	fcall	_lcd_command
	line	51
;4Bit_LCD.h: 51: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	52
;4Bit_LCD.h: 52: lcd_command(0x80);
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
	global	_lcd_data
psect	text93,local,class=CODE,delta=2
global __ptext93
__ptext93:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 27 in file "C:\Users\blackrider\Desktop\PIC course\4 Bit LCD\4Bit_LCD.h"
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
;; This function uses a non-reentrant model
;;
psect	text93
	file	"C:\Users\blackrider\Desktop\PIC course\4 Bit LCD\4Bit_LCD.h"
	line	27
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 5
; Regs used in _lcd_data: [wreg+status,2+status,0+pclath+cstack]
;lcd_data@data stored from wreg
	line	29
	movwf	(lcd_data@data)
	
l1772:	
;4Bit_LCD.h: 28: unsigned char temp1;
;4Bit_LCD.h: 29: PORTD=data&0xF0;
	movf	(lcd_data@data),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	30
	
l1774:	
;4Bit_LCD.h: 30: RE0=1;
	bsf	(72/8),(72)&7
	line	31
	
l1776:	
;4Bit_LCD.h: 31: RE1=0;
	bcf	(73/8),(73)&7
	line	32
	
l1778:	
;4Bit_LCD.h: 32: RE2=1;
	bsf	(74/8),(74)&7
	line	33
	
l1780:	
;4Bit_LCD.h: 33: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	34
	
l1782:	
;4Bit_LCD.h: 34: RE2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(74/8),(74)&7
	line	35
	
l1784:	
;4Bit_LCD.h: 35: temp1=data<<4;
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
	
l1786:	
;4Bit_LCD.h: 36: PORTD=temp1&0xF0;
	movf	(lcd_data@temp1),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	37
	
l1788:	
;4Bit_LCD.h: 37: RE0=1;
	bsf	(72/8),(72)&7
	line	38
	
l1790:	
;4Bit_LCD.h: 38: RE1=0;
	bcf	(73/8),(73)&7
	line	39
	
l1792:	
;4Bit_LCD.h: 39: RE2=1;
	bsf	(74/8),(74)&7
	line	40
	
l1794:	
;4Bit_LCD.h: 40: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	41
	
l1796:	
;4Bit_LCD.h: 41: RE2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(74/8),(74)&7
	line	44
	
l568:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
	global	_lcd_command
psect	text94,local,class=CODE,delta=2
global __ptext94
__ptext94:

;; *************** function _lcd_command *****************
;; Defined at:
;;		line 9 in file "C:\Users\blackrider\Desktop\PIC course\4 Bit LCD\4Bit_LCD.h"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text94
	file	"C:\Users\blackrider\Desktop\PIC course\4 Bit LCD\4Bit_LCD.h"
	line	9
	global	__size_of_lcd_command
	__size_of_lcd_command	equ	__end_of_lcd_command-_lcd_command
	
_lcd_command:	
	opt	stack 6
; Regs used in _lcd_command: [wreg+status,2+status,0+pclath+cstack]
;lcd_command@command stored from wreg
	line	11
	movwf	(lcd_command@command)
	
l1746:	
;4Bit_LCD.h: 10: unsigned char temp;
;4Bit_LCD.h: 11: PORTD=command&0xF0;
	movf	(lcd_command@command),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	12
	
l1748:	
;4Bit_LCD.h: 12: RE0=0;
	bcf	(72/8),(72)&7
	line	13
	
l1750:	
;4Bit_LCD.h: 13: RE1=0;
	bcf	(73/8),(73)&7
	line	14
	
l1752:	
;4Bit_LCD.h: 14: RE2=1;
	bsf	(74/8),(74)&7
	line	15
	
l1754:	
;4Bit_LCD.h: 15: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	16
	
l1756:	
;4Bit_LCD.h: 16: RE2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(74/8),(74)&7
	line	17
	
l1758:	
;4Bit_LCD.h: 17: temp=command<<4;
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
	
l1760:	
;4Bit_LCD.h: 18: PORTD=temp&0xF0;
	movf	(lcd_command@temp),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	19
	
l1762:	
;4Bit_LCD.h: 19: RE0=0;
	bcf	(72/8),(72)&7
	line	20
	
l1764:	
;4Bit_LCD.h: 20: RE1=0;
	bcf	(73/8),(73)&7
	line	21
	
l1766:	
;4Bit_LCD.h: 21: RE2=1;
	bsf	(74/8),(74)&7
	line	22
	
l1768:	
;4Bit_LCD.h: 22: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	23
	
l1770:	
;4Bit_LCD.h: 23: RE2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(74/8),(74)&7
	line	25
	
l565:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_command
	__end_of_lcd_command:
;; =============== function _lcd_command ends ============

	signat	_lcd_command,4216
	global	_delay
psect	text95,local,class=CODE,delta=2
global __ptext95
__ptext95:

;; *************** function _delay *****************
;; Defined at:
;;		line 4 in file "C:\Users\blackrider\Desktop\PIC course\4 Bit LCD\4Bit_LCD.h"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text95
	file	"C:\Users\blackrider\Desktop\PIC course\4 Bit LCD\4Bit_LCD.h"
	line	4
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 7
; Regs used in _delay: [wreg]
	line	5
	
l956:	
;4Bit_LCD.h: 5: while(a--);
	goto	l958
	
l560:	
	goto	l958
	
l559:	
	
l958:	
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
	goto	l958
u10:
	goto	l562
	
l561:	
	line	6
	
l562:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
psect	text96,local,class=CODE,delta=2
global __ptext96
__ptext96:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
