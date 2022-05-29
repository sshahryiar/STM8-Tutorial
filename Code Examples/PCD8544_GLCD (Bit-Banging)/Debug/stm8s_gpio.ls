   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
 108                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 108                     ; 54 {
 109                     	switch	.text
 110  0000               f_GPIO_DeInit:
 114                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 116  0000 7f            	clr	(x)
 117                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 119  0001 6f02          	clr	(2,x)
 120                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 122  0003 6f03          	clr	(3,x)
 123                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 125  0005 6f04          	clr	(4,x)
 126                     ; 59 }
 129  0007 87            	retf
 368                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 368                     ; 72 {
 369                     	switch	.text
 370  0008               f_GPIO_Init:
 372  0008 89            	pushw	x
 373       00000000      OFST:	set	0
 376                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 378                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 380                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 382  0009 7b06          	ld	a,(OFST+6,sp)
 383  000b 43            	cpl	a
 384  000c e404          	and	a,(4,x)
 385  000e e704          	ld	(4,x),a
 386                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 388  0010 7b07          	ld	a,(OFST+7,sp)
 389  0012 a580          	bcp	a,#128
 390  0014 271d          	jreq	L771
 391                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 393  0016 7b07          	ld	a,(OFST+7,sp)
 394  0018 a510          	bcp	a,#16
 395  001a 2706          	jreq	L102
 396                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 398  001c f6            	ld	a,(x)
 399  001d 1a06          	or	a,(OFST+6,sp)
 400  001f f7            	ld	(x),a
 402  0020 2007          	jra	L302
 403  0022               L102:
 404                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 406  0022 1e01          	ldw	x,(OFST+1,sp)
 407  0024 7b06          	ld	a,(OFST+6,sp)
 408  0026 43            	cpl	a
 409  0027 f4            	and	a,(x)
 410  0028 f7            	ld	(x),a
 411  0029               L302:
 412                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 414  0029 1e01          	ldw	x,(OFST+1,sp)
 415  002b e602          	ld	a,(2,x)
 416  002d 1a06          	or	a,(OFST+6,sp)
 417  002f e702          	ld	(2,x),a
 419  0031 2009          	jra	L502
 420  0033               L771:
 421                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 423  0033 1e01          	ldw	x,(OFST+1,sp)
 424  0035 7b06          	ld	a,(OFST+6,sp)
 425  0037 43            	cpl	a
 426  0038 e402          	and	a,(2,x)
 427  003a e702          	ld	(2,x),a
 428  003c               L502:
 429                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 431  003c 7b07          	ld	a,(OFST+7,sp)
 432  003e a540          	bcp	a,#64
 433  0040 270a          	jreq	L702
 434                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 436  0042 1e01          	ldw	x,(OFST+1,sp)
 437  0044 e603          	ld	a,(3,x)
 438  0046 1a06          	or	a,(OFST+6,sp)
 439  0048 e703          	ld	(3,x),a
 441  004a 2009          	jra	L112
 442  004c               L702:
 443                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 445  004c 1e01          	ldw	x,(OFST+1,sp)
 446  004e 7b06          	ld	a,(OFST+6,sp)
 447  0050 43            	cpl	a
 448  0051 e403          	and	a,(3,x)
 449  0053 e703          	ld	(3,x),a
 450  0055               L112:
 451                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 453  0055 7b07          	ld	a,(OFST+7,sp)
 454  0057 a520          	bcp	a,#32
 455  0059 270a          	jreq	L312
 456                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 458  005b 1e01          	ldw	x,(OFST+1,sp)
 459  005d e604          	ld	a,(4,x)
 460  005f 1a06          	or	a,(OFST+6,sp)
 461  0061 e704          	ld	(4,x),a
 463  0063 2009          	jra	L512
 464  0065               L312:
 465                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 467  0065 1e01          	ldw	x,(OFST+1,sp)
 468  0067 7b06          	ld	a,(OFST+6,sp)
 469  0069 43            	cpl	a
 470  006a e404          	and	a,(4,x)
 471  006c e704          	ld	(4,x),a
 472  006e               L512:
 473                     ; 131 }
 476  006e 85            	popw	x
 477  006f 87            	retf
 520                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 520                     ; 142 {
 521                     	switch	.text
 522  0070               f_GPIO_Write:
 524  0070 89            	pushw	x
 525       00000000      OFST:	set	0
 528                     ; 143   GPIOx->ODR = PortVal;
 530  0071 7b06          	ld	a,(OFST+6,sp)
 531  0073 1e01          	ldw	x,(OFST+1,sp)
 532  0075 f7            	ld	(x),a
 533                     ; 144 }
 536  0076 85            	popw	x
 537  0077 87            	retf
 583                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 583                     ; 155 {
 584                     	switch	.text
 585  0078               f_GPIO_WriteHigh:
 587  0078 89            	pushw	x
 588       00000000      OFST:	set	0
 591                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 593  0079 f6            	ld	a,(x)
 594  007a 1a06          	or	a,(OFST+6,sp)
 595  007c f7            	ld	(x),a
 596                     ; 157 }
 599  007d 85            	popw	x
 600  007e 87            	retf
 646                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 646                     ; 168 {
 647                     	switch	.text
 648  007f               f_GPIO_WriteLow:
 650  007f 89            	pushw	x
 651       00000000      OFST:	set	0
 654                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 656  0080 7b06          	ld	a,(OFST+6,sp)
 657  0082 43            	cpl	a
 658  0083 f4            	and	a,(x)
 659  0084 f7            	ld	(x),a
 660                     ; 170 }
 663  0085 85            	popw	x
 664  0086 87            	retf
 710                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 710                     ; 181 {
 711                     	switch	.text
 712  0087               f_GPIO_WriteReverse:
 714  0087 89            	pushw	x
 715       00000000      OFST:	set	0
 718                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 720  0088 f6            	ld	a,(x)
 721  0089 1806          	xor	a,	(OFST+6,sp)
 722  008b f7            	ld	(x),a
 723                     ; 183 }
 726  008c 85            	popw	x
 727  008d 87            	retf
 764                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 764                     ; 192 {
 765                     	switch	.text
 766  008e               f_GPIO_ReadOutputData:
 770                     ; 193   return ((uint8_t)GPIOx->ODR);
 772  008e f6            	ld	a,(x)
 775  008f 87            	retf
 811                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 811                     ; 203 {
 812                     	switch	.text
 813  0090               f_GPIO_ReadInputData:
 817                     ; 204   return ((uint8_t)GPIOx->IDR);
 819  0090 e601          	ld	a,(1,x)
 822  0092 87            	retf
 889                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 889                     ; 214 {
 890                     	switch	.text
 891  0093               f_GPIO_ReadInputPin:
 893  0093 89            	pushw	x
 894       00000000      OFST:	set	0
 897                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 899  0094 e601          	ld	a,(1,x)
 900  0096 1406          	and	a,(OFST+6,sp)
 903  0098 85            	popw	x
 904  0099 87            	retf
 981                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 981                     ; 226 {
 982                     	switch	.text
 983  009a               f_GPIO_ExternalPullUpConfig:
 985  009a 89            	pushw	x
 986       00000000      OFST:	set	0
 989                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 991                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 993                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
 995  009b 0d07          	tnz	(OFST+7,sp)
 996  009d 2708          	jreq	L174
 997                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 999  009f e603          	ld	a,(3,x)
1000  00a1 1a06          	or	a,(OFST+6,sp)
1001  00a3 e703          	ld	(3,x),a
1003  00a5 2009          	jra	L374
1004  00a7               L174:
1005                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1007  00a7 1e01          	ldw	x,(OFST+1,sp)
1008  00a9 7b06          	ld	a,(OFST+6,sp)
1009  00ab 43            	cpl	a
1010  00ac e403          	and	a,(3,x)
1011  00ae e703          	ld	(3,x),a
1012  00b0               L374:
1013                     ; 238 }
1016  00b0 85            	popw	x
1017  00b1 87            	retf
1029                     	xdef	f_GPIO_ExternalPullUpConfig
1030                     	xdef	f_GPIO_ReadInputPin
1031                     	xdef	f_GPIO_ReadOutputData
1032                     	xdef	f_GPIO_ReadInputData
1033                     	xdef	f_GPIO_WriteReverse
1034                     	xdef	f_GPIO_WriteLow
1035                     	xdef	f_GPIO_WriteHigh
1036                     	xdef	f_GPIO_Write
1037                     	xdef	f_GPIO_Init
1038                     	xdef	f_GPIO_DeInit
1057                     	end
