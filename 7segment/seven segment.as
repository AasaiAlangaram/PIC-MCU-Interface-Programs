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
	FNCALL	_main,_delay
	FNROOT	_main
	global	_seg
psect	idataCOMMON,class=CODE,space=0,delta=2
global __pidataCOMMON
__pidataCOMMON:
	file	"C:\Users\blackrider\Desktop\PIC course\7segment\seven seg common cathode.c"
	line	6

;initializer for _seg
	retlw	03Fh
	retlw	06h
	retlw	05Bh
	retlw	04Fh
	retlw	066h
	retlw	06Dh
	retlw	07Dh
	retlw	07h
	retlw	07Fh
	retlw	06Fh
	global	_PORTD
_PORTD	set	8
	global	_TRISD
_TRISD	set	136
	file	"seven segment.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	dataCOMMON,class=COMMON,space=1
global __pdataCOMMON
__pdataCOMMON:
	file	"C:\Users\blackrider\Desktop\PIC course\7segment\seven seg common cathode.c"
_seg:
       ds      10

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
; Initialize objects allocated to COMMON
	global __pidataCOMMON
psect cinit,class=CODE,delta=2
	fcall	__pidataCOMMON+0		;fetch initializer
	movwf	__pdataCOMMON+0&07fh		
	fcall	__pidataCOMMON+1		;fetch initializer
	movwf	__pdataCOMMON+1&07fh		
	fcall	__pidataCOMMON+2		;fetch initializer
	movwf	__pdataCOMMON+2&07fh		
	fcall	__pidataCOMMON+3		;fetch initializer
	movwf	__pdataCOMMON+3&07fh		
	fcall	__pidataCOMMON+4		;fetch initializer
	movwf	__pdataCOMMON+4&07fh		
	fcall	__pidataCOMMON+5		;fetch initializer
	movwf	__pdataCOMMON+5&07fh		
	fcall	__pidataCOMMON+6		;fetch initializer
	movwf	__pdataCOMMON+6&07fh		
	fcall	__pidataCOMMON+7		;fetch initializer
	movwf	__pdataCOMMON+7&07fh		
	fcall	__pidataCOMMON+8		;fetch initializer
	movwf	__pdataCOMMON+8&07fh		
	fcall	__pidataCOMMON+9		;fetch initializer
	movwf	__pdataCOMMON+9&07fh		
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
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	delay@a
delay@a:	; 2 bytes @ 0x0
	ds	2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	??_main
??_main:	; 0 bytes @ 0x2
	global	main@i
main@i:	; 2 bytes @ 0x2
	ds	2
;;Data sizes: Strings 0, constant 0, data 10, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      4      14
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_delay
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
;; (0) _main                                                 2     2      0      60
;;                                              2 COMMON     2     2      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _delay                                                2     0      2      15
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _delay
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0       9        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0       F      12        0.0%
;;ABS                  0      0       E       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       1       2        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      4       E       1      100.0%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 8 in file "C:\Users\blackrider\Desktop\PIC course\7segment\seven seg common cathode.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    2[COMMON] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\blackrider\Desktop\PIC course\7segment\seven seg common cathode.c"
	line	8
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	9
	
l1731:	
;seven seg common cathode.c: 9: TRISD=0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	10
;seven seg common cathode.c: 10: PORTD=0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	goto	l1733
	line	12
;seven seg common cathode.c: 12: while(1)
	
l567:	
	line	14
	
l1733:	
;seven seg common cathode.c: 13: {
;seven seg common cathode.c: 14: for(int i=0;i<10;i++)
	movlw	low(0)
	movwf	(main@i)
	movlw	high(0)
	movwf	((main@i))+1
	
l1735:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u2155
	movlw	low(0Ah)
	subwf	(main@i),w
u2155:

	skipc
	goto	u2151
	goto	u2150
u2151:
	goto	l1739
u2150:
	goto	l1733
	
l1737:	
	goto	l1733
	line	15
	
l568:	
	line	16
	
l1739:	
;seven seg common cathode.c: 15: {
;seven seg common cathode.c: 16: PORTD=seg[i];
	movf	(main@i),w
	addlw	_seg&0ffh
	movwf	fsr0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	17
	
l1741:	
;seven seg common cathode.c: 17: delay(30000);
	movlw	low(07530h)
	movwf	(?_delay)
	movlw	high(07530h)
	movwf	((?_delay))+1
	fcall	_delay
	line	14
	
l1743:	
	movlw	low(01h)
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l1745:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u2165
	movlw	low(0Ah)
	subwf	(main@i),w
u2165:

	skipc
	goto	u2161
	goto	u2160
u2161:
	goto	l1739
u2160:
	goto	l1733
	
l569:	
	goto	l1733
	line	19
	
l570:	
	line	12
	goto	l1733
	
l571:	
	line	20
	
l572:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_delay
psect	text55,local,class=CODE,delta=2
global __ptext55
__ptext55:

;; *************** function _delay *****************
;; Defined at:
;;		line 3 in file "C:\Users\blackrider\Desktop\PIC course\7segment\seven seg common cathode.c"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text55
	file	"C:\Users\blackrider\Desktop\PIC course\7segment\seven seg common cathode.c"
	line	3
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 7
; Regs used in _delay: [wreg]
	line	4
	
l941:	
;seven seg common cathode.c: 4: while(a--);
	goto	l943
	
l562:	
	goto	l943
	
l561:	
	
l943:	
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
	goto	l943
u10:
	goto	l564
	
l563:	
	line	5
	
l564:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
psect	text56,local,class=CODE,delta=2
global __ptext56
__ptext56:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
