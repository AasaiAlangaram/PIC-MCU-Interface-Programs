opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 6379"

opt pagewidth 120

	opt pm

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
	FNCALL	_main,_display
	FNCALL	_main,_delay
	FNCALL	_main,___lbmod
	FNCALL	_main,___lbdiv
	FNCALL	_main,_lcd_command
	FNCALL	_main,_lcd_data
	FNCALL	_lcd_initialize,_lcd_command
	FNCALL	_display,_lcd_data
	FNCALL	_lcd_data,_delay
	FNCALL	_lcd_command,_delay
	FNROOT	_main
	global	_PORTD
psect	text74,local,class=CODE,delta=2
global __ptext74
__ptext74:
_PORTD	set	8
	global	_TMR0
_TMR0	set	1
	global	_RD0
_RD0	set	64
	global	_RD1
_RD1	set	65
	global	_TRISA
_TRISA	set	133
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
	btfsc	(btemp+1),7
	ljmp	stringcode
	bcf	status,7
	btfsc	(btemp+1),0
	bsf	status,7
	movf	indf,w
	incf fsr
skipnz
incf btemp+1
	return
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
	retlw	67	;'C'
	retlw	111	;'o'
	retlw	117	;'u'
	retlw	110	;'n'
	retlw	116	;'t'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	0
psect	strings
	file	"Counter & LCD.as"
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
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_lcd_initialize
?_lcd_initialize:	; 0 bytes @ 0x0
	global	?_lcd_data
?_lcd_data:	; 0 bytes @ 0x0
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	?_lcd_command
?_lcd_command:	; 0 bytes @ 0x0
	global	?___lbdiv
?___lbdiv:	; 1 bytes @ 0x0
	global	?___lbmod
?___lbmod:	; 1 bytes @ 0x0
	global	___lbmod@divisor
___lbmod@divisor:	; 1 bytes @ 0x0
	global	___lbdiv@divisor
___lbdiv@divisor:	; 1 bytes @ 0x0
	global	delay@a
delay@a:	; 2 bytes @ 0x0
	ds	1
	global	??___lbmod
??___lbmod:	; 0 bytes @ 0x1
	global	??___lbdiv
??___lbdiv:	; 0 bytes @ 0x1
	global	___lbdiv@dividend
___lbdiv@dividend:	; 1 bytes @ 0x1
	ds	1
	global	??_lcd_data
??_lcd_data:	; 0 bytes @ 0x2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	??_lcd_command
??_lcd_command:	; 0 bytes @ 0x2
	global	___lbmod@dividend
___lbmod@dividend:	; 1 bytes @ 0x2
	global	lcd_command@temp
lcd_command@temp:	; 1 bytes @ 0x2
	global	lcd_data@temp1
lcd_data@temp1:	; 1 bytes @ 0x2
	global	___lbdiv@counter
___lbdiv@counter:	; 1 bytes @ 0x2
	ds	1
	global	___lbdiv@quotient
___lbdiv@quotient:	; 1 bytes @ 0x3
	global	___lbmod@counter
___lbmod@counter:	; 1 bytes @ 0x3
	global	lcd_data@data
lcd_data@data:	; 1 bytes @ 0x3
	global	lcd_command@command
lcd_command@command:	; 1 bytes @ 0x3
	ds	1
	global	?_display
?_display:	; 0 bytes @ 0x4
	global	??_lcd_initialize
??_lcd_initialize:	; 0 bytes @ 0x4
	global	display@len
display@len:	; 1 bytes @ 0x4
	global	___lbmod@rem
___lbmod@rem:	; 1 bytes @ 0x4
	ds	1
	global	??_display
??_display:	; 0 bytes @ 0x5
	global	display@word
display@word:	; 1 bytes @ 0x5
	ds	1
	global	display@a
display@a:	; 1 bytes @ 0x6
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x7
	global	main@c
main@c:	; 1 bytes @ 0x7
	ds	1
	global	main@a
main@a:	; 1 bytes @ 0x8
	ds	1
	global	main@d
main@d:	; 1 bytes @ 0x9
	ds	1
	global	main@temp
main@temp:	; 1 bytes @ 0xA
	ds	1
	global	main@b
main@b:	; 1 bytes @ 0xB
	ds	1
;;Data sizes: Strings 8, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     12      12
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; display@word	PTR const unsigned char  size(1) Largest target is 8
;;		 -> STR_1(CODE[8]), 
;;


;; COMMON:	_main->_display
;; COMMON:	_lcd_initialize->_lcd_command
;; COMMON:	_display->_lcd_data
;; Critical Paths (_lcd_data)
;; COMMON:	_lcd_data->_delay

;; Critical Paths (_lcd_command)
;; COMMON:	_lcd_command->_delay

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0

;;
;;Call Graph Tables:

;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _main                                                 5     5      0     630
;;                                              7 COMMON     5     5      0
;;                     _lcd_initialize
;;                            _display
;;                              _delay
;;                            ___lbmod
;;                            ___lbdiv
;;                        _lcd_command
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_initialize                                       0     0      0      60
;;                        _lcd_command
;; ---------------------------------------------------------------------------------
;; (1) _display                                              3     2      1     120
;;                                              4 COMMON     3     2      1
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (0) _lcd_data                                             2     2      0      60
;;                                              2 COMMON     2     2      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (0) _lcd_command                                          2     2      0      60
;;                                              2 COMMON     2     2      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (4294967295) ___lbmod                                     5     4      1     105
;;                                              0 COMMON     5     4      1
;; ---------------------------------------------------------------------------------
;; (4294967295) ___lbdiv                                     4     3      1     105
;;                                              0 COMMON     4     3      1
;; ---------------------------------------------------------------------------------
;; (4294967295) _delay                                       2     0      2      15
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum call depth -1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _lcd_data (ROOT)
;;   _delay
;;
;; _lcd_command (ROOT)
;;   _delay
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;COMMON               E      C       C       1       85.7%
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
;;		line 4 in file "C:\Users\Admin\Desktop\PIC\PIC course\Counter & LCD\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  temp            1   10[COMMON] unsigned char 
;;  b               1   11[COMMON] unsigned char 
;;  d               1    9[COMMON] unsigned char 
;;  c               1    7[COMMON] unsigned char 
;;  a               1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         5       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_initialize
;;		_display
;;		_delay
;;		___lbmod
;;		___lbdiv
;;		_lcd_command
;;		_lcd_data
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Admin\Desktop\PIC\PIC course\Counter & LCD\main.c"
	line	4
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	6
	
l1120:	
;main.c: 5: unsigned char temp,a,b,c,d;
;main.c: 6: TRISD=0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(136)^080h	;volatile
	line	7
	
l1122:	
;main.c: 9: T0SE=0;
	movlw	(010h)
	movwf	(133)^080h	;volatile
	line	10
	
l1124:	
;main.c: 10: lcd_initialize();
	fcall	_lcd_initialize
	line	11
	
l1126:	
;main.c: 11: display("Counter",7);
	movlw	(07h)
	movwf	(?_display)
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_display
	line	12
	
l1128:	
;main.c: 12: delay(10000);
	movlw	low(02710h)
	movwf	(?_delay)
	movlw	high(02710h)
	movwf	((?_delay))+1
	fcall	_delay
	line	13
	
l1130:	
;main.c: 13: TMR0=0;
	clrf	(1)	;volatile
	line	16
	
l1132:	
;main.c: 15: {
;main.c: 16: temp=TMR0;
	movf	(1),w	;volatile
	movwf	(main@temp)
	line	17
	
l1134:	
;main.c: 17: a=temp%10;
	movlw	(0Ah)
	movwf	(?___lbmod)
	movf	(main@temp),w
	fcall	___lbmod
	movwf	(main@a)
	line	18
	
l1136:	
;main.c: 18: b=temp/10;
	movlw	(0Ah)
	movwf	(?___lbdiv)
	movf	(main@temp),w
	fcall	___lbdiv
	movwf	(main@b)
	line	19
	
l1138:	
;main.c: 19: c=b%10;
	movlw	(0Ah)
	movwf	(?___lbmod)
	movf	(main@b),w
	fcall	___lbmod
	movwf	(main@c)
	line	20
	
l1140:	
;main.c: 20: d=b/10;
	movlw	(0Ah)
	movwf	(?___lbdiv)
	movf	(main@b),w
	fcall	___lbdiv
	movwf	(main@d)
	line	21
	
l1142:	
;main.c: 21: lcd_command(0xC0);
	movlw	(0C0h)
	fcall	_lcd_command
	line	22
	
l1144:	
;main.c: 22: lcd_data(d+0x30);
	movf	(main@d),w
	addlw	030h
	fcall	_lcd_data
	line	23
	
l1146:	
;main.c: 23: lcd_data(c+0x30);
	movf	(main@c),w
	addlw	030h
	fcall	_lcd_data
	line	24
	
l1148:	
;main.c: 24: lcd_data(a+0x30);
	movf	(main@a),w
	addlw	030h
	fcall	_lcd_data
	goto	l1132
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

psect	maintext
	line	26
	signat	_main,88
	global	_lcd_initialize
psect	text75,local,class=CODE,delta=2
global __ptext75
__ptext75:

;; *************** function _lcd_initialize *****************
;; Defined at:
;;		line 47 in file "C:\Users\Admin\Desktop\PIC\PIC course\Counter & LCD\LCD 4 BIT.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
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
psect	text75
	file	"C:\Users\Admin\Desktop\PIC\PIC course\Counter & LCD\LCD 4 BIT.h"
	line	47
	global	__size_of_lcd_initialize
	__size_of_lcd_initialize	equ	__end_of_lcd_initialize-_lcd_initialize
	
_lcd_initialize:	
	opt	stack 2
; Regs used in _lcd_initialize: [wreg+status,2+status,0+pclath+cstack]
	line	48
	
l1110:	
;LCD 4 BIT.h: 48: lcd_command(0x02);
	movlw	(02h)
	fcall	_lcd_command
	line	49
;LCD 4 BIT.h: 49: lcd_command(0x2C);
	movlw	(02Ch)
	fcall	_lcd_command
	line	50
;LCD 4 BIT.h: 50: lcd_command(0x06);
	movlw	(06h)
	fcall	_lcd_command
	line	51
;LCD 4 BIT.h: 51: lcd_command(0x0c);
	movlw	(0Ch)
	fcall	_lcd_command
	line	52
;LCD 4 BIT.h: 52: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	53
;LCD 4 BIT.h: 53: lcd_command(0x80);
	movlw	(080h)
	fcall	_lcd_command
	line	54
	
l571:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_initialize
	__end_of_lcd_initialize:
;; =============== function _lcd_initialize ends ============

	signat	_lcd_initialize,88
	global	_display
psect	text76,local,class=CODE,delta=2
global __ptext76
__ptext76:

;; *************** function _display *****************
;; Defined at:
;;		line 56 in file "C:\Users\Admin\Desktop\PIC\PIC course\Counter & LCD\LCD 4 BIT.h"
;; Parameters:    Size  Location     Type
;;  word            1    wreg     PTR const unsigned char 
;;		 -> STR_1(8), 
;;  len             1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  word            1    5[COMMON] PTR const unsigned char 
;;		 -> STR_1(8), 
;;  a               1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text76
	file	"C:\Users\Admin\Desktop\PIC\PIC course\Counter & LCD\LCD 4 BIT.h"
	line	56
	global	__size_of_display
	__size_of_display	equ	__end_of_display-_display
	
_display:	
	opt	stack 2
; Regs used in _display: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;display@word stored from wreg
	line	58
	movwf	(display@word)
	
l1112:	
;LCD 4 BIT.h: 57: unsigned char a;
;LCD 4 BIT.h: 58: for(a=0;a<=len;a++)
	clrf	(display@a)
	goto	l1118
	line	60
	
l1114:	
;LCD 4 BIT.h: 59: {
;LCD 4 BIT.h: 60: lcd_data(word[a]);
	movf	(display@a),w
	addwf	(display@word),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	line	58
	
l1116:	
	incf	(display@a),f
	
l1118:	
	movf	(display@a),w
	subwf	(display@len),w
	skipnc
	goto	u91
	goto	u90
u91:
	goto	l1114
u90:
	line	63
	
l577:	
	return
	opt stack 0
GLOBAL	__end_of_display
	__end_of_display:
;; =============== function _display ends ============

	signat	_display,8312
	global	_lcd_data
psect	text77,local,class=CODE,delta=2
global __ptext77
__ptext77:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 28 in file "C:\Users\Admin\Desktop\PIC\PIC course\Counter & LCD\LCD 4 BIT.h"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    3[COMMON] unsigned char 
;;  temp1           1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay
;; This function is called by:
;;		_display
;;		_main
;; This function uses a non-reentrant model
;;
psect	text77
	file	"C:\Users\Admin\Desktop\PIC\PIC course\Counter & LCD\LCD 4 BIT.h"
	line	28
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 1
; Regs used in _lcd_data: [wreg+status,2+status,0+pclath+cstack]
;lcd_data@data stored from wreg
	line	30
	movwf	(lcd_data@data)
	
l1084:	
;LCD 4 BIT.h: 29: unsigned char temp1;
;LCD 4 BIT.h: 30: PORTD=data&0xF0;
	movf	(lcd_data@data),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	31
	
l1086:	
;LCD 4 BIT.h: 31: RD0=1;
	bsf	(64/8),(64)&7
	line	32
	
l1088:	
;LCD 4 BIT.h: 32: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	33
	
l1090:	
;LCD 4 BIT.h: 33: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(65/8),(65)&7
	line	34
	
l1092:	
;LCD 4 BIT.h: 34: delay(200);
	movlw	0C8h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	35
	
l1094:	
;LCD 4 BIT.h: 35: RD1=0;
	bcf	(65/8),(65)&7
	line	36
	
l1096:	
;LCD 4 BIT.h: 36: temp1=data<<4;
	swapf	(lcd_data@data),w
	andlw	(0ffh shl 4) & 0ffh
	movwf	(lcd_data@temp1)
	line	37
	
l1098:	
;LCD 4 BIT.h: 37: PORTD=temp1&0xF0;
	movf	(lcd_data@temp1),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	38
	
l1100:	
;LCD 4 BIT.h: 38: RD0=1;
	bsf	(64/8),(64)&7
	line	39
	
l1102:	
;LCD 4 BIT.h: 39: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	40
	
l1104:	
;LCD 4 BIT.h: 40: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(65/8),(65)&7
	line	41
	
l1106:	
;LCD 4 BIT.h: 41: delay(200);
	movlw	0C8h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	42
	
l1108:	
;LCD 4 BIT.h: 42: RD1=0;
	bcf	(65/8),(65)&7
	line	45
	
l568:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
	global	_lcd_command
psect	text78,local,class=CODE,delta=2
global __ptext78
__ptext78:

;; *************** function _lcd_command *****************
;; Defined at:
;;		line 10 in file "C:\Users\Admin\Desktop\PIC\PIC course\Counter & LCD\LCD 4 BIT.h"
;; Parameters:    Size  Location     Type
;;  command         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  command         1    3[COMMON] unsigned char 
;;  temp            1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 15F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay
;; This function is called by:
;;		_lcd_initialize
;;		_main
;; This function uses a non-reentrant model
;;
psect	text78
	file	"C:\Users\Admin\Desktop\PIC\PIC course\Counter & LCD\LCD 4 BIT.h"
	line	10
	global	__size_of_lcd_command
	__size_of_lcd_command	equ	__end_of_lcd_command-_lcd_command
	
_lcd_command:	
	opt	stack 1
; Regs used in _lcd_command: [wreg+status,2+status,0+pclath+cstack]
;lcd_command@command stored from wreg
	line	12
	movwf	(lcd_command@command)
	
l1058:	
;LCD 4 BIT.h: 11: unsigned char temp;
;LCD 4 BIT.h: 12: PORTD=command&0xF0;
	movf	(lcd_command@command),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	movwf	(8)	;volatile
	line	13
	
l1060:	
;LCD 4 BIT.h: 13: RD0=0;
	bcf	(64/8),(64)&7
	line	14
	
l1062:	
;LCD 4 BIT.h: 14: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	15
	
l1064:	
;LCD 4 BIT.h: 15: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(65/8),(65)&7
	line	16
	
l1066:	
;LCD 4 BIT.h: 16: delay(200);
	movlw	0C8h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	17
	
l1068:	
;LCD 4 BIT.h: 17: RD1=0;
	bcf	(65/8),(65)&7
	line	18
	
l1070:	
;LCD 4 BIT.h: 18: temp=command<<4;
	swapf	(lcd_command@command),w
	andlw	(0ffh shl 4) & 0ffh
	movwf	(lcd_command@temp)
	line	19
	
l1072:	
;LCD 4 BIT.h: 19: PORTD=temp&0xF0;
	movf	(lcd_command@temp),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	20
	
l1074:	
;LCD 4 BIT.h: 20: RD0=0;
	bcf	(64/8),(64)&7
	line	21
	
l1076:	
;LCD 4 BIT.h: 21: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	22
	
l1078:	
;LCD 4 BIT.h: 22: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(65/8),(65)&7
	line	23
	
l1080:	
;LCD 4 BIT.h: 23: delay(200);
	movlw	0C8h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	24
	
l1082:	
;LCD 4 BIT.h: 24: RD1=0;
	bcf	(65/8),(65)&7
	line	26
	
l565:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_command
	__end_of_lcd_command:
;; =============== function _lcd_command ends ============

	signat	_lcd_command,4216
	global	___lbmod
psect	text79,local,class=CODE,delta=2
global __ptext79
__ptext79:

;; *************** function ___lbmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71\sources\lbmod.c"
;; Parameters:    Size  Location     Type
;;  dividend        1    wreg     unsigned char 
;;  divisor         1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dividend        1    2[COMMON] unsigned char 
;;  rem             1    4[COMMON] unsigned char 
;;  counter         1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text79
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71\sources\lbmod.c"
	line	5
	global	__size_of___lbmod
	__size_of___lbmod	equ	__end_of___lbmod-___lbmod
	
___lbmod:	
	opt	stack 0
; Regs used in ___lbmod: [wreg+status,2+status,0]
;___lbmod@dividend stored from wreg
	line	9
	movwf	(___lbmod@dividend)
	
l1012:	
;lbmod.c: 6: unsigned char rem;
;lbmod.c: 7: unsigned char counter;
;lbmod.c: 9: counter = 8;
	movlw	(08h)
	movwf	(___lbmod@counter)
	line	10
	
l1014:	
;lbmod.c: 10: rem = 0;
	clrf	(___lbmod@rem)
	line	12
	
l1016:	
;lbmod.c: 12: rem = (rem << 1) | (dividend >> 7);
	movf	(___lbmod@dividend),w
	movwf	(??___lbmod+0)+0
	movlw	07h
u15:
	clrc
	rrf	(??___lbmod+0)+0,f
	addlw	-1
	skipz
	goto	u15
	clrc
	rlf	(___lbmod@rem),w
	iorwf	0+(??___lbmod+0)+0,w
	movwf	(___lbmod@rem)
	line	13
	
l1018:	
;lbmod.c: 13: dividend <<= 1;
	clrc
	rlf	(___lbmod@dividend),f
	line	14
	
l1020:	
;lbmod.c: 14: if(divisor <= rem)
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),w
	skipc
	goto	u21
	goto	u20
u21:
	goto	l1024
u20:
	line	15
	
l1022:	
;lbmod.c: 15: rem -= divisor;
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),f
	line	16
	
l1024:	
;lbmod.c: 16: } while(--counter != 0);
	decfsz	(___lbmod@counter),f
	goto	u31
	goto	u30
u31:
	goto	l1016
u30:
	line	17
	
l1026:	
;lbmod.c: 17: return rem;
	movf	(___lbmod@rem),w
	line	18
	
l631:	
	return
	opt stack 0
GLOBAL	__end_of___lbmod
	__end_of___lbmod:
;; =============== function ___lbmod ends ============

	signat	___lbmod,8313
	global	___lbdiv
psect	text80,local,class=CODE,delta=2
global __ptext80
__ptext80:

;; *************** function ___lbdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71\sources\lbdiv.c"
;; Parameters:    Size  Location     Type
;;  dividend        1    wreg     unsigned char 
;;  divisor         1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dividend        1    1[COMMON] unsigned char 
;;  quotient        1    3[COMMON] unsigned char 
;;  counter         1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text80
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71\sources\lbdiv.c"
	line	5
	global	__size_of___lbdiv
	__size_of___lbdiv	equ	__end_of___lbdiv-___lbdiv
	
___lbdiv:	
	opt	stack 0
; Regs used in ___lbdiv: [wreg+status,2+status,0]
;___lbdiv@dividend stored from wreg
	line	9
	movwf	(___lbdiv@dividend)
	
l1030:	
;lbdiv.c: 6: unsigned char quotient;
;lbdiv.c: 7: unsigned char counter;
;lbdiv.c: 9: quotient = 0;
	clrf	(___lbdiv@quotient)
	line	10
	
l1032:	
;lbdiv.c: 10: if(divisor != 0) {
	movf	(___lbdiv@divisor),w
	skipz
	goto	u40
	goto	l1050
u40:
	line	11
	
l1034:	
;lbdiv.c: 11: counter = 1;
	clrf	(___lbdiv@counter)
	incf	(___lbdiv@counter),f
	line	12
;lbdiv.c: 12: while((divisor & 0x80) == 0) {
	goto	l1038
	
l620:	
	line	13
;lbdiv.c: 13: divisor <<= 1;
	clrc
	rlf	(___lbdiv@divisor),f
	line	14
	
l1036:	
;lbdiv.c: 14: counter++;
	incf	(___lbdiv@counter),f
	line	12
	
l1038:	
	btfss	(___lbdiv@divisor),(7)&7
	goto	u51
	goto	u50
u51:
	goto	l620
u50:
	line	16
;lbdiv.c: 15: }
;lbdiv.c: 16: do {
	
l622:	
	line	17
;lbdiv.c: 17: quotient <<= 1;
	clrc
	rlf	(___lbdiv@quotient),f
	line	18
	
l1040:	
;lbdiv.c: 18: if(divisor <= dividend) {
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),w
	skipc
	goto	u61
	goto	u60
u61:
	goto	l1046
u60:
	line	19
	
l1042:	
;lbdiv.c: 19: dividend -= divisor;
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),f
	line	20
	
l1044:	
;lbdiv.c: 20: quotient |= 1;
	bsf	(___lbdiv@quotient)+(0/8),(0)&7
	line	22
	
l1046:	
;lbdiv.c: 21: }
;lbdiv.c: 22: divisor >>= 1;
	clrc
	rrf	(___lbdiv@divisor),f
	line	23
	
l1048:	
;lbdiv.c: 23: } while(--counter != 0);
	decfsz	(___lbdiv@counter),f
	goto	u71
	goto	u70
u71:
	goto	l622
u70:
	line	25
	
l1050:	
;lbdiv.c: 24: }
;lbdiv.c: 25: return quotient;
	movf	(___lbdiv@quotient),w
	line	26
	
l625:	
	return
	opt stack 0
GLOBAL	__end_of___lbdiv
	__end_of___lbdiv:
;; =============== function ___lbdiv ends ============

	signat	___lbdiv,8313
	global	_delay
psect	text81,local,class=CODE,delta=2
global __ptext81
__ptext81:

;; *************** function _delay *****************
;; Defined at:
;;		line 5 in file "C:\Users\Admin\Desktop\PIC\PIC course\Counter & LCD\LCD 4 BIT.h"
;; Parameters:    Size  Location     Type
;;  a               2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
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
psect	text81
	file	"C:\Users\Admin\Desktop\PIC\PIC course\Counter & LCD\LCD 4 BIT.h"
	line	5
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 0
; Regs used in _delay: [wreg]
	line	6
	
l1054:	
;LCD 4 BIT.h: 6: while(a--);
	
l1056:	
	movlw	low(01h)
	subwf	(delay@a),f
	movlw	high(01h)
	skipc
	decf	(delay@a+1),f
	subwf	(delay@a+1),f
	incf	((delay@a)),w
	skipnz
	incf	((delay@a+1)),w

	skipz
	goto	u81
	goto	u80
u81:
	goto	l1056
u80:
	line	7
	
l562:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
psect	text82,local,class=CODE,delta=2
global __ptext82
__ptext82:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
