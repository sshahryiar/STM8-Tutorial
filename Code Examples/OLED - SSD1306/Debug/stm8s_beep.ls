   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  47                     ; 54 void BEEP_DeInit(void)
  47                     ; 55 {
  49                     	switch	.text
  50  0000               _BEEP_DeInit:
  54                     ; 56   BEEP->CSR = BEEP_CSR_RESET_VALUE;
  56  0000 351f50f3      	mov	20723,#31
  57                     ; 57 }
  60  0004 81            	ret	
 125                     ; 67 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 125                     ; 68 {
 126                     	switch	.text
 127  0005               _BEEP_Init:
 129  0005 88            	push	a
 130       00000000      OFST:	set	0
 133                     ; 70   assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));
 135                     ; 73   if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 137  0006 c650f3        	ld	a,20723
 138  0009 a41f          	and	a,#31
 139  000b a11f          	cp	a,#31
 140  000d 2610          	jrne	L15
 141                     ; 75     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 143  000f c650f3        	ld	a,20723
 144  0012 a4e0          	and	a,#224
 145  0014 c750f3        	ld	20723,a
 146                     ; 76     BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 148  0017 c650f3        	ld	a,20723
 149  001a aa0b          	or	a,#11
 150  001c c750f3        	ld	20723,a
 151  001f               L15:
 152                     ; 80   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
 154  001f c650f3        	ld	a,20723
 155  0022 a43f          	and	a,#63
 156  0024 c750f3        	ld	20723,a
 157                     ; 81   BEEP->CSR |= (uint8_t)(BEEP_Frequency);
 159  0027 c650f3        	ld	a,20723
 160  002a 1a01          	or	a,(OFST+1,sp)
 161  002c c750f3        	ld	20723,a
 162                     ; 82 }
 165  002f 84            	pop	a
 166  0030 81            	ret	
 221                     ; 91 void BEEP_Cmd(FunctionalState NewState)
 221                     ; 92 {
 222                     	switch	.text
 223  0031               _BEEP_Cmd:
 227                     ; 93   if (NewState != DISABLE)
 229  0031 4d            	tnz	a
 230  0032 2705          	jreq	L101
 231                     ; 96     BEEP->CSR |= BEEP_CSR_BEEPEN;
 233  0034 721a50f3      	bset	20723,#5
 236  0038 81            	ret	
 237  0039               L101:
 238                     ; 101     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
 240  0039 721b50f3      	bres	20723,#5
 241                     ; 103 }
 244  003d 81            	ret	
 291                     .const:	section	.text
 292  0000               L41:
 293  0000 000003e8      	dc.l	1000
 294                     ; 118 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 294                     ; 119 {
 295                     	switch	.text
 296  003e               _BEEP_LSICalibrationConfig:
 298  003e 5206          	subw	sp,#6
 299       00000006      OFST:	set	6
 302                     ; 124   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 304                     ; 126   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 306  0040 96            	ldw	x,sp
 307  0041 1c0009        	addw	x,#OFST+3
 308  0044 cd0000        	call	c_ltor
 310  0047 ae0000        	ldw	x,#L41
 311  004a cd0000        	call	c_ludv
 313  004d be02          	ldw	x,c_lreg+2
 314  004f 1f03          	ldw	(OFST-3,sp),x
 316                     ; 130   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 318  0051 c650f3        	ld	a,20723
 319  0054 a4e0          	and	a,#224
 320  0056 c750f3        	ld	20723,a
 321                     ; 132   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 323  0059 54            	srlw	x
 324  005a 54            	srlw	x
 325  005b 54            	srlw	x
 326  005c 1f05          	ldw	(OFST-1,sp),x
 328                     ; 134   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 330  005e 58            	sllw	x
 331  005f 58            	sllw	x
 332  0060 58            	sllw	x
 333  0061 1f01          	ldw	(OFST-5,sp),x
 335  0063 1e03          	ldw	x,(OFST-3,sp)
 336  0065 72f001        	subw	x,(OFST-5,sp)
 337  0068 1605          	ldw	y,(OFST-1,sp)
 338  006a 9058          	sllw	y
 339  006c 905c          	incw	y
 340  006e cd0000        	call	c_imul
 342  0071 1605          	ldw	y,(OFST-1,sp)
 343  0073 9058          	sllw	y
 344  0075 9058          	sllw	y
 345  0077 bf00          	ldw	c_x,x
 346  0079 9058          	sllw	y
 347  007b 90b300        	cpw	y,c_x
 348  007e 7b06          	ld	a,(OFST+0,sp)
 349  0080 2504          	jrult	L521
 350                     ; 136     BEEP->CSR |= (uint8_t)(A - 2U);
 352  0082 a002          	sub	a,#2
 354  0084 2001          	jra	L721
 355  0086               L521:
 356                     ; 140     BEEP->CSR |= (uint8_t)(A - 1U);
 358  0086 4a            	dec	a
 359  0087               L721:
 360  0087 ca50f3        	or	a,20723
 361  008a c750f3        	ld	20723,a
 362                     ; 142 }
 365  008d 5b06          	addw	sp,#6
 366  008f 81            	ret	
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
