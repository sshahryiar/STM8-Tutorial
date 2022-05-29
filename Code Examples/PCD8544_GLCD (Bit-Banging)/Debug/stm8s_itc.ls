   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  42                     ; 50 uint8_t ITC_GetCPUCC(void)
  42                     ; 51 {
  43                     	switch	.text
  44  0000               f_ITC_GetCPUCC:
  48                     ; 53   _asm("push cc");
  51  0000 8a            push cc
  53                     ; 54   _asm("pop a");
  56  0001 84            pop a
  58                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  61  0002 87            	retf
  83                     ; 80 void ITC_DeInit(void)
  83                     ; 81 {
  84                     	switch	.text
  85  0003               f_ITC_DeInit:
  89                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  91  0003 35ff7f70      	mov	32624,#255
  92                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  94  0007 35ff7f71      	mov	32625,#255
  95                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  97  000b 35ff7f72      	mov	32626,#255
  98                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 100  000f 35ff7f73      	mov	32627,#255
 101                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 103  0013 35ff7f74      	mov	32628,#255
 104                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 106  0017 35ff7f75      	mov	32629,#255
 107                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 109  001b 35ff7f76      	mov	32630,#255
 110                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 112  001f 35ff7f77      	mov	32631,#255
 113                     ; 90 }
 116  0023 87            	retf
 140                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 140                     ; 98 {
 141                     	switch	.text
 142  0024               f_ITC_GetSoftIntStatus:
 146                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 148  0024 8d000000      	callf	f_ITC_GetCPUCC
 150  0028 a428          	and	a,#40
 153  002a 87            	retf
 397                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 397                     ; 108 {
 398                     	switch	.text
 399  002b               f_ITC_GetSoftwarePriority:
 401  002b 88            	push	a
 402  002c 89            	pushw	x
 403       00000002      OFST:	set	2
 406                     ; 109   uint8_t Value = 0;
 408  002d 0f02          	clr	(OFST+0,sp)
 410                     ; 110   uint8_t Mask = 0;
 412                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 414                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 416  002f a403          	and	a,#3
 417  0031 48            	sll	a
 418  0032 5f            	clrw	x
 419  0033 97            	ld	xl,a
 420  0034 a603          	ld	a,#3
 421  0036 5d            	tnzw	x
 422  0037 2704          	jreq	L41
 423  0039               L61:
 424  0039 48            	sll	a
 425  003a 5a            	decw	x
 426  003b 26fc          	jrne	L61
 427  003d               L41:
 428  003d 6b01          	ld	(OFST-1,sp),a
 430                     ; 118   switch (IrqNum)
 432  003f 7b03          	ld	a,(OFST+1,sp)
 434                     ; 198   default:
 434                     ; 199     break;
 435  0041 a119          	cp	a,#25
 436  0043 2436          	jruge	L02
 437  0045 8d000000      	callf	d_jctab
 439  0049               L22:
 440  0049 0034          	dc.w	L14-L22
 441  004b 0034          	dc.w	L14-L22
 442  004d 0034          	dc.w	L14-L22
 443  004f 0034          	dc.w	L14-L22
 444  0051 003d          	dc.w	L34-L22
 445  0053 003d          	dc.w	L34-L22
 446  0055 003d          	dc.w	L34-L22
 447  0057 003d          	dc.w	L34-L22
 448  0059 0071          	dc.w	L771-L22
 449  005b 0071          	dc.w	L771-L22
 450  005d 0046          	dc.w	L54-L22
 451  005f 0046          	dc.w	L54-L22
 452  0061 004f          	dc.w	L74-L22
 453  0063 004f          	dc.w	L74-L22
 454  0065 004f          	dc.w	L74-L22
 455  0067 004f          	dc.w	L74-L22
 456  0069 0058          	dc.w	L15-L22
 457  006b 0071          	dc.w	L771-L22
 458  006d 0071          	dc.w	L771-L22
 459  006f 0058          	dc.w	L15-L22
 460  0071 0061          	dc.w	L35-L22
 461  0073 0061          	dc.w	L35-L22
 462  0075 0061          	dc.w	L35-L22
 463  0077 0061          	dc.w	L35-L22
 464  0079 006a          	dc.w	L55-L22
 465  007b               L02:
 466  007b 203d          	jra	L771
 467  007d               L14:
 468                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 468                     ; 121   case ITC_IRQ_AWU:
 468                     ; 122   case ITC_IRQ_CLK:
 468                     ; 123   case ITC_IRQ_PORTA:
 468                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 470  007d c67f70        	ld	a,32624
 471  0080 1401          	and	a,(OFST-1,sp)
 472  0082 6b02          	ld	(OFST+0,sp),a
 474                     ; 125     break;
 476  0084 2034          	jra	L771
 477  0086               L34:
 478                     ; 127   case ITC_IRQ_PORTB:
 478                     ; 128   case ITC_IRQ_PORTC:
 478                     ; 129   case ITC_IRQ_PORTD:
 478                     ; 130   case ITC_IRQ_PORTE:
 478                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 480  0086 c67f71        	ld	a,32625
 481  0089 1401          	and	a,(OFST-1,sp)
 482  008b 6b02          	ld	(OFST+0,sp),a
 484                     ; 132     break;
 486  008d 202b          	jra	L771
 487  008f               L54:
 488                     ; 141   case ITC_IRQ_SPI:
 488                     ; 142   case ITC_IRQ_TIM1_OVF:
 488                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 490  008f c67f72        	ld	a,32626
 491  0092 1401          	and	a,(OFST-1,sp)
 492  0094 6b02          	ld	(OFST+0,sp),a
 494                     ; 144     break;
 496  0096 2022          	jra	L771
 497  0098               L74:
 498                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 498                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 498                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 498                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 498                     ; 150 #else
 498                     ; 151   case ITC_IRQ_TIM2_OVF:
 498                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 498                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 498                     ; 154   case ITC_IRQ_TIM3_OVF:
 498                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 500  0098 c67f73        	ld	a,32627
 501  009b 1401          	and	a,(OFST-1,sp)
 502  009d 6b02          	ld	(OFST+0,sp),a
 504                     ; 156     break;
 506  009f 2019          	jra	L771
 507  00a1               L15:
 508                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 508                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 508                     ; 160     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 508                     ; 161   case ITC_IRQ_UART1_TX:
 508                     ; 162   case ITC_IRQ_UART1_RX:
 508                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 508                     ; 164 #if defined(STM8AF622x)
 508                     ; 165   case ITC_IRQ_UART4_TX:
 508                     ; 166   case ITC_IRQ_UART4_RX:
 508                     ; 167 #endif /*STM8AF622x */
 508                     ; 168   case ITC_IRQ_I2C:
 508                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 510  00a1 c67f74        	ld	a,32628
 511  00a4 1401          	and	a,(OFST-1,sp)
 512  00a6 6b02          	ld	(OFST+0,sp),a
 514                     ; 170     break;
 516  00a8 2010          	jra	L771
 517  00aa               L35:
 518                     ; 173   case ITC_IRQ_UART2_TX:
 518                     ; 174   case ITC_IRQ_UART2_RX:
 518                     ; 175 #endif /*STM8S105 or STM8AF626x*/
 518                     ; 176 #if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || \
 518                     ; 177     defined(STM8AF62Ax)
 518                     ; 178   case ITC_IRQ_UART3_TX:
 518                     ; 179   case ITC_IRQ_UART3_RX:
 518                     ; 180   case ITC_IRQ_ADC2:
 518                     ; 181 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 518                     ; 182 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 518                     ; 183     defined(STM8S903) || defined(STM8AF626x) || defined(STM8AF622x)
 518                     ; 184   case ITC_IRQ_ADC1:
 518                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 518                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 518                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 518                     ; 188 #else
 518                     ; 189   case ITC_IRQ_TIM4_OVF:
 518                     ; 190 #endif /*STM8S903 or STM8AF622x */
 518                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 520  00aa c67f75        	ld	a,32629
 521  00ad 1401          	and	a,(OFST-1,sp)
 522  00af 6b02          	ld	(OFST+0,sp),a
 524                     ; 192     break;
 526  00b1 2007          	jra	L771
 527  00b3               L55:
 528                     ; 194   case ITC_IRQ_EEPROM_EEC:
 528                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 530  00b3 c67f76        	ld	a,32630
 531  00b6 1401          	and	a,(OFST-1,sp)
 532  00b8 6b02          	ld	(OFST+0,sp),a
 534                     ; 196     break;
 536  00ba               L75:
 537                     ; 198   default:
 537                     ; 199     break;
 539  00ba               L771:
 540                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 542  00ba 7b03          	ld	a,(OFST+1,sp)
 543  00bc a403          	and	a,#3
 544  00be 48            	sll	a
 545  00bf 5f            	clrw	x
 546  00c0 97            	ld	xl,a
 547  00c1 7b02          	ld	a,(OFST+0,sp)
 548  00c3 5d            	tnzw	x
 549  00c4 2704          	jreq	L42
 550  00c6               L62:
 551  00c6 44            	srl	a
 552  00c7 5a            	decw	x
 553  00c8 26fc          	jrne	L62
 554  00ca               L42:
 555  00ca 6b02          	ld	(OFST+0,sp),a
 557                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 559  00cc 7b02          	ld	a,(OFST+0,sp)
 562  00ce 5b03          	addw	sp,#3
 563  00d0 87            	retf
 622                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 622                     ; 221 {
 623                     	switch	.text
 624  00d1               f_ITC_SetSoftwarePriority:
 626  00d1 89            	pushw	x
 627  00d2 89            	pushw	x
 628       00000002      OFST:	set	2
 631                     ; 222   uint8_t Mask = 0;
 633                     ; 223   uint8_t NewPriority = 0;
 635                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 637                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 639                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 641                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 643  00d3 9e            	ld	a,xh
 644  00d4 a403          	and	a,#3
 645  00d6 48            	sll	a
 646  00d7 5f            	clrw	x
 647  00d8 97            	ld	xl,a
 648  00d9 a603          	ld	a,#3
 649  00db 5d            	tnzw	x
 650  00dc 2704          	jreq	L23
 651  00de               L43:
 652  00de 48            	sll	a
 653  00df 5a            	decw	x
 654  00e0 26fc          	jrne	L43
 655  00e2               L23:
 656  00e2 43            	cpl	a
 657  00e3 6b01          	ld	(OFST-1,sp),a
 659                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 661  00e5 7b03          	ld	a,(OFST+1,sp)
 662  00e7 a403          	and	a,#3
 663  00e9 48            	sll	a
 664  00ea 5f            	clrw	x
 665  00eb 97            	ld	xl,a
 666  00ec 7b04          	ld	a,(OFST+2,sp)
 667  00ee 5d            	tnzw	x
 668  00ef 2704          	jreq	L63
 669  00f1               L04:
 670  00f1 48            	sll	a
 671  00f2 5a            	decw	x
 672  00f3 26fc          	jrne	L04
 673  00f5               L63:
 674  00f5 6b02          	ld	(OFST+0,sp),a
 676                     ; 239   switch (IrqNum)
 678  00f7 7b03          	ld	a,(OFST+1,sp)
 680                     ; 329   default:
 680                     ; 330     break;
 681  00f9 a119          	cp	a,#25
 682  00fb 2436          	jruge	L24
 683  00fd 8d000000      	callf	d_jctab
 685  0101               L44:
 686  0101 0034          	dc.w	L102-L44
 687  0103 0034          	dc.w	L102-L44
 688  0105 0034          	dc.w	L102-L44
 689  0107 0034          	dc.w	L102-L44
 690  0109 0046          	dc.w	L302-L44
 691  010b 0046          	dc.w	L302-L44
 692  010d 0046          	dc.w	L302-L44
 693  010f 0046          	dc.w	L302-L44
 694  0111 00b0          	dc.w	L152-L44
 695  0113 00b0          	dc.w	L152-L44
 696  0115 0058          	dc.w	L502-L44
 697  0117 0058          	dc.w	L502-L44
 698  0119 006a          	dc.w	L702-L44
 699  011b 006a          	dc.w	L702-L44
 700  011d 006a          	dc.w	L702-L44
 701  011f 006a          	dc.w	L702-L44
 702  0121 007c          	dc.w	L112-L44
 703  0123 00b0          	dc.w	L152-L44
 704  0125 00b0          	dc.w	L152-L44
 705  0127 007c          	dc.w	L112-L44
 706  0129 008e          	dc.w	L312-L44
 707  012b 008e          	dc.w	L312-L44
 708  012d 008e          	dc.w	L312-L44
 709  012f 008e          	dc.w	L312-L44
 710  0131 00a0          	dc.w	L512-L44
 711  0133               L24:
 712  0133 207c          	jra	L152
 713  0135               L102:
 714                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 714                     ; 242   case ITC_IRQ_AWU:
 714                     ; 243   case ITC_IRQ_CLK:
 714                     ; 244   case ITC_IRQ_PORTA:
 714                     ; 245     ITC->ISPR1 &= Mask;
 716  0135 c67f70        	ld	a,32624
 717  0138 1401          	and	a,(OFST-1,sp)
 718  013a c77f70        	ld	32624,a
 719                     ; 246     ITC->ISPR1 |= NewPriority;
 721  013d c67f70        	ld	a,32624
 722  0140 1a02          	or	a,(OFST+0,sp)
 723  0142 c77f70        	ld	32624,a
 724                     ; 247     break;
 726  0145 206a          	jra	L152
 727  0147               L302:
 728                     ; 249   case ITC_IRQ_PORTB:
 728                     ; 250   case ITC_IRQ_PORTC:
 728                     ; 251   case ITC_IRQ_PORTD:
 728                     ; 252   case ITC_IRQ_PORTE:
 728                     ; 253     ITC->ISPR2 &= Mask;
 730  0147 c67f71        	ld	a,32625
 731  014a 1401          	and	a,(OFST-1,sp)
 732  014c c77f71        	ld	32625,a
 733                     ; 254     ITC->ISPR2 |= NewPriority;
 735  014f c67f71        	ld	a,32625
 736  0152 1a02          	or	a,(OFST+0,sp)
 737  0154 c77f71        	ld	32625,a
 738                     ; 255     break;
 740  0157 2058          	jra	L152
 741  0159               L502:
 742                     ; 264   case ITC_IRQ_SPI:
 742                     ; 265   case ITC_IRQ_TIM1_OVF:
 742                     ; 266     ITC->ISPR3 &= Mask;
 744  0159 c67f72        	ld	a,32626
 745  015c 1401          	and	a,(OFST-1,sp)
 746  015e c77f72        	ld	32626,a
 747                     ; 267     ITC->ISPR3 |= NewPriority;
 749  0161 c67f72        	ld	a,32626
 750  0164 1a02          	or	a,(OFST+0,sp)
 751  0166 c77f72        	ld	32626,a
 752                     ; 268     break;
 754  0169 2046          	jra	L152
 755  016b               L702:
 756                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 756                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 756                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 756                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 756                     ; 274 #else
 756                     ; 275   case ITC_IRQ_TIM2_OVF:
 756                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 756                     ; 277 #endif /*STM8S903 or STM8AF622x */
 756                     ; 278   case ITC_IRQ_TIM3_OVF:
 756                     ; 279     ITC->ISPR4 &= Mask;
 758  016b c67f73        	ld	a,32627
 759  016e 1401          	and	a,(OFST-1,sp)
 760  0170 c77f73        	ld	32627,a
 761                     ; 280     ITC->ISPR4 |= NewPriority;
 763  0173 c67f73        	ld	a,32627
 764  0176 1a02          	or	a,(OFST+0,sp)
 765  0178 c77f73        	ld	32627,a
 766                     ; 281     break;
 768  017b 2034          	jra	L152
 769  017d               L112:
 770                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 770                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 770                     ; 285     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 770                     ; 286   case ITC_IRQ_UART1_TX:
 770                     ; 287   case ITC_IRQ_UART1_RX:
 770                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 770                     ; 289 #if defined(STM8AF622x)
 770                     ; 290   case ITC_IRQ_UART4_TX:
 770                     ; 291   case ITC_IRQ_UART4_RX:
 770                     ; 292 #endif /*STM8AF622x */
 770                     ; 293   case ITC_IRQ_I2C:
 770                     ; 294     ITC->ISPR5 &= Mask;
 772  017d c67f74        	ld	a,32628
 773  0180 1401          	and	a,(OFST-1,sp)
 774  0182 c77f74        	ld	32628,a
 775                     ; 295     ITC->ISPR5 |= NewPriority;
 777  0185 c67f74        	ld	a,32628
 778  0188 1a02          	or	a,(OFST+0,sp)
 779  018a c77f74        	ld	32628,a
 780                     ; 296     break;
 782  018d 2022          	jra	L152
 783  018f               L312:
 784                     ; 299   case ITC_IRQ_UART2_TX:
 784                     ; 300   case ITC_IRQ_UART2_RX:
 784                     ; 301 #endif /*STM8S105 or STM8AF626x */
 784                     ; 302     
 784                     ; 303 #if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || \
 784                     ; 304     defined(STM8AF62Ax)
 784                     ; 305   case ITC_IRQ_UART3_TX:
 784                     ; 306   case ITC_IRQ_UART3_RX:
 784                     ; 307   case ITC_IRQ_ADC2:
 784                     ; 308 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 784                     ; 309     
 784                     ; 310 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 784                     ; 311     defined(STM8S903) || defined(STM8AF626x) || defined (STM8AF622x)
 784                     ; 312   case ITC_IRQ_ADC1:
 784                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 784                     ; 314     
 784                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 784                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 784                     ; 317 #else
 784                     ; 318   case ITC_IRQ_TIM4_OVF:
 784                     ; 319 #endif /* STM8S903 or STM8AF622x */
 784                     ; 320     ITC->ISPR6 &= Mask;
 786  018f c67f75        	ld	a,32629
 787  0192 1401          	and	a,(OFST-1,sp)
 788  0194 c77f75        	ld	32629,a
 789                     ; 321     ITC->ISPR6 |= NewPriority;
 791  0197 c67f75        	ld	a,32629
 792  019a 1a02          	or	a,(OFST+0,sp)
 793  019c c77f75        	ld	32629,a
 794                     ; 322     break;
 796  019f 2010          	jra	L152
 797  01a1               L512:
 798                     ; 324   case ITC_IRQ_EEPROM_EEC:
 798                     ; 325     ITC->ISPR7 &= Mask;
 800  01a1 c67f76        	ld	a,32630
 801  01a4 1401          	and	a,(OFST-1,sp)
 802  01a6 c77f76        	ld	32630,a
 803                     ; 326     ITC->ISPR7 |= NewPriority;
 805  01a9 c67f76        	ld	a,32630
 806  01ac 1a02          	or	a,(OFST+0,sp)
 807  01ae c77f76        	ld	32630,a
 808                     ; 327     break;
 810  01b1               L712:
 811                     ; 329   default:
 811                     ; 330     break;
 813  01b1               L152:
 814                     ; 332 }
 817  01b1 5b04          	addw	sp,#4
 818  01b3 87            	retf
 830                     	xdef	f_ITC_GetSoftwarePriority
 831                     	xdef	f_ITC_SetSoftwarePriority
 832                     	xdef	f_ITC_GetSoftIntStatus
 833                     	xdef	f_ITC_DeInit
 834                     	xdef	f_ITC_GetCPUCC
 835                     	xref.b	c_x
 854                     	xref	d_jctab
 855                     	end
