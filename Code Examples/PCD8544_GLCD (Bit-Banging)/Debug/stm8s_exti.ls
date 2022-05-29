   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  42                     ; 53 void EXTI_DeInit(void)
  42                     ; 54 {
  43                     	switch	.text
  44  0000               f_EXTI_DeInit:
  48                     ; 55   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  50  0000 725f50a0      	clr	20640
  51                     ; 56   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  53  0004 725f50a1      	clr	20641
  54                     ; 57 }
  57  0008 87            	retf
 181                     ; 70 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 181                     ; 71 {
 182                     	switch	.text
 183  0009               f_EXTI_SetExtIntSensitivity:
 185  0009 89            	pushw	x
 186       00000000      OFST:	set	0
 189                     ; 73   assert_param(IS_EXTI_PORT_OK(Port));
 191                     ; 74   assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 193                     ; 77   switch (Port)
 195  000a 9e            	ld	a,xh
 197                     ; 99   default:
 197                     ; 100     break;
 198  000b 4d            	tnz	a
 199  000c 270e          	jreq	L12
 200  000e 4a            	dec	a
 201  000f 271d          	jreq	L32
 202  0011 4a            	dec	a
 203  0012 272e          	jreq	L52
 204  0014 4a            	dec	a
 205  0015 2742          	jreq	L72
 206  0017 4a            	dec	a
 207  0018 2756          	jreq	L13
 208  001a 2064          	jra	L311
 209  001c               L12:
 210                     ; 79   case EXTI_PORT_GPIOA:
 210                     ; 80     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 212  001c c650a0        	ld	a,20640
 213  001f a4fc          	and	a,#252
 214  0021 c750a0        	ld	20640,a
 215                     ; 81     EXTI->CR1 |= (uint8_t)(SensitivityValue);
 217  0024 c650a0        	ld	a,20640
 218  0027 1a02          	or	a,(OFST+2,sp)
 219  0029 c750a0        	ld	20640,a
 220                     ; 82     break;
 222  002c 2052          	jra	L311
 223  002e               L32:
 224                     ; 83   case EXTI_PORT_GPIOB:
 224                     ; 84     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 226  002e c650a0        	ld	a,20640
 227  0031 a4f3          	and	a,#243
 228  0033 c750a0        	ld	20640,a
 229                     ; 85     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 231  0036 7b02          	ld	a,(OFST+2,sp)
 232  0038 48            	sll	a
 233  0039 48            	sll	a
 234  003a ca50a0        	or	a,20640
 235  003d c750a0        	ld	20640,a
 236                     ; 86     break;
 238  0040 203e          	jra	L311
 239  0042               L52:
 240                     ; 87   case EXTI_PORT_GPIOC:
 240                     ; 88     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 242  0042 c650a0        	ld	a,20640
 243  0045 a4cf          	and	a,#207
 244  0047 c750a0        	ld	20640,a
 245                     ; 89     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 247  004a 7b02          	ld	a,(OFST+2,sp)
 248  004c 97            	ld	xl,a
 249  004d a610          	ld	a,#16
 250  004f 42            	mul	x,a
 251  0050 9f            	ld	a,xl
 252  0051 ca50a0        	or	a,20640
 253  0054 c750a0        	ld	20640,a
 254                     ; 90     break;
 256  0057 2027          	jra	L311
 257  0059               L72:
 258                     ; 91   case EXTI_PORT_GPIOD:
 258                     ; 92     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 260  0059 c650a0        	ld	a,20640
 261  005c a43f          	and	a,#63
 262  005e c750a0        	ld	20640,a
 263                     ; 93     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 265  0061 7b02          	ld	a,(OFST+2,sp)
 266  0063 97            	ld	xl,a
 267  0064 a640          	ld	a,#64
 268  0066 42            	mul	x,a
 269  0067 9f            	ld	a,xl
 270  0068 ca50a0        	or	a,20640
 271  006b c750a0        	ld	20640,a
 272                     ; 94     break;
 274  006e 2010          	jra	L311
 275  0070               L13:
 276                     ; 95   case EXTI_PORT_GPIOE:
 276                     ; 96     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 278  0070 c650a1        	ld	a,20641
 279  0073 a4fc          	and	a,#252
 280  0075 c750a1        	ld	20641,a
 281                     ; 97     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 283  0078 c650a1        	ld	a,20641
 284  007b 1a02          	or	a,(OFST+2,sp)
 285  007d c750a1        	ld	20641,a
 286                     ; 98     break;
 288  0080               L33:
 289                     ; 99   default:
 289                     ; 100     break;
 291  0080               L311:
 292                     ; 102 }
 295  0080 85            	popw	x
 296  0081 87            	retf
 353                     ; 111 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 353                     ; 112 {
 354                     	switch	.text
 355  0082               f_EXTI_SetTLISensitivity:
 359                     ; 114   assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 361                     ; 117   EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 363  0082 721550a1      	bres	20641,#2
 364                     ; 118   EXTI->CR2 |= (uint8_t)(SensitivityValue);
 366  0086 ca50a1        	or	a,20641
 367  0089 c750a1        	ld	20641,a
 368                     ; 119 }
 371  008c 87            	retf
 414                     ; 126 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 414                     ; 127 {
 415                     	switch	.text
 416  008d               f_EXTI_GetExtIntSensitivity:
 418  008d 88            	push	a
 419       00000001      OFST:	set	1
 422                     ; 128   uint8_t value = 0;
 424  008e 0f01          	clr	(OFST+0,sp)
 426                     ; 131   assert_param(IS_EXTI_PORT_OK(Port));
 428                     ; 133   switch (Port)
 431                     ; 150   default:
 431                     ; 151     break;
 432  0090 4d            	tnz	a
 433  0091 270e          	jreq	L341
 434  0093 4a            	dec	a
 435  0094 2714          	jreq	L541
 436  0096 4a            	dec	a
 437  0097 271c          	jreq	L741
 438  0099 4a            	dec	a
 439  009a 2725          	jreq	L151
 440  009c 4a            	dec	a
 441  009d 2730          	jreq	L351
 442  009f 2035          	jra	L102
 443  00a1               L341:
 444                     ; 135   case EXTI_PORT_GPIOA:
 444                     ; 136     value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 446  00a1 c650a0        	ld	a,20640
 447  00a4 a403          	and	a,#3
 448  00a6 6b01          	ld	(OFST+0,sp),a
 450                     ; 137     break;
 452  00a8 202c          	jra	L102
 453  00aa               L541:
 454                     ; 138   case EXTI_PORT_GPIOB:
 454                     ; 139     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 456  00aa c650a0        	ld	a,20640
 457  00ad a40c          	and	a,#12
 458  00af 44            	srl	a
 459  00b0 44            	srl	a
 460  00b1 6b01          	ld	(OFST+0,sp),a
 462                     ; 140     break;
 464  00b3 2021          	jra	L102
 465  00b5               L741:
 466                     ; 141   case EXTI_PORT_GPIOC:
 466                     ; 142     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 468  00b5 c650a0        	ld	a,20640
 469  00b8 a430          	and	a,#48
 470  00ba 4e            	swap	a
 471  00bb a40f          	and	a,#15
 472  00bd 6b01          	ld	(OFST+0,sp),a
 474                     ; 143     break;
 476  00bf 2015          	jra	L102
 477  00c1               L151:
 478                     ; 144   case EXTI_PORT_GPIOD:
 478                     ; 145     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 480  00c1 c650a0        	ld	a,20640
 481  00c4 a4c0          	and	a,#192
 482  00c6 4e            	swap	a
 483  00c7 44            	srl	a
 484  00c8 44            	srl	a
 485  00c9 a403          	and	a,#3
 486  00cb 6b01          	ld	(OFST+0,sp),a
 488                     ; 146     break;
 490  00cd 2007          	jra	L102
 491  00cf               L351:
 492                     ; 147   case EXTI_PORT_GPIOE:
 492                     ; 148     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 494  00cf c650a1        	ld	a,20641
 495  00d2 a403          	and	a,#3
 496  00d4 6b01          	ld	(OFST+0,sp),a
 498                     ; 149     break;
 500  00d6               L551:
 501                     ; 150   default:
 501                     ; 151     break;
 503  00d6               L102:
 504                     ; 154   return((EXTI_Sensitivity_TypeDef)value);
 506  00d6 7b01          	ld	a,(OFST+0,sp)
 509  00d8 5b01          	addw	sp,#1
 510  00da 87            	retf
 543                     ; 162 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 543                     ; 163 {
 544                     	switch	.text
 545  00db               f_EXTI_GetTLISensitivity:
 547  00db 88            	push	a
 548       00000001      OFST:	set	1
 551                     ; 164   uint8_t value = 0;
 553                     ; 167   value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 555  00dc c650a1        	ld	a,20641
 556  00df a404          	and	a,#4
 557  00e1 6b01          	ld	(OFST+0,sp),a
 559                     ; 169   return((EXTI_TLISensitivity_TypeDef)value);
 561  00e3 7b01          	ld	a,(OFST+0,sp)
 564  00e5 5b01          	addw	sp,#1
 565  00e7 87            	retf
 577                     	xdef	f_EXTI_GetTLISensitivity
 578                     	xdef	f_EXTI_GetExtIntSensitivity
 579                     	xdef	f_EXTI_SetTLISensitivity
 580                     	xdef	f_EXTI_SetExtIntSensitivity
 581                     	xdef	f_EXTI_DeInit
 600                     	end
