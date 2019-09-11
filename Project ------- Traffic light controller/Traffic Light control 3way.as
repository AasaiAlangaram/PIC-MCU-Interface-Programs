opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 6446"

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
	FNCALL	_main,_display
	FNCALL	_main,_lcd_command
	FNCALL	_main,_Timer_Delay_1Sec
	FNCALL	_main,_a_way
	FNCALL	_main,_b_way
	FNCALL	_main,_c_way
	FNCALL	_display,_lcd_data
	FNCALL	_lcd_initialize,_lcd_command
	FNCALL	_lcd_data,_delay
	FNCALL	_lcd_command,_delay
	FNROOT	_main
	FNCALL	_ext,i1_delay
	FNCALL	intlevel1,_ext
	global	intlevel1
	FNROOT	intlevel1
	global	_night_mode
	global	_PORTB
psect	text265,local,class=CODE,delta=2
global __ptext265
__ptext265:
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_PORTD
_PORTD	set	8
	global	_TMR0
_TMR0	set	1
	global	_GIE
_GIE	set	95
	global	_INTE
_INTE	set	92
	global	_INTF
_INTF	set	89
	global	_PEIE
_PEIE	set	94
	global	_RB1
_RB1	set	49
	global	_RB7
_RB7	set	55
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_RC3
_RC3	set	59
	global	_RC4
_RC4	set	60
	global	_RC5
_RC5	set	61
	global	_RC6
_RC6	set	62
	global	_RC7
_RC7	set	63
	global	_RD0
_RD0	set	64
	global	_RD1
_RD1	set	65
	global	_T0IF
_T0IF	set	90
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
	global	_INTEDG
_INTEDG	set	1038
	global	_PS0
_PS0	set	1032
	global	_PS1
_PS1	set	1033
	global	_PS2
_PS2	set	1034
	global	_PSA
_PSA	set	1035
	global	_RBPU
_RBPU	set	1039
	global	_RW
_RW	set	1186
	global	_T0CS
_T0CS	set	1037
	global	_T0SE
_T0SE	set	1036
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
	
STR_1:	
	retlw	84	;'T'
	retlw	114	;'r'
	retlw	97	;'a'
	retlw	102	;'f'
	retlw	102	;'f'
	retlw	105	;'i'
	retlw	99	;'c'
	retlw	32	;' '
	retlw	76	;'L'
	retlw	105	;'i'
	retlw	103	;'g'
	retlw	104	;'h'
	retlw	116	;'t'
	retlw	0
psect	strings
	
STR_2:	
	retlw	67	;'C'
	retlw	111	;'o'
	retlw	110	;'n'
	retlw	116	;'t'
	retlw	114	;'r'
	retlw	111	;'o'
	retlw	108	;'l'
	retlw	108	;'l'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	0
psect	strings
	file	"Traffic Light control 3way.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_night_mode:
       ds      1

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_lcd_command
?_lcd_command:	; 0 bytes @ 0x0
	global	?_lcd_data
?_lcd_data:	; 0 bytes @ 0x0
	global	?_lcd_initialize
?_lcd_initialize:	; 0 bytes @ 0x0
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
	global	?_Timer_Delay_1Sec
?_Timer_Delay_1Sec:	; 0 bytes @ 0x6
	global	?_a_way
?_a_way:	; 0 bytes @ 0x6
	global	?_b_way
?_b_way:	; 0 bytes @ 0x6
	global	?_c_way
?_c_way:	; 0 bytes @ 0x6
	global	a_way@Y
a_way@Y:	; 1 bytes @ 0x6
	global	b_way@Y
b_way@Y:	; 1 bytes @ 0x6
	global	c_way@Y
c_way@Y:	; 1 bytes @ 0x6
	global	delay@a
delay@a:	; 2 bytes @ 0x6
	global	Timer_Delay_1Sec@j
Timer_Delay_1Sec@j:	; 2 bytes @ 0x6
	ds	1
	global	a_way@G
a_way@G:	; 1 bytes @ 0x7
	global	b_way@G
b_way@G:	; 1 bytes @ 0x7
	global	c_way@G
c_way@G:	; 1 bytes @ 0x7
	ds	1
	global	??_delay
??_delay:	; 0 bytes @ 0x8
	global	??_lcd_initialize
??_lcd_initialize:	; 0 bytes @ 0x8
	global	??_Timer_Delay_1Sec
??_Timer_Delay_1Sec:	; 0 bytes @ 0x8
	global	??_a_way
??_a_way:	; 0 bytes @ 0x8
	global	??_b_way
??_b_way:	; 0 bytes @ 0x8
	global	??_c_way
??_c_way:	; 0 bytes @ 0x8
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_lcd_command
??_lcd_command:	; 0 bytes @ 0x0
	global	??_lcd_data
??_lcd_data:	; 0 bytes @ 0x0
	global	a_way@R
a_way@R:	; 1 bytes @ 0x0
	global	b_way@R
b_way@R:	; 1 bytes @ 0x0
	global	c_way@R
c_way@R:	; 1 bytes @ 0x0
	global	Timer_Delay_1Sec@k
Timer_Delay_1Sec@k:	; 2 bytes @ 0x0
	ds	2
	global	lcd_command@temp
lcd_command@temp:	; 1 bytes @ 0x2
	global	lcd_data@temp1
lcd_data@temp1:	; 1 bytes @ 0x2
	global	Timer_Delay_1Sec@i
Timer_Delay_1Sec@i:	; 2 bytes @ 0x2
	ds	1
	global	lcd_command@command
lcd_command@command:	; 1 bytes @ 0x3
	global	lcd_data@data
lcd_data@data:	; 1 bytes @ 0x3
	ds	1
	global	?_display
?_display:	; 0 bytes @ 0x4
	global	display@len
display@len:	; 1 bytes @ 0x4
	ds	1
	global	??_display
??_display:	; 0 bytes @ 0x5
	ds	1
	global	display@word
display@word:	; 1 bytes @ 0x6
	ds	1
	global	display@a
display@a:	; 1 bytes @ 0x7
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x8
	ds	1
;;Data sizes: Strings 25, constant 0, data 0, bss 1, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      8       8
;; BANK0           80      9      10
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; display@word	PTR const unsigned char  size(1) Largest target is 14
;;		 -> STR_2(CODE[11]), STR_1(CODE[14]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_Timer_Delay_1Sec
;;   _main->_a_way
;;   _main->_b_way
;;   _main->_c_way
;;   _lcd_data->_delay
;;   _lcd_command->_delay
;;
;; Critical Paths under _ext in COMMON
;;
;;   _ext->i1_delay
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_display
;;   _display->_lcd_data
;;   _lcd_initialize->_lcd_command
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
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 1     1      0     647
;;                                              8 BANK0      1     1      0
;;                     _lcd_initialize
;;                            _display
;;                        _lcd_command
;;                   _Timer_Delay_1Sec
;;                              _a_way
;;                              _b_way
;;                              _c_way
;; ---------------------------------------------------------------------------------
;; (1) _display                                              4     3      1     179
;;                                              4 BANK0      4     3      1
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_initialize                                       0     0      0      89
;;                        _lcd_command
;; ---------------------------------------------------------------------------------
;; (2) _lcd_data                                             4     4      0      89
;;                                              0 BANK0      4     4      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _lcd_command                                          4     4      0      89
;;                                              0 BANK0      4     4      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _c_way                                                3     1      2      66
;;                                              6 COMMON     2     0      2
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _b_way                                                3     1      2      66
;;                                              6 COMMON     2     0      2
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _a_way                                                3     1      2      66
;;                                              6 COMMON     2     0      2
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _Timer_Delay_1Sec                                     6     4      2      92
;;                                              6 COMMON     2     0      2
;;                                              0 BANK0      4     4      0
;; ---------------------------------------------------------------------------------
;; (2) _delay                                                2     0      2      22
;;                                              6 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _ext                                                  4     4      0      73
;;                                              2 COMMON     4     4      0
;;                            i1_delay
;; ---------------------------------------------------------------------------------
;; (5) i1_delay                                              2     0      2      73
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd_initialize
;;     _lcd_command
;;       _delay
;;   _display
;;     _lcd_data
;;       _delay
;;   _lcd_command
;;     _delay
;;   _Timer_Delay_1Sec
;;   _a_way
;;   _b_way
;;   _c_way
;;
;; _ext (ROOT)
;;   i1_delay
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      8       8       1       57.1%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       7       2        0.0%
;;ABS                  0      0      12       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      9       A       5       12.5%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      19      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 63 in file "D:\TI\PIC course\Project ------- Traffic light controller\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
;;      Locals:         0       0       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_lcd_initialize
;;		_display
;;		_lcd_command
;;		_Timer_Delay_1Sec
;;		_a_way
;;		_b_way
;;		_c_way
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\TI\PIC course\Project ------- Traffic light controller\main.c"
	line	63
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2-btemp+0+pclath+cstack]
	line	64
	
l2068:	
;main.c: 64: TRISD=0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	65
	
l2070:	
;main.c: 65: TRISB=0x01;
	movlw	(01h)
	movwf	(134)^080h	;volatile
	line	66
	
l2072:	
;main.c: 66: TRISC=0x00;
	clrf	(135)^080h	;volatile
	line	67
	
l2074:	
;main.c: 67: PORTD=PORTC=0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	clrf	(8)	;volatile
	line	68
	
l2076:	
;main.c: 68: PORTB=0x01;
	movlw	(01h)
	movwf	(6)	;volatile
	line	69
	
l2078:	
;main.c: 69: RB1=0;
	bcf	(49/8),(49)&7
	line	70
	
l2080:	
;main.c: 70: GIE=1;
	bsf	(95/8),(95)&7
	line	71
	
l2082:	
;main.c: 71: PEIE=1;
	bsf	(94/8),(94)&7
	line	72
	
l2084:	
;main.c: 72: INTE=1;
	bsf	(92/8),(92)&7
	line	73
	
l2086:	
;main.c: 73: INTEDG=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1038/8)^080h,(1038)&7
	line	74
	
l2088:	
;main.c: 74: RBPU=0;
	bcf	(1039/8)^080h,(1039)&7
	line	75
	
l2090:	
;main.c: 75: lcd_initialize();
	fcall	_lcd_initialize
	line	76
	
l2092:	
;main.c: 76: display("Traffic Light",13);
	movlw	(0Dh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_display)
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_display
	line	77
	
l2094:	
;main.c: 77: lcd_command(0xC0);
	movlw	(0C0h)
	fcall	_lcd_command
	line	78
	
l2096:	
;main.c: 78: display("Controller",10);
	movlw	(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_display)
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_display
	line	79
	
l2098:	
;main.c: 79: Timer_Delay_1Sec(3);
	movlw	low(03h)
	movwf	(?_Timer_Delay_1Sec)
	movlw	high(03h)
	movwf	((?_Timer_Delay_1Sec))+1
	fcall	_Timer_Delay_1Sec
	line	80
	
l2100:	
;main.c: 80: night_mode=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_night_mode)
	line	82
;main.c: 82: while(1)
	
l606:	
	line	84
	
l2102:	
;main.c: 83: {
;main.c: 84: if(night_mode==0)
	movf	(_night_mode),f
	skipz
	goto	u2791
	goto	u2790
u2791:
	goto	l607
u2790:
	line	86
	
l2104:	
;main.c: 85: {
;main.c: 86: a_way(0,0,1); b_way(1,0,0); c_way(1,0,0);
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(?_a_way)
	clrf	0+(?_a_way)+01h
	bsf	status,0
	rlf	0+(?_a_way)+01h,f
	movlw	(0)
	fcall	_a_way
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(?_b_way)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(?_b_way)+01h
	movlw	(01h)
	fcall	_b_way
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(?_c_way)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(?_c_way)+01h
	movlw	(01h)
	fcall	_c_way
	line	88
	
l2106:	
;main.c: 88: Timer_Delay_1Sec(7);
	movlw	low(07h)
	movwf	(?_Timer_Delay_1Sec)
	movlw	high(07h)
	movwf	((?_Timer_Delay_1Sec))+1
	fcall	_Timer_Delay_1Sec
	line	90
	
l2108:	
;main.c: 90: a_way(0,0,1); b_way(0,1,0); c_way(1,0,0);
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(?_a_way)
	clrf	0+(?_a_way)+01h
	bsf	status,0
	rlf	0+(?_a_way)+01h,f
	movlw	(0)
	fcall	_a_way
	
l2110:	
	clrf	(?_b_way)
	bsf	status,0
	rlf	(?_b_way),f
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(?_b_way)+01h
	movlw	(0)
	fcall	_b_way
	
l2112:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(?_c_way)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(?_c_way)+01h
	movlw	(01h)
	fcall	_c_way
	line	92
;main.c: 92: Timer_Delay_1Sec(2);
	movlw	low(02h)
	movwf	(?_Timer_Delay_1Sec)
	movlw	high(02h)
	movwf	((?_Timer_Delay_1Sec))+1
	fcall	_Timer_Delay_1Sec
	line	94
	
l2114:	
;main.c: 94: a_way(1,0,0); b_way(0,0,1); c_way(1,0,0);
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(?_a_way)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(?_a_way)+01h
	movlw	(01h)
	fcall	_a_way
	
l2116:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(?_b_way)
	clrf	0+(?_b_way)+01h
	bsf	status,0
	rlf	0+(?_b_way)+01h,f
	movlw	(0)
	fcall	_b_way
	
l2118:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(?_c_way)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(?_c_way)+01h
	movlw	(01h)
	fcall	_c_way
	line	96
	
l2120:	
;main.c: 96: Timer_Delay_1Sec(7);
	movlw	low(07h)
	movwf	(?_Timer_Delay_1Sec)
	movlw	high(07h)
	movwf	((?_Timer_Delay_1Sec))+1
	fcall	_Timer_Delay_1Sec
	line	98
;main.c: 98: a_way(1,0,0); b_way(0,0,1); c_way(0,1,0);
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(?_a_way)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(?_a_way)+01h
	movlw	(01h)
	fcall	_a_way
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(?_b_way)
	clrf	0+(?_b_way)+01h
	bsf	status,0
	rlf	0+(?_b_way)+01h,f
	movlw	(0)
	fcall	_b_way
	clrf	(?_c_way)
	bsf	status,0
	rlf	(?_c_way),f
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(?_c_way)+01h
	movlw	(0)
	fcall	_c_way
	line	100
	
l2122:	
;main.c: 100: Timer_Delay_1Sec(2);
	movlw	low(02h)
	movwf	(?_Timer_Delay_1Sec)
	movlw	high(02h)
	movwf	((?_Timer_Delay_1Sec))+1
	fcall	_Timer_Delay_1Sec
	line	102
	
l2124:	
;main.c: 102: a_way(1,0,0); b_way(1,0,0); c_way(0,0,1);
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(?_a_way)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(?_a_way)+01h
	movlw	(01h)
	fcall	_a_way
	
l2126:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(?_b_way)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(?_b_way)+01h
	movlw	(01h)
	fcall	_b_way
	
l2128:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(?_c_way)
	clrf	0+(?_c_way)+01h
	bsf	status,0
	rlf	0+(?_c_way)+01h,f
	movlw	(0)
	fcall	_c_way
	line	104
;main.c: 104: Timer_Delay_1Sec(7);
	movlw	low(07h)
	movwf	(?_Timer_Delay_1Sec)
	movlw	high(07h)
	movwf	((?_Timer_Delay_1Sec))+1
	fcall	_Timer_Delay_1Sec
	line	106
	
l2130:	
;main.c: 106: a_way(0,1,0); b_way(1,0,0); c_way(0,0,1);
	clrf	(?_a_way)
	bsf	status,0
	rlf	(?_a_way),f
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(?_a_way)+01h
	movlw	(0)
	fcall	_a_way
	
l2132:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(?_b_way)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(?_b_way)+01h
	movlw	(01h)
	fcall	_b_way
	
l2134:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(?_c_way)
	clrf	0+(?_c_way)+01h
	bsf	status,0
	rlf	0+(?_c_way)+01h,f
	movlw	(0)
	fcall	_c_way
	line	108
	
l2136:	
;main.c: 108: Timer_Delay_1Sec(2);
	movlw	low(02h)
	movwf	(?_Timer_Delay_1Sec)
	movlw	high(02h)
	movwf	((?_Timer_Delay_1Sec))+1
	fcall	_Timer_Delay_1Sec
	line	111
	
l607:	
	line	113
	
l2138:	
;main.c: 111: }
;main.c: 113: if(night_mode)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_night_mode),w
	skipz
	goto	u2800
	goto	l608
u2800:
	line	115
	
l2140:	
;main.c: 114: {
;main.c: 115: a_way(0,1,0); b_way(0,1,0); c_way(0,1,0);
	clrf	(?_a_way)
	bsf	status,0
	rlf	(?_a_way),f
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(?_a_way)+01h
	movlw	(0)
	fcall	_a_way
	clrf	(?_b_way)
	bsf	status,0
	rlf	(?_b_way),f
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(?_b_way)+01h
	movlw	(0)
	fcall	_b_way
	clrf	(?_c_way)
	bsf	status,0
	rlf	(?_c_way),f
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(?_c_way)+01h
	movlw	(0)
	fcall	_c_way
	line	118
	
l2142:	
;main.c: 118: Timer_Delay_1Sec(1);
	movlw	low(01h)
	movwf	(?_Timer_Delay_1Sec)
	movlw	high(01h)
	movwf	((?_Timer_Delay_1Sec))+1
	fcall	_Timer_Delay_1Sec
	line	120
	
l2144:	
;main.c: 120: a_way(0,0,0); b_way(0,0,0); c_way(0,0,0);
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(?_a_way)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(?_a_way)+01h
	movlw	(0)
	fcall	_a_way
	
l2146:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(?_b_way)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(?_b_way)+01h
	movlw	(0)
	fcall	_b_way
	
l2148:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(?_c_way)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(?_c_way)+01h
	movlw	(0)
	fcall	_c_way
	line	123
;main.c: 123: Timer_Delay_1Sec(1);
	movlw	low(01h)
	movwf	(?_Timer_Delay_1Sec)
	movlw	high(01h)
	movwf	((?_Timer_Delay_1Sec))+1
	fcall	_Timer_Delay_1Sec
	line	125
	
l608:	
	line	127
	
l609:	
	line	82
	goto	l606
	
l610:	
	line	128
	
l611:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_display
psect	text266,local,class=CODE,delta=2
global __ptext266
__ptext266:

;; *************** function _display *****************
;; Defined at:
;;		line 55 in file "D:\TI\PIC course\Project ------- Traffic light controller\LCD 4 BIT.h"
;; Parameters:    Size  Location     Type
;;  word            1    wreg     PTR const unsigned char 
;;		 -> STR_2(11), STR_1(14), 
;;  len             1    4[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  word            1    6[BANK0 ] PTR const unsigned char 
;;		 -> STR_2(11), STR_1(14), 
;;  a               1    7[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       1       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_lcd_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text266
	file	"D:\TI\PIC course\Project ------- Traffic light controller\LCD 4 BIT.h"
	line	55
	global	__size_of_display
	__size_of_display	equ	__end_of_display-_display
	
_display:	
	opt	stack 7
; Regs used in _display: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;display@word stored from wreg
	line	57
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(display@word)
	
l2060:	
;LCD 4 BIT.h: 56: unsigned char a;
;LCD 4 BIT.h: 57: for(a=0;a<=len;a++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(display@a)
	goto	l576
	line	58
	
l577:	
	line	59
	
l2062:	
;LCD 4 BIT.h: 58: {
;LCD 4 BIT.h: 59: lcd_data(word[a]);
	movf	(display@a),w
	addwf	(display@word),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	line	57
	
l2064:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_display+0)+0
	movf	(??_display+0)+0,w
	addwf	(display@a),f
	
l576:	
	
l2066:	
	movf	(display@a),w
	subwf	(display@len),w
	skipnc
	goto	u2781
	goto	u2780
u2781:
	goto	l577
u2780:
	
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
psect	text267,local,class=CODE,delta=2
global __ptext267
__ptext267:

;; *************** function _lcd_initialize *****************
;; Defined at:
;;		line 46 in file "D:\TI\PIC course\Project ------- Traffic light controller\LCD 4 BIT.h"
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_lcd_command
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text267
	file	"D:\TI\PIC course\Project ------- Traffic light controller\LCD 4 BIT.h"
	line	46
	global	__size_of_lcd_initialize
	__size_of_lcd_initialize	equ	__end_of_lcd_initialize-_lcd_initialize
	
_lcd_initialize:	
	opt	stack 7
; Regs used in _lcd_initialize: [wreg+status,2+status,0+pclath+cstack]
	line	47
	
l2058:	
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
psect	text268,local,class=CODE,delta=2
global __ptext268
__ptext268:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 27 in file "D:\TI\PIC course\Project ------- Traffic light controller\LCD 4 BIT.h"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    3[BANK0 ] unsigned char 
;;  temp1           1    2[BANK0 ] unsigned char 
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
;;      Locals:         0       2       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_delay
;; This function is called by:
;;		_display
;; This function uses a non-reentrant model
;;
psect	text268
	file	"D:\TI\PIC course\Project ------- Traffic light controller\LCD 4 BIT.h"
	line	27
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 6
; Regs used in _lcd_data: [wreg+status,2+status,0+pclath+cstack]
;lcd_data@data stored from wreg
	line	29
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(lcd_data@data)
	
l2032:	
;LCD 4 BIT.h: 28: unsigned char temp1;
;LCD 4 BIT.h: 29: PORTD=data&0xF0;
	movf	(lcd_data@data),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	30
	
l2034:	
;LCD 4 BIT.h: 30: RD1=1;
	bsf	(65/8),(65)&7
	line	31
	
l2036:	
;LCD 4 BIT.h: 31: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	32
	
l2038:	
;LCD 4 BIT.h: 32: RD0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(64/8),(64)&7
	line	33
	
l2040:	
;LCD 4 BIT.h: 33: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	34
	
l2042:	
;LCD 4 BIT.h: 34: RD0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7
	line	35
	
l2044:	
;LCD 4 BIT.h: 35: temp1=data<<4;
	movf	(lcd_data@data),w
	movwf	(??_lcd_data+0)+0
	movlw	(04h)-1
u2775:
	clrc
	rlf	(??_lcd_data+0)+0,f
	addlw	-1
	skipz
	goto	u2775
	clrc
	rlf	(??_lcd_data+0)+0,w
	movwf	(??_lcd_data+1)+0
	movf	(??_lcd_data+1)+0,w
	movwf	(lcd_data@temp1)
	line	36
	
l2046:	
;LCD 4 BIT.h: 36: PORTD=temp1&0xF0;
	movf	(lcd_data@temp1),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	37
	
l2048:	
;LCD 4 BIT.h: 37: RD1=1;
	bsf	(65/8),(65)&7
	line	38
	
l2050:	
;LCD 4 BIT.h: 38: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	39
	
l2052:	
;LCD 4 BIT.h: 39: RD0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(64/8),(64)&7
	line	40
	
l2054:	
;LCD 4 BIT.h: 40: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	41
	
l2056:	
;LCD 4 BIT.h: 41: RD0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7
	line	44
	
l570:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
	global	_lcd_command
psect	text269,local,class=CODE,delta=2
global __ptext269
__ptext269:

;; *************** function _lcd_command *****************
;; Defined at:
;;		line 9 in file "D:\TI\PIC course\Project ------- Traffic light controller\LCD 4 BIT.h"
;; Parameters:    Size  Location     Type
;;  command         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  command         1    3[BANK0 ] unsigned char 
;;  temp            1    2[BANK0 ] unsigned char 
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
;;      Locals:         0       2       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_delay
;; This function is called by:
;;		_lcd_initialize
;;		_main
;; This function uses a non-reentrant model
;;
psect	text269
	file	"D:\TI\PIC course\Project ------- Traffic light controller\LCD 4 BIT.h"
	line	9
	global	__size_of_lcd_command
	__size_of_lcd_command	equ	__end_of_lcd_command-_lcd_command
	
_lcd_command:	
	opt	stack 7
; Regs used in _lcd_command: [wreg+status,2+status,0+pclath+cstack]
;lcd_command@command stored from wreg
	line	11
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(lcd_command@command)
	
l2006:	
;LCD 4 BIT.h: 10: unsigned char temp;
;LCD 4 BIT.h: 11: PORTD=command&0xF0;
	movf	(lcd_command@command),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	12
	
l2008:	
;LCD 4 BIT.h: 12: RD1=0;
	bcf	(65/8),(65)&7
	line	13
	
l2010:	
;LCD 4 BIT.h: 13: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	14
	
l2012:	
;LCD 4 BIT.h: 14: RD0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(64/8),(64)&7
	line	15
	
l2014:	
;LCD 4 BIT.h: 15: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	16
	
l2016:	
;LCD 4 BIT.h: 16: RD0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7
	line	17
	
l2018:	
;LCD 4 BIT.h: 17: temp=command<<4;
	movf	(lcd_command@command),w
	movwf	(??_lcd_command+0)+0
	movlw	(04h)-1
u2765:
	clrc
	rlf	(??_lcd_command+0)+0,f
	addlw	-1
	skipz
	goto	u2765
	clrc
	rlf	(??_lcd_command+0)+0,w
	movwf	(??_lcd_command+1)+0
	movf	(??_lcd_command+1)+0,w
	movwf	(lcd_command@temp)
	line	18
	
l2020:	
;LCD 4 BIT.h: 18: PORTD=temp&0xF0;
	movf	(lcd_command@temp),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	19
	
l2022:	
;LCD 4 BIT.h: 19: RD1=0;
	bcf	(65/8),(65)&7
	line	20
	
l2024:	
;LCD 4 BIT.h: 20: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	21
	
l2026:	
;LCD 4 BIT.h: 21: RD0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(64/8),(64)&7
	line	22
	
l2028:	
;LCD 4 BIT.h: 22: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	23
	
l2030:	
;LCD 4 BIT.h: 23: RD0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7
	line	25
	
l567:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_command
	__end_of_lcd_command:
;; =============== function _lcd_command ends ============

	signat	_lcd_command,4216
	global	_c_way
psect	text270,local,class=CODE,delta=2
global __ptext270
__ptext270:

;; *************** function _c_way *****************
;; Defined at:
;;		line 55 in file "D:\TI\PIC course\Project ------- Traffic light controller\main.c"
;; Parameters:    Size  Location     Type
;;  R               1    wreg     unsigned char 
;;  Y               1    6[COMMON] unsigned char 
;;  G               1    7[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  R               1    0[BANK0 ] unsigned char 
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
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       1       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text270
	file	"D:\TI\PIC course\Project ------- Traffic light controller\main.c"
	line	55
	global	__size_of_c_way
	__size_of_c_way	equ	__end_of_c_way-_c_way
	
_c_way:	
	opt	stack 7
; Regs used in _c_way: [wreg]
;c_way@R stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(c_way@R)
	line	56
	
l2000:	
;main.c: 56: RC5=R;
	btfsc	(c_way@R),0
	goto	u2691
	goto	u2690
	
u2691:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(61/8),(61)&7
	goto	u2704
u2690:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(61/8),(61)&7
u2704:
	line	57
;main.c: 57: RC6=Y;
	btfsc	(c_way@Y),0
	goto	u2711
	goto	u2710
	
u2711:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(62/8),(62)&7
	goto	u2724
u2710:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
u2724:
	line	58
;main.c: 58: RC7=G;
	btfsc	(c_way@G),0
	goto	u2731
	goto	u2730
	
u2731:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(63/8),(63)&7
	goto	u2744
u2730:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(63/8),(63)&7
u2744:
	line	60
	
l603:	
	return
	opt stack 0
GLOBAL	__end_of_c_way
	__end_of_c_way:
;; =============== function _c_way ends ============

	signat	_c_way,12408
	global	_b_way
psect	text271,local,class=CODE,delta=2
global __ptext271
__ptext271:

;; *************** function _b_way *****************
;; Defined at:
;;		line 48 in file "D:\TI\PIC course\Project ------- Traffic light controller\main.c"
;; Parameters:    Size  Location     Type
;;  R               1    wreg     unsigned char 
;;  Y               1    6[COMMON] unsigned char 
;;  G               1    7[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  R               1    0[BANK0 ] unsigned char 
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
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       1       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text271
	file	"D:\TI\PIC course\Project ------- Traffic light controller\main.c"
	line	48
	global	__size_of_b_way
	__size_of_b_way	equ	__end_of_b_way-_b_way
	
_b_way:	
	opt	stack 7
; Regs used in _b_way: [wreg]
;b_way@R stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(b_way@R)
	line	49
	
l1998:	
;main.c: 49: RC2=R;
	btfsc	(b_way@R),0
	goto	u2631
	goto	u2630
	
u2631:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(58/8),(58)&7
	goto	u2644
u2630:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
u2644:
	line	50
;main.c: 50: RC3=Y;
	btfsc	(b_way@Y),0
	goto	u2651
	goto	u2650
	
u2651:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(59/8),(59)&7
	goto	u2664
u2650:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7
u2664:
	line	51
;main.c: 51: RC4=G;
	btfsc	(b_way@G),0
	goto	u2671
	goto	u2670
	
u2671:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
	goto	u2684
u2670:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
u2684:
	line	53
	
l600:	
	return
	opt stack 0
GLOBAL	__end_of_b_way
	__end_of_b_way:
;; =============== function _b_way ends ============

	signat	_b_way,12408
	global	_a_way
psect	text272,local,class=CODE,delta=2
global __ptext272
__ptext272:

;; *************** function _a_way *****************
;; Defined at:
;;		line 40 in file "D:\TI\PIC course\Project ------- Traffic light controller\main.c"
;; Parameters:    Size  Location     Type
;;  R               1    wreg     unsigned char 
;;  Y               1    6[COMMON] unsigned char 
;;  G               1    7[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  R               1    0[BANK0 ] unsigned char 
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
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       1       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text272
	file	"D:\TI\PIC course\Project ------- Traffic light controller\main.c"
	line	40
	global	__size_of_a_way
	__size_of_a_way	equ	__end_of_a_way-_a_way
	
_a_way:	
	opt	stack 7
; Regs used in _a_way: [wreg]
;a_way@R stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(a_way@R)
	line	41
	
l1996:	
;main.c: 41: RB7=R;
	btfsc	(a_way@R),0
	goto	u2571
	goto	u2570
	
u2571:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(55/8),(55)&7
	goto	u2584
u2570:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(55/8),(55)&7
u2584:
	line	42
;main.c: 42: RC0=Y;
	btfsc	(a_way@Y),0
	goto	u2591
	goto	u2590
	
u2591:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	goto	u2604
u2590:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
u2604:
	line	43
;main.c: 43: RC1=G;
	btfsc	(a_way@G),0
	goto	u2611
	goto	u2610
	
u2611:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(57/8),(57)&7
	goto	u2624
u2610:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(57/8),(57)&7
u2624:
	line	45
	
l597:	
	return
	opt stack 0
GLOBAL	__end_of_a_way
	__end_of_a_way:
;; =============== function _a_way ends ============

	signat	_a_way,12408
	global	_Timer_Delay_1Sec
psect	text273,local,class=CODE,delta=2
global __ptext273
__ptext273:

;; *************** function _Timer_Delay_1Sec *****************
;; Defined at:
;;		line 22 in file "D:\TI\PIC course\Project ------- Traffic light controller\main.c"
;; Parameters:    Size  Location     Type
;;  j               2    6[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2    2[BANK0 ] int 
;;  k               2    0[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, btemp+0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       4       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text273
	file	"D:\TI\PIC course\Project ------- Traffic light controller\main.c"
	line	22
	global	__size_of_Timer_Delay_1Sec
	__size_of_Timer_Delay_1Sec	equ	__end_of_Timer_Delay_1Sec-_Timer_Delay_1Sec
	
_Timer_Delay_1Sec:	
	opt	stack 7
; Regs used in _Timer_Delay_1Sec: [wreg+btemp+0]
	line	23
	
l1980:	
;main.c: 23: for(int k=0;k<j;k++)
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(Timer_Delay_1Sec@k)
	movlw	high(0)
	movwf	((Timer_Delay_1Sec@k))+1
	goto	l586
	line	24
	
l587:	
	line	25
	
l1982:	
;main.c: 24: {
;main.c: 25: for(int i=0;i<=20;i++)
	movlw	low(0)
	movwf	(Timer_Delay_1Sec@i)
	movlw	high(0)
	movwf	((Timer_Delay_1Sec@i))+1
	
l1984:	
	movf	(Timer_Delay_1Sec@i+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(015h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2505
	movlw	low(015h)
	subwf	(Timer_Delay_1Sec@i),w
u2505:

	skipc
	goto	u2501
	goto	u2500
u2501:
	goto	l588
u2500:
	
l1986:	
	goto	l589
	line	26
	
l588:	
	line	27
;main.c: 26: {
;main.c: 27: T0CS=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1037/8)^080h,(1037)&7
	line	28
;main.c: 28: T0SE=0;
	bcf	(1036/8)^080h,(1036)&7
	line	29
;main.c: 29: PSA=0;
	bcf	(1035/8)^080h,(1035)&7
	line	30
;main.c: 30: PS0=PS1=PS2=1;
	bsf	(1034/8)^080h,(1034)&7
	btfsc	(1034/8)^080h,(1034)&7
	goto	u2511
	goto	u2510
	
u2511:
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1033/8)^080h,(1033)&7
	goto	u2524
u2510:
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1033/8)^080h,(1033)&7
u2524:
	btfsc	(1033/8)^080h,(1033)&7
	goto	u2521
	goto	u2520
	
u2521:
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1032/8)^080h,(1032)&7
	goto	u2534
u2520:
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1032/8)^080h,(1032)&7
u2534:
	line	31
	
l1988:	
;main.c: 31: TMR0=60;
	movlw	(03Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(1)	;volatile
	line	32
;main.c: 32: while(T0IF==0);
	goto	l590
	
l591:	
	
l590:	
	btfss	(90/8),(90)&7
	goto	u2541
	goto	u2540
u2541:
	goto	l591
u2540:
	
l592:	
	line	33
;main.c: 33: T0IF=0;
	bcf	(90/8),(90)&7
	line	25
	
l1990:	
	movlw	low(01h)
	addwf	(Timer_Delay_1Sec@i),f
	skipnc
	incf	(Timer_Delay_1Sec@i+1),f
	movlw	high(01h)
	addwf	(Timer_Delay_1Sec@i+1),f
	
l1992:	
	movf	(Timer_Delay_1Sec@i+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(015h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2555
	movlw	low(015h)
	subwf	(Timer_Delay_1Sec@i),w
u2555:

	skipc
	goto	u2551
	goto	u2550
u2551:
	goto	l588
u2550:
	
l589:	
	line	23
	
l1994:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(Timer_Delay_1Sec@k),f
	skipnc
	incf	(Timer_Delay_1Sec@k+1),f
	movlw	high(01h)
	addwf	(Timer_Delay_1Sec@k+1),f
	
l586:	
	movf	(Timer_Delay_1Sec@j+1),w
	subwf	(Timer_Delay_1Sec@k+1),w
	skipz
	goto	u2565
	movf	(Timer_Delay_1Sec@j),w
	subwf	(Timer_Delay_1Sec@k),w
u2565:
	skipc
	goto	u2561
	goto	u2560
u2561:
	goto	l587
u2560:
	
l593:	
	line	37
	
l594:	
	return
	opt stack 0
GLOBAL	__end_of_Timer_Delay_1Sec
	__end_of_Timer_Delay_1Sec:
;; =============== function _Timer_Delay_1Sec ends ============

	signat	_Timer_Delay_1Sec,4216
	global	_delay
psect	text274,local,class=CODE,delta=2
global __ptext274
__ptext274:

;; *************** function _delay *****************
;; Defined at:
;;		line 4 in file "D:\TI\PIC course\Project ------- Traffic light controller\LCD 4 BIT.h"
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
;;		_lcd_command
;;		_lcd_data
;; This function uses a non-reentrant model
;;
psect	text274
	file	"D:\TI\PIC course\Project ------- Traffic light controller\LCD 4 BIT.h"
	line	4
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 6
; Regs used in _delay: [wreg]
	line	5
	
l1962:	
;LCD 4 BIT.h: 5: while(a--);
	goto	l561
	
l562:	
	
l561:	
	
l1964:	
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
	goto	l562
u2480:
	
l563:	
	line	6
	
l564:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
	global	_ext
psect	text275,local,class=CODE,delta=2
global __ptext275
__ptext275:

;; *************** function _ext *****************
;; Defined at:
;;		line 9 in file "D:\TI\PIC course\Project ------- Traffic light controller\main.c"
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
psect	text275
	file	"D:\TI\PIC course\Project ------- Traffic light controller\main.c"
	line	9
	global	__size_of_ext
	__size_of_ext	equ	__end_of_ext-_ext
	
_ext:	
	opt	stack 4
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
	movf	btemp+1,w
	movwf	(??_ext+3)
	ljmp	_ext
psect	text275
	line	10
	
i1l1966:	
;main.c: 10: if(INTF==1)
	btfss	(89/8),(89)&7
	goto	u249_21
	goto	u249_20
u249_21:
	goto	i1l582
u249_20:
	line	12
	
i1l1968:	
;main.c: 11: {
;main.c: 12: night_mode=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_night_mode)
	bsf	status,0
	rlf	(_night_mode),f
	line	13
	
i1l1970:	
;main.c: 13: INTF=0;
	bcf	(89/8),(89)&7
	line	14
	
i1l1972:	
;main.c: 14: RB1=1;
	bsf	(49/8),(49)&7
	line	15
	
i1l1974:	
;main.c: 15: delay(60000);
	movlw	low(0EA60h)
	movwf	(?i1_delay)
	movlw	high(0EA60h)
	movwf	((?i1_delay))+1
	fcall	i1_delay
	line	16
	
i1l1976:	
;main.c: 16: delay(60000);
	movlw	low(0EA60h)
	movwf	(?i1_delay)
	movlw	high(0EA60h)
	movwf	((?i1_delay))+1
	fcall	i1_delay
	line	17
	
i1l1978:	
;main.c: 17: RB1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(49/8),(49)&7
	line	18
	
i1l582:	
	line	20
	
i1l583:	
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
psect	text276,local,class=CODE,delta=2
global __ptext276
__ptext276:

;; *************** function i1_delay *****************
;; Defined at:
;;		line 4 in file "D:\TI\PIC course\Project ------- Traffic light controller\LCD 4 BIT.h"
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
psect	text276
	file	"D:\TI\PIC course\Project ------- Traffic light controller\LCD 4 BIT.h"
	line	4
	global	__size_ofi1_delay
	__size_ofi1_delay	equ	__end_ofi1_delay-i1_delay
	
i1_delay:	
	opt	stack 3
; Regs used in i1_delay: [wreg]
	line	5
	
i1l2002:	
;LCD 4 BIT.h: 5: while(a--);
	goto	i1l561
	
i1l562:	
	
i1l561:	
	
i1l2004:	
	movlw	low(01h)
	subwf	(i1delay@a),f
	movlw	high(01h)
	skipc
	decf	(i1delay@a+1),f
	subwf	(i1delay@a+1),f
	movlw	high(0FFFFh)
	xorwf	((i1delay@a+1)),w
	skipz
	goto	u275_25
	movlw	low(0FFFFh)
	xorwf	((i1delay@a)),w
u275_25:

	skipz
	goto	u275_21
	goto	u275_20
u275_21:
	goto	i1l562
u275_20:
	
i1l563:	
	line	6
	
i1l564:	
	return
	opt stack 0
GLOBAL	__end_ofi1_delay
	__end_ofi1_delay:
;; =============== function i1_delay ends ============

	signat	i1_delay,88
psect	text277,local,class=CODE,delta=2
global __ptext277
__ptext277:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
