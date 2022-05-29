   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  44                     ; 53 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  44                     ; 54 {
  45                     	switch	.text
  46  0000               f_NonHandledInterrupt:
  50                     ; 58 }
  53  0000 80            	iret
  75                     ; 66 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  75                     ; 67 {
  76                     	switch	.text
  77  0001               f_TRAP_IRQHandler:
  81                     ; 71 }
  84  0001 80            	iret
 106                     ; 78 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 106                     ; 79 
 106                     ; 80 {
 107                     	switch	.text
 108  0002               f_TLI_IRQHandler:
 112                     ; 84 }
 115  0002 80            	iret
 137                     ; 91 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 137                     ; 92 {
 138                     	switch	.text
 139  0003               f_AWU_IRQHandler:
 143                     ; 96 }
 146  0003 80            	iret
 168                     ; 103 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 168                     ; 104 {
 169                     	switch	.text
 170  0004               f_CLK_IRQHandler:
 174                     ; 108 }
 177  0004 80            	iret
 200                     ; 115 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 200                     ; 116 {
 201                     	switch	.text
 202  0005               f_EXTI_PORTA_IRQHandler:
 206                     ; 120 }
 209  0005 80            	iret
 232                     ; 127 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 232                     ; 128 {
 233                     	switch	.text
 234  0006               f_EXTI_PORTB_IRQHandler:
 238                     ; 132 }
 241  0006 80            	iret
 264                     ; 139 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 264                     ; 140 {
 265                     	switch	.text
 266  0007               f_EXTI_PORTC_IRQHandler:
 270                     ; 144 }
 273  0007 80            	iret
 296                     ; 151 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 296                     ; 152 {
 297                     	switch	.text
 298  0008               f_EXTI_PORTD_IRQHandler:
 302                     ; 156 }
 305  0008 80            	iret
 328                     ; 163 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 328                     ; 164 {
 329                     	switch	.text
 330  0009               f_EXTI_PORTE_IRQHandler:
 334                     ; 168 }
 337  0009 80            	iret
 359                     ; 215 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 359                     ; 216 {
 360                     	switch	.text
 361  000a               f_SPI_IRQHandler:
 365                     ; 220 }
 368  000a 80            	iret
 391                     ; 227 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 391                     ; 228 {
 392                     	switch	.text
 393  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 397                     ; 232 }
 400  000b 80            	iret
 423                     ; 239 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 423                     ; 240 {
 424                     	switch	.text
 425  000c               f_TIM1_CAP_COM_IRQHandler:
 429                     ; 244 }
 432  000c 80            	iret
 455                     ; 277  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 455                     ; 278  {
 456                     	switch	.text
 457  000d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 461                     ; 282  }
 464  000d 80            	iret
 487                     ; 289  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 487                     ; 290  {
 488                     	switch	.text
 489  000e               f_TIM2_CAP_COM_IRQHandler:
 493                     ; 294  }
 496  000e 80            	iret
 519                     ; 331  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 519                     ; 332  {
 520                     	switch	.text
 521  000f               f_UART1_TX_IRQHandler:
 525                     ; 336  }
 528  000f 80            	iret
 551                     ; 343  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 551                     ; 344  {
 552                     	switch	.text
 553  0010               f_UART1_RX_IRQHandler:
 557                     ; 348  }
 560  0010 80            	iret
 582                     ; 382 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 582                     ; 383 {
 583                     	switch	.text
 584  0011               f_I2C_IRQHandler:
 588                     ; 387 }
 591  0011 80            	iret
 613                     ; 461  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 613                     ; 462  {
 614                     	switch	.text
 615  0012               f_ADC1_IRQHandler:
 619                     ; 466  }
 622  0012 80            	iret
 645                     ; 487  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 645                     ; 488  {
 646                     	switch	.text
 647  0013               f_TIM4_UPD_OVF_IRQHandler:
 651                     ; 492  }
 654  0013 80            	iret
 677                     ; 500 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 677                     ; 501 {
 678                     	switch	.text
 679  0014               f_EEPROM_EEC_IRQHandler:
 683                     ; 505 }
 686  0014 80            	iret
 698                     	xdef	f_EEPROM_EEC_IRQHandler
 699                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 700                     	xdef	f_ADC1_IRQHandler
 701                     	xdef	f_I2C_IRQHandler
 702                     	xdef	f_UART1_RX_IRQHandler
 703                     	xdef	f_UART1_TX_IRQHandler
 704                     	xdef	f_TIM2_CAP_COM_IRQHandler
 705                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 706                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 707                     	xdef	f_TIM1_CAP_COM_IRQHandler
 708                     	xdef	f_SPI_IRQHandler
 709                     	xdef	f_EXTI_PORTE_IRQHandler
 710                     	xdef	f_EXTI_PORTD_IRQHandler
 711                     	xdef	f_EXTI_PORTC_IRQHandler
 712                     	xdef	f_EXTI_PORTB_IRQHandler
 713                     	xdef	f_EXTI_PORTA_IRQHandler
 714                     	xdef	f_CLK_IRQHandler
 715                     	xdef	f_AWU_IRQHandler
 716                     	xdef	f_TLI_IRQHandler
 717                     	xdef	f_TRAP_IRQHandler
 718                     	xdef	f_NonHandledInterrupt
 737                     	end
