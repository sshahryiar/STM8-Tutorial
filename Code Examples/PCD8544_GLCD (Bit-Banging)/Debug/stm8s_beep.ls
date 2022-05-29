   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  42                     ; 54 void BEEP_DeInit(void)
  42                     ; 55 {
  43                     	switch	.text
  44  0000               f_BEEP_DeInit:
  48                     ; 56   BEEP->CSR = BEEP_CSR_RESET_VALUE;
  50  0000 351f50f3      	mov	20723,#31
  51                     ; 57 }
  54  0004 87            	retf
 118                     ; 67 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 118                     ; 68 {
 119                     	switch	.text
 120  0005               f_BEEP_Init:
 122  0005 88            	push	a
 123       00000000      OFST:	set	0
 126                     ; 70   assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));
 128                     ; 73   if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 130  0006 c650f3        	ld	a,20723
 131  0009 a41f          	and	a,#31
 132  000b a11f          	cp	a,#31
 133  000d 2610          	jrne	L15
 134                     ; 75     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 136  000f c650f3        	ld	a,20723
 137  0012 a4e0          	and	a,#224
 138  0014 c750f3        	ld	20723,a
 139                     ; 76     BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 141  0017 c650f3        	ld	a,20723
 142  001a aa0b          	or	a,#11
 143  001c c750f3        	ld	20723,a
 144  001f               L15:
 145                     ; 80   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
 147  001f c650f3        	ld	a,20723
 148  0022 a43f          	and	a,#63
 149  0024 c750f3        	ld	20723,a
 150                     ; 81   BEEP->CSR |= (uint8_t)(BEEP_Frequency);
 152  0027 c650f3        	ld	a,20723
 153  002a 1a01          	or	a,(OFST+1,sp)
 154  002c c750f3        	ld	20723,a
 155                     ; 82 }
 158  002f 84            	pop	a
 159  0030 87            	retf
 213                     ; 91 void BEEP_Cmd(FunctionalState NewState)
 213                     ; 92 {
 214                     	switch	.text
 215  0031               f_BEEP_Cmd:
 219                     ; 93   if (NewState != DISABLE)
 221  0031 4d            	tnz	a
 222  0032 2706          	jreq	L101
 223                     ; 96     BEEP->CSR |= BEEP_CSR_BEEPEN;
 225  0034 721a50f3      	bset	20723,#5
 227  0038 2004          	jra	L301
 228  003a               L101:
 229                     ; 101     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
 231  003a 721b50f3      	bres	20723,#5
 232  003e               L301:
 233                     ; 103 }
 236  003e 87            	retf
 282                     .const:	section	.text
 283  0000               L41:
 284  0000 000003e8      	dc.l	1000
 285                     ; 118 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 285                     ; 119 {
 286                     	switch	.text
 287  003f               f_BEEP_LSICalibrationConfig:
 289  003f 5206          	subw	sp,#6
 290       00000006      OFST:	set	6
 293                     ; 124   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 295                     ; 126   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 297  0041 96            	ldw	x,sp
 298  0042 1c000a        	addw	x,#OFST+4
 299  0045 8d000000      	callf	d_ltor
 301  0049 ae0000        	ldw	x,#L41
 302  004c 8d000000      	callf	d_ludv
 304  0050 be02          	ldw	x,c_lreg+2
 305  0052 1f03          	ldw	(OFST-3,sp),x
 307                     ; 130   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 309  0054 c650f3        	ld	a,20723
 310  0057 a4e0          	and	a,#224
 311  0059 c750f3        	ld	20723,a
 312                     ; 132   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 314  005c 1e03          	ldw	x,(OFST-3,sp)
 315  005e 54            	srlw	x
 316  005f 54            	srlw	x
 317  0060 54            	srlw	x
 318  0061 1f05          	ldw	(OFST-1,sp),x
 320                     ; 134   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 322  0063 1e05          	ldw	x,(OFST-1,sp)
 323  0065 58            	sllw	x
 324  0066 58            	sllw	x
 325  0067 58            	sllw	x
 326  0068 1f01          	ldw	(OFST-5,sp),x
 328  006a 1e03          	ldw	x,(OFST-3,sp)
 329  006c 72f001        	subw	x,(OFST-5,sp)
 330  006f 1605          	ldw	y,(OFST-1,sp)
 331  0071 9058          	sllw	y
 332  0073 905c          	incw	y
 333  0075 8d000000      	callf	d_imul
 335  0079 1605          	ldw	y,(OFST-1,sp)
 336  007b 9058          	sllw	y
 337  007d 9058          	sllw	y
 338  007f 9058          	sllw	y
 339  0081 bf00          	ldw	c_x,x
 340  0083 90b300        	cpw	y,c_x
 341  0086 250c          	jrult	L521
 342                     ; 136     BEEP->CSR |= (uint8_t)(A - 2U);
 344  0088 7b06          	ld	a,(OFST+0,sp)
 345  008a a002          	sub	a,#2
 346  008c ca50f3        	or	a,20723
 347  008f c750f3        	ld	20723,a
 349  0092 2009          	jra	L721
 350  0094               L521:
 351                     ; 140     BEEP->CSR |= (uint8_t)(A - 1U);
 353  0094 7b06          	ld	a,(OFST+0,sp)
 354  0096 4a            	dec	a
 355  0097 ca50f3        	or	a,20723
 356  009a c750f3        	ld	20723,a
 357  009d               L721:
 358                     ; 142 }
 361  009d 5b06          	addw	sp,#6
 362  009f 87            	retf
 374                     	xdef	f_BEEP_LSICalibrationConfig
 375                     	xdef	f_BEEP_Cmd
 376                     	xdef	f_BEEP_Init
 377                     	xdef	f_BEEP_DeInit
 378                     	xref.b	c_lreg
 379                     	xref.b	c_x
 398                     	xref	d_imul
 399                     	xref	d_ludv
 400                     	xref	d_ltor
 401                     	end
