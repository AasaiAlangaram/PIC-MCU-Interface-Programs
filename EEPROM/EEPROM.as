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
	FNCALL	_main,_lcd_initialize
	FNCALL	_main,_display
	FNCALL	_main,_delay
	FNCALL	_main,_lcd_command
	FNCALL	_main,_write_byte_to_EE
	FNCALL	_main,_read_byte_from_EE
	FNCALL	_main,_lcd_data
	FNCALL	_lcd_initialize,_lcd_command
	FNCALL	_display,_lcd_data
	FNCALL	_lcd_command,_delay
	FNCALL	_lcd_data,_delay
	FNROOT	_main
	global	_name
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"D:\TI\PIC course\EEPROM\EEPROM.c"
	line	4

;initializer for _name
	retlw	04Ah
	retlw	045h
	retlw	059h
	retlw	041h
	retlw	020h
	retlw	04Bh
	retlw	055h
	retlw	04Dh
	retlw	041h
	retlw	052h
	retlw	0
	global	_byte
	global	_PORTD
_PORTD	set	8
	global	_EEIF
_EEIF	set	108
	global	_RD0
_RD0	set	64
	global	_RD1
_RD1	set	65
	global	_TRISD
_TRISD	set	136
	global	_RW
_RW	set	1186
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON2
_EECON2	set	397
	global	_EEPGD
_EEPGD	set	3175
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
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
	retlw	69	;'E'
	retlw	80	;'P'
	retlw	82	;'R'
	retlw	79	;'O'
	retlw	77	;'M'
	retlw	0
psect	strings
	file	"EEPROM.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_byte:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"D:\TI\PIC course\EEPROM\EEPROM.c"
_name:
       ds      11

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
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
	movlw low(__pdataBANK0+11)
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
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	?_lcd_data
?_lcd_data:	; 0 bytes @ 0x0
	global	?_lcd_command
?_lcd_command:	; 0 bytes @ 0x0
	global	?_write_byte_to_EE
?_write_byte_to_EE:	; 0 bytes @ 0x0
	global	??_read_byte_from_EE
??_read_byte_from_EE:	; 0 bytes @ 0x0
	global	?_read_byte_from_EE
?_read_byte_from_EE:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_lcd_initialize
?_lcd_initialize:	; 0 bytes @ 0x0
	global	write_byte_to_EE@address
write_byte_to_EE@address:	; 1 bytes @ 0x0
	global	delay@a
delay@a:	; 2 bytes @ 0x0
	ds	1
	global	??_write_byte_to_EE
??_write_byte_to_EE:	; 0 bytes @ 0x1
	global	write_byte_to_EE@data
write_byte_to_EE@data:	; 1 bytes @ 0x1
	global	read_byte_from_EE@address
read_byte_from_EE@address:	; 1 bytes @ 0x1
	ds	1
	global	??_lcd_command
??_lcd_command:	; 0 bytes @ 0x2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	??_lcd_data
??_lcd_data:	; 0 bytes @ 0x2
	ds	2
	global	lcd_data@temp1
lcd_data@temp1:	; 1 bytes @ 0x4
	global	lcd_command@temp
lcd_command@temp:	; 1 bytes @ 0x4
	ds	1
	global	lcd_command@command
lcd_command@command:	; 1 bytes @ 0x5
	global	lcd_data@data
lcd_data@data:	; 1 bytes @ 0x5
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
	ds	1
	global	display@word
display@word:	; 1 bytes @ 0x8
	ds	1
	global	display@a
display@a:	; 1 bytes @ 0x9
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0xA
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	main@address
main@address:	; 2 bytes @ 0x0
	ds	2
	global	main@i_321
main@i_321:	; 2 bytes @ 0x2
	ds	2
	global	main@i
main@i:	; 2 bytes @ 0x4
	ds	2
;;Data sizes: Strings 7, constant 0, data 11, bss 1, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     11      11
;; BANK0           80      6      18
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; display@word	PTR const unsigned char  size(1) Largest target is 7
;;		 -> STR_1(CODE[7]), 
;;


;; COMMON:	_main->_display
;; COMMON:	_lcd_initialize->_lcd_command
;; COMMON:	_display->_lcd_data
;; Critical Paths (_lcd_command)
;; COMMON:	_lcd_command->_delay

;; Critical Paths (_lcd_data)
;; COMMON:	_lcd_data->_delay

;;
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0

;;
;;Call Graph Tables:

;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _main                                                 7     7      0     715
;;                                             10 COMMON     1     1      0
;;                                              0 BANK0      6     6      0
;;                     _lcd_initialize
;;                            _display
;;                              _delay
;;                        _lcd_command
;;                   _write_byte_to_EE
;;                  _read_byte_from_EE
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_initialize                                       0     0      0      89
;;                        _lcd_command
;; ---------------------------------------------------------------------------------
;; (1) _display                                              4     3      1     179
;;                                              6 COMMON     4     3      1
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (0) _lcd_command                                          4     4      0      89
;;                                              2 COMMON     4     4      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (0) _lcd_data                                             4     4      0      89
;;                                              2 COMMON     4     4      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (4294967295) _delay                                       2     0      2      22
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; (4294967295) _read_byte_from_EE                           2     2      0      22
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (4294967295) _write_byte_to_EE                            2     1      1      44
;;                                              0 COMMON     2     1      1
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
;;ABS                  0      0      1D      10        0.0%
;;DATA                 0      0      20       5        0.0%
;;SFR0                 0      0       0       1        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;BITBANK0            50      0       0       3        0.0%
;;BANK0               50      6      12       4       22.5%
;;STACK                0      0       3       2        0.0%
;;BITCOMMON            E      0       0       0        0.0%
;;COMMON               E      B       B       1       78.6%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 34 in file "D:\TI\PIC course\EEPROM\EEPROM.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    2[BANK0 ] int 
;;  i               2    4[BANK0 ] int 
;;  address         2    0[BANK0 ] unsigned int 
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
;;      Locals:         0       6       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       6       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_initialize
;;		_display
;;		_delay
;;		_lcd_command
;;		_write_byte_to_EE
;;		_read_byte_from_EE
;;		_lcd_data
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\TI\PIC course\EEPROM\EEPROM.c"
	line	34
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2-btemp+0+pclath+cstack]
	
l1959:	
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@address)
	movlw	high(0)
	movwf	((main@address))+1
	line	35
	
l1961:	
;EEPROM.c: 35: TRISD=0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	36
	
l1963:	
;EEPROM.c: 36: EEDATA=EEADR=0X00;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(269)^0100h	;volatile
	clrf	(268)^0100h	;volatile
	line	37
	
l1965:	
;EEPROM.c: 37: lcd_initialize();
	fcall	_lcd_initialize
	line	38
	
l1967:	
;EEPROM.c: 38: display("EEPROM",6);
	movlw	(06h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_display)
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_display
	line	39
	
l1969:	
;EEPROM.c: 39: delay(60000);
	movlw	low(0EA60h)
	movwf	(?_delay)
	movlw	high(0EA60h)
	movwf	((?_delay))+1
	fcall	_delay
	line	40
;EEPROM.c: 40: while(1)
	
l593:	
	line	42
	
l1971:	
;EEPROM.c: 41: {
;EEPROM.c: 42: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	47
	
l1973:	
;EEPROM.c: 47: for(int i=0;i<10;i++)
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@i)
	movlw	high(0)
	movwf	((main@i))+1
	
l1975:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(0Ah))^80h
	subwf	btemp+0,w
	skipz
	goto	u2285
	movlw	low(0Ah)
	subwf	(main@i),w
u2285:

	skipc
	goto	u2281
	goto	u2280
u2281:
	goto	l594
u2280:
	
l1977:	
	goto	l595
	line	48
	
l594:	
	line	50
	
l1979:	
;EEPROM.c: 48: {
;EEPROM.c: 50: write_byte_to_EE(name[i],0x00+i);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@i),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_write_byte_to_EE)
	movf	(main@i),w
	addlw	_name&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_write_byte_to_EE
	line	47
	
l1981:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l1983:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(0Ah))^80h
	subwf	btemp+0,w
	skipz
	goto	u2295
	movlw	low(0Ah)
	subwf	(main@i),w
u2295:

	skipc
	goto	u2291
	goto	u2290
u2291:
	goto	l594
u2290:
	
l595:	
	line	57
	
l1985:	
;EEPROM.c: 53: }
;EEPROM.c: 57: for(int i=0;i<9;i++)
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@i_321)
	movlw	high(0)
	movwf	((main@i_321))+1
	
l1987:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@i_321+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(09h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2305
	movlw	low(09h)
	subwf	(main@i_321),w
u2305:

	skipc
	goto	u2301
	goto	u2300
u2301:
	goto	l596
u2300:
	
l1989:	
	goto	l597
	line	58
	
l596:	
	line	59
	
l1991:	
;EEPROM.c: 58: {
;EEPROM.c: 59: lcd_command(0xC0+i);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@i_321),w
	addlw	0C0h
	fcall	_lcd_command
	line	60
;EEPROM.c: 60: read_byte_from_EE(0x00+i);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@i_321),w
	fcall	_read_byte_from_EE
	line	62
;EEPROM.c: 62: lcd_data(byte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_byte),w
	fcall	_lcd_data
	line	57
	
l1993:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@i_321),f
	skipnc
	incf	(main@i_321+1),f
	movlw	high(01h)
	addwf	(main@i_321+1),f
	
l1995:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@i_321+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(09h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2315
	movlw	low(09h)
	subwf	(main@i_321),w
u2315:

	skipc
	goto	u2311
	goto	u2310
u2311:
	goto	l596
u2310:
	
l597:	
	line	64
	
l1997:	
;EEPROM.c: 63: }
;EEPROM.c: 64: delay(60000);
	movlw	low(0EA60h)
	movwf	(?_delay)
	movlw	high(0EA60h)
	movwf	((?_delay))+1
	fcall	_delay
	line	66
	
l598:	
	line	40
	goto	l593
	
l599:	
	line	67
	
l600:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_initialize
psect	text194,local,class=CODE,delta=2
global __ptext194
__ptext194:

;; *************** function _lcd_initialize *****************
;; Defined at:
;;		line 47 in file "D:\TI\PIC course\EEPROM\LCD 4 BIT.h"
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
psect	text194
	file	"D:\TI\PIC course\EEPROM\LCD 4 BIT.h"
	line	47
	global	__size_of_lcd_initialize
	__size_of_lcd_initialize	equ	__end_of_lcd_initialize-_lcd_initialize
	
_lcd_initialize:	
	opt	stack 2
; Regs used in _lcd_initialize: [wreg+status,2+status,0+pclath+cstack]
	line	48
	
l1949:	
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
	
l575:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_initialize
	__end_of_lcd_initialize:
;; =============== function _lcd_initialize ends ============

	signat	_lcd_initialize,88
	global	_display
psect	text195,local,class=CODE,delta=2
global __ptext195
__ptext195:

;; *************** function _display *****************
;; Defined at:
;;		line 56 in file "D:\TI\PIC course\EEPROM\LCD 4 BIT.h"
;; Parameters:    Size  Location     Type
;;  word            1    wreg     PTR const unsigned char 
;;		 -> STR_1(7), 
;;  len             1    6[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  word            1    8[COMMON] PTR const unsigned char 
;;		 -> STR_1(7), 
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
psect	text195
	file	"D:\TI\PIC course\EEPROM\LCD 4 BIT.h"
	line	56
	global	__size_of_display
	__size_of_display	equ	__end_of_display-_display
	
_display:	
	opt	stack 2
; Regs used in _display: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;display@word stored from wreg
	line	58
	movwf	(display@word)
	
l1951:	
;LCD 4 BIT.h: 57: unsigned char a;
;LCD 4 BIT.h: 58: for(a=0;a<=len;a++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(display@a)
	goto	l578
	line	59
	
l579:	
	line	60
	
l1953:	
;LCD 4 BIT.h: 59: {
;LCD 4 BIT.h: 60: lcd_data(word[a]);
	movf	(display@a),w
	addwf	(display@word),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	line	58
	
l1955:	
	movlw	(01h)
	movwf	(??_display+0)+0
	movf	(??_display+0)+0,w
	addwf	(display@a),f
	
l578:	
	
l1957:	
	movf	(display@a),w
	subwf	(display@len),w
	skipnc
	goto	u2271
	goto	u2270
u2271:
	goto	l579
u2270:
	
l580:	
	line	63
	
l581:	
	return
	opt stack 0
GLOBAL	__end_of_display
	__end_of_display:
;; =============== function _display ends ============

	signat	_display,8312
	global	_lcd_command
psect	text196,local,class=CODE,delta=2
global __ptext196
__ptext196:

;; *************** function _lcd_command *****************
;; Defined at:
;;		line 10 in file "D:\TI\PIC course\EEPROM\LCD 4 BIT.h"
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
psect	text196
	file	"D:\TI\PIC course\EEPROM\LCD 4 BIT.h"
	line	10
	global	__size_of_lcd_command
	__size_of_lcd_command	equ	__end_of_lcd_command-_lcd_command
	
_lcd_command:	
	opt	stack 1
; Regs used in _lcd_command: [wreg+status,2+status,0+pclath+cstack]
;lcd_command@command stored from wreg
	line	12
	movwf	(lcd_command@command)
	
l1923:	
;LCD 4 BIT.h: 11: unsigned char temp;
;LCD 4 BIT.h: 12: PORTD=command&0xF0;
	movf	(lcd_command@command),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	13
	
l1925:	
;LCD 4 BIT.h: 13: RD0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7
	line	14
	
l1927:	
;LCD 4 BIT.h: 14: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	15
	
l1929:	
;LCD 4 BIT.h: 15: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	line	16
	
l1931:	
;LCD 4 BIT.h: 16: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	17
	
l1933:	
;LCD 4 BIT.h: 17: RD1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	18
	
l1935:	
;LCD 4 BIT.h: 18: temp=command<<4;
	movf	(lcd_command@command),w
	movwf	(??_lcd_command+0)+0
	movlw	(04h)-1
u2265:
	clrc
	rlf	(??_lcd_command+0)+0,f
	addlw	-1
	skipz
	goto	u2265
	clrc
	rlf	(??_lcd_command+0)+0,w
	movwf	(??_lcd_command+1)+0
	movf	(??_lcd_command+1)+0,w
	movwf	(lcd_command@temp)
	line	19
	
l1937:	
;LCD 4 BIT.h: 19: PORTD=temp&0xF0;
	movf	(lcd_command@temp),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	20
	
l1939:	
;LCD 4 BIT.h: 20: RD0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7
	line	21
	
l1941:	
;LCD 4 BIT.h: 21: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	22
	
l1943:	
;LCD 4 BIT.h: 22: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	line	23
	
l1945:	
;LCD 4 BIT.h: 23: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	24
	
l1947:	
;LCD 4 BIT.h: 24: RD1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	26
	
l569:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_command
	__end_of_lcd_command:
;; =============== function _lcd_command ends ============

	signat	_lcd_command,4216
	global	_lcd_data
psect	text197,local,class=CODE,delta=2
global __ptext197
__ptext197:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 28 in file "D:\TI\PIC course\EEPROM\LCD 4 BIT.h"
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
psect	text197
	file	"D:\TI\PIC course\EEPROM\LCD 4 BIT.h"
	line	28
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 1
; Regs used in _lcd_data: [wreg+status,2+status,0+pclath+cstack]
;lcd_data@data stored from wreg
	line	30
	movwf	(lcd_data@data)
	
l1897:	
;LCD 4 BIT.h: 29: unsigned char temp1;
;LCD 4 BIT.h: 30: PORTD=data&0xF0;
	movf	(lcd_data@data),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	31
	
l1899:	
;LCD 4 BIT.h: 31: RD0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(64/8),(64)&7
	line	32
	
l1901:	
;LCD 4 BIT.h: 32: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	33
	
l1903:	
;LCD 4 BIT.h: 33: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	line	34
	
l1905:	
;LCD 4 BIT.h: 34: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	35
	
l1907:	
;LCD 4 BIT.h: 35: RD1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	36
	
l1909:	
;LCD 4 BIT.h: 36: temp1=data<<4;
	movf	(lcd_data@data),w
	movwf	(??_lcd_data+0)+0
	movlw	(04h)-1
u2255:
	clrc
	rlf	(??_lcd_data+0)+0,f
	addlw	-1
	skipz
	goto	u2255
	clrc
	rlf	(??_lcd_data+0)+0,w
	movwf	(??_lcd_data+1)+0
	movf	(??_lcd_data+1)+0,w
	movwf	(lcd_data@temp1)
	line	37
	
l1911:	
;LCD 4 BIT.h: 37: PORTD=temp1&0xF0;
	movf	(lcd_data@temp1),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	38
	
l1913:	
;LCD 4 BIT.h: 38: RD0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(64/8),(64)&7
	line	39
	
l1915:	
;LCD 4 BIT.h: 39: RW=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	40
	
l1917:	
;LCD 4 BIT.h: 40: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	line	41
	
l1919:	
;LCD 4 BIT.h: 41: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	42
	
l1921:	
;LCD 4 BIT.h: 42: RD1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	45
	
l572:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
	global	_delay
psect	text198,local,class=CODE,delta=2
global __ptext198
__ptext198:

;; *************** function _delay *****************
;; Defined at:
;;		line 5 in file "D:\TI\PIC course\EEPROM\LCD 4 BIT.h"
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
psect	text198
	file	"D:\TI\PIC course\EEPROM\LCD 4 BIT.h"
	line	5
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 0
; Regs used in _delay: [wreg]
	line	6
	
l1879:	
;LCD 4 BIT.h: 6: while(a--);
	goto	l563
	
l564:	
	
l563:	
	
l1881:	
	movlw	low(01h)
	subwf	(delay@a),f
	movlw	high(01h)
	skipc
	decf	(delay@a+1),f
	subwf	(delay@a+1),f
	movlw	high(0FFFFh)
	xorwf	((delay@a+1)),w
	skipz
	goto	u2235
	movlw	low(0FFFFh)
	xorwf	((delay@a)),w
u2235:

	skipz
	goto	u2231
	goto	u2230
u2231:
	goto	l564
u2230:
	
l565:	
	line	7
	
l566:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
	global	_read_byte_from_EE
psect	text199,local,class=CODE,delta=2
global __ptext199
__ptext199:

;; *************** function _read_byte_from_EE *****************
;; Defined at:
;;		line 24 in file "D:\TI\PIC course\EEPROM\EEPROM.c"
;; Parameters:    Size  Location     Type
;;  address         1    wreg     const unsigned char 
;; Auto vars:     Size  Location     Type
;;  address         1    1[COMMON] const unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text199
	file	"D:\TI\PIC course\EEPROM\EEPROM.c"
	line	24
	global	__size_of_read_byte_from_EE
	__size_of_read_byte_from_EE	equ	__end_of_read_byte_from_EE-_read_byte_from_EE
	
_read_byte_from_EE:	
	opt	stack 0
; Regs used in _read_byte_from_EE: [wreg]
;read_byte_from_EE@address stored from wreg
	movwf	(read_byte_from_EE@address)
	line	25
	
l1883:	
;EEPROM.c: 25: EEADR=address;
	movf	(read_byte_from_EE@address),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(269)^0100h	;volatile
	line	26
	
l1885:	
;EEPROM.c: 26: EEPGD=0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3175/8)^0180h,(3175)&7
	line	27
	
l1887:	
;EEPROM.c: 27: RD=1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3168/8)^0180h,(3168)&7
	line	28
;EEPROM.c: 28: byte=EEDATA;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(268)^0100h,w	;volatile
	movwf	(??_read_byte_from_EE+0)+0
	movf	(??_read_byte_from_EE+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_byte)
	line	31
	
l590:	
	return
	opt stack 0
GLOBAL	__end_of_read_byte_from_EE
	__end_of_read_byte_from_EE:
;; =============== function _read_byte_from_EE ends ============

	signat	_read_byte_from_EE,4216
	global	_write_byte_to_EE
psect	text200,local,class=CODE,delta=2
global __ptext200
__ptext200:

;; *************** function _write_byte_to_EE *****************
;; Defined at:
;;		line 11 in file "D:\TI\PIC course\EEPROM\EEPROM.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;;  address         1    0[COMMON] const unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text200
	file	"D:\TI\PIC course\EEPROM\EEPROM.c"
	line	11
	global	__size_of_write_byte_to_EE
	__size_of_write_byte_to_EE	equ	__end_of_write_byte_to_EE-_write_byte_to_EE
	
_write_byte_to_EE:	
	opt	stack 0
; Regs used in _write_byte_to_EE: [wreg]
;write_byte_to_EE@data stored from wreg
	movwf	(write_byte_to_EE@data)
	line	12
	
l1889:	
;EEPROM.c: 12: EEADR=address;
	movf	(write_byte_to_EE@address),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(269)^0100h	;volatile
	line	13
;EEPROM.c: 13: EEDATA=data;
	movf	(write_byte_to_EE@data),w
	movwf	(268)^0100h	;volatile
	line	14
	
l1891:	
;EEPROM.c: 14: EEPGD=0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3175/8)^0180h,(3175)&7
	line	15
	
l1893:	
;EEPROM.c: 15: WREN=1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3170/8)^0180h,(3170)&7
	line	16
;EEPROM.c: 16: EECON2=0x55;
	movlw	(055h)
	movwf	(397)^0180h	;volatile
	line	17
;EEPROM.c: 17: EECON2=0xAA;
	movlw	(0AAh)
	movwf	(397)^0180h	;volatile
	line	18
	
l1895:	
;EEPROM.c: 18: WR=1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3169/8)^0180h,(3169)&7
	line	19
;EEPROM.c: 19: while(EEIF==0);
	goto	l584
	
l585:	
	
l584:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(108/8),(108)&7
	goto	u2241
	goto	u2240
u2241:
	goto	l585
u2240:
	
l586:	
	line	20
;EEPROM.c: 20: WREN=0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3170/8)^0180h,(3170)&7
	line	21
;EEPROM.c: 21: EEIF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(108/8),(108)&7
	line	22
	
l587:	
	return
	opt stack 0
GLOBAL	__end_of_write_byte_to_EE
	__end_of_write_byte_to_EE:
;; =============== function _write_byte_to_EE ends ============

	signat	_write_byte_to_EE,8312
psect	text201,local,class=CODE,delta=2
global __ptext201
__ptext201:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
