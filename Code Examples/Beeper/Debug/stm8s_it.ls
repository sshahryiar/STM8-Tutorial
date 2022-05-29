   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  47                     ; 40 void TIM4_UPD_IRQHandler(void) 
  47                     ; 41 {
  48                     	switch	.text
  49  0000               f_TIM4_UPD_IRQHandler:
  51  0000 8a            	push	cc
  52  0001 84            	pop	a
  53  0002 a4bf          	and	a,#191
  54  0004 88            	push	a
  55  0005 86            	pop	cc
  56  0006 3b0002        	push	c_x+2
  57  0009 be00          	ldw	x,c_x
  58  000b 89            	pushw	x
  59  000c 3b0002        	push	c_y+2
  60  000f be00          	ldw	x,c_y
  61  0011 89            	pushw	x
  64                     ; 42     t++;
  66  0012 3c00          	inc	_t
  67                     ; 44 	if(t > 60)
  69  0014 b600          	ld	a,_t
  70  0016 a13d          	cp	a,#61
  71  0018 250b          	jrult	L12
  72                     ; 46 		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
  74  001a 4b01          	push	#1
  75  001c ae500f        	ldw	x,#20495
  76  001f cd0000        	call	_GPIO_WriteReverse
  78  0022 84            	pop	a
  79                     ; 47 		t = 0;
  81  0023 3f00          	clr	_t
  82  0025               L12:
  83                     ; 50 	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
  85  0025 a601          	ld	a,#1
  86  0027 cd0000        	call	_TIM4_ClearFlag
  88                     ; 51 }
  91  002a 85            	popw	x
  92  002b bf00          	ldw	c_y,x
  93  002d 320002        	pop	c_y+2
  94  0030 85            	popw	x
  95  0031 bf00          	ldw	c_x,x
  96  0033 320002        	pop	c_x+2
  97  0036 80            	iret
 120                     ; 74 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
 120                     ; 75 {
 121                     	switch	.text
 122  0037               f_NonHandledInterrupt:
 126                     ; 79 }
 129  0037 80            	iret
 151                     ; 87 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
 151                     ; 88 {
 152                     	switch	.text
 153  0038               f_TRAP_IRQHandler:
 157                     ; 92 }
 160  0038 80            	iret
 182                     ; 99 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 182                     ; 100 
 182                     ; 101 {
 183                     	switch	.text
 184  0039               f_TLI_IRQHandler:
 188                     ; 105 }
 191  0039 80            	iret
 213                     ; 112 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 213                     ; 113 {
 214                     	switch	.text
 215  003a               f_AWU_IRQHandler:
 219                     ; 117 }
 222  003a 80            	iret
 244                     ; 124 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 244                     ; 125 {
 245                     	switch	.text
 246  003b               f_CLK_IRQHandler:
 250                     ; 129 }
 253  003b 80            	iret
 276                     ; 136 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 276                     ; 137 {
 277                     	switch	.text
 278  003c               f_EXTI_PORTA_IRQHandler:
 282                     ; 141 }
 285  003c 80            	iret
 308                     ; 148 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 308                     ; 149 {
 309                     	switch	.text
 310  003d               f_EXTI_PORTB_IRQHandler:
 314                     ; 153 }
 317  003d 80            	iret
 340                     ; 160 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 340                     ; 161 {
 341                     	switch	.text
 342  003e               f_EXTI_PORTC_IRQHandler:
 346                     ; 165 }
 349  003e 80            	iret
 372                     ; 172 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 372                     ; 173 {
 373                     	switch	.text
 374  003f               f_EXTI_PORTD_IRQHandler:
 378                     ; 177 }
 381  003f 80            	iret
 404                     ; 184 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 404                     ; 185 {
 405                     	switch	.text
 406  0040               f_EXTI_PORTE_IRQHandler:
 410                     ; 189 }
 413  0040 80            	iret
 435                     ; 236 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 435                     ; 237 {
 436                     	switch	.text
 437  0041               f_SPI_IRQHandler:
 441                     ; 241 }
 444  0041 80            	iret
 467                     ; 248 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 467                     ; 249 {
 468                     	switch	.text
 469  0042               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 473                     ; 253 }
 476  0042 80            	iret
 499                     ; 260 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 499                     ; 261 {
 500                     	switch	.text
 501  0043               f_TIM1_CAP_COM_IRQHandler:
 505                     ; 265 }
 508  0043 80            	iret
 531                     ; 299 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 531                     ; 300  {
 532                     	switch	.text
 533  0044               f_TIM2_UPD_OVF_BRK_IRQHandler:
 537                     ; 304  }
 540  0044 80            	iret
 563                     ; 311  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 563                     ; 312  {
 564                     	switch	.text
 565  0045               f_TIM2_CAP_COM_IRQHandler:
 569                     ; 316  }
 572  0045 80            	iret
 595                     ; 353  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 595                     ; 354  {
 596                     	switch	.text
 597  0046               f_UART1_TX_IRQHandler:
 601                     ; 358  }
 604  0046 80            	iret
 627                     ; 365  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 627                     ; 366  {
 628                     	switch	.text
 629  0047               f_UART1_RX_IRQHandler:
 633                     ; 370  }
 636  0047 80            	iret
 658                     ; 404 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 658                     ; 405 {
 659                     	switch	.text
 660  0048               f_I2C_IRQHandler:
 664                     ; 409 }
 667  0048 80            	iret
 689                     ; 483  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 689                     ; 484  {
 690                     	switch	.text
 691  0049               f_ADC1_IRQHandler:
 695                     ; 488  }
 698  0049 80            	iret
 721                     ; 509  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 721                     ; 510  {
 722                     	switch	.text
 723  004a               f_TIM4_UPD_OVF_IRQHandler:
 727                     ; 514  }
 730  004a 80            	iret
 753                     ; 522 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 753                     ; 523 {
 754                     	switch	.text
 755  004b               f_EEPROM_EEC_IRQHandler:
 759                     ; 527 }
 762  004b 80            	iret
 774                     	xref.b	_t
 775                     	xdef	f_EEPROM_EEC_IRQHandler
 776                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 777                     	xdef	f_ADC1_IRQHandler
 778                     	xdef	f_I2C_IRQHandler
 779                     	xdef	f_UART1_RX_IRQHandler
 780                     	xdef	f_UART1_TX_IRQHandler
 781                     	xdef	f_TIM2_CAP_COM_IRQHandler
 782                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 783                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 784                     	xdef	f_TIM1_CAP_COM_IRQHandler
 785                     	xdef	f_SPI_IRQHandler
 786                     	xdef	f_EXTI_PORTE_IRQHandler
 787                     	xdef	f_EXTI_PORTD_IRQHandler
 788                     	xdef	f_EXTI_PORTC_IRQHandler
 789                     	xdef	f_EXTI_PORTB_IRQHandler
 790                     	xdef	f_EXTI_PORTA_IRQHandler
 791                     	xdef	f_CLK_IRQHandler
 792                     	xdef	f_AWU_IRQHandler
 793                     	xdef	f_TLI_IRQHandler
 794                     	xdef	f_TRAP_IRQHandler
 795                     	xdef	f_NonHandledInterrupt
 796                     	xdef	f_TIM4_UPD_IRQHandler
 797                     	xref	_TIM4_ClearFlag
 798                     	xref	_GPIO_WriteReverse
 799                     	xref.b	c_x
 800                     	xref.b	c_y
 819                     	end
