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
	FNCALL	_main,_i2c_start
	FNCALL	_main,_i2c_write
	FNCALL	_main,_i2c_stop
	FNCALL	_lcd_init,_lcd_command
	FNCALL	_lcd_display,_lcd_data
	FNCALL	_lcd_command,_delay
	FNCALL	_lcd_data,_delay
	FNCALL	_i2c_stop,_i2c_sspifclr
	FNCALL	_i2c_start,_i2c_sspifclr
	FNCALL	_i2c_write,_i2c_wait
	FNCALL	_i2c_write,_i2c_sspifclr
	FNROOT	_main
	global	_PORTD
psect	text185,local,class=CODE,delta=2
global __ptext185
__ptext185:
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
	global	_SSPCON2
_SSPCON2	set	145
	global	_SSPSTAT
_SSPSTAT	set	148
	global	_TRISD
_TRISD	set	136
	global	_ACKDT
_ACKDT	set	1165
	global	_ACKEN
_ACKEN	set	1164
	global	_BF
_BF	set	1184
	global	_PEN
_PEN	set	1162
	global	_RCEN
_RCEN	set	1163
	global	_RSEN
_RSEN	set	1161
	global	_SEN
_SEN	set	1160
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
	file	"i2c master.as"
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
	global	?_i2c_init
?_i2c_init:	; 0 bytes @ 0x0
	global	??_i2c_write
??_i2c_write:	; 0 bytes @ 0x0
	global	??_i2c_init
??_i2c_init:	; 0 bytes @ 0x0
	global	?_i2c_sspifclr
?_i2c_sspifclr:	; 0 bytes @ 0x0
	global	?_lcd_command
?_lcd_command:	; 0 bytes @ 0x0
	global	?_lcd_data
?_lcd_data:	; 0 bytes @ 0x0
	global	?_i2c_start
?_i2c_start:	; 0 bytes @ 0x0
	global	??_i2c_start
??_i2c_start:	; 0 bytes @ 0x0
	global	??_i2c_stop
??_i2c_stop:	; 0 bytes @ 0x0
	global	?_i2c_write
?_i2c_write:	; 0 bytes @ 0x0
	global	?_i2c_stop
?_i2c_stop:	; 0 bytes @ 0x0
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	??_i2c_wait
??_i2c_wait:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_port_init
?_port_init:	; 0 bytes @ 0x0
	global	??_i2c_sspifclr
??_i2c_sspifclr:	; 0 bytes @ 0x0
	global	??_port_init
??_port_init:	; 0 bytes @ 0x0
	global	?_i2c_wait
?_i2c_wait:	; 0 bytes @ 0x0
	global	i2c_write@write
i2c_write@write:	; 1 bytes @ 0x0
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
	global	lcd_command@mand
lcd_command@mand:	; 1 bytes @ 0x4
	global	lcd_data@ta
lcd_data@ta:	; 1 bytes @ 0x4
	ds	1
	global	lcd_command@com
lcd_command@com:	; 1 bytes @ 0x5
	global	lcd_data@da
lcd_data@da:	; 1 bytes @ 0x5
	ds	1
	global	?_lcd_display
?_lcd_display:	; 0 bytes @ 0x6
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x6
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
;;Data sizes: Strings 16, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     12      12
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
;; Critical Paths (_lcd_command)
;; COMMON:	_lcd_command->_delay

;; Critical Paths (_lcd_data)
;; COMMON:	_lcd_data->_delay

;; Critical Paths (_i2c_stop)
;; Critical Paths (_i2c_start)
;; Critical Paths (_i2c_write)
;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0

;;
;;Call Graph Tables:

;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _main                                                 1     1      0     270
;;                          _port_init
;;                           _lcd_init
;;                           _i2c_init
;;                        _lcd_command
;;                              _delay
;;                        _lcd_display
;;                          _i2c_start
;;                          _i2c_write
;;                           _i2c_stop
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             0     0      0      60
;;                        _lcd_command
;; ---------------------------------------------------------------------------------
;; (1) _lcd_display                                          6     4      2     120
;;                                              6 COMMON     6     4      2
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (0) _lcd_command                                          4     4      0      60
;;                                              2 COMMON     4     4      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (0) _lcd_data                                             4     4      0      60
;;                                              2 COMMON     4     4      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (0) _i2c_stop                                             0     0      0       0
;;                       _i2c_sspifclr
;; ---------------------------------------------------------------------------------
;; (0) _i2c_start                                            0     0      0       0
;;                       _i2c_sspifclr
;; ---------------------------------------------------------------------------------
;; (0) _i2c_write                                            1     1      0      15
;;                                              0 COMMON     1     1      0
;;                           _i2c_wait
;;                       _i2c_sspifclr
;; ---------------------------------------------------------------------------------
;; (4294967295) _i2c_init                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4294967295) _i2c_sspifclr                                0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4294967295) _port_init                                   0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4294967295) _i2c_wait                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4294967295) _delay                                       2     0      2      15
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum call depth -1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _lcd_command (ROOT)
;;   _delay
;;
;; _lcd_data (ROOT)
;;   _delay
;;
;; _i2c_stop (ROOT)
;;   _i2c_sspifclr
;;
;; _i2c_start (ROOT)
;;   _i2c_sspifclr
;;
;; _i2c_write (ROOT)
;;   _i2c_wait
;;   _i2c_sspifclr
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;COMMON               E      C       C       1       85.7%
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
;;		line 83 in file "D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\i2c master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  masda           1    0        unsigned char 
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
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_port_init
;;		_lcd_init
;;		_i2c_init
;;		_lcd_command
;;		_delay
;;		_lcd_display
;;		_i2c_start
;;		_i2c_write
;;		_i2c_stop
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\i2c master.c"
	line	83
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	84
	
l1927:	
;i2c master.c: 84: port_init();
	fcall	_port_init
	line	85
	
l1929:	
;i2c master.c: 85: lcd_init();
	fcall	_lcd_init
	line	86
	
l1931:	
;i2c master.c: 86: i2c_init();
	fcall	_i2c_init
	line	89
	
l1933:	
;i2c master.c: 88: unsigned char masda;
;i2c master.c: 89: lcd_command(0x80);
	movlw	(080h)
	fcall	_lcd_command
	line	90
	
l1935:	
;i2c master.c: 90: delay(100);
	movlw	low(064h)
	movwf	(?_delay)
	movlw	high(064h)
	movwf	((?_delay))+1
	fcall	_delay
	line	91
	
l1937:	
;i2c master.c: 91: lcd_display("EFY TECH CENTER",14);
	movlw	low(0Eh)
	movwf	(?_lcd_display)
	movlw	high(0Eh)
	movwf	((?_lcd_display))+1
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_lcd_display
	line	93
	
l1939:	
;i2c master.c: 93: delay(50000);
	movlw	low(0C350h)
	movwf	(?_delay)
	movlw	high(0C350h)
	movwf	((?_delay))+1
	fcall	_delay
	line	95
;i2c master.c: 95: while(1)
	
l649:	
	line	100
	
l1941:	
;i2c master.c: 96: {
;i2c master.c: 100: i2c_start();
	fcall	_i2c_start
	line	102
	
l1943:	
;i2c master.c: 102: i2c_write(0x02);
	movlw	(02h)
	fcall	_i2c_write
	line	104
	
l1945:	
;i2c master.c: 104: i2c_write('A');
	movlw	(041h)
	fcall	_i2c_write
	line	106
	
l1947:	
;i2c master.c: 106: i2c_stop();
	fcall	_i2c_stop
	line	108
	
l1949:	
;i2c master.c: 108: delay(10000);
	movlw	low(02710h)
	movwf	(?_delay)
	movlw	high(02710h)
	movwf	((?_delay))+1
	fcall	_delay
	line	131
	
l650:	
	line	95
	goto	l649
	
l651:	
	line	132
	
l652:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_init
psect	text186,local,class=CODE,delta=2
global __ptext186
__ptext186:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 31 in file "D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\i2c master.c"
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
psect	text186
	file	"D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\i2c master.c"
	line	31
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 2
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	32
	
l1925:	
;i2c master.c: 32: lcd_command(0x02);
	movlw	(02h)
	fcall	_lcd_command
	line	33
;i2c master.c: 33: lcd_command(0x2c);
	movlw	(02Ch)
	fcall	_lcd_command
	line	34
;i2c master.c: 34: lcd_command(0x06);
	movlw	(06h)
	fcall	_lcd_command
	line	35
;i2c master.c: 35: lcd_command(0x0c);
	movlw	(0Ch)
	fcall	_lcd_command
	line	36
;i2c master.c: 36: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	37
;i2c master.c: 37: lcd_command(0x80);
	movlw	(080h)
	fcall	_lcd_command
	line	38
	
l631:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_lcd_display
psect	text187,local,class=CODE,delta=2
global __ptext187
__ptext187:

;; *************** function _lcd_display *****************
;; Defined at:
;;		line 58 in file "D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\i2c master.c"
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
psect	text187
	file	"D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\i2c master.c"
	line	58
	global	__size_of_lcd_display
	__size_of_lcd_display	equ	__end_of_lcd_display-_lcd_display
	
_lcd_display:	
	opt	stack 2
; Regs used in _lcd_display: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_display@word stored from wreg
	line	60
	movwf	(lcd_display@word)
	
l1917:	
;i2c master.c: 59: unsigned char l;
;i2c master.c: 60: for(l=0;l<n;l++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(lcd_display@l)
	goto	l637
	line	61
	
l638:	
	line	62
	
l1919:	
;i2c master.c: 61: {
;i2c master.c: 62: lcd_data(word[l]);
	movf	(lcd_display@l),w
	addwf	(lcd_display@word),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	line	60
	
l1921:	
	movlw	(01h)
	movwf	(??_lcd_display+0)+0
	movf	(??_lcd_display+0)+0,w
	addwf	(lcd_display@l),f
	
l637:	
	
l1923:	
	movf	(lcd_display@l),w
	movwf	(??_lcd_display+0)+0
	clrf	(??_lcd_display+0)+0+1
	movf	(lcd_display@n+1),w
	subwf	1+(??_lcd_display+0)+0,w
	skipz
	goto	u2265
	movf	(lcd_display@n),w
	subwf	0+(??_lcd_display+0)+0,w
u2265:
	skipc
	goto	u2261
	goto	u2260
u2261:
	goto	l638
u2260:
	
l639:	
	line	64
	
l640:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_display
	__end_of_lcd_display:
;; =============== function _lcd_display ends ============

	signat	_lcd_display,8312
	global	_lcd_command
psect	text188,local,class=CODE,delta=2
global __ptext188
__ptext188:

;; *************** function _lcd_command *****************
;; Defined at:
;;		line 14 in file "D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\i2c master.c"
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
psect	text188
	file	"D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\i2c master.c"
	line	14
	global	__size_of_lcd_command
	__size_of_lcd_command	equ	__end_of_lcd_command-_lcd_command
	
_lcd_command:	
	opt	stack 1
; Regs used in _lcd_command: [wreg+status,2+status,0+pclath+cstack]
;lcd_command@com stored from wreg
	line	16
	movwf	(lcd_command@com)
	
l1891:	
;i2c master.c: 15: unsigned char mand;
;i2c master.c: 16: PORTD=com&0xf0;
	movf	(lcd_command@com),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	17
	
l1893:	
;i2c master.c: 17: rs=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7
	line	18
	
l1895:	
;i2c master.c: 18: rw=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	19
	
l1897:	
;i2c master.c: 19: en=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(66/8),(66)&7
	line	20
	
l1899:	
;i2c master.c: 20: delay(10);
	movlw	low(0Ah)
	movwf	(?_delay)
	movlw	high(0Ah)
	movwf	((?_delay))+1
	fcall	_delay
	line	21
	
l1901:	
;i2c master.c: 21: en=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	22
	
l1903:	
;i2c master.c: 22: mand=com<<4;
	movf	(lcd_command@com),w
	movwf	(??_lcd_command+0)+0
	movlw	(04h)-1
u2255:
	clrc
	rlf	(??_lcd_command+0)+0,f
	addlw	-1
	skipz
	goto	u2255
	clrc
	rlf	(??_lcd_command+0)+0,w
	movwf	(??_lcd_command+1)+0
	movf	(??_lcd_command+1)+0,w
	movwf	(lcd_command@mand)
	line	23
	
l1905:	
;i2c master.c: 23: PORTD=mand&0xf0;
	movf	(lcd_command@mand),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	24
	
l1907:	
;i2c master.c: 24: rs=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7
	line	25
	
l1909:	
;i2c master.c: 25: rw=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	26
	
l1911:	
;i2c master.c: 26: en=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(66/8),(66)&7
	line	27
	
l1913:	
;i2c master.c: 27: delay(10);
	movlw	low(0Ah)
	movwf	(?_delay)
	movlw	high(0Ah)
	movwf	((?_delay))+1
	fcall	_delay
	line	28
	
l1915:	
;i2c master.c: 28: en=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	29
	
l628:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_command
	__end_of_lcd_command:
;; =============== function _lcd_command ends ============

	signat	_lcd_command,4216
	global	_lcd_data
psect	text189,local,class=CODE,delta=2
global __ptext189
__ptext189:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 40 in file "D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\i2c master.c"
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
;; This function uses a non-reentrant model
;;
psect	text189
	file	"D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\i2c master.c"
	line	40
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 1
; Regs used in _lcd_data: [wreg+status,2+status,0+pclath+cstack]
;lcd_data@da stored from wreg
	line	42
	movwf	(lcd_data@da)
	
l1853:	
;i2c master.c: 41: unsigned char ta;
;i2c master.c: 42: PORTD=da&0xf0;
	movf	(lcd_data@da),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	43
	
l1855:	
;i2c master.c: 43: en=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(66/8),(66)&7
	line	44
	
l1857:	
;i2c master.c: 44: rs=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(64/8),(64)&7
	line	45
	
l1859:	
;i2c master.c: 45: rw=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	46
	
l1861:	
;i2c master.c: 46: delay(10);
	movlw	low(0Ah)
	movwf	(?_delay)
	movlw	high(0Ah)
	movwf	((?_delay))+1
	fcall	_delay
	line	47
	
l1863:	
;i2c master.c: 47: en=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	48
	
l1865:	
;i2c master.c: 48: ta=da<<4;
	movf	(lcd_data@da),w
	movwf	(??_lcd_data+0)+0
	movlw	(04h)-1
u2225:
	clrc
	rlf	(??_lcd_data+0)+0,f
	addlw	-1
	skipz
	goto	u2225
	clrc
	rlf	(??_lcd_data+0)+0,w
	movwf	(??_lcd_data+1)+0
	movf	(??_lcd_data+1)+0,w
	movwf	(lcd_data@ta)
	line	49
	
l1867:	
;i2c master.c: 49: PORTD=ta;
	movf	(lcd_data@ta),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	50
	
l1869:	
;i2c master.c: 50: en=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(66/8),(66)&7
	line	51
	
l1871:	
;i2c master.c: 51: rs=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(64/8),(64)&7
	line	52
	
l1873:	
;i2c master.c: 52: rw=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	53
	
l1875:	
;i2c master.c: 53: delay(10);
	movlw	low(0Ah)
	movwf	(?_delay)
	movlw	high(0Ah)
	movwf	((?_delay))+1
	fcall	_delay
	line	54
	
l1877:	
;i2c master.c: 54: en=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	55
	
l634:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
	global	_i2c_stop
psect	text190,local,class=CODE,delta=2
global __ptext190
__ptext190:

;; *************** function _i2c_stop *****************
;; Defined at:
;;		line 18 in file "D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\I2C.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_i2c_sspifclr
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text190
	file	"D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\I2C.h"
	line	18
	global	__size_of_i2c_stop
	__size_of_i2c_stop	equ	__end_of_i2c_stop-_i2c_stop
	
_i2c_stop:	
	opt	stack 1
; Regs used in _i2c_stop: [status,2+status,0+pclath+cstack]
	line	19
	
l1883:	
;I2C.h: 19: PEN=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1162/8)^080h,(1162)&7
	line	20
;I2C.h: 20: while(PEN==1);
	goto	l577
	
l578:	
	
l577:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(1162/8)^080h,(1162)&7
	goto	u2241
	goto	u2240
u2241:
	goto	l578
u2240:
	
l579:	
	line	21
	
l1885:	
;I2C.h: 21: i2c_sspifclr();
	fcall	_i2c_sspifclr
	line	22
	
l580:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_stop
	__end_of_i2c_stop:
;; =============== function _i2c_stop ends ============

	signat	_i2c_stop,88
	global	_i2c_start
psect	text191,local,class=CODE,delta=2
global __ptext191
__ptext191:

;; *************** function _i2c_start *****************
;; Defined at:
;;		line 11 in file "D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\I2C.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_i2c_sspifclr
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text191
	file	"D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\I2C.h"
	line	11
	global	__size_of_i2c_start
	__size_of_i2c_start	equ	__end_of_i2c_start-_i2c_start
	
_i2c_start:	
	opt	stack 1
; Regs used in _i2c_start: [status,2+status,0+pclath+cstack]
	line	12
	
l1879:	
;I2C.h: 12: SEN=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1160/8)^080h,(1160)&7
	line	13
;I2C.h: 13: while(SEN==1);
	goto	l571
	
l572:	
	
l571:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(1160/8)^080h,(1160)&7
	goto	u2231
	goto	u2230
u2231:
	goto	l572
u2230:
	
l573:	
	line	14
	
l1881:	
;I2C.h: 14: i2c_sspifclr();
	fcall	_i2c_sspifclr
	line	15
	
l574:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_start
	__end_of_i2c_start:
;; =============== function _i2c_start ends ============

	signat	_i2c_start,88
	global	_i2c_write
psect	text192,local,class=CODE,delta=2
global __ptext192
__ptext192:

;; *************** function _i2c_write *****************
;; Defined at:
;;		line 63 in file "D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\I2C.h"
;; Parameters:    Size  Location     Type
;;  write           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  write           1    0[COMMON] unsigned char 
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
;;		_i2c_wait
;;		_i2c_sspifclr
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text192
	file	"D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\I2C.h"
	line	63
	global	__size_of_i2c_write
	__size_of_i2c_write	equ	__end_of_i2c_write-_i2c_write
	
_i2c_write:	
	opt	stack 1
; Regs used in _i2c_write: [wreg+status,2+status,0+pclath+cstack]
;i2c_write@write stored from wreg
	movwf	(i2c_write@write)
	line	64
	
l1887:	
;I2C.h: 64: SSPBUF=write;
	movf	(i2c_write@write),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(19)	;volatile
	line	65
	
l1889:	
;I2C.h: 65: i2c_wait();
	fcall	_i2c_wait
	line	66
;I2C.h: 66: i2c_sspifclr();
	fcall	_i2c_sspifclr
	line	67
	
l613:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_write
	__end_of_i2c_write:
;; =============== function _i2c_write ends ============

	signat	_i2c_write,4216
	global	_i2c_init
psect	text193,local,class=CODE,delta=2
global __ptext193
__ptext193:

;; *************** function _i2c_init *****************
;; Defined at:
;;		line 73 in file "D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\i2c master.c"
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
psect	text193
	file	"D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\i2c master.c"
	line	73
	global	__size_of_i2c_init
	__size_of_i2c_init	equ	__end_of_i2c_init-_i2c_init
	
_i2c_init:	
	opt	stack 0
; Regs used in _i2c_init: [wreg]
	line	74
	
l1677:	
;i2c master.c: 74: TRISC3=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1083/8)^080h,(1083)&7
	line	75
;i2c master.c: 75: TRISC4=1;
	bsf	(1084/8)^080h,(1084)&7
	line	76
	
l1679:	
;i2c master.c: 76: SSPSTAT=0x80;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(148)^080h	;volatile
	line	77
;i2c master.c: 77: SSPCON=0x28;
	movlw	(028h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	79
;i2c master.c: 79: SSPADD=0x28;
	movlw	(028h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(147)^080h	;volatile
	line	80
	
l646:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_init
	__end_of_i2c_init:
;; =============== function _i2c_init ends ============

	signat	_i2c_init,88
	global	_i2c_sspifclr
psect	text194,local,class=CODE,delta=2
global __ptext194
__ptext194:

;; *************** function _i2c_sspifclr *****************
;; Defined at:
;;		line 5 in file "D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\I2C.h"
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
;;		_i2c_start
;;		_i2c_stop
;;		_i2c_write
;;		_i2c_repeated_start
;;		_i2c_acknowledgement
;;		_i2c_no_acknowledgement
;; This function uses a non-reentrant model
;;
psect	text194
	file	"D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\I2C.h"
	line	5
	global	__size_of_i2c_sspifclr
	__size_of_i2c_sspifclr	equ	__end_of_i2c_sspifclr-_i2c_sspifclr
	
_i2c_sspifclr:	
	opt	stack 0
; Regs used in _i2c_sspifclr: []
	line	6
	
l1823:	
;I2C.h: 6: while(SSPIF==0);
	goto	l565
	
l566:	
	
l565:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(99/8),(99)&7
	goto	u2101
	goto	u2100
u2101:
	goto	l566
u2100:
	
l567:	
	line	7
;I2C.h: 7: SSPIF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(99/8),(99)&7
	line	8
	
l568:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_sspifclr
	__end_of_i2c_sspifclr:
;; =============== function _i2c_sspifclr ends ============

	signat	_i2c_sspifclr,88
	global	_port_init
psect	text195,local,class=CODE,delta=2
global __ptext195
__ptext195:

;; *************** function _port_init *****************
;; Defined at:
;;		line 67 in file "D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\i2c master.c"
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
psect	text195
	file	"D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\i2c master.c"
	line	67
	global	__size_of_port_init
	__size_of_port_init	equ	__end_of_port_init-_port_init
	
_port_init:	
	opt	stack 0
; Regs used in _port_init: [status,2]
	line	68
	
l1649:	
;i2c master.c: 68: TRISD=0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	69
;i2c master.c: 69: PORTD=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	70
	
l643:	
	return
	opt stack 0
GLOBAL	__end_of_port_init
	__end_of_port_init:
;; =============== function _port_init ends ============

	signat	_port_init,88
	global	_i2c_wait
psect	text196,local,class=CODE,delta=2
global __ptext196
__ptext196:

;; *************** function _i2c_wait *****************
;; Defined at:
;;		line 58 in file "D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\I2C.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
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
;;		_i2c_write
;;		_i2c_read
;; This function uses a non-reentrant model
;;
psect	text196
	file	"D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\I2C.h"
	line	58
	global	__size_of_i2c_wait
	__size_of_i2c_wait	equ	__end_of_i2c_wait-_i2c_wait
	
_i2c_wait:	
	opt	stack 0
; Regs used in _i2c_wait: [wreg+status,2]
	line	59
	
l1659:	
;I2C.h: 59: while((SSPCON2 & 0x1F)||(SSPSTAT & 0x04));
	goto	l607
	
l608:	
	
l607:	
	
l1661:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(145)^080h,w
	andlw	01Fh
	btfss	status,2
	goto	u1621
	goto	u1620
u1621:
	goto	l608
u1620:
	
l1663:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(148)^080h,(2)&7
	goto	u1631
	goto	u1630
u1631:
	goto	l608
u1630:
	
l609:	
	line	60
	
l610:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_wait
	__end_of_i2c_wait:
;; =============== function _i2c_wait ends ============

	signat	_i2c_wait,88
	global	_delay
psect	text197,local,class=CODE,delta=2
global __ptext197
__ptext197:

;; *************** function _delay *****************
;; Defined at:
;;		line 9 in file "D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\i2c master.c"
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
psect	text197
	file	"D:\TI\PIC course\Prasanth I2C\I2C Demo TEST\i2c Master\i2c master.c"
	line	9
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 0
; Regs used in _delay: [wreg]
	line	10
	
l1665:	
;i2c master.c: 10: while(Delay--);
	goto	l622
	
l623:	
	
l622:	
	
l1667:	
	movlw	low(01h)
	subwf	(delay@Delay),f
	movlw	high(01h)
	skipc
	decf	(delay@Delay+1),f
	subwf	(delay@Delay+1),f
	movlw	high(0FFFFh)
	xorwf	((delay@Delay+1)),w
	skipz
	goto	u1645
	movlw	low(0FFFFh)
	xorwf	((delay@Delay)),w
u1645:

	skipz
	goto	u1641
	goto	u1640
u1641:
	goto	l623
u1640:
	
l624:	
	line	11
	
l625:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
psect	text198,local,class=CODE,delta=2
global __ptext198
__ptext198:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
