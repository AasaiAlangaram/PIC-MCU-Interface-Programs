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
	FNCALL	_main,_Timer0_Delay
	FNCALL	_Timer0_Delay,_reload
	FNROOT	_main
	FNCALL	_ISR,i1_reload
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_PORTB
psect	text58,local,class=CODE,delta=2
global __ptext58
__ptext58:
_PORTB	set	6
	global	_PORTD
_PORTD	set	8
	global	_TMR0
_TMR0	set	1
	global	_GIE
_GIE	set	95
	global	_T0IF
_T0IF	set	90
	global	_TMR0IE
_TMR0IE	set	93
	global	_TMR0IF
_TMR0IF	set	90
	global	_TRISD
_TRISD	set	136
	file	"Timer LED.as"
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
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	?_reload
?_reload:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	??i1_reload
??i1_reload:	; 0 bytes @ 0x0
	global	?i1_reload
?i1_reload:	; 0 bytes @ 0x0
	global	?_Timer0_Delay
?_Timer0_Delay:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	ds	2
	global	??_Timer0_Delay
??_Timer0_Delay:	; 0 bytes @ 0x2
	global	??_reload
??_reload:	; 0 bytes @ 0x2
	global	Timer0_Delay@i
Timer0_Delay@i:	; 2 bytes @ 0x2
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x4
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      4       4
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;; COMMON:	_main->_Timer0_Delay
;; Critical Paths (_Timer0_Delay)
;; Critical Paths (_ISR)
;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0

;;
;;Call Graph Tables:

;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (1) _main                                                 0     0      0      30
;;                       _Timer0_Delay
;; ---------------------------------------------------------------------------------
;; (0) _Timer0_Delay                                         2     2      0      30
;;                                              2 COMMON     2     2      0
;;                             _reload
;; ---------------------------------------------------------------------------------
;; (4294967295) _reload                                      0     0      0       0
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _ISR                                                  2     2      0       0
;;                                              0 COMMON     2     2      0
;;                           i1_reload
;; ---------------------------------------------------------------------------------
;; (4294967295) i1_reload                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum call depth -1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _Timer0_Delay (ROOT)
;;   _reload
;;
;; _ISR (ROOT)
;;   i1_reload
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;COMMON               E      4       4       1       28.6%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       6       2        0.0%
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
;;		line 28 in file "C:\Users\Admin\Desktop\PIC\PIC course\Timer LED\Timer LED.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_Timer0_Delay
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Admin\Desktop\PIC\PIC course\Timer LED\Timer LED.c"
	line	28
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg+status,2-btemp+0+pclath+cstack]
	line	29
	
l971:	
;Timer LED.c: 29: TRISD=0x00;PORTD=0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(136)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	clrf	(8)	;volatile
	line	34
	
l973:	
;Timer LED.c: 31: {
;Timer LED.c: 34: Timer0_Delay();
	fcall	_Timer0_Delay
	goto	l973
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

psect	maintext
	line	38
	signat	_main,88
	global	_Timer0_Delay
psect	text59,local,class=CODE,delta=2
global __ptext59
__ptext59:

;; *************** function _Timer0_Delay *****************
;; Defined at:
;;		line 4 in file "C:\Users\Admin\Desktop\PIC\PIC course\Timer LED\Timer LED.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    2[COMMON] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_reload
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text59
	file	"C:\Users\Admin\Desktop\PIC\PIC course\Timer LED\Timer LED.c"
	line	4
	global	__size_of_Timer0_Delay
	__size_of_Timer0_Delay	equ	__end_of_Timer0_Delay-_Timer0_Delay
	
_Timer0_Delay:	
	opt	stack 3
; Regs used in _Timer0_Delay: [wreg+status,2-btemp+0+pclath+cstack]
	
l959:	
	clrf	(Timer0_Delay@i)
	clrf	(Timer0_Delay@i+1)
	line	5
	
l561:	
	line	6
;Timer LED.c: 5: {
;Timer LED.c: 6: TMR0IE=1;
	bsf	(93/8),(93)&7
	line	7
;Timer LED.c: 7: GIE=1;
	bsf	(95/8),(95)&7
	line	8
;Timer LED.c: 12: PS0=PS1=PS2=1;
	bcf	(90/8),(90)&7
	line	13
	
l965:	
;Timer LED.c: 13: reload();
	fcall	_reload
	line	4
	
l967:	
	incf	(Timer0_Delay@i),f
	skipnz
	incf	(Timer0_Delay@i+1),f
	
l969:	
	movf	(Timer0_Delay@i+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(014h))^80h
	subwf	btemp+0,w
	skipz
	goto	u25
	movlw	low(014h)
	subwf	(Timer0_Delay@i),w
u25:

	skipc
	goto	u21
	goto	u20
u21:
	goto	l561
u20:
	line	18
	
l563:	
	return
	opt stack 0
GLOBAL	__end_of_Timer0_Delay
	__end_of_Timer0_Delay:
;; =============== function _Timer0_Delay ends ============

	signat	_Timer0_Delay,88
	global	_reload
psect	text60,local,class=CODE,delta=2
global __ptext60
__ptext60:

;; *************** function _reload *****************
;; Defined at:
;;		line 64 in file "C:\Users\Admin\Desktop\PIC\PIC course\Timer LED\Timer LED.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Timer0_Delay
;; This function uses a non-reentrant model
;;
psect	text60
	file	"C:\Users\Admin\Desktop\PIC\PIC course\Timer LED\Timer LED.c"
	line	64
	global	__size_of_reload
	__size_of_reload	equ	__end_of_reload-_reload
	
_reload:	
	opt	stack 2
; Regs used in _reload: [wreg]
	line	65
	
l945:	
;Timer LED.c: 65: TMR0=60;
	movlw	(03Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(1)	;volatile
	line	66
	
l576:	
	return
	opt stack 0
GLOBAL	__end_of_reload
	__end_of_reload:
;; =============== function _reload ends ============

	signat	_reload,88
	global	_ISR
psect	text61,local,class=CODE,delta=2
global __ptext61
__ptext61:

;; *************** function _ISR *****************
;; Defined at:
;;		line 20 in file "C:\Users\Admin\Desktop\PIC\PIC course\Timer LED\Timer LED.c"
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
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		i1_reload
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text61
	file	"C:\Users\Admin\Desktop\PIC\PIC course\Timer LED\Timer LED.c"
	line	20
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 1
; Regs used in _ISR: [wreg+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	movf	status,w
	movwf	(??_ISR+0)
	movf	pclath,w
	movwf	(??_ISR+1)
	ljmp	_ISR
psect	text61
	line	21
	
i1l951:	
;Timer LED.c: 21: if(TMR0IF==1)
	btfss	(90/8),(90)&7
	goto	u1_21
	goto	u1_20
u1_21:
	goto	i1l567
u1_20:
	line	23
	
i1l953:	
;Timer LED.c: 22: {
;Timer LED.c: 23: PORTB=0xff;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	24
	
i1l955:	
;Timer LED.c: 24: TMR0IF=0;reload();
	bcf	(90/8),(90)&7
	
i1l957:	
	fcall	i1_reload
	line	26
	
i1l567:	
	movf	(??_ISR+1),w
	movwf	pclath
	movf	(??_ISR+0),w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
	global	i1_reload
psect	text62,local,class=CODE,delta=2
global __ptext62
__ptext62:

;; *************** function i1_reload *****************
;; Defined at:
;;		line 64 in file "C:\Users\Admin\Desktop\PIC\PIC course\Timer LED\Timer LED.c"
;; Parameters:    Size  Location     Type
;;		None
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
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ISR
;; This function uses a non-reentrant model
;;
psect	text62
	file	"C:\Users\Admin\Desktop\PIC\PIC course\Timer LED\Timer LED.c"
	line	64
	global	__size_ofi1_reload
	__size_ofi1_reload	equ	__end_ofi1_reload-i1_reload
	
i1_reload:	
	opt	stack 0
; Regs used in i1_reload: [wreg]
	line	65
	
i1l949:	
;Timer LED.c: 65: TMR0=60;
	movlw	(03Ch)
	movwf	(1)	;volatile
	line	66
	
i1l576:	
	return
	opt stack 0
GLOBAL	__end_ofi1_reload
	__end_ofi1_reload:
;; =============== function i1_reload ends ============

	signat	i1_reload,88
psect	text63,local,class=CODE,delta=2
global __ptext63
__ptext63:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
