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
	FNCALL	_main,_port_init
	FNCALL	_main,_lcd_init
	FNCALL	_main,_i2c_init
	FNCALL	_main,_lcd_command
	FNCALL	_main,_delay
	FNCALL	_main,_lcd_display
	FNCALL	_main,_i2c_sspifclr
	FNCALL	_main,_lcd_data
	FNCALL	_lcd_init,_lcd_command
	FNCALL	_lcd_display,_lcd_data
	FNCALL	_lcd_data,_delay
	FNCALL	_lcd_command,_delay
	FNROOT	_main
	global	_PORTD
psect	text126,local,class=CODE,delta=2
global __ptext126
__ptext126:
_PORTD	set	8
	global	_SSPBUF
_SSPBUF	set	19
	global	_SSPCON
_SSPCON	set	20
	global	_SSPIF
_SSPIF	set	99
	global	_en
_en	set	66
	global	_rs
_rs	set	64
	global	_rw
_rw	set	65
	global	_SSPADD
_SSPADD	set	147
	global	_SSPSTAT
_SSPSTAT	set	148
	global	_TRISD
_TRISD	set	136
	global	_TRISC3
_TRISC3	set	1083
	global	_TRISC4
_TRISC4	set	1084
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
	retlw	69	;'E'
	retlw	70	;'F'
	retlw	89	;'Y'
	retlw	32	;' '
	retlw	84	;'T'
	retlw	69	;'E'
	retlw	67	;'C'
	retlw	72	;'H'
	retlw	32	;' '
	retlw	67	;'C'
	retlw	69	;'E'
	retlw	78	;'N'
	retlw	84	;'T'
	retlw	69	;'E'
	retlw	82	;'R'
	retlw	0
psect	strings
	file	"i2c slave.as"
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
	global	?_lcd_command
?_lcd_command:	; 0 bytes @ 0x0
	global	??_i2c_init
??_i2c_init:	; 0 bytes @ 0x0
	global	?_lcd_data
?_lcd_data:	; 0 bytes @ 0x0
	global	?_i2c_init
?_i2c_init:	; 0 bytes @ 0x0
	global	?_i2c_sspifclr
?_i2c_sspifclr:	; 0 bytes @ 0x0
	global	?_port_init
?_port_init:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	??_port_init
??_port_init:	; 0 bytes @ 0x0
	global	??_i2c_sspifclr
??_i2c_sspifclr:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	delay@Delay
delay@Delay:	; 2 bytes @ 0x0
	ds	2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	??_lcd_command
??_lcd_command:	; 0 bytes @ 0x2
	global	??_lcd_data
??_lcd_data:	; 0 bytes @ 0x2
	ds	2
	global	lcd_data@ta
lcd_data@ta:	; 1 bytes @ 0x4
	global	lcd_command@mand
lcd_command@mand:	; 1 bytes @ 0x4
	ds	1
	global	lcd_data@da
lcd_data@da:	; 1 bytes @ 0x5
	global	lcd_command@com
lcd_command@com:	; 1 bytes @ 0x5
	ds	1
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x6
	global	?_lcd_display
?_lcd_display:	; 0 bytes @ 0x6
	global	lcd_display@n
lcd_display@n:	; 2 bytes @ 0x6
	ds	2
	global	??_lcd_display
??_lcd_display:	; 0 bytes @ 0x8
	ds	2
	global	lcd_display@word
lcd_display@word:	; 1 bytes @ 0xA
	ds	1
	global	lcd_display@l
lcd_display@l:	; 1 bytes @ 0xB
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0xC
	ds	1
	global	main@masda
main@masda:	; 1 bytes @ 0xD
	ds	1
;;Data sizes: Strings 16, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; lcd_display@word	PTR const unsigned char  size(1) Largest target is 16
;;		 -> STR_1(CODE[16]), 
;;


;; COMMON:	_main->_lcd_display
;; COMMON:	_lcd_init->_lcd_command
;; COMMON:	_lcd_display->_lcd_data
;; Critical Paths (_lcd_data)
;; COMMON:	_lcd_data->_delay

;; Critical Paths (_lcd_command)
;; COMMON:	_lcd_command->_delay

;;
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0

;;
;;Call Graph Tables:

;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _main                                                 2     2      0     330
;;                                             12 COMMON     2     2      0
;;                          _port_init
;;                           _lcd_init
;;                           _i2c_init
;;                        _lcd_command
;;                              _delay
;;                        _lcd_display
;;                       _i2c_sspifclr
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             0     0      0      60
;;                        _lcd_command
;; ---------------------------------------------------------------------------------
;; (1) _lcd_display                                          6     4      2     120
;;                                              6 COMMON     6     4      2
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (0) _lcd_data                                             4     4      0      60
;;                                              2 COMMON     4     4      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (0) _lcd_command                                          4     4      0      60
;;                                              2 COMMON     4     4      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (4294967295) _i2c_init                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4294967295) _delay                                       2     0      2      15
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; (4294967295) _i2c_sspifclr                                0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4294967295) _port_init                                   0     0      0       0
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
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;COMMON               E      E       E       1      100.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
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
;;		line 88 in file "D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Slave\i2c slave.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  masda           1   13[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_port_init
;;		_lcd_init
;;		_i2c_init
;;		_lcd_command
;;		_delay
;;		_lcd_display
;;		_i2c_sspifclr
;;		_lcd_data
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Slave\i2c slave.c"
	line	88
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	89
	
l1834:	
;i2c slave.c: 89: port_init();
	fcall	_port_init
	line	90
	
l1836:	
;i2c slave.c: 90: lcd_init();
	fcall	_lcd_init
	line	91
	
l1838:	
;i2c slave.c: 91: i2c_init();
	fcall	_i2c_init
	line	94
	
l1840:	
;i2c slave.c: 93: unsigned char masda;
;i2c slave.c: 94: lcd_command(0x80);
	movlw	(080h)
	fcall	_lcd_command
	line	95
	
l1842:	
;i2c slave.c: 95: delay(100);
	movlw	low(064h)
	movwf	(?_delay)
	movlw	high(064h)
	movwf	((?_delay))+1
	fcall	_delay
	line	96
	
l1844:	
;i2c slave.c: 96: lcd_display("EFY TECH CENTER",14);
	movlw	low(0Eh)
	movwf	(?_lcd_display)
	movlw	high(0Eh)
	movwf	((?_lcd_display))+1
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_lcd_display
	line	98
;i2c slave.c: 98: while(1)
	
l598:	
	line	103
	
l1846:	
;i2c slave.c: 99: {
;i2c slave.c: 103: i2c_sspifclr();
	fcall	_i2c_sspifclr
	line	104
	
l1848:	
;i2c slave.c: 104: masda=SSPBUF;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@masda)
	line	106
	
l1850:	
;i2c slave.c: 106: lcd_command(0xC0);
	movlw	(0C0h)
	fcall	_lcd_command
	line	107
	
l1852:	
;i2c slave.c: 107: lcd_data(masda);
	movf	(main@masda),w
	fcall	_lcd_data
	line	122
	
l599:	
	line	98
	goto	l598
	
l600:	
	line	123
	
l601:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_init
psect	text127,local,class=CODE,delta=2
global __ptext127
__ptext127:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 36 in file "D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Slave\i2c slave.c"
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
psect	text127
	file	"D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Slave\i2c slave.c"
	line	36
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 2
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	37
	
l1832:	
;i2c slave.c: 37: lcd_command(0x02);
	movlw	(02h)
	fcall	_lcd_command
	line	38
;i2c slave.c: 38: lcd_command(0x2c);
	movlw	(02Ch)
	fcall	_lcd_command
	line	39
;i2c slave.c: 39: lcd_command(0x06);
	movlw	(06h)
	fcall	_lcd_command
	line	40
;i2c slave.c: 40: lcd_command(0x0c);
	movlw	(0Ch)
	fcall	_lcd_command
	line	41
;i2c slave.c: 41: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	42
;i2c slave.c: 42: lcd_command(0x80);
	movlw	(080h)
	fcall	_lcd_command
	line	43
	
l580:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_lcd_display
psect	text128,local,class=CODE,delta=2
global __ptext128
__ptext128:

;; *************** function _lcd_display *****************
;; Defined at:
;;		line 63 in file "D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Slave\i2c slave.c"
;; Parameters:    Size  Location     Type
;;  word            1    wreg     PTR const unsigned char 
;;		 -> STR_1(16), 
;;  n               2    6[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  word            1   10[COMMON] PTR const unsigned char 
;;		 -> STR_1(16), 
;;  l               1   11[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text128
	file	"D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Slave\i2c slave.c"
	line	63
	global	__size_of_lcd_display
	__size_of_lcd_display	equ	__end_of_lcd_display-_lcd_display
	
_lcd_display:	
	opt	stack 2
; Regs used in _lcd_display: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_display@word stored from wreg
	line	65
	movwf	(lcd_display@word)
	
l1824:	
;i2c slave.c: 64: unsigned char l;
;i2c slave.c: 65: for(l=0;l<n;l++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(lcd_display@l)
	goto	l586
	line	66
	
l587:	
	line	67
	
l1826:	
;i2c slave.c: 66: {
;i2c slave.c: 67: lcd_data(word[l]);
	movf	(lcd_display@l),w
	addwf	(lcd_display@word),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	line	65
	
l1828:	
	movlw	(01h)
	movwf	(??_lcd_display+0)+0
	movf	(??_lcd_display+0)+0,w
	addwf	(lcd_display@l),f
	
l586:	
	
l1830:	
	movf	(lcd_display@l),w
	movwf	(??_lcd_display+0)+0
	clrf	(??_lcd_display+0)+0+1
	movf	(lcd_display@n+1),w
	subwf	1+(??_lcd_display+0)+0,w
	skipz
	goto	u2185
	movf	(lcd_display@n),w
	subwf	0+(??_lcd_display+0)+0,w
u2185:
	skipc
	goto	u2181
	goto	u2180
u2181:
	goto	l587
u2180:
	
l588:	
	line	69
	
l589:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_display
	__end_of_lcd_display:
;; =============== function _lcd_display ends ============

	signat	_lcd_display,8312
	global	_lcd_data
psect	text129,local,class=CODE,delta=2
global __ptext129
__ptext129:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 45 in file "D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Slave\i2c slave.c"
;; Parameters:    Size  Location     Type
;;  da              1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  da              1    5[COMMON] unsigned char 
;;  ta              1    4[COMMON] unsigned char 
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
;;		_lcd_display
;;		_main
;; This function uses a non-reentrant model
;;
psect	text129
	file	"D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Slave\i2c slave.c"
	line	45
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 1
; Regs used in _lcd_data: [wreg+status,2+status,0+pclath+cstack]
;lcd_data@da stored from wreg
	line	47
	movwf	(lcd_data@da)
	
l1798:	
;i2c slave.c: 46: unsigned char ta;
;i2c slave.c: 47: PORTD=da&0xf0;
	movf	(lcd_data@da),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	48
	
l1800:	
;i2c slave.c: 48: en=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(66/8),(66)&7
	line	49
	
l1802:	
;i2c slave.c: 49: rs=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(64/8),(64)&7
	line	50
	
l1804:	
;i2c slave.c: 50: rw=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	51
	
l1806:	
;i2c slave.c: 51: delay(10);
	movlw	low(0Ah)
	movwf	(?_delay)
	movlw	high(0Ah)
	movwf	((?_delay))+1
	fcall	_delay
	line	52
	
l1808:	
;i2c slave.c: 52: en=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	53
	
l1810:	
;i2c slave.c: 53: ta=da<<4;
	movf	(lcd_data@da),w
	movwf	(??_lcd_data+0)+0
	movlw	(04h)-1
u2175:
	clrc
	rlf	(??_lcd_data+0)+0,f
	addlw	-1
	skipz
	goto	u2175
	clrc
	rlf	(??_lcd_data+0)+0,w
	movwf	(??_lcd_data+1)+0
	movf	(??_lcd_data+1)+0,w
	movwf	(lcd_data@ta)
	line	54
	
l1812:	
;i2c slave.c: 54: PORTD=ta;
	movf	(lcd_data@ta),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	55
	
l1814:	
;i2c slave.c: 55: en=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(66/8),(66)&7
	line	56
	
l1816:	
;i2c slave.c: 56: rs=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(64/8),(64)&7
	line	57
	
l1818:	
;i2c slave.c: 57: rw=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	58
	
l1820:	
;i2c slave.c: 58: delay(10);
	movlw	low(0Ah)
	movwf	(?_delay)
	movlw	high(0Ah)
	movwf	((?_delay))+1
	fcall	_delay
	line	59
	
l1822:	
;i2c slave.c: 59: en=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	60
	
l583:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
	global	_lcd_command
psect	text130,local,class=CODE,delta=2
global __ptext130
__ptext130:

;; *************** function _lcd_command *****************
;; Defined at:
;;		line 19 in file "D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Slave\i2c slave.c"
;; Parameters:    Size  Location     Type
;;  com             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  com             1    5[COMMON] unsigned char 
;;  mand            1    4[COMMON] unsigned char 
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
;;		_lcd_init
;;		_main
;; This function uses a non-reentrant model
;;
psect	text130
	file	"D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Slave\i2c slave.c"
	line	19
	global	__size_of_lcd_command
	__size_of_lcd_command	equ	__end_of_lcd_command-_lcd_command
	
_lcd_command:	
	opt	stack 1
; Regs used in _lcd_command: [wreg+status,2+status,0+pclath+cstack]
;lcd_command@com stored from wreg
	line	21
	movwf	(lcd_command@com)
	
l1772:	
;i2c slave.c: 20: unsigned char mand;
;i2c slave.c: 21: PORTD=com&0xf0;
	movf	(lcd_command@com),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	22
	
l1774:	
;i2c slave.c: 22: rs=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7
	line	23
	
l1776:	
;i2c slave.c: 23: rw=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	24
	
l1778:	
;i2c slave.c: 24: en=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(66/8),(66)&7
	line	25
	
l1780:	
;i2c slave.c: 25: delay(10);
	movlw	low(0Ah)
	movwf	(?_delay)
	movlw	high(0Ah)
	movwf	((?_delay))+1
	fcall	_delay
	line	26
	
l1782:	
;i2c slave.c: 26: en=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	27
	
l1784:	
;i2c slave.c: 27: mand=com<<4;
	movf	(lcd_command@com),w
	movwf	(??_lcd_command+0)+0
	movlw	(04h)-1
u2165:
	clrc
	rlf	(??_lcd_command+0)+0,f
	addlw	-1
	skipz
	goto	u2165
	clrc
	rlf	(??_lcd_command+0)+0,w
	movwf	(??_lcd_command+1)+0
	movf	(??_lcd_command+1)+0,w
	movwf	(lcd_command@mand)
	line	28
	
l1786:	
;i2c slave.c: 28: PORTD=mand&0xf0;
	movf	(lcd_command@mand),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	29
	
l1788:	
;i2c slave.c: 29: rs=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7
	line	30
	
l1790:	
;i2c slave.c: 30: rw=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	31
	
l1792:	
;i2c slave.c: 31: en=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(66/8),(66)&7
	line	32
	
l1794:	
;i2c slave.c: 32: delay(10);
	movlw	low(0Ah)
	movwf	(?_delay)
	movlw	high(0Ah)
	movwf	((?_delay))+1
	fcall	_delay
	line	33
	
l1796:	
;i2c slave.c: 33: en=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	34
	
l577:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_command
	__end_of_lcd_command:
;; =============== function _lcd_command ends ============

	signat	_lcd_command,4216
	global	_i2c_init
psect	text131,local,class=CODE,delta=2
global __ptext131
__ptext131:

;; *************** function _i2c_init *****************
;; Defined at:
;;		line 78 in file "D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Slave\i2c slave.c"
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
;;		On exit  : 0/0
;;		Unchanged: 0/0
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text131
	file	"D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Slave\i2c slave.c"
	line	78
	global	__size_of_i2c_init
	__size_of_i2c_init	equ	__end_of_i2c_init-_i2c_init
	
_i2c_init:	
	opt	stack 0
; Regs used in _i2c_init: [wreg]
	line	79
	
l1526:	
;i2c slave.c: 79: TRISC3=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1083/8)^080h,(1083)&7
	line	80
;i2c slave.c: 80: TRISC4=1;
	bsf	(1084/8)^080h,(1084)&7
	line	81
	
l1528:	
;i2c slave.c: 81: SSPSTAT=0x80;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(148)^080h	;volatile
	line	83
;i2c slave.c: 83: SSPCON=0x26;
	movlw	(026h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	84
;i2c slave.c: 84: SSPADD=0x02;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(147)^080h	;volatile
	line	85
	
l595:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_init
	__end_of_i2c_init:
;; =============== function _i2c_init ends ============

	signat	_i2c_init,88
	global	_delay
psect	text132,local,class=CODE,delta=2
global __ptext132
__ptext132:

;; *************** function _delay *****************
;; Defined at:
;;		line 8 in file "D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Slave\i2c slave.c"
;; Parameters:    Size  Location     Type
;;  Delay           2    0[COMMON] unsigned int 
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
psect	text132
	file	"D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Slave\i2c slave.c"
	line	8
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 0
; Regs used in _delay: [wreg]
	line	9
	
l1522:	
;i2c slave.c: 9: while(Delay--);
	goto	l565
	
l566:	
	
l565:	
	
l1524:	
	movlw	low(01h)
	subwf	(delay@Delay),f
	movlw	high(01h)
	skipc
	decf	(delay@Delay+1),f
	subwf	(delay@Delay+1),f
	movlw	high(0FFFFh)
	xorwf	((delay@Delay+1)),w
	skipz
	goto	u1475
	movlw	low(0FFFFh)
	xorwf	((delay@Delay)),w
u1475:

	skipz
	goto	u1471
	goto	u1470
u1471:
	goto	l566
u1470:
	
l567:	
	line	10
	
l568:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
	global	_i2c_sspifclr
psect	text133,local,class=CODE,delta=2
global __ptext133
__ptext133:

;; *************** function _i2c_sspifclr *****************
;; Defined at:
;;		line 13 in file "D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Slave\i2c slave.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
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
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text133
	file	"D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Slave\i2c slave.c"
	line	13
	global	__size_of_i2c_sspifclr
	__size_of_i2c_sspifclr	equ	__end_of_i2c_sspifclr-_i2c_sspifclr
	
_i2c_sspifclr:	
	opt	stack 0
; Regs used in _i2c_sspifclr: []
	line	14
	
l1520:	
;i2c slave.c: 14: while(SSPIF==0);
	goto	l571
	
l572:	
	
l571:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(99/8),(99)&7
	goto	u1461
	goto	u1460
u1461:
	goto	l572
u1460:
	
l573:	
	line	15
;i2c slave.c: 15: SSPIF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(99/8),(99)&7
	line	16
	
l574:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_sspifclr
	__end_of_i2c_sspifclr:
;; =============== function _i2c_sspifclr ends ============

	signat	_i2c_sspifclr,88
	global	_port_init
psect	text134,local,class=CODE,delta=2
global __ptext134
__ptext134:

;; *************** function _port_init *****************
;; Defined at:
;;		line 72 in file "D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Slave\i2c slave.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
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
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text134
	file	"D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Slave\i2c slave.c"
	line	72
	global	__size_of_port_init
	__size_of_port_init	equ	__end_of_port_init-_port_init
	
_port_init:	
	opt	stack 0
; Regs used in _port_init: [status,2]
	line	73
	
l1530:	
;i2c slave.c: 73: TRISD=0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	74
;i2c slave.c: 74: PORTD=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	75
	
l592:	
	return
	opt stack 0
GLOBAL	__end_of_port_init
	__end_of_port_init:
;; =============== function _port_init ends ============

	signat	_port_init,88
psect	text135,local,class=CODE,delta=2
global __ptext135
__ptext135:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
