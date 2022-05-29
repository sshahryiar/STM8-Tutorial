   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  14                     .const:	section	.text
  15  0000               _APR_Array:
  16  0000 00            	dc.b	0
  17  0001 1e            	dc.b	30
  18  0002 1e            	dc.b	30
  19  0003 1e            	dc.b	30
  20  0004 1e            	dc.b	30
  21  0005 1e            	dc.b	30
  22  0006 1e            	dc.b	30
  23  0007 1e            	dc.b	30
  24  0008 1e            	dc.b	30
  25  0009 1e            	dc.b	30
  26  000a 1e            	dc.b	30
  27  000b 1e            	dc.b	30
  28  000c 1e            	dc.b	30
  29  000d 3d            	dc.b	61
  30  000e 17            	dc.b	23
  31  000f 17            	dc.b	23
  32  0010 3e            	dc.b	62
  33  0011               _TBR_Array:
  34  0011 00            	dc.b	0
  35  0012 01            	dc.b	1
  36  0013 02            	dc.b	2
  37  0014 03            	dc.b	3
  38  0015 04            	dc.b	4
  39  0016 05            	dc.b	5
  40  0017 06            	dc.b	6
  41  0018 07            	dc.b	7
  42  0019 08            	dc.b	8
  43  001a 09            	dc.b	9
  44  001b 0a            	dc.b	10
  45  001c 0b            	dc.b	11
  46  001d 0c            	dc.b	12
  47  001e 0c            	dc.b	12
  48  001f 0e            	dc.b	14
  49  0020 0f            	dc.b	15
  50  0021 0f            	dc.b	15
  79                     ; 73 void AWU_DeInit(void)
  79                     ; 74 {
  81                     	switch	.text
  82  0000               _AWU_DeInit:
  86                     ; 75   AWU->CSR = AWU_CSR_RESET_VALUE;
  88  0000 725f50f0      	clr	20720
  89                     ; 76   AWU->APR = AWU_APR_RESET_VALUE;
  91  0004 353f50f1      	mov	20721,#63
  92                     ; 77   AWU->TBR = AWU_TBR_RESET_VALUE;
  94  0008 725f50f2      	clr	20722
  95                     ; 78 }
  98  000c 81            	ret
 260                     ; 88 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 260                     ; 89 {
 261                     	switch	.text
 262  000d               _AWU_Init:
 264  000d 88            	push	a
 265       00000000      OFST:	set	0
 268                     ; 91   assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
 270                     ; 94   AWU->CSR |= AWU_CSR_AWUEN;
 272  000e 721850f0      	bset	20720,#4
 273                     ; 97   AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 275  0012 c650f2        	ld	a,20722
 276  0015 a4f0          	and	a,#240
 277  0017 c750f2        	ld	20722,a
 278                     ; 98   AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 280  001a 7b01          	ld	a,(OFST+1,sp)
 281  001c 5f            	clrw	x
 282  001d 97            	ld	xl,a
 283  001e c650f2        	ld	a,20722
 284  0021 da0011        	or	a,(_TBR_Array,x)
 285  0024 c750f2        	ld	20722,a
 286                     ; 101   AWU->APR &= (uint8_t)(~AWU_APR_APR);
 288  0027 c650f1        	ld	a,20721
 289  002a a4c0          	and	a,#192
 290  002c c750f1        	ld	20721,a
 291                     ; 102   AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 293  002f 7b01          	ld	a,(OFST+1,sp)
 294  0031 5f            	clrw	x
 295  0032 97            	ld	xl,a
 296  0033 c650f1        	ld	a,20721
 297  0036 da0000        	or	a,(_APR_Array,x)
 298  0039 c750f1        	ld	20721,a
 299                     ; 103 }
 302  003c 84            	pop	a
 303  003d 81            	ret
 358                     ; 112 void AWU_Cmd(FunctionalState NewState)
 358                     ; 113 {
 359                     	switch	.text
 360  003e               _AWU_Cmd:
 364                     ; 114   if (NewState != DISABLE)
 366  003e 4d            	tnz	a
 367  003f 2706          	jreq	L331
 368                     ; 117     AWU->CSR |= AWU_CSR_AWUEN;
 370  0041 721850f0      	bset	20720,#4
 372  0045 2004          	jra	L531
 373  0047               L331:
 374                     ; 122     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 376  0047 721950f0      	bres	20720,#4
 377  004b               L531:
 378                     ; 124 }
 381  004b 81            	ret
 434                     	switch	.const
 435  0022               L41:
 436  0022 000003e8      	dc.l	1000
 437                     ; 139 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 437                     ; 140 {
 438                     	switch	.text
 439  004c               _AWU_LSICalibrationConfig:
 441  004c 5206          	subw	sp,#6
 442       00000006      OFST:	set	6
 445                     ; 141   uint16_t lsifreqkhz = 0x0;
 447                     ; 142   uint16_t A = 0x0;
 449                     ; 145   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 451                     ; 147   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 453  004e 96            	ldw	x,sp
 454  004f 1c0009        	addw	x,#OFST+3
 455  0052 cd0000        	call	c_ltor
 457  0055 ae0022        	ldw	x,#L41
 458  0058 cd0000        	call	c_ludv
 460  005b be02          	ldw	x,c_lreg+2
 461  005d 1f03          	ldw	(OFST-3,sp),x
 463                     ; 151   A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 465  005f 1e03          	ldw	x,(OFST-3,sp)
 466  0061 54            	srlw	x
 467  0062 54            	srlw	x
 468  0063 1f05          	ldw	(OFST-1,sp),x
 470                     ; 153   if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 472  0065 1e05          	ldw	x,(OFST-1,sp)
 473  0067 58            	sllw	x
 474  0068 58            	sllw	x
 475  0069 1f01          	ldw	(OFST-5,sp),x
 477  006b 1e03          	ldw	x,(OFST-3,sp)
 478  006d 72f001        	subw	x,(OFST-5,sp)
 479  0070 1605          	ldw	y,(OFST-1,sp)
 480  0072 9058          	sllw	y
 481  0074 905c          	incw	y
 482  0076 cd0000        	call	c_imul
 484  0079 1605          	ldw	y,(OFST-1,sp)
 485  007b 9058          	sllw	y
 486  007d 9058          	sllw	y
 487  007f bf00          	ldw	c_x,x
 488  0081 90b300        	cpw	y,c_x
 489  0084 2509          	jrult	L561
 490                     ; 155     AWU->APR = (uint8_t)(A - 2U);
 492  0086 7b06          	ld	a,(OFST+0,sp)
 493  0088 a002          	sub	a,#2
 494  008a c750f1        	ld	20721,a
 496  008d 2006          	jra	L761
 497  008f               L561:
 498                     ; 159     AWU->APR = (uint8_t)(A - 1U);
 500  008f 7b06          	ld	a,(OFST+0,sp)
 501  0091 4a            	dec	a
 502  0092 c750f1        	ld	20721,a
 503  0095               L761:
 504                     ; 161 }
 507  0095 5b06          	addw	sp,#6
 508  0097 81            	ret
 531                     ; 168 void AWU_IdleModeEnable(void)
 531                     ; 169 {
 532                     	switch	.text
 533  0098               _AWU_IdleModeEnable:
 537                     ; 171   AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 539  0098 721950f0      	bres	20720,#4
 540                     ; 174   AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 542  009c 35f050f2      	mov	20722,#240
 543                     ; 175 }
 546  00a0 81            	ret
 590                     ; 183 FlagStatus AWU_GetFlagStatus(void)
 590                     ; 184 {
 591                     	switch	.text
 592  00a1               _AWU_GetFlagStatus:
 596                     ; 185   return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 598  00a1 c650f0        	ld	a,20720
 599  00a4 a520          	bcp	a,#32
 600  00a6 2603          	jrne	L22
 601  00a8 4f            	clr	a
 602  00a9 2002          	jra	L42
 603  00ab               L22:
 604  00ab a601          	ld	a,#1
 605  00ad               L42:
 608  00ad 81            	ret
 643                     	xdef	_TBR_Array
 644                     	xdef	_APR_Array
 645                     	xdef	_AWU_GetFlagStatus
 646                     	xdef	_AWU_IdleModeEnable
 647                     	xdef	_AWU_LSICalibrationConfig
 648                     	xdef	_AWU_Cmd
 649                     	xdef	_AWU_Init
 650                     	xdef	_AWU_DeInit
 651                     	xref.b	c_lreg
 652                     	xref.b	c_x
 671                     	xref	c_imul
 672                     	xref	c_ludv
 673                     	xref	c_ltor
 674                     	end
