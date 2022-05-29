   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  42                     ; 50 uint8_t ITC_GetCPUCC(void)
  42                     ; 51 {
  44                     	switch	.text
  45  0000               _ITC_GetCPUCC:
  49                     ; 53   _asm("push cc");
  52  0000 8a            push cc
  54                     ; 54   _asm("pop a");
  57  0001 84            pop a
  59                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  62  0002 81            	ret
  85                     ; 80 void ITC_DeInit(void)
  85                     ; 81 {
  86                     	switch	.text
  87  0003               _ITC_DeInit:
  91                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  93  0003 35ff7f70      	mov	32624,#255
  94                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  96  0007 35ff7f71      	mov	32625,#255
  97                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  99  000b 35ff7f72      	mov	32626,#255
 100                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 102  000f 35ff7f73      	mov	32627,#255
 103                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 105  0013 35ff7f74      	mov	32628,#255
 106                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 108  0017 35ff7f75      	mov	32629,#255
 109                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 111  001b 35ff7f76      	mov	32630,#255
 112                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 114  001f 35ff7f77      	mov	32631,#255
 115                     ; 90 }
 118  0023 81            	ret
 143                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 143                     ; 98 {
 144                     	switch	.text
 145  0024               _ITC_GetSoftIntStatus:
 149                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 151  0024 adda          	call	_ITC_GetCPUCC
 153  0026 a428          	and	a,#40
 156  0028 81            	ret
 419                     .const:	section	.text
 420  0000               L22:
 421  0000 004c          	dc.w	L14
 422  0002 004c          	dc.w	L14
 423  0004 004c          	dc.w	L14
 424  0006 004c          	dc.w	L14
 425  0008 0055          	dc.w	L34
 426  000a 0055          	dc.w	L34
 427  000c 0055          	dc.w	L34
 428  000e 0055          	dc.w	L34
 429  0010 0089          	dc.w	L702
 430  0012 0089          	dc.w	L702
 431  0014 005e          	dc.w	L54
 432  0016 005e          	dc.w	L54
 433  0018 0067          	dc.w	L74
 434  001a 0067          	dc.w	L74
 435  001c 0067          	dc.w	L74
 436  001e 0067          	dc.w	L74
 437  0020 0070          	dc.w	L15
 438  0022 0070          	dc.w	L15
 439  0024 0070          	dc.w	L15
 440  0026 0070          	dc.w	L15
 441  0028 0079          	dc.w	L35
 442  002a 0079          	dc.w	L35
 443  002c 0079          	dc.w	L35
 444  002e 0079          	dc.w	L35
 445  0030 0082          	dc.w	L55
 446                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 446                     ; 108 {
 447                     	switch	.text
 448  0029               _ITC_GetSoftwarePriority:
 450  0029 88            	push	a
 451  002a 89            	pushw	x
 452       00000002      OFST:	set	2
 455                     ; 109   uint8_t Value = 0;
 457  002b 0f02          	clr	(OFST+0,sp)
 459                     ; 110   uint8_t Mask = 0;
 461                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 463                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 465  002d a403          	and	a,#3
 466  002f 48            	sll	a
 467  0030 5f            	clrw	x
 468  0031 97            	ld	xl,a
 469  0032 a603          	ld	a,#3
 470  0034 5d            	tnzw	x
 471  0035 2704          	jreq	L41
 472  0037               L61:
 473  0037 48            	sll	a
 474  0038 5a            	decw	x
 475  0039 26fc          	jrne	L61
 476  003b               L41:
 477  003b 6b01          	ld	(OFST-1,sp),a
 479                     ; 118   switch (IrqNum)
 481  003d 7b03          	ld	a,(OFST+1,sp)
 483                     ; 198   default:
 483                     ; 199     break;
 484  003f a119          	cp	a,#25
 485  0041 2407          	jruge	L02
 486  0043 5f            	clrw	x
 487  0044 97            	ld	xl,a
 488  0045 58            	sllw	x
 489  0046 de0000        	ldw	x,(L22,x)
 490  0049 fc            	jp	(x)
 491  004a               L02:
 492  004a 203d          	jra	L702
 493  004c               L14:
 494                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 494                     ; 121   case ITC_IRQ_AWU:
 494                     ; 122   case ITC_IRQ_CLK:
 494                     ; 123   case ITC_IRQ_PORTA:
 494                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 496  004c c67f70        	ld	a,32624
 497  004f 1401          	and	a,(OFST-1,sp)
 498  0051 6b02          	ld	(OFST+0,sp),a
 500                     ; 125     break;
 502  0053 2034          	jra	L702
 503  0055               L34:
 504                     ; 127   case ITC_IRQ_PORTB:
 504                     ; 128   case ITC_IRQ_PORTC:
 504                     ; 129   case ITC_IRQ_PORTD:
 504                     ; 130   case ITC_IRQ_PORTE:
 504                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 506  0055 c67f71        	ld	a,32625
 507  0058 1401          	and	a,(OFST-1,sp)
 508  005a 6b02          	ld	(OFST+0,sp),a
 510                     ; 132     break;
 512  005c 202b          	jra	L702
 513  005e               L54:
 514                     ; 141   case ITC_IRQ_SPI:
 514                     ; 142   case ITC_IRQ_TIM1_OVF:
 514                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 516  005e c67f72        	ld	a,32626
 517  0061 1401          	and	a,(OFST-1,sp)
 518  0063 6b02          	ld	(OFST+0,sp),a
 520                     ; 144     break;
 522  0065 2022          	jra	L702
 523  0067               L74:
 524                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 524                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 524                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 524                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 524                     ; 150 #else
 524                     ; 151   case ITC_IRQ_TIM2_OVF:
 524                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 524                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 524                     ; 154   case ITC_IRQ_TIM3_OVF:
 524                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 526  0067 c67f73        	ld	a,32627
 527  006a 1401          	and	a,(OFST-1,sp)
 528  006c 6b02          	ld	(OFST+0,sp),a
 530                     ; 156     break;
 532  006e 2019          	jra	L702
 533  0070               L15:
 534                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 534                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 534                     ; 160     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 534                     ; 161   case ITC_IRQ_UART1_TX:
 534                     ; 162   case ITC_IRQ_UART1_RX:
 534                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 534                     ; 164 #if defined(STM8AF622x)
 534                     ; 165   case ITC_IRQ_UART4_TX:
 534                     ; 166   case ITC_IRQ_UART4_RX:
 534                     ; 167 #endif /*STM8AF622x */
 534                     ; 168   case ITC_IRQ_I2C:
 534                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 536  0070 c67f74        	ld	a,32628
 537  0073 1401          	and	a,(OFST-1,sp)
 538  0075 6b02          	ld	(OFST+0,sp),a
 540                     ; 170     break;
 542  0077 2010          	jra	L702
 543  0079               L35:
 544                     ; 178   case ITC_IRQ_UART3_TX:
 544                     ; 179   case ITC_IRQ_UART3_RX:
 544                     ; 180   case ITC_IRQ_ADC2:
 544                     ; 181 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 544                     ; 182 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 544                     ; 183     defined(STM8S903) || defined(STM8AF626x) || defined(STM8AF622x)
 544                     ; 184   case ITC_IRQ_ADC1:
 544                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 544                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 544                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 544                     ; 188 #else
 544                     ; 189   case ITC_IRQ_TIM4_OVF:
 544                     ; 190 #endif /*STM8S903 or STM8AF622x */
 544                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 546  0079 c67f75        	ld	a,32629
 547  007c 1401          	and	a,(OFST-1,sp)
 548  007e 6b02          	ld	(OFST+0,sp),a
 550                     ; 192     break;
 552  0080 2007          	jra	L702
 553  0082               L55:
 554                     ; 194   case ITC_IRQ_EEPROM_EEC:
 554                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 556  0082 c67f76        	ld	a,32630
 557  0085 1401          	and	a,(OFST-1,sp)
 558  0087 6b02          	ld	(OFST+0,sp),a
 560                     ; 196     break;
 562  0089               L75:
 563                     ; 198   default:
 563                     ; 199     break;
 565  0089               L702:
 566                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 568  0089 7b03          	ld	a,(OFST+1,sp)
 569  008b a403          	and	a,#3
 570  008d 48            	sll	a
 571  008e 5f            	clrw	x
 572  008f 97            	ld	xl,a
 573  0090 7b02          	ld	a,(OFST+0,sp)
 574  0092 5d            	tnzw	x
 575  0093 2704          	jreq	L42
 576  0095               L62:
 577  0095 44            	srl	a
 578  0096 5a            	decw	x
 579  0097 26fc          	jrne	L62
 580  0099               L42:
 581  0099 6b02          	ld	(OFST+0,sp),a
 583                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 585  009b 7b02          	ld	a,(OFST+0,sp)
 588  009d 5b03          	addw	sp,#3
 589  009f 81            	ret
 653                     	switch	.const
 654  0032               L44:
 655  0032 00d5          	dc.w	L112
 656  0034 00d5          	dc.w	L112
 657  0036 00d5          	dc.w	L112
 658  0038 00d5          	dc.w	L112
 659  003a 00e7          	dc.w	L312
 660  003c 00e7          	dc.w	L312
 661  003e 00e7          	dc.w	L312
 662  0040 00e7          	dc.w	L312
 663  0042 0151          	dc.w	L562
 664  0044 0151          	dc.w	L562
 665  0046 00f9          	dc.w	L512
 666  0048 00f9          	dc.w	L512
 667  004a 010b          	dc.w	L712
 668  004c 010b          	dc.w	L712
 669  004e 010b          	dc.w	L712
 670  0050 010b          	dc.w	L712
 671  0052 011d          	dc.w	L122
 672  0054 011d          	dc.w	L122
 673  0056 011d          	dc.w	L122
 674  0058 011d          	dc.w	L122
 675  005a 012f          	dc.w	L322
 676  005c 012f          	dc.w	L322
 677  005e 012f          	dc.w	L322
 678  0060 012f          	dc.w	L322
 679  0062 0141          	dc.w	L522
 680                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 680                     ; 221 {
 681                     	switch	.text
 682  00a0               _ITC_SetSoftwarePriority:
 684  00a0 89            	pushw	x
 685  00a1 89            	pushw	x
 686       00000002      OFST:	set	2
 689                     ; 222   uint8_t Mask = 0;
 691                     ; 223   uint8_t NewPriority = 0;
 693                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 695                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 697                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 699                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 701  00a2 9e            	ld	a,xh
 702  00a3 a403          	and	a,#3
 703  00a5 48            	sll	a
 704  00a6 5f            	clrw	x
 705  00a7 97            	ld	xl,a
 706  00a8 a603          	ld	a,#3
 707  00aa 5d            	tnzw	x
 708  00ab 2704          	jreq	L23
 709  00ad               L43:
 710  00ad 48            	sll	a
 711  00ae 5a            	decw	x
 712  00af 26fc          	jrne	L43
 713  00b1               L23:
 714  00b1 43            	cpl	a
 715  00b2 6b01          	ld	(OFST-1,sp),a
 717                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 719  00b4 7b03          	ld	a,(OFST+1,sp)
 720  00b6 a403          	and	a,#3
 721  00b8 48            	sll	a
 722  00b9 5f            	clrw	x
 723  00ba 97            	ld	xl,a
 724  00bb 7b04          	ld	a,(OFST+2,sp)
 725  00bd 5d            	tnzw	x
 726  00be 2704          	jreq	L63
 727  00c0               L04:
 728  00c0 48            	sll	a
 729  00c1 5a            	decw	x
 730  00c2 26fc          	jrne	L04
 731  00c4               L63:
 732  00c4 6b02          	ld	(OFST+0,sp),a
 734                     ; 239   switch (IrqNum)
 736  00c6 7b03          	ld	a,(OFST+1,sp)
 738                     ; 329   default:
 738                     ; 330     break;
 739  00c8 a119          	cp	a,#25
 740  00ca 2407          	jruge	L24
 741  00cc 5f            	clrw	x
 742  00cd 97            	ld	xl,a
 743  00ce 58            	sllw	x
 744  00cf de0032        	ldw	x,(L44,x)
 745  00d2 fc            	jp	(x)
 746  00d3               L24:
 747  00d3 207c          	jra	L562
 748  00d5               L112:
 749                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 749                     ; 242   case ITC_IRQ_AWU:
 749                     ; 243   case ITC_IRQ_CLK:
 749                     ; 244   case ITC_IRQ_PORTA:
 749                     ; 245     ITC->ISPR1 &= Mask;
 751  00d5 c67f70        	ld	a,32624
 752  00d8 1401          	and	a,(OFST-1,sp)
 753  00da c77f70        	ld	32624,a
 754                     ; 246     ITC->ISPR1 |= NewPriority;
 756  00dd c67f70        	ld	a,32624
 757  00e0 1a02          	or	a,(OFST+0,sp)
 758  00e2 c77f70        	ld	32624,a
 759                     ; 247     break;
 761  00e5 206a          	jra	L562
 762  00e7               L312:
 763                     ; 249   case ITC_IRQ_PORTB:
 763                     ; 250   case ITC_IRQ_PORTC:
 763                     ; 251   case ITC_IRQ_PORTD:
 763                     ; 252   case ITC_IRQ_PORTE:
 763                     ; 253     ITC->ISPR2 &= Mask;
 765  00e7 c67f71        	ld	a,32625
 766  00ea 1401          	and	a,(OFST-1,sp)
 767  00ec c77f71        	ld	32625,a
 768                     ; 254     ITC->ISPR2 |= NewPriority;
 770  00ef c67f71        	ld	a,32625
 771  00f2 1a02          	or	a,(OFST+0,sp)
 772  00f4 c77f71        	ld	32625,a
 773                     ; 255     break;
 775  00f7 2058          	jra	L562
 776  00f9               L512:
 777                     ; 264   case ITC_IRQ_SPI:
 777                     ; 265   case ITC_IRQ_TIM1_OVF:
 777                     ; 266     ITC->ISPR3 &= Mask;
 779  00f9 c67f72        	ld	a,32626
 780  00fc 1401          	and	a,(OFST-1,sp)
 781  00fe c77f72        	ld	32626,a
 782                     ; 267     ITC->ISPR3 |= NewPriority;
 784  0101 c67f72        	ld	a,32626
 785  0104 1a02          	or	a,(OFST+0,sp)
 786  0106 c77f72        	ld	32626,a
 787                     ; 268     break;
 789  0109 2046          	jra	L562
 790  010b               L712:
 791                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 791                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 791                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 791                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 791                     ; 274 #else
 791                     ; 275   case ITC_IRQ_TIM2_OVF:
 791                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 791                     ; 277 #endif /*STM8S903 or STM8AF622x */
 791                     ; 278   case ITC_IRQ_TIM3_OVF:
 791                     ; 279     ITC->ISPR4 &= Mask;
 793  010b c67f73        	ld	a,32627
 794  010e 1401          	and	a,(OFST-1,sp)
 795  0110 c77f73        	ld	32627,a
 796                     ; 280     ITC->ISPR4 |= NewPriority;
 798  0113 c67f73        	ld	a,32627
 799  0116 1a02          	or	a,(OFST+0,sp)
 800  0118 c77f73        	ld	32627,a
 801                     ; 281     break;
 803  011b 2034          	jra	L562
 804  011d               L122:
 805                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 805                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 805                     ; 285     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 805                     ; 286   case ITC_IRQ_UART1_TX:
 805                     ; 287   case ITC_IRQ_UART1_RX:
 805                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 805                     ; 289 #if defined(STM8AF622x)
 805                     ; 290   case ITC_IRQ_UART4_TX:
 805                     ; 291   case ITC_IRQ_UART4_RX:
 805                     ; 292 #endif /*STM8AF622x */
 805                     ; 293   case ITC_IRQ_I2C:
 805                     ; 294     ITC->ISPR5 &= Mask;
 807  011d c67f74        	ld	a,32628
 808  0120 1401          	and	a,(OFST-1,sp)
 809  0122 c77f74        	ld	32628,a
 810                     ; 295     ITC->ISPR5 |= NewPriority;
 812  0125 c67f74        	ld	a,32628
 813  0128 1a02          	or	a,(OFST+0,sp)
 814  012a c77f74        	ld	32628,a
 815                     ; 296     break;
 817  012d 2022          	jra	L562
 818  012f               L322:
 819                     ; 305   case ITC_IRQ_UART3_TX:
 819                     ; 306   case ITC_IRQ_UART3_RX:
 819                     ; 307   case ITC_IRQ_ADC2:
 819                     ; 308 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 819                     ; 309     
 819                     ; 310 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 819                     ; 311     defined(STM8S903) || defined(STM8AF626x) || defined (STM8AF622x)
 819                     ; 312   case ITC_IRQ_ADC1:
 819                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 819                     ; 314     
 819                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 819                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 819                     ; 317 #else
 819                     ; 318   case ITC_IRQ_TIM4_OVF:
 819                     ; 319 #endif /* STM8S903 or STM8AF622x */
 819                     ; 320     ITC->ISPR6 &= Mask;
 821  012f c67f75        	ld	a,32629
 822  0132 1401          	and	a,(OFST-1,sp)
 823  0134 c77f75        	ld	32629,a
 824                     ; 321     ITC->ISPR6 |= NewPriority;
 826  0137 c67f75        	ld	a,32629
 827  013a 1a02          	or	a,(OFST+0,sp)
 828  013c c77f75        	ld	32629,a
 829                     ; 322     break;
 831  013f 2010          	jra	L562
 832  0141               L522:
 833                     ; 324   case ITC_IRQ_EEPROM_EEC:
 833                     ; 325     ITC->ISPR7 &= Mask;
 835  0141 c67f76        	ld	a,32630
 836  0144 1401          	and	a,(OFST-1,sp)
 837  0146 c77f76        	ld	32630,a
 838                     ; 326     ITC->ISPR7 |= NewPriority;
 840  0149 c67f76        	ld	a,32630
 841  014c 1a02          	or	a,(OFST+0,sp)
 842  014e c77f76        	ld	32630,a
 843                     ; 327     break;
 845  0151               L722:
 846                     ; 329   default:
 846                     ; 330     break;
 848  0151               L562:
 849                     ; 332 }
 852  0151 5b04          	addw	sp,#4
 853  0153 81            	ret
 866                     	xdef	_ITC_GetSoftwarePriority
 867                     	xdef	_ITC_SetSoftwarePriority
 868                     	xdef	_ITC_GetSoftIntStatus
 869                     	xdef	_ITC_DeInit
 870                     	xdef	_ITC_GetCPUCC
 889                     	end
