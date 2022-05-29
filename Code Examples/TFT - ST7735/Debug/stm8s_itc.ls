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
 405                     .const:	section	.text
 406  0000               L22:
 407  0000 004c          	dc.w	L14
 408  0002 004c          	dc.w	L14
 409  0004 004c          	dc.w	L14
 410  0006 004c          	dc.w	L14
 411  0008 0055          	dc.w	L34
 412  000a 0055          	dc.w	L34
 413  000c 0055          	dc.w	L34
 414  000e 0055          	dc.w	L34
 415  0010 0089          	dc.w	L302
 416  0012 0089          	dc.w	L302
 417  0014 005e          	dc.w	L54
 418  0016 005e          	dc.w	L54
 419  0018 0067          	dc.w	L74
 420  001a 0067          	dc.w	L74
 421  001c 0067          	dc.w	L74
 422  001e 0067          	dc.w	L74
 423  0020 0070          	dc.w	L15
 424  0022 0089          	dc.w	L302
 425  0024 0089          	dc.w	L302
 426  0026 0070          	dc.w	L15
 427  0028 0079          	dc.w	L35
 428  002a 0079          	dc.w	L35
 429  002c 0079          	dc.w	L35
 430  002e 0079          	dc.w	L35
 431  0030 0082          	dc.w	L55
 432                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 432                     ; 108 {
 433                     	switch	.text
 434  0029               _ITC_GetSoftwarePriority:
 436  0029 88            	push	a
 437  002a 89            	pushw	x
 438       00000002      OFST:	set	2
 441                     ; 109   uint8_t Value = 0;
 443  002b 0f02          	clr	(OFST+0,sp)
 445                     ; 110   uint8_t Mask = 0;
 447                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 449                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 451  002d a403          	and	a,#3
 452  002f 48            	sll	a
 453  0030 5f            	clrw	x
 454  0031 97            	ld	xl,a
 455  0032 a603          	ld	a,#3
 456  0034 5d            	tnzw	x
 457  0035 2704          	jreq	L41
 458  0037               L61:
 459  0037 48            	sll	a
 460  0038 5a            	decw	x
 461  0039 26fc          	jrne	L61
 462  003b               L41:
 463  003b 6b01          	ld	(OFST-1,sp),a
 465                     ; 118   switch (IrqNum)
 467  003d 7b03          	ld	a,(OFST+1,sp)
 469                     ; 198   default:
 469                     ; 199     break;
 470  003f a119          	cp	a,#25
 471  0041 2407          	jruge	L02
 472  0043 5f            	clrw	x
 473  0044 97            	ld	xl,a
 474  0045 58            	sllw	x
 475  0046 de0000        	ldw	x,(L22,x)
 476  0049 fc            	jp	(x)
 477  004a               L02:
 478  004a 203d          	jra	L302
 479  004c               L14:
 480                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 480                     ; 121   case ITC_IRQ_AWU:
 480                     ; 122   case ITC_IRQ_CLK:
 480                     ; 123   case ITC_IRQ_PORTA:
 480                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 482  004c c67f70        	ld	a,32624
 483  004f 1401          	and	a,(OFST-1,sp)
 484  0051 6b02          	ld	(OFST+0,sp),a
 486                     ; 125     break;
 488  0053 2034          	jra	L302
 489  0055               L34:
 490                     ; 127   case ITC_IRQ_PORTB:
 490                     ; 128   case ITC_IRQ_PORTC:
 490                     ; 129   case ITC_IRQ_PORTD:
 490                     ; 130   case ITC_IRQ_PORTE:
 490                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 492  0055 c67f71        	ld	a,32625
 493  0058 1401          	and	a,(OFST-1,sp)
 494  005a 6b02          	ld	(OFST+0,sp),a
 496                     ; 132     break;
 498  005c 202b          	jra	L302
 499  005e               L54:
 500                     ; 141   case ITC_IRQ_SPI:
 500                     ; 142   case ITC_IRQ_TIM1_OVF:
 500                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 502  005e c67f72        	ld	a,32626
 503  0061 1401          	and	a,(OFST-1,sp)
 504  0063 6b02          	ld	(OFST+0,sp),a
 506                     ; 144     break;
 508  0065 2022          	jra	L302
 509  0067               L74:
 510                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 510                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 510                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 510                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 510                     ; 150 #else
 510                     ; 151   case ITC_IRQ_TIM2_OVF:
 510                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 510                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 510                     ; 154   case ITC_IRQ_TIM3_OVF:
 510                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 512  0067 c67f73        	ld	a,32627
 513  006a 1401          	and	a,(OFST-1,sp)
 514  006c 6b02          	ld	(OFST+0,sp),a
 516                     ; 156     break;
 518  006e 2019          	jra	L302
 519  0070               L15:
 520                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 520                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 520                     ; 160     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 520                     ; 161   case ITC_IRQ_UART1_TX:
 520                     ; 162   case ITC_IRQ_UART1_RX:
 520                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 520                     ; 164 #if defined(STM8AF622x)
 520                     ; 165   case ITC_IRQ_UART4_TX:
 520                     ; 166   case ITC_IRQ_UART4_RX:
 520                     ; 167 #endif /*STM8AF622x */
 520                     ; 168   case ITC_IRQ_I2C:
 520                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 522  0070 c67f74        	ld	a,32628
 523  0073 1401          	and	a,(OFST-1,sp)
 524  0075 6b02          	ld	(OFST+0,sp),a
 526                     ; 170     break;
 528  0077 2010          	jra	L302
 529  0079               L35:
 530                     ; 173   case ITC_IRQ_UART2_TX:
 530                     ; 174   case ITC_IRQ_UART2_RX:
 530                     ; 175 #endif /*STM8S105 or STM8AF626x*/
 530                     ; 176 #if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || \
 530                     ; 177     defined(STM8AF62Ax)
 530                     ; 178   case ITC_IRQ_UART3_TX:
 530                     ; 179   case ITC_IRQ_UART3_RX:
 530                     ; 180   case ITC_IRQ_ADC2:
 530                     ; 181 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 530                     ; 182 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 530                     ; 183     defined(STM8S903) || defined(STM8AF626x) || defined(STM8AF622x)
 530                     ; 184   case ITC_IRQ_ADC1:
 530                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 530                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 530                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 530                     ; 188 #else
 530                     ; 189   case ITC_IRQ_TIM4_OVF:
 530                     ; 190 #endif /*STM8S903 or STM8AF622x */
 530                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 532  0079 c67f75        	ld	a,32629
 533  007c 1401          	and	a,(OFST-1,sp)
 534  007e 6b02          	ld	(OFST+0,sp),a
 536                     ; 192     break;
 538  0080 2007          	jra	L302
 539  0082               L55:
 540                     ; 194   case ITC_IRQ_EEPROM_EEC:
 540                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 542  0082 c67f76        	ld	a,32630
 543  0085 1401          	and	a,(OFST-1,sp)
 544  0087 6b02          	ld	(OFST+0,sp),a
 546                     ; 196     break;
 548  0089               L75:
 549                     ; 198   default:
 549                     ; 199     break;
 551  0089               L302:
 552                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 554  0089 7b03          	ld	a,(OFST+1,sp)
 555  008b a403          	and	a,#3
 556  008d 48            	sll	a
 557  008e 5f            	clrw	x
 558  008f 97            	ld	xl,a
 559  0090 7b02          	ld	a,(OFST+0,sp)
 560  0092 5d            	tnzw	x
 561  0093 2704          	jreq	L42
 562  0095               L62:
 563  0095 44            	srl	a
 564  0096 5a            	decw	x
 565  0097 26fc          	jrne	L62
 566  0099               L42:
 567  0099 6b02          	ld	(OFST+0,sp),a
 569                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 571  009b 7b02          	ld	a,(OFST+0,sp)
 574  009d 5b03          	addw	sp,#3
 575  009f 81            	ret
 639                     	switch	.const
 640  0032               L44:
 641  0032 00d5          	dc.w	L502
 642  0034 00d5          	dc.w	L502
 643  0036 00d5          	dc.w	L502
 644  0038 00d5          	dc.w	L502
 645  003a 00e7          	dc.w	L702
 646  003c 00e7          	dc.w	L702
 647  003e 00e7          	dc.w	L702
 648  0040 00e7          	dc.w	L702
 649  0042 0151          	dc.w	L162
 650  0044 0151          	dc.w	L162
 651  0046 00f9          	dc.w	L112
 652  0048 00f9          	dc.w	L112
 653  004a 010b          	dc.w	L312
 654  004c 010b          	dc.w	L312
 655  004e 010b          	dc.w	L312
 656  0050 010b          	dc.w	L312
 657  0052 011d          	dc.w	L512
 658  0054 0151          	dc.w	L162
 659  0056 0151          	dc.w	L162
 660  0058 011d          	dc.w	L512
 661  005a 012f          	dc.w	L712
 662  005c 012f          	dc.w	L712
 663  005e 012f          	dc.w	L712
 664  0060 012f          	dc.w	L712
 665  0062 0141          	dc.w	L122
 666                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 666                     ; 221 {
 667                     	switch	.text
 668  00a0               _ITC_SetSoftwarePriority:
 670  00a0 89            	pushw	x
 671  00a1 89            	pushw	x
 672       00000002      OFST:	set	2
 675                     ; 222   uint8_t Mask = 0;
 677                     ; 223   uint8_t NewPriority = 0;
 679                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 681                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 683                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 685                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 687  00a2 9e            	ld	a,xh
 688  00a3 a403          	and	a,#3
 689  00a5 48            	sll	a
 690  00a6 5f            	clrw	x
 691  00a7 97            	ld	xl,a
 692  00a8 a603          	ld	a,#3
 693  00aa 5d            	tnzw	x
 694  00ab 2704          	jreq	L23
 695  00ad               L43:
 696  00ad 48            	sll	a
 697  00ae 5a            	decw	x
 698  00af 26fc          	jrne	L43
 699  00b1               L23:
 700  00b1 43            	cpl	a
 701  00b2 6b01          	ld	(OFST-1,sp),a
 703                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 705  00b4 7b03          	ld	a,(OFST+1,sp)
 706  00b6 a403          	and	a,#3
 707  00b8 48            	sll	a
 708  00b9 5f            	clrw	x
 709  00ba 97            	ld	xl,a
 710  00bb 7b04          	ld	a,(OFST+2,sp)
 711  00bd 5d            	tnzw	x
 712  00be 2704          	jreq	L63
 713  00c0               L04:
 714  00c0 48            	sll	a
 715  00c1 5a            	decw	x
 716  00c2 26fc          	jrne	L04
 717  00c4               L63:
 718  00c4 6b02          	ld	(OFST+0,sp),a
 720                     ; 239   switch (IrqNum)
 722  00c6 7b03          	ld	a,(OFST+1,sp)
 724                     ; 329   default:
 724                     ; 330     break;
 725  00c8 a119          	cp	a,#25
 726  00ca 2407          	jruge	L24
 727  00cc 5f            	clrw	x
 728  00cd 97            	ld	xl,a
 729  00ce 58            	sllw	x
 730  00cf de0032        	ldw	x,(L44,x)
 731  00d2 fc            	jp	(x)
 732  00d3               L24:
 733  00d3 207c          	jra	L162
 734  00d5               L502:
 735                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 735                     ; 242   case ITC_IRQ_AWU:
 735                     ; 243   case ITC_IRQ_CLK:
 735                     ; 244   case ITC_IRQ_PORTA:
 735                     ; 245     ITC->ISPR1 &= Mask;
 737  00d5 c67f70        	ld	a,32624
 738  00d8 1401          	and	a,(OFST-1,sp)
 739  00da c77f70        	ld	32624,a
 740                     ; 246     ITC->ISPR1 |= NewPriority;
 742  00dd c67f70        	ld	a,32624
 743  00e0 1a02          	or	a,(OFST+0,sp)
 744  00e2 c77f70        	ld	32624,a
 745                     ; 247     break;
 747  00e5 206a          	jra	L162
 748  00e7               L702:
 749                     ; 249   case ITC_IRQ_PORTB:
 749                     ; 250   case ITC_IRQ_PORTC:
 749                     ; 251   case ITC_IRQ_PORTD:
 749                     ; 252   case ITC_IRQ_PORTE:
 749                     ; 253     ITC->ISPR2 &= Mask;
 751  00e7 c67f71        	ld	a,32625
 752  00ea 1401          	and	a,(OFST-1,sp)
 753  00ec c77f71        	ld	32625,a
 754                     ; 254     ITC->ISPR2 |= NewPriority;
 756  00ef c67f71        	ld	a,32625
 757  00f2 1a02          	or	a,(OFST+0,sp)
 758  00f4 c77f71        	ld	32625,a
 759                     ; 255     break;
 761  00f7 2058          	jra	L162
 762  00f9               L112:
 763                     ; 264   case ITC_IRQ_SPI:
 763                     ; 265   case ITC_IRQ_TIM1_OVF:
 763                     ; 266     ITC->ISPR3 &= Mask;
 765  00f9 c67f72        	ld	a,32626
 766  00fc 1401          	and	a,(OFST-1,sp)
 767  00fe c77f72        	ld	32626,a
 768                     ; 267     ITC->ISPR3 |= NewPriority;
 770  0101 c67f72        	ld	a,32626
 771  0104 1a02          	or	a,(OFST+0,sp)
 772  0106 c77f72        	ld	32626,a
 773                     ; 268     break;
 775  0109 2046          	jra	L162
 776  010b               L312:
 777                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 777                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 777                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 777                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 777                     ; 274 #else
 777                     ; 275   case ITC_IRQ_TIM2_OVF:
 777                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 777                     ; 277 #endif /*STM8S903 or STM8AF622x */
 777                     ; 278   case ITC_IRQ_TIM3_OVF:
 777                     ; 279     ITC->ISPR4 &= Mask;
 779  010b c67f73        	ld	a,32627
 780  010e 1401          	and	a,(OFST-1,sp)
 781  0110 c77f73        	ld	32627,a
 782                     ; 280     ITC->ISPR4 |= NewPriority;
 784  0113 c67f73        	ld	a,32627
 785  0116 1a02          	or	a,(OFST+0,sp)
 786  0118 c77f73        	ld	32627,a
 787                     ; 281     break;
 789  011b 2034          	jra	L162
 790  011d               L512:
 791                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 791                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 791                     ; 285     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 791                     ; 286   case ITC_IRQ_UART1_TX:
 791                     ; 287   case ITC_IRQ_UART1_RX:
 791                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 791                     ; 289 #if defined(STM8AF622x)
 791                     ; 290   case ITC_IRQ_UART4_TX:
 791                     ; 291   case ITC_IRQ_UART4_RX:
 791                     ; 292 #endif /*STM8AF622x */
 791                     ; 293   case ITC_IRQ_I2C:
 791                     ; 294     ITC->ISPR5 &= Mask;
 793  011d c67f74        	ld	a,32628
 794  0120 1401          	and	a,(OFST-1,sp)
 795  0122 c77f74        	ld	32628,a
 796                     ; 295     ITC->ISPR5 |= NewPriority;
 798  0125 c67f74        	ld	a,32628
 799  0128 1a02          	or	a,(OFST+0,sp)
 800  012a c77f74        	ld	32628,a
 801                     ; 296     break;
 803  012d 2022          	jra	L162
 804  012f               L712:
 805                     ; 299   case ITC_IRQ_UART2_TX:
 805                     ; 300   case ITC_IRQ_UART2_RX:
 805                     ; 301 #endif /*STM8S105 or STM8AF626x */
 805                     ; 302     
 805                     ; 303 #if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || \
 805                     ; 304     defined(STM8AF62Ax)
 805                     ; 305   case ITC_IRQ_UART3_TX:
 805                     ; 306   case ITC_IRQ_UART3_RX:
 805                     ; 307   case ITC_IRQ_ADC2:
 805                     ; 308 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 805                     ; 309     
 805                     ; 310 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 805                     ; 311     defined(STM8S903) || defined(STM8AF626x) || defined (STM8AF622x)
 805                     ; 312   case ITC_IRQ_ADC1:
 805                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 805                     ; 314     
 805                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 805                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 805                     ; 317 #else
 805                     ; 318   case ITC_IRQ_TIM4_OVF:
 805                     ; 319 #endif /* STM8S903 or STM8AF622x */
 805                     ; 320     ITC->ISPR6 &= Mask;
 807  012f c67f75        	ld	a,32629
 808  0132 1401          	and	a,(OFST-1,sp)
 809  0134 c77f75        	ld	32629,a
 810                     ; 321     ITC->ISPR6 |= NewPriority;
 812  0137 c67f75        	ld	a,32629
 813  013a 1a02          	or	a,(OFST+0,sp)
 814  013c c77f75        	ld	32629,a
 815                     ; 322     break;
 817  013f 2010          	jra	L162
 818  0141               L122:
 819                     ; 324   case ITC_IRQ_EEPROM_EEC:
 819                     ; 325     ITC->ISPR7 &= Mask;
 821  0141 c67f76        	ld	a,32630
 822  0144 1401          	and	a,(OFST-1,sp)
 823  0146 c77f76        	ld	32630,a
 824                     ; 326     ITC->ISPR7 |= NewPriority;
 826  0149 c67f76        	ld	a,32630
 827  014c 1a02          	or	a,(OFST+0,sp)
 828  014e c77f76        	ld	32630,a
 829                     ; 327     break;
 831  0151               L322:
 832                     ; 329   default:
 832                     ; 330     break;
 834  0151               L162:
 835                     ; 332 }
 838  0151 5b04          	addw	sp,#4
 839  0153 81            	ret
 852                     	xdef	_ITC_GetSoftwarePriority
 853                     	xdef	_ITC_SetSoftwarePriority
 854                     	xdef	_ITC_GetSoftIntStatus
 855                     	xdef	_ITC_DeInit
 856                     	xdef	_ITC_GetCPUCC
 875                     	end
