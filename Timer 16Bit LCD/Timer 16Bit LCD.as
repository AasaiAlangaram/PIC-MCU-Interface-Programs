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
	FNCALL	_main,_delay
	FNCALL	_main,_Timer1_Delay
	FNCALL	_main,_lcd_command
	FNCALL	_main,_display
	FNCALL	_main,___awmod
	FNCALL	_main,___awdiv
	FNCALL	_main,_lcd_data
	FNCALL	_display,_lcd_data
	FNCALL	_lcd_initialize,_lcd_command
	FNCALL	_lcd_data,_delay
	FNCALL	_lcd_command,_delay
	FNROOT	_main
	global	_PORTC
psect	text159,local,class=CODE,delta=2
global __ptext159
__ptext159:
_PORTC	set	7
	global	_PORTD
_PORTD	set	8
	global	_T1CON
_T1CON	set	16
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_RD0
_RD0	set	64
	global	_RD1
_RD1	set	65
	global	_TMR1IF
_TMR1IF	set	96
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
	
STR_1:	
	retlw	72	;'H'
	retlw	0
psect	strings
	
STR_2:	
	retlw	77	;'M'
	retlw	0
psect	strings
	
STR_3:	
	retlw	83	;'S'
	retlw	0
psect	strings
	file	"Timer 16Bit LCD.as"
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
	global	?_Timer1_Delay
?_Timer1_Delay:	; 0 bytes @ 0x0
	global	?_lcd_command
?_lcd_command:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	??_Timer1_Delay
??_Timer1_Delay:	; 0 bytes @ 0x0
	global	?_lcd_initialize
?_lcd_initialize:	; 0 bytes @ 0x0
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	?_lcd_data
?_lcd_data:	; 0 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	delay@a
delay@a:	; 2 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	ds	2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	??_lcd_command
??_lcd_command:	; 0 bytes @ 0x2
	global	??_lcd_data
??_lcd_data:	; 0 bytes @ 0x2
	global	lcd_data@temp1
lcd_data@temp1:	; 1 bytes @ 0x2
	global	lcd_command@temp
lcd_command@temp:	; 1 bytes @ 0x2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x2
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
	ds	1
	global	lcd_command@command
lcd_command@command:	; 1 bytes @ 0x3
	global	lcd_data@data
lcd_data@data:	; 1 bytes @ 0x3
	ds	1
	global	??_lcd_initialize
??_lcd_initialize:	; 0 bytes @ 0x4
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	global	?_display
?_display:	; 0 bytes @ 0x4
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x4
	global	display@len
display@len:	; 1 bytes @ 0x4
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x4
	ds	1
	global	??_display
??_display:	; 0 bytes @ 0x5
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x5
	global	display@word
display@word:	; 1 bytes @ 0x5
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x5
	ds	1
	global	display@a
display@a:	; 1 bytes @ 0x6
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x6
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x8
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	main@d
main@d:	; 1 bytes @ 0x0
	ds	1
	global	main@q
main@q:	; 1 bytes @ 0x1
	ds	1
	global	main@w
main@w:	; 1 bytes @ 0x2
	ds	1
	global	main@a
main@a:	; 1 bytes @ 0x3
	ds	1
	global	main@b
main@b:	; 1 bytes @ 0x4
	ds	1
	global	main@c
main@c:	; 1 bytes @ 0x5
	ds	1
	global	main@j
main@j:	; 2 bytes @ 0x6
	ds	2
	global	main@i
main@i:	; 2 bytes @ 0x8
	ds	2
	global	main@s
main@s:	; 2 bytes @ 0xA
	ds	2
;;Data sizes: Strings 6, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      8       8
;; BANK0           80     12      12
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___awdiv	int  size(1) Largest target is 0
;;
;; ?___awmod	int  size(1) Largest target is 0
;;
;; display@word	PTR const unsigned char  size(1) Largest target is 2
;;		 -> STR_1(CODE[2]), STR_2(CODE[2]), STR_3(CODE[2]), 
;;


;; COMMON:	_main->___awdiv
;; COMMON:	_display->_lcd_data
;; COMMON:	_lcd_initialize->_lcd_command
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
;; (2) _main                                                13    13      0    1472
;;                                              0 BANK0     12    12      0
;;                     _lcd_initialize
;;                              _delay
;;                       _Timer1_Delay
;;                        _lcd_command
;;                            _display
;;                            ___awmod
;;                            ___awdiv
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _display                                              3     2      1     179
;;                                              4 COMMON     3     2      1
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_initialize                                       0     0      0      89
;;                        _lcd_command
;; ---------------------------------------------------------------------------------
;; (0) _lcd_data                                             2     2      0      89
;;                                              2 COMMON     2     2      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (0) _lcd_command                                          2     2      0      89
;;                                              2 COMMON     2     2      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (4294967295) ___awdiv                                     8     4      4     300
;;                                              0 COMMON     8     4      4
;; ---------------------------------------------------------------------------------
;; (4294967295) ___awmod                                     6     2      4     296
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (4294967295) _Timer1_Delay                                0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4294967295) _delay                                       2     0      2      22
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
;;COMMON               E      8       8       1       57.1%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;BITBANK0            50      0       0       3        0.0%
;;BANK0               50      C       C       4       15.0%
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
;;		line 13 in file "C:\Users\Admin\Desktop\PIC\PIC course\Timer 16Bit LCD\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               2    6[BANK0 ] int 
;;  i               2    8[BANK0 ] int 
;;  s               2   10[BANK0 ] int 
;;  w               1    2[BANK0 ] unsigned char 
;;  q               1    1[BANK0 ] unsigned char 
;;  d               1    0[BANK0 ] unsigned char 
;;  c               1    5[BANK0 ] unsigned char 
;;  b               1    4[BANK0 ] unsigned char 
;;  a               1    3[BANK0 ] unsigned char 
;;  temp            1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0      12       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0      12       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_initialize
;;		_delay
;;		_Timer1_Delay
;;		_lcd_command
;;		_display
;;		___awmod
;;		___awdiv
;;		_lcd_data
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Admin\Desktop\PIC\PIC course\Timer 16Bit LCD\main.c"
	line	13
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2-btemp+0+pclath+cstack]
	line	15
	
l1466:	
;main.c: 14: unsigned char temp,a,b,c,d,q,w;
;main.c: 15: TRISD=0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(136)^080h	;volatile
	line	16
;main.c: 16: PORTD=0x00;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(8)	;volatile
	line	17
;main.c: 17: TRISC=0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(135)^080h	;volatile
	line	18
;main.c: 18: PORTC=0x00;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(7)	;volatile
	line	21
	
l1468:	
;main.c: 21: lcd_initialize();
	fcall	_lcd_initialize
	line	23
	
l1470:	
;main.c: 23: delay(10000);
	movlw	low(02710h)
	movwf	(?_delay)
	movlw	high(02710h)
	movwf	((?_delay))+1
	fcall	_delay
	line	26
	
l1472:	
;main.c: 26: {PORTC=0xff;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	27
	
l1474:	
;main.c: 27: Timer1_Delay();
	fcall	_Timer1_Delay
	line	28
	
l1476:	
;main.c: 28: PORTC=0x00;
	clrf	(7)	;volatile
	line	29
	
l1478:	
;main.c: 29: Timer1_Delay();
	fcall	_Timer1_Delay
	line	31
	
l1480:	
;main.c: 31: for(int s=0;s<60;s++)
	clrf	(main@s)
	clrf	(main@s+1)
	line	33
	
l1486:	
;main.c: 32: {
;main.c: 33: lcd_command(0x80);
	movlw	(080h)
	fcall	_lcd_command
	line	34
	
l1488:	
;main.c: 34: display("H",1);
	clrf	(?_display)
	incf	(?_display),f
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_display
	line	35
	
l1490:	
;main.c: 35: lcd_command(0xC0);
	movlw	(0C0h)
	fcall	_lcd_command
	line	36
	
l1492:	
;main.c: 36: w=s%10;
	movlw	0Ah
	movwf	(?___awmod)
	clrf	(?___awmod+1)
	movf	(main@s+1),w
	movwf	1+(?___awmod)+02h
	movf	(main@s),w
	movwf	0+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	movwf	(main@w)
	line	37
	
l1494:	
;main.c: 37: q=s/10;
	movlw	0Ah
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(main@s+1),w
	movwf	1+(?___awdiv)+02h
	movf	(main@s),w
	movwf	0+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	movwf	(main@q)
	line	39
	
l1496:	
;main.c: 39: lcd_data(q+0x30);
	movf	(main@q),w
	addlw	030h
	fcall	_lcd_data
	line	40
	
l1498:	
;main.c: 40: lcd_data(w+0x30);
	movf	(main@w),w
	addlw	030h
	fcall	_lcd_data
	line	41
	
l1500:	
;main.c: 41: for(int i=0;i<60;i++)
	clrf	(main@i)
	clrf	(main@i+1)
	line	43
	
l1506:	
;main.c: 42: {
;main.c: 43: lcd_command(0x83);
	movlw	(083h)
	fcall	_lcd_command
	line	44
	
l1508:	
;main.c: 44: display("M",1);
	clrf	(?_display)
	incf	(?_display),f
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_display
	line	45
	
l1510:	
;main.c: 45: lcd_command(0xC3);
	movlw	(0C3h)
	fcall	_lcd_command
	line	47
	
l1512:	
;main.c: 47: a=i%10;
	movlw	0Ah
	movwf	(?___awmod)
	clrf	(?___awmod+1)
	movf	(main@i+1),w
	movwf	1+(?___awmod)+02h
	movf	(main@i),w
	movwf	0+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	movwf	(main@a)
	line	48
	
l1514:	
;main.c: 48: b=i/10;
	movlw	0Ah
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(main@i+1),w
	movwf	1+(?___awdiv)+02h
	movf	(main@i),w
	movwf	0+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	movwf	(main@b)
	line	50
	
l1516:	
;main.c: 50: lcd_data(b+0x30);
	movf	(main@b),w
	addlw	030h
	fcall	_lcd_data
	line	51
	
l1518:	
;main.c: 51: lcd_data(a+0x30);
	movf	(main@a),w
	addlw	030h
	fcall	_lcd_data
	line	56
	
l1520:	
;main.c: 56: for(int j=0;j<60;j++)
	clrf	(main@j)
	clrf	(main@j+1)
	line	58
	
l1526:	
;main.c: 57: {
;main.c: 58: lcd_command(0x86);
	movlw	(086h)
	fcall	_lcd_command
	line	59
	
l1528:	
;main.c: 59: display("S",1);
	clrf	(?_display)
	incf	(?_display),f
	movlw	((STR_3-__stringbase))&0ffh
	fcall	_display
	line	60
	
l1530:	
;main.c: 60: lcd_command(0xC6);
	movlw	(0C6h)
	fcall	_lcd_command
	line	62
	
l1532:	
;main.c: 62: c=j%10;
	movlw	0Ah
	movwf	(?___awmod)
	clrf	(?___awmod+1)
	movf	(main@j+1),w
	movwf	1+(?___awmod)+02h
	movf	(main@j),w
	movwf	0+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	movwf	(main@c)
	line	63
	
l1534:	
;main.c: 63: d=j/10;
	movlw	0Ah
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(main@j+1),w
	movwf	1+(?___awdiv)+02h
	movf	(main@j),w
	movwf	0+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	movwf	(main@d)
	line	65
	
l1536:	
;main.c: 65: lcd_data(d+0x30);
	movf	(main@d),w
	addlw	030h
	fcall	_lcd_data
	line	66
	
l1538:	
;main.c: 66: lcd_data(c+0x30);
	movf	(main@c),w
	addlw	030h
	fcall	_lcd_data
	line	67
	
l1540:	
;main.c: 67: Timer1_Delay();
	fcall	_Timer1_Delay
	line	68
	
l1542:	
;main.c: 68: Timer1_Delay();
	fcall	_Timer1_Delay
	line	56
	
l1544:	
	incf	(main@j),f
	skipnz
	incf	(main@j+1),f
	
l1546:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(03Ch))^80h
	subwf	btemp+0,w
	skipz
	goto	u385
	movlw	low(03Ch)
	subwf	(main@j),w
u385:

	skipc
	goto	u381
	goto	u380
u381:
	goto	l1526
u380:
	line	41
	
l1548:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(main@i),f
	skipnz
	incf	(main@i+1),f
	
l1550:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(03Ch))^80h
	subwf	btemp+0,w
	skipz
	goto	u395
	movlw	low(03Ch)
	subwf	(main@i),w
u395:

	skipc
	goto	u391
	goto	u390
u391:
	goto	l1506
u390:
	line	31
	
l1552:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(main@s),f
	skipnz
	incf	(main@s+1),f
	
l1554:	
	movf	(main@s+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(03Ch))^80h
	subwf	btemp+0,w
	skipz
	goto	u405
	movlw	low(03Ch)
	subwf	(main@s),w
u405:

	skipc
	goto	u401
	goto	u400
u401:
	goto	l1486
u400:
	goto	l1472
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

psect	maintext
	line	75
	signat	_main,88
	global	_display
psect	text160,local,class=CODE,delta=2
global __ptext160
__ptext160:

;; *************** function _display *****************
;; Defined at:
;;		line 56 in file "C:\Users\Admin\Desktop\PIC\PIC course\Timer 16Bit LCD\LCD 4 BIT.h"
;; Parameters:    Size  Location     Type
;;  word            1    wreg     PTR const unsigned char 
;;		 -> STR_1(2), STR_2(2), STR_3(2), 
;;  len             1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  word            1    5[COMMON] PTR const unsigned char 
;;		 -> STR_1(2), STR_2(2), STR_3(2), 
;;  a               1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
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
psect	text160
	file	"C:\Users\Admin\Desktop\PIC\PIC course\Timer 16Bit LCD\LCD 4 BIT.h"
	line	56
	global	__size_of_display
	__size_of_display	equ	__end_of_display-_display
	
_display:	
	opt	stack 2
; Regs used in _display: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;display@word stored from wreg
	line	58
	movwf	(display@word)
	
l1456:	
;LCD 4 BIT.h: 57: unsigned char a;
;LCD 4 BIT.h: 58: for(a=0;a<=len;a++)
	clrf	(display@a)
	goto	l1462
	line	60
	
l1458:	
;LCD 4 BIT.h: 59: {
;LCD 4 BIT.h: 60: lcd_data(word[a]);
	movf	(display@a),w
	addwf	(display@word),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	line	58
	
l1460:	
	incf	(display@a),f
	
l1462:	
	movf	(display@a),w
	subwf	(display@len),w
	skipnc
	goto	u371
	goto	u370
u371:
	goto	l1458
u370:
	line	63
	
l577:	
	return
	opt stack 0
GLOBAL	__end_of_display
	__end_of_display:
;; =============== function _display ends ============

	signat	_display,8312
	global	_lcd_initialize
psect	text161,local,class=CODE,delta=2
global __ptext161
__ptext161:

;; *************** function _lcd_initialize *****************
;; Defined at:
;;		line 47 in file "C:\Users\Admin\Desktop\PIC\PIC course\Timer 16Bit LCD\LCD 4 BIT.h"
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
psect	text161
	file	"C:\Users\Admin\Desktop\PIC\PIC course\Timer 16Bit LCD\LCD 4 BIT.h"
	line	47
	global	__size_of_lcd_initialize
	__size_of_lcd_initialize	equ	__end_of_lcd_initialize-_lcd_initialize
	
_lcd_initialize:	
	opt	stack 2
; Regs used in _lcd_initialize: [wreg+status,2+status,0+pclath+cstack]
	line	48
	
l1464:	
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
	global	_lcd_data
psect	text162,local,class=CODE,delta=2
global __ptext162
__ptext162:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 28 in file "C:\Users\Admin\Desktop\PIC\PIC course\Timer 16Bit LCD\LCD 4 BIT.h"
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
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
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
psect	text162
	file	"C:\Users\Admin\Desktop\PIC\PIC course\Timer 16Bit LCD\LCD 4 BIT.h"
	line	28
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 1
; Regs used in _lcd_data: [wreg+status,2+status,0+pclath+cstack]
;lcd_data@data stored from wreg
	line	30
	movwf	(lcd_data@data)
	
l1430:	
;LCD 4 BIT.h: 29: unsigned char temp1;
;LCD 4 BIT.h: 30: PORTD=data&0xF0;
	movf	(lcd_data@data),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	31
	
l1432:	
;LCD 4 BIT.h: 31: RD0=1;
	bsf	(64/8),(64)&7
	line	32
	
l1434:	
;LCD 4 BIT.h: 32: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	33
	
l1436:	
;LCD 4 BIT.h: 33: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(65/8),(65)&7
	line	34
	
l1438:	
;LCD 4 BIT.h: 34: delay(200);
	movlw	0C8h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	35
	
l1440:	
;LCD 4 BIT.h: 35: RD1=0;
	bcf	(65/8),(65)&7
	line	36
	
l1442:	
;LCD 4 BIT.h: 36: temp1=data<<4;
	swapf	(lcd_data@data),w
	andlw	(0ffh shl 4) & 0ffh
	movwf	(lcd_data@temp1)
	line	37
	
l1444:	
;LCD 4 BIT.h: 37: PORTD=temp1&0xF0;
	movf	(lcd_data@temp1),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	38
	
l1446:	
;LCD 4 BIT.h: 38: RD0=1;
	bsf	(64/8),(64)&7
	line	39
	
l1448:	
;LCD 4 BIT.h: 39: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	40
	
l1450:	
;LCD 4 BIT.h: 40: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(65/8),(65)&7
	line	41
	
l1452:	
;LCD 4 BIT.h: 41: delay(200);
	movlw	0C8h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	42
	
l1454:	
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
psect	text163,local,class=CODE,delta=2
global __ptext163
__ptext163:

;; *************** function _lcd_command *****************
;; Defined at:
;;		line 10 in file "C:\Users\Admin\Desktop\PIC\PIC course\Timer 16Bit LCD\LCD 4 BIT.h"
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
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
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
psect	text163
	file	"C:\Users\Admin\Desktop\PIC\PIC course\Timer 16Bit LCD\LCD 4 BIT.h"
	line	10
	global	__size_of_lcd_command
	__size_of_lcd_command	equ	__end_of_lcd_command-_lcd_command
	
_lcd_command:	
	opt	stack 1
; Regs used in _lcd_command: [wreg+status,2+status,0+pclath+cstack]
;lcd_command@command stored from wreg
	line	12
	movwf	(lcd_command@command)
	
l1404:	
;LCD 4 BIT.h: 11: unsigned char temp;
;LCD 4 BIT.h: 12: PORTD=command&0xF0;
	movf	(lcd_command@command),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	13
	
l1406:	
;LCD 4 BIT.h: 13: RD0=0;
	bcf	(64/8),(64)&7
	line	14
	
l1408:	
;LCD 4 BIT.h: 14: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	15
	
l1410:	
;LCD 4 BIT.h: 15: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(65/8),(65)&7
	line	16
	
l1412:	
;LCD 4 BIT.h: 16: delay(200);
	movlw	0C8h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	17
	
l1414:	
;LCD 4 BIT.h: 17: RD1=0;
	bcf	(65/8),(65)&7
	line	18
	
l1416:	
;LCD 4 BIT.h: 18: temp=command<<4;
	swapf	(lcd_command@command),w
	andlw	(0ffh shl 4) & 0ffh
	movwf	(lcd_command@temp)
	line	19
	
l1418:	
;LCD 4 BIT.h: 19: PORTD=temp&0xF0;
	movf	(lcd_command@temp),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	20
	
l1420:	
;LCD 4 BIT.h: 20: RD0=0;
	bcf	(64/8),(64)&7
	line	21
	
l1422:	
;LCD 4 BIT.h: 21: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	22
	
l1424:	
;LCD 4 BIT.h: 22: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(65/8),(65)&7
	line	23
	
l1426:	
;LCD 4 BIT.h: 23: delay(200);
	movlw	0C8h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	24
	
l1428:	
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
	global	___awdiv
psect	text164,local,class=CODE,delta=2
global __ptext164
__ptext164:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    6[COMMON] int 
;;  sign            1    5[COMMON] unsigned char 
;;  counter         1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text164
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 0
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l1346:	
;awdiv.c: 6: signed int quotient;
;awdiv.c: 7: unsigned char counter, sign;
;awdiv.c: 9: sign = 0;
	clrf	(___awdiv@sign)
	line	10
	
l1348:	
;awdiv.c: 10: if(divisor < 0) {
	btfss	(___awdiv@divisor+1),7
	goto	u281
	goto	u280
u281:
	goto	l1354
u280:
	line	11
	
l1350:	
;awdiv.c: 11: divisor = -divisor;
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	
l1352:	
;awdiv.c: 12: sign = 1;
	clrf	(___awdiv@sign)
	incf	(___awdiv@sign),f
	line	14
	
l1354:	
;awdiv.c: 13: }
;awdiv.c: 14: if(dividend < 0) {
	btfss	(___awdiv@dividend+1),7
	goto	u291
	goto	u290
u291:
	goto	l1360
u290:
	line	15
	
l1356:	
;awdiv.c: 15: dividend = -dividend;
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l1358:	
;awdiv.c: 16: sign ^= 1;
	movlw	(01h)
	xorwf	(___awdiv@sign),f
	line	18
	
l1360:	
;awdiv.c: 17: }
;awdiv.c: 18: quotient = 0;
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l1362:	
;awdiv.c: 19: if(divisor != 0) {
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u301
	goto	u300
u301:
	goto	l1382
u300:
	line	20
	
l1364:	
;awdiv.c: 20: counter = 1;
	clrf	(___awdiv@counter)
	incf	(___awdiv@counter),f
	line	21
;awdiv.c: 21: while((divisor & 0x8000U) == 0) {
	goto	l1368
	line	22
	
l1366:	
;awdiv.c: 22: divisor <<= 1;
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	line	23
;awdiv.c: 23: counter++;
	incf	(___awdiv@counter),f
	line	21
	
l1368:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u311
	goto	u310
u311:
	goto	l1366
u310:
	line	26
	
l1370:	
;awdiv.c: 26: quotient <<= 1;
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	line	27
	
l1372:	
;awdiv.c: 27: if((unsigned int)divisor <= (unsigned int)dividend) {
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u325
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u325:
	skipc
	goto	u321
	goto	u320
u321:
	goto	l1378
u320:
	line	28
	
l1374:	
;awdiv.c: 28: dividend -= divisor;
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l1376:	
;awdiv.c: 29: quotient |= 1;
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	line	31
	
l1378:	
;awdiv.c: 30: }
;awdiv.c: 31: *(unsigned int *)&divisor >>= 1;
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	line	32
	
l1380:	
;awdiv.c: 32: } while(--counter != 0);
	decfsz	(___awdiv@counter),f
	goto	u331
	goto	u330
u331:
	goto	l1370
u330:
	line	34
	
l1382:	
;awdiv.c: 33: }
;awdiv.c: 34: if(sign)
	movf	(___awdiv@sign),w
	skipz
	goto	u340
	goto	l1386
u340:
	line	35
	
l1384:	
;awdiv.c: 35: quotient = -quotient;
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	line	36
	
l1386:	
;awdiv.c: 36: return quotient;
	movf	(___awdiv@quotient+1),w
	movwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	movwf	(?___awdiv)
	line	37
	
l754:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	___awmod
psect	text165,local,class=CODE,delta=2
global __ptext165
__ptext165:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    4[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text165
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 0
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l1310:	
;awmod.c: 6: unsigned char counter, sign;
;awmod.c: 8: sign = 0;
	clrf	(___awmod@sign)
	line	9
	
l1312:	
;awmod.c: 9: if(dividend < 0) {
	btfss	(___awmod@dividend+1),7
	goto	u211
	goto	u210
u211:
	goto	l1318
u210:
	line	10
	
l1314:	
;awmod.c: 10: dividend = -dividend;
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	
l1316:	
;awmod.c: 11: sign = 1;
	clrf	(___awmod@sign)
	incf	(___awmod@sign),f
	line	13
	
l1318:	
;awmod.c: 12: }
;awmod.c: 13: if(divisor < 0)
	btfss	(___awmod@divisor+1),7
	goto	u221
	goto	u220
u221:
	goto	l1322
u220:
	line	14
	
l1320:	
;awmod.c: 14: divisor = -divisor;
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	line	15
	
l1322:	
;awmod.c: 15: if(divisor != 0) {
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u231
	goto	u230
u231:
	goto	l1338
u230:
	line	16
	
l1324:	
;awmod.c: 16: counter = 1;
	clrf	(___awmod@counter)
	incf	(___awmod@counter),f
	line	17
;awmod.c: 17: while(((unsigned int)divisor & 0x8000U) == 0) {
	goto	l1328
	line	18
	
l1326:	
;awmod.c: 18: divisor <<= 1;
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	line	19
;awmod.c: 19: counter++;
	incf	(___awmod@counter),f
	line	17
	
l1328:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u241
	goto	u240
u241:
	goto	l1326
u240:
	line	22
	
l1330:	
;awmod.c: 22: if((unsigned int)divisor <= (unsigned int)dividend)
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u255
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u255:
	skipc
	goto	u251
	goto	u250
u251:
	goto	l1334
u250:
	line	23
	
l1332:	
;awmod.c: 23: dividend -= divisor;
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	line	24
	
l1334:	
;awmod.c: 24: *(unsigned int *)&divisor >>= 1;
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	line	25
	
l1336:	
;awmod.c: 25: } while(--counter != 0);
	decfsz	(___awmod@counter),f
	goto	u261
	goto	u260
u261:
	goto	l1330
u260:
	line	27
	
l1338:	
;awmod.c: 26: }
;awmod.c: 27: if(sign)
	movf	(___awmod@sign),w
	skipz
	goto	u270
	goto	l1342
u270:
	line	28
	
l1340:	
;awmod.c: 28: dividend = -dividend;
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	29
	
l1342:	
;awmod.c: 29: return dividend;
	movf	(___awmod@dividend+1),w
	movwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	movwf	(?___awmod)
	line	30
	
l822:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	_Timer1_Delay
psect	text166,local,class=CODE,delta=2
global __ptext166
__ptext166:

;; *************** function _Timer1_Delay *****************
;; Defined at:
;;		line 4 in file "C:\Users\Admin\Desktop\PIC\PIC course\Timer 16Bit LCD\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
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
psect	text166
	file	"C:\Users\Admin\Desktop\PIC\PIC course\Timer 16Bit LCD\main.c"
	line	4
	global	__size_of_Timer1_Delay
	__size_of_Timer1_Delay	equ	__end_of_Timer1_Delay-_Timer1_Delay
	
_Timer1_Delay:	
	opt	stack 0
; Regs used in _Timer1_Delay: [wreg+status,2]
	
l1394:	
	clrf	(15)	;volatile
	line	5
	
l1396:	
;main.c: 5: TMR1L=0x64;
	movlw	(064h)
	movwf	(14)	;volatile
	line	6
	
l1398:	
;main.c: 6: T1CON=0x39;
	movlw	(039h)
	movwf	(16)	;volatile
	line	7
;main.c: 7: while(TMR1IF==0);
	
l580:	
	btfss	(96/8),(96)&7
	goto	u361
	goto	u360
u361:
	goto	l580
u360:
	line	8
	
l1400:	
;main.c: 8: T1CON=0x38;
	movlw	(038h)
	movwf	(16)	;volatile
	line	9
	
l1402:	
;main.c: 9: TMR1IF=0;
	bcf	(96/8),(96)&7
	line	11
	
l583:	
	return
	opt stack 0
GLOBAL	__end_of_Timer1_Delay
	__end_of_Timer1_Delay:
;; =============== function _Timer1_Delay ends ============

	signat	_Timer1_Delay,88
	global	_delay
psect	text167,local,class=CODE,delta=2
global __ptext167
__ptext167:

;; *************** function _delay *****************
;; Defined at:
;;		line 5 in file "C:\Users\Admin\Desktop\PIC\PIC course\Timer 16Bit LCD\LCD 4 BIT.h"
;; Parameters:    Size  Location     Type
;;  a               2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
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
psect	text167
	file	"C:\Users\Admin\Desktop\PIC\PIC course\Timer 16Bit LCD\LCD 4 BIT.h"
	line	5
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 0
; Regs used in _delay: [wreg]
	line	6
	
l1390:	
;LCD 4 BIT.h: 6: while(a--);
	
l1392:	
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
	goto	u351
	goto	u350
u351:
	goto	l1392
u350:
	line	7
	
l562:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
psect	text168,local,class=CODE,delta=2
global __ptext168
__ptext168:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
