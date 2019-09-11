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
	FNROOT	_main
	global	_RCREG
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:
_RCREG	set	26
	global	_RCSTA
_RCSTA	set	24
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_SPEN
_SPEN	set	199
	global	_SPBRG
_SPBRG	set	153
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_BRGH
_BRGH	set	1218
	file	"UART -Receive.as"
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
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	??_main
??_main:	; 0 bytes @ 0x0
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      0       0
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
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
;; (0) _main                                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 0
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       0       2        0.0%
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
psect	maintext

;; *************** function _main *****************
;; Defined at:
;;		line 6 in file "C:\Users\blackrider\Desktop\PIC course\UART\UART Receive\main.c"
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
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\blackrider\Desktop\PIC course\UART\UART Receive\main.c"
	line	6
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg+status,2]
	line	7
	
l935:	
;main.c: 7: TRISB=0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	8
	
l937:	
;main.c: 8: TRISC=0x80;
	movlw	(080h)
	movwf	(135)^080h	;volatile
	line	9
	
l939:	
;main.c: 9: SPEN=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	10
	
l941:	
;main.c: 10: SPBRG=25;
	movlw	(019h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	line	11
	
l943:	
;main.c: 11: BRGH=1;
	bsf	(1218/8)^080h,(1218)&7
	line	13
	
l945:	
;main.c: 13: RCSTA=0x90;
	movlw	(090h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(24)	;volatile
	line	14
	
l947:	
;main.c: 14: RB0=RB1=RB2=0;
	bcf	(50/8),(50)&7
	bcf	(49/8),(49)&7
	bcf	(48/8),(48)&7
	goto	l949
	line	15
;main.c: 15: while(1)
	
l559:	
	line	17
	
l949:	
;main.c: 16: {
;main.c: 17: if(RCREG==0x31)
	movf	(26),w	;volatile
	xorlw	031h
	skipz
	goto	u11
	goto	u10
u11:
	goto	l953
u10:
	line	19
	
l951:	
;main.c: 18: {
;main.c: 19: RB0=1;
	bsf	(48/8),(48)&7
	goto	l953
	line	20
	
l560:	
	line	21
	
l953:	
;main.c: 20: }
;main.c: 21: if(RCREG==0x32)
	movf	(26),w	;volatile
	xorlw	032h
	skipz
	goto	u21
	goto	u20
u21:
	goto	l957
u20:
	line	23
	
l955:	
;main.c: 22: {
;main.c: 23: RB1=1;
	bsf	(49/8),(49)&7
	goto	l957
	line	24
	
l561:	
	line	25
	
l957:	
;main.c: 24: }
;main.c: 25: if(RCREG==0x33)
	movf	(26),w	;volatile
	xorlw	033h
	skipz
	goto	u31
	goto	u30
u31:
	goto	l961
u30:
	line	27
	
l959:	
;main.c: 26: {
;main.c: 27: RB2=1;
	bsf	(50/8),(50)&7
	goto	l961
	line	28
	
l562:	
	line	29
	
l961:	
;main.c: 28: }
;main.c: 29: if(RCREG==0x34)
	movf	(26),w	;volatile
	xorlw	034h
	skipz
	goto	u41
	goto	u40
u41:
	goto	l949
u40:
	line	31
	
l963:	
;main.c: 30: {
;main.c: 31: RB0=RB1=RB2=0;
	bcf	(50/8),(50)&7
	bcf	(49/8),(49)&7
	bcf	(48/8),(48)&7
	goto	l949
	line	32
	
l563:	
	goto	l949
	line	33
	
l564:	
	line	15
	goto	l949
	
l565:	
	line	36
	
l566:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
psect	maintext
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
