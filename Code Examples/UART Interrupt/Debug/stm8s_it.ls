   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  48                     ; 39 void UART_RX_IRQHandler(void) 
  48                     ; 40 {
  49                     	switch	.text
  50  0000               f_UART_RX_IRQHandler:
  52  0000 8a            	push	cc
  53  0001 84            	pop	a
  54  0002 a4bf          	and	a,#191
  55  0004 88            	push	a
  56  0005 86            	pop	cc
  57  0006 3b0002        	push	c_x+2
  58  0009 be00          	ldw	x,c_x
  59  000b 89            	pushw	x
  60  000c 3b0002        	push	c_y+2
  61  000f be00          	ldw	x,c_y
  62  0011 89            	pushw	x
  65                     ; 41 	RX_value[pos] = UART1_ReceiveData8();
  67  0012 b600          	ld	a,_pos
  68  0014 5f            	clrw	x
  69  0015 97            	ld	xl,a
  70  0016 89            	pushw	x
  71  0017 cd0000        	call	_UART1_ReceiveData8
  73  001a 85            	popw	x
  74  001b e700          	ld	(_RX_value,x),a
  75                     ; 42 	UART1_ClearITPendingBit(UART1_IT_RXNE);
  77  001d ae0255        	ldw	x,#597
  78  0020 cd0000        	call	_UART1_ClearITPendingBit
  80                     ; 43 	UART1_ClearFlag(UART1_FLAG_RXNE);
  82  0023 ae0020        	ldw	x,#32
  83  0026 cd0000        	call	_UART1_ClearFlag
  85                     ; 45 	UART1_SendData8(RX_value[pos]);
  87  0029 b600          	ld	a,_pos
  88  002b 5f            	clrw	x
  89  002c 97            	ld	xl,a
  90  002d e600          	ld	a,(_RX_value,x)
  91  002f cd0000        	call	_UART1_SendData8
  93                     ; 46 	UART1_ClearFlag(UART1_FLAG_TXE);
  95  0032 ae0080        	ldw	x,#128
  96  0035 cd0000        	call	_UART1_ClearFlag
  98                     ; 48 	pos++;
 100  0038 3c00          	inc	_pos
 101                     ; 50 	if(pos > 15)
 103  003a b600          	ld	a,_pos
 104  003c a110          	cp	a,#16
 105  003e 2502          	jrult	L12
 106                     ; 52 		pos = 0;
 108  0040 3f00          	clr	_pos
 109  0042               L12:
 110                     ; 54 }
 113  0042 85            	popw	x
 114  0043 bf00          	ldw	c_y,x
 115  0045 320002        	pop	c_y+2
 116  0048 85            	popw	x
 117  0049 bf00          	ldw	c_x,x
 118  004b 320002        	pop	c_x+2
 119  004e 80            	iret
 142                     ; 76 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
 142                     ; 77 {
 143                     	switch	.text
 144  004f               f_NonHandledInterrupt:
 148                     ; 81 }
 151  004f 80            	iret
 173                     ; 89 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
 173                     ; 90 {
 174                     	switch	.text
 175  0050               f_TRAP_IRQHandler:
 179                     ; 94 }
 182  0050 80            	iret
 204                     ; 101 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 204                     ; 102 
 204                     ; 103 {
 205                     	switch	.text
 206  0051               f_TLI_IRQHandler:
 210                     ; 107 }
 213  0051 80            	iret
 235                     ; 114 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 235                     ; 115 {
 236                     	switch	.text
 237  0052               f_AWU_IRQHandler:
 241                     ; 119 }
 244  0052 80            	iret
 266                     ; 126 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 266                     ; 127 {
 267                     	switch	.text
 268  0053               f_CLK_IRQHandler:
 272                     ; 131 }
 275  0053 80            	iret
 298                     ; 138 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 298                     ; 139 {
 299                     	switch	.text
 300  0054               f_EXTI_PORTA_IRQHandler:
 304                     ; 143 }
 307  0054 80            	iret
 330                     ; 150 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 330                     ; 151 {
 331                     	switch	.text
 332  0055               f_EXTI_PORTB_IRQHandler:
 336                     ; 155 }
 339  0055 80            	iret
 362                     ; 162 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 362                     ; 163 {
 363                     	switch	.text
 364  0056               f_EXTI_PORTC_IRQHandler:
 368                     ; 167 }
 371  0056 80            	iret
 394                     ; 174 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 394                     ; 175 {
 395                     	switch	.text
 396  0057               f_EXTI_PORTD_IRQHandler:
 400                     ; 179 }
 403  0057 80            	iret
 426                     ; 186 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 426                     ; 187 {
 427                     	switch	.text
 428  0058               f_EXTI_PORTE_IRQHandler:
 432                     ; 191 }
 435  0058 80            	iret
 457                     ; 238 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 457                     ; 239 {
 458                     	switch	.text
 459  0059               f_SPI_IRQHandler:
 463                     ; 243 }
 466  0059 80            	iret
 489                     ; 250 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 489                     ; 251 {
 490                     	switch	.text
 491  005a               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 495                     ; 255 }
 498  005a 80            	iret
 521                     ; 262 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 521                     ; 263 {
 522                     	switch	.text
 523  005b               f_TIM1_CAP_COM_IRQHandler:
 527                     ; 267 }
 530  005b 80            	iret
 553                     ; 300  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 553                     ; 301  {
 554                     	switch	.text
 555  005c               f_TIM2_UPD_OVF_BRK_IRQHandler:
 559                     ; 305  }
 562  005c 80            	iret
 585                     ; 312  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 585                     ; 313  {
 586                     	switch	.text
 587  005d               f_TIM2_CAP_COM_IRQHandler:
 591                     ; 317  }
 594  005d 80            	iret
 617                     ; 354  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 617                     ; 355  {
 618                     	switch	.text
 619  005e               f_UART1_TX_IRQHandler:
 623                     ; 359  }
 626  005e 80            	iret
 649                     ; 366  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 649                     ; 367  {
 650                     	switch	.text
 651  005f               f_UART1_RX_IRQHandler:
 655                     ; 371  }
 658  005f 80            	iret
 680                     ; 405 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 680                     ; 406 {
 681                     	switch	.text
 682  0060               f_I2C_IRQHandler:
 686                     ; 410 }
 689  0060 80            	iret
 711                     ; 484  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 711                     ; 485  {
 712                     	switch	.text
 713  0061               f_ADC1_IRQHandler:
 717                     ; 489  }
 720  0061 80            	iret
 743                     ; 510  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 743                     ; 511  {
 744                     	switch	.text
 745  0062               f_TIM4_UPD_OVF_IRQHandler:
 749                     ; 515  }
 752  0062 80            	iret
 775                     ; 523 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 775                     ; 524 {
 776                     	switch	.text
 777  0063               f_EEPROM_EEC_IRQHandler:
 781                     ; 528 }
 784  0063 80            	iret
 796                     	xref.b	_RX_value
 797                     	xref.b	_pos
 798                     	xdef	f_EEPROM_EEC_IRQHandler
 799                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 800                     	xdef	f_ADC1_IRQHandler
 801                     	xdef	f_I2C_IRQHandler
 802                     	xdef	f_UART1_RX_IRQHandler
 803                     	xdef	f_UART1_TX_IRQHandler
 804                     	xdef	f_TIM2_CAP_COM_IRQHandler
 805                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 806                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 807                     	xdef	f_TIM1_CAP_COM_IRQHandler
 808                     	xdef	f_SPI_IRQHandler
 809                     	xdef	f_EXTI_PORTE_IRQHandler
 810                     	xdef	f_EXTI_PORTD_IRQHandler
 811                     	xdef	f_EXTI_PORTC_IRQHandler
 812                     	xdef	f_EXTI_PORTB_IRQHandler
 813                     	xdef	f_EXTI_PORTA_IRQHandler
 814                     	xdef	f_CLK_IRQHandler
 815                     	xdef	f_AWU_IRQHandler
 816                     	xdef	f_TLI_IRQHandler
 817                     	xdef	f_TRAP_IRQHandler
 818                     	xdef	f_NonHandledInterrupt
 819                     	xdef	f_UART_RX_IRQHandler
 820                     	xref	_UART1_ClearITPendingBit
 821                     	xref	_UART1_ClearFlag
 822                     	xref	_UART1_SendData8
 823                     	xref	_UART1_ReceiveData8
 824                     	xref.b	c_x
 825                     	xref.b	c_y
 844                     	end
