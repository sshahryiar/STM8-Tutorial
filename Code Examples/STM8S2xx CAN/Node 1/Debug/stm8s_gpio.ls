   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
 108                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 108                     ; 54 {
 110                     	switch	.text
 111  0000               _GPIO_DeInit:
 115                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 117  0000 7f            	clr	(x)
 118                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 120  0001 6f02          	clr	(2,x)
 121                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 123  0003 6f03          	clr	(3,x)
 124                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 126  0005 6f04          	clr	(4,x)
 127                     ; 59 }
 130  0007 81            	ret
 370                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 370                     ; 72 {
 371                     	switch	.text
 372  0008               _GPIO_Init:
 374  0008 89            	pushw	x
 375       00000000      OFST:	set	0
 378                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 380                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 382                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 384  0009 7b05          	ld	a,(OFST+5,sp)
 385  000b 43            	cpl	a
 386  000c e404          	and	a,(4,x)
 387  000e e704          	ld	(4,x),a
 388                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 390  0010 7b06          	ld	a,(OFST+6,sp)
 391  0012 a580          	bcp	a,#128
 392  0014 271d          	jreq	L771
 393                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 395  0016 7b06          	ld	a,(OFST+6,sp)
 396  0018 a510          	bcp	a,#16
 397  001a 2706          	jreq	L102
 398                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 400  001c f6            	ld	a,(x)
 401  001d 1a05          	or	a,(OFST+5,sp)
 402  001f f7            	ld	(x),a
 404  0020 2007          	jra	L302
 405  0022               L102:
 406                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 408  0022 1e01          	ldw	x,(OFST+1,sp)
 409  0024 7b05          	ld	a,(OFST+5,sp)
 410  0026 43            	cpl	a
 411  0027 f4            	and	a,(x)
 412  0028 f7            	ld	(x),a
 413  0029               L302:
 414                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 416  0029 1e01          	ldw	x,(OFST+1,sp)
 417  002b e602          	ld	a,(2,x)
 418  002d 1a05          	or	a,(OFST+5,sp)
 419  002f e702          	ld	(2,x),a
 421  0031 2009          	jra	L502
 422  0033               L771:
 423                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 425  0033 1e01          	ldw	x,(OFST+1,sp)
 426  0035 7b05          	ld	a,(OFST+5,sp)
 427  0037 43            	cpl	a
 428  0038 e402          	and	a,(2,x)
 429  003a e702          	ld	(2,x),a
 430  003c               L502:
 431                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 433  003c 7b06          	ld	a,(OFST+6,sp)
 434  003e a540          	bcp	a,#64
 435  0040 270a          	jreq	L702
 436                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 438  0042 1e01          	ldw	x,(OFST+1,sp)
 439  0044 e603          	ld	a,(3,x)
 440  0046 1a05          	or	a,(OFST+5,sp)
 441  0048 e703          	ld	(3,x),a
 443  004a 2009          	jra	L112
 444  004c               L702:
 445                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 447  004c 1e01          	ldw	x,(OFST+1,sp)
 448  004e 7b05          	ld	a,(OFST+5,sp)
 449  0050 43            	cpl	a
 450  0051 e403          	and	a,(3,x)
 451  0053 e703          	ld	(3,x),a
 452  0055               L112:
 453                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 455  0055 7b06          	ld	a,(OFST+6,sp)
 456  0057 a520          	bcp	a,#32
 457  0059 270a          	jreq	L312
 458                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 460  005b 1e01          	ldw	x,(OFST+1,sp)
 461  005d e604          	ld	a,(4,x)
 462  005f 1a05          	or	a,(OFST+5,sp)
 463  0061 e704          	ld	(4,x),a
 465  0063 2009          	jra	L512
 466  0065               L312:
 467                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 469  0065 1e01          	ldw	x,(OFST+1,sp)
 470  0067 7b05          	ld	a,(OFST+5,sp)
 471  0069 43            	cpl	a
 472  006a e404          	and	a,(4,x)
 473  006c e704          	ld	(4,x),a
 474  006e               L512:
 475                     ; 131 }
 478  006e 85            	popw	x
 479  006f 81            	ret
 523                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 523                     ; 142 {
 524                     	switch	.text
 525  0070               _GPIO_Write:
 527  0070 89            	pushw	x
 528       00000000      OFST:	set	0
 531                     ; 143   GPIOx->ODR = PortVal;
 533  0071 7b05          	ld	a,(OFST+5,sp)
 534  0073 1e01          	ldw	x,(OFST+1,sp)
 535  0075 f7            	ld	(x),a
 536                     ; 144 }
 539  0076 85            	popw	x
 540  0077 81            	ret
 587                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 587                     ; 155 {
 588                     	switch	.text
 589  0078               _GPIO_WriteHigh:
 591  0078 89            	pushw	x
 592       00000000      OFST:	set	0
 595                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 597  0079 f6            	ld	a,(x)
 598  007a 1a05          	or	a,(OFST+5,sp)
 599  007c f7            	ld	(x),a
 600                     ; 157 }
 603  007d 85            	popw	x
 604  007e 81            	ret
 651                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 651                     ; 168 {
 652                     	switch	.text
 653  007f               _GPIO_WriteLow:
 655  007f 89            	pushw	x
 656       00000000      OFST:	set	0
 659                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 661  0080 7b05          	ld	a,(OFST+5,sp)
 662  0082 43            	cpl	a
 663  0083 f4            	and	a,(x)
 664  0084 f7            	ld	(x),a
 665                     ; 170 }
 668  0085 85            	popw	x
 669  0086 81            	ret
 716                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 716                     ; 181 {
 717                     	switch	.text
 718  0087               _GPIO_WriteReverse:
 720  0087 89            	pushw	x
 721       00000000      OFST:	set	0
 724                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 726  0088 f6            	ld	a,(x)
 727  0089 1805          	xor	a,	(OFST+5,sp)
 728  008b f7            	ld	(x),a
 729                     ; 183 }
 732  008c 85            	popw	x
 733  008d 81            	ret
 771                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 771                     ; 192 {
 772                     	switch	.text
 773  008e               _GPIO_ReadOutputData:
 777                     ; 193   return ((uint8_t)GPIOx->ODR);
 779  008e f6            	ld	a,(x)
 782  008f 81            	ret
 819                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 819                     ; 203 {
 820                     	switch	.text
 821  0090               _GPIO_ReadInputData:
 825                     ; 204   return ((uint8_t)GPIOx->IDR);
 827  0090 e601          	ld	a,(1,x)
 830  0092 81            	ret
 898                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 898                     ; 214 {
 899                     	switch	.text
 900  0093               _GPIO_ReadInputPin:
 902  0093 89            	pushw	x
 903       00000000      OFST:	set	0
 906                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 908  0094 e601          	ld	a,(1,x)
 909  0096 1405          	and	a,(OFST+5,sp)
 912  0098 85            	popw	x
 913  0099 81            	ret
 991                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 991                     ; 226 {
 992                     	switch	.text
 993  009a               _GPIO_ExternalPullUpConfig:
 995  009a 89            	pushw	x
 996       00000000      OFST:	set	0
 999                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1001                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1003                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
1005  009b 0d06          	tnz	(OFST+6,sp)
1006  009d 2708          	jreq	L174
1007                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1009  009f e603          	ld	a,(3,x)
1010  00a1 1a05          	or	a,(OFST+5,sp)
1011  00a3 e703          	ld	(3,x),a
1013  00a5 2009          	jra	L374
1014  00a7               L174:
1015                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1017  00a7 1e01          	ldw	x,(OFST+1,sp)
1018  00a9 7b05          	ld	a,(OFST+5,sp)
1019  00ab 43            	cpl	a
1020  00ac e403          	and	a,(3,x)
1021  00ae e703          	ld	(3,x),a
1022  00b0               L374:
1023                     ; 238 }
1026  00b0 85            	popw	x
1027  00b1 81            	ret
1040                     	xdef	_GPIO_ExternalPullUpConfig
1041                     	xdef	_GPIO_ReadInputPin
1042                     	xdef	_GPIO_ReadOutputData
1043                     	xdef	_GPIO_ReadInputData
1044                     	xdef	_GPIO_WriteReverse
1045                     	xdef	_GPIO_WriteLow
1046                     	xdef	_GPIO_WriteHigh
1047                     	xdef	_GPIO_Write
1048                     	xdef	_GPIO_Init
1049                     	xdef	_GPIO_DeInit
1068                     	end
