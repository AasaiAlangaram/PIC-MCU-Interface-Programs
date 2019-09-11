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
	FNCALL	_ext,i1_delay
	FNCALL	intlevel1,_ext
	global	intlevel1
	FNROOT	intlevel1
	global	_seg
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\blackrider\Desktop\PIC course\Interrupt 7seg & LED\main.c"
	line	5

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
	global	_PORTC
_PORTC	set	7
	global	_PORTD
_PORTD	set	8
	global	_GIE
_GIE	set	95
	global	_INTE
_INTE	set	92
	global	_INTF
_INTF	set	89
	global	_RC0
_RC0	set	56
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
	global	_INTEDG
_INTEDG	set	1038
	global	_RBPU
_RBPU	set	1039
	file	"Interrupt Ext 7Seg LED.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\blackrider\Desktop\PIC course\Interrupt 7seg & LED\main.c"
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
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+10)
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

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_ext
?_ext:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?i1_delay
?i1_delay:	; 0 bytes @ 0x0
	global	i1delay@a
i1delay@a:	; 2 bytes @ 0x0
	ds	2
	global	??_ext
??_ext:	; 0 bytes @ 0x2
	global	??i1_delay
??i1_delay:	; 0 bytes @ 0x2
	ds	4
	global	?_delay
?_delay:	; 0 bytes @ 0x6
	global	delay@a
delay@a:	; 2 bytes @ 0x6
	ds	2
	global	??_delay
??_delay:	; 0 bytes @ 0x8
	global	??_main
??_main:	; 0 bytes @ 0x8
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	main@i_304
main@i_304:	; 2 bytes @ 0x0
	ds	2
;;Data sizes: Strings 0, constant 0, data 10, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      8       8
;; BANK0           80      2      12
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
;; Critical Paths under _ext in COMMON
;;
;;   _ext->i1_delay
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _ext in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _ext in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _ext in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _ext in BANK2
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
;; (0) _main                                                 4     4      0      90
;;                                              0 BANK0      2     2      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _delay                                                2     0      2      22
;;                                              6 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _ext                                                  4     4      0      60
;;                                              2 COMMON     4     4      0
;;                            i1_delay
;; ---------------------------------------------------------------------------------
;; (3) i1_delay                                              2     0      2      60
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _delay
;;
;; _ext (ROOT)
;;   i1_delay
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
;;DATA                 0      0      19      12        0.0%
;;ABS                  0      0      14       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       5       2        0.0%
;;BANK0               50      2       C       5       15.0%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      8       8       1       57.1%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 19 in file "C:\Users\blackrider\Desktop\PIC course\Interrupt 7seg & LED\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    0[BANK0 ] int 
;;  i               2    0        unsigned int 
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
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_delay
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\blackrider\Desktop\PIC course\Interrupt 7seg & LED\main.c"
	line	19
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	20
	
l1783:	
;main.c: 20: TRISD=0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	21
;main.c: 21: TRISC=0X00;
	clrf	(135)^080h	;volatile
	line	22
	
l1785:	
;main.c: 22: TRISB=0x01;
	movlw	(01h)
	movwf	(134)^080h	;volatile
	line	23
	
l1787:	
;main.c: 23: PORTC=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	24
	
l1789:	
;main.c: 24: GIE=1;
	bsf	(95/8),(95)&7
	line	25
	
l1791:	
;main.c: 25: INTE=1;
	bsf	(92/8),(92)&7
	line	26
	
l1793:	
;main.c: 26: RBPU=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1039/8)^080h,(1039)&7
	line	27
	
l1795:	
;main.c: 27: INTEDG=0;
	bcf	(1038/8)^080h,(1038)&7
	line	28
;main.c: 28: while(1)
	
l571:	
	line	30
;main.c: 29: {
;main.c: 30: for(int i=0;i<=9;i++)
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@i_304)
	movlw	high(0)
	movwf	((main@i_304))+1
	
l1797:	
	movf	(main@i_304+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u2215
	movlw	low(0Ah)
	subwf	(main@i_304),w
u2215:

	skipc
	goto	u2211
	goto	u2210
u2211:
	goto	l1801
u2210:
	goto	l571
	
l1799:	
	goto	l571
	line	31
	
l572:	
	line	32
	
l1801:	
;main.c: 31: {
;main.c: 32: PORTD=seg[i];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@i_304),w
	addlw	_seg&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(8)	;volatile
	line	33
	
l1803:	
;main.c: 33: delay(10000);
	movlw	low(02710h)
	movwf	(?_delay)
	movlw	high(02710h)
	movwf	((?_delay))+1
	fcall	_delay
	line	30
	
l1805:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@i_304),f
	skipnc
	incf	(main@i_304+1),f
	movlw	high(01h)
	addwf	(main@i_304+1),f
	
l1807:	
	movf	(main@i_304+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u2225
	movlw	low(0Ah)
	subwf	(main@i_304),w
u2225:

	skipc
	goto	u2221
	goto	u2220
u2221:
	goto	l1801
u2220:
	goto	l571
	
l573:	
	goto	l571
	line	35
	
l574:	
	line	28
	goto	l571
	
l575:	
	line	36
	
l576:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_delay
psect	text107,local,class=CODE,delta=2
global __ptext107
__ptext107:

;; *************** function _delay *****************
;; Defined at:
;;		line 3 in file "C:\Users\blackrider\Desktop\PIC course\Interrupt 7seg & LED\main.c"
;; Parameters:    Size  Location     Type
;;  a               2    6[COMMON] unsigned int 
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text107
	file	"C:\Users\blackrider\Desktop\PIC course\Interrupt 7seg & LED\main.c"
	line	3
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 5
; Regs used in _delay: [wreg]
	
l1779:	
	goto	l1781
	
l562:	
	goto	l1781
	
l561:	
	
l1781:	
	movlw	low(01h)
	subwf	(delay@a),f
	movlw	high(01h)
	skipc
	decf	(delay@a+1),f
	subwf	(delay@a+1),f
	movlw	high(0FFFFh)
	xorwf	((delay@a+1)),w
	skipz
	goto	u2205
	movlw	low(0FFFFh)
	xorwf	((delay@a)),w
u2205:

	skipz
	goto	u2201
	goto	u2200
u2201:
	goto	l1781
u2200:
	goto	l564
	
l563:	
	line	4
	
l564:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
	global	_ext
psect	text108,local,class=CODE,delta=2
global __ptext108
__ptext108:

;; *************** function _ext *****************
;; Defined at:
;;		line 7 in file "C:\Users\blackrider\Desktop\PIC course\Interrupt 7seg & LED\main.c"
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
;;      Temps:          4       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1_delay
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text108
	file	"C:\Users\blackrider\Desktop\PIC course\Interrupt 7seg & LED\main.c"
	line	7
	global	__size_of_ext
	__size_of_ext	equ	__end_of_ext-_ext
	
_ext:	
	opt	stack 5
; Regs used in _ext: [wreg+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	movf	status,w
	movwf	(??_ext+0)
	movf	fsr0,w
	movwf	(??_ext+1)
	movf	pclath,w
	movwf	(??_ext+2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_ext+3)
	ljmp	_ext
psect	text108
	line	8
	
i1l949:	
;main.c: 8: if(INTF==1)
	btfss	(89/8),(89)&7
	goto	u2_21
	goto	u2_20
u2_21:
	goto	i1l568
u2_20:
	line	10
	
i1l951:	
;main.c: 9: {
;main.c: 10: RC0=1;
	bsf	(56/8),(56)&7
	line	11
	
i1l953:	
;main.c: 11: delay(60000);
	movlw	low(0EA60h)
	movwf	(?i1_delay)
	movlw	high(0EA60h)
	movwf	((?i1_delay))+1
	fcall	i1_delay
	line	12
;main.c: 12: delay(60000);
	movlw	low(0EA60h)
	movwf	(?i1_delay)
	movlw	high(0EA60h)
	movwf	((?i1_delay))+1
	fcall	i1_delay
	line	13
	
i1l955:	
;main.c: 13: RC0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	15
	
i1l957:	
;main.c: 15: INTF=0;
	bcf	(89/8),(89)&7
	goto	i1l568
	line	16
	
i1l567:	
	line	17
	
i1l568:	
	movf	(??_ext+3),w
	movwf	btemp+1
	movf	(??_ext+2),w
	movwf	pclath
	movf	(??_ext+1),w
	movwf	fsr0
	movf	(??_ext+0),w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ext
	__end_of_ext:
;; =============== function _ext ends ============

	signat	_ext,88
	global	i1_delay
psect	text109,local,class=CODE,delta=2
global __ptext109
__ptext109:

;; *************** function i1_delay *****************
;; Defined at:
;;		line 3 in file "C:\Users\blackrider\Desktop\PIC course\Interrupt 7seg & LED\main.c"
;; Parameters:    Size  Location     Type
;;  delay           2    0[COMMON] unsigned int 
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
;;		_ext
;; This function uses a non-reentrant model
;;
psect	text109
	file	"C:\Users\blackrider\Desktop\PIC course\Interrupt 7seg & LED\main.c"
	line	3
	global	__size_ofi1_delay
	__size_ofi1_delay	equ	__end_ofi1_delay-i1_delay
	
i1_delay:	
	opt	stack 5
; Regs used in i1_delay: [wreg]
	
i1l1749:	
	goto	i1l1751
	
i1l562:	
	goto	i1l1751
	
i1l561:	
	
i1l1751:	
	movlw	low(01h)
	subwf	(i1delay@a),f
	movlw	high(01h)
	skipc
	decf	(i1delay@a+1),f
	subwf	(i1delay@a+1),f
	movlw	high(0FFFFh)
	xorwf	((i1delay@a+1)),w
	skipz
	goto	u217_25
	movlw	low(0FFFFh)
	xorwf	((i1delay@a)),w
u217_25:

	skipz
	goto	u217_21
	goto	u217_20
u217_21:
	goto	i1l1751
u217_20:
	goto	i1l564
	
i1l563:	
	line	4
	
i1l564:	
	return
	opt stack 0
GLOBAL	__end_ofi1_delay
	__end_ofi1_delay:
;; =============== function i1_delay ends ============

	signat	i1_delay,88
psect	text110,local,class=CODE,delta=2
global __ptext110
__ptext110:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
