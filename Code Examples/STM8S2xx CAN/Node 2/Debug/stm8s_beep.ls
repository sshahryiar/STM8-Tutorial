   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
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
 286                     .const:	section	.text
 287  0000               L41:
 288  0000 000003e8      	dc.l	1000
 289                     ; 118 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 289                     ; 119 {
 290                     	switch	.text
 291  003f               _BEEP_LSICalibrationConfig:
 293  003f 5206          	subw	sp,#6
 294       00000006      OFST:	set	6
 297                     ; 124   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 299                     ; 126   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 301  0041 96            	ldw	x,sp
 302  0042 1c0009        	addw	x,#OFST+3
 303  0045 cd0000        	call	c_ltor
 305  0048 ae0000        	ldw	x,#L41
 306  004b cd0000        	call	c_ludv
 308  004e be02          	ldw	x,c_lreg+2
 309  0050 1f03          	ldw	(OFST-3,sp),x
 311                     ; 130   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 313  0052 c650f3        	ld	a,20723
 314  0055 a4e0          	and	a,#224
 315  0057 c750f3        	ld	20723,a
 316                     ; 132   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 318  005a 1e03          	ldw	x,(OFST-3,sp)
 319  005c 54            	srlw	x
 320  005d 54            	srlw	x
 321  005e 54            	srlw	x
 322  005f 1f05          	ldw	(OFST-1,sp),x
 324                     ; 134   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 326  0061 1e05          	ldw	x,(OFST-1,sp)
 327  0063 58            	sllw	x
 328  0064 58            	sllw	x
 329  0065 58            	sllw	x
 330  0066 1f01          	ldw	(OFST-5,sp),x
 332  0068 1e03          	ldw	x,(OFST-3,sp)
 333  006a 72f001        	subw	x,(OFST-5,sp)
 334  006d 1605          	ldw	y,(OFST-1,sp)
 335  006f 9058          	sllw	y
 336  0071 905c          	incw	y
 337  0073 cd0000        	call	c_imul
 339  0076 1605          	ldw	y,(OFST-1,sp)
 340  0078 9058          	sllw	y
 341  007a 9058          	sllw	y
 342  007c 9058          	sllw	y
 343  007e bf00          	ldw	c_x,x
 344  0080 90b300        	cpw	y,c_x
 345  0083 250c          	jrult	L521
 346                     ; 136     BEEP->CSR |= (uint8_t)(A - 2U);
 348  0085 7b06          	ld	a,(OFST+0,sp)
 349  0087 a002          	sub	a,#2
 350  0089 ca50f3        	or	a,20723
 351  008c c750f3        	ld	20723,a
 353  008f 2009          	jra	L721
 354  0091               L521:
 355                     ; 140     BEEP->CSR |= (uint8_t)(A - 1U);
 357  0091 7b06          	ld	a,(OFST+0,sp)
 358  0093 4a            	dec	a
 359  0094 ca50f3        	or	a,20723
 360  0097 c750f3        	ld	20723,a
 361  009a               L721:
 362                     ; 142 }
 365  009a 5b06          	addw	sp,#6
 366  009c 81            	ret
 379                     	xdef	_BEEP_LSICalibrationConfig
 380                     	xdef	_BEEP_Cmd
 381                     	xdef	_BEEP_Init
 382                     	xdef	_BEEP_DeInit
 383                     	xref.b	c_lreg
 384                     	xref.b	c_x
 403                     	xref	c_imul
 404                     	xref	c_ludv
 405                     	xref	c_ltor
 406                     	end
