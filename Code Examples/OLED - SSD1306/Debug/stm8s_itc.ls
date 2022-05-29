   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  47                     ; 50 uint8_t ITC_GetCPUCC(void)
  47                     ; 51 {
  49                     	switch	.text
  50  0000               _ITC_GetCPUCC:
  54                     ; 53   _asm("push cc");
  57  0000 8a            	push	cc
  59                     ; 54   _asm("pop a");
  62  0001 84            	pop	a
  64                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  67  0002 81            	ret	
  90                     ; 80 void ITC_DeInit(void)
  90                     ; 81 {
  91                     	switch	.text
  92  0003               _ITC_DeInit:
  96                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  98  0003 35ff7f70      	mov	32624,#255
  99                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
 101  0007 35ff7f71      	mov	32625,#255
 102                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 104  000b 35ff7f72      	mov	32626,#255
 105                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 107  000f 35ff7f73      	mov	32627,#255
 108                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 110  0013 35ff7f74      	mov	32628,#255
 111                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 113  0017 35ff7f75      	mov	32629,#255
 114                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 116  001b 35ff7f76      	mov	32630,#255
 117                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 119  001f 35ff7f77      	mov	32631,#255
 120                     ; 90 }
 123  0023 81            	ret	
 148                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 148                     ; 98 {
 149                     	switch	.text
 150  0024               _ITC_GetSoftIntStatus:
 154                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 156  0024 adda          	call	_ITC_GetCPUCC
 158  0026 a428          	and	a,#40
 161  0028 81            	ret	
 406                     .const:	section	.text
 407  0000               L42:
 408  0000 004a          	dc.w	L14
 409  0002 004a          	dc.w	L14
 410  0004 004a          	dc.w	L14
 411  0006 004a          	dc.w	L14
 412  0008 004f          	dc.w	L34
 413  000a 004f          	dc.w	L34
 414  000c 004f          	dc.w	L34
 415  000e 004f          	dc.w	L34
 416  0010 006f          	dc.w	L771
 417  0012 006f          	dc.w	L771
 418  0014 0054          	dc.w	L54
 419  0016 0054          	dc.w	L54
 420  0018 0059          	dc.w	L74
 421  001a 0059          	dc.w	L74
 422  001c 0059          	dc.w	L74
 423  001e 0059          	dc.w	L74
 424  0020 005e          	dc.w	L15
 425  0022 006f          	dc.w	L771
 426  0024 006f          	dc.w	L771
 427  0026 005e          	dc.w	L15
 428  0028 0063          	dc.w	L35
 429  002a 0063          	dc.w	L35
 430  002c 0063          	dc.w	L35
 431  002e 0063          	dc.w	L35
 432  0030 0068          	dc.w	L55
 433                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 433                     ; 108 {
 434                     	switch	.text
 435  0029               _ITC_GetSoftwarePriority:
 437  0029 88            	push	a
 438  002a 89            	pushw	x
 439       00000002      OFST:	set	2
 442                     ; 109   uint8_t Value = 0;
 444  002b 0f02          	clr	(OFST+0,sp)
 446                     ; 110   uint8_t Mask = 0;
 448                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 450                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 452  002d a403          	and	a,#3
 453  002f 48            	sll	a
 454  0030 5f            	clrw	x
 455  0031 97            	ld	xl,a
 456  0032 a603          	ld	a,#3
 457  0034 5d            	tnzw	x
 458  0035 2704          	jreq	L61
 459  0037               L02:
 460  0037 48            	sll	a
 461  0038 5a            	decw	x
 462  0039 26fc          	jrne	L02
 463  003b               L61:
 464  003b 6b01          	ld	(OFST-1,sp),a
 466                     ; 118   switch (IrqNum)
 468  003d 7b03          	ld	a,(OFST+1,sp)
 470                     ; 198   default:
 470                     ; 199     break;
 471  003f a119          	cp	a,#25
 472  0041 242c          	jruge	L771
 473  0043 5f            	clrw	x
 474  0044 97            	ld	xl,a
 475  0045 58            	sllw	x
 476  0046 de0000        	ldw	x,(L42,x)
 477  0049 fc            	jp	(x)
 478  004a               L14:
 479                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 479                     ; 121   case ITC_IRQ_AWU:
 479                     ; 122   case ITC_IRQ_CLK:
 479                     ; 123   case ITC_IRQ_PORTA:
 479                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 481  004a c67f70        	ld	a,32624
 482                     ; 125     break;
 484  004d 201c          	jp	LC001
 485  004f               L34:
 486                     ; 127   case ITC_IRQ_PORTB:
 486                     ; 128   case ITC_IRQ_PORTC:
 486                     ; 129   case ITC_IRQ_PORTD:
 486                     ; 130   case ITC_IRQ_PORTE:
 486                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 488  004f c67f71        	ld	a,32625
 489                     ; 132     break;
 491  0052 2017          	jp	LC001
 492  0054               L54:
 493                     ; 141   case ITC_IRQ_SPI:
 493                     ; 142   case ITC_IRQ_TIM1_OVF:
 493                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 495  0054 c67f72        	ld	a,32626
 496                     ; 144     break;
 498  0057 2012          	jp	LC001
 499  0059               L74:
 500                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 500                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 500                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 500                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 500                     ; 150 #else
 500                     ; 151   case ITC_IRQ_TIM2_OVF:
 500                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 500                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 500                     ; 154   case ITC_IRQ_TIM3_OVF:
 500                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 502  0059 c67f73        	ld	a,32627
 503                     ; 156     break;
 505  005c 200d          	jp	LC001
 506  005e               L15:
 507                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 507                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 507                     ; 160     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 507                     ; 161   case ITC_IRQ_UART1_TX:
 507                     ; 162   case ITC_IRQ_UART1_RX:
 507                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 507                     ; 164 #if defined(STM8AF622x)
 507                     ; 165   case ITC_IRQ_UART4_TX:
 507                     ; 166   case ITC_IRQ_UART4_RX:
 507                     ; 167 #endif /*STM8AF622x */
 507                     ; 168   case ITC_IRQ_I2C:
 507                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 509  005e c67f74        	ld	a,32628
 510                     ; 170     break;
 512  0061 2008          	jp	LC001
 513  0063               L35:
 514                     ; 173   case ITC_IRQ_UART2_TX:
 514                     ; 174   case ITC_IRQ_UART2_RX:
 514                     ; 175 #endif /*STM8S105 or STM8AF626x*/
 514                     ; 176 #if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || \
 514                     ; 177     defined(STM8AF62Ax)
 514                     ; 178   case ITC_IRQ_UART3_TX:
 514                     ; 179   case ITC_IRQ_UART3_RX:
 514                     ; 180   case ITC_IRQ_ADC2:
 514                     ; 181 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 514                     ; 182 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 514                     ; 183     defined(STM8S903) || defined(STM8AF626x) || defined(STM8AF622x)
 514                     ; 184   case ITC_IRQ_ADC1:
 514                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 514                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 514                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 514                     ; 188 #else
 514                     ; 189   case ITC_IRQ_TIM4_OVF:
 514                     ; 190 #endif /*STM8S903 or STM8AF622x */
 514                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 516  0063 c67f75        	ld	a,32629
 517                     ; 192     break;
 519  0066 2003          	jp	LC001
 520  0068               L55:
 521                     ; 194   case ITC_IRQ_EEPROM_EEC:
 521                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 523  0068 c67f76        	ld	a,32630
 524  006b               LC001:
 525  006b 1401          	and	a,(OFST-1,sp)
 526  006d 6b02          	ld	(OFST+0,sp),a
 528                     ; 196     break;
 530                     ; 198   default:
 530                     ; 199     break;
 532  006f               L771:
 533                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 535  006f 7b03          	ld	a,(OFST+1,sp)
 536  0071 a403          	and	a,#3
 537  0073 48            	sll	a
 538  0074 5f            	clrw	x
 539  0075 97            	ld	xl,a
 540  0076 7b02          	ld	a,(OFST+0,sp)
 541  0078 5d            	tnzw	x
 542  0079 2704          	jreq	L62
 543  007b               L03:
 544  007b 44            	srl	a
 545  007c 5a            	decw	x
 546  007d 26fc          	jrne	L03
 547  007f               L62:
 549                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 553  007f 5b03          	addw	sp,#3
 554  0081 81            	ret	
 614                     	switch	.const
 615  0032               L64:
 616  0032 00b8          	dc.w	L102
 617  0034 00b8          	dc.w	L102
 618  0036 00b8          	dc.w	L102
 619  0038 00b8          	dc.w	L102
 620  003a 00ca          	dc.w	L302
 621  003c 00ca          	dc.w	L302
 622  003e 00ca          	dc.w	L302
 623  0040 00ca          	dc.w	L302
 624  0042 0134          	dc.w	L152
 625  0044 0134          	dc.w	L152
 626  0046 00dc          	dc.w	L502
 627  0048 00dc          	dc.w	L502
 628  004a 00ee          	dc.w	L702
 629  004c 00ee          	dc.w	L702
 630  004e 00ee          	dc.w	L702
 631  0050 00ee          	dc.w	L702
 632  0052 0100          	dc.w	L112
 633  0054 0134          	dc.w	L152
 634  0056 0134          	dc.w	L152
 635  0058 0100          	dc.w	L112
 636  005a 0112          	dc.w	L312
 637  005c 0112          	dc.w	L312
 638  005e 0112          	dc.w	L312
 639  0060 0112          	dc.w	L312
 640  0062 0124          	dc.w	L512
 641                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 641                     ; 221 {
 642                     	switch	.text
 643  0082               _ITC_SetSoftwarePriority:
 645  0082 89            	pushw	x
 646  0083 89            	pushw	x
 647       00000002      OFST:	set	2
 650                     ; 222   uint8_t Mask = 0;
 652                     ; 223   uint8_t NewPriority = 0;
 654                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 656                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 658                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 660                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 662  0084 9e            	ld	a,xh
 663  0085 a403          	and	a,#3
 664  0087 48            	sll	a
 665  0088 5f            	clrw	x
 666  0089 97            	ld	xl,a
 667  008a a603          	ld	a,#3
 668  008c 5d            	tnzw	x
 669  008d 2704          	jreq	L43
 670  008f               L63:
 671  008f 48            	sll	a
 672  0090 5a            	decw	x
 673  0091 26fc          	jrne	L63
 674  0093               L43:
 675  0093 43            	cpl	a
 676  0094 6b01          	ld	(OFST-1,sp),a
 678                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 680  0096 7b03          	ld	a,(OFST+1,sp)
 681  0098 a403          	and	a,#3
 682  009a 48            	sll	a
 683  009b 5f            	clrw	x
 684  009c 97            	ld	xl,a
 685  009d 7b04          	ld	a,(OFST+2,sp)
 686  009f 5d            	tnzw	x
 687  00a0 2704          	jreq	L04
 688  00a2               L24:
 689  00a2 48            	sll	a
 690  00a3 5a            	decw	x
 691  00a4 26fc          	jrne	L24
 692  00a6               L04:
 693  00a6 6b02          	ld	(OFST+0,sp),a
 695                     ; 239   switch (IrqNum)
 697  00a8 7b03          	ld	a,(OFST+1,sp)
 699                     ; 329   default:
 699                     ; 330     break;
 700  00aa a119          	cp	a,#25
 701  00ac 2503cc0134    	jruge	L152
 702  00b1 5f            	clrw	x
 703  00b2 97            	ld	xl,a
 704  00b3 58            	sllw	x
 705  00b4 de0032        	ldw	x,(L64,x)
 706  00b7 fc            	jp	(x)
 707  00b8               L102:
 708                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 708                     ; 242   case ITC_IRQ_AWU:
 708                     ; 243   case ITC_IRQ_CLK:
 708                     ; 244   case ITC_IRQ_PORTA:
 708                     ; 245     ITC->ISPR1 &= Mask;
 710  00b8 c67f70        	ld	a,32624
 711  00bb 1401          	and	a,(OFST-1,sp)
 712  00bd c77f70        	ld	32624,a
 713                     ; 246     ITC->ISPR1 |= NewPriority;
 715  00c0 c67f70        	ld	a,32624
 716  00c3 1a02          	or	a,(OFST+0,sp)
 717  00c5 c77f70        	ld	32624,a
 718                     ; 247     break;
 720  00c8 206a          	jra	L152
 721  00ca               L302:
 722                     ; 249   case ITC_IRQ_PORTB:
 722                     ; 250   case ITC_IRQ_PORTC:
 722                     ; 251   case ITC_IRQ_PORTD:
 722                     ; 252   case ITC_IRQ_PORTE:
 722                     ; 253     ITC->ISPR2 &= Mask;
 724  00ca c67f71        	ld	a,32625
 725  00cd 1401          	and	a,(OFST-1,sp)
 726  00cf c77f71        	ld	32625,a
 727                     ; 254     ITC->ISPR2 |= NewPriority;
 729  00d2 c67f71        	ld	a,32625
 730  00d5 1a02          	or	a,(OFST+0,sp)
 731  00d7 c77f71        	ld	32625,a
 732                     ; 255     break;
 734  00da 2058          	jra	L152
 735  00dc               L502:
 736                     ; 264   case ITC_IRQ_SPI:
 736                     ; 265   case ITC_IRQ_TIM1_OVF:
 736                     ; 266     ITC->ISPR3 &= Mask;
 738  00dc c67f72        	ld	a,32626
 739  00df 1401          	and	a,(OFST-1,sp)
 740  00e1 c77f72        	ld	32626,a
 741                     ; 267     ITC->ISPR3 |= NewPriority;
 743  00e4 c67f72        	ld	a,32626
 744  00e7 1a02          	or	a,(OFST+0,sp)
 745  00e9 c77f72        	ld	32626,a
 746                     ; 268     break;
 748  00ec 2046          	jra	L152
 749  00ee               L702:
 750                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 750                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 750                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 750                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 750                     ; 274 #else
 750                     ; 275   case ITC_IRQ_TIM2_OVF:
 750                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 750                     ; 277 #endif /*STM8S903 or STM8AF622x */
 750                     ; 278   case ITC_IRQ_TIM3_OVF:
 750                     ; 279     ITC->ISPR4 &= Mask;
 752  00ee c67f73        	ld	a,32627
 753  00f1 1401          	and	a,(OFST-1,sp)
 754  00f3 c77f73        	ld	32627,a
 755                     ; 280     ITC->ISPR4 |= NewPriority;
 757  00f6 c67f73        	ld	a,32627
 758  00f9 1a02          	or	a,(OFST+0,sp)
 759  00fb c77f73        	ld	32627,a
 760                     ; 281     break;
 762  00fe 2034          	jra	L152
 763  0100               L112:
 764                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 764                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 764                     ; 285     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 764                     ; 286   case ITC_IRQ_UART1_TX:
 764                     ; 287   case ITC_IRQ_UART1_RX:
 764                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 764                     ; 289 #if defined(STM8AF622x)
 764                     ; 290   case ITC_IRQ_UART4_TX:
 764                     ; 291   case ITC_IRQ_UART4_RX:
 764                     ; 292 #endif /*STM8AF622x */
 764                     ; 293   case ITC_IRQ_I2C:
 764                     ; 294     ITC->ISPR5 &= Mask;
 766  0100 c67f74        	ld	a,32628
 767  0103 1401          	and	a,(OFST-1,sp)
 768  0105 c77f74        	ld	32628,a
 769                     ; 295     ITC->ISPR5 |= NewPriority;
 771  0108 c67f74        	ld	a,32628
 772  010b 1a02          	or	a,(OFST+0,sp)
 773  010d c77f74        	ld	32628,a
 774                     ; 296     break;
 776  0110 2022          	jra	L152
 777  0112               L312:
 778                     ; 299   case ITC_IRQ_UART2_TX:
 778                     ; 300   case ITC_IRQ_UART2_RX:
 778                     ; 301 #endif /*STM8S105 or STM8AF626x */
 778                     ; 302     
 778                     ; 303 #if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || \
 778                     ; 304     defined(STM8AF62Ax)
 778                     ; 305   case ITC_IRQ_UART3_TX:
 778                     ; 306   case ITC_IRQ_UART3_RX:
 778                     ; 307   case ITC_IRQ_ADC2:
 778                     ; 308 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 778                     ; 309     
 778                     ; 310 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 778                     ; 311     defined(STM8S903) || defined(STM8AF626x) || defined (STM8AF622x)
 778                     ; 312   case ITC_IRQ_ADC1:
 778                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 778                     ; 314     
 778                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 778                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 778                     ; 317 #else
 778                     ; 318   case ITC_IRQ_TIM4_OVF:
 778                     ; 319 #endif /* STM8S903 or STM8AF622x */
 778                     ; 320     ITC->ISPR6 &= Mask;
 780  0112 c67f75        	ld	a,32629
 781  0115 1401          	and	a,(OFST-1,sp)
 782  0117 c77f75        	ld	32629,a
 783                     ; 321     ITC->ISPR6 |= NewPriority;
 785  011a c67f75        	ld	a,32629
 786  011d 1a02          	or	a,(OFST+0,sp)
 787  011f c77f75        	ld	32629,a
 788                     ; 322     break;
 790  0122 2010          	jra	L152
 791  0124               L512:
 792                     ; 324   case ITC_IRQ_EEPROM_EEC:
 792                     ; 325     ITC->ISPR7 &= Mask;
 794  0124 c67f76        	ld	a,32630
 795  0127 1401          	and	a,(OFST-1,sp)
 796  0129 c77f76        	ld	32630,a
 797                     ; 326     ITC->ISPR7 |= NewPriority;
 799  012c c67f76        	ld	a,32630
 800  012f 1a02          	or	a,(OFST+0,sp)
 801  0131 c77f76        	ld	32630,a
 802                     ; 327     break;
 804                     ; 329   default:
 804                     ; 330     break;
 806  0134               L152:
 807                     ; 332 }
 810  0134 5b04          	addw	sp,#4
 811  0136 81            	ret	
 824                     	xdef	_ITC_GetSoftwarePriority
 825                     	xdef	_ITC_SetSoftwarePriority
 826                     	xdef	_ITC_GetSoftIntStatus
 827                     	xdef	_ITC_DeInit
 828                     	xdef	_ITC_GetCPUCC
 847                     	end
