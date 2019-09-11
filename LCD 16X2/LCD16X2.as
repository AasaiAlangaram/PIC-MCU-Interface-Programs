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
# 2 "D:\TI\PIC\PIC course\LCD 16X2\lcd16x2.c"
	psect config,class=CONFIG,delta=2 ;#
# 2 "D:\TI\PIC\PIC course\LCD 16X2\lcd16x2.c"
	dw 0x3FFE&0x3F7F&0x3FFF&0x3FFB ;#
	FNCALL	_main,_lcd_initialize
	FNCALL	_main,_lcd_command
	FNCALL	_main,_lcd_data
	FNCALL	_main,_delay
	FNCALL	_lcd_initialize,_lcd_command
	FNCALL	_lcd_data,_delay
	FNCALL	_lcd_command,_delay
	FNROOT	_main
	global	_name
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"D:\TI\PIC\PIC course\LCD 16X2\lcd16x2.c"
	line	6

;initializer for _name
	retlw	054h
	retlw	048h
	retlw	049h
	retlw	043h
	retlw	04Bh
	retlw	020h
	retlw	049h
	retlw	04Eh
	retlw	044h
	retlw	049h
	retlw	041h
	retlw	0
	global	_PORTB
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	file	"LCD16X2.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"D:\TI\PIC\PIC course\LCD 16X2\lcd16x2.c"
_name:
       ds      12

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
	movlw low(__pdataBANK0+12)
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
	global	?_lcd_data
?_lcd_data:	; 0 bytes @ 0x0
	global	?_lcd_command
?_lcd_command:	; 0 bytes @ 0x0
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	?_lcd_initialize
?_lcd_initialize:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	delay@a
delay@a:	; 2 bytes @ 0x0
	ds	2
	global	??_lcd_data
??_lcd_data:	; 0 bytes @ 0x2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	??_lcd_command
??_lcd_command:	; 0 bytes @ 0x2
	global	lcd_data@data
lcd_data@data:	; 1 bytes @ 0x2
	global	lcd_command@command
lcd_command@command:	; 1 bytes @ 0x2
	ds	1
	global	??_lcd_initialize
??_lcd_initialize:	; 0 bytes @ 0x3
	global	??_main
??_main:	; 0 bytes @ 0x3
	global	main@a
main@a:	; 2 bytes @ 0x3
	ds	2
;;Data sizes: Strings 0, constant 0, data 12, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5       5
;; BANK0           80      0      12
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;; COMMON:	_main->_lcd_command
;; COMMON:	_main->_lcd_data
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
;; (2) _main                                                 2     2      0     222
;;                                              3 COMMON     2     2      0
;;                     _lcd_initialize
;;                        _lcd_command
;;                           _lcd_data
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _lcd_initialize                                       0     0      0      44
;;                        _lcd_command
;; ---------------------------------------------------------------------------------
;; (0) _lcd_data                                             1     1      0      44
;;                                              2 COMMON     1     1      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (0) _lcd_command                                          1     1      0      44
;;                                              2 COMMON     1     1      0
;;                              _delay
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
;;DATA                 0      0      14       5        0.0%
;;SFR0                 0      0       0       1        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;BITBANK0            50      0       0       3        0.0%
;;BANK0               50      0       C       4       15.0%
;;STACK                0      0       3       2        0.0%
;;BITCOMMON            E      0       0       0        0.0%
;;COMMON               E      5       5       1       35.7%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 39 in file "D:\TI\PIC\PIC course\LCD 16X2\lcd16x2.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  a               2    3[COMMON] int 
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
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_initialize
;;		_lcd_command
;;		_lcd_data
;;		_delay
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\TI\PIC\PIC course\LCD 16X2\lcd16x2.c"
	line	39
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2-btemp+0+pclath+cstack]
	line	40
	
l1816:	
;lcd16x2.c: 40: TRISC=0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	41
;lcd16x2.c: 41: TRISB=0x00;
	clrf	(134)^080h	;volatile
	line	42
;lcd16x2.c: 42: PORTC=PORTB=0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	clrf	(7)	;volatile
	line	43
	
l1818:	
;lcd16x2.c: 43: lcd_initialize ();
	fcall	_lcd_initialize
	line	44
;lcd16x2.c: 44: while(1)
	
l576:	
	line	46
	
l1820:	
;lcd16x2.c: 45: {
;lcd16x2.c: 46: lcd_command(0x81);
	movlw	(081h)
	fcall	_lcd_command
	line	47
	
l1822:	
;lcd16x2.c: 47: for(int a=0;a<=12;a++)
	movlw	low(0)
	movwf	(main@a)
	movlw	high(0)
	movwf	((main@a))+1
	
l1824:	
	movf	(main@a+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(0Dh))^80h
	subwf	btemp+0,w
	skipz
	goto	u2185
	movlw	low(0Dh)
	subwf	(main@a),w
u2185:

	skipc
	goto	u2181
	goto	u2180
u2181:
	goto	l577
u2180:
	
l1826:	
	goto	l578
	line	48
	
l577:	
	line	49
	
l1828:	
;lcd16x2.c: 48: {
;lcd16x2.c: 49: lcd_data(name[a]);
	movf	(main@a),w
	addlw	_name&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_lcd_data
	line	50
	
l1830:	
;lcd16x2.c: 50: delay(1000);
	movlw	low(03E8h)
	movwf	(?_delay)
	movlw	high(03E8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	47
	
l1832:	
	movlw	low(01h)
	addwf	(main@a),f
	skipnc
	incf	(main@a+1),f
	movlw	high(01h)
	addwf	(main@a+1),f
	
l1834:	
	movf	(main@a+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(0Dh))^80h
	subwf	btemp+0,w
	skipz
	goto	u2195
	movlw	low(0Dh)
	subwf	(main@a),w
u2195:

	skipc
	goto	u2191
	goto	u2190
u2191:
	goto	l577
u2190:
	
l578:	
	line	55
	
l579:	
	line	44
	goto	l576
	
l580:	
	line	56
	
l581:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_initialize
psect	text134,local,class=CODE,delta=2
global __ptext134
__ptext134:

;; *************** function _lcd_initialize *****************
;; Defined at:
;;		line 30 in file "D:\TI\PIC\PIC course\LCD 16X2\lcd16x2.c"
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
psect	text134
	file	"D:\TI\PIC\PIC course\LCD 16X2\lcd16x2.c"
	line	30
	global	__size_of_lcd_initialize
	__size_of_lcd_initialize	equ	__end_of_lcd_initialize-_lcd_initialize
	
_lcd_initialize:	
	opt	stack 2
; Regs used in _lcd_initialize: [wreg+status,2+status,0+pclath+cstack]
	line	31
	
l1814:	
;lcd16x2.c: 31: lcd_command(0x38);
	movlw	(038h)
	fcall	_lcd_command
	line	32
;lcd16x2.c: 32: lcd_command(0x06);
	movlw	(06h)
	fcall	_lcd_command
	line	33
;lcd16x2.c: 33: lcd_command(0x0c);
	movlw	(0Ch)
	fcall	_lcd_command
	line	34
;lcd16x2.c: 34: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	36
	
l573:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_initialize
	__end_of_lcd_initialize:
;; =============== function _lcd_initialize ends ============

	signat	_lcd_initialize,88
	global	_lcd_data
psect	text135,local,class=CODE,delta=2
global __ptext135
__ptext135:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 21 in file "D:\TI\PIC\PIC course\LCD 16X2\lcd16x2.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    2[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text135
	file	"D:\TI\PIC\PIC course\LCD 16X2\lcd16x2.c"
	line	21
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 1
; Regs used in _lcd_data: [wreg+status,2+status,0+pclath+cstack]
;lcd_data@data stored from wreg
	movwf	(lcd_data@data)
	line	22
	
l1802:	
;lcd16x2.c: 22: PORTC=data;
	movf	(lcd_data@data),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	23
	
l1804:	
;lcd16x2.c: 23: RB0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7
	line	24
	
l1806:	
;lcd16x2.c: 24: RB1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(49/8),(49)&7
	line	25
	
l1808:	
;lcd16x2.c: 25: RB2=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(50/8),(50)&7
	line	26
	
l1810:	
;lcd16x2.c: 26: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	27
	
l1812:	
;lcd16x2.c: 27: RB2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(50/8),(50)&7
	line	28
	
l570:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
	global	_lcd_command
psect	text136,local,class=CODE,delta=2
global __ptext136
__ptext136:

;; *************** function _lcd_command *****************
;; Defined at:
;;		line 12 in file "D:\TI\PIC\PIC course\LCD 16X2\lcd16x2.c"
;; Parameters:    Size  Location     Type
;;  command         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  command         1    2[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay
;; This function is called by:
;;		_lcd_initialize
;;		_main
;; This function uses a non-reentrant model
;;
psect	text136
	file	"D:\TI\PIC\PIC course\LCD 16X2\lcd16x2.c"
	line	12
	global	__size_of_lcd_command
	__size_of_lcd_command	equ	__end_of_lcd_command-_lcd_command
	
_lcd_command:	
	opt	stack 1
; Regs used in _lcd_command: [wreg+status,2+status,0+pclath+cstack]
;lcd_command@command stored from wreg
	movwf	(lcd_command@command)
	line	13
	
l1790:	
;lcd16x2.c: 13: PORTC=command;
	movf	(lcd_command@command),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	14
	
l1792:	
;lcd16x2.c: 14: RB0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(48/8),(48)&7
	line	15
	
l1794:	
;lcd16x2.c: 15: RB1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(49/8),(49)&7
	line	16
	
l1796:	
;lcd16x2.c: 16: RB2=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(50/8),(50)&7
	line	17
	
l1798:	
;lcd16x2.c: 17: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	18
	
l1800:	
;lcd16x2.c: 18: RB2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(50/8),(50)&7
	line	19
	
l567:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_command
	__end_of_lcd_command:
;; =============== function _lcd_command ends ============

	signat	_lcd_command,4216
	global	_delay
psect	text137,local,class=CODE,delta=2
global __ptext137
__ptext137:

;; *************** function _delay *****************
;; Defined at:
;;		line 8 in file "D:\TI\PIC\PIC course\LCD 16X2\lcd16x2.c"
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
psect	text137
	file	"D:\TI\PIC\PIC course\LCD 16X2\lcd16x2.c"
	line	8
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 0
; Regs used in _delay: [wreg]
	line	9
	
l1786:	
;lcd16x2.c: 9: while(a--);
	goto	l561
	
l562:	
	
l561:	
	
l1788:	
	movlw	low(01h)
	subwf	(delay@a),f
	movlw	high(01h)
	skipc
	decf	(delay@a+1),f
	subwf	(delay@a+1),f
	movlw	high(0FFFFh)
	xorwf	((delay@a+1)),w
	skipz
	goto	u2175
	movlw	low(0FFFFh)
	xorwf	((delay@a)),w
u2175:

	skipz
	goto	u2171
	goto	u2170
u2171:
	goto	l562
u2170:
	
l563:	
	line	10
	
l564:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
psect	text138,local,class=CODE,delta=2
global __ptext138
__ptext138:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
