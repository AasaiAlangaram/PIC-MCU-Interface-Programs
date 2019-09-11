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
	FNCALL	_main,_forward
	FNCALL	_main,_delay
	FNCALL	_main,_reverse
	FNCALL	_reverse,_delay
	FNCALL	_forward,_delay
	FNROOT	_main
	global	_a
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"D:\TI\PIC course\led chasing seq\led  seq.c"
	line	6

;initializer for _a
	retlw	01h
	retlw	02h
	retlw	04h
	retlw	08h
	retlw	010h
	retlw	020h
	retlw	040h
	retlw	080h
	global	_PORTD
_PORTD	set	8
	global	_TRISD
_TRISD	set	136
	file	"led seq.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"D:\TI\PIC course\led chasing seq\led  seq.c"
_a:
       ds      8

global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+8)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
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
	global	?_reverse
?_reverse:	; 0 bytes @ 0x0
	global	?_forward
?_forward:	; 0 bytes @ 0x0
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	delay@a
delay@a:	; 2 bytes @ 0x0
	ds	2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	??_forward
??_forward:	; 0 bytes @ 0x2
	global	??_reverse
??_reverse:	; 0 bytes @ 0x2
	ds	1
	global	reverse@i
reverse@i:	; 2 bytes @ 0x3
	global	forward@i
forward@i:	; 2 bytes @ 0x3
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x5
	global	main@i_308
main@i_308:	; 2 bytes @ 0x5
	ds	2
	global	main@i
main@i:	; 2 bytes @ 0x7
	ds	2
;;Data sizes: Strings 0, constant 0, data 8, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      9       9
;; BANK0           80      0       8
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;; COMMON:	_main->_forward
;; COMMON:	_main->_reverse
;; Critical Paths (_reverse)
;; COMMON:	_reverse->_delay

;; Critical Paths (_forward)
;; COMMON:	_forward->_delay

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0

;;
;;Call Graph Tables:

;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (1) _main                                                 4     4      0     165
;;                                              5 COMMON     4     4      0
;;                            _forward
;;                              _delay
;;                            _reverse
;; ---------------------------------------------------------------------------------
;; (0) _reverse                                              3     3      0      45
;;                                              2 COMMON     3     3      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (0) _forward                                              3     3      0      45
;;                                              2 COMMON     3     3      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (4294967295) _delay                                       2     0      2      15
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum call depth -1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _reverse (ROOT)
;;   _delay
;;
;; _forward (ROOT)
;;   _delay
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BITBANK3            60      0       0      11        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK2            60      0       0      12        0.0%
;;BANK2               60      0       0       9        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;ABS                  0      0      11      10        0.0%
;;DATA                 0      0      13       5        0.0%
;;SFR0                 0      0       0       1        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;BITBANK0            50      0       0       3        0.0%
;;BANK0               50      0       8       4       10.0%
;;STACK                0      0       2       2        0.0%
;;BITCOMMON            E      0       0       0        0.0%
;;COMMON               E      9       9       1       64.3%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 43 in file "D:\TI\PIC course\led chasing seq\led  seq.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    5[COMMON] int 
;;  i               2    7[COMMON] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_forward
;;		_delay
;;		_reverse
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\TI\PIC course\led chasing seq\led  seq.c"
	line	43
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 2
; Regs used in _main: [wreg+status,2-btemp+0+pclath+cstack]
	line	44
	
l1796:	
;led  seq.c: 44: TRISD=0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	45
	
l1798:	
;led  seq.c: 45: PORTD=0x01;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	46
;led  seq.c: 46: while(1)
	
l582:	
	line	49
	
l1800:	
;led  seq.c: 47: {
;led  seq.c: 49: for(int i=0;i<=4;i++)
	movlw	low(0)
	movwf	(main@i)
	movlw	high(0)
	movwf	((main@i))+1
	
l1802:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(05h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2215
	movlw	low(05h)
	subwf	(main@i),w
u2215:

	skipc
	goto	u2211
	goto	u2210
u2211:
	goto	l583
u2210:
	
l1804:	
	goto	l584
	line	50
	
l583:	
	line	51
	
l1806:	
;led  seq.c: 50: {
;led  seq.c: 51: forward();
	fcall	_forward
	line	49
	
l1808:	
	movlw	low(01h)
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l1810:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(05h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2225
	movlw	low(05h)
	subwf	(main@i),w
u2225:

	skipc
	goto	u2221
	goto	u2220
u2221:
	goto	l583
u2220:
	
l584:	
	line	54
	
l1812:	
;led  seq.c: 52: }
;led  seq.c: 54: delay(20000);
	movlw	low(04E20h)
	movwf	(?_delay)
	movlw	high(04E20h)
	movwf	((?_delay))+1
	fcall	_delay
	line	55
	
l1814:	
;led  seq.c: 55: PORTD=0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	56
	
l1816:	
;led  seq.c: 56: for(int i=0;i<=4;i++)
	movlw	low(0)
	movwf	(main@i_308)
	movlw	high(0)
	movwf	((main@i_308))+1
	
l1818:	
	movf	(main@i_308+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(05h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2235
	movlw	low(05h)
	subwf	(main@i_308),w
u2235:

	skipc
	goto	u2231
	goto	u2230
u2231:
	goto	l585
u2230:
	
l1820:	
	goto	l586
	line	57
	
l585:	
	line	58
	
l1822:	
;led  seq.c: 57: {
;led  seq.c: 58: reverse();
	fcall	_reverse
	line	56
	
l1824:	
	movlw	low(01h)
	addwf	(main@i_308),f
	skipnc
	incf	(main@i_308+1),f
	movlw	high(01h)
	addwf	(main@i_308+1),f
	
l1826:	
	movf	(main@i_308+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(05h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2245
	movlw	low(05h)
	subwf	(main@i_308),w
u2245:

	skipc
	goto	u2241
	goto	u2240
u2241:
	goto	l585
u2240:
	
l586:	
	line	64
	
l587:	
	line	46
	goto	l582
	
l588:	
	line	66
	
l589:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_reverse
psect	text82,local,class=CODE,delta=2
global __ptext82
__ptext82:

;; *************** function _reverse *****************
;; Defined at:
;;		line 19 in file "D:\TI\PIC course\led chasing seq\led  seq.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    3[COMMON] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text82
	file	"D:\TI\PIC course\led chasing seq\led  seq.c"
	line	19
	global	__size_of_reverse
	__size_of_reverse	equ	__end_of_reverse-_reverse
	
_reverse:	
	opt	stack 1
; Regs used in _reverse: [wreg+status,2-btemp+0+pclath+cstack]
	line	20
	
l1780:	
;led  seq.c: 20: PORTD=0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	21
;led  seq.c: 21: for(int i=0;i<8;i++)
	movlw	low(0)
	movwf	(reverse@i)
	movlw	high(0)
	movwf	((reverse@i))+1
	
l1782:	
	movf	(reverse@i+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(08h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2195
	movlw	low(08h)
	subwf	(reverse@i),w
u2195:

	skipc
	goto	u2191
	goto	u2190
u2191:
	goto	l572
u2190:
	
l1784:	
	goto	l573
	line	22
	
l572:	
	line	23
	
l1786:	
;led  seq.c: 22: {
;led  seq.c: 23: delay(10000);
	movlw	low(02710h)
	movwf	(?_delay)
	movlw	high(02710h)
	movwf	((?_delay))+1
	fcall	_delay
	line	24
	
l1788:	
;led  seq.c: 24: PORTD=PORTD>>1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(8),w	;volatile
	movwf	(??_reverse+0)+0
	clrc
	rrf	(??_reverse+0)+0,w
	movwf	(8)	;volatile
	line	25
	
l1790:	
;led  seq.c: 25: delay(10000);
	movlw	low(02710h)
	movwf	(?_delay)
	movlw	high(02710h)
	movwf	((?_delay))+1
	fcall	_delay
	line	21
	
l1792:	
	movlw	low(01h)
	addwf	(reverse@i),f
	skipnc
	incf	(reverse@i+1),f
	movlw	high(01h)
	addwf	(reverse@i+1),f
	
l1794:	
	movf	(reverse@i+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(08h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2205
	movlw	low(08h)
	subwf	(reverse@i),w
u2205:

	skipc
	goto	u2201
	goto	u2200
u2201:
	goto	l572
u2200:
	
l573:	
	line	29
	
l574:	
	return
	opt stack 0
GLOBAL	__end_of_reverse
	__end_of_reverse:
;; =============== function _reverse ends ============

	signat	_reverse,88
	global	_forward
psect	text83,local,class=CODE,delta=2
global __ptext83
__ptext83:

;; *************** function _forward *****************
;; Defined at:
;;		line 8 in file "D:\TI\PIC course\led chasing seq\led  seq.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    3[COMMON] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text83
	file	"D:\TI\PIC course\led chasing seq\led  seq.c"
	line	8
	global	__size_of_forward
	__size_of_forward	equ	__end_of_forward-_forward
	
_forward:	
	opt	stack 1
; Regs used in _forward: [wreg+status,2-btemp+0+pclath+cstack]
	
l1764:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	9
;led  seq.c: 9: for(int i=0;i<8;i++)
	movlw	low(0)
	movwf	(forward@i)
	movlw	high(0)
	movwf	((forward@i))+1
	
l1766:	
	movf	(forward@i+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(08h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2175
	movlw	low(08h)
	subwf	(forward@i),w
u2175:

	skipc
	goto	u2171
	goto	u2170
u2171:
	goto	l567
u2170:
	
l1768:	
	goto	l568
	line	10
	
l567:	
	line	11
	
l1770:	
;led  seq.c: 10: {
;led  seq.c: 11: delay(10000);
	movlw	low(02710h)
	movwf	(?_delay)
	movlw	high(02710h)
	movwf	((?_delay))+1
	fcall	_delay
	line	12
	
l1772:	
;led  seq.c: 12: PORTD=PORTD<<1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(8),w	;volatile
	movwf	(??_forward+0)+0
	addwf	(??_forward+0)+0,w
	movwf	(8)	;volatile
	line	13
	
l1774:	
;led  seq.c: 13: delay(10000);
	movlw	low(02710h)
	movwf	(?_delay)
	movlw	high(02710h)
	movwf	((?_delay))+1
	fcall	_delay
	line	9
	
l1776:	
	movlw	low(01h)
	addwf	(forward@i),f
	skipnc
	incf	(forward@i+1),f
	movlw	high(01h)
	addwf	(forward@i+1),f
	
l1778:	
	movf	(forward@i+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(08h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2185
	movlw	low(08h)
	subwf	(forward@i),w
u2185:

	skipc
	goto	u2181
	goto	u2180
u2181:
	goto	l567
u2180:
	
l568:	
	line	17
	
l569:	
	return
	opt stack 0
GLOBAL	__end_of_forward
	__end_of_forward:
;; =============== function _forward ends ============

	signat	_forward,88
	global	_delay
psect	text84,local,class=CODE,delta=2
global __ptext84
__ptext84:

;; *************** function _delay *****************
;; Defined at:
;;		line 3 in file "D:\TI\PIC course\led chasing seq\led  seq.c"
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
;;		_forward
;;		_reverse
;;		_main
;;		_mix
;; This function uses a non-reentrant model
;;
psect	text84
	file	"D:\TI\PIC course\led chasing seq\led  seq.c"
	line	3
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 0
; Regs used in _delay: [wreg]
	line	4
	
l1510:	
;led  seq.c: 4: while(a--);
	goto	l561
	
l562:	
	
l561:	
	
l1512:	
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
	goto	l562
u1470:
	
l563:	
	line	5
	
l564:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
psect	text85,local,class=CODE,delta=2
global __ptext85
__ptext85:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
