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
	FNCALL	_main,___lwmod
	FNCALL	_main,___lwdiv
	FNCALL	_main,___awmod
	FNCALL	_main,___awdiv
	FNCALL	_main,_lcd_data
	FNCALL	_display,_lcd_data
	FNCALL	_lcd_initialize,_lcd_command
	FNCALL	_lcd_data,_delay
	FNCALL	_lcd_command,_delay
	FNROOT	_main
	global	_count
	global	_PORTB
psect	text188,local,class=CODE,delta=2
global __ptext188
__ptext188:
_PORTB	set	6
	global	_PORTD
_PORTD	set	8
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
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
	
STR_2:	
	retlw	80	;'P'
	retlw	117	;'u'
	retlw	115	;'s'
	retlw	104	;'h'
	retlw	32	;' '
	retlw	116	;'t'
	retlw	104	;'h'
	retlw	101	;'e'
	retlw	32	;' '
	retlw	66	;'B'
	retlw	111	;'o'
	retlw	116	;'t'
	retlw	116	;'t'
	retlw	111	;'o'
	retlw	110	;'n'
	retlw	115	;'s'
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
	
STR_3:	
	retlw	48	;'0'
	retlw	48	;'0'
	retlw	48	;'0'
	retlw	0
psect	strings
	file	"LCD Button .as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_count:
       ds      4

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
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
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	delay@a
delay@a:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x0
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
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x2
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x2
	ds	2
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x4
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0x4
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	global	lcd_command@temp
lcd_command@temp:	; 1 bytes @ 0x4
	global	lcd_data@temp1
lcd_data@temp1:	; 1 bytes @ 0x4
	ds	1
	global	lcd_command@command
lcd_command@command:	; 1 bytes @ 0x5
	global	lcd_data@data
lcd_data@data:	; 1 bytes @ 0x5
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x5
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x5
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x5
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	1
	global	??_lcd_initialize
??_lcd_initialize:	; 0 bytes @ 0x6
	global	?_display
?_display:	; 0 bytes @ 0x6
	global	display@len
display@len:	; 1 bytes @ 0x6
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x6
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x6
	ds	1
	global	??_display
??_display:	; 0 bytes @ 0x7
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x7
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x7
	ds	1
	global	display@word
display@word:	; 1 bytes @ 0x8
	ds	1
	global	display@a
display@a:	; 1 bytes @ 0x9
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0xA
	ds	3
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	main@b
main@b:	; 2 bytes @ 0x0
	ds	2
	global	main@d
main@d:	; 2 bytes @ 0x2
	ds	2
	global	main@e
main@e:	; 2 bytes @ 0x4
	ds	2
	global	main@c
main@c:	; 2 bytes @ 0x6
	ds	2
	global	main@a
main@a:	; 2 bytes @ 0x8
	ds	2
;;Data sizes: Strings 29, constant 0, data 0, bss 4, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      13
;; BANK0           80     10      14
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___awdiv	int  size(1) Largest target is 0
;;
;; ?___awmod	int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; display@word	PTR const unsigned char  size(1) Largest target is 17
;;		 -> STR_3(CODE[4]), STR_2(CODE[17]), STR_1(CODE[8]), 
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
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                13    13      0    1613
;;                                             10 COMMON     3     3      0
;;                                              0 BANK0     10    10      0
;;                     _lcd_initialize
;;                        _lcd_command
;;                            _display
;;                              _delay
;;                            ___lwmod
;;                            ___lwdiv
;;                            ___awmod
;;                            ___awdiv
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _display                                              4     3      1     179
;;                                              6 COMMON     4     3      1
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_initialize                                       0     0      0      89
;;                        _lcd_command
;; ---------------------------------------------------------------------------------
;; (1) _lcd_data                                             4     4      0      89
;;                                              2 COMMON     4     4      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _lcd_command                                          4     4      0      89
;;                                              2 COMMON     4     4      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) ___awmod                                              7     3      4     296
;;                                              0 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (1) ___awdiv                                              9     5      4     300
;;                                              0 COMMON     9     5      4
;; ---------------------------------------------------------------------------------
;; (1) ___lwmod                                              6     2      4     159
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (1) ___lwdiv                                              8     4      4     162
;;                                              0 COMMON     8     4      4
;; ---------------------------------------------------------------------------------
;; (2) _delay                                                2     0      2      22
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
;;   ___lwmod
;;   ___lwdiv
;;   ___awmod
;;   ___awdiv
;;   _lcd_data
;;     _delay
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      D       D       1       92.9%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;ABS                  0      0      1B       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      A       E       5       17.5%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      1E      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 7 in file "C:\Users\blackrider\Desktop\PIC course\LCD Button count\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  a               2    8[BANK0 ] unsigned int 
;;  c               2    6[BANK0 ] unsigned int 
;;  e               2    4[BANK0 ] unsigned int 
;;  d               2    2[BANK0 ] unsigned int 
;;  b               2    0[BANK0 ] unsigned int 
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
;;      Locals:         0      10       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         3      10       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_initialize
;;		_lcd_command
;;		_display
;;		_delay
;;		___lwmod
;;		___lwdiv
;;		___awmod
;;		___awdiv
;;		_lcd_data
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\blackrider\Desktop\PIC course\LCD Button count\main.c"
	line	7
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	8
	
l2199:	
;main.c: 8: unsigned int a,b,c,d,e=0;
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@e)
	movlw	high(0)
	movwf	((main@e))+1
	line	10
;main.c: 10: TRISB=0x03;
	movlw	(03h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	11
	
l2201:	
;main.c: 11: TRISD=0x00;
	clrf	(136)^080h	;volatile
	line	12
	
l2203:	
;main.c: 12: PORTD=0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	13
;main.c: 13: PORTB=0x03;
	movlw	(03h)
	movwf	(6)	;volatile
	line	14
	
l2205:	
;main.c: 14: lcd_initialize();
	fcall	_lcd_initialize
	line	15
	
l2207:	
;main.c: 15: lcd_command(0x85);
	movlw	(085h)
	fcall	_lcd_command
	line	16
	
l2209:	
;main.c: 16: display("Counter",7);
	movlw	(07h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_display)
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_display
	line	17
	
l2211:	
;main.c: 17: lcd_command(0xC0);
	movlw	(0C0h)
	fcall	_lcd_command
	line	18
	
l2213:	
;main.c: 18: display("Push the Bottons",16);
	movlw	(010h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_display)
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_display
	line	19
	
l2215:	
;main.c: 19: delay(50000);
	movlw	low(0C350h)
	movwf	(?_delay)
	movlw	high(0C350h)
	movwf	((?_delay))+1
	fcall	_delay
	line	20
	
l2217:	
;main.c: 20: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	21
	
l2219:	
;main.c: 21: display("000",3);
	movlw	(03h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_display)
	movlw	((STR_3-__stringbase))&0ffh
	fcall	_display
	goto	l2221
	line	22
;main.c: 22: while(1)
	
l582:	
	line	24
	
l2221:	
;main.c: 23: {
;main.c: 24: if(RB0==0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(48/8),(48)&7
	goto	u2591
	goto	u2590
u2591:
	goto	l2227
u2590:
	line	26
	
l2223:	
;main.c: 25: {
;main.c: 26: a++;while(RB0==0);
	movlw	low(01h)
	addwf	(main@a),f
	skipnc
	incf	(main@a+1),f
	movlw	high(01h)
	addwf	(main@a+1),f
	goto	l584
	
l585:	
	
l584:	
	btfss	(48/8),(48)&7
	goto	u2601
	goto	u2600
u2601:
	goto	l584
u2600:
	goto	l2225
	
l586:	
	line	27
	
l2225:	
;main.c: 27: count[3]=a%10;
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	movf	(main@a+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(main@a),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_count)+03h
	line	29
;main.c: 29: count[2]=a/10;
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	movf	(main@a+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(main@a),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_count)+02h
	line	31
;main.c: 31: count[1]=count[2]%10;
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	movf	0+(_count)+02h,w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	movwf	(??_main+2)+0
	movf	(??_main+2)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_count)+01h
	line	33
;main.c: 33: count[0]=count[2]/10;
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	0+(_count)+02h,w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	movwf	(??_main+2)+0
	movf	(??_main+2)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_count)
	line	36
;main.c: 36: lcd_command(0x80);
	movlw	(080h)
	fcall	_lcd_command
	line	46
;main.c: 46: lcd_data(count + 0x30);
	movlw	(_count+030h)&0ffh
	fcall	_lcd_data
	goto	l2227
	line	47
	
l583:	
	line	49
	
l2227:	
;main.c: 47: }
;main.c: 49: if(RB1==0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(49/8),(49)&7
	goto	u2611
	goto	u2610
u2611:
	goto	l2221
u2610:
	line	51
	
l2229:	
;main.c: 50: {
;main.c: 51: a--;while(RB1==0);
	movlw	low(01h)
	subwf	(main@a),f
	movlw	high(01h)
	skipc
	decf	(main@a+1),f
	subwf	(main@a+1),f
	goto	l588
	
l589:	
	
l588:	
	btfss	(49/8),(49)&7
	goto	u2621
	goto	u2620
u2621:
	goto	l588
u2620:
	goto	l2231
	
l590:	
	line	52
	
l2231:	
;main.c: 52: if(a==0){a=0;}
	movf	((main@a+1)),w
	iorwf	((main@a)),w
	skipz
	goto	u2631
	goto	u2630
u2631:
	goto	l2235
u2630:
	
l2233:	
	movlw	low(0)
	movwf	(main@a)
	movlw	high(0)
	movwf	((main@a))+1
	goto	l2235
	
l591:	
	line	53
	
l2235:	
;main.c: 53: b= a%10 ;
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	movf	(main@a+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(main@a),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(1+(?___lwmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@b+1)
	addwf	(main@b+1)
	movf	(0+(?___lwmod)),w
	clrf	(main@b)
	addwf	(main@b)

	line	54
	
l2237:	
;main.c: 54: c= a/10 ;
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	movf	(main@a+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(main@a),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@c+1)
	addwf	(main@c+1)
	movf	(0+(?___lwdiv)),w
	clrf	(main@c)
	addwf	(main@c)

	line	55
	
l2239:	
;main.c: 55: d= c%10 ;
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	movf	(main@c+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(main@c),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(1+(?___lwmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@d+1)
	addwf	(main@d+1)
	movf	(0+(?___lwmod)),w
	clrf	(main@d)
	addwf	(main@d)

	line	56
	
l2241:	
;main.c: 56: e=c/10;
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	movf	(main@c+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(main@c),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@e+1)
	addwf	(main@e+1)
	movf	(0+(?___lwdiv)),w
	clrf	(main@e)
	addwf	(main@e)

	line	57
	
l2243:	
;main.c: 57: lcd_command(0x80);
	movlw	(080h)
	fcall	_lcd_command
	line	58
	
l2245:	
;main.c: 58: lcd_data(e|0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@e),w
	iorlw	030h
	fcall	_lcd_data
	line	59
	
l2247:	
;main.c: 59: lcd_data(d|0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@d),w
	iorlw	030h
	fcall	_lcd_data
	line	60
	
l2249:	
;main.c: 60: lcd_data(b|0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@b),w
	iorlw	030h
	fcall	_lcd_data
	line	61
	
l2251:	
;main.c: 61: delay(10000);
	movlw	low(02710h)
	movwf	(?_delay)
	movlw	high(02710h)
	movwf	((?_delay))+1
	fcall	_delay
	goto	l2221
	line	62
	
l587:	
	goto	l2221
	line	65
	
l592:	
	line	22
	goto	l2221
	
l593:	
	line	67
	
l594:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_display
psect	text189,local,class=CODE,delta=2
global __ptext189
__ptext189:

;; *************** function _display *****************
;; Defined at:
;;		line 55 in file "C:\Users\blackrider\Desktop\PIC course\LCD Button count\LCD 4 BIT.h"
;; Parameters:    Size  Location     Type
;;  word            1    wreg     PTR const unsigned char 
;;		 -> STR_3(4), STR_2(17), STR_1(8), 
;;  len             1    6[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  word            1    8[COMMON] PTR const unsigned char 
;;		 -> STR_3(4), STR_2(17), STR_1(8), 
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
psect	text189
	file	"C:\Users\blackrider\Desktop\PIC course\LCD Button count\LCD 4 BIT.h"
	line	55
	global	__size_of_display
	__size_of_display	equ	__end_of_display-_display
	
_display:	
	opt	stack 5
; Regs used in _display: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;display@word stored from wreg
	line	57
	movwf	(display@word)
	
l2191:	
;LCD 4 BIT.h: 56: unsigned char a;
;LCD 4 BIT.h: 57: for(a=0;a<=len;a++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(display@a)
	goto	l2197
	line	58
	
l577:	
	line	59
	
l2193:	
;LCD 4 BIT.h: 58: {
;LCD 4 BIT.h: 59: lcd_data(word[a]);
	movf	(display@a),w
	addwf	(display@word),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	line	57
	
l2195:	
	movlw	(01h)
	movwf	(??_display+0)+0
	movf	(??_display+0)+0,w
	addwf	(display@a),f
	goto	l2197
	
l576:	
	
l2197:	
	movf	(display@a),w
	subwf	(display@len),w
	skipnc
	goto	u2581
	goto	u2580
u2581:
	goto	l2193
u2580:
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
psect	text190,local,class=CODE,delta=2
global __ptext190
__ptext190:

;; *************** function _lcd_initialize *****************
;; Defined at:
;;		line 46 in file "C:\Users\blackrider\Desktop\PIC course\LCD Button count\LCD 4 BIT.h"
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
psect	text190
	file	"C:\Users\blackrider\Desktop\PIC course\LCD Button count\LCD 4 BIT.h"
	line	46
	global	__size_of_lcd_initialize
	__size_of_lcd_initialize	equ	__end_of_lcd_initialize-_lcd_initialize
	
_lcd_initialize:	
	opt	stack 5
; Regs used in _lcd_initialize: [wreg+status,2+status,0+pclath+cstack]
	line	47
	
l2189:	
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
psect	text191,local,class=CODE,delta=2
global __ptext191
__ptext191:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 27 in file "C:\Users\blackrider\Desktop\PIC course\LCD Button count\LCD 4 BIT.h"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text191
	file	"C:\Users\blackrider\Desktop\PIC course\LCD Button count\LCD 4 BIT.h"
	line	27
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 6
; Regs used in _lcd_data: [wreg+status,2+status,0+pclath+cstack]
;lcd_data@data stored from wreg
	line	29
	movwf	(lcd_data@data)
	
l2163:	
;LCD 4 BIT.h: 28: unsigned char temp1;
;LCD 4 BIT.h: 29: PORTD=data&0xF0;
	movf	(lcd_data@data),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	30
	
l2165:	
;LCD 4 BIT.h: 30: RD0=1;
	bsf	(64/8),(64)&7
	line	31
	
l2167:	
;LCD 4 BIT.h: 31: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	32
	
l2169:	
;LCD 4 BIT.h: 32: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	line	33
	
l2171:	
;LCD 4 BIT.h: 33: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	34
	
l2173:	
;LCD 4 BIT.h: 34: RD1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	35
	
l2175:	
;LCD 4 BIT.h: 35: temp1=data<<4;
	movf	(lcd_data@data),w
	movwf	(??_lcd_data+0)+0
	movlw	(04h)-1
u2575:
	clrc
	rlf	(??_lcd_data+0)+0,f
	addlw	-1
	skipz
	goto	u2575
	clrc
	rlf	(??_lcd_data+0)+0,w
	movwf	(??_lcd_data+1)+0
	movf	(??_lcd_data+1)+0,w
	movwf	(lcd_data@temp1)
	line	36
	
l2177:	
;LCD 4 BIT.h: 36: PORTD=temp1&0xF0;
	movf	(lcd_data@temp1),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	37
	
l2179:	
;LCD 4 BIT.h: 37: RD0=1;
	bsf	(64/8),(64)&7
	line	38
	
l2181:	
;LCD 4 BIT.h: 38: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	39
	
l2183:	
;LCD 4 BIT.h: 39: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	line	40
	
l2185:	
;LCD 4 BIT.h: 40: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	41
	
l2187:	
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
psect	text192,local,class=CODE,delta=2
global __ptext192
__ptext192:

;; *************** function _lcd_command *****************
;; Defined at:
;;		line 9 in file "C:\Users\blackrider\Desktop\PIC course\LCD Button count\LCD 4 BIT.h"
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
psect	text192
	file	"C:\Users\blackrider\Desktop\PIC course\LCD Button count\LCD 4 BIT.h"
	line	9
	global	__size_of_lcd_command
	__size_of_lcd_command	equ	__end_of_lcd_command-_lcd_command
	
_lcd_command:	
	opt	stack 6
; Regs used in _lcd_command: [wreg+status,2+status,0+pclath+cstack]
;lcd_command@command stored from wreg
	line	11
	movwf	(lcd_command@command)
	
l2137:	
;LCD 4 BIT.h: 10: unsigned char temp;
;LCD 4 BIT.h: 11: PORTD=command&0xF0;
	movf	(lcd_command@command),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	12
	
l2139:	
;LCD 4 BIT.h: 12: RD0=0;
	bcf	(64/8),(64)&7
	line	13
	
l2141:	
;LCD 4 BIT.h: 13: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	14
	
l2143:	
;LCD 4 BIT.h: 14: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	line	15
	
l2145:	
;LCD 4 BIT.h: 15: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	16
	
l2147:	
;LCD 4 BIT.h: 16: RD1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	17
	
l2149:	
;LCD 4 BIT.h: 17: temp=command<<4;
	movf	(lcd_command@command),w
	movwf	(??_lcd_command+0)+0
	movlw	(04h)-1
u2565:
	clrc
	rlf	(??_lcd_command+0)+0,f
	addlw	-1
	skipz
	goto	u2565
	clrc
	rlf	(??_lcd_command+0)+0,w
	movwf	(??_lcd_command+1)+0
	movf	(??_lcd_command+1)+0,w
	movwf	(lcd_command@temp)
	line	18
	
l2151:	
;LCD 4 BIT.h: 18: PORTD=temp&0xF0;
	movf	(lcd_command@temp),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	19
	
l2153:	
;LCD 4 BIT.h: 19: RD0=0;
	bcf	(64/8),(64)&7
	line	20
	
l2155:	
;LCD 4 BIT.h: 20: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	21
	
l2157:	
;LCD 4 BIT.h: 21: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	line	22
	
l2159:	
;LCD 4 BIT.h: 22: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	23
	
l2161:	
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
	global	___awmod
psect	text193,local,class=CODE,delta=2
global __ptext193
__ptext193:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.80\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text193
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.80\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 7
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l2101:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(___awmod@sign)
	line	9
	
l2103:	
	btfss	(___awmod@dividend+1),7
	goto	u2471
	goto	u2470
u2471:
	goto	l2107
u2470:
	line	10
	
l2105:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l2107
	line	12
	
l811:	
	line	13
	
l2107:	
	btfss	(___awmod@divisor+1),7
	goto	u2481
	goto	u2480
u2481:
	goto	l2111
u2480:
	line	14
	
l2109:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l2111
	
l812:	
	line	15
	
l2111:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u2491
	goto	u2490
u2491:
	goto	l2129
u2490:
	line	16
	
l2113:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l2119
	
l815:	
	line	18
	
l2115:	
	movlw	01h
	
u2505:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2505
	line	19
	
l2117:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l2119
	line	20
	
l814:	
	line	17
	
l2119:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u2511
	goto	u2510
u2511:
	goto	l2115
u2510:
	goto	l2121
	
l816:	
	goto	l2121
	line	21
	
l817:	
	line	22
	
l2121:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u2525
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u2525:
	skipc
	goto	u2521
	goto	u2520
u2521:
	goto	l2125
u2520:
	line	23
	
l2123:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	l2125
	
l818:	
	line	24
	
l2125:	
	movlw	01h
	
u2535:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u2535
	line	25
	
l2127:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u2541
	goto	u2540
u2541:
	goto	l2121
u2540:
	goto	l2129
	
l819:	
	goto	l2129
	line	26
	
l813:	
	line	27
	
l2129:	
	movf	(___awmod@sign),w
	skipz
	goto	u2550
	goto	l2133
u2550:
	line	28
	
l2131:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l2133
	
l820:	
	line	29
	
l2133:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l821
	
l2135:	
	line	30
	
l821:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text194,local,class=CODE,delta=2
global __ptext194
__ptext194:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.80\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    7[COMMON] int 
;;  sign            1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         9       0       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text194
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.80\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 7
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l2063:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(___awdiv@sign)
	line	10
	
l2065:	
	btfss	(___awdiv@divisor+1),7
	goto	u2371
	goto	u2370
u2371:
	goto	l2069
u2370:
	line	11
	
l2067:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l2069
	line	13
	
l743:	
	line	14
	
l2069:	
	btfss	(___awdiv@dividend+1),7
	goto	u2381
	goto	u2380
u2381:
	goto	l744
u2380:
	line	15
	
l2071:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l2073:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	line	17
	
l744:	
	line	18
	movlw	low(0)
	movwf	(___awdiv@quotient)
	movlw	high(0)
	movwf	((___awdiv@quotient))+1
	line	19
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u2391
	goto	u2390
u2391:
	goto	l2093
u2390:
	line	20
	
l2075:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l2081
	
l747:	
	line	22
	
l2077:	
	movlw	01h
	
u2405:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2405
	line	23
	
l2079:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l2081
	line	24
	
l746:	
	line	21
	
l2081:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u2411
	goto	u2410
u2411:
	goto	l2077
u2410:
	goto	l2083
	
l748:	
	goto	l2083
	line	25
	
l749:	
	line	26
	
l2083:	
	movlw	01h
	
u2425:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2425
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u2435
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u2435:
	skipc
	goto	u2431
	goto	u2430
u2431:
	goto	l2089
u2430:
	line	28
	
l2085:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l2087:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l2089
	line	30
	
l750:	
	line	31
	
l2089:	
	movlw	01h
	
u2445:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u2445
	line	32
	
l2091:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u2451
	goto	u2450
u2451:
	goto	l2083
u2450:
	goto	l2093
	
l751:	
	goto	l2093
	line	33
	
l745:	
	line	34
	
l2093:	
	movf	(___awdiv@sign),w
	skipz
	goto	u2460
	goto	l2097
u2460:
	line	35
	
l2095:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l2097
	
l752:	
	line	36
	
l2097:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l753
	
l2099:	
	line	37
	
l753:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	___lwmod
psect	text195,local,class=CODE,delta=2
global __ptext195
__ptext195:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.80\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text195
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.80\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 7
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l2041:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u2311
	goto	u2310
u2311:
	goto	l2059
u2310:
	line	9
	
l2043:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	l2049
	
l621:	
	line	11
	
l2045:	
	movlw	01h
	
u2325:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2325
	line	12
	
l2047:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	l2049
	line	13
	
l620:	
	line	10
	
l2049:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u2331
	goto	u2330
u2331:
	goto	l2045
u2330:
	goto	l2051
	
l622:	
	goto	l2051
	line	14
	
l623:	
	line	15
	
l2051:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u2345
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u2345:
	skipc
	goto	u2341
	goto	u2340
u2341:
	goto	l2055
u2340:
	line	16
	
l2053:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	l2055
	
l624:	
	line	17
	
l2055:	
	movlw	01h
	
u2355:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u2355
	line	18
	
l2057:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u2361
	goto	u2360
u2361:
	goto	l2051
u2360:
	goto	l2059
	
l625:	
	goto	l2059
	line	19
	
l619:	
	line	20
	
l2059:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	l626
	
l2061:	
	line	21
	
l626:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text196,local,class=CODE,delta=2
global __ptext196
__ptext196:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.80\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    5[COMMON] unsigned int 
;;  counter         1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text196
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.80\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 7
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l2017:	
	movlw	low(0)
	movwf	(___lwdiv@quotient)
	movlw	high(0)
	movwf	((___lwdiv@quotient))+1
	line	10
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u2241
	goto	u2240
u2241:
	goto	l2037
u2240:
	line	11
	
l2019:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l2025
	
l611:	
	line	13
	
l2021:	
	movlw	01h
	
u2255:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2255
	line	14
	
l2023:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l2025
	line	15
	
l610:	
	line	12
	
l2025:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u2261
	goto	u2260
u2261:
	goto	l2021
u2260:
	goto	l2027
	
l612:	
	goto	l2027
	line	16
	
l613:	
	line	17
	
l2027:	
	movlw	01h
	
u2275:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2275
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u2285
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u2285:
	skipc
	goto	u2281
	goto	u2280
u2281:
	goto	l2033
u2280:
	line	19
	
l2029:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l2031:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l2033
	line	21
	
l614:	
	line	22
	
l2033:	
	movlw	01h
	
u2295:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u2295
	line	23
	
l2035:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u2301
	goto	u2300
u2301:
	goto	l2027
u2300:
	goto	l2037
	
l615:	
	goto	l2037
	line	24
	
l609:	
	line	25
	
l2037:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l616
	
l2039:	
	line	26
	
l616:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	_delay
psect	text197,local,class=CODE,delta=2
global __ptext197
__ptext197:

;; *************** function _delay *****************
;; Defined at:
;;		line 4 in file "C:\Users\blackrider\Desktop\PIC course\LCD Button count\LCD 4 BIT.h"
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
psect	text197
	file	"C:\Users\blackrider\Desktop\PIC course\LCD Button count\LCD 4 BIT.h"
	line	4
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 6
; Regs used in _delay: [wreg]
	line	5
	
l2013:	
;LCD 4 BIT.h: 5: while(a--);
	goto	l2015
	
l562:	
	goto	l2015
	
l561:	
	
l2015:	
	movlw	low(01h)
	subwf	(delay@a),f
	movlw	high(01h)
	skipc
	decf	(delay@a+1),f
	subwf	(delay@a+1),f
	movlw	high(0FFFFh)
	xorwf	((delay@a+1)),w
	skipz
	goto	u2235
	movlw	low(0FFFFh)
	xorwf	((delay@a)),w
u2235:

	skipz
	goto	u2231
	goto	u2230
u2231:
	goto	l2015
u2230:
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
psect	text198,local,class=CODE,delta=2
global __ptext198
__ptext198:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
