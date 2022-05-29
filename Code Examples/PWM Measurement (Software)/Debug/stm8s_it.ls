   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  14                     	bsct
  15  0000               L3_state:
  16  0000 00            	dc.b	0
  55                     ; 46 void TIM1_CH1_CCP_IRQHandler(void) 
  55                     ; 47 {
  56                     	switch	.text
  57  0000               f_TIM1_CH1_CCP_IRQHandler:
  59  0000 8a            	push	cc
  60  0001 84            	pop	a
  61  0002 a4bf          	and	a,#191
  62  0004 88            	push	a
  63  0005 86            	pop	cc
  64  0006 3b0002        	push	c_x+2
  65  0009 be00          	ldw	x,c_x
  66  000b 89            	pushw	x
  67  000c 3b0002        	push	c_y+2
  68  000f be00          	ldw	x,c_y
  69  0011 89            	pushw	x
  70  0012 be02          	ldw	x,c_lreg+2
  71  0014 89            	pushw	x
  72  0015 be00          	ldw	x,c_lreg
  73  0017 89            	pushw	x
  76                     ; 48 	if(TIM1_GetFlagStatus(TIM1_FLAG_CC1))
  78  0018 ae0002        	ldw	x,#2
  79  001b cd0000        	call	_TIM1_GetFlagStatus
  81  001e 4d            	tnz	a
  82  001f 274c          	jreq	L32
  83                     ; 50 		if(state == FALSE)
  85  0021 3d00          	tnz	L3_state
  86  0023 261c          	jrne	L52
  87                     ; 52 			start_time = TIM1_GetCapture1();
  89  0025 cd0000        	call	_TIM1_GetCapture1
  91  0028 cd0000        	call	c_uitolx
  93  002b ae0000        	ldw	x,#_start_time
  94  002e cd0000        	call	c_rtol
  96                     ; 53 			TIM1_ICInit(TIM1_CHANNEL_1, TIM1_ICPOLARITY_FALLING, TIM1_ICSELECTION_DIRECTTI, 1, 1);
  98  0031 4b01          	push	#1
  99  0033 4b01          	push	#1
 100  0035 4b01          	push	#1
 101  0037 ae0001        	ldw	x,#1
 102  003a cd0000        	call	_TIM1_ICInit
 104  003d 5b03          	addw	sp,#3
 106  003f 202a          	jra	L72
 107  0041               L52:
 108                     ; 57 			end_time = TIM1_GetCapture1();
 110  0041 cd0000        	call	_TIM1_GetCapture1
 112  0044 cd0000        	call	c_uitolx
 114  0047 ae0000        	ldw	x,#_end_time
 115  004a cd0000        	call	c_rtol
 117                     ; 58 			TIM1_ICInit(TIM1_CHANNEL_1, TIM1_ICPOLARITY_RISING, TIM1_ICSELECTION_DIRECTTI, 1, 1);
 119  004d 4b01          	push	#1
 120  004f 4b01          	push	#1
 121  0051 4b01          	push	#1
 122  0053 5f            	clrw	x
 123  0054 cd0000        	call	_TIM1_ICInit
 125  0057 5b03          	addw	sp,#3
 126                     ; 60 			duty_cycle = (end_time - start_time);
 128  0059 ae0000        	ldw	x,#_end_time
 129  005c cd0000        	call	c_ltor
 131  005f ae0000        	ldw	x,#_start_time
 132  0062 cd0000        	call	c_lsub
 134  0065 ae0000        	ldw	x,#_duty_cycle
 135  0068 cd0000        	call	c_rtol
 137  006b               L72:
 138                     ; 63 		state = ~state;
 140  006b 3300          	cpl	L3_state
 141  006d               L32:
 142                     ; 66 	TIM1_ClearITPendingBit(TIM1_IT_CC1);
 144  006d a602          	ld	a,#2
 145  006f cd0000        	call	_TIM1_ClearITPendingBit
 147                     ; 67 	TIM1_ClearFlag(TIM1_FLAG_CC1);
 149  0072 ae0002        	ldw	x,#2
 150  0075 cd0000        	call	_TIM1_ClearFlag
 152                     ; 68 }
 155  0078 85            	popw	x
 156  0079 bf00          	ldw	c_lreg,x
 157  007b 85            	popw	x
 158  007c bf02          	ldw	c_lreg+2,x
 159  007e 85            	popw	x
 160  007f bf00          	ldw	c_y,x
 161  0081 320002        	pop	c_y+2
 162  0084 85            	popw	x
 163  0085 bf00          	ldw	c_x,x
 164  0087 320002        	pop	c_x+2
 165  008a 80            	iret
 188                     ; 91 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
 188                     ; 92 {
 189                     	switch	.text
 190  008b               f_NonHandledInterrupt:
 194                     ; 96 }
 197  008b 80            	iret
 219                     ; 104 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
 219                     ; 105 {
 220                     	switch	.text
 221  008c               f_TRAP_IRQHandler:
 225                     ; 109 }
 228  008c 80            	iret
 250                     ; 116 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 250                     ; 117 
 250                     ; 118 {
 251                     	switch	.text
 252  008d               f_TLI_IRQHandler:
 256                     ; 122 }
 259  008d 80            	iret
 281                     ; 129 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 281                     ; 130 {
 282                     	switch	.text
 283  008e               f_AWU_IRQHandler:
 287                     ; 134 }
 290  008e 80            	iret
 312                     ; 141 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 312                     ; 142 {
 313                     	switch	.text
 314  008f               f_CLK_IRQHandler:
 318                     ; 146 }
 321  008f 80            	iret
 344                     ; 153 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 344                     ; 154 {
 345                     	switch	.text
 346  0090               f_EXTI_PORTA_IRQHandler:
 350                     ; 158 }
 353  0090 80            	iret
 376                     ; 165 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 376                     ; 166 {
 377                     	switch	.text
 378  0091               f_EXTI_PORTB_IRQHandler:
 382                     ; 170 }
 385  0091 80            	iret
 408                     ; 177 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 408                     ; 178 {
 409                     	switch	.text
 410  0092               f_EXTI_PORTC_IRQHandler:
 414                     ; 182 }
 417  0092 80            	iret
 440                     ; 189 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 440                     ; 190 {
 441                     	switch	.text
 442  0093               f_EXTI_PORTD_IRQHandler:
 446                     ; 194 }
 449  0093 80            	iret
 472                     ; 201 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 472                     ; 202 {
 473                     	switch	.text
 474  0094               f_EXTI_PORTE_IRQHandler:
 478                     ; 206 }
 481  0094 80            	iret
 503                     ; 253 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 503                     ; 254 {
 504                     	switch	.text
 505  0095               f_SPI_IRQHandler:
 509                     ; 258 }
 512  0095 80            	iret
 535                     ; 265 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 535                     ; 266 {
 536                     	switch	.text
 537  0096               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 541                     ; 270 }
 544  0096 80            	iret
 567                     ; 277 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 567                     ; 278 {
 568                     	switch	.text
 569  0097               f_TIM1_CAP_COM_IRQHandler:
 573                     ; 282 }
 576  0097 80            	iret
 599                     ; 316 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 599                     ; 317  {
 600                     	switch	.text
 601  0098               f_TIM2_UPD_OVF_BRK_IRQHandler:
 605                     ; 321  }
 608  0098 80            	iret
 631                     ; 328  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 631                     ; 329  {
 632                     	switch	.text
 633  0099               f_TIM2_CAP_COM_IRQHandler:
 637                     ; 333  }
 640  0099 80            	iret
 663                     ; 370  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 663                     ; 371  {
 664                     	switch	.text
 665  009a               f_UART1_TX_IRQHandler:
 669                     ; 375  }
 672  009a 80            	iret
 695                     ; 382  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 695                     ; 383  {
 696                     	switch	.text
 697  009b               f_UART1_RX_IRQHandler:
 701                     ; 387  }
 704  009b 80            	iret
 726                     ; 421 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 726                     ; 422 {
 727                     	switch	.text
 728  009c               f_I2C_IRQHandler:
 732                     ; 426 }
 735  009c 80            	iret
 757                     ; 500  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 757                     ; 501  {
 758                     	switch	.text
 759  009d               f_ADC1_IRQHandler:
 763                     ; 505  }
 766  009d 80            	iret
 789                     ; 526  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 789                     ; 527  {
 790                     	switch	.text
 791  009e               f_TIM4_UPD_OVF_IRQHandler:
 795                     ; 531  }
 798  009e 80            	iret
 821                     ; 539 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 821                     ; 540 {
 822                     	switch	.text
 823  009f               f_EEPROM_EEC_IRQHandler:
 827                     ; 544 }
 830  009f 80            	iret
 874                     	xref.b	_end_time
 875                     	xref.b	_start_time
 876                     	xref.b	_duty_cycle
 877                     	xdef	f_EEPROM_EEC_IRQHandler
 878                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 879                     	xdef	f_ADC1_IRQHandler
 880                     	xdef	f_I2C_IRQHandler
 881                     	xdef	f_UART1_RX_IRQHandler
 882                     	xdef	f_UART1_TX_IRQHandler
 883                     	xdef	f_TIM2_CAP_COM_IRQHandler
 884                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 885                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 886                     	xdef	f_TIM1_CAP_COM_IRQHandler
 887                     	xdef	f_SPI_IRQHandler
 888                     	xdef	f_EXTI_PORTE_IRQHandler
 889                     	xdef	f_EXTI_PORTD_IRQHandler
 890                     	xdef	f_EXTI_PORTC_IRQHandler
 891                     	xdef	f_EXTI_PORTB_IRQHandler
 892                     	xdef	f_EXTI_PORTA_IRQHandler
 893                     	xdef	f_CLK_IRQHandler
 894                     	xdef	f_AWU_IRQHandler
 895                     	xdef	f_TLI_IRQHandler
 896                     	xdef	f_TRAP_IRQHandler
 897                     	xdef	f_NonHandledInterrupt
 898                     	xdef	f_TIM1_CH1_CCP_IRQHandler
 899                     	xref	_TIM1_ClearITPendingBit
 900                     	xref	_TIM1_ClearFlag
 901                     	xref	_TIM1_GetFlagStatus
 902                     	xref	_TIM1_GetCapture1
 903                     	xref	_TIM1_ICInit
 904                     	xref.b	c_lreg
 905                     	xref.b	c_x
 906                     	xref.b	c_y
 925                     	xref	c_lsub
 926                     	xref	c_ltor
 927                     	xref	c_rtol
 928                     	xref	c_uitolx
 929                     	end
