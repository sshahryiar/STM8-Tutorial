   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  50                     ; 44 void TIM4_UPD_IRQHandler(void) 
  50                     ; 45 {
  51                     	switch	.text
  52  0000               f_TIM4_UPD_IRQHandler:
  54  0000 8a            	push	cc
  55  0001 84            	pop	a
  56  0002 a4bf          	and	a,#191
  57  0004 88            	push	a
  58  0005 86            	pop	cc
  59  0006 3b0002        	push	c_x+2
  60  0009 be00          	ldw	x,c_x
  61  000b 89            	pushw	x
  62  000c 3b0002        	push	c_y+2
  63  000f be00          	ldw	x,c_y
  64  0011 89            	pushw	x
  67                     ; 46 	switch(seg)
  69  0012 b600          	ld	a,_seg
  71                     ; 77 			break;
  72  0014 4a            	dec	a
  73  0015 270d          	jreq	L3
  74  0017 4a            	dec	a
  75  0018 272f          	jreq	L5
  76  001a 4a            	dec	a
  77  001b 2754          	jreq	L7
  78  001d 4a            	dec	a
  79  001e 2779          	jreq	L11
  80  0020 acbc00bc      	jpf	L33
  81  0024               L3:
  82                     ; 50 			n = (value / 1000);
  84  0024 be00          	ldw	x,_value
  85  0026 90ae03e8      	ldw	y,#1000
  86  002a 65            	divw	x,y
  87  002b 01            	rrwa	x,a
  88  002c b700          	ld	_n,a
  89  002e 02            	rlwa	x,a
  90                     ; 51 			GPIO_Write(GPIOD, num[n]);
  92  002f b600          	ld	a,_n
  93  0031 5f            	clrw	x
  94  0032 97            	ld	xl,a
  95  0033 d60000        	ld	a,(_num,x)
  96  0036 88            	push	a
  97  0037 ae500f        	ldw	x,#20495
  98  003a cd0000        	call	_GPIO_Write
 100  003d 84            	pop	a
 101                     ; 52 			GPIO_Write(GPIOC, 0xE0);
 103  003e 4be0          	push	#224
 104  0040 ae500a        	ldw	x,#20490
 105  0043 cd0000        	call	_GPIO_Write
 107  0046 84            	pop	a
 108                     ; 53 			break;
 110  0047 2073          	jra	L33
 111  0049               L5:
 112                     ; 58 			n = ((value / 100) % 10);
 114  0049 be00          	ldw	x,_value
 115  004b a664          	ld	a,#100
 116  004d 62            	div	x,a
 117  004e a60a          	ld	a,#10
 118  0050 62            	div	x,a
 119  0051 5f            	clrw	x
 120  0052 97            	ld	xl,a
 121  0053 01            	rrwa	x,a
 122  0054 b700          	ld	_n,a
 123  0056 02            	rlwa	x,a
 124                     ; 59 			GPIO_Write(GPIOD, num[n]);
 126  0057 b600          	ld	a,_n
 127  0059 5f            	clrw	x
 128  005a 97            	ld	xl,a
 129  005b d60000        	ld	a,(_num,x)
 130  005e 88            	push	a
 131  005f ae500f        	ldw	x,#20495
 132  0062 cd0000        	call	_GPIO_Write
 134  0065 84            	pop	a
 135                     ; 60 			GPIO_Write(GPIOC, 0xD0);
 137  0066 4bd0          	push	#208
 138  0068 ae500a        	ldw	x,#20490
 139  006b cd0000        	call	_GPIO_Write
 141  006e 84            	pop	a
 142                     ; 61 			break;
 144  006f 204b          	jra	L33
 145  0071               L7:
 146                     ; 66 			n = ((value / 10) % 10);
 148  0071 be00          	ldw	x,_value
 149  0073 a60a          	ld	a,#10
 150  0075 62            	div	x,a
 151  0076 a60a          	ld	a,#10
 152  0078 62            	div	x,a
 153  0079 5f            	clrw	x
 154  007a 97            	ld	xl,a
 155  007b 01            	rrwa	x,a
 156  007c b700          	ld	_n,a
 157  007e 02            	rlwa	x,a
 158                     ; 67 			GPIO_Write(GPIOD, num[n]);
 160  007f b600          	ld	a,_n
 161  0081 5f            	clrw	x
 162  0082 97            	ld	xl,a
 163  0083 d60000        	ld	a,(_num,x)
 164  0086 88            	push	a
 165  0087 ae500f        	ldw	x,#20495
 166  008a cd0000        	call	_GPIO_Write
 168  008d 84            	pop	a
 169                     ; 68 			GPIO_Write(GPIOC, 0xB0);
 171  008e 4bb0          	push	#176
 172  0090 ae500a        	ldw	x,#20490
 173  0093 cd0000        	call	_GPIO_Write
 175  0096 84            	pop	a
 176                     ; 69 			break;
 178  0097 2023          	jra	L33
 179  0099               L11:
 180                     ; 74 			n = (value % 10);
 182  0099 be00          	ldw	x,_value
 183  009b a60a          	ld	a,#10
 184  009d 62            	div	x,a
 185  009e 5f            	clrw	x
 186  009f 97            	ld	xl,a
 187  00a0 01            	rrwa	x,a
 188  00a1 b700          	ld	_n,a
 189  00a3 02            	rlwa	x,a
 190                     ; 75 			GPIO_Write(GPIOD, num[n]);
 192  00a4 b600          	ld	a,_n
 193  00a6 5f            	clrw	x
 194  00a7 97            	ld	xl,a
 195  00a8 d60000        	ld	a,(_num,x)
 196  00ab 88            	push	a
 197  00ac ae500f        	ldw	x,#20495
 198  00af cd0000        	call	_GPIO_Write
 200  00b2 84            	pop	a
 201                     ; 76 			GPIO_Write(GPIOC, 0x70);
 203  00b3 4b70          	push	#112
 204  00b5 ae500a        	ldw	x,#20490
 205  00b8 cd0000        	call	_GPIO_Write
 207  00bb 84            	pop	a
 208                     ; 77 			break;
 210  00bc               L33:
 211                     ; 81 	seg++;
 213  00bc 3c00          	inc	_seg
 214                     ; 82 	if(seg > 4)
 216  00be b600          	ld	a,_seg
 217  00c0 a105          	cp	a,#5
 218  00c2 2504          	jrult	L53
 219                     ; 84 		seg = 1;
 221  00c4 35010000      	mov	_seg,#1
 222  00c8               L53:
 223                     ; 86 	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 225  00c8 a601          	ld	a,#1
 226  00ca cd0000        	call	_TIM4_ClearFlag
 228                     ; 87 }
 231  00cd 85            	popw	x
 232  00ce bf00          	ldw	c_y,x
 233  00d0 320002        	pop	c_y+2
 234  00d3 85            	popw	x
 235  00d4 bf00          	ldw	c_x,x
 236  00d6 320002        	pop	c_x+2
 237  00d9 80            	iret
 260                     ; 110 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
 260                     ; 111 {
 261                     	switch	.text
 262  00da               f_NonHandledInterrupt:
 266                     ; 115 }
 269  00da 80            	iret
 291                     ; 123 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
 291                     ; 124 {
 292                     	switch	.text
 293  00db               f_TRAP_IRQHandler:
 297                     ; 128 }
 300  00db 80            	iret
 322                     ; 135 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 322                     ; 136 
 322                     ; 137 {
 323                     	switch	.text
 324  00dc               f_TLI_IRQHandler:
 328                     ; 141 }
 331  00dc 80            	iret
 353                     ; 148 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 353                     ; 149 {
 354                     	switch	.text
 355  00dd               f_AWU_IRQHandler:
 359                     ; 153 }
 362  00dd 80            	iret
 384                     ; 160 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 384                     ; 161 {
 385                     	switch	.text
 386  00de               f_CLK_IRQHandler:
 390                     ; 165 }
 393  00de 80            	iret
 416                     ; 172 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 416                     ; 173 {
 417                     	switch	.text
 418  00df               f_EXTI_PORTA_IRQHandler:
 422                     ; 177 }
 425  00df 80            	iret
 448                     ; 184 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 448                     ; 185 {
 449                     	switch	.text
 450  00e0               f_EXTI_PORTB_IRQHandler:
 454                     ; 189 }
 457  00e0 80            	iret
 480                     ; 196 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 480                     ; 197 {
 481                     	switch	.text
 482  00e1               f_EXTI_PORTC_IRQHandler:
 486                     ; 201 }
 489  00e1 80            	iret
 512                     ; 208 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 512                     ; 209 {
 513                     	switch	.text
 514  00e2               f_EXTI_PORTD_IRQHandler:
 518                     ; 213 }
 521  00e2 80            	iret
 544                     ; 220 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 544                     ; 221 {
 545                     	switch	.text
 546  00e3               f_EXTI_PORTE_IRQHandler:
 550                     ; 225 }
 553  00e3 80            	iret
 575                     ; 272 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 575                     ; 273 {
 576                     	switch	.text
 577  00e4               f_SPI_IRQHandler:
 581                     ; 277 }
 584  00e4 80            	iret
 607                     ; 284 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 607                     ; 285 {
 608                     	switch	.text
 609  00e5               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 613                     ; 289 }
 616  00e5 80            	iret
 639                     ; 296 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 639                     ; 297 {
 640                     	switch	.text
 641  00e6               f_TIM1_CAP_COM_IRQHandler:
 645                     ; 301 }
 648  00e6 80            	iret
 671                     ; 335 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 671                     ; 336  {
 672                     	switch	.text
 673  00e7               f_TIM2_UPD_OVF_BRK_IRQHandler:
 677                     ; 340  }
 680  00e7 80            	iret
 703                     ; 347  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 703                     ; 348  {
 704                     	switch	.text
 705  00e8               f_TIM2_CAP_COM_IRQHandler:
 709                     ; 352  }
 712  00e8 80            	iret
 735                     ; 389  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 735                     ; 390  {
 736                     	switch	.text
 737  00e9               f_UART1_TX_IRQHandler:
 741                     ; 394  }
 744  00e9 80            	iret
 767                     ; 401  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 767                     ; 402  {
 768                     	switch	.text
 769  00ea               f_UART1_RX_IRQHandler:
 773                     ; 406  }
 776  00ea 80            	iret
 798                     ; 440 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 798                     ; 441 {
 799                     	switch	.text
 800  00eb               f_I2C_IRQHandler:
 804                     ; 445 }
 807  00eb 80            	iret
 829                     ; 519  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 829                     ; 520  {
 830                     	switch	.text
 831  00ec               f_ADC1_IRQHandler:
 835                     ; 524  }
 838  00ec 80            	iret
 861                     ; 545  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 861                     ; 546  {
 862                     	switch	.text
 863  00ed               f_TIM4_UPD_OVF_IRQHandler:
 867                     ; 550  }
 870  00ed 80            	iret
 893                     ; 558 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 893                     ; 559 {
 894                     	switch	.text
 895  00ee               f_EEPROM_EEC_IRQHandler:
 899                     ; 563 }
 902  00ee 80            	iret
 914                     	xref	_num
 915                     	xref.b	_seg
 916                     	xref.b	_n
 917                     	xref.b	_value
 918                     	xdef	f_EEPROM_EEC_IRQHandler
 919                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 920                     	xdef	f_ADC1_IRQHandler
 921                     	xdef	f_I2C_IRQHandler
 922                     	xdef	f_UART1_RX_IRQHandler
 923                     	xdef	f_UART1_TX_IRQHandler
 924                     	xdef	f_TIM2_CAP_COM_IRQHandler
 925                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 926                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 927                     	xdef	f_TIM1_CAP_COM_IRQHandler
 928                     	xdef	f_SPI_IRQHandler
 929                     	xdef	f_EXTI_PORTE_IRQHandler
 930                     	xdef	f_EXTI_PORTD_IRQHandler
 931                     	xdef	f_EXTI_PORTC_IRQHandler
 932                     	xdef	f_EXTI_PORTB_IRQHandler
 933                     	xdef	f_EXTI_PORTA_IRQHandler
 934                     	xdef	f_CLK_IRQHandler
 935                     	xdef	f_AWU_IRQHandler
 936                     	xdef	f_TLI_IRQHandler
 937                     	xdef	f_TRAP_IRQHandler
 938                     	xdef	f_NonHandledInterrupt
 939                     	xdef	f_TIM4_UPD_IRQHandler
 940                     	xref	_TIM4_ClearFlag
 941                     	xref	_GPIO_Write
 942                     	xref.b	c_x
 943                     	xref.b	c_y
 962                     	end
