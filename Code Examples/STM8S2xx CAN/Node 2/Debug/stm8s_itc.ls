   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
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
 429                     .const:	section	.text
 430  0000               L22:
 431  0000 004c          	dc.w	L14
 432  0002 004c          	dc.w	L14
 433  0004 004c          	dc.w	L14
 434  0006 004c          	dc.w	L14
 435  0008 0055          	dc.w	L34
 436  000a 0055          	dc.w	L34
 437  000c 0055          	dc.w	L34
 438  000e 0055          	dc.w	L34
 439  0010 005e          	dc.w	L54
 440  0012 005e          	dc.w	L54
 441  0014 005e          	dc.w	L54
 442  0016 005e          	dc.w	L54
 443  0018 0067          	dc.w	L74
 444  001a 0067          	dc.w	L74
 445  001c 0067          	dc.w	L74
 446  001e 0067          	dc.w	L74
 447  0020 0070          	dc.w	L15
 448  0022 0070          	dc.w	L15
 449  0024 0070          	dc.w	L15
 450  0026 0070          	dc.w	L15
 451  0028 0079          	dc.w	L35
 452  002a 0079          	dc.w	L35
 453  002c 0079          	dc.w	L35
 454  002e 0079          	dc.w	L35
 455  0030 0082          	dc.w	L55
 456                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 456                     ; 108 {
 457                     	switch	.text
 458  0029               _ITC_GetSoftwarePriority:
 460  0029 88            	push	a
 461  002a 89            	pushw	x
 462       00000002      OFST:	set	2
 465                     ; 109   uint8_t Value = 0;
 467  002b 0f02          	clr	(OFST+0,sp)
 469                     ; 110   uint8_t Mask = 0;
 471                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 473                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 475  002d a403          	and	a,#3
 476  002f 48            	sll	a
 477  0030 5f            	clrw	x
 478  0031 97            	ld	xl,a
 479  0032 a603          	ld	a,#3
 480  0034 5d            	tnzw	x
 481  0035 2704          	jreq	L41
 482  0037               L61:
 483  0037 48            	sll	a
 484  0038 5a            	decw	x
 485  0039 26fc          	jrne	L61
 486  003b               L41:
 487  003b 6b01          	ld	(OFST-1,sp),a
 489                     ; 118   switch (IrqNum)
 491  003d 7b03          	ld	a,(OFST+1,sp)
 493                     ; 198   default:
 493                     ; 199     break;
 494  003f a119          	cp	a,#25
 495  0041 2407          	jruge	L02
 496  0043 5f            	clrw	x
 497  0044 97            	ld	xl,a
 498  0045 58            	sllw	x
 499  0046 de0000        	ldw	x,(L22,x)
 500  0049 fc            	jp	(x)
 501  004a               L02:
 502  004a 203d          	jra	L702
 503  004c               L14:
 504                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 504                     ; 121   case ITC_IRQ_AWU:
 504                     ; 122   case ITC_IRQ_CLK:
 504                     ; 123   case ITC_IRQ_PORTA:
 504                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 506  004c c67f70        	ld	a,32624
 507  004f 1401          	and	a,(OFST-1,sp)
 508  0051 6b02          	ld	(OFST+0,sp),a
 510                     ; 125     break;
 512  0053 2034          	jra	L702
 513  0055               L34:
 514                     ; 127   case ITC_IRQ_PORTB:
 514                     ; 128   case ITC_IRQ_PORTC:
 514                     ; 129   case ITC_IRQ_PORTD:
 514                     ; 130   case ITC_IRQ_PORTE:
 514                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 516  0055 c67f71        	ld	a,32625
 517  0058 1401          	and	a,(OFST-1,sp)
 518  005a 6b02          	ld	(OFST+0,sp),a
 520                     ; 132     break;
 522  005c 202b          	jra	L702
 523  005e               L54:
 524                     ; 135   case ITC_IRQ_CAN_RX:
 524                     ; 136   case ITC_IRQ_CAN_TX:
 524                     ; 137 #endif /*STM8S208 or STM8AF52Ax */
 524                     ; 138 #if defined(STM8S903) || defined(STM8AF622x)
 524                     ; 139   case ITC_IRQ_PORTF:
 524                     ; 140 #endif /*STM8S903 or STM8AF622x */
 524                     ; 141   case ITC_IRQ_SPI:
 524                     ; 142   case ITC_IRQ_TIM1_OVF:
 524                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 526  005e c67f72        	ld	a,32626
 527  0061 1401          	and	a,(OFST-1,sp)
 528  0063 6b02          	ld	(OFST+0,sp),a
 530                     ; 144     break;
 532  0065 2022          	jra	L702
 533  0067               L74:
 534                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 534                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 534                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 534                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 534                     ; 150 #else
 534                     ; 151   case ITC_IRQ_TIM2_OVF:
 534                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 534                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 534                     ; 154   case ITC_IRQ_TIM3_OVF:
 534                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 536  0067 c67f73        	ld	a,32627
 537  006a 1401          	and	a,(OFST-1,sp)
 538  006c 6b02          	ld	(OFST+0,sp),a
 540                     ; 156     break;
 542  006e 2019          	jra	L702
 543  0070               L15:
 544                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 544                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 544                     ; 160     defined(STM8S003) ||defined(STM8S001) || defined (STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 544                     ; 161   case ITC_IRQ_UART1_TX:
 544                     ; 162   case ITC_IRQ_UART1_RX:
 544                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 544                     ; 164 #if defined(STM8AF622x)
 544                     ; 165   case ITC_IRQ_UART4_TX:
 544                     ; 166   case ITC_IRQ_UART4_RX:
 544                     ; 167 #endif /*STM8AF622x */
 544                     ; 168   case ITC_IRQ_I2C:
 544                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 546  0070 c67f74        	ld	a,32628
 547  0073 1401          	and	a,(OFST-1,sp)
 548  0075 6b02          	ld	(OFST+0,sp),a
 550                     ; 170     break;
 552  0077 2010          	jra	L702
 553  0079               L35:
 554                     ; 178   case ITC_IRQ_UART3_TX:
 554                     ; 179   case ITC_IRQ_UART3_RX:
 554                     ; 180   case ITC_IRQ_ADC2:
 554                     ; 181 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 554                     ; 182 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 554                     ; 183     defined(STM8S001) || defined(STM8S903) || defined(STM8AF626x) || defined(STM8AF622x)
 554                     ; 184   case ITC_IRQ_ADC1:
 554                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 554                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 554                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 554                     ; 188 #else
 554                     ; 189   case ITC_IRQ_TIM4_OVF:
 554                     ; 190 #endif /*STM8S903 or STM8AF622x */
 554                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 556  0079 c67f75        	ld	a,32629
 557  007c 1401          	and	a,(OFST-1,sp)
 558  007e 6b02          	ld	(OFST+0,sp),a
 560                     ; 192     break;
 562  0080 2007          	jra	L702
 563  0082               L55:
 564                     ; 194   case ITC_IRQ_EEPROM_EEC:
 564                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 566  0082 c67f76        	ld	a,32630
 567  0085 1401          	and	a,(OFST-1,sp)
 568  0087 6b02          	ld	(OFST+0,sp),a
 570                     ; 196     break;
 572  0089               L75:
 573                     ; 198   default:
 573                     ; 199     break;
 575  0089               L702:
 576                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 578  0089 7b03          	ld	a,(OFST+1,sp)
 579  008b a403          	and	a,#3
 580  008d 48            	sll	a
 581  008e 5f            	clrw	x
 582  008f 97            	ld	xl,a
 583  0090 7b02          	ld	a,(OFST+0,sp)
 584  0092 5d            	tnzw	x
 585  0093 2704          	jreq	L42
 586  0095               L62:
 587  0095 44            	srl	a
 588  0096 5a            	decw	x
 589  0097 26fc          	jrne	L62
 590  0099               L42:
 591  0099 6b02          	ld	(OFST+0,sp),a
 593                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 595  009b 7b02          	ld	a,(OFST+0,sp)
 598  009d 5b03          	addw	sp,#3
 599  009f 81            	ret
 659                     	switch	.const
 660  0032               L44:
 661  0032 00d5          	dc.w	L112
 662  0034 00d5          	dc.w	L112
 663  0036 00d5          	dc.w	L112
 664  0038 00d5          	dc.w	L112
 665  003a 00e7          	dc.w	L312
 666  003c 00e7          	dc.w	L312
 667  003e 00e7          	dc.w	L312
 668  0040 00e7          	dc.w	L312
 669  0042 00f9          	dc.w	L512
 670  0044 00f9          	dc.w	L512
 671  0046 00f9          	dc.w	L512
 672  0048 00f9          	dc.w	L512
 673  004a 010b          	dc.w	L712
 674  004c 010b          	dc.w	L712
 675  004e 010b          	dc.w	L712
 676  0050 010b          	dc.w	L712
 677  0052 011d          	dc.w	L122
 678  0054 011d          	dc.w	L122
 679  0056 011d          	dc.w	L122
 680  0058 011d          	dc.w	L122
 681  005a 012f          	dc.w	L322
 682  005c 012f          	dc.w	L322
 683  005e 012f          	dc.w	L322
 684  0060 012f          	dc.w	L322
 685  0062 0141          	dc.w	L522
 686                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 686                     ; 221 {
 687                     	switch	.text
 688  00a0               _ITC_SetSoftwarePriority:
 690  00a0 89            	pushw	x
 691  00a1 89            	pushw	x
 692       00000002      OFST:	set	2
 695                     ; 222   uint8_t Mask = 0;
 697                     ; 223   uint8_t NewPriority = 0;
 699                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 701                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 703                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 705                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 707  00a2 9e            	ld	a,xh
 708  00a3 a403          	and	a,#3
 709  00a5 48            	sll	a
 710  00a6 5f            	clrw	x
 711  00a7 97            	ld	xl,a
 712  00a8 a603          	ld	a,#3
 713  00aa 5d            	tnzw	x
 714  00ab 2704          	jreq	L23
 715  00ad               L43:
 716  00ad 48            	sll	a
 717  00ae 5a            	decw	x
 718  00af 26fc          	jrne	L43
 719  00b1               L23:
 720  00b1 43            	cpl	a
 721  00b2 6b01          	ld	(OFST-1,sp),a
 723                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 725  00b4 7b03          	ld	a,(OFST+1,sp)
 726  00b6 a403          	and	a,#3
 727  00b8 48            	sll	a
 728  00b9 5f            	clrw	x
 729  00ba 97            	ld	xl,a
 730  00bb 7b04          	ld	a,(OFST+2,sp)
 731  00bd 5d            	tnzw	x
 732  00be 2704          	jreq	L63
 733  00c0               L04:
 734  00c0 48            	sll	a
 735  00c1 5a            	decw	x
 736  00c2 26fc          	jrne	L04
 737  00c4               L63:
 738  00c4 6b02          	ld	(OFST+0,sp),a
 740                     ; 239   switch (IrqNum)
 742  00c6 7b03          	ld	a,(OFST+1,sp)
 744                     ; 329   default:
 744                     ; 330     break;
 745  00c8 a119          	cp	a,#25
 746  00ca 2407          	jruge	L24
 747  00cc 5f            	clrw	x
 748  00cd 97            	ld	xl,a
 749  00ce 58            	sllw	x
 750  00cf de0032        	ldw	x,(L44,x)
 751  00d2 fc            	jp	(x)
 752  00d3               L24:
 753  00d3 207c          	jra	L162
 754  00d5               L112:
 755                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 755                     ; 242   case ITC_IRQ_AWU:
 755                     ; 243   case ITC_IRQ_CLK:
 755                     ; 244   case ITC_IRQ_PORTA:
 755                     ; 245     ITC->ISPR1 &= Mask;
 757  00d5 c67f70        	ld	a,32624
 758  00d8 1401          	and	a,(OFST-1,sp)
 759  00da c77f70        	ld	32624,a
 760                     ; 246     ITC->ISPR1 |= NewPriority;
 762  00dd c67f70        	ld	a,32624
 763  00e0 1a02          	or	a,(OFST+0,sp)
 764  00e2 c77f70        	ld	32624,a
 765                     ; 247     break;
 767  00e5 206a          	jra	L162
 768  00e7               L312:
 769                     ; 249   case ITC_IRQ_PORTB:
 769                     ; 250   case ITC_IRQ_PORTC:
 769                     ; 251   case ITC_IRQ_PORTD:
 769                     ; 252   case ITC_IRQ_PORTE:
 769                     ; 253     ITC->ISPR2 &= Mask;
 771  00e7 c67f71        	ld	a,32625
 772  00ea 1401          	and	a,(OFST-1,sp)
 773  00ec c77f71        	ld	32625,a
 774                     ; 254     ITC->ISPR2 |= NewPriority;
 776  00ef c67f71        	ld	a,32625
 777  00f2 1a02          	or	a,(OFST+0,sp)
 778  00f4 c77f71        	ld	32625,a
 779                     ; 255     break;
 781  00f7 2058          	jra	L162
 782  00f9               L512:
 783                     ; 258   case ITC_IRQ_CAN_RX:
 783                     ; 259   case ITC_IRQ_CAN_TX:
 783                     ; 260 #endif /*STM8S208 or STM8AF52Ax */
 783                     ; 261 #if defined(STM8S903) || defined(STM8AF622x)
 783                     ; 262   case ITC_IRQ_PORTF:
 783                     ; 263 #endif /*STM8S903 or STM8AF622x */
 783                     ; 264   case ITC_IRQ_SPI:
 783                     ; 265   case ITC_IRQ_TIM1_OVF:
 783                     ; 266     ITC->ISPR3 &= Mask;
 785  00f9 c67f72        	ld	a,32626
 786  00fc 1401          	and	a,(OFST-1,sp)
 787  00fe c77f72        	ld	32626,a
 788                     ; 267     ITC->ISPR3 |= NewPriority;
 790  0101 c67f72        	ld	a,32626
 791  0104 1a02          	or	a,(OFST+0,sp)
 792  0106 c77f72        	ld	32626,a
 793                     ; 268     break;
 795  0109 2046          	jra	L162
 796  010b               L712:
 797                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 797                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 797                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 797                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 797                     ; 274 #else
 797                     ; 275   case ITC_IRQ_TIM2_OVF:
 797                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 797                     ; 277 #endif /*STM8S903 or STM8AF622x */
 797                     ; 278   case ITC_IRQ_TIM3_OVF:
 797                     ; 279     ITC->ISPR4 &= Mask;
 799  010b c67f73        	ld	a,32627
 800  010e 1401          	and	a,(OFST-1,sp)
 801  0110 c77f73        	ld	32627,a
 802                     ; 280     ITC->ISPR4 |= NewPriority;
 804  0113 c67f73        	ld	a,32627
 805  0116 1a02          	or	a,(OFST+0,sp)
 806  0118 c77f73        	ld	32627,a
 807                     ; 281     break;
 809  011b 2034          	jra	L162
 810  011d               L122:
 811                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 811                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 811                     ; 285     defined(STM8S001) ||defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 811                     ; 286   case ITC_IRQ_UART1_TX:
 811                     ; 287   case ITC_IRQ_UART1_RX:
 811                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 811                     ; 289 #if defined(STM8AF622x)
 811                     ; 290   case ITC_IRQ_UART4_TX:
 811                     ; 291   case ITC_IRQ_UART4_RX:
 811                     ; 292 #endif /*STM8AF622x */
 811                     ; 293   case ITC_IRQ_I2C:
 811                     ; 294     ITC->ISPR5 &= Mask;
 813  011d c67f74        	ld	a,32628
 814  0120 1401          	and	a,(OFST-1,sp)
 815  0122 c77f74        	ld	32628,a
 816                     ; 295     ITC->ISPR5 |= NewPriority;
 818  0125 c67f74        	ld	a,32628
 819  0128 1a02          	or	a,(OFST+0,sp)
 820  012a c77f74        	ld	32628,a
 821                     ; 296     break;
 823  012d 2022          	jra	L162
 824  012f               L322:
 825                     ; 305   case ITC_IRQ_UART3_TX:
 825                     ; 306   case ITC_IRQ_UART3_RX:
 825                     ; 307   case ITC_IRQ_ADC2:
 825                     ; 308 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 825                     ; 309     
 825                     ; 310 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 825                     ; 311     defined(STM8S001) || defined(STM8S903) || defined(STM8AF626x) || defined (STM8AF622x)
 825                     ; 312   case ITC_IRQ_ADC1:
 825                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 825                     ; 314     
 825                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 825                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 825                     ; 317 #else
 825                     ; 318   case ITC_IRQ_TIM4_OVF:
 825                     ; 319 #endif /* STM8S903 or STM8AF622x */
 825                     ; 320     ITC->ISPR6 &= Mask;
 827  012f c67f75        	ld	a,32629
 828  0132 1401          	and	a,(OFST-1,sp)
 829  0134 c77f75        	ld	32629,a
 830                     ; 321     ITC->ISPR6 |= NewPriority;
 832  0137 c67f75        	ld	a,32629
 833  013a 1a02          	or	a,(OFST+0,sp)
 834  013c c77f75        	ld	32629,a
 835                     ; 322     break;
 837  013f 2010          	jra	L162
 838  0141               L522:
 839                     ; 324   case ITC_IRQ_EEPROM_EEC:
 839                     ; 325     ITC->ISPR7 &= Mask;
 841  0141 c67f76        	ld	a,32630
 842  0144 1401          	and	a,(OFST-1,sp)
 843  0146 c77f76        	ld	32630,a
 844                     ; 326     ITC->ISPR7 |= NewPriority;
 846  0149 c67f76        	ld	a,32630
 847  014c 1a02          	or	a,(OFST+0,sp)
 848  014e c77f76        	ld	32630,a
 849                     ; 327     break;
 851  0151               L722:
 852                     ; 329   default:
 852                     ; 330     break;
 854  0151               L162:
 855                     ; 332 }
 858  0151 5b04          	addw	sp,#4
 859  0153 81            	ret
 872                     	xdef	_ITC_GetSoftwarePriority
 873                     	xdef	_ITC_SetSoftwarePriority
 874                     	xdef	_ITC_GetSoftIntStatus
 875                     	xdef	_ITC_DeInit
 876                     	xdef	_ITC_GetCPUCC
 895                     	end
