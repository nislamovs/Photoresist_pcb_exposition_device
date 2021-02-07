opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 9453"

opt pagewidth 120

	opt lm

	processor	16F690
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
	FNCALL	_main,_LCDInit
	FNCALL	_main,_Message1
	FNCALL	_main,_Sbros
	FNCALL	_main,_LCDWrite
	FNCALL	_main,_buzz1
	FNCALL	_main,_Increment
	FNCALL	_Increment,_buzz1
	FNCALL	_Increment,_LCDWrite
	FNCALL	_Increment,_Message2
	FNCALL	_Message1,_LCDWrite
	FNCALL	_Message2,_LCDWrite
	FNCALL	_Sbros,_buzz2
	FNCALL	_LCDInit,_LCDWrite
	FNROOT	_main
	global	_mas
	global	_mas2
	global	_mas3
	global	_j
	global	_n
	global	_p
	global	_q
	global	_y
	global	_flag
	global	_t2
	global	_t3
	global	_t4
	global	_x
	global	_t1
	global	_PORTA
psect	text256,local,class=CODE,delta=2
global __ptext256
__ptext256:
_PORTA	set	5
	global	_PORTB
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RA0
_RA0	set	40
	global	_RA1
_RA1	set	41
	global	_RA2
_RA2	set	42
	global	_RA3
_RA3	set	43
	global	_RA4
_RA4	set	44
	global	_RA5
_RA5	set	45
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_RB6
_RB6	set	54
	global	_RB7
_RB7	set	55
	global	_RC4
_RC4	set	60
	global	_RC5
_RC5	set	61
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_ANSEL
_ANSEL	set	286
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	file	"upravlenije.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_x:
       ds      2

_t1:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_mas:
       ds      6

_mas2:
       ds      6

_mas3:
       ds      6

_j:
       ds      2

_n:
       ds      2

_p:
       ds      2

_q:
       ds      2

_y:
       ds      2

_flag:
       ds      1

_t2:
       ds      1

_t3:
       ds      1

_t4:
       ds      1

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+020h)
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	??_buzz2
??_buzz2:	; 0 bytes @ 0x0
	global	??_buzz1
??_buzz1:	; 0 bytes @ 0x0
	global	?_LCDWrite
?_LCDWrite:	; 0 bytes @ 0x0
	global	?_LCDInit
?_LCDInit:	; 0 bytes @ 0x0
	global	?_buzz2
?_buzz2:	; 2 bytes @ 0x0
	global	?_buzz1
?_buzz1:	; 2 bytes @ 0x0
	global	?_Message2
?_Message2:	; 2 bytes @ 0x0
	global	?_Sbros
?_Sbros:	; 2 bytes @ 0x0
	global	?_Increment
?_Increment:	; 2 bytes @ 0x0
	global	?_Message1
?_Message1:	; 2 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	global	LCDWrite@LCDData
LCDWrite@LCDData:	; 2 bytes @ 0x0
	ds	2
	global	??_Sbros
??_Sbros:	; 0 bytes @ 0x2
	global	LCDWrite@RSValue
LCDWrite@RSValue:	; 2 bytes @ 0x2
	ds	2
	global	??_LCDWrite
??_LCDWrite:	; 0 bytes @ 0x4
	ds	2
	global	??_Message2
??_Message2:	; 0 bytes @ 0x6
	global	??_LCDInit
??_LCDInit:	; 0 bytes @ 0x6
	global	??_Increment
??_Increment:	; 0 bytes @ 0x6
	global	??_Message1
??_Message1:	; 0 bytes @ 0x6
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x8
	ds	3
;;Data sizes: Strings 0, constant 0, data 0, bss 35, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     11      14
;; BANK0           80      0      32
;; BANK1           80      0       0
;; BANK2           80      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_LCDInit
;;   _main->_Increment
;;   _Increment->_LCDWrite
;;   _Message1->_LCDWrite
;;   _Message2->_LCDWrite
;;   _Sbros->_buzz2
;;   _LCDInit->_LCDWrite
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 3     3      0     660
;;                                              8 COMMON     3     3      0
;;                            _LCDInit
;;                           _Message1
;;                              _Sbros
;;                           _LCDWrite
;;                              _buzz1
;;                          _Increment
;; ---------------------------------------------------------------------------------
;; (1) _Increment                                            2     2      0     264
;;                                              6 COMMON     2     2      0
;;                              _buzz1
;;                           _LCDWrite
;;                           _Message2
;; ---------------------------------------------------------------------------------
;; (1) _Message1                                             0     0      0     132
;;                           _LCDWrite
;; ---------------------------------------------------------------------------------
;; (2) _Message2                                             0     0      0     132
;;                           _LCDWrite
;; ---------------------------------------------------------------------------------
;; (1) _Sbros                                                0     0      0       0
;;                              _buzz2
;; ---------------------------------------------------------------------------------
;; (1) _LCDInit                                              2     2      0     132
;;                                              6 COMMON     2     2      0
;;                           _LCDWrite
;; ---------------------------------------------------------------------------------
;; (2) _buzz1                                                2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (2) _buzz2                                                2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (3) _LCDWrite                                             6     2      4     132
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _LCDInit
;;     _LCDWrite
;;   _Message1
;;     _LCDWrite
;;   _Sbros
;;     _buzz2
;;   _LCDWrite
;;   _buzz1
;;   _Increment
;;     _buzz1
;;     _LCDWrite
;;     _Message2
;;       _LCDWrite
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      B       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;BANK0               50      0      20       3       40.0%
;;BITBANK1            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK1               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK2            50      0       0       6        0.0%
;;BANK2               50      0       0       7        0.0%
;;ABS                  0      0      2E       8        0.0%
;;BITBANK0            50      0       0       9        0.0%
;;DATA                 0      0      31      10        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 228 in file "C:\Users\gf\Desktop\photoresist\project\proga.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  988[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          3       0       0       0
;;      Totals:         3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_LCDInit
;;		_Message1
;;		_Sbros
;;		_LCDWrite
;;		_buzz1
;;		_Increment
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\gf\Desktop\photoresist\project\proga.c"
	line	228
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	230
	
l4029:	
;proga.c: 230: ANSEL = 0;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(286)^0100h	;volatile
	line	231
;proga.c: 231: TRISC = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	232
;proga.c: 232: PORTC = 0b00000000;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	234
	
l4031:	
;proga.c: 234: LCDInit();
	fcall	_LCDInit
	line	236
	
l4033:	
;proga.c: 236: Message1();
	fcall	_Message1
	line	238
;proga.c: 238: TRISB=0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	239
;proga.c: 239: PORTB=0b00000000;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	243
;proga.c: 243: start:;
	
l989:	
	line	244
;proga.c: 244: x=0;
	clrf	(_x)
	clrf	(_x+1)
	line	245
;proga.c: 245: y=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_y)
	clrf	(_y+1)
	line	246
	
l4035:	
;proga.c: 246: Sbros();
	fcall	_Sbros
	goto	l4037
	line	247
;proga.c: 247: for(;;){
	
l990:	
	line	249
	
l4037:	
;proga.c: 249: _delay((unsigned long)((5)*(4000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_main+0)+0+1),f
	movlw	125
movwf	((??_main+0)+0),f
u4167:
	decfsz	((??_main+0)+0),f
	goto	u4167
	decfsz	((??_main+0)+0+1),f
	goto	u4167
opt asmopt_on

	line	251
	
l4039:	
;proga.c: 251: TRISA=0b11111110;
	movlw	(0FEh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	252
	
l4041:	
;proga.c: 252: TRISB=0b00000000;
	clrf	(134)^080h	;volatile
	line	253
	
l4043:	
;proga.c: 253: PORTA=0b00000001;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(5)	;volatile
	line	255
	
l4045:	
;proga.c: 255: _delay((unsigned long)((5)*(4000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_main+0)+0+1),f
	movlw	125
movwf	((??_main+0)+0),f
u4177:
	decfsz	((??_main+0)+0),f
	goto	u4177
	decfsz	((??_main+0)+0+1),f
	goto	u4177
opt asmopt_on

	line	256
	
l4047:	
;proga.c: 256: if (RA1==1){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(41/8),(41)&7
	goto	u3531
	goto	u3530
u3531:
	goto	l991
u3530:
	line	257
	
l4049:	
;proga.c: 257: n=0;
	clrf	(_n)
	clrf	(_n+1)
	line	258
;proga.c: 258: while (RA1==1){
	goto	l4063
	
l993:	
	line	259
	
l4051:	
;proga.c: 259: if (n==100)
	movlw	064h
	xorwf	(_n),w
	iorwf	(_n+1),w
	skipz
	goto	u3541
	goto	u3540
u3541:
	goto	l4061
u3540:
	line	261
	
l4053:	
;proga.c: 260: {
;proga.c: 261: if (x<5){
	movf	(_x+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3555
	movlw	low(05h)
	subwf	(_x),w
u3555:

	skipnc
	goto	u3551
	goto	u3550
u3551:
	goto	l4347
u3550:
	line	262
	
l4055:	
;proga.c: 262: LCDWrite(50, 1);
	movlw	low(032h)
	movwf	(?_LCDWrite)
	movlw	high(032h)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	263
	
l4057:	
;proga.c: 263: x++;
	movlw	low(01h)
	addwf	(_x),f
	skipnc
	incf	(_x+1),f
	movlw	high(01h)
	addwf	(_x+1),f
	line	264
	
l4059:	
;proga.c: 264: mas[x]=50;
	movlw	(032h)
	movwf	(??_main+0)+0
	movf	(_x),w
	addlw	_mas&0ffh
	movwf	fsr0
	movf	(??_main+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	265
;proga.c: 265: }
	goto	l4061
	line	266
	
l995:	
;proga.c: 266: else goto end;
	goto	l4347
	
l996:	
	goto	l4061
	line	267
	
l994:	
	line	268
	
l4061:	
;proga.c: 267: }
;proga.c: 268: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_main+0)+0+1),f
	movlw	151
movwf	((??_main+0)+0),f
u4187:
	decfsz	((??_main+0)+0),f
	goto	u4187
	decfsz	((??_main+0)+0+1),f
	goto	u4187
	nop2
opt asmopt_on

	line	269
;proga.c: 269: n++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	goto	l4063
	line	270
	
l992:	
	line	258
	
l4063:	
	btfsc	(41/8),(41)&7
	goto	u3561
	goto	u3560
u3561:
	goto	l4051
u3560:
	goto	l991
	
l998:	
	line	270
	
l991:	
	line	272
;proga.c: 270: }}
;proga.c: 272: if (RA3==1){
	btfss	(43/8),(43)&7
	goto	u3571
	goto	u3570
u3571:
	goto	l999
u3570:
	line	273
	
l4065:	
;proga.c: 273: n=0;
	clrf	(_n)
	clrf	(_n+1)
	line	274
;proga.c: 274: while (RA3==1){
	goto	l4079
	
l1001:	
	line	275
	
l4067:	
;proga.c: 275: if (n==100)
	movlw	064h
	xorwf	(_n),w
	iorwf	(_n+1),w
	skipz
	goto	u3581
	goto	u3580
u3581:
	goto	l4077
u3580:
	line	277
	
l4069:	
;proga.c: 276: {
;proga.c: 277: if (x<5){
	movf	(_x+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3595
	movlw	low(05h)
	subwf	(_x),w
u3595:

	skipnc
	goto	u3591
	goto	u3590
u3591:
	goto	l4347
u3590:
	line	278
	
l4071:	
;proga.c: 278: LCDWrite(48, 1);
	movlw	low(030h)
	movwf	(?_LCDWrite)
	movlw	high(030h)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	279
	
l4073:	
;proga.c: 279: x++;
	movlw	low(01h)
	addwf	(_x),f
	skipnc
	incf	(_x+1),f
	movlw	high(01h)
	addwf	(_x+1),f
	line	280
	
l4075:	
;proga.c: 280: mas[x]=48;
	movlw	(030h)
	movwf	(??_main+0)+0
	movf	(_x),w
	addlw	_mas&0ffh
	movwf	fsr0
	movf	(??_main+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	281
;proga.c: 281: }
	goto	l4077
	line	282
	
l1003:	
;proga.c: 282: else goto end;
	goto	l4347
	
l1004:	
	goto	l4077
	line	283
	
l1002:	
	line	284
	
l4077:	
;proga.c: 283: }
;proga.c: 284: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_main+0)+0+1),f
	movlw	151
movwf	((??_main+0)+0),f
u4197:
	decfsz	((??_main+0)+0),f
	goto	u4197
	decfsz	((??_main+0)+0+1),f
	goto	u4197
	nop2
opt asmopt_on

	line	285
;proga.c: 285: n++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	goto	l4079
	line	286
	
l1000:	
	line	274
	
l4079:	
	btfsc	(43/8),(43)&7
	goto	u3601
	goto	u3600
u3601:
	goto	l4067
u3600:
	goto	l999
	
l1005:	
	line	286
	
l999:	
	line	288
;proga.c: 286: }}
;proga.c: 288: if (RA5==1){
	btfss	(45/8),(45)&7
	goto	u3611
	goto	u3610
u3611:
	goto	l4105
u3610:
	line	289
	
l4081:	
;proga.c: 289: n=0;
	clrf	(_n)
	clrf	(_n+1)
	line	290
;proga.c: 290: while (RA5==1){
	goto	l4103
	
l1008:	
	line	291
	
l4083:	
;proga.c: 291: if (n==100)
	movlw	064h
	xorwf	(_n),w
	iorwf	(_n+1),w
	skipz
	goto	u3621
	goto	u3620
u3621:
	goto	l4101
u3620:
	line	293
	
l4085:	
;proga.c: 292: {
;proga.c: 293: if (x==3) goto end;
	movlw	03h
	xorwf	(_x),w
	iorwf	(_x+1),w
	skipz
	goto	u3631
	goto	u3630
u3631:
	goto	l4089
u3630:
	goto	l4347
	
l4087:	
	goto	l4347
	
l1010:	
	line	294
	
l4089:	
;proga.c: 294: if (x==0) goto end;
	movf	((_x+1)),w
	iorwf	((_x)),w
	skipz
	goto	u3641
	goto	u3640
u3641:
	goto	l4093
u3640:
	goto	l4347
	
l4091:	
	goto	l4347
	
l1011:	
	line	295
	
l4093:	
;proga.c: 295: if (x<5){
	movf	(_x+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3655
	movlw	low(05h)
	subwf	(_x),w
u3655:

	skipnc
	goto	u3651
	goto	u3650
u3651:
	goto	l4347
u3650:
	line	296
	
l4095:	
;proga.c: 296: LCDWrite(56, 1);
	movlw	low(038h)
	movwf	(?_LCDWrite)
	movlw	high(038h)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	297
	
l4097:	
;proga.c: 297: x++;
	movlw	low(01h)
	addwf	(_x),f
	skipnc
	incf	(_x+1),f
	movlw	high(01h)
	addwf	(_x+1),f
	line	298
	
l4099:	
;proga.c: 298: mas[x]=56;
	movlw	(038h)
	movwf	(??_main+0)+0
	movf	(_x),w
	addlw	_mas&0ffh
	movwf	fsr0
	movf	(??_main+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	299
;proga.c: 299: }
	goto	l4101
	line	300
	
l1012:	
;proga.c: 300: else goto end;
	goto	l4347
	
l1013:	
	goto	l4101
	line	301
	
l1009:	
	line	302
	
l4101:	
;proga.c: 301: }
;proga.c: 302: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_main+0)+0+1),f
	movlw	151
movwf	((??_main+0)+0),f
u4207:
	decfsz	((??_main+0)+0),f
	goto	u4207
	decfsz	((??_main+0)+0+1),f
	goto	u4207
	nop2
opt asmopt_on

	line	303
;proga.c: 303: n++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	goto	l4103
	line	304
	
l1007:	
	line	290
	
l4103:	
	btfsc	(45/8),(45)&7
	goto	u3661
	goto	u3660
u3661:
	goto	l4083
u3660:
	goto	l4105
	
l1014:	
	goto	l4105
	line	304
	
l1006:	
	line	306
	
l4105:	
;proga.c: 304: }}
;proga.c: 306: _delay((unsigned long)((5)*(4000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_main+0)+0+1),f
	movlw	125
movwf	((??_main+0)+0),f
u4217:
	decfsz	((??_main+0)+0),f
	goto	u4217
	decfsz	((??_main+0)+0+1),f
	goto	u4217
opt asmopt_on

	line	308
;proga.c: 308: TRISA=0b11101111;
	movlw	(0EFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	309
	
l4107:	
;proga.c: 309: TRISB=0b00000000;
	clrf	(134)^080h	;volatile
	line	310
	
l4109:	
;proga.c: 310: PORTA=0b00010000;
	movlw	(010h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(5)	;volatile
	line	312
	
l4111:	
;proga.c: 312: _delay((unsigned long)((5)*(4000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_main+0)+0+1),f
	movlw	125
movwf	((??_main+0)+0),f
u4227:
	decfsz	((??_main+0)+0),f
	goto	u4227
	decfsz	((??_main+0)+0+1),f
	goto	u4227
opt asmopt_on

	line	314
	
l4113:	
;proga.c: 314: if (RA1==1){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(41/8),(41)&7
	goto	u3671
	goto	u3670
u3671:
	goto	l1015
u3670:
	line	315
	
l4115:	
;proga.c: 315: n=0;
	clrf	(_n)
	clrf	(_n+1)
	line	316
;proga.c: 316: while (RA1==1){
	goto	l4129
	
l1017:	
	line	317
	
l4117:	
;proga.c: 317: if (n==100)
	movlw	064h
	xorwf	(_n),w
	iorwf	(_n+1),w
	skipz
	goto	u3681
	goto	u3680
u3681:
	goto	l4127
u3680:
	line	319
	
l4119:	
;proga.c: 318: {
;proga.c: 319: if (x<5){
	movf	(_x+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3695
	movlw	low(05h)
	subwf	(_x),w
u3695:

	skipnc
	goto	u3691
	goto	u3690
u3691:
	goto	l4347
u3690:
	line	320
	
l4121:	
;proga.c: 320: LCDWrite(51, 1);
	movlw	low(033h)
	movwf	(?_LCDWrite)
	movlw	high(033h)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	321
	
l4123:	
;proga.c: 321: x++;
	movlw	low(01h)
	addwf	(_x),f
	skipnc
	incf	(_x+1),f
	movlw	high(01h)
	addwf	(_x+1),f
	line	322
	
l4125:	
;proga.c: 322: mas[x]=51;
	movlw	(033h)
	movwf	(??_main+0)+0
	movf	(_x),w
	addlw	_mas&0ffh
	movwf	fsr0
	movf	(??_main+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	323
;proga.c: 323: }
	goto	l4127
	line	324
	
l1019:	
;proga.c: 324: else goto end;
	goto	l4347
	
l1020:	
	goto	l4127
	line	325
	
l1018:	
	line	326
	
l4127:	
;proga.c: 325: }
;proga.c: 326: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_main+0)+0+1),f
	movlw	151
movwf	((??_main+0)+0),f
u4237:
	decfsz	((??_main+0)+0),f
	goto	u4237
	decfsz	((??_main+0)+0+1),f
	goto	u4237
	nop2
opt asmopt_on

	line	327
;proga.c: 327: n++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	goto	l4129
	line	328
	
l1016:	
	line	316
	
l4129:	
	btfsc	(41/8),(41)&7
	goto	u3701
	goto	u3700
u3701:
	goto	l4117
u3700:
	goto	l1015
	
l1021:	
	line	328
	
l1015:	
	line	330
;proga.c: 328: }}
;proga.c: 330: if (RA5==1){
	btfss	(45/8),(45)&7
	goto	u3711
	goto	u3710
u3711:
	goto	l1022
u3710:
	line	331
	
l4131:	
;proga.c: 331: n=0;
	clrf	(_n)
	clrf	(_n+1)
	line	332
;proga.c: 332: while (RA5==1){
	goto	l4153
	
l1024:	
	line	333
	
l4133:	
;proga.c: 333: if (n==100)
	movlw	064h
	xorwf	(_n),w
	iorwf	(_n+1),w
	skipz
	goto	u3721
	goto	u3720
u3721:
	goto	l4151
u3720:
	line	335
	
l4135:	
;proga.c: 334: {
;proga.c: 335: if (x==3) goto end;
	movlw	03h
	xorwf	(_x),w
	iorwf	(_x+1),w
	skipz
	goto	u3731
	goto	u3730
u3731:
	goto	l4139
u3730:
	goto	l4347
	
l4137:	
	goto	l4347
	
l1026:	
	line	336
	
l4139:	
;proga.c: 336: if (x==0) goto end;
	movf	((_x+1)),w
	iorwf	((_x)),w
	skipz
	goto	u3741
	goto	u3740
u3741:
	goto	l4143
u3740:
	goto	l4347
	
l4141:	
	goto	l4347
	
l1027:	
	line	337
	
l4143:	
;proga.c: 337: if (x<5){
	movf	(_x+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3755
	movlw	low(05h)
	subwf	(_x),w
u3755:

	skipnc
	goto	u3751
	goto	u3750
u3751:
	goto	l4347
u3750:
	line	338
	
l4145:	
;proga.c: 338: LCDWrite(57, 1);
	movlw	low(039h)
	movwf	(?_LCDWrite)
	movlw	high(039h)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	339
	
l4147:	
;proga.c: 339: x++;
	movlw	low(01h)
	addwf	(_x),f
	skipnc
	incf	(_x+1),f
	movlw	high(01h)
	addwf	(_x+1),f
	line	340
	
l4149:	
;proga.c: 340: mas[x]=57;
	movlw	(039h)
	movwf	(??_main+0)+0
	movf	(_x),w
	addlw	_mas&0ffh
	movwf	fsr0
	movf	(??_main+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	341
;proga.c: 341: }
	goto	l4151
	line	342
	
l1028:	
;proga.c: 342: else goto end;
	goto	l4347
	
l1029:	
	goto	l4151
	line	343
	
l1025:	
	line	344
	
l4151:	
;proga.c: 343: }
;proga.c: 344: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_main+0)+0+1),f
	movlw	151
movwf	((??_main+0)+0),f
u4247:
	decfsz	((??_main+0)+0),f
	goto	u4247
	decfsz	((??_main+0)+0+1),f
	goto	u4247
	nop2
opt asmopt_on

	line	345
;proga.c: 345: n++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	goto	l4153
	line	346
	
l1023:	
	line	332
	
l4153:	
	btfsc	(45/8),(45)&7
	goto	u3761
	goto	u3760
u3761:
	goto	l4133
u3760:
	goto	l1022
	
l1030:	
	line	346
	
l1022:	
	line	348
;proga.c: 346: }}
;proga.c: 348: if (RA3==1){
	btfss	(43/8),(43)&7
	goto	u3771
	goto	u3770
u3771:
	goto	l1031
u3770:
	line	349
	
l4155:	
;proga.c: 349: n=0;
	clrf	(_n)
	clrf	(_n+1)
	line	350
;proga.c: 350: while (RA3==1){
	goto	l4201
	
l1033:	
	line	351
	
l4157:	
;proga.c: 351: if (n==100)
	movlw	064h
	xorwf	(_n),w
	iorwf	(_n+1),w
	skipz
	goto	u3781
	goto	u3780
u3781:
	goto	l4199
u3780:
	line	353
	
l4159:	
;proga.c: 352: {
;proga.c: 353: if (x>4){
	movf	(_x+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3795
	movlw	low(05h)
	subwf	(_x),w
u3795:

	skipc
	goto	u3791
	goto	u3790
u3791:
	goto	l4199
u3790:
	line	354
	
l4161:	
;proga.c: 354: for(j=0;j<6;j++) mas2[j]=mas[j];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_j)
	clrf	(_j+1)
	
l4163:	
	movf	(_j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(06h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3805
	movlw	low(06h)
	subwf	(_j),w
u3805:

	skipc
	goto	u3801
	goto	u3800
u3801:
	goto	l4167
u3800:
	goto	l4173
	
l4165:	
	goto	l4173
	
l1036:	
	
l4167:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_j),w
	addlw	_mas&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_main+0)+0
	movf	(_j),w
	addlw	_mas2&0ffh
	movwf	fsr0
	movf	(??_main+0)+0,w
	movwf	indf
	
l4169:	
	movlw	low(01h)
	addwf	(_j),f
	skipnc
	incf	(_j+1),f
	movlw	high(01h)
	addwf	(_j+1),f
	
l4171:	
	movf	(_j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(06h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3815
	movlw	low(06h)
	subwf	(_j),w
u3815:

	skipc
	goto	u3811
	goto	u3810
u3811:
	goto	l4167
u3810:
	goto	l4173
	
l1037:	
	line	355
	
l4173:	
;proga.c: 355: buzz1();
	fcall	_buzz1
	line	356
;proga.c: 356: buzz1();
	fcall	_buzz1
	line	357
	
l4175:	
;proga.c: 357: flag=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_flag)
	bsf	status,0
	rlf	(_flag),f
	line	358
	
l4177:	
;proga.c: 358: RB6=1;
	bsf	(54/8),(54)&7
	line	359
	
l4179:	
;proga.c: 359: RB7=1;
	bsf	(55/8),(55)&7
	line	360
	
l4181:	
;proga.c: 360: for(j=0;j<6;j++){
	clrf	(_j)
	clrf	(_j+1)
	
l4183:	
	movf	(_j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(06h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3825
	movlw	low(06h)
	subwf	(_j),w
u3825:

	skipc
	goto	u3821
	goto	u3820
u3821:
	goto	l4187
u3820:
	goto	l4193
	
l4185:	
	goto	l4193
	
l1038:	
	line	361
	
l4187:	
;proga.c: 361: q=mas2[j]-48;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_j),w
	addlw	_mas2&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	addlw	low(-48)
	movwf	(_q)
	movlw	high(-48)
	skipnc
	movlw	(high(-48)+1)&0ffh
	movwf	((_q))+1
	line	362
;proga.c: 362: mas3[j]=q;
	movf	(_q),w
	movwf	(??_main+0)+0
	movf	(_j),w
	addlw	_mas3&0ffh
	movwf	fsr0
	movf	(??_main+0)+0,w
	movwf	indf
	line	360
	
l4189:	
	movlw	low(01h)
	addwf	(_j),f
	skipnc
	incf	(_j+1),f
	movlw	high(01h)
	addwf	(_j+1),f
	
l4191:	
	movf	(_j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(06h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3835
	movlw	low(06h)
	subwf	(_j),w
u3835:

	skipc
	goto	u3831
	goto	u3830
u3831:
	goto	l4187
u3830:
	goto	l4193
	
l1039:	
	line	364
	
l4193:	
;proga.c: 363: }
;proga.c: 364: Increment();
	fcall	_Increment
	line	365
	
l4195:	
;proga.c: 365: LCDWrite(1,0);
	movlw	low(01h)
	movwf	(?_LCDWrite)
	movlw	high(01h)
	movwf	((?_LCDWrite))+1
	movlw	low(0)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(0)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	366
	
l4197:	
;proga.c: 366: Message1();
	fcall	_Message1
	line	367
;proga.c: 367: goto start;
	goto	l989
	line	368
	
l1035:	
	goto	l4199
	line	369
	
l1034:	
	line	370
	
l4199:	
;proga.c: 368: }
;proga.c: 369: }
;proga.c: 370: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_main+0)+0+1),f
	movlw	151
movwf	((??_main+0)+0),f
u4257:
	decfsz	((??_main+0)+0),f
	goto	u4257
	decfsz	((??_main+0)+0+1),f
	goto	u4257
	nop2
opt asmopt_on

	line	371
;proga.c: 371: n++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	goto	l4201
	line	372
	
l1032:	
	line	350
	
l4201:	
	btfsc	(43/8),(43)&7
	goto	u3841
	goto	u3840
u3841:
	goto	l4157
u3840:
	goto	l1031
	
l1040:	
	line	372
	
l1031:	
	line	374
;proga.c: 372: }}
;proga.c: 374: if(RA3==1) {
	goto	l4203
	line	376
	
l1041:	
	line	378
	
l4203:	
;proga.c: 376: }
;proga.c: 378: _delay((unsigned long)((5)*(4000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_main+0)+0+1),f
	movlw	125
movwf	((??_main+0)+0),f
u4267:
	decfsz	((??_main+0)+0),f
	goto	u4267
	decfsz	((??_main+0)+0+1),f
	goto	u4267
opt asmopt_on

	line	380
;proga.c: 380: TRISA=0b11111011;
	movlw	(0FBh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	381
	
l4205:	
;proga.c: 381: TRISB=0b00000000;
	clrf	(134)^080h	;volatile
	line	382
	
l4207:	
;proga.c: 382: PORTA=0b00000100;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(5)	;volatile
	line	384
	
l4209:	
;proga.c: 384: _delay((unsigned long)((5)*(4000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_main+0)+0+1),f
	movlw	125
movwf	((??_main+0)+0),f
u4277:
	decfsz	((??_main+0)+0),f
	goto	u4277
	decfsz	((??_main+0)+0+1),f
	goto	u4277
opt asmopt_on

	line	386
	
l4211:	
;proga.c: 386: if (RA1==1){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(41/8),(41)&7
	goto	u3851
	goto	u3850
u3851:
	goto	l1042
u3850:
	line	387
	
l4213:	
;proga.c: 387: n=0;
	clrf	(_n)
	clrf	(_n+1)
	line	388
;proga.c: 388: while (RA1==1){
	goto	l4227
	
l1044:	
	line	389
	
l4215:	
;proga.c: 389: if (n==100)
	movlw	064h
	xorwf	(_n),w
	iorwf	(_n+1),w
	skipz
	goto	u3861
	goto	u3860
u3861:
	goto	l4225
u3860:
	line	391
	
l4217:	
;proga.c: 390: {
;proga.c: 391: if (x<5){
	movf	(_x+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3875
	movlw	low(05h)
	subwf	(_x),w
u3875:

	skipnc
	goto	u3871
	goto	u3870
u3871:
	goto	l4347
u3870:
	line	392
	
l4219:	
;proga.c: 392: LCDWrite(49, 1);
	movlw	low(031h)
	movwf	(?_LCDWrite)
	movlw	high(031h)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	393
	
l4221:	
;proga.c: 393: x++;
	movlw	low(01h)
	addwf	(_x),f
	skipnc
	incf	(_x+1),f
	movlw	high(01h)
	addwf	(_x+1),f
	line	394
	
l4223:	
;proga.c: 394: mas[x]=49;
	movlw	(031h)
	movwf	(??_main+0)+0
	movf	(_x),w
	addlw	_mas&0ffh
	movwf	fsr0
	movf	(??_main+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	395
;proga.c: 395: }
	goto	l4225
	line	396
	
l1046:	
;proga.c: 396: else goto end;
	goto	l4347
	
l1047:	
	goto	l4225
	line	397
	
l1045:	
	line	398
	
l4225:	
;proga.c: 397: }
;proga.c: 398: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_main+0)+0+1),f
	movlw	151
movwf	((??_main+0)+0),f
u4287:
	decfsz	((??_main+0)+0),f
	goto	u4287
	decfsz	((??_main+0)+0+1),f
	goto	u4287
	nop2
opt asmopt_on

	line	399
;proga.c: 399: n++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	goto	l4227
	line	400
	
l1043:	
	line	388
	
l4227:	
	btfsc	(41/8),(41)&7
	goto	u3881
	goto	u3880
u3881:
	goto	l4215
u3880:
	goto	l1042
	
l1048:	
	line	400
	
l1042:	
	line	402
;proga.c: 400: }}
;proga.c: 402: if (RA3==1){
	btfss	(43/8),(43)&7
	goto	u3891
	goto	u3890
u3891:
	goto	l1049
u3890:
	line	403
	
l4229:	
;proga.c: 403: n=0;
	clrf	(_n)
	clrf	(_n+1)
	line	404
;proga.c: 404: while (RA3==1){
	goto	l4255
	
l1051:	
	line	405
	
l4231:	
;proga.c: 405: if (n==100)
	movlw	064h
	xorwf	(_n),w
	iorwf	(_n+1),w
	skipz
	goto	u3901
	goto	u3900
u3901:
	goto	l4253
u3900:
	line	407
	
l4233:	
;proga.c: 406: {
;proga.c: 407: if (x==3){
	movlw	03h
	xorwf	(_x),w
	iorwf	(_x+1),w
	skipz
	goto	u3911
	goto	u3910
u3911:
	goto	l4237
u3910:
	line	408
	
l4235:	
;proga.c: 408: x=x-1;
	movf	(_x),w
	addlw	low(-1)
	movwf	(_x)
	movf	(_x+1),w
	skipnc
	addlw	1
	addlw	high(-1)
	movwf	1+(_x)
	goto	l4237
	line	409
	
l1053:	
	line	410
	
l4237:	
;proga.c: 409: }
;proga.c: 410: if (x>0){
	movf	(_x+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3925
	movlw	low(01h)
	subwf	(_x),w
u3925:

	skipc
	goto	u3921
	goto	u3920
u3921:
	goto	l4347
u3920:
	line	411
	
l4239:	
;proga.c: 411: x--;
	movlw	low(-1)
	addwf	(_x),f
	skipnc
	incf	(_x+1),f
	movlw	high(-1)
	addwf	(_x+1),f
	line	412
	
l4241:	
;proga.c: 412: LCDWrite(1, 0);
	movlw	low(01h)
	movwf	(?_LCDWrite)
	movlw	high(01h)
	movwf	((?_LCDWrite))+1
	movlw	low(0)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(0)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	413
	
l4243:	
;proga.c: 413: Message1();
	fcall	_Message1
	line	414
;proga.c: 414: y=1;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_y)
	movlw	high(01h)
	movwf	((_y))+1
	goto	l4245
	line	415
;proga.c: 415: loop:;
	
l1055:	
	line	416
	
l4245:	
;proga.c: 416: if(y<x+1){
	movf	(_x),w
	addlw	low(01h)
	movwf	(??_main+0)+0
	movf	(_x+1),w
	skipnc
	addlw	1
	addlw	high(01h)
	movwf	1+(??_main+0)+0
	movf	(_y+1),w
	xorlw	80h
	movwf	(??_main+2)+0
	movf	1+(??_main+0)+0,w
	xorlw	80h
	subwf	(??_main+2)+0,w
	skipz
	goto	u3935
	movf	0+(??_main+0)+0,w
	subwf	(_y),w
u3935:

	skipnc
	goto	u3931
	goto	u3930
u3931:
	goto	l4253
u3930:
	line	417
	
l4247:	
;proga.c: 417: p=mas[y];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_y),w
	addlw	_mas&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	(_p)
	movf	1+(??_main+0)+0,w
	movwf	(_p+1)
	line	418
	
l4249:	
;proga.c: 418: LCDWrite(p, 1);
	movf	(_p+1),w
	clrf	(?_LCDWrite+1)
	addwf	(?_LCDWrite+1)
	movf	(_p),w
	clrf	(?_LCDWrite)
	addwf	(?_LCDWrite)

	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	419
	
l4251:	
;proga.c: 419: y++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_y),f
	skipnc
	incf	(_y+1),f
	movlw	high(01h)
	addwf	(_y+1),f
	line	420
;proga.c: 420: goto loop;
	goto	l4245
	line	421
	
l1056:	
;proga.c: 421: }}
	goto	l4253
	line	422
	
l1054:	
;proga.c: 422: else goto end;
	goto	l4347
	
l1057:	
	goto	l4253
	line	423
	
l1052:	
	line	424
	
l4253:	
;proga.c: 423: }
;proga.c: 424: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_main+0)+0+1),f
	movlw	151
movwf	((??_main+0)+0),f
u4297:
	decfsz	((??_main+0)+0),f
	goto	u4297
	decfsz	((??_main+0)+0+1),f
	goto	u4297
	nop2
opt asmopt_on

	line	425
;proga.c: 425: n++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	goto	l4255
	line	426
	
l1050:	
	line	404
	
l4255:	
	btfsc	(43/8),(43)&7
	goto	u3941
	goto	u3940
u3941:
	goto	l4231
u3940:
	goto	l1049
	
l1058:	
	line	426
	
l1049:	
	line	428
;proga.c: 426: }}
;proga.c: 428: if (RA5==1){
	btfss	(45/8),(45)&7
	goto	u3951
	goto	u3950
u3951:
	goto	l4281
u3950:
	line	429
	
l4257:	
;proga.c: 429: n=0;
	clrf	(_n)
	clrf	(_n+1)
	line	430
;proga.c: 430: while (RA5==1){
	goto	l4279
	
l1061:	
	line	431
	
l4259:	
;proga.c: 431: if (n==100)
	movlw	064h
	xorwf	(_n),w
	iorwf	(_n+1),w
	skipz
	goto	u3961
	goto	u3960
u3961:
	goto	l4277
u3960:
	line	433
	
l4261:	
;proga.c: 432: {
;proga.c: 433: if (x==3) goto end;
	movlw	03h
	xorwf	(_x),w
	iorwf	(_x+1),w
	skipz
	goto	u3971
	goto	u3970
u3971:
	goto	l4265
u3970:
	goto	l4347
	
l4263:	
	goto	l4347
	
l1063:	
	line	434
	
l4265:	
;proga.c: 434: if (x==0) goto end;
	movf	((_x+1)),w
	iorwf	((_x)),w
	skipz
	goto	u3981
	goto	u3980
u3981:
	goto	l4269
u3980:
	goto	l4347
	
l4267:	
	goto	l4347
	
l1064:	
	line	435
	
l4269:	
;proga.c: 435: if (x<5){
	movf	(_x+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3995
	movlw	low(05h)
	subwf	(_x),w
u3995:

	skipnc
	goto	u3991
	goto	u3990
u3991:
	goto	l4347
u3990:
	line	436
	
l4271:	
;proga.c: 436: LCDWrite(55, 1);
	movlw	low(037h)
	movwf	(?_LCDWrite)
	movlw	high(037h)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	437
	
l4273:	
;proga.c: 437: x++;
	movlw	low(01h)
	addwf	(_x),f
	skipnc
	incf	(_x+1),f
	movlw	high(01h)
	addwf	(_x+1),f
	line	438
	
l4275:	
;proga.c: 438: mas[x]=55;
	movlw	(037h)
	movwf	(??_main+0)+0
	movf	(_x),w
	addlw	_mas&0ffh
	movwf	fsr0
	movf	(??_main+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	439
;proga.c: 439: }
	goto	l4277
	line	440
	
l1065:	
;proga.c: 440: else goto end;
	goto	l4347
	
l1066:	
	goto	l4277
	line	441
	
l1062:	
	line	442
	
l4277:	
;proga.c: 441: }
;proga.c: 442: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_main+0)+0+1),f
	movlw	151
movwf	((??_main+0)+0),f
u4307:
	decfsz	((??_main+0)+0),f
	goto	u4307
	decfsz	((??_main+0)+0+1),f
	goto	u4307
	nop2
opt asmopt_on

	line	443
;proga.c: 443: n++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	goto	l4279
	line	444
	
l1060:	
	line	430
	
l4279:	
	btfsc	(45/8),(45)&7
	goto	u4001
	goto	u4000
u4001:
	goto	l4259
u4000:
	goto	l4281
	
l1067:	
	goto	l4281
	line	444
	
l1059:	
	line	446
	
l4281:	
;proga.c: 444: }}
;proga.c: 446: _delay((unsigned long)((5)*(4000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_main+0)+0+1),f
	movlw	125
movwf	((??_main+0)+0),f
u4317:
	decfsz	((??_main+0)+0),f
	goto	u4317
	decfsz	((??_main+0)+0+1),f
	goto	u4317
opt asmopt_on

	line	448
;proga.c: 448: TRISA=0b11111111;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	449
	
l4283:	
;proga.c: 449: TRISB=0b00000000;
	clrf	(134)^080h	;volatile
	line	450
	
l4285:	
;proga.c: 450: RB4=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(52/8),(52)&7
	line	452
	
l4287:	
;proga.c: 452: _delay((unsigned long)((5)*(4000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_main+0)+0+1),f
	movlw	125
movwf	((??_main+0)+0),f
u4327:
	decfsz	((??_main+0)+0),f
	goto	u4327
	decfsz	((??_main+0)+0+1),f
	goto	u4327
opt asmopt_on

	line	454
	
l4289:	
;proga.c: 454: if (RA0==1){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(40/8),(40)&7
	goto	u4011
	goto	u4010
u4011:
	goto	l1068
u4010:
	line	455
	
l4291:	
;proga.c: 455: n=0;
	clrf	(_n)
	clrf	(_n+1)
	line	456
;proga.c: 456: while (RA0==1){
	goto	l4305
	
l1070:	
	line	457
	
l4293:	
;proga.c: 457: if (n==100)
	movlw	064h
	xorwf	(_n),w
	iorwf	(_n+1),w
	skipz
	goto	u4021
	goto	u4020
u4021:
	goto	l4303
u4020:
	line	459
	
l4295:	
;proga.c: 458: {
;proga.c: 459: if (x<5){
	movf	(_x+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u4035
	movlw	low(05h)
	subwf	(_x),w
u4035:

	skipnc
	goto	u4031
	goto	u4030
u4031:
	goto	l4347
u4030:
	line	460
	
l4297:	
;proga.c: 460: LCDWrite(53, 1);
	movlw	low(035h)
	movwf	(?_LCDWrite)
	movlw	high(035h)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	461
	
l4299:	
;proga.c: 461: x++;
	movlw	low(01h)
	addwf	(_x),f
	skipnc
	incf	(_x+1),f
	movlw	high(01h)
	addwf	(_x+1),f
	line	462
	
l4301:	
;proga.c: 462: mas[x]=53;
	movlw	(035h)
	movwf	(??_main+0)+0
	movf	(_x),w
	addlw	_mas&0ffh
	movwf	fsr0
	movf	(??_main+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	463
;proga.c: 463: }
	goto	l4303
	line	464
	
l1072:	
;proga.c: 464: else goto end;
	goto	l4347
	
l1073:	
	goto	l4303
	line	465
	
l1071:	
	line	466
	
l4303:	
;proga.c: 465: }
;proga.c: 466: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_main+0)+0+1),f
	movlw	151
movwf	((??_main+0)+0),f
u4337:
	decfsz	((??_main+0)+0),f
	goto	u4337
	decfsz	((??_main+0)+0+1),f
	goto	u4337
	nop2
opt asmopt_on

	line	467
;proga.c: 467: n++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	goto	l4305
	line	468
	
l1069:	
	line	456
	
l4305:	
	btfsc	(40/8),(40)&7
	goto	u4041
	goto	u4040
u4041:
	goto	l4293
u4040:
	goto	l1068
	
l1074:	
	line	468
	
l1068:	
	line	470
;proga.c: 468: }}
;proga.c: 470: if (RA4==1){
	btfss	(44/8),(44)&7
	goto	u4051
	goto	u4050
u4051:
	goto	l1075
u4050:
	line	471
	
l4307:	
;proga.c: 471: n=0;
	clrf	(_n)
	clrf	(_n+1)
	line	472
;proga.c: 472: while (RA4==1){
	goto	l4329
	
l1077:	
	line	473
	
l4309:	
;proga.c: 473: if (n==100)
	movlw	064h
	xorwf	(_n),w
	iorwf	(_n+1),w
	skipz
	goto	u4061
	goto	u4060
u4061:
	goto	l4327
u4060:
	line	475
	
l4311:	
;proga.c: 474: {
;proga.c: 475: if (x==3) goto end;
	movlw	03h
	xorwf	(_x),w
	iorwf	(_x+1),w
	skipz
	goto	u4071
	goto	u4070
u4071:
	goto	l4315
u4070:
	goto	l4347
	
l4313:	
	goto	l4347
	
l1079:	
	line	476
	
l4315:	
;proga.c: 476: if (x==0) goto end;
	movf	((_x+1)),w
	iorwf	((_x)),w
	skipz
	goto	u4081
	goto	u4080
u4081:
	goto	l4319
u4080:
	goto	l4347
	
l4317:	
	goto	l4347
	
l1080:	
	line	477
	
l4319:	
;proga.c: 477: if (x<5){
	movf	(_x+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u4095
	movlw	low(05h)
	subwf	(_x),w
u4095:

	skipnc
	goto	u4091
	goto	u4090
u4091:
	goto	l4347
u4090:
	line	478
	
l4321:	
;proga.c: 478: LCDWrite(54, 1);
	movlw	low(036h)
	movwf	(?_LCDWrite)
	movlw	high(036h)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	479
	
l4323:	
;proga.c: 479: x++;
	movlw	low(01h)
	addwf	(_x),f
	skipnc
	incf	(_x+1),f
	movlw	high(01h)
	addwf	(_x+1),f
	line	480
	
l4325:	
;proga.c: 480: mas[x]=54;
	movlw	(036h)
	movwf	(??_main+0)+0
	movf	(_x),w
	addlw	_mas&0ffh
	movwf	fsr0
	movf	(??_main+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	481
;proga.c: 481: }
	goto	l4327
	line	482
	
l1081:	
;proga.c: 482: else goto end;
	goto	l4347
	
l1082:	
	goto	l4327
	line	483
	
l1078:	
	line	484
	
l4327:	
;proga.c: 483: }
;proga.c: 484: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_main+0)+0+1),f
	movlw	151
movwf	((??_main+0)+0),f
u4347:
	decfsz	((??_main+0)+0),f
	goto	u4347
	decfsz	((??_main+0)+0+1),f
	goto	u4347
	nop2
opt asmopt_on

	line	485
;proga.c: 485: n++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	goto	l4329
	line	486
	
l1076:	
	line	472
	
l4329:	
	btfsc	(44/8),(44)&7
	goto	u4101
	goto	u4100
u4101:
	goto	l4309
u4100:
	goto	l1075
	
l1083:	
	line	486
	
l1075:	
	line	488
;proga.c: 486: }}
;proga.c: 488: if (RA2==1){
	btfss	(42/8),(42)&7
	goto	u4111
	goto	u4110
u4111:
	goto	l1084
u4110:
	line	489
	
l4331:	
;proga.c: 489: n=0;
	clrf	(_n)
	clrf	(_n+1)
	line	490
;proga.c: 490: while (RA2==1){
	goto	l4345
	
l1086:	
	line	491
	
l4333:	
;proga.c: 491: if (n==100)
	movlw	064h
	xorwf	(_n),w
	iorwf	(_n+1),w
	skipz
	goto	u4121
	goto	u4120
u4121:
	goto	l4343
u4120:
	line	493
	
l4335:	
;proga.c: 492: {
;proga.c: 493: if (x<5){
	movf	(_x+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u4135
	movlw	low(05h)
	subwf	(_x),w
u4135:

	skipnc
	goto	u4131
	goto	u4130
u4131:
	goto	l4347
u4130:
	line	494
	
l4337:	
;proga.c: 494: LCDWrite(52, 1);
	movlw	low(034h)
	movwf	(?_LCDWrite)
	movlw	high(034h)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	495
	
l4339:	
;proga.c: 495: x++;
	movlw	low(01h)
	addwf	(_x),f
	skipnc
	incf	(_x+1),f
	movlw	high(01h)
	addwf	(_x+1),f
	line	496
	
l4341:	
;proga.c: 496: mas[x]=52;
	movlw	(034h)
	movwf	(??_main+0)+0
	movf	(_x),w
	addlw	_mas&0ffh
	movwf	fsr0
	movf	(??_main+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	497
;proga.c: 497: }
	goto	l4343
	line	498
	
l1088:	
;proga.c: 498: else goto end;
	goto	l4347
	
l1089:	
	goto	l4343
	line	499
	
l1087:	
	line	500
	
l4343:	
;proga.c: 499: }
;proga.c: 500: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_main+0)+0+1),f
	movlw	151
movwf	((??_main+0)+0),f
u4357:
	decfsz	((??_main+0)+0),f
	goto	u4357
	decfsz	((??_main+0)+0+1),f
	goto	u4357
	nop2
opt asmopt_on

	line	501
;proga.c: 501: n++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	goto	l4345
	line	502
	
l1085:	
	line	490
	
l4345:	
	btfsc	(42/8),(42)&7
	goto	u4141
	goto	u4140
u4141:
	goto	l4333
u4140:
	goto	l1084
	
l1090:	
	line	502
	
l1084:	
	line	505
;proga.c: 502: }}
;proga.c: 505: if (RA1==1) {
	goto	l4347
	line	507
	
l1091:	
	goto	l4347
	line	525
;proga.c: 507: }
;proga.c: 525: end :;
	
l997:	
	line	526
	
l4347:	
;proga.c: 526: if (x==2){
	movlw	02h
	xorwf	(_x),w
	iorwf	(_x+1),w
	skipz
	goto	u4151
	goto	u4150
u4151:
	goto	l4355
u4150:
	line	527
	
l4349:	
;proga.c: 527: LCDWrite('-', 1);
	movlw	low(02Dh)
	movwf	(?_LCDWrite)
	movlw	high(02Dh)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	528
	
l4351:	
;proga.c: 528: x++;
	movlw	low(01h)
	addwf	(_x),f
	skipnc
	incf	(_x+1),f
	movlw	high(01h)
	addwf	(_x+1),f
	line	529
	
l4353:	
;proga.c: 529: mas[x]='-';
	movlw	(02Dh)
	movwf	(??_main+0)+0
	movf	(_x),w
	addlw	_mas&0ffh
	movwf	fsr0
	movf	(??_main+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	goto	l4355
	line	530
	
l1092:	
	line	531
	
l4355:	
;proga.c: 530: }
;proga.c: 531: _delay((unsigned long)((5)*(4000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_main+0)+0+1),f
	movlw	125
movwf	((??_main+0)+0),f
u4367:
	decfsz	((??_main+0)+0),f
	goto	u4367
	decfsz	((??_main+0)+0+1),f
	goto	u4367
opt asmopt_on

	line	532
	
l4357:	
;proga.c: 532: RB4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(52/8),(52)&7
	line	536
;proga.c: 536: }
	goto	l4037
	
l1093:	
	line	545
	
l1094:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_Increment
psect	text257,local,class=CODE,delta=2
global __ptext257
__ptext257:

;; *************** function _Increment *****************
;; Defined at:
;;		line 30 in file "C:\Users\gf\Desktop\photoresist\project\proga.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  933[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_buzz1
;;		_LCDWrite
;;		_Message2
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text257
	file	"C:\Users\gf\Desktop\photoresist\project\proga.c"
	line	30
	global	__size_of_Increment
	__size_of_Increment	equ	__end_of_Increment-_Increment
	
_Increment:	
	opt	stack 5
; Regs used in _Increment: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	31
;proga.c: 31: for(;;){
	
l934:	
	line	33
	
l3859:	
;proga.c: 33: TRISA=0b11101111;
	movlw	(0EFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	34
	
l3861:	
;proga.c: 34: RB4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(52/8),(52)&7
	line	35
;proga.c: 35: PORTA=0b00010000;
	movlw	(010h)
	movwf	(5)	;volatile
	line	37
	
l3863:	
;proga.c: 37: if (RA3==1){
	btfss	(43/8),(43)&7
	goto	u3301
	goto	u3300
u3301:
	goto	l3961
u3300:
	line	38
	
l3865:	
;proga.c: 38: n=0;
	clrf	(_n)
	clrf	(_n+1)
	line	39
;proga.c: 39: while (RA3==1){
	goto	l3959
	
l937:	
	line	40
	
l3867:	
;proga.c: 40: if (n==100)
	movlw	064h
	xorwf	(_n),w
	iorwf	(_n+1),w
	skipz
	goto	u3311
	goto	u3310
u3311:
	goto	l3957
u3310:
	goto	l3869
	line	42
;proga.c: 41: {
;proga.c: 42: resume:;
	
l939:	
	line	43
	
l3869:	
;proga.c: 43: buzz1();
	fcall	_buzz1
	line	44
;proga.c: 44: buzz1();
	fcall	_buzz1
	line	45
	
l3871:	
;proga.c: 45: if (flag==2){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_flag),w
	xorlw	02h
	skipz
	goto	u3321
	goto	u3320
u3321:
	goto	l3879
u3320:
	line	46
	
l3873:	
;proga.c: 46: flag=1;
	clrf	(_flag)
	bsf	status,0
	rlf	(_flag),f
	line	47
	
l3875:	
;proga.c: 47: RB6=1;
	bsf	(54/8),(54)&7
	line	48
	
l3877:	
;proga.c: 48: RB7=1;
	bsf	(55/8),(55)&7
	line	49
;proga.c: 49: goto otschet;
	goto	l3961
	line	50
	
l940:	
	line	52
	
l3879:	
;proga.c: 50: }
;proga.c: 52: if (flag==1){
	movf	(_flag),w
	xorlw	01h
	skipz
	goto	u3331
	goto	u3330
u3331:
	goto	l3957
u3330:
	line	53
	
l3881:	
;proga.c: 53: flag=2;
	movlw	(02h)
	movwf	(??_Increment+0)+0
	movf	(??_Increment+0)+0,w
	movwf	(_flag)
	line	54
	
l3883:	
;proga.c: 54: RB6=0;
	bcf	(54/8),(54)&7
	line	55
	
l3885:	
;proga.c: 55: RB7=0;
	bcf	(55/8),(55)&7
	line	56
	
l3887:	
;proga.c: 56: LCDWrite(1, 0);
	movlw	low(01h)
	movwf	(?_LCDWrite)
	movlw	high(01h)
	movwf	((?_LCDWrite))+1
	movlw	low(0)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(0)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	57
	
l3889:	
;proga.c: 57: LCDWrite(' ', 1);
	movlw	low(020h)
	movwf	(?_LCDWrite)
	movlw	high(020h)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	58
	
l3891:	
;proga.c: 58: LCDWrite(' ', 1);
	movlw	low(020h)
	movwf	(?_LCDWrite)
	movlw	high(020h)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	59
	
l3893:	
;proga.c: 59: for(j=1;j<6;j++){
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_j)
	movlw	high(01h)
	movwf	((_j))+1
	
l3895:	
	movf	(_j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(06h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3345
	movlw	low(06h)
	subwf	(_j),w
u3345:

	skipc
	goto	u3341
	goto	u3340
u3341:
	goto	l3899
u3340:
	goto	l3907
	
l3897:	
	goto	l3907
	
l943:	
	line	60
	
l3899:	
;proga.c: 60: n=mas2[j];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_j),w
	addlw	_mas2&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_Increment+0)+0
	clrf	(??_Increment+0)+0+1
	movf	0+(??_Increment+0)+0,w
	movwf	(_n)
	movf	1+(??_Increment+0)+0,w
	movwf	(_n+1)
	line	61
	
l3901:	
;proga.c: 61: LCDWrite(n, 1);
	movf	(_n+1),w
	clrf	(?_LCDWrite+1)
	addwf	(?_LCDWrite+1)
	movf	(_n),w
	clrf	(?_LCDWrite)
	addwf	(?_LCDWrite)

	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	59
	
l3903:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_j),f
	skipnc
	incf	(_j+1),f
	movlw	high(01h)
	addwf	(_j+1),f
	
l3905:	
	movf	(_j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(06h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3355
	movlw	low(06h)
	subwf	(_j),w
u3355:

	skipc
	goto	u3351
	goto	u3350
u3351:
	goto	l3899
u3350:
	goto	l3907
	
l944:	
	line	63
	
l3907:	
;proga.c: 62: }
;proga.c: 63: LCDWrite(192, 0);
	movlw	low(0C0h)
	movwf	(?_LCDWrite)
	movlw	high(0C0h)
	movwf	((?_LCDWrite))+1
	movlw	low(0)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(0)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	64
;proga.c: 64: LCDWrite('>', 1);
	movlw	low(03Eh)
	movwf	(?_LCDWrite)
	movlw	high(03Eh)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	65
;proga.c: 65: LCDWrite(' ', 1);
	movlw	low(020h)
	movwf	(?_LCDWrite)
	movlw	high(020h)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	66
	
l3909:	
;proga.c: 66: for(j=1;j<6;j++){
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_j)
	movlw	high(01h)
	movwf	((_j))+1
	
l3911:	
	movf	(_j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(06h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3365
	movlw	low(06h)
	subwf	(_j),w
u3365:

	skipc
	goto	u3361
	goto	u3360
u3361:
	goto	l3915
u3360:
	goto	l3923
	
l3913:	
	goto	l3923
	
l945:	
	line	67
	
l3915:	
;proga.c: 67: n=mas3[j]+48;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_j),w
	addlw	_mas3&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	addlw	low(030h)
	movwf	(_n)
	movlw	high(030h)
	skipnc
	movlw	(high(030h)+1)&0ffh
	movwf	((_n))+1
	line	68
	
l3917:	
;proga.c: 68: LCDWrite(n, 1);
	movf	(_n+1),w
	clrf	(?_LCDWrite+1)
	addwf	(?_LCDWrite+1)
	movf	(_n),w
	clrf	(?_LCDWrite)
	addwf	(?_LCDWrite)

	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	66
	
l3919:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_j),f
	skipnc
	incf	(_j+1),f
	movlw	high(01h)
	addwf	(_j+1),f
	
l3921:	
	movf	(_j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(06h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3375
	movlw	low(06h)
	subwf	(_j),w
u3375:

	skipc
	goto	u3371
	goto	u3370
u3371:
	goto	l3915
u3370:
	goto	l3923
	
l946:	
	goto	l3923
	line	71
;proga.c: 69: }
;proga.c: 71: for(;;){
	
l947:	
	line	72
	
l3923:	
;proga.c: 72: _delay((unsigned long)((5)*(4000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_Increment+0)+0+1),f
	movlw	125
movwf	((??_Increment+0)+0),f
u4377:
	decfsz	((??_Increment+0)+0),f
	goto	u4377
	decfsz	((??_Increment+0)+0+1),f
	goto	u4377
opt asmopt_on

	line	73
	
l3925:	
;proga.c: 73: if (RA3==1){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(43/8),(43)&7
	goto	u3381
	goto	u3380
u3381:
	goto	l3937
u3380:
	line	74
	
l3927:	
;proga.c: 74: n=0;
	clrf	(_n)
	clrf	(_n+1)
	line	75
;proga.c: 75: while (RA3==1){
	goto	l3935
	
l950:	
	line	76
	
l3929:	
;proga.c: 76: if (n==100)
	movlw	064h
	xorwf	(_n),w
	iorwf	(_n+1),w
	skipz
	goto	u3391
	goto	u3390
u3391:
	goto	l3933
u3390:
	goto	l3869
	line	78
	
l3931:	
;proga.c: 77: {
;proga.c: 78: goto resume;
	goto	l3869
	line	79
	
l951:	
	line	80
	
l3933:	
;proga.c: 79: }
;proga.c: 80: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_Increment+0)+0+1),f
	movlw	151
movwf	((??_Increment+0)+0),f
u4387:
	decfsz	((??_Increment+0)+0),f
	goto	u4387
	decfsz	((??_Increment+0)+0+1),f
	goto	u4387
	nop2
opt asmopt_on

	line	81
;proga.c: 81: n++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	goto	l3935
	line	82
	
l949:	
	line	75
	
l3935:	
	btfsc	(43/8),(43)&7
	goto	u3401
	goto	u3400
u3401:
	goto	l3929
u3400:
	goto	l3937
	
l952:	
	goto	l3937
	line	82
	
l948:	
	line	85
	
l3937:	
;proga.c: 82: }}
;proga.c: 85: TRISA=0b11111011;
	movlw	(0FBh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	86
	
l3939:	
;proga.c: 86: RB4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(52/8),(52)&7
	line	87
;proga.c: 87: PORTA=0b00000100;
	movlw	(04h)
	movwf	(5)	;volatile
	line	89
;proga.c: 89: _delay((unsigned long)((5)*(4000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_Increment+0)+0+1),f
	movlw	125
movwf	((??_Increment+0)+0),f
u4397:
	decfsz	((??_Increment+0)+0),f
	goto	u4397
	decfsz	((??_Increment+0)+0+1),f
	goto	u4397
opt asmopt_on

	line	91
	
l3941:	
;proga.c: 91: if (RA3==1){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(43/8),(43)&7
	goto	u3411
	goto	u3410
u3411:
	goto	l3953
u3410:
	line	92
	
l3943:	
;proga.c: 92: n=0;
	clrf	(_n)
	clrf	(_n+1)
	line	93
;proga.c: 93: while (RA3==1){
	goto	l3951
	
l955:	
	line	94
	
l3945:	
;proga.c: 94: if (n==100)
	movlw	064h
	xorwf	(_n),w
	iorwf	(_n+1),w
	skipz
	goto	u3421
	goto	u3420
u3421:
	goto	l3949
u3420:
	goto	l970
	line	97
	
l3947:	
;proga.c: 95: {
;proga.c: 97: goto end;
	goto	l970
	line	98
	
l956:	
	line	99
	
l3949:	
;proga.c: 98: }
;proga.c: 99: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_Increment+0)+0+1),f
	movlw	151
movwf	((??_Increment+0)+0),f
u4407:
	decfsz	((??_Increment+0)+0),f
	goto	u4407
	decfsz	((??_Increment+0)+0+1),f
	goto	u4407
	nop2
opt asmopt_on

	line	100
;proga.c: 100: n++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	goto	l3951
	line	101
	
l954:	
	line	93
	
l3951:	
	btfsc	(43/8),(43)&7
	goto	u3431
	goto	u3430
u3431:
	goto	l3945
u3430:
	goto	l3953
	
l958:	
	goto	l3953
	line	101
	
l953:	
	line	103
	
l3953:	
;proga.c: 101: }}
;proga.c: 103: TRISA=0b11101111;
	movlw	(0EFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	104
	
l3955:	
;proga.c: 104: RB4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(52/8),(52)&7
	line	105
;proga.c: 105: PORTA=0b00010000;
	movlw	(010h)
	movwf	(5)	;volatile
	line	107
;proga.c: 107: }
	goto	l3923
	
l959:	
	goto	l3957
	line	108
	
l942:	
	goto	l3957
	line	109
	
l938:	
	line	110
	
l3957:	
;proga.c: 108: }
;proga.c: 109: }
;proga.c: 110: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_Increment+0)+0+1),f
	movlw	151
movwf	((??_Increment+0)+0),f
u4417:
	decfsz	((??_Increment+0)+0),f
	goto	u4417
	decfsz	((??_Increment+0)+0+1),f
	goto	u4417
	nop2
opt asmopt_on

	line	111
;proga.c: 111: n++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	goto	l3959
	line	112
	
l936:	
	line	39
	
l3959:	
	btfsc	(43/8),(43)&7
	goto	u3441
	goto	u3440
u3441:
	goto	l3867
u3440:
	goto	l3961
	
l960:	
	goto	l3961
	line	112
	
l935:	
	goto	l3961
	line	115
;proga.c: 112: }}
;proga.c: 115: otschet:;
	
l941:	
	line	116
	
l3961:	
;proga.c: 116: LCDWrite(1, 0);
	movlw	low(01h)
	movwf	(?_LCDWrite)
	movlw	high(01h)
	movwf	((?_LCDWrite))+1
	movlw	low(0)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(0)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	117
;proga.c: 117: Message2();
	fcall	_Message2
	line	118
	
l3963:	
;proga.c: 118: if ((mas3[1]||mas3[2]||mas3[4]||mas3[5])==0){goto end;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_mas3)+01h,f
	skipz
	goto	u3451
	goto	u3450
u3451:
	goto	l3973
u3450:
	
l3965:	
	movf	0+(_mas3)+02h,f
	skipz
	goto	u3461
	goto	u3460
u3461:
	goto	l3973
u3460:
	
l3967:	
	movf	0+(_mas3)+04h,f
	skipz
	goto	u3471
	goto	u3470
u3471:
	goto	l3973
u3470:
	
l3969:	
	movf	0+(_mas3)+05h,f
	skipz
	goto	u3481
	goto	u3480
u3481:
	goto	l3973
u3480:
	goto	l970
	
l3971:	
	goto	l970
	
l961:	
	line	120
	
l3973:	
;proga.c: 120: t4=mas3[5];
	movf	0+(_mas3)+05h,w
	movwf	(??_Increment+0)+0
	movf	(??_Increment+0)+0,w
	movwf	(_t4)
	line	121
;proga.c: 121: if(t4>0)
	movf	(_t4),w
	skipz
	goto	u3490
	goto	l3979
u3490:
	line	123
	
l3975:	
;proga.c: 122: {
;proga.c: 123: t4--;
	movlw	low(01h)
	subwf	(_t4),f
	line	124
	
l3977:	
;proga.c: 124: mas3[5]=t4;
	movf	(_t4),w
	movwf	(??_Increment+0)+0
	movf	(??_Increment+0)+0,w
	movwf	0+(_mas3)+05h
	line	125
;proga.c: 125: }
	goto	l3997
	line	126
	
l962:	
	line	127
	
l3979:	
;proga.c: 126: else{
;proga.c: 127: t4=9;
	movlw	(09h)
	movwf	(??_Increment+0)+0
	movf	(??_Increment+0)+0,w
	movwf	(_t4)
	line	128
;proga.c: 128: mas3[5]=t4;
	movf	(_t4),w
	movwf	(??_Increment+0)+0
	movf	(??_Increment+0)+0,w
	movwf	0+(_mas3)+05h
	line	129
;proga.c: 129: t3=mas3[4];
	movf	0+(_mas3)+04h,w
	movwf	(??_Increment+0)+0
	movf	(??_Increment+0)+0,w
	movwf	(_t3)
	line	130
;proga.c: 130: if(t3>0){
	movf	(_t3),w
	skipz
	goto	u3500
	goto	l3985
u3500:
	line	131
	
l3981:	
;proga.c: 131: t3--;
	movlw	low(01h)
	subwf	(_t3),f
	line	132
	
l3983:	
;proga.c: 132: mas3[4]=t3;
	movf	(_t3),w
	movwf	(??_Increment+0)+0
	movf	(??_Increment+0)+0,w
	movwf	0+(_mas3)+04h
	line	133
;proga.c: 133: }
	goto	l3997
	line	134
	
l964:	
	line	135
	
l3985:	
;proga.c: 134: else{
;proga.c: 135: t3=5;
	movlw	(05h)
	movwf	(??_Increment+0)+0
	movf	(??_Increment+0)+0,w
	movwf	(_t3)
	line	136
;proga.c: 136: mas3[4]=t3;
	movf	(_t3),w
	movwf	(??_Increment+0)+0
	movf	(??_Increment+0)+0,w
	movwf	0+(_mas3)+04h
	line	137
;proga.c: 137: t2=mas3[2];
	movf	0+(_mas3)+02h,w
	movwf	(??_Increment+0)+0
	movf	(??_Increment+0)+0,w
	movwf	(_t2)
	line	138
;proga.c: 138: if(t2>0){
	movf	(_t2),w
	skipz
	goto	u3510
	goto	l3991
u3510:
	line	139
	
l3987:	
;proga.c: 139: t2--;
	movlw	low(01h)
	subwf	(_t2),f
	line	140
	
l3989:	
;proga.c: 140: mas3[2]=t2;
	movf	(_t2),w
	movwf	(??_Increment+0)+0
	movf	(??_Increment+0)+0,w
	movwf	0+(_mas3)+02h
	line	141
;proga.c: 141: }
	goto	l3997
	line	142
	
l966:	
	line	143
	
l3991:	
;proga.c: 142: else{
;proga.c: 143: t2=9;
	movlw	(09h)
	movwf	(??_Increment+0)+0
	movf	(??_Increment+0)+0,w
	movwf	(_t2)
	line	144
;proga.c: 144: mas3[2]=t2;
	movf	(_t2),w
	movwf	(??_Increment+0)+0
	movf	(??_Increment+0)+0,w
	movwf	0+(_mas3)+02h
	line	145
;proga.c: 145: t1=mas3[1];
	movf	0+(_mas3)+01h,w
	movwf	(??_Increment+0)+0
	movf	(??_Increment+0)+0,w
	movwf	(_t1)
	line	146
;proga.c: 146: if(t1>0){
	movf	(_t1),w
	skipz
	goto	u3520
	goto	l3997
u3520:
	line	147
	
l3993:	
;proga.c: 147: t1--;
	movlw	low(01h)
	subwf	(_t1),f
	line	148
	
l3995:	
;proga.c: 148: mas3[1]=t1;
	movf	(_t1),w
	movwf	(??_Increment+0)+0
	movf	(??_Increment+0)+0,w
	movwf	0+(_mas3)+01h
	goto	l3997
	line	149
	
l968:	
	goto	l3997
	
l967:	
	goto	l3997
	
l965:	
	goto	l3997
	
l963:	
	line	151
	
l3997:	
;proga.c: 149: }}}}
;proga.c: 151: t1=mas3[1]+48;
	movf	0+(_mas3)+01h,w
	addlw	030h
	movwf	(??_Increment+0)+0
	movf	(??_Increment+0)+0,w
	movwf	(_t1)
	line	152
	
l3999:	
;proga.c: 152: LCDWrite(t1, 1);
	movf	(_t1),w
	movwf	(??_Increment+0)+0
	clrf	(??_Increment+0)+0+1
	movf	0+(??_Increment+0)+0,w
	movwf	(?_LCDWrite)
	movf	1+(??_Increment+0)+0,w
	movwf	(?_LCDWrite+1)
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	153
	
l4001:	
;proga.c: 153: t1=mas3[2]+48;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_mas3)+02h,w
	addlw	030h
	movwf	(??_Increment+0)+0
	movf	(??_Increment+0)+0,w
	movwf	(_t1)
	line	154
	
l4003:	
;proga.c: 154: LCDWrite(t1, 1);
	movf	(_t1),w
	movwf	(??_Increment+0)+0
	clrf	(??_Increment+0)+0+1
	movf	0+(??_Increment+0)+0,w
	movwf	(?_LCDWrite)
	movf	1+(??_Increment+0)+0,w
	movwf	(?_LCDWrite+1)
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	155
	
l4005:	
;proga.c: 155: LCDWrite('-', 1);
	movlw	low(02Dh)
	movwf	(?_LCDWrite)
	movlw	high(02Dh)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	156
	
l4007:	
;proga.c: 156: t1=mas3[4]+48;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_mas3)+04h,w
	addlw	030h
	movwf	(??_Increment+0)+0
	movf	(??_Increment+0)+0,w
	movwf	(_t1)
	line	157
	
l4009:	
;proga.c: 157: LCDWrite(t1, 1);
	movf	(_t1),w
	movwf	(??_Increment+0)+0
	clrf	(??_Increment+0)+0+1
	movf	0+(??_Increment+0)+0,w
	movwf	(?_LCDWrite)
	movf	1+(??_Increment+0)+0,w
	movwf	(?_LCDWrite+1)
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	158
	
l4011:	
;proga.c: 158: t1=mas3[5]+48;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_mas3)+05h,w
	addlw	030h
	movwf	(??_Increment+0)+0
	movf	(??_Increment+0)+0,w
	movwf	(_t1)
	line	159
	
l4013:	
;proga.c: 159: LCDWrite(t1, 1);
	movf	(_t1),w
	movwf	(??_Increment+0)+0
	clrf	(??_Increment+0)+0+1
	movf	0+(??_Increment+0)+0,w
	movwf	(?_LCDWrite)
	movf	1+(??_Increment+0)+0,w
	movwf	(?_LCDWrite+1)
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	161
	
l4015:	
;proga.c: 161: _delay((unsigned long)((150)*(4000000/4000.0)));
	opt asmopt_off
movlw	195
movwf	((??_Increment+0)+0+1),f
	movlw	205
movwf	((??_Increment+0)+0),f
u4427:
	decfsz	((??_Increment+0)+0),f
	goto	u4427
	decfsz	((??_Increment+0)+0+1),f
	goto	u4427
opt asmopt_on

	line	162
	
l4017:	
;proga.c: 162: _delay((unsigned long)((150)*(4000000/4000.0)));
	opt asmopt_off
movlw	195
movwf	((??_Increment+0)+0+1),f
	movlw	205
movwf	((??_Increment+0)+0),f
u4437:
	decfsz	((??_Increment+0)+0),f
	goto	u4437
	decfsz	((??_Increment+0)+0+1),f
	goto	u4437
opt asmopt_on

	line	163
	
l4019:	
;proga.c: 163: _delay((unsigned long)((150)*(4000000/4000.0)));
	opt asmopt_off
movlw	195
movwf	((??_Increment+0)+0+1),f
	movlw	205
movwf	((??_Increment+0)+0),f
u4447:
	decfsz	((??_Increment+0)+0),f
	goto	u4447
	decfsz	((??_Increment+0)+0+1),f
	goto	u4447
opt asmopt_on

	line	164
	
l4021:	
;proga.c: 164: _delay((unsigned long)((150)*(4000000/4000.0)));
	opt asmopt_off
movlw	195
movwf	((??_Increment+0)+0+1),f
	movlw	205
movwf	((??_Increment+0)+0),f
u4457:
	decfsz	((??_Increment+0)+0),f
	goto	u4457
	decfsz	((??_Increment+0)+0+1),f
	goto	u4457
opt asmopt_on

	line	165
	
l4023:	
;proga.c: 165: _delay((unsigned long)((150)*(4000000/4000.0)));
	opt asmopt_off
movlw	195
movwf	((??_Increment+0)+0+1),f
	movlw	205
movwf	((??_Increment+0)+0),f
u4467:
	decfsz	((??_Increment+0)+0),f
	goto	u4467
	decfsz	((??_Increment+0)+0+1),f
	goto	u4467
opt asmopt_on

	line	166
	
l4025:	
;proga.c: 166: _delay((unsigned long)((150)*(4000000/4000.0)));
	opt asmopt_off
movlw	195
movwf	((??_Increment+0)+0+1),f
	movlw	205
movwf	((??_Increment+0)+0),f
u4477:
	decfsz	((??_Increment+0)+0),f
	goto	u4477
	decfsz	((??_Increment+0)+0+1),f
	goto	u4477
opt asmopt_on

	line	167
	
l4027:	
;proga.c: 167: _delay((unsigned long)((92)*(4000000/4000.0)));
	opt asmopt_off
movlw	120
movwf	((??_Increment+0)+0+1),f
	movlw	121
movwf	((??_Increment+0)+0),f
u4487:
	decfsz	((??_Increment+0)+0),f
	goto	u4487
	decfsz	((??_Increment+0)+0+1),f
	goto	u4487
	nop2
opt asmopt_on

	line	172
;proga.c: 172: }
	goto	l934
	
l969:	
	goto	l970
	line	175
;proga.c: 175: end:;
	
l957:	
	line	177
	
l970:	
	return
	opt stack 0
GLOBAL	__end_of_Increment
	__end_of_Increment:
;; =============== function _Increment ends ============

	signat	_Increment,90
	global	_Message1
psect	text258,local,class=CODE,delta=2
global __ptext258
__ptext258:

;; *************** function _Message1 *****************
;; Defined at:
;;		line 180 in file "C:\Users\gf\Desktop\photoresist\project\proga.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  972[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_LCDWrite
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text258
	file	"C:\Users\gf\Desktop\photoresist\project\proga.c"
	line	180
	global	__size_of_Message1
	__size_of_Message1	equ	__end_of_Message1-_Message1
	
_Message1:	
	opt	stack 6
; Regs used in _Message1: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	181
	
l3857:	
;proga.c: 181: LCDWrite('T', 1);
	movlw	low(054h)
	movwf	(?_LCDWrite)
	movlw	high(054h)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	182
;proga.c: 182: LCDWrite('i', 1);
	movlw	low(069h)
	movwf	(?_LCDWrite)
	movlw	high(069h)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	183
;proga.c: 183: LCDWrite('m', 1);
	movlw	low(06Dh)
	movwf	(?_LCDWrite)
	movlw	high(06Dh)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	184
;proga.c: 184: LCDWrite('e', 1);
	movlw	low(065h)
	movwf	(?_LCDWrite)
	movlw	high(065h)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	185
;proga.c: 185: LCDWrite(':', 1);
	movlw	low(03Ah)
	movwf	(?_LCDWrite)
	movlw	high(03Ah)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	186
;proga.c: 186: LCDWrite(192, 0);
	movlw	low(0C0h)
	movwf	(?_LCDWrite)
	movlw	high(0C0h)
	movwf	((?_LCDWrite))+1
	movlw	low(0)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(0)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	187
	
l973:	
	return
	opt stack 0
GLOBAL	__end_of_Message1
	__end_of_Message1:
;; =============== function _Message1 ends ============

	signat	_Message1,90
	global	_Message2
psect	text259,local,class=CODE,delta=2
global __ptext259
__ptext259:

;; *************** function _Message2 *****************
;; Defined at:
;;		line 189 in file "C:\Users\gf\Desktop\photoresist\project\proga.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  920[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_LCDWrite
;; This function is called by:
;;		_Increment
;; This function uses a non-reentrant model
;;
psect	text259
	file	"C:\Users\gf\Desktop\photoresist\project\proga.c"
	line	189
	global	__size_of_Message2
	__size_of_Message2	equ	__end_of_Message2-_Message2
	
_Message2:	
	opt	stack 5
; Regs used in _Message2: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	190
	
l3855:	
;proga.c: 190: LCDWrite('R', 1);
	movlw	low(052h)
	movwf	(?_LCDWrite)
	movlw	high(052h)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	191
;proga.c: 191: LCDWrite('e', 1);
	movlw	low(065h)
	movwf	(?_LCDWrite)
	movlw	high(065h)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	192
;proga.c: 192: LCDWrite('m', 1);
	movlw	low(06Dh)
	movwf	(?_LCDWrite)
	movlw	high(06Dh)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	193
;proga.c: 193: LCDWrite('a', 1);
	movlw	low(061h)
	movwf	(?_LCDWrite)
	movlw	high(061h)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	194
;proga.c: 194: LCDWrite('i', 1);
	movlw	low(069h)
	movwf	(?_LCDWrite)
	movlw	high(069h)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	195
;proga.c: 195: LCDWrite('n', 1);
	movlw	low(06Eh)
	movwf	(?_LCDWrite)
	movlw	high(06Eh)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	196
;proga.c: 196: LCDWrite(':', 1);
	movlw	low(03Ah)
	movwf	(?_LCDWrite)
	movlw	high(03Ah)
	movwf	((?_LCDWrite))+1
	movlw	low(01h)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(01h)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	197
;proga.c: 197: LCDWrite(192, 0);
	movlw	low(0C0h)
	movwf	(?_LCDWrite)
	movlw	high(0C0h)
	movwf	((?_LCDWrite))+1
	movlw	low(0)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(0)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	198
	
l976:	
	return
	opt stack 0
GLOBAL	__end_of_Message2
	__end_of_Message2:
;; =============== function _Message2 ends ============

	signat	_Message2,90
	global	_Sbros
psect	text260,local,class=CODE,delta=2
global __ptext260
__ptext260:

;; *************** function _Sbros *****************
;; Defined at:
;;		line 15 in file "C:\Users\gf\Desktop\photoresist\project\proga.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  930[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_buzz2
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text260
	file	"C:\Users\gf\Desktop\photoresist\project\proga.c"
	line	15
	global	__size_of_Sbros
	__size_of_Sbros	equ	__end_of_Sbros-_Sbros
	
_Sbros:	
	opt	stack 6
; Regs used in _Sbros: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	17
	
l3845:	
;proga.c: 17: flag=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_flag)
	line	18
;proga.c: 18: RB6=0;
	bcf	(54/8),(54)&7
	line	19
;proga.c: 19: RB7=0;
	bcf	(55/8),(55)&7
	line	21
	
l3847:	
;proga.c: 21: buzz2();
	fcall	_buzz2
	line	22
;proga.c: 22: buzz2();
	fcall	_buzz2
	line	23
;proga.c: 23: buzz2();
	fcall	_buzz2
	line	25
	
l3849:	
;proga.c: 25: TRISA=0b11101111;
	movlw	(0EFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	26
	
l3851:	
;proga.c: 26: RB4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(52/8),(52)&7
	line	27
	
l3853:	
;proga.c: 27: PORTA=0b00010000;
	movlw	(010h)
	movwf	(5)	;volatile
	line	28
	
l931:	
	return
	opt stack 0
GLOBAL	__end_of_Sbros
	__end_of_Sbros:
;; =============== function _Sbros ends ============

	signat	_Sbros,90
	global	_LCDInit
psect	text261,local,class=CODE,delta=2
global __ptext261
__ptext261:

;; *************** function _LCDInit *****************
;; Defined at:
;;		line 21 in file "C:\Users\gf\Desktop\photoresist\project\lcd.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_LCDWrite
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text261
	file	"C:\Users\gf\Desktop\photoresist\project\lcd.h"
	line	21
	global	__size_of_LCDInit
	__size_of_LCDInit	equ	__end_of_LCDInit-_LCDInit
	
_LCDInit:	
	opt	stack 6
; Regs used in _LCDInit: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	22
	
l3819:	
;lcd.h: 22: _delay((unsigned long)((50)*(4000000/4000.0)));
	opt asmopt_off
movlw	65
movwf	((??_LCDInit+0)+0+1),f
	movlw	238
movwf	((??_LCDInit+0)+0),f
u4497:
	decfsz	((??_LCDInit+0)+0),f
	goto	u4497
	decfsz	((??_LCDInit+0)+0+1),f
	goto	u4497
	clrwdt
opt asmopt_on

	line	23
;lcd.h: 23: PORTC = 3;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	24
	
l3821:	
;lcd.h: 24: RC4 = 1; RC4 = 0;
	bsf	(60/8),(60)&7
	
l3823:	
	bcf	(60/8),(60)&7
	line	25
;lcd.h: 25: _delay((unsigned long)((5)*(4000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_LCDInit+0)+0+1),f
	movlw	125
movwf	((??_LCDInit+0)+0),f
u4507:
	decfsz	((??_LCDInit+0)+0),f
	goto	u4507
	decfsz	((??_LCDInit+0)+0+1),f
	goto	u4507
opt asmopt_on

	line	26
	
l3825:	
;lcd.h: 26: RC4 = 1; RC4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
	
l3827:	
	bcf	(60/8),(60)&7
	line	27
;lcd.h: 27: _delay((unsigned long)((200)*(4000000/4000000.0)));
	opt asmopt_off
movlw	66
movwf	(??_LCDInit+0)+0,f
u4517:
decfsz	(??_LCDInit+0)+0,f
	goto	u4517
	clrwdt
opt asmopt_on

	line	28
	
l3829:	
;lcd.h: 28: RC4 = 1; RC4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
	
l3831:	
	bcf	(60/8),(60)&7
	line	29
;lcd.h: 29: _delay((unsigned long)((200)*(4000000/4000000.0)));
	opt asmopt_off
movlw	66
movwf	(??_LCDInit+0)+0,f
u4527:
decfsz	(??_LCDInit+0)+0,f
	goto	u4527
	clrwdt
opt asmopt_on

	line	30
;lcd.h: 30: PORTC = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	31
	
l3833:	
;lcd.h: 31: RC4 = 1; RC4 = 0;
	bsf	(60/8),(60)&7
	
l3835:	
	bcf	(60/8),(60)&7
	line	32
;lcd.h: 32: _delay((unsigned long)((200)*(4000000/4000000.0)));
	opt asmopt_off
movlw	66
movwf	(??_LCDInit+0)+0,f
u4537:
decfsz	(??_LCDInit+0)+0,f
	goto	u4537
	clrwdt
opt asmopt_on

	line	33
	
l3837:	
;lcd.h: 33: LCDWrite(0b00101000, 0);
	movlw	low(028h)
	movwf	(?_LCDWrite)
	movlw	high(028h)
	movwf	((?_LCDWrite))+1
	movlw	low(0)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(0)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	34
	
l3839:	
;lcd.h: 34: LCDWrite(0b00000001, 0);
	movlw	low(01h)
	movwf	(?_LCDWrite)
	movlw	high(01h)
	movwf	((?_LCDWrite))+1
	movlw	low(0)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(0)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	35
	
l3841:	
;lcd.h: 35: LCDWrite(0b00000110, 0);
	movlw	low(06h)
	movwf	(?_LCDWrite)
	movlw	high(06h)
	movwf	((?_LCDWrite))+1
	movlw	low(0)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(0)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	36
	
l3843:	
;lcd.h: 36: LCDWrite(0b00001110, 0);
	movlw	low(0Eh)
	movwf	(?_LCDWrite)
	movlw	high(0Eh)
	movwf	((?_LCDWrite))+1
	movlw	low(0)
	movwf	0+(?_LCDWrite)+02h
	movlw	high(0)
	movwf	(0+(?_LCDWrite)+02h)+1
	fcall	_LCDWrite
	line	39
	
l928:	
	return
	opt stack 0
GLOBAL	__end_of_LCDInit
	__end_of_LCDInit:
;; =============== function _LCDInit ends ============

	signat	_LCDInit,88
	global	_buzz1
psect	text262,local,class=CODE,delta=2
global __ptext262
__ptext262:

;; *************** function _buzz1 *****************
;; Defined at:
;;		line 200 in file "C:\Users\gf\Desktop\photoresist\project\proga.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  918[COMMON] int 
;; Registers used:
;;		wreg, status,2, btemp+1
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Increment
;;		_main
;; This function uses a non-reentrant model
;;
psect	text262
	file	"C:\Users\gf\Desktop\photoresist\project\proga.c"
	line	200
	global	__size_of_buzz1
	__size_of_buzz1	equ	__end_of_buzz1-_buzz1
	
_buzz1:	
	opt	stack 6
; Regs used in _buzz1: [wreg+status,2+btemp+1]
	line	201
	
l3805:	
;proga.c: 201: for(q=0;q<100;q++){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_q)
	clrf	(_q+1)
	
l3807:	
	movf	(_q+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(064h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3285
	movlw	low(064h)
	subwf	(_q),w
u3285:

	skipc
	goto	u3281
	goto	u3280
u3281:
	goto	l979
u3280:
	goto	l3817
	
l3809:	
	goto	l3817
	
l979:	
	line	202
;proga.c: 202: RB5=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(53/8),(53)&7
	line	203
	
l3811:	
;proga.c: 203: _delay((unsigned long)((150)*(4000000/4000000.0)));
	opt asmopt_off
movlw	49
movwf	(??_buzz1+0)+0,f
u4547:
decfsz	(??_buzz1+0)+0,f
	goto	u4547
	nop2	;nop
opt asmopt_on

	line	204
;proga.c: 204: _delay((unsigned long)((150)*(4000000/4000000.0)));
	opt asmopt_off
movlw	49
movwf	(??_buzz1+0)+0,f
u4557:
decfsz	(??_buzz1+0)+0,f
	goto	u4557
	nop2	;nop
opt asmopt_on

	line	205
;proga.c: 205: _delay((unsigned long)((150)*(4000000/4000000.0)));
	opt asmopt_off
movlw	49
movwf	(??_buzz1+0)+0,f
u4567:
decfsz	(??_buzz1+0)+0,f
	goto	u4567
	nop2	;nop
opt asmopt_on

	line	206
;proga.c: 206: _delay((unsigned long)((50)*(4000000/4000000.0)));
	opt asmopt_off
movlw	16
movwf	(??_buzz1+0)+0,f
u4577:
decfsz	(??_buzz1+0)+0,f
	goto	u4577
	clrwdt
opt asmopt_on

	line	207
	
l3813:	
;proga.c: 207: RB5=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(53/8),(53)&7
	line	208
;proga.c: 208: _delay((unsigned long)((150)*(4000000/4000000.0)));
	opt asmopt_off
movlw	49
movwf	(??_buzz1+0)+0,f
u4587:
decfsz	(??_buzz1+0)+0,f
	goto	u4587
	nop2	;nop
opt asmopt_on

	line	209
;proga.c: 209: _delay((unsigned long)((150)*(4000000/4000000.0)));
	opt asmopt_off
movlw	49
movwf	(??_buzz1+0)+0,f
u4597:
decfsz	(??_buzz1+0)+0,f
	goto	u4597
	nop2	;nop
opt asmopt_on

	line	210
;proga.c: 210: _delay((unsigned long)((150)*(4000000/4000000.0)));
	opt asmopt_off
movlw	49
movwf	(??_buzz1+0)+0,f
u4607:
decfsz	(??_buzz1+0)+0,f
	goto	u4607
	nop2	;nop
opt asmopt_on

	line	211
;proga.c: 211: _delay((unsigned long)((50)*(4000000/4000000.0)));
	opt asmopt_off
movlw	16
movwf	(??_buzz1+0)+0,f
u4617:
decfsz	(??_buzz1+0)+0,f
	goto	u4617
	clrwdt
opt asmopt_on

	line	201
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_q),f
	skipnc
	incf	(_q+1),f
	movlw	high(01h)
	addwf	(_q+1),f
	
l3815:	
	movf	(_q+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(064h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3295
	movlw	low(064h)
	subwf	(_q),w
u3295:

	skipc
	goto	u3291
	goto	u3290
u3291:
	goto	l979
u3290:
	goto	l3817
	
l980:	
	line	213
	
l3817:	
;proga.c: 212: }
;proga.c: 213: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
movwf	((??_buzz1+0)+0+1),f
	movlw	221
movwf	((??_buzz1+0)+0),f
u4627:
	decfsz	((??_buzz1+0)+0),f
	goto	u4627
	decfsz	((??_buzz1+0)+0+1),f
	goto	u4627
	nop2
opt asmopt_on

	line	214
	
l981:	
	return
	opt stack 0
GLOBAL	__end_of_buzz1
	__end_of_buzz1:
;; =============== function _buzz1 ends ============

	signat	_buzz1,90
	global	_buzz2
psect	text263,local,class=CODE,delta=2
global __ptext263
__ptext263:

;; *************** function _buzz2 *****************
;; Defined at:
;;		line 216 in file "C:\Users\gf\Desktop\photoresist\project\proga.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  916[COMMON] int 
;; Registers used:
;;		wreg, status,2, btemp+1
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Sbros
;; This function uses a non-reentrant model
;;
psect	text263
	file	"C:\Users\gf\Desktop\photoresist\project\proga.c"
	line	216
	global	__size_of_buzz2
	__size_of_buzz2	equ	__end_of_buzz2-_buzz2
	
_buzz2:	
	opt	stack 6
; Regs used in _buzz2: [wreg+status,2+btemp+1]
	line	217
	
l3791:	
;proga.c: 217: for(q=0;q<300;q++){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_q)
	clrf	(_q+1)
	
l3793:	
	movf	(_q+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(012Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u3265
	movlw	low(012Ch)
	subwf	(_q),w
u3265:

	skipc
	goto	u3261
	goto	u3260
u3261:
	goto	l984
u3260:
	goto	l3803
	
l3795:	
	goto	l3803
	
l984:	
	line	218
;proga.c: 218: RB5=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(53/8),(53)&7
	line	219
	
l3797:	
;proga.c: 219: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_buzz2+0)+0,f
u4637:
	clrwdt
decfsz	(??_buzz2+0)+0,f
	goto	u4637
	nop2	;nop
	clrwdt
opt asmopt_on

	line	220
	
l3799:	
;proga.c: 220: RB5=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(53/8),(53)&7
	line	221
;proga.c: 221: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_buzz2+0)+0,f
u4647:
	clrwdt
decfsz	(??_buzz2+0)+0,f
	goto	u4647
	nop2	;nop
	clrwdt
opt asmopt_on

	line	217
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_q),f
	skipnc
	incf	(_q+1),f
	movlw	high(01h)
	addwf	(_q+1),f
	
l3801:	
	movf	(_q+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(012Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u3275
	movlw	low(012Ch)
	subwf	(_q),w
u3275:

	skipc
	goto	u3271
	goto	u3270
u3271:
	goto	l984
u3270:
	goto	l3803
	
l985:	
	line	223
	
l3803:	
;proga.c: 222: }
;proga.c: 223: _delay((unsigned long)((197)*(4000000/4000.0)));
	opt asmopt_off
movlw	0
movwf	((??_buzz2+0)+0+1),f
	movlw	215
movwf	((??_buzz2+0)+0),f
u4657:
	decfsz	((??_buzz2+0)+0),f
	goto	u4657
	decfsz	((??_buzz2+0)+0+1),f
	goto	u4657
opt asmopt_on

	line	224
	
l986:	
	return
	opt stack 0
GLOBAL	__end_of_buzz2
	__end_of_buzz2:
;; =============== function _buzz2 ends ============

	signat	_buzz2,90
	global	_LCDWrite
psect	text264,local,class=CODE,delta=2
global __ptext264
__ptext264:

;; *************** function _LCDWrite *****************
;; Defined at:
;;		line 4 in file "C:\Users\gf\Desktop\photoresist\project\lcd.h"
;; Parameters:    Size  Location     Type
;;  LCDData         2    0[COMMON] int 
;;  RSValue         2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         4       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_LCDInit
;;		_Increment
;;		_Message1
;;		_Message2
;;		_main
;; This function uses a non-reentrant model
;;
psect	text264
	file	"C:\Users\gf\Desktop\photoresist\project\lcd.h"
	line	4
	global	__size_of_LCDWrite
	__size_of_LCDWrite	equ	__end_of_LCDWrite-_LCDWrite
	
_LCDWrite:	
	opt	stack 5
; Regs used in _LCDWrite: [wreg+status,2+status,0+btemp+1]
	line	6
	
l3767:	
;lcd.h: 6: PORTC = (LCDData >> 4) & 0x0F;
	movf	(LCDWrite@LCDData+1),w
	movwf	(??_LCDWrite+0)+0+1
	movf	(LCDWrite@LCDData),w
	movwf	(??_LCDWrite+0)+0
	movlw	04h
	movwf	btemp+1
u3195:
	rlf	(??_LCDWrite+0)+1,w
	rrf	(??_LCDWrite+0)+1,f
	rrf	(??_LCDWrite+0)+0,f
	decfsz	btemp+1,f
	goto	u3195
	movf	0+(??_LCDWrite+0)+0,w
	andlw	0Fh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	7
	
l3769:	
;lcd.h: 7: RC5 = RSValue;
	btfsc	(LCDWrite@RSValue),0
	goto	u3201
	goto	u3200
	
u3201:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(61/8),(61)&7
	goto	u3214
u3200:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(61/8),(61)&7
u3214:
	line	8
	
l3771:	
;lcd.h: 8: RC4 = 1; RC4 = 0;
	bsf	(60/8),(60)&7
	
l3773:	
	bcf	(60/8),(60)&7
	line	10
	
l3775:	
;lcd.h: 10: PORTC = LCDData & 0x0F;
	movf	(LCDWrite@LCDData),w
	andlw	0Fh
	movwf	(7)	;volatile
	line	11
	
l3777:	
;lcd.h: 11: RC5 = RSValue;
	btfsc	(LCDWrite@RSValue),0
	goto	u3221
	goto	u3220
	
u3221:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(61/8),(61)&7
	goto	u3234
u3220:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(61/8),(61)&7
u3234:
	line	12
	
l3779:	
;lcd.h: 12: RC4 = 1; RC4 = 0;
	bsf	(60/8),(60)&7
	
l3781:	
	bcf	(60/8),(60)&7
	line	14
	
l3783:	
;lcd.h: 14: if ((0 == (LCDData & 0xFC)) && (0 == RSValue))
	movlw	low(0FCh)
	andwf	(LCDWrite@LCDData),w
	movwf	(??_LCDWrite+0)+0
	movlw	high(0FCh)
	andwf	(LCDWrite@LCDData+1),w
	movwf	1+(??_LCDWrite+0)+0
	movf	1+(??_LCDWrite+0)+0,w
	iorwf	0+(??_LCDWrite+0)+0,w
	skipz
	goto	u3241
	goto	u3240
u3241:
	goto	l3789
u3240:
	
l3785:	
	movf	((LCDWrite@RSValue+1)),w
	iorwf	((LCDWrite@RSValue)),w
	skipz
	goto	u3251
	goto	u3250
u3251:
	goto	l3789
u3250:
	line	15
	
l3787:	
;lcd.h: 15: _delay((unsigned long)((5)*(4000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_LCDWrite+0)+0+1),f
	movlw	125
movwf	((??_LCDWrite+0)+0),f
u4667:
	decfsz	((??_LCDWrite+0)+0),f
	goto	u4667
	decfsz	((??_LCDWrite+0)+0+1),f
	goto	u4667
opt asmopt_on

	goto	l925
	line	16
	
l923:	
	line	17
	
l3789:	
;lcd.h: 16: else
;lcd.h: 17: _delay((unsigned long)((200)*(4000000/4000000.0)));
	opt asmopt_off
movlw	66
movwf	(??_LCDWrite+0)+0,f
u4677:
decfsz	(??_LCDWrite+0)+0,f
	goto	u4677
	clrwdt
opt asmopt_on

	goto	l925
	
l924:	
	line	19
	
l925:	
	return
	opt stack 0
GLOBAL	__end_of_LCDWrite
	__end_of_LCDWrite:
;; =============== function _LCDWrite ends ============

	signat	_LCDWrite,8312
psect	text265,local,class=CODE,delta=2
global __ptext265
__ptext265:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
