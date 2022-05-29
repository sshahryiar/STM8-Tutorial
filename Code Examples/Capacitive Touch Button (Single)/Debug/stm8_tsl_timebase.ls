   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  48                     	bsct
  49  0000               _TSL_Tick_Base:
  50  0000 00            	dc.b	0
  51  0001               _TSL_Tick_10ms:
  52  0001 00            	dc.b	0
  53  0002               _TSL_Tick_100ms:
  54  0002 00            	dc.b	0
  55  0003               _TSL_TickCount_ECS_10ms:
  56  0003 00            	dc.b	0
  57  0004               _TSL_Tick_User1:
  58  0004 00            	dc.b	0
  59  0005               _TSL_Tick_User2:
  60  0005 00            	dc.b	0
  95                     ; 69 void TSL_Timer_Init(void)
  95                     ; 70 {
  97                     	switch	.text
  98  0000               _TSL_Timer_Init:
 102                     ; 72   TSL_Tick_100ms = 0;
 104  0000 3f02          	clr	_TSL_Tick_100ms
 105                     ; 73   TSL_Tick_10ms = 0;
 107  0002 3f01          	clr	_TSL_Tick_10ms
 108                     ; 74   TSL_Tick_Base = 0;
 110  0004 3f00          	clr	_TSL_Tick_Base
 111                     ; 75   TSL_TickCount_ECS_10ms = 0;
 113  0006 3f03          	clr	_TSL_TickCount_ECS_10ms
 114                     ; 76   TSL_Tick_Flags.whole = 0;
 116  0008 3f00          	clr	_TSL_Tick_Flags
 117                     ; 78   TIMTICK->SR1 = 0;       // clear overflow flag
 119  000a 725f5342      	clr	21314
 120                     ; 80   if (CLK->CKDIVR == 0x00)   // Max CPU freq = 16 MHz
 122  000e 725d50c6      	tnz	20678
 123  0012 2606          	jrne	L53
 124                     ; 82     TIMTICK->PSCR = 6;     // Prescaler to divide Fcpu by 64: 4 us clock.
 126  0014 35065345      	mov	21317,#6
 128  0018 2004          	jra	L73
 129  001a               L53:
 130                     ; 86     TIMTICK->PSCR = 7;     // Prescaler to divide Fcpu by 128: x.xx us clock.
 132  001a 35075345      	mov	21317,#7
 133  001e               L73:
 134                     ; 89   TIMTICK->ARR = 124;      // 125 * 4 us = 500 us.
 136  001e 357c5346      	mov	21318,#124
 137                     ; 90   TIMTICK->IER = 0x01;     // Enable interrupt
 139  0022 35015341      	mov	21313,#1
 140                     ; 91   TIMTICK->CR1 = 0x01;     // Start timer
 142  0026 35015340      	mov	21312,#1
 143                     ; 93 }
 146  002a 81            	ret
 172                     ; 106 void TSL_Timer_Check_1sec_Tick(void)
 172                     ; 107 {
 173                     	switch	.text
 174  002b               _TSL_Timer_Check_1sec_Tick:
 178                     ; 108   if (TSL_Tick_100ms >= 10)
 180  002b b602          	ld	a,_TSL_Tick_100ms
 181  002d a10a          	cp	a,#10
 182  002f 250a          	jrult	L15
 183                     ; 110     TSL_Tick_100ms -= 10;
 185  0031 b602          	ld	a,_TSL_Tick_100ms
 186  0033 a00a          	sub	a,#10
 187  0035 b702          	ld	_TSL_Tick_100ms,a
 188                     ; 111     TSL_Tick_Flags.b.DTO_1sec = 1;  // Tick Flag for Max On Duration set every second.
 190  0037 72100000      	bset	_TSL_Tick_Flags,#0
 191  003b               L15:
 192                     ; 113 }
 195  003b 81            	ret
 222                     ; 126 void TSL_Timer_Check_100ms_Tick(void)
 222                     ; 127 {
 223                     	switch	.text
 224  003c               _TSL_Timer_Check_100ms_Tick:
 228                     ; 128   if (TSL_Tick_10ms >= 10)
 230  003c b601          	ld	a,_TSL_Tick_10ms
 231  003e a10a          	cp	a,#10
 232  0040 250a          	jrult	L36
 233                     ; 130     TSL_Tick_10ms -= 10;
 235  0042 b601          	ld	a,_TSL_Tick_10ms
 236  0044 a00a          	sub	a,#10
 237  0046 b701          	ld	_TSL_Tick_10ms,a
 238                     ; 131     TSL_Tick_100ms++;
 240  0048 3c02          	inc	_TSL_Tick_100ms
 241                     ; 132     TSL_Timer_Check_1sec_Tick();
 243  004a addf          	call	_TSL_Timer_Check_1sec_Tick
 245  004c               L36:
 246                     ; 134 }
 249  004c 81            	ret
 277                     ; 147 void TSL_Timer_Check_10ms_Tick(void)
 277                     ; 148 {
 278                     	switch	.text
 279  004d               _TSL_Timer_Check_10ms_Tick:
 283                     ; 149   if (TSL_Tick_Base >= TICK_FACTOR_10MS)
 285  004d b600          	ld	a,_TSL_Tick_Base
 286  004f a114          	cp	a,#20
 287  0051 250c          	jrult	L57
 288                     ; 151     TSL_Tick_Base -= TICK_FACTOR_10MS;
 290  0053 b600          	ld	a,_TSL_Tick_Base
 291  0055 a014          	sub	a,#20
 292  0057 b700          	ld	_TSL_Tick_Base,a
 293                     ; 152     TSL_Tick_10ms++;
 295  0059 3c01          	inc	_TSL_Tick_10ms
 296                     ; 153     TSL_TickCount_ECS_10ms++;   // Tick Flag for Drift increment every 10 ms.
 298  005b 3c03          	inc	_TSL_TickCount_ECS_10ms
 299                     ; 154     TSL_Timer_Check_100ms_Tick();
 301  005d addd          	call	_TSL_Timer_Check_100ms_Tick
 303  005f               L57:
 304                     ; 156 }
 307  005f 81            	ret
 335                     ; 175 INTERRUPT_HANDLER(TSL_Timer_ISR, 23)
 335                     ; 176 #endif
 335                     ; 177 {
 337                     	switch	.text
 338  0060               f_TSL_Timer_ISR:
 340  0060 8a            	push	cc
 341  0061 84            	pop	a
 342  0062 a4bf          	and	a,#191
 343  0064 88            	push	a
 344  0065 86            	pop	cc
 345  0066 3b0002        	push	c_x+2
 346  0069 be00          	ldw	x,c_x
 347  006b 89            	pushw	x
 348  006c 3b0002        	push	c_y+2
 349  006f be00          	ldw	x,c_y
 350  0071 89            	pushw	x
 353                     ; 179   TIMTICK->SR1 = 0;      // clear overflow flag
 355  0072 725f5342      	clr	21314
 356                     ; 181   TSL_Tick_Base++;
 358  0076 3c00          	inc	_TSL_Tick_Base
 359                     ; 182   TSL_Timer_Check_10ms_Tick();
 361  0078 add3          	call	_TSL_Timer_Check_10ms_Tick
 363                     ; 184   if (TSL_Tick_Flags.b.User1_Start_100ms) /* Application request */
 365  007a b600          	ld	a,_TSL_Tick_Flags
 366  007c a502          	bcp	a,#2
 367  007e 270c          	jreq	L701
 368                     ; 186     TSL_Tick_Flags.b.User1_Start_100ms = 0;
 370  0080 72130000      	bres	_TSL_Tick_Flags,#1
 371                     ; 187     TSL_Tick_Flags.b.User1_Flag_100ms = 0;
 373  0084 72150000      	bres	_TSL_Tick_Flags,#2
 374                     ; 188     TSL_Tick_User1 = (TICK_FACTOR_10MS * 10);
 376  0088 35c80004      	mov	_TSL_Tick_User1,#200
 377  008c               L701:
 378                     ; 191   if (TSL_Tick_Flags.b.User2_Start_100ms) /* Application request */
 380  008c b600          	ld	a,_TSL_Tick_Flags
 381  008e a508          	bcp	a,#8
 382  0090 270c          	jreq	L111
 383                     ; 193     TSL_Tick_Flags.b.User2_Start_100ms = 0;
 385  0092 72170000      	bres	_TSL_Tick_Flags,#3
 386                     ; 194     TSL_Tick_Flags.b.User2_Flag_100ms = 0;
 388  0096 72190000      	bres	_TSL_Tick_Flags,#4
 389                     ; 195     TSL_Tick_User2 = (TICK_FACTOR_10MS * 10);
 391  009a 35c80005      	mov	_TSL_Tick_User2,#200
 392  009e               L111:
 393                     ; 198   if (TSL_Tick_User1 > 0)
 395  009e 3d04          	tnz	_TSL_Tick_User1
 396  00a0 270a          	jreq	L311
 397                     ; 200     TSL_Tick_User1--;
 399  00a2 3a04          	dec	_TSL_Tick_User1
 400                     ; 201     if (TSL_Tick_User1 == 0)
 402  00a4 3d04          	tnz	_TSL_Tick_User1
 403  00a6 2604          	jrne	L311
 404                     ; 203       TSL_Tick_Flags.b.User1_Flag_100ms = 1; /* Give information to Application */
 406  00a8 72140000      	bset	_TSL_Tick_Flags,#2
 407  00ac               L311:
 408                     ; 207   if (TSL_Tick_User2 > 0)
 410  00ac 3d05          	tnz	_TSL_Tick_User2
 411  00ae 270a          	jreq	L711
 412                     ; 209     TSL_Tick_User2--;
 414  00b0 3a05          	dec	_TSL_Tick_User2
 415                     ; 210     if (TSL_Tick_User2 == 0)
 417  00b2 3d05          	tnz	_TSL_Tick_User2
 418  00b4 2604          	jrne	L711
 419                     ; 212       TSL_Tick_Flags.b.User2_Flag_100ms = 1; /* Give information to Application */
 421  00b6 72180000      	bset	_TSL_Tick_Flags,#4
 422  00ba               L711:
 423                     ; 218 }
 426  00ba 85            	popw	x
 427  00bb bf00          	ldw	c_y,x
 428  00bd 320002        	pop	c_y+2
 429  00c0 85            	popw	x
 430  00c1 bf00          	ldw	c_x,x
 431  00c3 320002        	pop	c_x+2
 432  00c6 80            	iret
 469                     ; 231 void TSL_Timer_Adjust(u16 Delay)
 469                     ; 232 {
 471                     	switch	.text
 472  00c7               _TSL_Timer_Adjust:
 474  00c7 89            	pushw	x
 475       00000000      OFST:	set	0
 478                     ; 234   disableInterrupts();
 481  00c8 9b            sim
 483  00c9               L141:
 484                     ; 238     if (Delay > TICK_FACTOR_10MS) /* delay > 10ms */
 486  00c9 1e01          	ldw	x,(OFST+1,sp)
 487  00cb a30015        	cpw	x,#21
 488  00ce 2512          	jrult	L741
 489                     ; 240       TSL_Tick_Base += TICK_FACTOR_10MS;
 491  00d0 b600          	ld	a,_TSL_Tick_Base
 492  00d2 ab14          	add	a,#20
 493  00d4 b700          	ld	_TSL_Tick_Base,a
 494                     ; 241       Delay -= TICK_FACTOR_10MS;
 496  00d6 1e01          	ldw	x,(OFST+1,sp)
 497  00d8 1d0014        	subw	x,#20
 498  00db 1f01          	ldw	(OFST+1,sp),x
 499                     ; 242       TSL_Timer_Check_10ms_Tick();
 501  00dd cd004d        	call	_TSL_Timer_Check_10ms_Tick
 504  00e0 200c          	jra	L341
 505  00e2               L741:
 506                     ; 246       TSL_Tick_Base++;
 508  00e2 3c00          	inc	_TSL_Tick_Base
 509                     ; 247       Delay--;
 511  00e4 1e01          	ldw	x,(OFST+1,sp)
 512  00e6 1d0001        	subw	x,#1
 513  00e9 1f01          	ldw	(OFST+1,sp),x
 514                     ; 248       TSL_Timer_Check_10ms_Tick();
 516  00eb cd004d        	call	_TSL_Timer_Check_10ms_Tick
 518  00ee               L341:
 519                     ; 251   while (Delay);
 521  00ee 1e01          	ldw	x,(OFST+1,sp)
 522  00f0 26d7          	jrne	L141
 523                     ; 253   enableInterrupts();
 526  00f2 9a            rim
 528                     ; 255 }
 532  00f3 85            	popw	x
 533  00f4 81            	ret
 724                     	xdef	_TSL_Tick_User2
 725                     	xdef	_TSL_Tick_User1
 726                     	xdef	_TSL_Timer_Check_10ms_Tick
 727                     	xdef	_TSL_Timer_Check_100ms_Tick
 728                     	xdef	_TSL_Timer_Check_1sec_Tick
 729                     	xdef	_TSL_Timer_Adjust
 730                     	xdef	_TSL_Timer_Init
 731                     	xdef	f_TSL_Timer_ISR
 732                     	switch	.ubsct
 733  0000               _TSL_Tick_Flags:
 734  0000 00            	ds.b	1
 735                     	xdef	_TSL_Tick_Flags
 736                     	xdef	_TSL_TickCount_ECS_10ms
 737                     	xdef	_TSL_Tick_100ms
 738                     	xdef	_TSL_Tick_10ms
 739                     	xdef	_TSL_Tick_Base
 740                     	xref.b	c_x
 741                     	xref.b	c_y
 761                     	end
