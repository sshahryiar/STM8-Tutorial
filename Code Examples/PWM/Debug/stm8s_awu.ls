   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  15                     .const:	section	.text
  16  0000               _APR_Array:
  17  0000 00            	dc.b	0
  18  0001 1e            	dc.b	30
  19  0002 1e            	dc.b	30
  20  0003 1e            	dc.b	30
  21  0004 1e            	dc.b	30
  22  0005 1e            	dc.b	30
  23  0006 1e            	dc.b	30
  24  0007 1e            	dc.b	30
  25  0008 1e            	dc.b	30
  26  0009 1e            	dc.b	30
  27  000a 1e            	dc.b	30
  28  000b 1e            	dc.b	30
  29  000c 1e            	dc.b	30
  30  000d 3d            	dc.b	61
  31  000e 17            	dc.b	23
  32  000f 17            	dc.b	23
  33  0010 3e            	dc.b	62
  34  0011               _TBR_Array:
  35  0011 00            	dc.b	0
  36  0012 01            	dc.b	1
  37  0013 02            	dc.b	2
  38  0014 03            	dc.b	3
  39  0015 04            	dc.b	4
  40  0016 05            	dc.b	5
  41  0017 06            	dc.b	6
  42  0018 07            	dc.b	7
  43  0019 08            	dc.b	8
  44  001a 09            	dc.b	9
  45  001b 0a            	dc.b	10
  46  001c 0b            	dc.b	11
  47  001d 0c            	dc.b	12
  48  001e 0c            	dc.b	12
  49  001f 0e            	dc.b	14
  50  0020 0f            	dc.b	15
  51  0021 0f            	dc.b	15
  80                     ; 73 void AWU_DeInit(void)
  80                     ; 74 {
  82                     	switch	.text
  83  0000               _AWU_DeInit:
  87                     ; 75   AWU->CSR = AWU_CSR_RESET_VALUE;
  89  0000 725f50f0      	clr	20720
  90                     ; 76   AWU->APR = AWU_APR_RESET_VALUE;
  92  0004 353f50f1      	mov	20721,#63
  93                     ; 77   AWU->TBR = AWU_TBR_RESET_VALUE;
  95  0008 725f50f2      	clr	20722
  96                     ; 78 }
  99  000c 81            	ret
 261                     ; 88 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 261                     ; 89 {
 262                     	switch	.text
 263  000d               _AWU_Init:
 265  000d 88            	push	a
 266       00000000      OFST:	set	0
 269                     ; 91   assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
 271                     ; 94   AWU->CSR |= AWU_CSR_AWUEN;
 273  000e 721850f0      	bset	20720,#4
 274                     ; 97   AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 276  0012 c650f2        	ld	a,20722
 277  0015 a4f0          	and	a,#240
 278  0017 c750f2        	ld	20722,a
 279                     ; 98   AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 281  001a 7b01          	ld	a,(OFST+1,sp)
 282  001c 5f            	clrw	x
 283  001d 97            	ld	xl,a
 284  001e c650f2        	ld	a,20722
 285  0021 da0011        	or	a,(_TBR_Array,x)
 286  0024 c750f2        	ld	20722,a
 287                     ; 101   AWU->APR &= (uint8_t)(~AWU_APR_APR);
 289  0027 c650f1        	ld	a,20721
 290  002a a4c0          	and	a,#192
 291  002c c750f1        	ld	20721,a
 292                     ; 102   AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 294  002f 7b01          	ld	a,(OFST+1,sp)
 295  0031 5f            	clrw	x
 296  0032 97            	ld	xl,a
 297  0033 c650f1        	ld	a,20721
 298  0036 da0000        	or	a,(_APR_Array,x)
 299  0039 c750f1        	ld	20721,a
 300                     ; 103 }
 303  003c 84            	pop	a
 304  003d 81            	ret
 359                     ; 112 void AWU_Cmd(FunctionalState NewState)
 359                     ; 113 {
 360                     	switch	.text
 361  003e               _AWU_Cmd:
 365                     ; 114   if (NewState != DISABLE)
 367  003e 4d            	tnz	a
 368  003f 2706          	jreq	L331
 369                     ; 117     AWU->CSR |= AWU_CSR_AWUEN;
 371  0041 721850f0      	bset	20720,#4
 373  0045 2004          	jra	L531
 374  0047               L331:
 375                     ; 122     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 377  0047 721950f0      	bres	20720,#4
 378  004b               L531:
 379                     ; 124 }
 382  004b 81            	ret
 435                     	switch	.const
 436  0022               L41:
 437  0022 000003e8      	dc.l	1000
 438                     ; 139 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 438                     ; 140 {
 439                     	switch	.text
 440  004c               _AWU_LSICalibrationConfig:
 442  004c 5206          	subw	sp,#6
 443       00000006      OFST:	set	6
 446                     ; 141   uint16_t lsifreqkhz = 0x0;
 448                     ; 142   uint16_t A = 0x0;
 450                     ; 145   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 452                     ; 147   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 454  004e 96            	ldw	x,sp
 455  004f 1c0009        	addw	x,#OFST+3
 456  0052 cd0000        	call	c_ltor
 458  0055 ae0022        	ldw	x,#L41
 459  0058 cd0000        	call	c_ludv
 461  005b be02          	ldw	x,c_lreg+2
 462  005d 1f03          	ldw	(OFST-3,sp),x
 464                     ; 151   A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 466  005f 1e03          	ldw	x,(OFST-3,sp)
 467  0061 54            	srlw	x
 468  0062 54            	srlw	x
 469  0063 1f05          	ldw	(OFST-1,sp),x
 471                     ; 153   if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 473  0065 1e05          	ldw	x,(OFST-1,sp)
 474  0067 58            	sllw	x
 475  0068 58            	sllw	x
 476  0069 1f01          	ldw	(OFST-5,sp),x
 478  006b 1e03          	ldw	x,(OFST-3,sp)
 479  006d 72f001        	subw	x,(OFST-5,sp)
 480  0070 1605          	ldw	y,(OFST-1,sp)
 481  0072 9058          	sllw	y
 482  0074 905c          	incw	y
 483  0076 cd0000        	call	c_imul
 485  0079 1605          	ldw	y,(OFST-1,sp)
 486  007b 9058          	sllw	y
 487  007d 9058          	sllw	y
 488  007f bf00          	ldw	c_x,x
 489  0081 90b300        	cpw	y,c_x
 490  0084 2509          	jrult	L561
 491                     ; 155     AWU->APR = (uint8_t)(A - 2U);
 493  0086 7b06          	ld	a,(OFST+0,sp)
 494  0088 a002          	sub	a,#2
 495  008a c750f1        	ld	20721,a
 497  008d 2006          	jra	L761
 498  008f               L561:
 499                     ; 159     AWU->APR = (uint8_t)(A - 1U);
 501  008f 7b06          	ld	a,(OFST+0,sp)
 502  0091 4a            	dec	a
 503  0092 c750f1        	ld	20721,a
 504  0095               L761:
 505                     ; 161 }
 508  0095 5b06          	addw	sp,#6
 509  0097 81            	ret
 532                     ; 168 void AWU_IdleModeEnable(void)
 532                     ; 169 {
 533                     	switch	.text
 534  0098               _AWU_IdleModeEnable:
 538                     ; 171   AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 540  0098 721950f0      	bres	20720,#4
 541                     ; 174   AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 543  009c 35f050f2      	mov	20722,#240
 544                     ; 175 }
 547  00a0 81            	ret
 591                     ; 183 FlagStatus AWU_GetFlagStatus(void)
 591                     ; 184 {
 592                     	switch	.text
 593  00a1               _AWU_GetFlagStatus:
 597                     ; 185   return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 599  00a1 c650f0        	ld	a,20720
 600  00a4 a520          	bcp	a,#32
 601  00a6 2603          	jrne	L22
 602  00a8 4f            	clr	a
 603  00a9 2002          	jra	L42
 604  00ab               L22:
 605  00ab a601          	ld	a,#1
 606  00ad               L42:
 609  00ad 81            	ret
 644                     	xdef	_TBR_Array
 645                     	xdef	_APR_Array
 646                     	xdef	_AWU_GetFlagStatus
 647                     	xdef	_AWU_IdleModeEnable
 648                     	xdef	_AWU_LSICalibrationConfig
 649                     	xdef	_AWU_Cmd
 650                     	xdef	_AWU_Init
 651                     	xdef	_AWU_DeInit
 652                     	xref.b	c_lreg
 653                     	xref.b	c_x
 672                     	xref	c_imul
 673                     	xref	c_ludv
 674                     	xref	c_ltor
 675                     	end
