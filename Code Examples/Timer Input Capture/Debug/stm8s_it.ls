   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  47                     ; 43 void TIM1_UPD_IRQHandler(void) 
  47                     ; 44 {
  48                     	switch	.text
  49  0000               f_TIM1_UPD_IRQHandler:
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
  64                     ; 45 	overflow_count++;
  66  0012 be00          	ldw	x,_overflow_count
  67  0014 1c0001        	addw	x,#1
  68  0017 bf00          	ldw	_overflow_count,x
  69                     ; 46 	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
  71  0019 a601          	ld	a,#1
  72  001b cd0000        	call	_TIM1_ClearITPendingBit
  74                     ; 47 	TIM1_ClearFlag(TIM1_FLAG_UPDATE);
  76  001e ae0001        	ldw	x,#1
  77  0021 cd0000        	call	_TIM1_ClearFlag
  79                     ; 48 }
  82  0024 85            	popw	x
  83  0025 bf00          	ldw	c_y,x
  84  0027 320002        	pop	c_y+2
  85  002a 85            	popw	x
  86  002b bf00          	ldw	c_x,x
  87  002d 320002        	pop	c_x+2
  88  0030 80            	iret
 118                     ; 51 void TIM1_CH1_CCP_IRQHandler(void) 
 118                     ; 52 {
 119                     	switch	.text
 120  0031               f_TIM1_CH1_CCP_IRQHandler:
 122  0031 8a            	push	cc
 123  0032 84            	pop	a
 124  0033 a4bf          	and	a,#191
 125  0035 88            	push	a
 126  0036 86            	pop	cc
 127  0037 3b0002        	push	c_x+2
 128  003a be00          	ldw	x,c_x
 129  003c 89            	pushw	x
 130  003d 3b0002        	push	c_y+2
 131  0040 be00          	ldw	x,c_y
 132  0042 89            	pushw	x
 133  0043 be02          	ldw	x,c_lreg+2
 134  0045 89            	pushw	x
 135  0046 be00          	ldw	x,c_lreg
 136  0048 89            	pushw	x
 139                     ; 53 	end_time = TIM1_GetCapture1();
 141  0049 cd0000        	call	_TIM1_GetCapture1
 143  004c cd0000        	call	c_uitolx
 145  004f ae0000        	ldw	x,#_end_time
 146  0052 cd0000        	call	c_rtol
 148                     ; 54 	pulse_ticks = ((overflow_count << 16) - start_time + end_time);
 150  0055 ae0000        	ldw	x,#_start_time
 151  0058 cd0000        	call	c_ltor
 153  005b cd0000        	call	c_lneg
 155  005e ae0000        	ldw	x,#_end_time
 156  0061 cd0000        	call	c_ladd
 158  0064 ae0000        	ldw	x,#_pulse_ticks
 159  0067 cd0000        	call	c_rtol
 161                     ; 55 	start_time = end_time;
 163  006a be02          	ldw	x,_end_time+2
 164  006c bf02          	ldw	_start_time+2,x
 165  006e be00          	ldw	x,_end_time
 166  0070 bf00          	ldw	_start_time,x
 167                     ; 56 	overflow_count = 0;
 169  0072 5f            	clrw	x
 170  0073 bf00          	ldw	_overflow_count,x
 171                     ; 57 	TIM1_ClearITPendingBit(TIM1_IT_CC1);
 173  0075 a602          	ld	a,#2
 174  0077 cd0000        	call	_TIM1_ClearITPendingBit
 176                     ; 58 	TIM1_ClearFlag(TIM1_FLAG_CC1);
 178  007a ae0002        	ldw	x,#2
 179  007d cd0000        	call	_TIM1_ClearFlag
 181                     ; 59 }
 184  0080 85            	popw	x
 185  0081 bf00          	ldw	c_lreg,x
 186  0083 85            	popw	x
 187  0084 bf02          	ldw	c_lreg+2,x
 188  0086 85            	popw	x
 189  0087 bf00          	ldw	c_y,x
 190  0089 320002        	pop	c_y+2
 191  008c 85            	popw	x
 192  008d bf00          	ldw	c_x,x
 193  008f 320002        	pop	c_x+2
 194  0092 80            	iret
 217                     ; 82 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
 217                     ; 83 {
 218                     	switch	.text
 219  0093               f_NonHandledInterrupt:
 223                     ; 87 }
 226  0093 80            	iret
 248                     ; 95 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
 248                     ; 96 {
 249                     	switch	.text
 250  0094               f_TRAP_IRQHandler:
 254                     ; 100 }
 257  0094 80            	iret
 279                     ; 107 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 279                     ; 108 
 279                     ; 109 {
 280                     	switch	.text
 281  0095               f_TLI_IRQHandler:
 285                     ; 113 }
 288  0095 80            	iret
 310                     ; 120 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 310                     ; 121 {
 311                     	switch	.text
 312  0096               f_AWU_IRQHandler:
 316                     ; 125 }
 319  0096 80            	iret
 341                     ; 132 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 341                     ; 133 {
 342                     	switch	.text
 343  0097               f_CLK_IRQHandler:
 347                     ; 137 }
 350  0097 80            	iret
 373                     ; 144 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 373                     ; 145 {
 374                     	switch	.text
 375  0098               f_EXTI_PORTA_IRQHandler:
 379                     ; 149 }
 382  0098 80            	iret
 405                     ; 156 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 405                     ; 157 {
 406                     	switch	.text
 407  0099               f_EXTI_PORTB_IRQHandler:
 411                     ; 161 }
 414  0099 80            	iret
 437                     ; 168 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 437                     ; 169 {
 438                     	switch	.text
 439  009a               f_EXTI_PORTC_IRQHandler:
 443                     ; 173 }
 446  009a 80            	iret
 469                     ; 180 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 469                     ; 181 {
 470                     	switch	.text
 471  009b               f_EXTI_PORTD_IRQHandler:
 475                     ; 185 }
 478  009b 80            	iret
 501                     ; 192 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 501                     ; 193 {
 502                     	switch	.text
 503  009c               f_EXTI_PORTE_IRQHandler:
 507                     ; 197 }
 510  009c 80            	iret
 532                     ; 244 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 532                     ; 245 {
 533                     	switch	.text
 534  009d               f_SPI_IRQHandler:
 538                     ; 249 }
 541  009d 80            	iret
 564                     ; 256 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 564                     ; 257 {
 565                     	switch	.text
 566  009e               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 570                     ; 261 }
 573  009e 80            	iret
 596                     ; 268 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 596                     ; 269 {
 597                     	switch	.text
 598  009f               f_TIM1_CAP_COM_IRQHandler:
 602                     ; 273 }
 605  009f 80            	iret
 628                     ; 307 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 628                     ; 308  {
 629                     	switch	.text
 630  00a0               f_TIM2_UPD_OVF_BRK_IRQHandler:
 634                     ; 312  }
 637  00a0 80            	iret
 660                     ; 319  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 660                     ; 320  {
 661                     	switch	.text
 662  00a1               f_TIM2_CAP_COM_IRQHandler:
 666                     ; 324  }
 669  00a1 80            	iret
 692                     ; 361  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 692                     ; 362  {
 693                     	switch	.text
 694  00a2               f_UART1_TX_IRQHandler:
 698                     ; 366  }
 701  00a2 80            	iret
 724                     ; 373  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 724                     ; 374  {
 725                     	switch	.text
 726  00a3               f_UART1_RX_IRQHandler:
 730                     ; 378  }
 733  00a3 80            	iret
 755                     ; 412 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 755                     ; 413 {
 756                     	switch	.text
 757  00a4               f_I2C_IRQHandler:
 761                     ; 417 }
 764  00a4 80            	iret
 786                     ; 491  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 786                     ; 492  {
 787                     	switch	.text
 788  00a5               f_ADC1_IRQHandler:
 792                     ; 496  }
 795  00a5 80            	iret
 818                     ; 517  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 818                     ; 518  {
 819                     	switch	.text
 820  00a6               f_TIM4_UPD_OVF_IRQHandler:
 824                     ; 522  }
 827  00a6 80            	iret
 850                     ; 530 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 850                     ; 531 {
 851                     	switch	.text
 852  00a7               f_EEPROM_EEC_IRQHandler:
 856                     ; 535 }
 859  00a7 80            	iret
 871                     	xref.b	_end_time
 872                     	xref.b	_start_time
 873                     	xref.b	_pulse_ticks
 874                     	xref.b	_overflow_count
 875                     	xdef	f_EEPROM_EEC_IRQHandler
 876                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 877                     	xdef	f_ADC1_IRQHandler
 878                     	xdef	f_I2C_IRQHandler
 879                     	xdef	f_UART1_RX_IRQHandler
 880                     	xdef	f_UART1_TX_IRQHandler
 881                     	xdef	f_TIM2_CAP_COM_IRQHandler
 882                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 883                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 884                     	xdef	f_TIM1_CAP_COM_IRQHandler
 885                     	xdef	f_SPI_IRQHandler
 886                     	xdef	f_EXTI_PORTE_IRQHandler
 887                     	xdef	f_EXTI_PORTD_IRQHandler
 888                     	xdef	f_EXTI_PORTC_IRQHandler
 889                     	xdef	f_EXTI_PORTB_IRQHandler
 890                     	xdef	f_EXTI_PORTA_IRQHandler
 891                     	xdef	f_CLK_IRQHandler
 892                     	xdef	f_AWU_IRQHandler
 893                     	xdef	f_TLI_IRQHandler
 894                     	xdef	f_TRAP_IRQHandler
 895                     	xdef	f_NonHandledInterrupt
 896                     	xdef	f_TIM1_CH1_CCP_IRQHandler
 897                     	xdef	f_TIM1_UPD_IRQHandler
 898                     	xref	_TIM1_ClearITPendingBit
 899                     	xref	_TIM1_ClearFlag
 900                     	xref	_TIM1_GetCapture1
 901                     	xref.b	c_lreg
 902                     	xref.b	c_x
 903                     	xref.b	c_y
 922                     	xref	c_ladd
 923                     	xref	c_lneg
 924                     	xref	c_ltor
 925                     	xref	c_rtol
 926                     	xref	c_uitolx
 927                     	end
