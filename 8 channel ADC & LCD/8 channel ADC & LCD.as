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
	FNCALL	_main,_lcd_initialize
	FNCALL	_main,_display
	FNCALL	_main,_delay
	FNCALL	_main,_adc_read
	FNCALL	_lcd_initialize,_lcd_command
	FNCALL	_display,_lcd_data
	FNCALL	_lcd_command,_delay
	FNCALL	_lcd_data,_delay
	FNROOT	_main
	global	_ADCON0
psect	text69,local,class=CODE,delta=2
global __ptext69
__ptext69:
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_PORTD
_PORTD	set	8
	global	_ADIF
_ADIF	set	102
	global	_RD0
_RD0	set	64
	global	_RD1
_RD1	set	65
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_TRISA
_TRISA	set	133
	global	_TRISD
_TRISD	set	136
	global	_TRISE
_TRISE	set	137
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
	retlw	56	;'8'
	retlw	32	;' '
	retlw	99	;'c'
	retlw	104	;'h'
	retlw	32	;' '
	retlw	65	;'A'
	retlw	68	;'D'
	retlw	67	;'C'
	retlw	0
psect	strings
	file	"8 channel ADC & LCD.as"
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
	global	?_lcd_data
?_lcd_data:	; 0 bytes @ 0x0
	global	?_lcd_command
?_lcd_command:	; 0 bytes @ 0x0
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	??_adc_read
??_adc_read:	; 0 bytes @ 0x0
	global	?_adc_read
?_adc_read:	; 0 bytes @ 0x0
	global	?_lcd_initialize
?_lcd_initialize:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	delay@a
delay@a:	; 2 bytes @ 0x0
	ds	2
	global	??_lcd_data
??_lcd_data:	; 0 bytes @ 0x2
	global	??_lcd_command
??_lcd_command:	; 0 bytes @ 0x2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	lcd_data@temp1
lcd_data@temp1:	; 1 bytes @ 0x2
	global	lcd_command@temp
lcd_command@temp:	; 1 bytes @ 0x2
	ds	1
	global	lcd_command@command
lcd_command@command:	; 1 bytes @ 0x3
	global	lcd_data@data
lcd_data@data:	; 1 bytes @ 0x3
	ds	1
	global	?_display
?_display:	; 0 bytes @ 0x4
	global	??_lcd_initialize
??_lcd_initialize:	; 0 bytes @ 0x4
	global	display@len
display@len:	; 1 bytes @ 0x4
	ds	1
	global	??_display
??_display:	; 0 bytes @ 0x5
	global	display@word
display@word:	; 1 bytes @ 0x5
	ds	1
	global	display@a
display@a:	; 1 bytes @ 0x6
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x7
;;Data sizes: Strings 9, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      7       7
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; display@word	PTR const unsigned char  size(1) Largest target is 9
;;		 -> STR_1(CODE[9]), 
;;


;; COMMON:	_main->_display
;; COMMON:	_lcd_initialize->_lcd_command
;; COMMON:	_display->_lcd_data
;; Critical Paths (_lcd_command)
;; COMMON:	_lcd_command->_delay

;; Critical Paths (_lcd_data)
;; COMMON:	_lcd_data->_delay

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0

;;
;;Call Graph Tables:

;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _main                                                 0     0      0     195
;;                     _lcd_initialize
;;                            _display
;;                              _delay
;;                           _adc_read
;; ---------------------------------------------------------------------------------
;; (1) _lcd_initialize                                       0     0      0      60
;;                        _lcd_command
;; ---------------------------------------------------------------------------------
;; (1) _display                                              3     2      1     120
;;                                              4 COMMON     3     2      1
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (0) _lcd_command                                          2     2      0      60
;;                                              2 COMMON     2     2      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (0) _lcd_data                                             2     2      0      60
;;                                              2 COMMON     2     2      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (4294967295) _delay                                       2     0      2      15
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; (4294967295) _adc_read                                    2     2      0       0
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

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;COMMON               E      7       7       1       50.0%
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
;;		line 11 in file "C:\Users\Admin\Desktop\PIC\PIC course\8 channel ADC & LCD\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_initialize
;;		_display
;;		_delay
;;		_adc_read
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Admin\Desktop\PIC\PIC course\8 channel ADC & LCD\main.c"
	line	11
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	12
	
l1032:	
;main.c: 12: TRISD=0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(136)^080h	;volatile
	line	13
	
l1034:	
;main.c: 13: TRISA=0xFF;
	movlw	(0FFh)
	movwf	(133)^080h	;volatile
	line	14
	
l1036:	
;main.c: 14: TRISE=0xFF;
	movlw	(0FFh)
	movwf	(137)^080h	;volatile
	line	15
	
l1038:	
;main.c: 15: ADCON1=0x80;
	movlw	(080h)
	movwf	(159)^080h	;volatile
	line	16
	
l1040:	
;main.c: 16: ADCON0=0x41;
	movlw	(041h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(31)	;volatile
	line	17
	
l1042:	
;main.c: 17: lcd_initialize();
	fcall	_lcd_initialize
	line	18
	
l1044:	
;main.c: 18: display("8 ch ADC",8);
	movlw	(08h)
	movwf	(?_display)
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_display
	line	19
	
l1046:	
;main.c: 19: delay(60000);
	movlw	low(0EA60h)
	movwf	(?_delay)
	movlw	high(0EA60h)
	movwf	((?_delay))+1
	fcall	_delay
	line	22
	
l1048:	
;main.c: 21: {
;main.c: 22: delay(1000);
	movlw	low(03E8h)
	movwf	(?_delay)
	movlw	high(03E8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	23
	
l1050:	
;main.c: 23: ADCON0=(ADCON0|0x04);
	bsf	(31)+(2/8),(2)&7	;volatile
	line	24
;main.c: 24: while(ADIF==0);
	
l584:	
	btfss	(102/8),(102)&7
	goto	u31
	goto	u30
u31:
	goto	l584
u30:
	line	25
	
l1052:	
;main.c: 25: adc_read();
	fcall	_adc_read
	goto	l1048
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

psect	maintext
	line	30
	signat	_main,88
	global	_lcd_initialize
psect	text70,local,class=CODE,delta=2
global __ptext70
__ptext70:

;; *************** function _lcd_initialize *****************
;; Defined at:
;;		line 47 in file "C:\Users\Admin\Desktop\PIC\PIC course\8 channel ADC & LCD\LCD 4 BIT.h"
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
;;		On exit  : 17F/0
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
;;		_lcd_command
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text70
	file	"C:\Users\Admin\Desktop\PIC\PIC course\8 channel ADC & LCD\LCD 4 BIT.h"
	line	47
	global	__size_of_lcd_initialize
	__size_of_lcd_initialize	equ	__end_of_lcd_initialize-_lcd_initialize
	
_lcd_initialize:	
	opt	stack 2
; Regs used in _lcd_initialize: [wreg+status,2+status,0+pclath+cstack]
	line	48
	
l1030:	
;LCD 4 BIT.h: 48: lcd_command(0x02);
	movlw	(02h)
	fcall	_lcd_command
	line	49
;LCD 4 BIT.h: 49: lcd_command(0x2C);
	movlw	(02Ch)
	fcall	_lcd_command
	line	50
;LCD 4 BIT.h: 50: lcd_command(0x06);
	movlw	(06h)
	fcall	_lcd_command
	line	51
;LCD 4 BIT.h: 51: lcd_command(0x0c);
	movlw	(0Ch)
	fcall	_lcd_command
	line	52
;LCD 4 BIT.h: 52: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	53
;LCD 4 BIT.h: 53: lcd_command(0x80);
	movlw	(080h)
	fcall	_lcd_command
	line	54
	
l571:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_initialize
	__end_of_lcd_initialize:
;; =============== function _lcd_initialize ends ============

	signat	_lcd_initialize,88
	global	_display
psect	text71,local,class=CODE,delta=2
global __ptext71
__ptext71:

;; *************** function _display *****************
;; Defined at:
;;		line 56 in file "C:\Users\Admin\Desktop\PIC\PIC course\8 channel ADC & LCD\LCD 4 BIT.h"
;; Parameters:    Size  Location     Type
;;  word            1    wreg     PTR const unsigned char 
;;		 -> STR_1(9), 
;;  len             1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  word            1    5[COMMON] PTR const unsigned char 
;;		 -> STR_1(9), 
;;  a               1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text71
	file	"C:\Users\Admin\Desktop\PIC\PIC course\8 channel ADC & LCD\LCD 4 BIT.h"
	line	56
	global	__size_of_display
	__size_of_display	equ	__end_of_display-_display
	
_display:	
	opt	stack 2
; Regs used in _display: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;display@word stored from wreg
	line	58
	movwf	(display@word)
	
l1022:	
;LCD 4 BIT.h: 57: unsigned char a;
;LCD 4 BIT.h: 58: for(a=0;a<=len;a++)
	clrf	(display@a)
	goto	l1028
	line	60
	
l1024:	
;LCD 4 BIT.h: 59: {
;LCD 4 BIT.h: 60: lcd_data(word[a]);
	movf	(display@a),w
	addwf	(display@word),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	line	58
	
l1026:	
	incf	(display@a),f
	
l1028:	
	movf	(display@a),w
	subwf	(display@len),w
	skipnc
	goto	u21
	goto	u20
u21:
	goto	l1024
u20:
	line	63
	
l577:	
	return
	opt stack 0
GLOBAL	__end_of_display
	__end_of_display:
;; =============== function _display ends ============

	signat	_display,8312
	global	_lcd_command
psect	text72,local,class=CODE,delta=2
global __ptext72
__ptext72:

;; *************** function _lcd_command *****************
;; Defined at:
;;		line 10 in file "C:\Users\Admin\Desktop\PIC\PIC course\8 channel ADC & LCD\LCD 4 BIT.h"
;; Parameters:    Size  Location     Type
;;  command         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  command         1    3[COMMON] unsigned char 
;;  temp            1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay
;; This function is called by:
;;		_lcd_initialize
;; This function uses a non-reentrant model
;;
psect	text72
	file	"C:\Users\Admin\Desktop\PIC\PIC course\8 channel ADC & LCD\LCD 4 BIT.h"
	line	10
	global	__size_of_lcd_command
	__size_of_lcd_command	equ	__end_of_lcd_command-_lcd_command
	
_lcd_command:	
	opt	stack 1
; Regs used in _lcd_command: [wreg+status,2+status,0+pclath+cstack]
;lcd_command@command stored from wreg
	line	12
	movwf	(lcd_command@command)
	
l996:	
;LCD 4 BIT.h: 11: unsigned char temp;
;LCD 4 BIT.h: 12: PORTD=command&0xF0;
	movf	(lcd_command@command),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	13
	
l998:	
;LCD 4 BIT.h: 13: RD0=0;
	bcf	(64/8),(64)&7
	line	14
	
l1000:	
;LCD 4 BIT.h: 14: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	15
	
l1002:	
;LCD 4 BIT.h: 15: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(65/8),(65)&7
	line	16
	
l1004:	
;LCD 4 BIT.h: 16: delay(200);
	movlw	0C8h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	17
	
l1006:	
;LCD 4 BIT.h: 17: RD1=0;
	bcf	(65/8),(65)&7
	line	18
	
l1008:	
;LCD 4 BIT.h: 18: temp=command<<4;
	swapf	(lcd_command@command),w
	andlw	(0ffh shl 4) & 0ffh
	movwf	(lcd_command@temp)
	line	19
	
l1010:	
;LCD 4 BIT.h: 19: PORTD=temp&0xF0;
	movf	(lcd_command@temp),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	20
	
l1012:	
;LCD 4 BIT.h: 20: RD0=0;
	bcf	(64/8),(64)&7
	line	21
	
l1014:	
;LCD 4 BIT.h: 21: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	22
	
l1016:	
;LCD 4 BIT.h: 22: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(65/8),(65)&7
	line	23
	
l1018:	
;LCD 4 BIT.h: 23: delay(200);
	movlw	0C8h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	24
	
l1020:	
;LCD 4 BIT.h: 24: RD1=0;
	bcf	(65/8),(65)&7
	line	26
	
l565:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_command
	__end_of_lcd_command:
;; =============== function _lcd_command ends ============

	signat	_lcd_command,4216
	global	_lcd_data
psect	text73,local,class=CODE,delta=2
global __ptext73
__ptext73:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 28 in file "C:\Users\Admin\Desktop\PIC\PIC course\8 channel ADC & LCD\LCD 4 BIT.h"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    3[COMMON] unsigned char 
;;  temp1           1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay
;; This function is called by:
;;		_display
;; This function uses a non-reentrant model
;;
psect	text73
	file	"C:\Users\Admin\Desktop\PIC\PIC course\8 channel ADC & LCD\LCD 4 BIT.h"
	line	28
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 1
; Regs used in _lcd_data: [wreg+status,2+status,0+pclath+cstack]
;lcd_data@data stored from wreg
	line	30
	movwf	(lcd_data@data)
	
l970:	
;LCD 4 BIT.h: 29: unsigned char temp1;
;LCD 4 BIT.h: 30: PORTD=data&0xF0;
	movf	(lcd_data@data),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	31
	
l972:	
;LCD 4 BIT.h: 31: RD0=1;
	bsf	(64/8),(64)&7
	line	32
	
l974:	
;LCD 4 BIT.h: 32: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	33
	
l976:	
;LCD 4 BIT.h: 33: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(65/8),(65)&7
	line	34
	
l978:	
;LCD 4 BIT.h: 34: delay(200);
	movlw	0C8h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	35
	
l980:	
;LCD 4 BIT.h: 35: RD1=0;
	bcf	(65/8),(65)&7
	line	36
	
l982:	
;LCD 4 BIT.h: 36: temp1=data<<4;
	swapf	(lcd_data@data),w
	andlw	(0ffh shl 4) & 0ffh
	movwf	(lcd_data@temp1)
	line	37
	
l984:	
;LCD 4 BIT.h: 37: PORTD=temp1&0xF0;
	movf	(lcd_data@temp1),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	38
	
l986:	
;LCD 4 BIT.h: 38: RD0=1;
	bsf	(64/8),(64)&7
	line	39
	
l988:	
;LCD 4 BIT.h: 39: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	40
	
l990:	
;LCD 4 BIT.h: 40: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(65/8),(65)&7
	line	41
	
l992:	
;LCD 4 BIT.h: 41: delay(200);
	movlw	0C8h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	42
	
l994:	
;LCD 4 BIT.h: 42: RD1=0;
	bcf	(65/8),(65)&7
	line	45
	
l568:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
	global	_delay
psect	text74,local,class=CODE,delta=2
global __ptext74
__ptext74:

;; *************** function _delay *****************
;; Defined at:
;;		line 5 in file "C:\Users\Admin\Desktop\PIC\PIC course\8 channel ADC & LCD\LCD 4 BIT.h"
;; Parameters:    Size  Location     Type
;;  a               2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
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
psect	text74
	file	"C:\Users\Admin\Desktop\PIC\PIC course\8 channel ADC & LCD\LCD 4 BIT.h"
	line	5
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 0
; Regs used in _delay: [wreg]
	line	6
	
l966:	
;LCD 4 BIT.h: 6: while(a--);
	
l968:	
	movlw	low(01h)
	subwf	(delay@a),f
	movlw	high(01h)
	skipc
	decf	(delay@a+1),f
	subwf	(delay@a+1),f
	incf	((delay@a)),w
	skipnz
	incf	((delay@a+1)),w

	skipz
	goto	u11
	goto	u10
u11:
	goto	l968
u10:
	line	7
	
l562:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
	global	_adc_read
psect	text75,local,class=CODE,delta=2
global __ptext75
__ptext75:

;; *************** function _adc_read *****************
;; Defined at:
;;		line 4 in file "C:\Users\Admin\Desktop\PIC\PIC course\8 channel ADC & LCD\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  temp            2    0        unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
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
psect	text75
	file	"C:\Users\Admin\Desktop\PIC\PIC course\8 channel ADC & LCD\main.c"
	line	4
	global	__size_of_adc_read
	__size_of_adc_read	equ	__end_of_adc_read-_adc_read
	
_adc_read:	
	opt	stack 0
; Regs used in _adc_read: [wreg]
	line	6
	
l962:	
;main.c: 5: unsigned int temp;
;main.c: 6: temp=ADRESH<<8;
	movf	(30),w	;volatile
	line	7
;main.c: 7: temp=temp+ADRESL;
	bsf	status, 5	;RP0=1, select bank1
	movf	(158)^080h,w	;volatile
	line	8
	
l964:	
;main.c: 8: ADIF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(102/8),(102)&7
	line	9
	
l580:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read
	__end_of_adc_read:
;; =============== function _adc_read ends ============

	signat	_adc_read,88
psect	text76,local,class=CODE,delta=2
global __ptext76
__ptext76:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
