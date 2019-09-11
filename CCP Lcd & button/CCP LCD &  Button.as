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
	FNCALL	_main,_lcd_command
	FNCALL	_main,_t1_delay
	FNCALL	_main,___lwmod
	FNCALL	_main,___lwdiv
	FNCALL	_main,_lcd_data
	FNCALL	_lcd_initialize,_lcd_command
	FNCALL	_display,_lcd_data
	FNCALL	_lcd_command,_delay
	FNCALL	_lcd_data,_delay
	FNROOT	_main
	global	_CCP1CON
psect	text150,local,class=CODE,delta=2
global __ptext150
__ptext150:
_CCP1CON	set	23
	global	_CCPR1H
_CCPR1H	set	22
	global	_CCPR1L
_CCPR1L	set	21
	global	_PORTC
_PORTC	set	7
	global	_PORTD
_PORTD	set	8
	global	_T1CON
_T1CON	set	16
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_CCP1IF
_CCP1IF	set	98
	global	_RD0
_RD0	set	64
	global	_RD1
_RD1	set	65
	global	_TMR1IF
_TMR1IF	set	96
	global	_TMR1ON
_TMR1ON	set	128
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
	
STR_2:	
	retlw	67	;'C'
	retlw	97	;'a'
	retlw	112	;'p'
	retlw	116	;'t'
	retlw	117	;'u'
	retlw	114	;'r'
	retlw	101	;'e'
	retlw	32	;' '
	retlw	118	;'v'
	retlw	97	;'a'
	retlw	108	;'l'
	retlw	117	;'u'
	retlw	101	;'e'
	retlw	32	;' '
	retlw	105	;'i'
	retlw	115	;'s'
	retlw	0
psect	strings
	
STR_1:	
	retlw	67	;'C'
	retlw	67	;'C'
	retlw	80	;'P'
	retlw	0
psect	strings
	file	"CCP LCD &  Button.as"
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
	global	?_lcd_initialize
?_lcd_initialize:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_lcd_data
?_lcd_data:	; 0 bytes @ 0x0
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	??_t1_delay
??_t1_delay:	; 0 bytes @ 0x0
	global	?_t1_delay
?_t1_delay:	; 0 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x0
	global	delay@a
delay@a:	; 2 bytes @ 0x0
	ds	2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	??_lcd_command
??_lcd_command:	; 0 bytes @ 0x2
	global	??_lcd_data
??_lcd_data:	; 0 bytes @ 0x2
	global	lcd_command@temp
lcd_command@temp:	; 1 bytes @ 0x2
	global	lcd_data@temp1
lcd_data@temp1:	; 1 bytes @ 0x2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	ds	1
	global	lcd_data@data
lcd_data@data:	; 1 bytes @ 0x3
	global	lcd_command@command
lcd_command@command:	; 1 bytes @ 0x3
	ds	1
	global	??_lcd_initialize
??_lcd_initialize:	; 0 bytes @ 0x4
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x4
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0x4
	global	?_display
?_display:	; 0 bytes @ 0x4
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x4
	global	display@len
display@len:	; 1 bytes @ 0x4
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x4
	ds	1
	global	??_display
??_display:	; 0 bytes @ 0x5
	global	display@word
display@word:	; 1 bytes @ 0x5
	ds	1
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x6
	global	display@a
display@a:	; 1 bytes @ 0x6
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x7
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	main@c
main@c:	; 2 bytes @ 0x0
	ds	2
	global	main@e
main@e:	; 2 bytes @ 0x2
	ds	2
	global	main@g
main@g:	; 2 bytes @ 0x4
	ds	2
	global	main@h
main@h:	; 2 bytes @ 0x6
	ds	2
	global	main@a
main@a:	; 2 bytes @ 0x8
	ds	2
	global	main@f
main@f:	; 2 bytes @ 0xA
	ds	2
	global	main@b
main@b:	; 2 bytes @ 0xC
	ds	2
	global	main@d
main@d:	; 2 bytes @ 0xE
	ds	2
	global	main@temp
main@temp:	; 2 bytes @ 0x10
	ds	2
;;Data sizes: Strings 21, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      7       7
;; BANK0           80     18      18
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; display@word	PTR const unsigned char  size(1) Largest target is 17
;;		 -> STR_1(CODE[4]), STR_2(CODE[17]), 
;;


;; COMMON:	_main->_display
;; COMMON:	_main->___lwdiv
;; COMMON:	_lcd_initialize->_lcd_command
;; COMMON:	_display->_lcd_data
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
;; (2) _main                                                18    18      0    1086
;;                                              0 BANK0     18    18      0
;;                     _lcd_initialize
;;                            _display
;;                              _delay
;;                        _lcd_command
;;                           _t1_delay
;;                            ___lwmod
;;                            ___lwdiv
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_initialize                                       0     0      0      89
;;                        _lcd_command
;; ---------------------------------------------------------------------------------
;; (1) _display                                              3     2      1     179
;;                                              4 COMMON     3     2      1
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (0) _lcd_command                                          2     2      0      89
;;                                              2 COMMON     2     2      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (0) _lcd_data                                             2     2      0      89
;;                                              2 COMMON     2     2      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (4294967295) ___lwdiv                                     7     3      4     162
;;                                              0 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (4294967295) ___lwmod                                     5     1      4     159
;;                                              0 COMMON     5     1      4
;; ---------------------------------------------------------------------------------
;; (4294967295) _t1_delay                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4294967295) _delay                                       2     0      2      22
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
;;COMMON               E      7       7       1       50.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;BITBANK0            50      0       0       3        0.0%
;;BANK0               50     12      12       4       22.5%
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
;;		line 14 in file "C:\Users\Admin\Desktop\PIC\PIC course\CCP Lcd & button\CCP LCD &  Button.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  temp            2   16[BANK0 ] unsigned int 
;;  f               2   10[BANK0 ] unsigned int 
;;  d               2   14[BANK0 ] unsigned int 
;;  b               2   12[BANK0 ] unsigned int 
;;  h               2    6[BANK0 ] unsigned int 
;;  g               2    4[BANK0 ] unsigned int 
;;  e               2    2[BANK0 ] unsigned int 
;;  c               2    0[BANK0 ] unsigned int 
;;  a               2    8[BANK0 ] unsigned int 
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
;;      Locals:         0      18       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0      18       0       0       0
;;Total ram usage:       18 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_initialize
;;		_display
;;		_delay
;;		_lcd_command
;;		_t1_delay
;;		___lwmod
;;		___lwdiv
;;		_lcd_data
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Admin\Desktop\PIC\PIC course\CCP Lcd & button\CCP LCD &  Button.c"
	line	14
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	16
	
l1387:	
;CCP LCD &  Button.c: 15: unsigned int temp,a,b,c,d,e,f,g,h;
;CCP LCD &  Button.c: 16: TRISC=0x04;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	17
	
l1389:	
;CCP LCD &  Button.c: 17: TRISD=0x00;
	clrf	(136)^080h	;volatile
	line	18
	
l1391:	
;CCP LCD &  Button.c: 18: PORTC=0x00;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(7)	;volatile
	line	19
	
l1393:	
;CCP LCD &  Button.c: 19: PORTD=0x00;
	clrf	(8)	;volatile
	line	20
	
l1395:	
;CCP LCD &  Button.c: 20: CCP1CON=0x05;
	movlw	(05h)
	movwf	(23)	;volatile
	line	21
	
l1397:	
;CCP LCD &  Button.c: 21: lcd_initialize();
	fcall	_lcd_initialize
	line	22
	
l1399:	
;CCP LCD &  Button.c: 22: display("CCP",3);
	movlw	(03h)
	movwf	(?_display)
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_display
	line	23
	
l1401:	
;CCP LCD &  Button.c: 23: delay(60000);
	movlw	low(0EA60h)
	movwf	(?_delay)
	movlw	high(0EA60h)
	movwf	((?_delay))+1
	fcall	_delay
	line	24
	
l1403:	
;CCP LCD &  Button.c: 24: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	25
	
l1405:	
;CCP LCD &  Button.c: 25: display("Capture value is",15);
	movlw	(0Fh)
	movwf	(?_display)
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_display
	line	26
	
l1407:	
;CCP LCD &  Button.c: 26: delay(60000);
	movlw	low(0EA60h)
	movwf	(?_delay)
	movlw	high(0EA60h)
	movwf	((?_delay))+1
	fcall	_delay
	line	29
	
l1409:	
;CCP LCD &  Button.c: 28: {
;CCP LCD &  Button.c: 29: t1_delay();
	fcall	_t1_delay
	line	30
	
l1411:	
;CCP LCD &  Button.c: 30: lcd_command(0xC0);
	movlw	(0C0h)
	fcall	_lcd_command
	line	31
;CCP LCD &  Button.c: 31: while(CCP1IF==0);
	
l587:	
	btfss	(98/8),(98)&7
	goto	u241
	goto	u240
u241:
	goto	l587
u240:
	
l589:	
	line	32
;CCP LCD &  Button.c: 32: CCP1IF=0;
	bcf	(98/8),(98)&7
	line	34
	
l1413:	
;CCP LCD &  Button.c: 34: temp=CCPR1H<<8;
	movf	(22),w	;volatile
	movwf	(main@temp)
	clrf	(main@temp+1)
	movf	(main@temp),w
	movwf	(main@temp+1)
	clrf	(main@temp)
	line	35
;CCP LCD &  Button.c: 35: temp=temp+CCPR1L;
	movf	(21),w	;volatile
	addwf	(main@temp),f
	skipnc
	incf	(main@temp+1),f
	line	36
	
l1415:	
;CCP LCD &  Button.c: 36: a=temp%10;
	movlw	0Ah
	movwf	(?___lwmod)
	clrf	(?___lwmod+1)
	movf	(main@temp+1),w
	movwf	1+(?___lwmod)+02h
	movf	(main@temp),w
	movwf	0+(?___lwmod)+02h
	fcall	___lwmod
	movf	(1+(?___lwmod)),w
	movwf	(main@a+1)
	movf	(0+(?___lwmod)),w
	movwf	(main@a)
	line	37
	
l1417:	
;CCP LCD &  Button.c: 37: b=temp/10;
	movlw	0Ah
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	movf	(main@temp+1),w
	movwf	1+(?___lwdiv)+02h
	movf	(main@temp),w
	movwf	0+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	movwf	(main@b+1)
	movf	(0+(?___lwdiv)),w
	movwf	(main@b)
	line	38
	
l1419:	
;CCP LCD &  Button.c: 38: c=b%10;
	movlw	0Ah
	movwf	(?___lwmod)
	clrf	(?___lwmod+1)
	movf	(main@b+1),w
	movwf	1+(?___lwmod)+02h
	movf	(main@b),w
	movwf	0+(?___lwmod)+02h
	fcall	___lwmod
	movf	(1+(?___lwmod)),w
	movwf	(main@c+1)
	movf	(0+(?___lwmod)),w
	movwf	(main@c)
	line	39
	
l1421:	
;CCP LCD &  Button.c: 39: d=b/10;
	movlw	0Ah
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	movf	(main@b+1),w
	movwf	1+(?___lwdiv)+02h
	movf	(main@b),w
	movwf	0+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	movwf	(main@d+1)
	movf	(0+(?___lwdiv)),w
	movwf	(main@d)
	line	40
	
l1423:	
;CCP LCD &  Button.c: 40: e=d%10;
	movlw	0Ah
	movwf	(?___lwmod)
	clrf	(?___lwmod+1)
	movf	(main@d+1),w
	movwf	1+(?___lwmod)+02h
	movf	(main@d),w
	movwf	0+(?___lwmod)+02h
	fcall	___lwmod
	movf	(1+(?___lwmod)),w
	movwf	(main@e+1)
	movf	(0+(?___lwmod)),w
	movwf	(main@e)
	line	41
	
l1425:	
;CCP LCD &  Button.c: 41: f=d/10;
	movlw	0Ah
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	movf	(main@d+1),w
	movwf	1+(?___lwdiv)+02h
	movf	(main@d),w
	movwf	0+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	movwf	(main@f+1)
	movf	(0+(?___lwdiv)),w
	movwf	(main@f)
	line	42
	
l1427:	
;CCP LCD &  Button.c: 42: g=f%10;
	movlw	0Ah
	movwf	(?___lwmod)
	clrf	(?___lwmod+1)
	movf	(main@f+1),w
	movwf	1+(?___lwmod)+02h
	movf	(main@f),w
	movwf	0+(?___lwmod)+02h
	fcall	___lwmod
	movf	(1+(?___lwmod)),w
	movwf	(main@g+1)
	movf	(0+(?___lwmod)),w
	movwf	(main@g)
	line	43
	
l1429:	
;CCP LCD &  Button.c: 43: h=f/10;
	movlw	0Ah
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	movf	(main@f+1),w
	movwf	1+(?___lwdiv)+02h
	movf	(main@f),w
	movwf	0+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	movwf	(main@h+1)
	movf	(0+(?___lwdiv)),w
	movwf	(main@h)
	line	45
	
l1431:	
;CCP LCD &  Button.c: 45: lcd_data(h+0x30);
	movf	(main@h),w
	addlw	030h
	fcall	_lcd_data
	line	46
	
l1433:	
;CCP LCD &  Button.c: 46: lcd_data(g+0x30);
	movf	(main@g),w
	addlw	030h
	fcall	_lcd_data
	line	47
	
l1435:	
;CCP LCD &  Button.c: 47: lcd_data(e+0x30);
	movf	(main@e),w
	addlw	030h
	fcall	_lcd_data
	line	48
	
l1437:	
;CCP LCD &  Button.c: 48: lcd_data(c+0x30);
	movf	(main@c),w
	addlw	030h
	fcall	_lcd_data
	line	49
	
l1439:	
;CCP LCD &  Button.c: 49: lcd_data(a+0x30);
	movf	(main@a),w
	addlw	030h
	fcall	_lcd_data
	goto	l1409
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

psect	maintext
	line	55
	signat	_main,88
	global	_lcd_initialize
psect	text151,local,class=CODE,delta=2
global __ptext151
__ptext151:

;; *************** function _lcd_initialize *****************
;; Defined at:
;;		line 47 in file "C:\Users\Admin\Desktop\PIC\PIC course\CCP Lcd & button\LCD 4 Bit.h"
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
psect	text151
	file	"C:\Users\Admin\Desktop\PIC\PIC course\CCP Lcd & button\LCD 4 Bit.h"
	line	47
	global	__size_of_lcd_initialize
	__size_of_lcd_initialize	equ	__end_of_lcd_initialize-_lcd_initialize
	
_lcd_initialize:	
	opt	stack 2
; Regs used in _lcd_initialize: [wreg+status,2+status,0+pclath+cstack]
	line	48
	
l1377:	
;LCD 4 Bit.h: 48: lcd_command(0x02);
	movlw	(02h)
	fcall	_lcd_command
	line	49
;LCD 4 Bit.h: 49: lcd_command(0x2C);
	movlw	(02Ch)
	fcall	_lcd_command
	line	50
;LCD 4 Bit.h: 50: lcd_command(0x06);
	movlw	(06h)
	fcall	_lcd_command
	line	51
;LCD 4 Bit.h: 51: lcd_command(0x0c);
	movlw	(0Ch)
	fcall	_lcd_command
	line	52
;LCD 4 Bit.h: 52: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	53
;LCD 4 Bit.h: 53: lcd_command(0x80);
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
psect	text152,local,class=CODE,delta=2
global __ptext152
__ptext152:

;; *************** function _display *****************
;; Defined at:
;;		line 56 in file "C:\Users\Admin\Desktop\PIC\PIC course\CCP Lcd & button\LCD 4 Bit.h"
;; Parameters:    Size  Location     Type
;;  word            1    wreg     PTR const unsigned char 
;;		 -> STR_1(4), STR_2(17), 
;;  len             1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  word            1    5[COMMON] PTR const unsigned char 
;;		 -> STR_1(4), STR_2(17), 
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
psect	text152
	file	"C:\Users\Admin\Desktop\PIC\PIC course\CCP Lcd & button\LCD 4 Bit.h"
	line	56
	global	__size_of_display
	__size_of_display	equ	__end_of_display-_display
	
_display:	
	opt	stack 2
; Regs used in _display: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;display@word stored from wreg
	line	58
	movwf	(display@word)
	
l1379:	
;LCD 4 Bit.h: 57: unsigned char a;
;LCD 4 Bit.h: 58: for(a=0;a<=len;a++)
	clrf	(display@a)
	goto	l1385
	line	60
	
l1381:	
;LCD 4 Bit.h: 59: {
;LCD 4 Bit.h: 60: lcd_data(word[a]);
	movf	(display@a),w
	addwf	(display@word),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	line	58
	
l1383:	
	incf	(display@a),f
	
l1385:	
	movf	(display@a),w
	subwf	(display@len),w
	skipnc
	goto	u231
	goto	u230
u231:
	goto	l1381
u230:
	line	63
	
l577:	
	return
	opt stack 0
GLOBAL	__end_of_display
	__end_of_display:
;; =============== function _display ends ============

	signat	_display,8312
	global	_lcd_command
psect	text153,local,class=CODE,delta=2
global __ptext153
__ptext153:

;; *************** function _lcd_command *****************
;; Defined at:
;;		line 10 in file "C:\Users\Admin\Desktop\PIC\PIC course\CCP Lcd & button\LCD 4 Bit.h"
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
;;		_lcd_initialize
;;		_main
;; This function uses a non-reentrant model
;;
psect	text153
	file	"C:\Users\Admin\Desktop\PIC\PIC course\CCP Lcd & button\LCD 4 Bit.h"
	line	10
	global	__size_of_lcd_command
	__size_of_lcd_command	equ	__end_of_lcd_command-_lcd_command
	
_lcd_command:	
	opt	stack 1
; Regs used in _lcd_command: [wreg+status,2+status,0+pclath+cstack]
;lcd_command@command stored from wreg
	line	12
	movwf	(lcd_command@command)
	
l1351:	
;LCD 4 Bit.h: 11: unsigned char temp;
;LCD 4 Bit.h: 12: PORTD=command&0xF0;
	movf	(lcd_command@command),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	13
	
l1353:	
;LCD 4 Bit.h: 13: RD0=0;
	bcf	(64/8),(64)&7
	line	14
	
l1355:	
;LCD 4 Bit.h: 14: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	15
	
l1357:	
;LCD 4 Bit.h: 15: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(65/8),(65)&7
	line	16
	
l1359:	
;LCD 4 Bit.h: 16: delay(200);
	movlw	0C8h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	17
	
l1361:	
;LCD 4 Bit.h: 17: RD1=0;
	bcf	(65/8),(65)&7
	line	18
	
l1363:	
;LCD 4 Bit.h: 18: temp=command<<4;
	swapf	(lcd_command@command),w
	andlw	(0ffh shl 4) & 0ffh
	movwf	(lcd_command@temp)
	line	19
	
l1365:	
;LCD 4 Bit.h: 19: PORTD=temp&0xF0;
	movf	(lcd_command@temp),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	20
	
l1367:	
;LCD 4 Bit.h: 20: RD0=0;
	bcf	(64/8),(64)&7
	line	21
	
l1369:	
;LCD 4 Bit.h: 21: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	22
	
l1371:	
;LCD 4 Bit.h: 22: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(65/8),(65)&7
	line	23
	
l1373:	
;LCD 4 Bit.h: 23: delay(200);
	movlw	0C8h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	24
	
l1375:	
;LCD 4 Bit.h: 24: RD1=0;
	bcf	(65/8),(65)&7
	line	26
	
l565:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_command
	__end_of_lcd_command:
;; =============== function _lcd_command ends ============

	signat	_lcd_command,4216
	global	_lcd_data
psect	text154,local,class=CODE,delta=2
global __ptext154
__ptext154:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 28 in file "C:\Users\Admin\Desktop\PIC\PIC course\CCP Lcd & button\LCD 4 Bit.h"
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
psect	text154
	file	"C:\Users\Admin\Desktop\PIC\PIC course\CCP Lcd & button\LCD 4 Bit.h"
	line	28
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 1
; Regs used in _lcd_data: [wreg+status,2+status,0+pclath+cstack]
;lcd_data@data stored from wreg
	line	30
	movwf	(lcd_data@data)
	
l1325:	
;LCD 4 Bit.h: 29: unsigned char temp1;
;LCD 4 Bit.h: 30: PORTD=data&0xF0;
	movf	(lcd_data@data),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	31
	
l1327:	
;LCD 4 Bit.h: 31: RD0=1;
	bsf	(64/8),(64)&7
	line	32
	
l1329:	
;LCD 4 Bit.h: 32: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	33
	
l1331:	
;LCD 4 Bit.h: 33: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(65/8),(65)&7
	line	34
	
l1333:	
;LCD 4 Bit.h: 34: delay(200);
	movlw	0C8h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	35
	
l1335:	
;LCD 4 Bit.h: 35: RD1=0;
	bcf	(65/8),(65)&7
	line	36
	
l1337:	
;LCD 4 Bit.h: 36: temp1=data<<4;
	swapf	(lcd_data@data),w
	andlw	(0ffh shl 4) & 0ffh
	movwf	(lcd_data@temp1)
	line	37
	
l1339:	
;LCD 4 Bit.h: 37: PORTD=temp1&0xF0;
	movf	(lcd_data@temp1),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	38
	
l1341:	
;LCD 4 Bit.h: 38: RD0=1;
	bsf	(64/8),(64)&7
	line	39
	
l1343:	
;LCD 4 Bit.h: 39: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	40
	
l1345:	
;LCD 4 Bit.h: 40: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(65/8),(65)&7
	line	41
	
l1347:	
;LCD 4 Bit.h: 41: delay(200);
	movlw	0C8h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	42
	
l1349:	
;LCD 4 Bit.h: 42: RD1=0;
	bcf	(65/8),(65)&7
	line	45
	
l568:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
	global	___lwdiv
psect	text155,local,class=CODE,delta=2
global __ptext155
__ptext155:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    4[COMMON] unsigned int 
;;  counter         1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text155
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 0
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l1287:	
;lwdiv.c: 6: unsigned int quotient;
;lwdiv.c: 7: unsigned char counter;
;lwdiv.c: 9: quotient = 0;
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l1289:	
;lwdiv.c: 10: if(divisor != 0) {
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u171
	goto	u170
u171:
	goto	l1309
u170:
	line	11
	
l1291:	
;lwdiv.c: 11: counter = 1;
	clrf	(___lwdiv@counter)
	incf	(___lwdiv@counter),f
	line	12
;lwdiv.c: 12: while((divisor & 0x8000) == 0) {
	goto	l1295
	line	13
	
l1293:	
;lwdiv.c: 13: divisor <<= 1;
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	line	14
;lwdiv.c: 14: counter++;
	incf	(___lwdiv@counter),f
	line	12
	
l1295:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u181
	goto	u180
u181:
	goto	l1293
u180:
	line	17
	
l1297:	
;lwdiv.c: 17: quotient <<= 1;
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	line	18
	
l1299:	
;lwdiv.c: 18: if(divisor <= dividend) {
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u195
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u195:
	skipc
	goto	u191
	goto	u190
u191:
	goto	l1305
u190:
	line	19
	
l1301:	
;lwdiv.c: 19: dividend -= divisor;
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l1303:	
;lwdiv.c: 20: quotient |= 1;
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	22
	
l1305:	
;lwdiv.c: 21: }
;lwdiv.c: 22: divisor >>= 1;
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	line	23
	
l1307:	
;lwdiv.c: 23: } while(--counter != 0);
	decfsz	(___lwdiv@counter),f
	goto	u201
	goto	u200
u201:
	goto	l1297
u200:
	line	25
	
l1309:	
;lwdiv.c: 24: }
;lwdiv.c: 25: return quotient;
	movf	(___lwdiv@quotient+1),w
	movwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	movwf	(?___lwdiv)
	line	26
	
l614:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	___lwmod
psect	text156,local,class=CODE,delta=2
global __ptext156
__ptext156:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text156
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 0
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l1267:	
;lwmod.c: 6: unsigned char counter;
;lwmod.c: 8: if(divisor != 0) {
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u131
	goto	u130
u131:
	goto	l1283
u130:
	line	9
	
l1269:	
;lwmod.c: 9: counter = 1;
	clrf	(___lwmod@counter)
	incf	(___lwmod@counter),f
	line	10
;lwmod.c: 10: while((divisor & 0x8000) == 0) {
	goto	l1273
	line	11
	
l1271:	
;lwmod.c: 11: divisor <<= 1;
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	line	12
;lwmod.c: 12: counter++;
	incf	(___lwmod@counter),f
	line	10
	
l1273:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u141
	goto	u140
u141:
	goto	l1271
u140:
	line	15
	
l1275:	
;lwmod.c: 15: if(divisor <= dividend)
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u155
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u155:
	skipc
	goto	u151
	goto	u150
u151:
	goto	l1279
u150:
	line	16
	
l1277:	
;lwmod.c: 16: dividend -= divisor;
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	line	17
	
l1279:	
;lwmod.c: 17: divisor >>= 1;
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	line	18
	
l1281:	
;lwmod.c: 18: } while(--counter != 0);
	decfsz	(___lwmod@counter),f
	goto	u161
	goto	u160
u161:
	goto	l1275
u160:
	line	20
	
l1283:	
;lwmod.c: 19: }
;lwmod.c: 20: return dividend;
	movf	(___lwmod@dividend+1),w
	movwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	movwf	(?___lwmod)
	line	21
	
l624:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	_t1_delay
psect	text157,local,class=CODE,delta=2
global __ptext157
__ptext157:

;; *************** function _t1_delay *****************
;; Defined at:
;;		line 5 in file "C:\Users\Admin\Desktop\PIC\PIC course\CCP Lcd & button\CCP LCD &  Button.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text157
	file	"C:\Users\Admin\Desktop\PIC\PIC course\CCP Lcd & button\CCP LCD &  Button.c"
	line	5
	global	__size_of_t1_delay
	__size_of_t1_delay	equ	__end_of_t1_delay-_t1_delay
	
_t1_delay:	
	opt	stack 0
; Regs used in _t1_delay: [wreg+status,2]
	line	6
	
l1317:	
;CCP LCD &  Button.c: 6: T1CON=0x38;
	movlw	(038h)
	movwf	(16)	;volatile
	line	7
	
l1319:	
;CCP LCD &  Button.c: 7: TMR1H=0X00;
	clrf	(15)	;volatile
	line	8
	
l1321:	
;CCP LCD &  Button.c: 8: TMR1L=0X00;
	clrf	(14)	;volatile
	line	9
	
l1323:	
;CCP LCD &  Button.c: 9: TMR1ON=1;
	bsf	(128/8),(128)&7
	line	10
;CCP LCD &  Button.c: 10: while(TMR1IF==0);
	
l580:	
	btfss	(96/8),(96)&7
	goto	u221
	goto	u220
u221:
	goto	l580
u220:
	
l582:	
	line	11
;CCP LCD &  Button.c: 11: TMR1IF=0;
	bcf	(96/8),(96)&7
	line	12
	
l583:	
	return
	opt stack 0
GLOBAL	__end_of_t1_delay
	__end_of_t1_delay:
;; =============== function _t1_delay ends ============

	signat	_t1_delay,88
	global	_delay
psect	text158,local,class=CODE,delta=2
global __ptext158
__ptext158:

;; *************** function _delay *****************
;; Defined at:
;;		line 5 in file "C:\Users\Admin\Desktop\PIC\PIC course\CCP Lcd & button\LCD 4 Bit.h"
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
psect	text158
	file	"C:\Users\Admin\Desktop\PIC\PIC course\CCP Lcd & button\LCD 4 Bit.h"
	line	5
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 0
; Regs used in _delay: [wreg]
	line	6
	
l1313:	
;LCD 4 Bit.h: 6: while(a--);
	
l1315:	
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
	goto	u211
	goto	u210
u211:
	goto	l1315
u210:
	line	7
	
l562:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
psect	text159,local,class=CODE,delta=2
global __ptext159
__ptext159:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
