   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
 113                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 113                     ; 54 {
 115                     	switch	.text
 116  0000               _GPIO_DeInit:
 120                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 122  0000 7f            	clr	(x)
 123                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 125  0001 6f02          	clr	(2,x)
 126                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 128  0003 6f03          	clr	(3,x)
 129                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 131  0005 6f04          	clr	(4,x)
 132                     ; 59 }
 135  0007 81            	ret	
 375                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 375                     ; 72 {
 376                     	switch	.text
 377  0008               _GPIO_Init:
 379  0008 89            	pushw	x
 380       00000000      OFST:	set	0
 383                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 385                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 387                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 389  0009 7b05          	ld	a,(OFST+5,sp)
 390  000b 43            	cpl	a
 391  000c e404          	and	a,(4,x)
 392  000e e704          	ld	(4,x),a
 393                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 395  0010 7b06          	ld	a,(OFST+6,sp)
 396  0012 2a16          	jrpl	L771
 397                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 399  0014 a510          	bcp	a,#16
 400  0016 2705          	jreq	L102
 401                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 403  0018 f6            	ld	a,(x)
 404  0019 1a05          	or	a,(OFST+5,sp)
 406  001b 2004          	jra	L302
 407  001d               L102:
 408                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 410  001d 7b05          	ld	a,(OFST+5,sp)
 411  001f 43            	cpl	a
 412  0020 f4            	and	a,(x)
 413  0021               L302:
 414  0021 f7            	ld	(x),a
 415                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 417  0022 1e01          	ldw	x,(OFST+1,sp)
 418  0024 e602          	ld	a,(2,x)
 419  0026 1a05          	or	a,(OFST+5,sp)
 421  0028 2005          	jra	L502
 422  002a               L771:
 423                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 425  002a 7b05          	ld	a,(OFST+5,sp)
 426  002c 43            	cpl	a
 427  002d e402          	and	a,(2,x)
 428  002f               L502:
 429  002f e702          	ld	(2,x),a
 430                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 432  0031 7b06          	ld	a,(OFST+6,sp)
 433  0033 a540          	bcp	a,#64
 434  0035 2706          	jreq	L702
 435                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 437  0037 e603          	ld	a,(3,x)
 438  0039 1a05          	or	a,(OFST+5,sp)
 440  003b 2005          	jra	L112
 441  003d               L702:
 442                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 444  003d 7b05          	ld	a,(OFST+5,sp)
 445  003f 43            	cpl	a
 446  0040 e403          	and	a,(3,x)
 447  0042               L112:
 448  0042 e703          	ld	(3,x),a
 449                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 451  0044 7b06          	ld	a,(OFST+6,sp)
 452  0046 a520          	bcp	a,#32
 453  0048 2706          	jreq	L312
 454                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 456  004a e604          	ld	a,(4,x)
 457  004c 1a05          	or	a,(OFST+5,sp)
 459  004e 2005          	jra	L512
 460  0050               L312:
 461                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 463  0050 7b05          	ld	a,(OFST+5,sp)
 464  0052 43            	cpl	a
 465  0053 e404          	and	a,(4,x)
 466  0055               L512:
 467  0055 e704          	ld	(4,x),a
 468                     ; 131 }
 471  0057 85            	popw	x
 472  0058 81            	ret	
 516                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 516                     ; 142 {
 517                     	switch	.text
 518  0059               _GPIO_Write:
 520       fffffffe      OFST: set -2
 523                     ; 143   GPIOx->ODR = PortVal;
 525  0059 7b03          	ld	a,(OFST+5,sp)
 526  005b f7            	ld	(x),a
 527                     ; 144 }
 530  005c 81            	ret	
 577                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 577                     ; 155 {
 578                     	switch	.text
 579  005d               _GPIO_WriteHigh:
 581       fffffffe      OFST: set -2
 584                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 586  005d f6            	ld	a,(x)
 587  005e 1a03          	or	a,(OFST+5,sp)
 588  0060 f7            	ld	(x),a
 589                     ; 157 }
 592  0061 81            	ret	
 639                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 639                     ; 168 {
 640                     	switch	.text
 641  0062               _GPIO_WriteLow:
 643       fffffffe      OFST: set -2
 646                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 648  0062 7b03          	ld	a,(OFST+5,sp)
 649  0064 43            	cpl	a
 650  0065 f4            	and	a,(x)
 651  0066 f7            	ld	(x),a
 652                     ; 170 }
 655  0067 81            	ret	
 702                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 702                     ; 181 {
 703                     	switch	.text
 704  0068               _GPIO_WriteReverse:
 706       fffffffe      OFST: set -2
 709                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 711  0068 f6            	ld	a,(x)
 712  0069 1803          	xor	a,(OFST+5,sp)
 713  006b f7            	ld	(x),a
 714                     ; 183 }
 717  006c 81            	ret	
 755                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 755                     ; 192 {
 756                     	switch	.text
 757  006d               _GPIO_ReadOutputData:
 761                     ; 193   return ((uint8_t)GPIOx->ODR);
 763  006d f6            	ld	a,(x)
 766  006e 81            	ret	
 803                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 803                     ; 203 {
 804                     	switch	.text
 805  006f               _GPIO_ReadInputData:
 809                     ; 204   return ((uint8_t)GPIOx->IDR);
 811  006f e601          	ld	a,(1,x)
 814  0071 81            	ret	
 882                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 882                     ; 214 {
 883                     	switch	.text
 884  0072               _GPIO_ReadInputPin:
 886       fffffffe      OFST: set -2
 889                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 891  0072 e601          	ld	a,(1,x)
 892  0074 1403          	and	a,(OFST+5,sp)
 895  0076 81            	ret	
 973                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 973                     ; 226 {
 974                     	switch	.text
 975  0077               _GPIO_ExternalPullUpConfig:
 977       fffffffe      OFST: set -2
 980                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 982                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 984                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
 986  0077 7b04          	ld	a,(OFST+6,sp)
 987  0079 2706          	jreq	L174
 988                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 990  007b e603          	ld	a,(3,x)
 991  007d 1a03          	or	a,(OFST+5,sp)
 993  007f 2005          	jra	L374
 994  0081               L174:
 995                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 997  0081 7b03          	ld	a,(OFST+5,sp)
 998  0083 43            	cpl	a
 999  0084 e403          	and	a,(3,x)
1000  0086               L374:
1001  0086 e703          	ld	(3,x),a
1002                     ; 238 }
1005  0088 81            	ret	
1018                     	xdef	_GPIO_ExternalPullUpConfig
1019                     	xdef	_GPIO_ReadInputPin
1020                     	xdef	_GPIO_ReadOutputData
1021                     	xdef	_GPIO_ReadInputData
1022                     	xdef	_GPIO_WriteReverse
1023                     	xdef	_GPIO_WriteLow
1024                     	xdef	_GPIO_WriteHigh
1025                     	xdef	_GPIO_Write
1026                     	xdef	_GPIO_Init
1027                     	xdef	_GPIO_DeInit
1046                     	end
