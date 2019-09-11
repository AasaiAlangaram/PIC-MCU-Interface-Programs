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
# 2 "D:\TI\PIC course\ADC & LCD\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 2 "D:\TI\PIC course\ADC & LCD\main.c"
	dw 0x3FFE & 0x3FFB & 0x3FFF & 0x3F7F ;#
	FNCALL	_main,_lcd_initialize
	FNCALL	_main,_display
	FNCALL	_main,_delay
	FNCALL	_main,_lcd_command
	FNCALL	_main,___lwmod
	FNCALL	_main,___lwdiv
	FNCALL	_main,_lcd_data
	FNCALL	_main,_PWM_1
	FNCALL	_main,_PWM_2
	FNCALL	_main,_PWM_3
	FNCALL	_PWM_1,___lbtoft
	FNCALL	_PWM_1,___ftmul
	FNCALL	_PWM_1,___fttol
	FNCALL	_PWM_2,___lbtoft
	FNCALL	_PWM_2,___ftmul
	FNCALL	_PWM_2,___fttol
	FNCALL	_PWM_3,___lbtoft
	FNCALL	_PWM_3,___ftmul
	FNCALL	_PWM_3,___fttol
	FNCALL	_display,_lcd_data
	FNCALL	_lcd_initialize,_lcd_command
	FNCALL	___lbtoft,___ftpack
	FNCALL	___ftmul,___ftpack
	FNCALL	_lcd_data,_delay
	FNCALL	_lcd_command,_delay
	FNROOT	_main
	global	_ADCON0
psect	text323,local,class=CODE,delta=2
global __ptext323
__ptext323:
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_CCP1CON
_CCP1CON	set	23
	global	_CCPR1L
_CCPR1L	set	21
	global	_PORTB
_PORTB	set	6
	global	_PORTD
_PORTD	set	8
	global	_T2CON
_T2CON	set	18
	global	_TMR2
_TMR2	set	17
	global	_ADIF
_ADIF	set	102
	global	_RD0
_RD0	set	64
	global	_RD1
_RD1	set	65
	global	_TMR1IF
_TMR1IF	set	96
	global	_TMR2IF
_TMR2IF	set	97
	global	_TMR2ON
_TMR2ON	set	146
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_PR2
_PR2	set	146
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
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
	retlw	65	;'A'
	retlw	68	;'D'
	retlw	67	;'C'
	retlw	32	;' '
	retlw	84	;'T'
	retlw	69	;'E'
	retlw	83	;'S'
	retlw	84	;'T'
	retlw	0
psect	strings
	file	"ADC & LCD.as"
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
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	?_lcd_data
?_lcd_data:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_lcd_initialize
?_lcd_initialize:	; 0 bytes @ 0x0
	global	?_PWM_3
?_PWM_3:	; 0 bytes @ 0x0
	global	?_PWM_2
?_PWM_2:	; 0 bytes @ 0x0
	global	?_lcd_command
?_lcd_command:	; 0 bytes @ 0x0
	global	?_PWM_1
?_PWM_1:	; 0 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x0
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0x0
	global	delay@a
delay@a:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x0
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0x0
	ds	2
	global	??_lcd_data
??_lcd_data:	; 0 bytes @ 0x2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	??_lcd_command
??_lcd_command:	; 0 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x2
	ds	1
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0x3
	ds	1
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0x4
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x4
	global	lcd_command@temp
lcd_command@temp:	; 1 bytes @ 0x4
	global	lcd_data@temp1
lcd_data@temp1:	; 1 bytes @ 0x4
	global	___ftpack@sign
___ftpack@sign:	; 1 bytes @ 0x4
	ds	1
	global	??___ftpack
??___ftpack:	; 0 bytes @ 0x5
	global	lcd_data@data
lcd_data@data:	; 1 bytes @ 0x5
	global	lcd_command@command
lcd_command@command:	; 1 bytes @ 0x5
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x5
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	1
	global	?_display
?_display:	; 0 bytes @ 0x6
	global	??_lcd_initialize
??_lcd_initialize:	; 0 bytes @ 0x6
	global	display@len
display@len:	; 1 bytes @ 0x6
	ds	1
	global	??_display
??_display:	; 0 bytes @ 0x7
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x7
	ds	1
	global	?___fttol
?___fttol:	; 4 bytes @ 0x8
	global	display@word
display@word:	; 1 bytes @ 0x8
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0x8
	ds	1
	global	display@a
display@a:	; 1 bytes @ 0x9
	ds	3
	global	___lbtoft@c
___lbtoft@c:	; 1 bytes @ 0xC
	ds	1
	global	??_PWM_1
??_PWM_1:	; 0 bytes @ 0xD
	global	??_PWM_3
??_PWM_3:	; 0 bytes @ 0xD
	global	??_PWM_2
??_PWM_2:	; 0 bytes @ 0xD
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??___fttol
??___fttol:	; 0 bytes @ 0x0
	ds	4
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x4
	ds	1
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x5
	ds	4
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0x9
	ds	1
	global	?___lbtoft
?___lbtoft:	; 3 bytes @ 0xA
	ds	3
	global	??___lbtoft
??___lbtoft:	; 0 bytes @ 0xD
	ds	4
	global	?___ftmul
?___ftmul:	; 3 bytes @ 0x11
	global	___ftmul@f1
___ftmul@f1:	; 3 bytes @ 0x11
	ds	3
	global	___ftmul@f2
___ftmul@f2:	; 3 bytes @ 0x14
	ds	3
	global	??___ftmul
??___ftmul:	; 0 bytes @ 0x17
	ds	4
	global	___ftmul@exp
___ftmul@exp:	; 1 bytes @ 0x1B
	ds	1
	global	___ftmul@f3_as_product
___ftmul@f3_as_product:	; 3 bytes @ 0x1C
	ds	3
	global	___ftmul@cntr
___ftmul@cntr:	; 1 bytes @ 0x1F
	ds	1
	global	___ftmul@sign
___ftmul@sign:	; 1 bytes @ 0x20
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x21
	ds	2
	global	main@c
main@c:	; 2 bytes @ 0x23
	ds	2
	global	main@e
main@e:	; 2 bytes @ 0x25
	ds	2
	global	main@f
main@f:	; 2 bytes @ 0x27
	ds	2
	global	main@a
main@a:	; 2 bytes @ 0x29
	ds	2
	global	main@d
main@d:	; 2 bytes @ 0x2B
	ds	2
	global	main@b
main@b:	; 2 bytes @ 0x2D
	ds	2
	global	main@temp
main@temp:	; 2 bytes @ 0x2F
	ds	2
;;Data sizes: Strings 9, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      13
;; BANK0           80     49      49
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
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; display@word	PTR const unsigned char  size(1) Largest target is 9
;;		 -> STR_1(CODE[9]), 
;;


;; COMMON:	_PWM_1->___lbtoft
;; BANK0:	_PWM_1->___ftmul
;; COMMON:	_PWM_2->___lbtoft
;; BANK0:	_PWM_2->___ftmul
;; COMMON:	_PWM_3->___lbtoft
;; BANK0:	_PWM_3->___ftmul
;; COMMON:	_display->_lcd_data
;; COMMON:	_lcd_initialize->_lcd_command
;; Critical Paths (___lbtoft)
;; COMMON:	___lbtoft->___fttol
;; BANK0:	___lbtoft->___fttol

;; Critical Paths (___ftmul)
;; COMMON:	___ftmul->___lbtoft
;; BANK0:	___ftmul->___lbtoft

;; Critical Paths (_lcd_data)
;; COMMON:	_lcd_data->_delay

;; Critical Paths (_lcd_command)
;; COMMON:	_lcd_command->_delay

;; COMMON:	___fttol->___ftpack
;;
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0

;;
;;Call Graph Tables:

;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _main                                                18    18      0    4203
;;                                             33 BANK0     16    16      0
;;                     _lcd_initialize
;;                            _display
;;                              _delay
;;                        _lcd_command
;;                            ___lwmod
;;                            ___lwdiv
;;                           _lcd_data
;;                              _PWM_1
;;                              _PWM_2
;;                              _PWM_3
;; ---------------------------------------------------------------------------------
;; (1) _PWM_1                                                0     0      0    1018
;;                           ___lbtoft
;;                            ___ftmul
;;                            ___fttol
;; ---------------------------------------------------------------------------------
;; (1) _PWM_2                                                0     0      0    1018
;;                           ___lbtoft
;;                            ___ftmul
;;                            ___fttol
;; ---------------------------------------------------------------------------------
;; (1) _PWM_3                                                0     0      0    1018
;;                           ___lbtoft
;;                            ___ftmul
;;                            ___fttol
;; ---------------------------------------------------------------------------------
;; (1) _display                                              4     3      1     179
;;                                              6 COMMON     4     3      1
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_initialize                                       0     0      0      89
;;                        _lcd_command
;; ---------------------------------------------------------------------------------
;; (0) ___lbtoft                                             8     5      3     231
;;                                             12 COMMON     1     1      0
;;                                             10 BANK0      7     4      3
;;                           ___ftpack
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (0) ___ftmul                                             16    10      6     535
;;                                             17 BANK0     16    10      6
;;                           ___ftpack
;;                           ___lbtoft (ARG)
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (0) _lcd_data                                             4     4      0      89
;;                                              2 COMMON     4     4      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (0) _lcd_command                                          4     4      0      89
;;                                              2 COMMON     4     4      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (4294967295) ___fttol                                    14    10      4     252
;;                                              8 COMMON     4     0      4
;;                                              0 BANK0     10    10      0
;;                           ___ftpack (ARG)
;; ---------------------------------------------------------------------------------
;; (4294967295) ___ftpack                                    8     3      5     209
;;                                              0 COMMON     8     3      5
;; ---------------------------------------------------------------------------------
;; (4294967295) _delay                                       2     0      2      22
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; (4294967295) ___lwdiv                                     8     4      4     162
;;                                              0 COMMON     8     4      4
;; ---------------------------------------------------------------------------------
;; (4294967295) ___lwmod                                     6     2      4     159
;;                                              0 COMMON     6     2      4
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
;;COMMON               E      D       D       1       92.9%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;BITBANK0            50      0       0       3        0.0%
;;BANK0               50     31      31       4       61.3%
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
;;		line 8 in file "D:\TI\PIC course\ADC & LCD\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  temp            2   47[BANK0 ] unsigned int 
;;  d               2   43[BANK0 ] unsigned int 
;;  b               2   45[BANK0 ] unsigned int 
;;  f               2   39[BANK0 ] unsigned int 
;;  e               2   37[BANK0 ] unsigned int 
;;  c               2   35[BANK0 ] unsigned int 
;;  a               2   41[BANK0 ] unsigned int 
;;  z               2    0        unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0      14       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0      16       0       0       0
;;Total ram usage:       16 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_initialize
;;		_display
;;		_delay
;;		_lcd_command
;;		___lwmod
;;		___lwdiv
;;		_lcd_data
;;		_PWM_1
;;		_PWM_2
;;		_PWM_3
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\TI\PIC course\ADC & LCD\main.c"
	line	8
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2-btemp+0+pclath+cstack]
	line	11
	
l2659:	
;main.c: 9: unsigned int temp,a,b,c,d,e,f,z;
;main.c: 11: ADCON1=0x8E;
	movlw	(08Eh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	12
;main.c: 12: ADCON0=0x41;
	movlw	(041h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	13
	
l2661:	
;main.c: 13: TRISD=0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	14
	
l2663:	
;main.c: 14: PORTD=0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	15
;main.c: 15: TRISA=0xFF;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	16
	
l2665:	
;main.c: 16: TRISB=0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	17
	
l2667:	
;main.c: 17: PORTB=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	18
	
l2669:	
;main.c: 18: TRISC=0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	19
	
l2671:	
;main.c: 19: lcd_initialize();
	fcall	_lcd_initialize
	line	20
	
l2673:	
;main.c: 20: display("ADC TEST",7);
	movlw	(07h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_display)
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_display
	line	21
	
l2675:	
;main.c: 21: delay(100000);
	movlw	low(086A0h)
	movwf	(?_delay)
	movlw	high(086A0h)
	movwf	((?_delay))+1
	fcall	_delay
	line	22
	
l2677:	
;main.c: 22: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	23
;main.c: 23: while(1)
	
l598:	
	line	25
	
l2679:	
;main.c: 24: {
;main.c: 25: delay(1000);
	movlw	low(03E8h)
	movwf	(?_delay)
	movlw	high(03E8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	26
	
l2681:	
;main.c: 26: ADCON0=(ADCON0|0x04);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(31),w	;volatile
	iorlw	04h
	movwf	(31)	;volatile
	line	27
;main.c: 27: while(ADIF==0);
	goto	l599
	
l600:	
	
l599:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(102/8),(102)&7
	goto	u3231
	goto	u3230
u3231:
	goto	l600
u3230:
	
l601:	
	line	28
	
l2683:	
;main.c: 28: temp=ADRESH<<8;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(30),w	;volatile
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movlw	08h
	movwf	btemp+0
u3245:
	clrc
	rlf	(??_main+0)+0,f
	rlf	(??_main+0)+1,f
	decfsz	btemp+0,f
	goto	u3245
	movf	0+(??_main+0)+0,w
	movwf	(main@temp)
	movf	1+(??_main+0)+0,w
	movwf	(main@temp+1)
	line	29
	
l2685:	
;main.c: 29: temp=temp+ADRESL;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@temp),w
	movwf	(main@temp)
	movf	(main@temp+1),w
	skipnc
	incf	(main@temp+1),w
	movwf	((main@temp))+1
	line	30
	
l2687:	
;main.c: 30: ADIF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(102/8),(102)&7
	line	31
	
l2689:	
;main.c: 31: a=temp%10;
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@temp+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(main@temp),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(1+(?___lwmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@a+1)
	addwf	(main@a+1)
	movf	(0+(?___lwmod)),w
	clrf	(main@a)
	addwf	(main@a)

	line	32
	
l2691:	
;main.c: 32: b=temp/10;
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@temp+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(main@temp),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@b+1)
	addwf	(main@b+1)
	movf	(0+(?___lwdiv)),w
	clrf	(main@b)
	addwf	(main@b)

	line	33
	
l2693:	
;main.c: 33: c=b%10;
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@b+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(main@b),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(1+(?___lwmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@c+1)
	addwf	(main@c+1)
	movf	(0+(?___lwmod)),w
	clrf	(main@c)
	addwf	(main@c)

	line	34
	
l2695:	
;main.c: 34: d=b/10;
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@b+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(main@b),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@d+1)
	addwf	(main@d+1)
	movf	(0+(?___lwdiv)),w
	clrf	(main@d)
	addwf	(main@d)

	line	35
	
l2697:	
;main.c: 35: e=d%10;
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@d+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(main@d),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(1+(?___lwmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@e+1)
	addwf	(main@e+1)
	movf	(0+(?___lwmod)),w
	clrf	(main@e)
	addwf	(main@e)

	line	36
	
l2699:	
;main.c: 36: f=d/10;
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@d+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(main@d),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@f+1)
	addwf	(main@f+1)
	movf	(0+(?___lwdiv)),w
	clrf	(main@f)
	addwf	(main@f)

	line	38
	
l2701:	
;main.c: 38: lcd_command(0x80);
	movlw	(080h)
	fcall	_lcd_command
	line	39
	
l2703:	
;main.c: 39: lcd_data(f+0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@f),w
	addlw	030h
	fcall	_lcd_data
	line	40
	
l2705:	
;main.c: 40: lcd_data(e+0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@e),w
	addlw	030h
	fcall	_lcd_data
	line	41
	
l2707:	
;main.c: 41: lcd_data(c+0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@c),w
	addlw	030h
	fcall	_lcd_data
	line	42
	
l2709:	
;main.c: 42: lcd_data(a+0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@a),w
	addlw	030h
	fcall	_lcd_data
	line	43
	
l2711:	
;main.c: 43: delay(60000);
	movlw	low(0EA60h)
	movwf	(?_delay)
	movlw	high(0EA60h)
	movwf	((?_delay))+1
	fcall	_delay
	line	44
	
l2713:	
;main.c: 44: if(temp>250 && temp<499)
	movlw	high(0FBh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(main@temp+1),w
	movlw	low(0FBh)
	skipnz
	subwf	(main@temp),w
	skipc
	goto	u3251
	goto	u3250
u3251:
	goto	l602
u3250:
	
l2715:	
	movlw	high(01F3h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(main@temp+1),w
	movlw	low(01F3h)
	skipnz
	subwf	(main@temp),w
	skipnc
	goto	u3261
	goto	u3260
u3261:
	goto	l602
u3260:
	line	46
	
l2717:	
;main.c: 45: {
;main.c: 46: PORTB=0X01;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	47
;main.c: 47: CCP1CON=0X2C;
	movlw	(02Ch)
	movwf	(23)	;volatile
	line	48
	
l2719:	
;main.c: 48: PWM_1();
	fcall	_PWM_1
	line	51
;main.c: 51: }
	goto	l603
	line	52
	
l602:	
	
l2721:	
;main.c: 52: else if(temp>500 && temp<749)
	movlw	high(01F5h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(main@temp+1),w
	movlw	low(01F5h)
	skipnz
	subwf	(main@temp),w
	skipc
	goto	u3271
	goto	u3270
u3271:
	goto	l604
u3270:
	
l2723:	
	movlw	high(02EDh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(main@temp+1),w
	movlw	low(02EDh)
	skipnz
	subwf	(main@temp),w
	skipnc
	goto	u3281
	goto	u3280
u3281:
	goto	l604
u3280:
	line	54
	
l2725:	
;main.c: 53: {
;main.c: 54: PORTB=0x02;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	55
;main.c: 55: CCP1CON=0X2C;
	movlw	(02Ch)
	movwf	(23)	;volatile
	line	56
	
l2727:	
;main.c: 56: PWM_2();
	fcall	_PWM_2
	line	59
;main.c: 59: }
	goto	l605
	line	60
	
l604:	
	
l2729:	
;main.c: 60: else if(temp>750)
	movlw	high(02EFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(main@temp+1),w
	movlw	low(02EFh)
	skipnz
	subwf	(main@temp),w
	skipc
	goto	u3291
	goto	u3290
u3291:
	goto	l606
u3290:
	line	62
	
l2731:	
;main.c: 61: {
;main.c: 62: PORTB=0x04;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	63
;main.c: 63: CCP1CON=0X2C;
	movlw	(02Ch)
	movwf	(23)	;volatile
	line	64
	
l2733:	
;main.c: 64: PWM_3();
	fcall	_PWM_3
	line	66
;main.c: 66: }
	goto	l607
	line	67
	
l606:	
	line	69
	
l2735:	
;main.c: 67: else
;main.c: 68: {
;main.c: 69: PORTB=0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	70
	
l607:	
	
l605:	
	
l603:	
	line	72
	
l608:	
	line	23
	goto	l598
	
l609:	
	line	73
	
l610:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_PWM_1
psect	text324,local,class=CODE,delta=2
global __ptext324
__ptext324:

;; *************** function _PWM_1 *****************
;; Defined at:
;;		line 2 in file "D:\TI\PIC course\ADC & LCD\pwm.h"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___lbtoft
;;		___ftmul
;;		___fttol
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text324
	file	"D:\TI\PIC course\ADC & LCD\pwm.h"
	line	2
	global	__size_of_PWM_1
	__size_of_PWM_1	equ	__end_of_PWM_1-_PWM_1
	
_PWM_1:	
	opt	stack 2
; Regs used in _PWM_1: [wreg+status,2+status,0+pclath+cstack]
	line	4
	
l2619:	
;pwm.h: 4: PR2=10;
	movlw	(0Ah)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	5
	
l2621:	
;pwm.h: 5: CCPR1L=(PR2*0.25);
	movlw	0x0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftmul)
	movlw	0x80
	movwf	(?___ftmul+1)
	movlw	0x3e
	movwf	(?___ftmul+2)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(146)^080h,w	;volatile
	fcall	___lbtoft
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lbtoft)),w
	movwf	0+(?___ftmul)+03h
	movf	(1+(?___lbtoft)),w
	movwf	1+(?___ftmul)+03h
	movf	(2+(?___lbtoft)),w
	movwf	2+(?___ftmul)+03h
	fcall	___ftmul
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	(?___fttol)
	movf	(1+(?___ftmul)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftmul)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	movf	0+(((0+(?___fttol)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	6
	
l2623:	
;pwm.h: 6: T2CON=0X7B;
	movlw	(07Bh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(18)	;volatile
	line	7
	
l2625:	
;pwm.h: 7: TMR2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(17)	;volatile
	line	8
	
l2627:	
;pwm.h: 8: TMR2ON=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(146/8),(146)&7
	line	9
;pwm.h: 9: while(TMR1IF==0);
	goto	l580
	
l581:	
	
l580:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(96/8),(96)&7
	goto	u3191
	goto	u3190
u3191:
	goto	l581
u3190:
	
l582:	
	line	10
;pwm.h: 10: TMR2IF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(97/8),(97)&7
	line	11
;pwm.h: 11: TMR2ON=0;
	bcf	(146/8),(146)&7
	line	13
	
l583:	
	return
	opt stack 0
GLOBAL	__end_of_PWM_1
	__end_of_PWM_1:
;; =============== function _PWM_1 ends ============

	signat	_PWM_1,88
	global	_PWM_2
psect	text325,local,class=CODE,delta=2
global __ptext325
__ptext325:

;; *************** function _PWM_2 *****************
;; Defined at:
;;		line 15 in file "D:\TI\PIC course\ADC & LCD\pwm.h"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___lbtoft
;;		___ftmul
;;		___fttol
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text325
	file	"D:\TI\PIC course\ADC & LCD\pwm.h"
	line	15
	global	__size_of_PWM_2
	__size_of_PWM_2	equ	__end_of_PWM_2-_PWM_2
	
_PWM_2:	
	opt	stack 2
; Regs used in _PWM_2: [wreg+status,2+status,0+pclath+cstack]
	line	16
	
l2639:	
;pwm.h: 16: PR2=10;
	movlw	(0Ah)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	17
	
l2641:	
;pwm.h: 17: CCPR1L=(PR2*0.50);
	movlw	0x0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x3f
	movwf	(?___ftmul+2)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(146)^080h,w	;volatile
	fcall	___lbtoft
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lbtoft)),w
	movwf	0+(?___ftmul)+03h
	movf	(1+(?___lbtoft)),w
	movwf	1+(?___ftmul)+03h
	movf	(2+(?___lbtoft)),w
	movwf	2+(?___ftmul)+03h
	fcall	___ftmul
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	(?___fttol)
	movf	(1+(?___ftmul)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftmul)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	movf	0+(((0+(?___fttol)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	18
	
l2643:	
;pwm.h: 18: T2CON=0X7B;
	movlw	(07Bh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(18)	;volatile
	line	19
	
l2645:	
;pwm.h: 19: TMR2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(17)	;volatile
	line	20
	
l2647:	
;pwm.h: 20: TMR2ON=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(146/8),(146)&7
	line	21
;pwm.h: 21: while(TMR1IF==0);
	goto	l586
	
l587:	
	
l586:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(96/8),(96)&7
	goto	u3211
	goto	u3210
u3211:
	goto	l587
u3210:
	
l588:	
	line	22
;pwm.h: 22: TMR2IF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(97/8),(97)&7
	line	23
;pwm.h: 23: TMR2ON=0;
	bcf	(146/8),(146)&7
	line	25
	
l589:	
	return
	opt stack 0
GLOBAL	__end_of_PWM_2
	__end_of_PWM_2:
;; =============== function _PWM_2 ends ============

	signat	_PWM_2,88
	global	_PWM_3
psect	text326,local,class=CODE,delta=2
global __ptext326
__ptext326:

;; *************** function _PWM_3 *****************
;; Defined at:
;;		line 27 in file "D:\TI\PIC course\ADC & LCD\pwm.h"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___lbtoft
;;		___ftmul
;;		___fttol
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text326
	file	"D:\TI\PIC course\ADC & LCD\pwm.h"
	line	27
	global	__size_of_PWM_3
	__size_of_PWM_3	equ	__end_of_PWM_3-_PWM_3
	
_PWM_3:	
	opt	stack 2
; Regs used in _PWM_3: [wreg+status,2+status,0+pclath+cstack]
	line	28
	
l2629:	
;pwm.h: 28: PR2=10;
	movlw	(0Ah)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	29
	
l2631:	
;pwm.h: 29: CCPR1L=(PR2*0.90);
	movlw	0x66
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftmul)
	movlw	0x66
	movwf	(?___ftmul+1)
	movlw	0x3f
	movwf	(?___ftmul+2)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(146)^080h,w	;volatile
	fcall	___lbtoft
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lbtoft)),w
	movwf	0+(?___ftmul)+03h
	movf	(1+(?___lbtoft)),w
	movwf	1+(?___ftmul)+03h
	movf	(2+(?___lbtoft)),w
	movwf	2+(?___ftmul)+03h
	fcall	___ftmul
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	(?___fttol)
	movf	(1+(?___ftmul)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftmul)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	movf	0+(((0+(?___fttol)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	30
	
l2633:	
;pwm.h: 30: T2CON=0X7B;
	movlw	(07Bh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(18)	;volatile
	line	31
	
l2635:	
;pwm.h: 31: TMR2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(17)	;volatile
	line	32
	
l2637:	
;pwm.h: 32: TMR2ON=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(146/8),(146)&7
	line	33
;pwm.h: 33: while(TMR1IF==0);
	goto	l592
	
l593:	
	
l592:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(96/8),(96)&7
	goto	u3201
	goto	u3200
u3201:
	goto	l593
u3200:
	
l594:	
	line	34
;pwm.h: 34: TMR2IF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(97/8),(97)&7
	line	35
;pwm.h: 35: TMR2ON=0;
	bcf	(146/8),(146)&7
	line	37
	
l595:	
	return
	opt stack 0
GLOBAL	__end_of_PWM_3
	__end_of_PWM_3:
;; =============== function _PWM_3 ends ============

	signat	_PWM_3,88
	global	_display
psect	text327,local,class=CODE,delta=2
global __ptext327
__ptext327:

;; *************** function _display *****************
;; Defined at:
;;		line 55 in file "D:\TI\PIC course\ADC & LCD\LCD 4 BIT.h"
;; Parameters:    Size  Location     Type
;;  word            1    wreg     PTR const unsigned char 
;;		 -> STR_1(9), 
;;  len             1    6[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  word            1    8[COMMON] PTR const unsigned char 
;;		 -> STR_1(9), 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text327
	file	"D:\TI\PIC course\ADC & LCD\LCD 4 BIT.h"
	line	55
	global	__size_of_display
	__size_of_display	equ	__end_of_display-_display
	
_display:	
	opt	stack 2
; Regs used in _display: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;display@word stored from wreg
	line	57
	movwf	(display@word)
	
l2651:	
;LCD 4 BIT.h: 56: unsigned char a;
;LCD 4 BIT.h: 57: for(a=0;a<=len;a++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(display@a)
	goto	l574
	line	58
	
l575:	
	line	59
	
l2653:	
;LCD 4 BIT.h: 58: {
;LCD 4 BIT.h: 59: lcd_data(word[a]);
	movf	(display@a),w
	addwf	(display@word),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	line	57
	
l2655:	
	movlw	(01h)
	movwf	(??_display+0)+0
	movf	(??_display+0)+0,w
	addwf	(display@a),f
	
l574:	
	
l2657:	
	movf	(display@a),w
	subwf	(display@len),w
	skipnc
	goto	u3221
	goto	u3220
u3221:
	goto	l575
u3220:
	
l576:	
	line	62
	
l577:	
	return
	opt stack 0
GLOBAL	__end_of_display
	__end_of_display:
;; =============== function _display ends ============

	signat	_display,8312
	global	_lcd_initialize
psect	text328,local,class=CODE,delta=2
global __ptext328
__ptext328:

;; *************** function _lcd_initialize *****************
;; Defined at:
;;		line 46 in file "D:\TI\PIC course\ADC & LCD\LCD 4 BIT.h"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_command
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text328
	file	"D:\TI\PIC course\ADC & LCD\LCD 4 BIT.h"
	line	46
	global	__size_of_lcd_initialize
	__size_of_lcd_initialize	equ	__end_of_lcd_initialize-_lcd_initialize
	
_lcd_initialize:	
	opt	stack 2
; Regs used in _lcd_initialize: [wreg+status,2+status,0+pclath+cstack]
	line	47
	
l2649:	
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
	
l571:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_initialize
	__end_of_lcd_initialize:
;; =============== function _lcd_initialize ends ============

	signat	_lcd_initialize,88
	global	___lbtoft
psect	text329,local,class=CODE,delta=2
global __ptext329
__ptext329:

;; *************** function ___lbtoft *****************
;; Defined at:
;;		line 28 in file "C:\Program Files\HI-TECH Software\PICC\9.71\sources\lbtoft.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1   12[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   10[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         1       7       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_PWM_1
;;		_PWM_2
;;		_PWM_3
;; This function uses a non-reentrant model
;;
psect	text329
	file	"C:\Program Files\HI-TECH Software\PICC\9.71\sources\lbtoft.c"
	line	28
	global	__size_of___lbtoft
	__size_of___lbtoft	equ	__end_of___lbtoft-___lbtoft
	
___lbtoft:	
	opt	stack 1
; Regs used in ___lbtoft: [wreg+status,2+status,0+pclath+cstack]
;___lbtoft@c stored from wreg
	movwf	(___lbtoft@c)
	line	29
	
l2565:	
;lbtoft.c: 29: return __ftpack(c, 127+15, 0);
	movf	(___lbtoft@c),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((??___lbtoft+0)+0)
	clrf	((??___lbtoft+0)+0+1)
	clrf	((??___lbtoft+0)+0+2)
	movf	0+(??___lbtoft+0)+0,w
	movwf	(?___ftpack)
	movf	1+(??___lbtoft+0)+0,w
	movwf	(?___ftpack+1)
	movf	2+(??___lbtoft+0)+0,w
	movwf	(?___ftpack+2)
	movlw	(08Eh)
	movwf	(??___lbtoft+3)+0
	movf	(??___lbtoft+3)+0,w
	movwf	0+(?___ftpack)+03h
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lbtoft)
	movf	(1+(?___ftpack)),w
	movwf	(?___lbtoft+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___lbtoft+2)
	
l2567:	
	line	30
	
l744:	
	return
	opt stack 0
GLOBAL	__end_of___lbtoft
	__end_of___lbtoft:
;; =============== function ___lbtoft ends ============

	signat	___lbtoft,4219
	global	___ftmul
psect	text330,local,class=CODE,delta=2
global __ptext330
__ptext330:

;; *************** function ___ftmul *****************
;; Defined at:
;;		line 52 in file "C:\Program Files\HI-TECH Software\PICC\9.71\sources\ftmul.c"
;; Parameters:    Size  Location     Type
;;  f1              3   17[BANK0 ] float 
;;  f2              3   20[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3_as_produc    3   28[BANK0 ] unsigned um
;;  sign            1   32[BANK0 ] unsigned char 
;;  cntr            1   31[BANK0 ] unsigned char 
;;  exp             1   27[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   17[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      16       0       0       0
;;Total ram usage:       16 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_PWM_1
;;		_PWM_2
;;		_PWM_3
;; This function uses a non-reentrant model
;;
psect	text330
	file	"C:\Program Files\HI-TECH Software\PICC\9.71\sources\ftmul.c"
	line	52
	global	__size_of___ftmul
	__size_of___ftmul	equ	__end_of___ftmul-___ftmul
	
___ftmul:	
	opt	stack 1
; Regs used in ___ftmul: [wreg+status,2+status,0+pclath+cstack]
	line	56
	
l2569:	
;ftmul.c: 53: unsigned char exp, sign, cntr;
;ftmul.c: 54: unsigned short long f3_as_product;
;ftmul.c: 56: if((exp = (*(unsigned short long *)&f1) >> 15) == 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftmul@f1),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f1+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f1+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@exp)
	movf	((___ftmul@exp)),f
	skipz
	goto	u3051
	goto	u3050
u3051:
	goto	l717
u3050:
	line	57
	
l2571:	
;ftmul.c: 57: return 0.0;
	movlw	0x0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	
l2573:	
	goto	l718
	
l717:	
	line	58
	
l2575:	
;ftmul.c: 58: if((sign = (*(unsigned short long *)&f2) >> 15) == 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftmul@f2),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f2+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f2+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@sign)
	movf	((___ftmul@sign)),f
	skipz
	goto	u3061
	goto	u3060
u3061:
	goto	l719
u3060:
	line	59
	
l2577:	
;ftmul.c: 59: return 0.0;
	movlw	0x0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	
l2579:	
	goto	l718
	
l719:	
	line	60
	
l2581:	
;ftmul.c: 60: exp += sign-127-6;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftmul@sign),w
	addlw	07Bh
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	addwf	(___ftmul@exp),f
	line	61
;ftmul.c: 61: sign = (*(unsigned short long *)&f1) >> 16;
	movf	(___ftmul@f1),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f1+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f1+2),w
	movwf	((??___ftmul+0)+0+2)
	movlw	010h
u3075:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u3070:
	addlw	-1
	skipz
	goto	u3075
	movf	0+(??___ftmul+0)+0,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@sign)
	line	62
;ftmul.c: 62: sign ^= (unsigned char)((*(unsigned short long *)&f2) >> 16);
	movf	(___ftmul@f2),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f2+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f2+2),w
	movwf	((??___ftmul+0)+0+2)
	movlw	010h
u3085:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u3080:
	addlw	-1
	skipz
	goto	u3085
	movf	0+(??___ftmul+0)+0,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	xorwf	(___ftmul@sign),f
	line	63
;ftmul.c: 63: sign &= 0x80;
	movlw	(080h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	andwf	(___ftmul@sign),f
	line	64
	
l2583:	
;ftmul.c: 64: (*(unsigned short long *)&f1) |= 0x8000UL;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(___ftmul@f1)+(15/8),(15)&7
	line	66
	
l2585:	
;ftmul.c: 66: (*(unsigned short long *)&f2) |= 0x8000UL;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(___ftmul@f2)+(15/8),(15)&7
	line	67
	
l2587:	
;ftmul.c: 67: (*(unsigned short long *)&f2) &= 0xFFFFUL;
	movlw	0FFh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(___ftmul@f2),f
	movlw	0FFh
	andwf	(___ftmul@f2+1),f
	movlw	0
	andwf	(___ftmul@f2+2),f
	line	68
	
l2589:	
;ftmul.c: 68: f3_as_product = 0;
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(___ftmul@f3_as_product)
	movlw	0
	movwf	(___ftmul@f3_as_product+1)
	movlw	0
	movwf	(___ftmul@f3_as_product+2)
	line	69
	
l2591:	
;ftmul.c: 69: cntr = 7;
	movlw	(07h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	line	70
;ftmul.c: 70: do {
	
l720:	
	line	71
	
l2593:	
;ftmul.c: 71: if((*(unsigned short long *)&f1) & 1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(___ftmul@f1),(0)&7
	goto	u3091
	goto	u3090
u3091:
	goto	l721
u3090:
	line	72
	
l2595:	
;ftmul.c: 72: f3_as_product += (*(unsigned short long *)&f2);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u3101
	addwf	(___ftmul@f3_as_product+1),f
u3101:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u3102
	addwf	(___ftmul@f3_as_product+2),f
u3102:

	
l721:	
	line	73
	
l2597:	
;ftmul.c: 73: (*(unsigned short long *)&f1) >>= 1;
	movlw	01h
u3115:
	clrc
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u3115

	line	74
	
l2599:	
;ftmul.c: 74: (*(unsigned short long *)&f2) <<= 1;
	movlw	01h
u3125:
	clrc
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	rlf	(___ftmul@f2),f
	rlf	(___ftmul@f2+1),f
	rlf	(___ftmul@f2+2),f
	addlw	-1
	skipz
	goto	u3125
	line	75
	
l2601:	
;ftmul.c: 75: } while(--cntr != 0);
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u3131
	goto	u3130
u3131:
	goto	l720
u3130:
	
l722:	
	line	76
	
l2603:	
;ftmul.c: 76: cntr = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	line	77
;ftmul.c: 77: do {
	
l723:	
	line	78
	
l2605:	
;ftmul.c: 78: if((*(unsigned short long *)&f1) & 1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(___ftmul@f1),(0)&7
	goto	u3141
	goto	u3140
u3141:
	goto	l724
u3140:
	line	79
	
l2607:	
;ftmul.c: 79: f3_as_product += (*(unsigned short long *)&f2);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u3151
	addwf	(___ftmul@f3_as_product+1),f
u3151:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u3152
	addwf	(___ftmul@f3_as_product+2),f
u3152:

	
l724:	
	line	80
	
l2609:	
;ftmul.c: 80: (*(unsigned short long *)&f1) >>= 1;
	movlw	01h
u3165:
	clrc
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u3165

	line	81
	
l2611:	
;ftmul.c: 81: f3_as_product >>= 1;
	movlw	01h
u3175:
	clrc
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	rrf	(___ftmul@f3_as_product+2),f
	rrf	(___ftmul@f3_as_product+1),f
	rrf	(___ftmul@f3_as_product),f
	addlw	-1
	skipz
	goto	u3175

	line	82
	
l2613:	
;ftmul.c: 82: } while(--cntr != 0);
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u3181
	goto	u3180
u3181:
	goto	l723
u3180:
	
l725:	
	line	83
	
l2615:	
;ftmul.c: 83: return __ftpack(f3_as_product, exp, sign);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftmul@f3_as_product),w
	movwf	(?___ftpack)
	movf	(___ftmul@f3_as_product+1),w
	movwf	(?___ftpack+1)
	movf	(___ftmul@f3_as_product+2),w
	movwf	(?___ftpack+2)
	movf	(___ftmul@exp),w
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___ftmul@sign),w
	movwf	(??___ftmul+1)+0
	movf	(??___ftmul+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftmul)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftmul+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftmul+2)
	
l2617:	
	line	84
	
l718:	
	return
	opt stack 0
GLOBAL	__end_of___ftmul
	__end_of___ftmul:
;; =============== function ___ftmul ends ============

	signat	___ftmul,8315
	global	_lcd_data
psect	text331,local,class=CODE,delta=2
global __ptext331
__ptext331:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 27 in file "D:\TI\PIC course\ADC & LCD\LCD 4 BIT.h"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay
;; This function is called by:
;;		_display
;;		_main
;; This function uses a non-reentrant model
;;
psect	text331
	file	"D:\TI\PIC course\ADC & LCD\LCD 4 BIT.h"
	line	27
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 1
; Regs used in _lcd_data: [wreg+status,2+status,0+pclath+cstack]
;lcd_data@data stored from wreg
	line	29
	movwf	(lcd_data@data)
	
l2539:	
;LCD 4 BIT.h: 28: unsigned char temp1;
;LCD 4 BIT.h: 29: PORTD=data&0xF0;
	movf	(lcd_data@data),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	30
	
l2541:	
;LCD 4 BIT.h: 30: RD0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(64/8),(64)&7
	line	31
	
l2543:	
;LCD 4 BIT.h: 31: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	32
	
l2545:	
;LCD 4 BIT.h: 32: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	line	33
	
l2547:	
;LCD 4 BIT.h: 33: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	34
	
l2549:	
;LCD 4 BIT.h: 34: RD1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	35
	
l2551:	
;LCD 4 BIT.h: 35: temp1=data<<4;
	movf	(lcd_data@data),w
	movwf	(??_lcd_data+0)+0
	movlw	(04h)-1
u3045:
	clrc
	rlf	(??_lcd_data+0)+0,f
	addlw	-1
	skipz
	goto	u3045
	clrc
	rlf	(??_lcd_data+0)+0,w
	movwf	(??_lcd_data+1)+0
	movf	(??_lcd_data+1)+0,w
	movwf	(lcd_data@temp1)
	line	36
	
l2553:	
;LCD 4 BIT.h: 36: PORTD=temp1&0xF0;
	movf	(lcd_data@temp1),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	37
	
l2555:	
;LCD 4 BIT.h: 37: RD0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(64/8),(64)&7
	line	38
	
l2557:	
;LCD 4 BIT.h: 38: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	39
	
l2559:	
;LCD 4 BIT.h: 39: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	line	40
	
l2561:	
;LCD 4 BIT.h: 40: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	41
	
l2563:	
;LCD 4 BIT.h: 41: RD1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	44
	
l568:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
	global	_lcd_command
psect	text332,local,class=CODE,delta=2
global __ptext332
__ptext332:

;; *************** function _lcd_command *****************
;; Defined at:
;;		line 9 in file "D:\TI\PIC course\ADC & LCD\LCD 4 BIT.h"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay
;; This function is called by:
;;		_lcd_initialize
;;		_main
;; This function uses a non-reentrant model
;;
psect	text332
	file	"D:\TI\PIC course\ADC & LCD\LCD 4 BIT.h"
	line	9
	global	__size_of_lcd_command
	__size_of_lcd_command	equ	__end_of_lcd_command-_lcd_command
	
_lcd_command:	
	opt	stack 1
; Regs used in _lcd_command: [wreg+status,2+status,0+pclath+cstack]
;lcd_command@command stored from wreg
	line	11
	movwf	(lcd_command@command)
	
l2513:	
;LCD 4 BIT.h: 10: unsigned char temp;
;LCD 4 BIT.h: 11: PORTD=command&0xF0;
	movf	(lcd_command@command),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	12
	
l2515:	
;LCD 4 BIT.h: 12: RD0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7
	line	13
	
l2517:	
;LCD 4 BIT.h: 13: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	14
	
l2519:	
;LCD 4 BIT.h: 14: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	line	15
	
l2521:	
;LCD 4 BIT.h: 15: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	16
	
l2523:	
;LCD 4 BIT.h: 16: RD1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	17
	
l2525:	
;LCD 4 BIT.h: 17: temp=command<<4;
	movf	(lcd_command@command),w
	movwf	(??_lcd_command+0)+0
	movlw	(04h)-1
u3035:
	clrc
	rlf	(??_lcd_command+0)+0,f
	addlw	-1
	skipz
	goto	u3035
	clrc
	rlf	(??_lcd_command+0)+0,w
	movwf	(??_lcd_command+1)+0
	movf	(??_lcd_command+1)+0,w
	movwf	(lcd_command@temp)
	line	18
	
l2527:	
;LCD 4 BIT.h: 18: PORTD=temp&0xF0;
	movf	(lcd_command@temp),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	19
	
l2529:	
;LCD 4 BIT.h: 19: RD0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7
	line	20
	
l2531:	
;LCD 4 BIT.h: 20: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	21
	
l2533:	
;LCD 4 BIT.h: 21: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	line	22
	
l2535:	
;LCD 4 BIT.h: 22: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	23
	
l2537:	
;LCD 4 BIT.h: 23: RD1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	25
	
l565:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_command
	__end_of_lcd_command:
;; =============== function _lcd_command ends ============

	signat	_lcd_command,4216
	global	___fttol
psect	text333,local,class=CODE,delta=2
global __ptext333
__ptext333:

;; *************** function ___fttol *****************
;; Defined at:
;;		line 45 in file "C:\Program Files\HI-TECH Software\PICC\9.71\sources\fttol.c"
;; Parameters:    Size  Location     Type
;;  f1              3    8[COMMON] float 
;; Auto vars:     Size  Location     Type
;;  lval            4    5[BANK0 ] unsigned long 
;;  exp1            1    9[BANK0 ] unsigned char 
;;  sign1           1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    8[COMMON] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         4      10       0       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used:    1
;; This function calls:
;; This function is called by:
;;		_PWM_1
;;		_PWM_2
;;		_PWM_3
;; This function uses a non-reentrant model
;;
psect	text333
	file	"C:\Program Files\HI-TECH Software\PICC\9.71\sources\fttol.c"
	line	45
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:	
	opt	stack 0
; Regs used in ___fttol: [wreg+status,2+status,0]
	line	49
	
l2361:	
;fttol.c: 46: unsigned char sign1, exp1;
;fttol.c: 47: unsigned long lval;
;fttol.c: 49: if((exp1 = (*(unsigned short long *)&f1) >> 15) == 0)
	movf	(___fttol@f1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	clrc
	rlf	(??___fttol+0)+1,w
	rlf	(??___fttol+0)+2,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@exp1)
	movf	((___fttol@exp1)),f
	skipz
	goto	u2581
	goto	u2580
u2581:
	goto	l728
u2580:
	line	50
	
l2363:	
;fttol.c: 50: return 0;
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	
l2365:	
	goto	l729
	
l728:	
	line	51
	
l2367:	
;fttol.c: 51: sign1 = (*(unsigned short long *)&f1) >> 23;
	movf	(___fttol@f1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u2595:
	clrc
	rrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u2590:
	addlw	-1
	skipz
	goto	u2595
	movf	0+(??___fttol+0)+0,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@sign1)
	line	52
	
l2369:	
;fttol.c: 52: (*(unsigned short long *)&f1) |= 0x8000UL;
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
l2371:	
;fttol.c: 53: (*(unsigned short long *)&f1) &= 0xFFFFUL;
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
l2373:	
;fttol.c: 54: lval = (*(unsigned short long *)&f1);
	movf	(___fttol@f1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
l2375:	
;fttol.c: 55: exp1 -= 127+15;
	movlw	low(08Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(___fttol@exp1),f
	line	56
	
l2377:	
;fttol.c: 56: if((signed char)exp1 < 0) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(___fttol@exp1),7
	goto	u2601
	goto	u2600
u2601:
	goto	l730
u2600:
	line	57
	
l2379:	
;fttol.c: 57: if((signed char)exp1 < -15)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u2611
	goto	u2610
u2611:
	goto	l731
u2610:
	line	58
	
l2381:	
;fttol.c: 58: return 0;
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	
l2383:	
	goto	l729
	
l731:	
	line	59
;fttol.c: 59: do
	
l732:	
	line	60
	
l2385:	
;fttol.c: 60: lval >>= 1;
	movlw	01h
u2625:
	clrc
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	rrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	addlw	-1
	skipz
	goto	u2625

	line	61
;fttol.c: 61: while(++exp1 != 0);
	movlw	(01h)
	movwf	(??___fttol+0)+0
	movf	(??___fttol+0)+0,w
	addwf	(___fttol@exp1),f
	btfss	status,2
	goto	u2631
	goto	u2630
u2631:
	goto	l732
u2630:
	
l733:	
	line	62
;fttol.c: 62: } else {
	goto	l734
	
l730:	
	line	63
	
l2387:	
;fttol.c: 63: if(exp1 >= 24)
	movlw	(018h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(___fttol@exp1),w
	skipc
	goto	u2641
	goto	u2640
u2641:
	goto	l735
u2640:
	line	64
	
l2389:	
;fttol.c: 64: return 0;
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	
l2391:	
	goto	l729
	
l735:	
	line	65
;fttol.c: 65: while(exp1 != 0) {
	goto	l736
	
l737:	
	line	66
	
l2393:	
;fttol.c: 66: lval <<= 1;
	movlw	01h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??___fttol+0)+0
u2655:
	clrc
	rlf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	decfsz	(??___fttol+0)+0
	goto	u2655
	line	67
;fttol.c: 67: exp1--;
	movlw	low(01h)
	subwf	(___fttol@exp1),f
	line	68
	
l736:	
	line	65
	
l2395:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___fttol@exp1),f
	skipz
	goto	u2661
	goto	u2660
u2661:
	goto	l737
u2660:
	
l738:	
	line	69
	
l734:	
	line	70
	
l2397:	
;fttol.c: 68: }
;fttol.c: 69: }
;fttol.c: 70: if(sign1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___fttol@sign1),w
	skipz
	goto	u2670
	goto	l739
u2670:
	line	71
	
l2399:	
;fttol.c: 71: lval = -lval;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	
l739:	
	line	72
	
l2401:	
;fttol.c: 72: return lval;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	
l2403:	
	line	73
	
l729:	
	return
	opt stack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
;; =============== function ___fttol ends ============

	signat	___fttol,4220
	global	___ftpack
psect	text334,local,class=CODE,delta=2
global __ptext334
__ptext334:

;; *************** function ___ftpack *****************
;; Defined at:
;;		line 63 in file "C:\Program Files\HI-TECH Software\PICC\9.71\sources\float.c"
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
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
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
;;		___ftadd
;;		___ftdiv
;;		___abtoft
;;		___awtoft
;;		___lwtoft
;;		___altoft
;;		___lltoft
;;		___attoft
;;		___lttoft
;; This function uses a non-reentrant model
;;
psect	text334
	file	"C:\Program Files\HI-TECH Software\PICC\9.71\sources\float.c"
	line	63
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:	
	opt	stack 0
; Regs used in ___ftpack: [wreg+status,2+status,0]
	line	64
	
l2405:	
;float.c: 64: if(exp == 0 || arg == 0)
	movf	(___ftpack@exp),w
	skipz
	goto	u2680
	goto	l953
u2680:
	
l2407:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u2691
	goto	u2690
u2691:
	goto	l951
u2690:
	
l953:	
	line	65
	
l2409:	
;float.c: 65: return 0.0;
	movlw	0x0
	movwf	(?___ftpack)
	movlw	0x0
	movwf	(?___ftpack+1)
	movlw	0x0
	movwf	(?___ftpack+2)
	
l2411:	
	goto	l954
	
l951:	
	line	66
;float.c: 66: while(arg & 0xFE0000UL) {
	goto	l955
	
l956:	
	line	67
	
l2413:	
;float.c: 67: exp++;
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	68
;float.c: 68: arg >>= 1;
	movlw	01h
u2705:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u2705

	line	69
	
l955:	
	line	66
	
l2415:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u2711
	goto	u2710
u2711:
	goto	l956
u2710:
	
l957:	
	line	70
;float.c: 69: }
;float.c: 70: while(arg & 0xFF0000UL) {
	goto	l958
	
l959:	
	line	71
	
l2417:	
;float.c: 71: exp++;
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	72
	
l2419:	
;float.c: 72: (arg)++;
	movlw	01h
	addwf	(___ftpack@arg),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftpack@arg+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftpack@arg+2),f
	line	73
	
l2421:	
;float.c: 73: arg >>= 1;
	movlw	01h
u2725:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u2725

	line	74
	
l958:	
	line	70
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u2731
	goto	u2730
u2731:
	goto	l959
u2730:
	
l960:	
	line	75
;float.c: 74: }
;float.c: 75: while(!(arg & 0x8000UL)) {
	goto	l961
	
l962:	
	line	76
	
l2423:	
;float.c: 76: exp--;
	movlw	low(01h)
	subwf	(___ftpack@exp),f
	line	77
;float.c: 77: arg <<= 1;
	movlw	01h
u2745:
	clrc
	rlf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	addlw	-1
	skipz
	goto	u2745
	line	78
	
l961:	
	line	75
	
l2425:	
	btfss	(___ftpack@arg+1),(15)&7
	goto	u2751
	goto	u2750
u2751:
	goto	l962
u2750:
	
l963:	
	line	79
;float.c: 78: }
;float.c: 79: if(!(exp & 1))
	btfsc	(___ftpack@exp),(0)&7
	goto	u2761
	goto	u2760
u2761:
	goto	l964
u2760:
	line	80
	
l2427:	
;float.c: 80: arg &= ~0x8000L;
	movlw	0FFh
	andwf	(___ftpack@arg),f
	movlw	07Fh
	andwf	(___ftpack@arg+1),f
	movlw	0FFh
	andwf	(___ftpack@arg+2),f
	
l964:	
	line	81
;float.c: 81: exp >>= 1;
	clrc
	rrf	(___ftpack@exp),f

	line	82
	
l2429:	
;float.c: 82: arg |= (unsigned short long)exp << 16;
	movf	(___ftpack@exp),w
	movwf	((??___ftpack+0)+0)
	clrf	((??___ftpack+0)+0+1)
	clrf	((??___ftpack+0)+0+2)
	movlw	010h
u2775:
	clrc
	rlf	(??___ftpack+0)+0,f
	rlf	(??___ftpack+0)+1,f
	rlf	(??___ftpack+0)+2,f
u2770:
	addlw	-1
	skipz
	goto	u2775
	movf	0+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg),f
	movf	1+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+1),f
	movf	2+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+2),f
	line	83
	
l2431:	
;float.c: 83: if (sign)
	movf	(___ftpack@sign),w
	skipz
	goto	u2780
	goto	l965
u2780:
	line	84
	
l2433:	
;float.c: 84: arg |= 0x800000UL;
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
l965:	
	line	85
;float.c: 85: return *(float*)&arg;
	line	86
	
l954:	
	return
	opt stack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
;; =============== function ___ftpack ends ============

	signat	___ftpack,12411
	global	_delay
psect	text335,local,class=CODE,delta=2
global __ptext335
__ptext335:

;; *************** function _delay *****************
;; Defined at:
;;		line 4 in file "D:\TI\PIC course\ADC & LCD\LCD 4 BIT.h"
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
psect	text335
	file	"D:\TI\PIC course\ADC & LCD\LCD 4 BIT.h"
	line	4
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 0
; Regs used in _delay: [wreg]
	line	5
	
l2303:	
;LCD 4 BIT.h: 5: while(a--);
	goto	l559
	
l560:	
	
l559:	
	
l2305:	
	movlw	low(01h)
	subwf	(delay@a),f
	movlw	high(01h)
	skipc
	decf	(delay@a+1),f
	subwf	(delay@a+1),f
	movlw	high(0FFFFh)
	xorwf	((delay@a+1)),w
	skipz
	goto	u2485
	movlw	low(0FFFFh)
	xorwf	((delay@a)),w
u2485:

	skipz
	goto	u2481
	goto	u2480
u2481:
	goto	l560
u2480:
	
l561:	
	line	6
	
l562:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
	global	___lwdiv
psect	text336,local,class=CODE,delta=2
global __ptext336
__ptext336:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.71\sources\lwdiv.c"
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
psect	text336
	file	"C:\Program Files\HI-TECH Software\PICC\9.71\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 0
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l2257:	
;lwdiv.c: 6: unsigned int quotient;
;lwdiv.c: 7: unsigned char counter;
;lwdiv.c: 9: quotient = 0;
	movlw	low(0)
	movwf	(___lwdiv@quotient)
	movlw	high(0)
	movwf	((___lwdiv@quotient))+1
	line	10
;lwdiv.c: 10: if(divisor != 0) {
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u2351
	goto	u2350
u2351:
	goto	l625
u2350:
	line	11
	
l2259:	
;lwdiv.c: 11: counter = 1;
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
;lwdiv.c: 12: while((divisor & 0x8000) == 0) {
	goto	l626
	
l627:	
	line	13
	
l2261:	
;lwdiv.c: 13: divisor <<= 1;
	movlw	01h
	
u2365:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2365
	line	14
	
l2263:	
;lwdiv.c: 14: counter++;
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	line	15
	
l626:	
	line	12
	
l2265:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u2371
	goto	u2370
u2371:
	goto	l627
u2370:
	
l628:	
	line	16
;lwdiv.c: 15: }
;lwdiv.c: 16: do {
	
l629:	
	line	17
	
l2267:	
;lwdiv.c: 17: quotient <<= 1;
	movlw	01h
	
u2385:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2385
	line	18
;lwdiv.c: 18: if(divisor <= dividend) {
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u2395
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u2395:
	skipc
	goto	u2391
	goto	u2390
u2391:
	goto	l630
u2390:
	line	19
	
l2269:	
;lwdiv.c: 19: dividend -= divisor;
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l2271:	
;lwdiv.c: 20: quotient |= 1;
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	21
	
l630:	
	line	22
	
l2273:	
;lwdiv.c: 21: }
;lwdiv.c: 22: divisor >>= 1;
	movlw	01h
	
u2405:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u2405
	line	23
	
l2275:	
;lwdiv.c: 23: } while(--counter != 0);
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u2411
	goto	u2410
u2411:
	goto	l629
u2410:
	
l631:	
	line	24
	
l625:	
	line	25
	
l2277:	
;lwdiv.c: 24: }
;lwdiv.c: 25: return quotient;
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	
l2279:	
	line	26
	
l632:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	___lwmod
psect	text337,local,class=CODE,delta=2
global __ptext337
__ptext337:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.71\sources\lwmod.c"
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
psect	text337
	file	"C:\Program Files\HI-TECH Software\PICC\9.71\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 0
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l2281:	
;lwmod.c: 6: unsigned char counter;
;lwmod.c: 8: if(divisor != 0) {
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u2421
	goto	u2420
u2421:
	goto	l635
u2420:
	line	9
	
l2283:	
;lwmod.c: 9: counter = 1;
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
;lwmod.c: 10: while((divisor & 0x8000) == 0) {
	goto	l636
	
l637:	
	line	11
	
l2285:	
;lwmod.c: 11: divisor <<= 1;
	movlw	01h
	
u2435:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2435
	line	12
	
l2287:	
;lwmod.c: 12: counter++;
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	line	13
	
l636:	
	line	10
	
l2289:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u2441
	goto	u2440
u2441:
	goto	l637
u2440:
	
l638:	
	line	14
;lwmod.c: 13: }
;lwmod.c: 14: do {
	
l639:	
	line	15
	
l2291:	
;lwmod.c: 15: if(divisor <= dividend)
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u2455
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u2455:
	skipc
	goto	u2451
	goto	u2450
u2451:
	goto	l640
u2450:
	line	16
	
l2293:	
;lwmod.c: 16: dividend -= divisor;
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	
l640:	
	line	17
	
l2295:	
;lwmod.c: 17: divisor >>= 1;
	movlw	01h
	
u2465:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u2465
	line	18
	
l2297:	
;lwmod.c: 18: } while(--counter != 0);
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u2471
	goto	u2470
u2471:
	goto	l639
u2470:
	
l641:	
	line	19
	
l635:	
	line	20
	
l2299:	
;lwmod.c: 19: }
;lwmod.c: 20: return dividend;
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	
l2301:	
	line	21
	
l642:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
psect	text338,local,class=CODE,delta=2
global __ptext338
__ptext338:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
