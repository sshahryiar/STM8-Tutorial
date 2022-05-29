   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  45                     ; 38 void ADC_IRQHandler(void) 
  45                     ; 39 {
  46                     	switch	.text
  47  0000               f_ADC_IRQHandler:
  49  0000 8a            	push	cc
  50  0001 84            	pop	a
  51  0002 a4bf          	and	a,#191
  52  0004 88            	push	a
  53  0005 86            	pop	cc
  54  0006 3b0002        	push	c_x+2
  55  0009 be00          	ldw	x,c_x
  56  000b 89            	pushw	x
  57  000c 3b0002        	push	c_y+2
  58  000f be00          	ldw	x,c_y
  59  0011 89            	pushw	x
  62                     ; 40 	adc_value = ADC1_GetConversionValue();
  64  0012 cd0000        	call	_ADC1_GetConversionValue
  66  0015 bf00          	ldw	_adc_value,x
  67                     ; 41 	ADC1_ClearFlag(ADC1_FLAG_EOC);
  69  0017 a680          	ld	a,#128
  70  0019 cd0000        	call	_ADC1_ClearFlag
  72                     ; 42 }
  75  001c 85            	popw	x
  76  001d bf00          	ldw	c_y,x
  77  001f 320002        	pop	c_y+2
  78  0022 85            	popw	x
  79  0023 bf00          	ldw	c_x,x
  80  0025 320002        	pop	c_x+2
  81  0028 80            	iret
 104                     ; 64 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
 104                     ; 65 {
 105                     	switch	.text
 106  0029               f_NonHandledInterrupt:
 110                     ; 69 }
 113  0029 80            	iret
 135                     ; 77 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
 135                     ; 78 {
 136                     	switch	.text
 137  002a               f_TRAP_IRQHandler:
 141                     ; 82 }
 144  002a 80            	iret
 166                     ; 89 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 166                     ; 90 
 166                     ; 91 {
 167                     	switch	.text
 168  002b               f_TLI_IRQHandler:
 172                     ; 95 }
 175  002b 80            	iret
 197                     ; 102 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 197                     ; 103 {
 198                     	switch	.text
 199  002c               f_AWU_IRQHandler:
 203                     ; 107 }
 206  002c 80            	iret
 228                     ; 114 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 228                     ; 115 {
 229                     	switch	.text
 230  002d               f_CLK_IRQHandler:
 234                     ; 119 }
 237  002d 80            	iret
 260                     ; 126 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 260                     ; 127 {
 261                     	switch	.text
 262  002e               f_EXTI_PORTA_IRQHandler:
 266                     ; 131 }
 269  002e 80            	iret
 292                     ; 138 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 292                     ; 139 {
 293                     	switch	.text
 294  002f               f_EXTI_PORTB_IRQHandler:
 298                     ; 143 }
 301  002f 80            	iret
 324                     ; 150 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 324                     ; 151 {
 325                     	switch	.text
 326  0030               f_EXTI_PORTC_IRQHandler:
 330                     ; 155 }
 333  0030 80            	iret
 356                     ; 162 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 356                     ; 163 {
 357                     	switch	.text
 358  0031               f_EXTI_PORTD_IRQHandler:
 362                     ; 167 }
 365  0031 80            	iret
 388                     ; 174 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 388                     ; 175 {
 389                     	switch	.text
 390  0032               f_EXTI_PORTE_IRQHandler:
 394                     ; 179 }
 397  0032 80            	iret
 419                     ; 226 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 419                     ; 227 {
 420                     	switch	.text
 421  0033               f_SPI_IRQHandler:
 425                     ; 231 }
 428  0033 80            	iret
 451                     ; 238 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 451                     ; 239 {
 452                     	switch	.text
 453  0034               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 457                     ; 243 }
 460  0034 80            	iret
 483                     ; 250 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 483                     ; 251 {
 484                     	switch	.text
 485  0035               f_TIM1_CAP_COM_IRQHandler:
 489                     ; 255 }
 492  0035 80            	iret
 515                     ; 288  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 515                     ; 289  {
 516                     	switch	.text
 517  0036               f_TIM2_UPD_OVF_BRK_IRQHandler:
 521                     ; 293  }
 524  0036 80            	iret
 547                     ; 300  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 547                     ; 301  {
 548                     	switch	.text
 549  0037               f_TIM2_CAP_COM_IRQHandler:
 553                     ; 305  }
 556  0037 80            	iret
 579                     ; 342  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 579                     ; 343  {
 580                     	switch	.text
 581  0038               f_UART1_TX_IRQHandler:
 585                     ; 347  }
 588  0038 80            	iret
 611                     ; 354  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 611                     ; 355  {
 612                     	switch	.text
 613  0039               f_UART1_RX_IRQHandler:
 617                     ; 359  }
 620  0039 80            	iret
 642                     ; 393 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 642                     ; 394 {
 643                     	switch	.text
 644  003a               f_I2C_IRQHandler:
 648                     ; 398 }
 651  003a 80            	iret
 673                     ; 472  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 673                     ; 473  {
 674                     	switch	.text
 675  003b               f_ADC1_IRQHandler:
 679                     ; 477  }
 682  003b 80            	iret
 705                     ; 498  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 705                     ; 499  {
 706                     	switch	.text
 707  003c               f_TIM4_UPD_OVF_IRQHandler:
 711                     ; 503  }
 714  003c 80            	iret
 737                     ; 511 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 737                     ; 512 {
 738                     	switch	.text
 739  003d               f_EEPROM_EEC_IRQHandler:
 743                     ; 516 }
 746  003d 80            	iret
 758                     	xref.b	_adc_value
 759                     	xdef	f_EEPROM_EEC_IRQHandler
 760                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 761                     	xdef	f_ADC1_IRQHandler
 762                     	xdef	f_I2C_IRQHandler
 763                     	xdef	f_UART1_RX_IRQHandler
 764                     	xdef	f_UART1_TX_IRQHandler
 765                     	xdef	f_TIM2_CAP_COM_IRQHandler
 766                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 767                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 768                     	xdef	f_TIM1_CAP_COM_IRQHandler
 769                     	xdef	f_SPI_IRQHandler
 770                     	xdef	f_EXTI_PORTE_IRQHandler
 771                     	xdef	f_EXTI_PORTD_IRQHandler
 772                     	xdef	f_EXTI_PORTC_IRQHandler
 773                     	xdef	f_EXTI_PORTB_IRQHandler
 774                     	xdef	f_EXTI_PORTA_IRQHandler
 775                     	xdef	f_CLK_IRQHandler
 776                     	xdef	f_AWU_IRQHandler
 777                     	xdef	f_TLI_IRQHandler
 778                     	xdef	f_TRAP_IRQHandler
 779                     	xdef	f_NonHandledInterrupt
 780                     	xdef	f_ADC_IRQHandler
 781                     	xref	_ADC1_ClearFlag
 782                     	xref	_ADC1_GetConversionValue
 783                     	xref.b	c_x
 784                     	xref.b	c_y
 803                     	end
