   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  42                     ; 35 void EXTI1_IRQHandler(void) 
  42                     ; 36 {
  43                     	switch	.text
  44  0000               f_EXTI1_IRQHandler:
  48                     ; 37 }
  51  0000 80            	iret
  74                     ; 59 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  74                     ; 60 {
  75                     	switch	.text
  76  0001               f_NonHandledInterrupt:
  80                     ; 64 }
  83  0001 80            	iret
 105                     ; 72 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
 105                     ; 73 {
 106                     	switch	.text
 107  0002               f_TRAP_IRQHandler:
 111                     ; 77 }
 114  0002 80            	iret
 136                     ; 84 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 136                     ; 85 
 136                     ; 86 {
 137                     	switch	.text
 138  0003               f_TLI_IRQHandler:
 142                     ; 90 }
 145  0003 80            	iret
 167                     ; 97 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 167                     ; 98 {
 168                     	switch	.text
 169  0004               f_AWU_IRQHandler:
 173                     ; 102 }
 176  0004 80            	iret
 198                     ; 109 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 198                     ; 110 {
 199                     	switch	.text
 200  0005               f_CLK_IRQHandler:
 204                     ; 114 }
 207  0005 80            	iret
 230                     ; 121 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 230                     ; 122 {
 231                     	switch	.text
 232  0006               f_EXTI_PORTA_IRQHandler:
 236                     ; 126 }
 239  0006 80            	iret
 262                     ; 133 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 262                     ; 134 {
 263                     	switch	.text
 264  0007               f_EXTI_PORTB_IRQHandler:
 268                     ; 138 }
 271  0007 80            	iret
 294                     ; 145 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 294                     ; 146 {
 295                     	switch	.text
 296  0008               f_EXTI_PORTC_IRQHandler:
 300                     ; 150 }
 303  0008 80            	iret
 326                     ; 157 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 326                     ; 158 {
 327                     	switch	.text
 328  0009               f_EXTI_PORTD_IRQHandler:
 332                     ; 162 }
 335  0009 80            	iret
 358                     ; 169 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 358                     ; 170 {
 359                     	switch	.text
 360  000a               f_EXTI_PORTE_IRQHandler:
 364                     ; 174 }
 367  000a 80            	iret
 389                     ; 221 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 389                     ; 222 {
 390                     	switch	.text
 391  000b               f_SPI_IRQHandler:
 395                     ; 226 }
 398  000b 80            	iret
 421                     ; 233 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 421                     ; 234 {
 422                     	switch	.text
 423  000c               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 427                     ; 238 }
 430  000c 80            	iret
 453                     ; 245 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 453                     ; 246 {
 454                     	switch	.text
 455  000d               f_TIM1_CAP_COM_IRQHandler:
 459                     ; 250 }
 462  000d 80            	iret
 485                     ; 283  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 485                     ; 284  {
 486                     	switch	.text
 487  000e               f_TIM2_UPD_OVF_BRK_IRQHandler:
 491                     ; 288  }
 494  000e 80            	iret
 517                     ; 295  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 517                     ; 296  {
 518                     	switch	.text
 519  000f               f_TIM2_CAP_COM_IRQHandler:
 523                     ; 300  }
 526  000f 80            	iret
 549                     ; 337  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 549                     ; 338  {
 550                     	switch	.text
 551  0010               f_UART1_TX_IRQHandler:
 555                     ; 342  }
 558  0010 80            	iret
 581                     ; 349  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 581                     ; 350  {
 582                     	switch	.text
 583  0011               f_UART1_RX_IRQHandler:
 587                     ; 354  }
 590  0011 80            	iret
 612                     ; 388 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 612                     ; 389 {
 613                     	switch	.text
 614  0012               f_I2C_IRQHandler:
 618                     ; 393 }
 621  0012 80            	iret
 643                     ; 467  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 643                     ; 468  {
 644                     	switch	.text
 645  0013               f_ADC1_IRQHandler:
 649                     ; 472  }
 652  0013 80            	iret
 675                     ; 493  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 675                     ; 494  {
 676                     	switch	.text
 677  0014               f_TIM4_UPD_OVF_IRQHandler:
 681                     ; 498  }
 684  0014 80            	iret
 707                     ; 506 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 707                     ; 507 {
 708                     	switch	.text
 709  0015               f_EEPROM_EEC_IRQHandler:
 713                     ; 511 }
 716  0015 80            	iret
 728                     	xdef	f_EEPROM_EEC_IRQHandler
 729                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 730                     	xdef	f_ADC1_IRQHandler
 731                     	xdef	f_I2C_IRQHandler
 732                     	xdef	f_UART1_RX_IRQHandler
 733                     	xdef	f_UART1_TX_IRQHandler
 734                     	xdef	f_TIM2_CAP_COM_IRQHandler
 735                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 736                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 737                     	xdef	f_TIM1_CAP_COM_IRQHandler
 738                     	xdef	f_SPI_IRQHandler
 739                     	xdef	f_EXTI_PORTE_IRQHandler
 740                     	xdef	f_EXTI_PORTD_IRQHandler
 741                     	xdef	f_EXTI_PORTC_IRQHandler
 742                     	xdef	f_EXTI_PORTB_IRQHandler
 743                     	xdef	f_EXTI_PORTA_IRQHandler
 744                     	xdef	f_CLK_IRQHandler
 745                     	xdef	f_AWU_IRQHandler
 746                     	xdef	f_TLI_IRQHandler
 747                     	xdef	f_TRAP_IRQHandler
 748                     	xdef	f_NonHandledInterrupt
 749                     	xdef	f_EXTI1_IRQHandler
 768                     	end
