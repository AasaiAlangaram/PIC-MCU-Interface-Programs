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
	FNCALL	_main,_PWM
	FNCALL	_PWM,___lbtoft
	FNCALL	_PWM,___ftmul
	FNCALL	_PWM,___fttol
	FNCALL	___lbtoft,___ftpack
	FNCALL	___ftmul,___ftpack
	FNROOT	_main
	global	_CCP1CON
psect	text106,local,class=CODE,delta=2
global __ptext106
__ptext106:
_CCP1CON	set	23
	global	_CCPR1L
_CCPR1L	set	21
	global	_T2CON
_T2CON	set	18
	global	_TMR2
_TMR2	set	17
	global	_TMR2IF
_TMR2IF	set	97
	global	_TMR2ON
_TMR2ON	set	146
	global	_PR2
_PR2	set	146
	global	_TRISC
_TRISC	set	135
	file	"PWM.as"
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
	global	?_PWM
?_PWM:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0x0
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0x0
	ds	3
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0x3
	ds	1
	global	___ftpack@sign
___ftpack@sign:	; 1 bytes @ 0x4
	ds	1
	global	??___ftpack
??___ftpack:	; 0 bytes @ 0x5
	ds	3
	global	?___fttol
?___fttol:	; 4 bytes @ 0x8
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0x8
	ds	4
	global	??___lbtoft
??___lbtoft:	; 0 bytes @ 0xC
	global	___lbtoft@c
___lbtoft@c:	; 1 bytes @ 0xC
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0xD
	global	??_PWM
??_PWM:	; 0 bytes @ 0xD
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??___fttol
??___fttol:	; 0 bytes @ 0x0
	ds	3
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x3
	ds	1
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x4
	ds	4
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0x8
	ds	1
	global	?___lbtoft
?___lbtoft:	; 3 bytes @ 0x9
	ds	3
	global	?___ftmul
?___ftmul:	; 3 bytes @ 0xC
	global	___ftmul@f1
___ftmul@f1:	; 3 bytes @ 0xC
	ds	3
	global	___ftmul@f2
___ftmul@f2:	; 3 bytes @ 0xF
	ds	3
	global	??___ftmul
??___ftmul:	; 0 bytes @ 0x12
	ds	3
	global	___ftmul@exp
___ftmul@exp:	; 1 bytes @ 0x15
	ds	1
	global	___ftmul@f3_as_product
___ftmul@f3_as_product:	; 3 bytes @ 0x16
	ds	3
	global	___ftmul@cntr
___ftmul@cntr:	; 1 bytes @ 0x19
	ds	1
	global	___ftmul@sign
___ftmul@sign:	; 1 bytes @ 0x1A
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      13
;; BANK0           80     27      27
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___ftmul	float  size(1) Largest target is 0
;;
;; ?___ftpack	float  size(1) Largest target is 0
;;
;; ?___fttol	long  size(1) Largest target is 0
;;
;; ?___lbtoft	float  size(1) Largest target is 0
;;


;; COMMON:	_PWM->___lbtoft
;; BANK0:	_PWM->___ftmul
;; Critical Paths (___lbtoft)
;; COMMON:	___lbtoft->___fttol
;; BANK0:	___lbtoft->___fttol

;; Critical Paths (___ftmul)
;; COMMON:	___ftmul->___lbtoft
;; BANK0:	___ftmul->___lbtoft

;; COMMON:	___fttol->___ftpack
;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0

;;
;;Call Graph Tables:

;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _main                                                 0     0      0    1018
;;                                _PWM
;; ---------------------------------------------------------------------------------
;; (1) _PWM                                                  0     0      0    1018
;;                           ___lbtoft
;;                            ___ftmul
;;                            ___fttol
;; ---------------------------------------------------------------------------------
;; (0) ___lbtoft                                             4     1      3     231
;;                                             12 COMMON     1     1      0
;;                                              9 BANK0      3     0      3
;;                           ___ftpack
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (0) ___ftmul                                             15     9      6     535
;;                                             12 BANK0     15     9      6
;;                           ___ftpack
;;                           ___lbtoft (ARG)
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (4294967295) ___fttol                                    13     9      4     252
;;                                              8 COMMON     4     0      4
;;                                              0 BANK0      9     9      0
;;                           ___ftpack (ARG)
;; ---------------------------------------------------------------------------------
;; (4294967295) ___ftpack                                    8     3      5     209
;;                                              0 COMMON     8     3      5
;; ---------------------------------------------------------------------------------
;; Estimated maximum call depth -1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; ___lbtoft (ROOT)
;;   ___ftpack
;;   ___fttol (ARG)
;;     ___ftpack (ARG)
;;
;; ___ftmul (ROOT)
;;   ___ftpack
;;   ___lbtoft (ARG)
;;     ___ftpack
;;     ___fttol (ARG)
;;       ___ftpack (ARG)
;;   ___fttol (ARG)
;;     ___ftpack (ARG)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;COMMON               E      D       D       1       92.9%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;BITBANK0            50      0       0       3        0.0%
;;BANK0               50     1B      1B       4       33.8%
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
;;		line 16 in file "C:\Users\Admin\Desktop\PIC\PIC course\PWM\main.c"
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
;;		On exit  : 7F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_PWM
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Admin\Desktop\PIC\PIC course\PWM\main.c"
	line	16
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	18
	
l1257:	
;main.c: 18: TRISC=0X00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(135)^080h	;volatile
	line	19
	
l1259:	
;main.c: 19: CCP1CON=0X0C;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(23)	;volatile
	line	22
	
l1261:	
;main.c: 21: {
;main.c: 22: PWM();
	fcall	_PWM
	goto	l1261
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

psect	maintext
	line	26
	signat	_main,88
	global	_PWM
psect	text107,local,class=CODE,delta=2
global __ptext107
__ptext107:

;; *************** function _PWM *****************
;; Defined at:
;;		line 3 in file "C:\Users\Admin\Desktop\PIC\PIC course\PWM\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 7F/0
;;		On exit  : 7F/0
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
;;		___lbtoft
;;		___ftmul
;;		___fttol
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text107
	file	"C:\Users\Admin\Desktop\PIC\PIC course\PWM\main.c"
	line	3
	global	__size_of_PWM
	__size_of_PWM	equ	__end_of_PWM-_PWM
	
_PWM:	
	opt	stack 2
; Regs used in _PWM: [wreg+status,2+status,0+pclath+cstack]
	line	4
	
l1247:	
;main.c: 4: PR2=100;
	movlw	(064h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	5
	
l1249:	
;main.c: 5: CCPR1L=(PR2*0.75);
	movlw	0x0
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?___ftmul)
	movlw	0x40
	movwf	(?___ftmul+1)
	movlw	0x3f
	movwf	(?___ftmul+2)
	bsf	status, 5	;RP0=1, select bank1
	movf	(146)^080h,w	;volatile
	fcall	___lbtoft
	bcf	status, 7	;select IRP bank0
	movf	(0+(?___lbtoft)),w
	movwf	0+(?___ftmul)+03h
	movf	(1+(?___lbtoft)),w
	movwf	1+(?___ftmul)+03h
	movf	(2+(?___lbtoft)),w
	movwf	2+(?___ftmul)+03h
	fcall	___ftmul
	movf	(0+(?___ftmul)),w
	movwf	(?___fttol)
	movf	(1+(?___ftmul)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftmul)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	movf	0+(((0+(?___fttol)))),w
	movwf	(21)	;volatile
	line	6
	
l1251:	
;main.c: 6: T2CON=0X79;
	movlw	(079h)
	movwf	(18)	;volatile
	line	7
	
l1253:	
;main.c: 7: TMR2=0;
	clrf	(17)	;volatile
	line	8
	
l1255:	
;main.c: 8: TMR2ON=1;
	bsf	(146/8),(146)&7
	line	9
;main.c: 9: while(TMR2IF==0);
	
l559:	
	btfss	(97/8),(97)&7
	goto	u481
	goto	u480
u481:
	goto	l559
u480:
	
l561:	
	line	10
;main.c: 10: TMR2IF=0;
	bcf	(97/8),(97)&7
	line	11
;main.c: 11: TMR2ON=0;
	bcf	(146/8),(146)&7
	line	13
	
l562:	
	return
	opt stack 0
GLOBAL	__end_of_PWM
	__end_of_PWM:
;; =============== function _PWM ends ============

	signat	_PWM,88
	global	___lbtoft
psect	text108,local,class=CODE,delta=2
global __ptext108
__ptext108:

;; *************** function ___lbtoft *****************
;; Defined at:
;;		line 28 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71\sources\lbtoft.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1   12[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  3    9[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 7F/20
;;		On exit  : 7F/0
;;		Unchanged: FFF80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       3       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_PWM
;; This function uses a non-reentrant model
;;
psect	text108
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71\sources\lbtoft.c"
	line	28
	global	__size_of___lbtoft
	__size_of___lbtoft	equ	__end_of___lbtoft-___lbtoft
	
___lbtoft:	
	opt	stack 1
; Regs used in ___lbtoft: [wreg+status,2+status,0+pclath+cstack]
;___lbtoft@c stored from wreg
	movwf	(___lbtoft@c)
	line	29
	
l1243:	
;lbtoft.c: 29: return __ftpack(c, 127+15, 0);
	movf	(___lbtoft@c),w
	movwf	(?___ftpack)
	clrf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	movlw	(08Eh)
	movwf	0+(?___ftpack)+03h
	clrf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?___lbtoft)
	movf	(1+(?___ftpack)),w
	movwf	(?___lbtoft+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___lbtoft+2)
	line	30
	
l702:	
	return
	opt stack 0
GLOBAL	__end_of___lbtoft
	__end_of___lbtoft:
;; =============== function ___lbtoft ends ============

	signat	___lbtoft,4219
	global	___ftmul
psect	text109,local,class=CODE,delta=2
global __ptext109
__ptext109:

;; *************** function ___ftmul *****************
;; Defined at:
;;		line 52 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71\sources\ftmul.c"
;; Parameters:    Size  Location     Type
;;  f1              3   12[BANK0 ] float 
;;  f2              3   15[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3_as_produc    3   22[BANK0 ] unsigned um
;;  sign            1   26[BANK0 ] unsigned char 
;;  cntr            1   25[BANK0 ] unsigned char 
;;  exp             1   21[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   12[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0      15       0       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_PWM
;; This function uses a non-reentrant model
;;
psect	text109
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71\sources\ftmul.c"
	line	52
	global	__size_of___ftmul
	__size_of___ftmul	equ	__end_of___ftmul-___ftmul
	
___ftmul:	
	opt	stack 1
; Regs used in ___ftmul: [wreg+status,2+status,0+pclath+cstack]
	line	56
	
l1187:	
;ftmul.c: 53: unsigned char exp, sign, cntr;
;ftmul.c: 54: unsigned short long f3_as_product;
;ftmul.c: 56: if((exp = (*(unsigned short long *)&f1) >> 15) == 0)
	movf	(___ftmul@f1),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f1+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f1+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(___ftmul@exp)
	movf	((___ftmul@exp)),f
	skipz
	goto	u401
	goto	u400
u401:
	goto	l1193
u400:
	line	57
	
l1189:	
;ftmul.c: 57: return 0.0;
	clrf	(?___ftmul)
	clrf	(?___ftmul+1)
	clrf	(?___ftmul+2)
	goto	l676
	line	58
	
l1193:	
;ftmul.c: 58: if((sign = (*(unsigned short long *)&f2) >> 15) == 0)
	movf	(___ftmul@f2),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f2+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f2+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(___ftmul@sign)
	movf	((___ftmul@sign)),f
	skipz
	goto	u411
	goto	u410
u411:
	goto	l1199
u410:
	line	59
	
l1195:	
;ftmul.c: 59: return 0.0;
	clrf	(?___ftmul)
	clrf	(?___ftmul+1)
	clrf	(?___ftmul+2)
	goto	l676
	line	60
	
l1199:	
;ftmul.c: 60: exp += sign-127-6;
	movf	(___ftmul@sign),w
	addlw	07Bh
	addwf	(___ftmul@exp),f
	line	61
	
l1201:	
;ftmul.c: 61: sign = (*(unsigned short long *)&f1) >> 16;
	movf	0+(((___ftmul@f1))+2),w
	movwf	(___ftmul@sign)
	line	62
	
l1203:	
;ftmul.c: 62: sign ^= (unsigned char)((*(unsigned short long *)&f2) >> 16);
	movf	0+(((___ftmul@f2))+2),w
	xorwf	(___ftmul@sign),f
	line	63
	
l1205:	
;ftmul.c: 63: sign &= 0x80;
	movlw	(080h)
	andwf	(___ftmul@sign),f
	line	64
	
l1207:	
;ftmul.c: 64: (*(unsigned short long *)&f1) |= 0x8000UL;
	bsf	(___ftmul@f1)+(15/8),(15)&7
	line	66
	
l1209:	
;ftmul.c: 66: (*(unsigned short long *)&f2) |= 0x8000UL;
	bsf	(___ftmul@f2)+(15/8),(15)&7
	line	67
	
l1211:	
;ftmul.c: 67: (*(unsigned short long *)&f2) &= 0xFFFFUL;
	movlw	0FFh
	andwf	(___ftmul@f2),f
	movlw	0FFh
	andwf	(___ftmul@f2+1),f
	movlw	0
	andwf	(___ftmul@f2+2),f
	line	68
	
l1213:	
;ftmul.c: 68: f3_as_product = 0;
	clrf	(___ftmul@f3_as_product)
	clrf	(___ftmul@f3_as_product+1)
	clrf	(___ftmul@f3_as_product+2)
	line	69
	
l1215:	
;ftmul.c: 69: cntr = 7;
	movlw	(07h)
	movwf	(___ftmul@cntr)
	line	71
	
l1217:	
;ftmul.c: 71: if((*(unsigned short long *)&f1) & 1)
	btfss	(___ftmul@f1),(0)&7
	goto	u421
	goto	u420
u421:
	goto	l1221
u420:
	line	72
	
l1219:	
;ftmul.c: 72: f3_as_product += (*(unsigned short long *)&f2);
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u431
	addwf	(___ftmul@f3_as_product+1),f
u431:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u432
	addwf	(___ftmul@f3_as_product+2),f
u432:

	line	73
	
l1221:	
;ftmul.c: 73: (*(unsigned short long *)&f1) >>= 1;
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	line	74
	
l1223:	
;ftmul.c: 74: (*(unsigned short long *)&f2) <<= 1;
	clrc
	rlf	(___ftmul@f2),f
	rlf	(___ftmul@f2+1),f
	rlf	(___ftmul@f2+2),f
	line	75
	
l1225:	
;ftmul.c: 75: } while(--cntr != 0);
	decfsz	(___ftmul@cntr),f
	goto	u441
	goto	u440
u441:
	goto	l1217
u440:
	line	76
	
l1227:	
;ftmul.c: 76: cntr = 9;
	movlw	(09h)
	movwf	(___ftmul@cntr)
	line	78
	
l1229:	
;ftmul.c: 78: if((*(unsigned short long *)&f1) & 1)
	btfss	(___ftmul@f1),(0)&7
	goto	u451
	goto	u450
u451:
	goto	l1233
u450:
	line	79
	
l1231:	
;ftmul.c: 79: f3_as_product += (*(unsigned short long *)&f2);
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u461
	addwf	(___ftmul@f3_as_product+1),f
u461:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u462
	addwf	(___ftmul@f3_as_product+2),f
u462:

	line	80
	
l1233:	
;ftmul.c: 80: (*(unsigned short long *)&f1) >>= 1;
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	line	81
	
l1235:	
;ftmul.c: 81: f3_as_product >>= 1;
	clrc
	rrf	(___ftmul@f3_as_product+2),f
	rrf	(___ftmul@f3_as_product+1),f
	rrf	(___ftmul@f3_as_product),f
	line	82
	
l1237:	
;ftmul.c: 82: } while(--cntr != 0);
	decfsz	(___ftmul@cntr),f
	goto	u471
	goto	u470
u471:
	goto	l1229
u470:
	line	83
	
l1239:	
;ftmul.c: 83: return __ftpack(f3_as_product, exp, sign);
	movf	(___ftmul@f3_as_product),w
	movwf	(?___ftpack)
	movf	(___ftmul@f3_as_product+1),w
	movwf	(?___ftpack+1)
	movf	(___ftmul@f3_as_product+2),w
	movwf	(?___ftpack+2)
	movf	(___ftmul@exp),w
	movwf	0+(?___ftpack)+03h
	movf	(___ftmul@sign),w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	movwf	(?___ftmul)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftmul+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftmul+2)
	line	84
	
l676:	
	return
	opt stack 0
GLOBAL	__end_of___ftmul
	__end_of___ftmul:
;; =============== function ___ftmul ends ============

	signat	___ftmul,8315
	global	___fttol
psect	text110,local,class=CODE,delta=2
global __ptext110
__ptext110:

;; *************** function ___fttol *****************
;; Defined at:
;;		line 45 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71\sources\fttol.c"
;; Parameters:    Size  Location     Type
;;  f1              3    8[COMMON] float 
;; Auto vars:     Size  Location     Type
;;  lval            4    4[BANK0 ] unsigned long 
;;  exp1            1    8[BANK0 ] unsigned char 
;;  sign1           1    3[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    8[COMMON] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         4       9       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; This function calls:
;; This function is called by:
;;		_PWM
;; This function uses a non-reentrant model
;;
psect	text110
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71\sources\fttol.c"
	line	45
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:	
	opt	stack 0
; Regs used in ___fttol: [wreg+status,2+status,0]
	line	49
	
l1149:	
;fttol.c: 46: unsigned char sign1, exp1;
;fttol.c: 47: unsigned long lval;
;fttol.c: 49: if((exp1 = (*(unsigned short long *)&f1) >> 15) == 0)
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	clrc
	rlf	(??___fttol+0)+1,w
	rlf	(??___fttol+0)+2,w
	movwf	(___fttol@exp1)
	movf	((___fttol@exp1)),f
	skipz
	goto	u321
	goto	u320
u321:
	goto	l1153
u320:
	line	50
	
l1151:	
;fttol.c: 50: return 0;
	clrf	(?___fttol)
	clrf	(?___fttol+1)
	clrf	(?___fttol+2)
	clrf	(?___fttol+3)
	goto	l687
	line	51
	
l1153:	
;fttol.c: 51: sign1 = (*(unsigned short long *)&f1) >> 23;
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u335:
	clrc
	rrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u330:
	addlw	-1
	skipz
	goto	u335
	movf	0+(??___fttol+0)+0,w
	movwf	(___fttol@sign1)
	line	52
	
l1155:	
;fttol.c: 52: (*(unsigned short long *)&f1) |= 0x8000UL;
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
l1157:	
;fttol.c: 53: (*(unsigned short long *)&f1) &= 0xFFFFUL;
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
l1159:	
;fttol.c: 54: lval = (*(unsigned short long *)&f1);
	movf	(___fttol@f1),w
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
l1161:	
;fttol.c: 55: exp1 -= 127+15;
	movlw	low(08Eh)
	subwf	(___fttol@exp1),f
	line	56
	
l1163:	
;fttol.c: 56: if((signed char)exp1 < 0) {
	btfss	(___fttol@exp1),7
	goto	u341
	goto	u340
u341:
	goto	l1173
u340:
	line	57
	
l1165:	
;fttol.c: 57: if((signed char)exp1 < -15)
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u351
	goto	u350
u351:
	goto	l1169
u350:
	goto	l1151
	line	60
	
l1169:	
;fttol.c: 60: lval >>= 1;
	clrc
	rrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	line	61
	
l1171:	
;fttol.c: 61: while(++exp1 != 0);
	incfsz	(___fttol@exp1),f
	goto	u361
	goto	u360
u361:
	goto	l1169
u360:
	goto	l1179
	line	63
	
l1173:	
;fttol.c: 63: if(exp1 >= 24)
	movlw	(018h)
	subwf	(___fttol@exp1),w
	skipc
	goto	u371
	goto	u370
u371:
	goto	l694
u370:
	goto	l1151
	line	66
	
l1177:	
;fttol.c: 66: lval <<= 1;
	clrc
	rlf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	line	67
;fttol.c: 67: exp1--;
	decf	(___fttol@exp1),f
	line	68
	
l694:	
	line	65
	movf	(___fttol@exp1),f
	skipz
	goto	u381
	goto	u380
u381:
	goto	l1177
u380:
	line	70
	
l1179:	
;fttol.c: 68: }
;fttol.c: 69: }
;fttol.c: 70: if(sign1)
	movf	(___fttol@sign1),w
	skipz
	goto	u390
	goto	l1183
u390:
	line	71
	
l1181:	
;fttol.c: 71: lval = -lval;
	comf	(___fttol@lval),f
	comf	(___fttol@lval+1),f
	comf	(___fttol@lval+2),f
	comf	(___fttol@lval+3),f
	incf	(___fttol@lval),f
	skipnz
	incf	(___fttol@lval+1),f
	skipnz
	incf	(___fttol@lval+2),f
	skipnz
	incf	(___fttol@lval+3),f
	line	72
	
l1183:	
;fttol.c: 72: return lval;
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	line	73
	
l687:	
	return
	opt stack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
;; =============== function ___fttol ends ============

	signat	___fttol,4220
	global	___ftpack
psect	text111,local,class=CODE,delta=2
global __ptext111
__ptext111:

;; *************** function ___ftpack *****************
;; Defined at:
;;		line 63 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71\sources\float.c"
;; Parameters:    Size  Location     Type
;;  arg             3    0[COMMON] unsigned um
;;  exp             1    3[COMMON] unsigned char 
;;  sign            1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    0[COMMON] float 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 5F/20
;;		On exit  : 5F/20
;;		Unchanged: FFFA0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         5       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		___ftmul
;;		___lbtoft
;; This function uses a non-reentrant model
;;
psect	text111
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71\sources\float.c"
	line	63
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:	
	opt	stack 0
; Regs used in ___ftpack: [wreg+status,2+status,0]
	line	64
	
l1121:	
;float.c: 64: if(exp == 0 || arg == 0)
	movf	(___ftpack@exp),w
	skipz
	goto	u250
	goto	l1125
u250:
	
l1123:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u261
	goto	u260
u261:
	goto	l1131
u260:
	line	65
	
l1125:	
;float.c: 65: return 0.0;
	clrf	(?___ftpack)
	clrf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	goto	l912
	line	67
	
l1129:	
;float.c: 67: exp++;
	incf	(___ftpack@exp),f
	line	68
;float.c: 68: arg >>= 1;
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	line	66
	
l1131:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u271
	goto	u270
u271:
	goto	l1129
u270:
	goto	l1135
	line	71
	
l1133:	
;float.c: 71: exp++;
	incf	(___ftpack@exp),f
	line	72
;float.c: 72: (arg)++;
	incf	(___ftpack@arg),f
	skipnz
	incf	(___ftpack@arg+1),f
	skipnz
	incf	(___ftpack@arg+2),f
	line	73
;float.c: 73: arg >>= 1;
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	line	70
	
l1135:	
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u281
	goto	u280
u281:
	goto	l1133
u280:
	goto	l1139
	line	76
	
l1137:	
;float.c: 76: exp--;
	decf	(___ftpack@exp),f
	line	77
;float.c: 77: arg <<= 1;
	clrc
	rlf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	line	75
	
l1139:	
	btfss	(___ftpack@arg+1),(15)&7
	goto	u291
	goto	u290
u291:
	goto	l1137
u290:
	
l921:	
	line	79
;float.c: 78: }
;float.c: 79: if(!(exp & 1))
	btfsc	(___ftpack@exp),(0)&7
	goto	u301
	goto	u300
u301:
	goto	l922
u300:
	line	80
	
l1141:	
;float.c: 80: arg &= ~0x8000L;
	bcf	(___ftpack@arg)+(15/8),(15)&7
	
l922:	
	line	81
;float.c: 81: exp >>= 1;
	clrc
	rrf	(___ftpack@exp),f
	line	82
	
l1143:	
;float.c: 82: arg |= (unsigned short long)exp << 16;
	movf	(___ftpack@exp),w
	movwf	((??___ftpack+0)+0+2)
	clrf	((??___ftpack+0)+0+1)
	clrf	((??___ftpack+0)+0+0)
	movf	0+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg),f
	movf	1+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+1),f
	movf	2+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+2),f
	line	83
	
l1145:	
;float.c: 83: if (sign)
	movf	(___ftpack@sign),w
	skipz
	goto	u310
	goto	l923
u310:
	line	84
	
l1147:	
;float.c: 84: arg |= 0x800000UL;
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
l923:	
	line	85
;float.c: 85: return *(float*)&arg;
	line	86
	
l912:	
	return
	opt stack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
;; =============== function ___ftpack ends ============

	signat	___ftpack,12411
psect	text112,local,class=CODE,delta=2
global __ptext112
__ptext112:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
