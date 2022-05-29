   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  46                     ; 40 void TIM1_CH1_CCP_IRQHandler(void) 
  46                     ; 41 {
  47                     	switch	.text
  48  0000               f_TIM1_CH1_CCP_IRQHandler:
  50  0000 8a            	push	cc
  51  0001 84            	pop	a
  52  0002 a4bf          	and	a,#191
  53  0004 88            	push	a
  54  0005 86            	pop	cc
  55  0006 3b0002        	push	c_x+2
  56  0009 be00          	ldw	x,c_x
  57  000b 89            	pushw	x
  58  000c 3b0002        	push	c_y+2
  59  000f be00          	ldw	x,c_y
  60  0011 89            	pushw	x
  61  0012 be02          	ldw	x,c_lreg+2
  62  0014 89            	pushw	x
  63  0015 be00          	ldw	x,c_lreg
  64  0017 89            	pushw	x
  67                     ; 42 	duty_cycle = TIM1_GetCapture2();
  69  0018 cd0000        	call	_TIM1_GetCapture2
  71  001b cd0000        	call	c_uitolx
  73  001e ae0000        	ldw	x,#_duty_cycle
  74  0021 cd0000        	call	c_rtol
  76                     ; 44 	TIM1_ClearITPendingBit(TIM1_IT_CC2);
  78  0024 a604          	ld	a,#4
  79  0026 cd0000        	call	_TIM1_ClearITPendingBit
  81                     ; 46 }
  84  0029 85            	popw	x
  85  002a bf00          	ldw	c_lreg,x
  86  002c 85            	popw	x
  87  002d bf02          	ldw	c_lreg+2,x
  88  002f 85            	popw	x
  89  0030 bf00          	ldw	c_y,x
  90  0032 320002        	pop	c_y+2
  91  0035 85            	popw	x
  92  0036 bf00          	ldw	c_x,x
  93  0038 320002        	pop	c_x+2
  94  003b 80            	iret
 117                     ; 69 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
 117                     ; 70 {
 118                     	switch	.text
 119  003c               f_NonHandledInterrupt:
 123                     ; 74 }
 126  003c 80            	iret
 148                     ; 82 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
 148                     ; 83 {
 149                     	switch	.text
 150  003d               f_TRAP_IRQHandler:
 154                     ; 87 }
 157  003d 80            	iret
 179                     ; 94 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 179                     ; 95 
 179                     ; 96 {
 180                     	switch	.text
 181  003e               f_TLI_IRQHandler:
 185                     ; 100 }
 188  003e 80            	iret
 210                     ; 107 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 210                     ; 108 {
 211                     	switch	.text
 212  003f               f_AWU_IRQHandler:
 216                     ; 112 }
 219  003f 80            	iret
 241                     ; 119 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 241                     ; 120 {
 242                     	switch	.text
 243  0040               f_CLK_IRQHandler:
 247                     ; 124 }
 250  0040 80            	iret
 273                     ; 131 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 273                     ; 132 {
 274                     	switch	.text
 275  0041               f_EXTI_PORTA_IRQHandler:
 279                     ; 136 }
 282  0041 80            	iret
 305                     ; 143 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 305                     ; 144 {
 306                     	switch	.text
 307  0042               f_EXTI_PORTB_IRQHandler:
 311                     ; 148 }
 314  0042 80            	iret
 337                     ; 155 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 337                     ; 156 {
 338                     	switch	.text
 339  0043               f_EXTI_PORTC_IRQHandler:
 343                     ; 160 }
 346  0043 80            	iret
 369                     ; 167 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 369                     ; 168 {
 370                     	switch	.text
 371  0044               f_EXTI_PORTD_IRQHandler:
 375                     ; 172 }
 378  0044 80            	iret
 401                     ; 179 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 401                     ; 180 {
 402                     	switch	.text
 403  0045               f_EXTI_PORTE_IRQHandler:
 407                     ; 184 }
 410  0045 80            	iret
 432                     ; 231 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 432                     ; 232 {
 433                     	switch	.text
 434  0046               f_SPI_IRQHandler:
 438                     ; 236 }
 441  0046 80            	iret
 464                     ; 243 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 464                     ; 244 {
 465                     	switch	.text
 466  0047               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 470                     ; 248 }
 473  0047 80            	iret
 496                     ; 255 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 496                     ; 256 {
 497                     	switch	.text
 498  0048               f_TIM1_CAP_COM_IRQHandler:
 502                     ; 260 }
 505  0048 80            	iret
 528                     ; 294 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 528                     ; 295  {
 529                     	switch	.text
 530  0049               f_TIM2_UPD_OVF_BRK_IRQHandler:
 534                     ; 299  }
 537  0049 80            	iret
 560                     ; 306  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 560                     ; 307  {
 561                     	switch	.text
 562  004a               f_TIM2_CAP_COM_IRQHandler:
 566                     ; 311  }
 569  004a 80            	iret
 592                     ; 348  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 592                     ; 349  {
 593                     	switch	.text
 594  004b               f_UART1_TX_IRQHandler:
 598                     ; 353  }
 601  004b 80            	iret
 624                     ; 360  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 624                     ; 361  {
 625                     	switch	.text
 626  004c               f_UART1_RX_IRQHandler:
 630                     ; 365  }
 633  004c 80            	iret
 655                     ; 399 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 655                     ; 400 {
 656                     	switch	.text
 657  004d               f_I2C_IRQHandler:
 661                     ; 404 }
 664  004d 80            	iret
 686                     ; 478  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 686                     ; 479  {
 687                     	switch	.text
 688  004e               f_ADC1_IRQHandler:
 692                     ; 483  }
 695  004e 80            	iret
 718                     ; 504  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 718                     ; 505  {
 719                     	switch	.text
 720  004f               f_TIM4_UPD_OVF_IRQHandler:
 724                     ; 509  }
 727  004f 80            	iret
 750                     ; 517 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 750                     ; 518 {
 751                     	switch	.text
 752  0050               f_EEPROM_EEC_IRQHandler:
 756                     ; 522 }
 759  0050 80            	iret
 771                     	xref.b	_duty_cycle
 772                     	xdef	f_EEPROM_EEC_IRQHandler
 773                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 774                     	xdef	f_ADC1_IRQHandler
 775                     	xdef	f_I2C_IRQHandler
 776                     	xdef	f_UART1_RX_IRQHandler
 777                     	xdef	f_UART1_TX_IRQHandler
 778                     	xdef	f_TIM2_CAP_COM_IRQHandler
 779                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 780                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 781                     	xdef	f_TIM1_CAP_COM_IRQHandler
 782                     	xdef	f_SPI_IRQHandler
 783                     	xdef	f_EXTI_PORTE_IRQHandler
 784                     	xdef	f_EXTI_PORTD_IRQHandler
 785                     	xdef	f_EXTI_PORTC_IRQHandler
 786                     	xdef	f_EXTI_PORTB_IRQHandler
 787                     	xdef	f_EXTI_PORTA_IRQHandler
 788                     	xdef	f_CLK_IRQHandler
 789                     	xdef	f_AWU_IRQHandler
 790                     	xdef	f_TLI_IRQHandler
 791                     	xdef	f_TRAP_IRQHandler
 792                     	xdef	f_NonHandledInterrupt
 793                     	xdef	f_TIM1_CH1_CCP_IRQHandler
 794                     	xref	_TIM1_ClearITPendingBit
 795                     	xref	_TIM1_GetCapture2
 796                     	xref.b	c_lreg
 797                     	xref.b	c_x
 798                     	xref.b	c_y
 817                     	xref	c_rtol
 818                     	xref	c_uitolx
 819                     	end
