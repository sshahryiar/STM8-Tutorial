   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  47                     ; 53 void EXTI_DeInit(void)
  47                     ; 54 {
  49                     	switch	.text
  50  0000               _EXTI_DeInit:
  54                     ; 55   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  56  0000 725f50a0      	clr	20640
  57                     ; 56   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  59  0004 725f50a1      	clr	20641
  60                     ; 57 }
  63  0008 81            	ret	
 188                     ; 70 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 188                     ; 71 {
 189                     	switch	.text
 190  0009               _EXTI_SetExtIntSensitivity:
 192  0009 89            	pushw	x
 193       00000000      OFST:	set	0
 196                     ; 73   assert_param(IS_EXTI_PORT_OK(Port));
 198                     ; 74   assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 200                     ; 77   switch (Port)
 202  000a 9e            	ld	a,xh
 204                     ; 99   default:
 204                     ; 100     break;
 205  000b 4d            	tnz	a
 206  000c 270e          	jreq	L12
 207  000e 4a            	dec	a
 208  000f 271a          	jreq	L32
 209  0011 4a            	dec	a
 210  0012 2725          	jreq	L52
 211  0014 4a            	dec	a
 212  0015 2731          	jreq	L72
 213  0017 4a            	dec	a
 214  0018 2745          	jreq	L13
 215  001a 2053          	jra	L311
 216  001c               L12:
 217                     ; 79   case EXTI_PORT_GPIOA:
 217                     ; 80     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 219  001c c650a0        	ld	a,20640
 220  001f a4fc          	and	a,#252
 221  0021 c750a0        	ld	20640,a
 222                     ; 81     EXTI->CR1 |= (uint8_t)(SensitivityValue);
 224  0024 c650a0        	ld	a,20640
 225  0027 1a02          	or	a,(OFST+2,sp)
 226                     ; 82     break;
 228  0029 202f          	jp	LC001
 229  002b               L32:
 230                     ; 83   case EXTI_PORT_GPIOB:
 230                     ; 84     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 232  002b c650a0        	ld	a,20640
 233  002e a4f3          	and	a,#243
 234  0030 c750a0        	ld	20640,a
 235                     ; 85     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 237  0033 7b02          	ld	a,(OFST+2,sp)
 238  0035 48            	sll	a
 239  0036 48            	sll	a
 240                     ; 86     break;
 242  0037 201e          	jp	LC002
 243  0039               L52:
 244                     ; 87   case EXTI_PORT_GPIOC:
 244                     ; 88     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 246  0039 c650a0        	ld	a,20640
 247  003c a4cf          	and	a,#207
 248  003e c750a0        	ld	20640,a
 249                     ; 89     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 251  0041 7b02          	ld	a,(OFST+2,sp)
 252  0043 97            	ld	xl,a
 253  0044 a610          	ld	a,#16
 254                     ; 90     break;
 256  0046 200d          	jp	LC003
 257  0048               L72:
 258                     ; 91   case EXTI_PORT_GPIOD:
 258                     ; 92     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 260  0048 c650a0        	ld	a,20640
 261  004b a43f          	and	a,#63
 262  004d c750a0        	ld	20640,a
 263                     ; 93     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 265  0050 7b02          	ld	a,(OFST+2,sp)
 266  0052 97            	ld	xl,a
 267  0053 a640          	ld	a,#64
 268  0055               LC003:
 269  0055 42            	mul	x,a
 270  0056 9f            	ld	a,xl
 271  0057               LC002:
 272  0057 ca50a0        	or	a,20640
 273  005a               LC001:
 274  005a c750a0        	ld	20640,a
 275                     ; 94     break;
 277  005d 2010          	jra	L311
 278  005f               L13:
 279                     ; 95   case EXTI_PORT_GPIOE:
 279                     ; 96     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 281  005f c650a1        	ld	a,20641
 282  0062 a4fc          	and	a,#252
 283  0064 c750a1        	ld	20641,a
 284                     ; 97     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 286  0067 c650a1        	ld	a,20641
 287  006a 1a02          	or	a,(OFST+2,sp)
 288  006c c750a1        	ld	20641,a
 289                     ; 98     break;
 291                     ; 99   default:
 291                     ; 100     break;
 293  006f               L311:
 294                     ; 102 }
 297  006f 85            	popw	x
 298  0070 81            	ret	
 356                     ; 111 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 356                     ; 112 {
 357                     	switch	.text
 358  0071               _EXTI_SetTLISensitivity:
 362                     ; 114   assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 364                     ; 117   EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 366  0071 721550a1      	bres	20641,#2
 367                     ; 118   EXTI->CR2 |= (uint8_t)(SensitivityValue);
 369  0075 ca50a1        	or	a,20641
 370  0078 c750a1        	ld	20641,a
 371                     ; 119 }
 374  007b 81            	ret	
 418                     ; 126 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 418                     ; 127 {
 419                     	switch	.text
 420  007c               _EXTI_GetExtIntSensitivity:
 422  007c 88            	push	a
 423       00000001      OFST:	set	1
 426                     ; 128   uint8_t value = 0;
 428  007d 0f01          	clr	(OFST+0,sp)
 430                     ; 131   assert_param(IS_EXTI_PORT_OK(Port));
 432                     ; 133   switch (Port)
 435                     ; 150   default:
 435                     ; 151     break;
 436  007f 4d            	tnz	a
 437  0080 2710          	jreq	L341
 438  0082 4a            	dec	a
 439  0083 2712          	jreq	L541
 440  0085 4a            	dec	a
 441  0086 2718          	jreq	L741
 442  0088 4a            	dec	a
 443  0089 271b          	jreq	L151
 444  008b 4a            	dec	a
 445  008c 2722          	jreq	L351
 446  008e 7b01          	ld	a,(OFST+0,sp)
 447  0090 2023          	jra	LC004
 448  0092               L341:
 449                     ; 135   case EXTI_PORT_GPIOA:
 449                     ; 136     value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 451  0092 c650a0        	ld	a,20640
 452                     ; 137     break;
 454  0095 201c          	jp	LC005
 455  0097               L541:
 456                     ; 138   case EXTI_PORT_GPIOB:
 456                     ; 139     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 458  0097 c650a0        	ld	a,20640
 459  009a a40c          	and	a,#12
 460  009c 44            	srl	a
 461  009d 44            	srl	a
 462                     ; 140     break;
 464  009e 2015          	jp	LC004
 465  00a0               L741:
 466                     ; 141   case EXTI_PORT_GPIOC:
 466                     ; 142     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 468  00a0 c650a0        	ld	a,20640
 469  00a3 4e            	swap	a
 470                     ; 143     break;
 472  00a4 200d          	jp	LC005
 473  00a6               L151:
 474                     ; 144   case EXTI_PORT_GPIOD:
 474                     ; 145     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 476  00a6 c650a0        	ld	a,20640
 477  00a9 4e            	swap	a
 478  00aa a40c          	and	a,#12
 479  00ac 44            	srl	a
 480  00ad 44            	srl	a
 481                     ; 146     break;
 483  00ae 2003          	jp	LC005
 484  00b0               L351:
 485                     ; 147   case EXTI_PORT_GPIOE:
 485                     ; 148     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 487  00b0 c650a1        	ld	a,20641
 488  00b3               LC005:
 489  00b3 a403          	and	a,#3
 490  00b5               LC004:
 492                     ; 149     break;
 494                     ; 150   default:
 494                     ; 151     break;
 496                     ; 154   return((EXTI_Sensitivity_TypeDef)value);
 500  00b5 5b01          	addw	sp,#1
 501  00b7 81            	ret	
 535                     ; 162 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 535                     ; 163 {
 536                     	switch	.text
 537  00b8               _EXTI_GetTLISensitivity:
 539       00000001      OFST:	set	1
 542                     ; 164   uint8_t value = 0;
 544                     ; 167   value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 546  00b8 c650a1        	ld	a,20641
 547  00bb a404          	and	a,#4
 549                     ; 169   return((EXTI_TLISensitivity_TypeDef)value);
 553  00bd 81            	ret	
 566                     	xdef	_EXTI_GetTLISensitivity
 567                     	xdef	_EXTI_GetExtIntSensitivity
 568                     	xdef	_EXTI_SetTLISensitivity
 569                     	xdef	_EXTI_SetExtIntSensitivity
 570                     	xdef	_EXTI_DeInit
 589                     	end
