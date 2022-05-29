   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  42                     ; 54 void BEEP_DeInit(void)
  42                     ; 55 {
  44                     	switch	.text
  45  0000               _BEEP_DeInit:
  49                     ; 56   BEEP->CSR = BEEP_CSR_RESET_VALUE;
  51  0000 351f50f3      	mov	20723,#31
  52                     ; 57 }
  55  0004 81            	ret
 120                     ; 67 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 120                     ; 68 {
 121                     	switch	.text
 122  0005               _BEEP_Init:
 124  0005 88            	push	a
 125       00000000      OFST:	set	0
 128                     ; 70   assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));
 130                     ; 73   if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 132  0006 c650f3        	ld	a,20723
 133  0009 a41f          	and	a,#31
 134  000b a11f          	cp	a,#31
 135  000d 2610          	jrne	L15
 136                     ; 75     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 138  000f c650f3        	ld	a,20723
 139  0012 a4e0          	and	a,#224
 140  0014 c750f3        	ld	20723,a
 141                     ; 76     BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 143  0017 c650f3        	ld	a,20723
 144  001a aa0b          	or	a,#11
 145  001c c750f3        	ld	20723,a
 146  001f               L15:
 147                     ; 80   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
 149  001f c650f3        	ld	a,20723
 150  0022 a43f          	and	a,#63
 151  0024 c750f3        	ld	20723,a
 152                     ; 81   BEEP->CSR |= (uint8_t)(BEEP_Frequency);
 154  0027 c650f3        	ld	a,20723
 155  002a 1a01          	or	a,(OFST+1,sp)
 156  002c c750f3        	ld	20723,a
 157                     ; 82 }
 160  002f 84            	pop	a
 161  0030 81            	ret
 216                     ; 91 void BEEP_Cmd(FunctionalState NewState)
 216                     ; 92 {
 217                     	switch	.text
 218  0031               _BEEP_Cmd:
 222                     ; 93   if (NewState != DISABLE)
 224  0031 4d            	tnz	a
 225  0032 2706          	jreq	L101
 226                     ; 96     BEEP->CSR |= BEEP_CSR_BEEPEN;
 228  0034 721a50f3      	bset	20723,#5
 230  0038 2004          	jra	L301
 231  003a               L101:
 232                     ; 101     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
 234  003a 721b50f3      	bres	20723,#5
 235  003e               L301:
 236                     ; 103 }
 239  003e 81            	ret
 292                     .const:	section	.text
 293  0000               L41:
 294  0000 000003e8      	dc.l	1000
 295                     ; 118 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 295                     ; 119 {
 296                     	switch	.text
 297  003f               _BEEP_LSICalibrationConfig:
 299  003f 5206          	subw	sp,#6
 300       00000006      OFST:	set	6
 303                     ; 124   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 305                     ; 126   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 307  0041 96            	ldw	x,sp
 308  0042 1c0009        	addw	x,#OFST+3
 309  0045 cd0000        	call	c_ltor
 311  0048 ae0000        	ldw	x,#L41
 312  004b cd0000        	call	c_ludv
 314  004e be02          	ldw	x,c_lreg+2
 315  0050 1f03          	ldw	(OFST-3,sp),x
 317                     ; 130   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 319  0052 c650f3        	ld	a,20723
 320  0055 a4e0          	and	a,#224
 321  0057 c750f3        	ld	20723,a
 322                     ; 132   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 324  005a 1e03          	ldw	x,(OFST-3,sp)
 325  005c 54            	srlw	x
 326  005d 54            	srlw	x
 327  005e 54            	srlw	x
 328  005f 1f05          	ldw	(OFST-1,sp),x
 330                     ; 134   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 332  0061 1e05          	ldw	x,(OFST-1,sp)
 333  0063 58            	sllw	x
 334  0064 58            	sllw	x
 335  0065 58            	sllw	x
 336  0066 1f01          	ldw	(OFST-5,sp),x
 338  0068 1e03          	ldw	x,(OFST-3,sp)
 339  006a 72f001        	subw	x,(OFST-5,sp)
 340  006d 1605          	ldw	y,(OFST-1,sp)
 341  006f 9058          	sllw	y
 342  0071 905c          	incw	y
 343  0073 cd0000        	call	c_imul
 345  0076 1605          	ldw	y,(OFST-1,sp)
 346  0078 9058          	sllw	y
 347  007a 9058          	sllw	y
 348  007c 9058          	sllw	y
 349  007e bf00          	ldw	c_x,x
 350  0080 90b300        	cpw	y,c_x
 351  0083 250c          	jrult	L331
 352                     ; 136     BEEP->CSR |= (uint8_t)(A - 2U);
 354  0085 7b06          	ld	a,(OFST+0,sp)
 355  0087 a002          	sub	a,#2
 356  0089 ca50f3        	or	a,20723
 357  008c c750f3        	ld	20723,a
 359  008f 2009          	jra	L531
 360  0091               L331:
 361                     ; 140     BEEP->CSR |= (uint8_t)(A - 1U);
 363  0091 7b06          	ld	a,(OFST+0,sp)
 364  0093 4a            	dec	a
 365  0094 ca50f3        	or	a,20723
 366  0097 c750f3        	ld	20723,a
 367  009a               L531:
 368                     ; 142 }
 371  009a 5b06          	addw	sp,#6
 372  009c 81            	ret
 385                     	xdef	_BEEP_LSICalibrationConfig
 386                     	xdef	_BEEP_Cmd
 387                     	xdef	_BEEP_Init
 388                     	xdef	_BEEP_DeInit
 389                     	xref.b	c_lreg
 390                     	xref.b	c_x
 409                     	xref	c_imul
 410                     	xref	c_ludv
 411                     	xref	c_ltor
 412                     	end
