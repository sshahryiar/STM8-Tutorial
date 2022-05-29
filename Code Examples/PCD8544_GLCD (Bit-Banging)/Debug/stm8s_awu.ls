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
  80                     	switch	.text
  81  0000               f_AWU_DeInit:
  85                     ; 75   AWU->CSR = AWU_CSR_RESET_VALUE;
  87  0000 725f50f0      	clr	20720
  88                     ; 76   AWU->APR = AWU_APR_RESET_VALUE;
  90  0004 353f50f1      	mov	20721,#63
  91                     ; 77   AWU->TBR = AWU_TBR_RESET_VALUE;
  93  0008 725f50f2      	clr	20722
  94                     ; 78 }
  97  000c 87            	retf
 258                     ; 88 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 258                     ; 89 {
 259                     	switch	.text
 260  000d               f_AWU_Init:
 262  000d 88            	push	a
 263       00000000      OFST:	set	0
 266                     ; 91   assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
 268                     ; 94   AWU->CSR |= AWU_CSR_AWUEN;
 270  000e 721850f0      	bset	20720,#4
 271                     ; 97   AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 273  0012 c650f2        	ld	a,20722
 274  0015 a4f0          	and	a,#240
 275  0017 c750f2        	ld	20722,a
 276                     ; 98   AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 278  001a 7b01          	ld	a,(OFST+1,sp)
 279  001c 5f            	clrw	x
 280  001d 97            	ld	xl,a
 281  001e c650f2        	ld	a,20722
 282  0021 da0011        	or	a,(_TBR_Array,x)
 283  0024 c750f2        	ld	20722,a
 284                     ; 101   AWU->APR &= (uint8_t)(~AWU_APR_APR);
 286  0027 c650f1        	ld	a,20721
 287  002a a4c0          	and	a,#192
 288  002c c750f1        	ld	20721,a
 289                     ; 102   AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 291  002f 7b01          	ld	a,(OFST+1,sp)
 292  0031 5f            	clrw	x
 293  0032 97            	ld	xl,a
 294  0033 c650f1        	ld	a,20721
 295  0036 da0000        	or	a,(_APR_Array,x)
 296  0039 c750f1        	ld	20721,a
 297                     ; 103 }
 300  003c 84            	pop	a
 301  003d 87            	retf
 355                     ; 112 void AWU_Cmd(FunctionalState NewState)
 355                     ; 113 {
 356                     	switch	.text
 357  003e               f_AWU_Cmd:
 361                     ; 114   if (NewState != DISABLE)
 363  003e 4d            	tnz	a
 364  003f 2706          	jreq	L331
 365                     ; 117     AWU->CSR |= AWU_CSR_AWUEN;
 367  0041 721850f0      	bset	20720,#4
 369  0045 2004          	jra	L531
 370  0047               L331:
 371                     ; 122     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 373  0047 721950f0      	bres	20720,#4
 374  004b               L531:
 375                     ; 124 }
 378  004b 87            	retf
 424                     	switch	.const
 425  0022               L41:
 426  0022 000003e8      	dc.l	1000
 427                     ; 139 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 427                     ; 140 {
 428                     	switch	.text
 429  004c               f_AWU_LSICalibrationConfig:
 431  004c 5206          	subw	sp,#6
 432       00000006      OFST:	set	6
 435                     ; 141   uint16_t lsifreqkhz = 0x0;
 437                     ; 142   uint16_t A = 0x0;
 439                     ; 145   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 441                     ; 147   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 443  004e 96            	ldw	x,sp
 444  004f 1c000a        	addw	x,#OFST+4
 445  0052 8d000000      	callf	d_ltor
 447  0056 ae0022        	ldw	x,#L41
 448  0059 8d000000      	callf	d_ludv
 450  005d be02          	ldw	x,c_lreg+2
 451  005f 1f03          	ldw	(OFST-3,sp),x
 453                     ; 151   A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 455  0061 1e03          	ldw	x,(OFST-3,sp)
 456  0063 54            	srlw	x
 457  0064 54            	srlw	x
 458  0065 1f05          	ldw	(OFST-1,sp),x
 460                     ; 153   if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 462  0067 1e05          	ldw	x,(OFST-1,sp)
 463  0069 58            	sllw	x
 464  006a 58            	sllw	x
 465  006b 1f01          	ldw	(OFST-5,sp),x
 467  006d 1e03          	ldw	x,(OFST-3,sp)
 468  006f 72f001        	subw	x,(OFST-5,sp)
 469  0072 1605          	ldw	y,(OFST-1,sp)
 470  0074 9058          	sllw	y
 471  0076 905c          	incw	y
 472  0078 8d000000      	callf	d_imul
 474  007c 1605          	ldw	y,(OFST-1,sp)
 475  007e 9058          	sllw	y
 476  0080 9058          	sllw	y
 477  0082 bf00          	ldw	c_x,x
 478  0084 90b300        	cpw	y,c_x
 479  0087 2509          	jrult	L751
 480                     ; 155     AWU->APR = (uint8_t)(A - 2U);
 482  0089 7b06          	ld	a,(OFST+0,sp)
 483  008b a002          	sub	a,#2
 484  008d c750f1        	ld	20721,a
 486  0090 2006          	jra	L161
 487  0092               L751:
 488                     ; 159     AWU->APR = (uint8_t)(A - 1U);
 490  0092 7b06          	ld	a,(OFST+0,sp)
 491  0094 4a            	dec	a
 492  0095 c750f1        	ld	20721,a
 493  0098               L161:
 494                     ; 161 }
 497  0098 5b06          	addw	sp,#6
 498  009a 87            	retf
 520                     ; 168 void AWU_IdleModeEnable(void)
 520                     ; 169 {
 521                     	switch	.text
 522  009b               f_AWU_IdleModeEnable:
 526                     ; 171   AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 528  009b 721950f0      	bres	20720,#4
 529                     ; 174   AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 531  009f 35f050f2      	mov	20722,#240
 532                     ; 175 }
 535  00a3 87            	retf
 578                     ; 183 FlagStatus AWU_GetFlagStatus(void)
 578                     ; 184 {
 579                     	switch	.text
 580  00a4               f_AWU_GetFlagStatus:
 584                     ; 185   return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 586  00a4 c650f0        	ld	a,20720
 587  00a7 a520          	bcp	a,#32
 588  00a9 2603          	jrne	L22
 589  00ab 4f            	clr	a
 590  00ac 2002          	jra	L42
 591  00ae               L22:
 592  00ae a601          	ld	a,#1
 593  00b0               L42:
 596  00b0 87            	retf
 630                     	xdef	_TBR_Array
 631                     	xdef	_APR_Array
 632                     	xdef	f_AWU_GetFlagStatus
 633                     	xdef	f_AWU_IdleModeEnable
 634                     	xdef	f_AWU_LSICalibrationConfig
 635                     	xdef	f_AWU_Cmd
 636                     	xdef	f_AWU_Init
 637                     	xdef	f_AWU_DeInit
 638                     	xref.b	c_lreg
 639                     	xref.b	c_x
 658                     	xref	d_imul
 659                     	xref	d_ludv
 660                     	xref	d_ltor
 661                     	end
