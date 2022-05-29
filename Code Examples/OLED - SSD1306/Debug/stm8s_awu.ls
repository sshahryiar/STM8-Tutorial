   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  19                     .const:	section	.text
  20  0000               _APR_Array:
  21  0000 00            	dc.b	0
  22  0001 1e            	dc.b	30
  23  0002 1e            	dc.b	30
  24  0003 1e            	dc.b	30
  25  0004 1e            	dc.b	30
  26  0005 1e            	dc.b	30
  27  0006 1e            	dc.b	30
  28  0007 1e            	dc.b	30
  29  0008 1e            	dc.b	30
  30  0009 1e            	dc.b	30
  31  000a 1e            	dc.b	30
  32  000b 1e            	dc.b	30
  33  000c 1e            	dc.b	30
  34  000d 3d            	dc.b	61
  35  000e 17            	dc.b	23
  36  000f 17            	dc.b	23
  37  0010 3e            	dc.b	62
  38  0011               _TBR_Array:
  39  0011 00            	dc.b	0
  40  0012 01            	dc.b	1
  41  0013 02            	dc.b	2
  42  0014 03            	dc.b	3
  43  0015 04            	dc.b	4
  44  0016 05            	dc.b	5
  45  0017 06            	dc.b	6
  46  0018 07            	dc.b	7
  47  0019 08            	dc.b	8
  48  001a 09            	dc.b	9
  49  001b 0a            	dc.b	10
  50  001c 0b            	dc.b	11
  51  001d 0c            	dc.b	12
  52  001e 0c            	dc.b	12
  53  001f 0e            	dc.b	14
  54  0020 0f            	dc.b	15
  55  0021 0f            	dc.b	15
  84                     ; 73 void AWU_DeInit(void)
  84                     ; 74 {
  86                     	switch	.text
  87  0000               _AWU_DeInit:
  91                     ; 75   AWU->CSR = AWU_CSR_RESET_VALUE;
  93  0000 725f50f0      	clr	20720
  94                     ; 76   AWU->APR = AWU_APR_RESET_VALUE;
  96  0004 353f50f1      	mov	20721,#63
  97                     ; 77   AWU->TBR = AWU_TBR_RESET_VALUE;
  99  0008 725f50f2      	clr	20722
 100                     ; 78 }
 103  000c 81            	ret	
 265                     ; 88 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 265                     ; 89 {
 266                     	switch	.text
 267  000d               _AWU_Init:
 269  000d 88            	push	a
 270       00000000      OFST:	set	0
 273                     ; 91   assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
 275                     ; 94   AWU->CSR |= AWU_CSR_AWUEN;
 277  000e 721850f0      	bset	20720,#4
 278                     ; 97   AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 280  0012 c650f2        	ld	a,20722
 281  0015 a4f0          	and	a,#240
 282  0017 c750f2        	ld	20722,a
 283                     ; 98   AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 285  001a 7b01          	ld	a,(OFST+1,sp)
 286  001c 5f            	clrw	x
 287  001d 97            	ld	xl,a
 288  001e c650f2        	ld	a,20722
 289  0021 da0011        	or	a,(_TBR_Array,x)
 290  0024 c750f2        	ld	20722,a
 291                     ; 101   AWU->APR &= (uint8_t)(~AWU_APR_APR);
 293  0027 c650f1        	ld	a,20721
 294  002a a4c0          	and	a,#192
 295  002c c750f1        	ld	20721,a
 296                     ; 102   AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 298  002f 7b01          	ld	a,(OFST+1,sp)
 299  0031 5f            	clrw	x
 300  0032 97            	ld	xl,a
 301  0033 c650f1        	ld	a,20721
 302  0036 da0000        	or	a,(_APR_Array,x)
 303  0039 c750f1        	ld	20721,a
 304                     ; 103 }
 307  003c 84            	pop	a
 308  003d 81            	ret	
 363                     ; 112 void AWU_Cmd(FunctionalState NewState)
 363                     ; 113 {
 364                     	switch	.text
 365  003e               _AWU_Cmd:
 369                     ; 114   if (NewState != DISABLE)
 371  003e 4d            	tnz	a
 372  003f 2705          	jreq	L331
 373                     ; 117     AWU->CSR |= AWU_CSR_AWUEN;
 375  0041 721850f0      	bset	20720,#4
 378  0045 81            	ret	
 379  0046               L331:
 380                     ; 122     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 382  0046 721950f0      	bres	20720,#4
 383                     ; 124 }
 386  004a 81            	ret	
 433                     	switch	.const
 434  0022               L41:
 435  0022 000003e8      	dc.l	1000
 436                     ; 139 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 436                     ; 140 {
 437                     	switch	.text
 438  004b               _AWU_LSICalibrationConfig:
 440  004b 5206          	subw	sp,#6
 441       00000006      OFST:	set	6
 444                     ; 141   uint16_t lsifreqkhz = 0x0;
 446                     ; 142   uint16_t A = 0x0;
 448                     ; 145   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 450                     ; 147   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 452  004d 96            	ldw	x,sp
 453  004e 1c0009        	addw	x,#OFST+3
 454  0051 cd0000        	call	c_ltor
 456  0054 ae0022        	ldw	x,#L41
 457  0057 cd0000        	call	c_ludv
 459  005a be02          	ldw	x,c_lreg+2
 460  005c 1f03          	ldw	(OFST-3,sp),x
 462                     ; 151   A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 464  005e 54            	srlw	x
 465  005f 54            	srlw	x
 466  0060 1f05          	ldw	(OFST-1,sp),x
 468                     ; 153   if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 470  0062 58            	sllw	x
 471  0063 58            	sllw	x
 472  0064 1f01          	ldw	(OFST-5,sp),x
 474  0066 1e03          	ldw	x,(OFST-3,sp)
 475  0068 72f001        	subw	x,(OFST-5,sp)
 476  006b 1605          	ldw	y,(OFST-1,sp)
 477  006d 9058          	sllw	y
 478  006f 905c          	incw	y
 479  0071 cd0000        	call	c_imul
 481  0074 1605          	ldw	y,(OFST-1,sp)
 482  0076 9058          	sllw	y
 483  0078 bf00          	ldw	c_x,x
 484  007a 9058          	sllw	y
 485  007c 90b300        	cpw	y,c_x
 486  007f 7b06          	ld	a,(OFST+0,sp)
 487  0081 2504          	jrult	L751
 488                     ; 155     AWU->APR = (uint8_t)(A - 2U);
 490  0083 a002          	sub	a,#2
 492  0085 2001          	jra	L161
 493  0087               L751:
 494                     ; 159     AWU->APR = (uint8_t)(A - 1U);
 496  0087 4a            	dec	a
 497  0088               L161:
 498  0088 c750f1        	ld	20721,a
 499                     ; 161 }
 502  008b 5b06          	addw	sp,#6
 503  008d 81            	ret	
 526                     ; 168 void AWU_IdleModeEnable(void)
 526                     ; 169 {
 527                     	switch	.text
 528  008e               _AWU_IdleModeEnable:
 532                     ; 171   AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 534  008e 721950f0      	bres	20720,#4
 535                     ; 174   AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 537  0092 35f050f2      	mov	20722,#240
 538                     ; 175 }
 541  0096 81            	ret	
 585                     ; 183 FlagStatus AWU_GetFlagStatus(void)
 585                     ; 184 {
 586                     	switch	.text
 587  0097               _AWU_GetFlagStatus:
 591                     ; 185   return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 593  0097 720a50f002    	btjt	20720,#5,L22
 594  009c 4f            	clr	a
 596  009d 81            	ret	
 597  009e               L22:
 598  009e a601          	ld	a,#1
 601  00a0 81            	ret	
 636                     	xdef	_TBR_Array
 637                     	xdef	_APR_Array
 638                     	xdef	_AWU_GetFlagStatus
 639                     	xdef	_AWU_IdleModeEnable
 640                     	xdef	_AWU_LSICalibrationConfig
 641                     	xdef	_AWU_Cmd
 642                     	xdef	_AWU_Init
 643                     	xdef	_AWU_DeInit
 644                     	xref.b	c_lreg
 645                     	xref.b	c_x
 664                     	xref	c_imul
 665                     	xref	c_ludv
 666                     	xref	c_ltor
 667                     	end
