   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  44                     ; 35 void AWU_trigger_IRQHandler(void) 
  44                     ; 36 {
  45                     	switch	.text
  46  0000               f_AWU_trigger_IRQHandler:
  48  0000 8a            	push	cc
  49  0001 84            	pop	a
  50  0002 a4bf          	and	a,#191
  51  0004 88            	push	a
  52  0005 86            	pop	cc
  53  0006 3b0002        	push	c_x+2
  54  0009 be00          	ldw	x,c_x
  55  000b 89            	pushw	x
  56  000c 3b0002        	push	c_y+2
  57  000f be00          	ldw	x,c_y
  58  0011 89            	pushw	x
  61                     ; 37 	AWU_GetFlagStatus();
  63  0012 cd0000        	call	_AWU_GetFlagStatus
  65                     ; 38 }
  68  0015 85            	popw	x
  69  0016 bf00          	ldw	c_y,x
  70  0018 320002        	pop	c_y+2
  71  001b 85            	popw	x
  72  001c bf00          	ldw	c_x,x
  73  001e 320002        	pop	c_x+2
  74  0021 80            	iret
  97                     ; 60 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  97                     ; 61 {
  98                     	switch	.text
  99  0022               f_NonHandledInterrupt:
 103                     ; 65 }
 106  0022 80            	iret
 128                     ; 73 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
 128                     ; 74 {
 129                     	switch	.text
 130  0023               f_TRAP_IRQHandler:
 134                     ; 78 }
 137  0023 80            	iret
 159                     ; 85 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 159                     ; 86 
 159                     ; 87 {
 160                     	switch	.text
 161  0024               f_TLI_IRQHandler:
 165                     ; 91 }
 168  0024 80            	iret
 190                     ; 98 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 190                     ; 99 {
 191                     	switch	.text
 192  0025               f_AWU_IRQHandler:
 196                     ; 103 }
 199  0025 80            	iret
 221                     ; 110 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 221                     ; 111 {
 222                     	switch	.text
 223  0026               f_CLK_IRQHandler:
 227                     ; 115 }
 230  0026 80            	iret
 253                     ; 122 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 253                     ; 123 {
 254                     	switch	.text
 255  0027               f_EXTI_PORTA_IRQHandler:
 259                     ; 127 }
 262  0027 80            	iret
 285                     ; 134 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 285                     ; 135 {
 286                     	switch	.text
 287  0028               f_EXTI_PORTB_IRQHandler:
 291                     ; 139 }
 294  0028 80            	iret
 317                     ; 146 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 317                     ; 147 {
 318                     	switch	.text
 319  0029               f_EXTI_PORTC_IRQHandler:
 323                     ; 151 }
 326  0029 80            	iret
 349                     ; 158 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 349                     ; 159 {
 350                     	switch	.text
 351  002a               f_EXTI_PORTD_IRQHandler:
 355                     ; 163 }
 358  002a 80            	iret
 381                     ; 170 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 381                     ; 171 {
 382                     	switch	.text
 383  002b               f_EXTI_PORTE_IRQHandler:
 387                     ; 175 }
 390  002b 80            	iret
 412                     ; 222 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 412                     ; 223 {
 413                     	switch	.text
 414  002c               f_SPI_IRQHandler:
 418                     ; 227 }
 421  002c 80            	iret
 444                     ; 234 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 444                     ; 235 {
 445                     	switch	.text
 446  002d               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 450                     ; 239 }
 453  002d 80            	iret
 476                     ; 246 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 476                     ; 247 {
 477                     	switch	.text
 478  002e               f_TIM1_CAP_COM_IRQHandler:
 482                     ; 251 }
 485  002e 80            	iret
 508                     ; 284  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 508                     ; 285  {
 509                     	switch	.text
 510  002f               f_TIM2_UPD_OVF_BRK_IRQHandler:
 514                     ; 289  }
 517  002f 80            	iret
 540                     ; 296  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 540                     ; 297  {
 541                     	switch	.text
 542  0030               f_TIM2_CAP_COM_IRQHandler:
 546                     ; 301  }
 549  0030 80            	iret
 572                     ; 338  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 572                     ; 339  {
 573                     	switch	.text
 574  0031               f_UART1_TX_IRQHandler:
 578                     ; 343  }
 581  0031 80            	iret
 604                     ; 350  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 604                     ; 351  {
 605                     	switch	.text
 606  0032               f_UART1_RX_IRQHandler:
 610                     ; 355  }
 613  0032 80            	iret
 635                     ; 389 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 635                     ; 390 {
 636                     	switch	.text
 637  0033               f_I2C_IRQHandler:
 641                     ; 394 }
 644  0033 80            	iret
 666                     ; 468  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 666                     ; 469  {
 667                     	switch	.text
 668  0034               f_ADC1_IRQHandler:
 672                     ; 473  }
 675  0034 80            	iret
 698                     ; 494  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 698                     ; 495  {
 699                     	switch	.text
 700  0035               f_TIM4_UPD_OVF_IRQHandler:
 704                     ; 499  }
 707  0035 80            	iret
 730                     ; 507 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 730                     ; 508 {
 731                     	switch	.text
 732  0036               f_EEPROM_EEC_IRQHandler:
 736                     ; 512 }
 739  0036 80            	iret
 751                     	xdef	f_EEPROM_EEC_IRQHandler
 752                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 753                     	xdef	f_ADC1_IRQHandler
 754                     	xdef	f_I2C_IRQHandler
 755                     	xdef	f_UART1_RX_IRQHandler
 756                     	xdef	f_UART1_TX_IRQHandler
 757                     	xdef	f_TIM2_CAP_COM_IRQHandler
 758                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 759                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 760                     	xdef	f_TIM1_CAP_COM_IRQHandler
 761                     	xdef	f_SPI_IRQHandler
 762                     	xdef	f_EXTI_PORTE_IRQHandler
 763                     	xdef	f_EXTI_PORTD_IRQHandler
 764                     	xdef	f_EXTI_PORTC_IRQHandler
 765                     	xdef	f_EXTI_PORTB_IRQHandler
 766                     	xdef	f_EXTI_PORTA_IRQHandler
 767                     	xdef	f_CLK_IRQHandler
 768                     	xdef	f_AWU_IRQHandler
 769                     	xdef	f_TLI_IRQHandler
 770                     	xdef	f_TRAP_IRQHandler
 771                     	xdef	f_NonHandledInterrupt
 772                     	xdef	f_AWU_trigger_IRQHandler
 773                     	xref	_AWU_GetFlagStatus
 774                     	xref.b	c_x
 775                     	xref.b	c_y
 794                     	end
