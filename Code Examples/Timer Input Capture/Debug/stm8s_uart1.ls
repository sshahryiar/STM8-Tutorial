   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  43                     ; 53 void UART1_DeInit(void)
  43                     ; 54 {
  45                     	switch	.text
  46  0000               _UART1_DeInit:
  50                     ; 57   (void)UART1->SR;
  52  0000 c65230        	ld	a,21040
  53                     ; 58   (void)UART1->DR;
  55  0003 c65231        	ld	a,21041
  56                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  58  0006 725f5233      	clr	21043
  59                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  61  000a 725f5232      	clr	21042
  62                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  64  000e 725f5234      	clr	21044
  65                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  67  0012 725f5235      	clr	21045
  68                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  70  0016 725f5236      	clr	21046
  71                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  73  001a 725f5237      	clr	21047
  74                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  76  001e 725f5238      	clr	21048
  77                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
  79  0022 725f5239      	clr	21049
  80                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
  82  0026 725f523a      	clr	21050
  83                     ; 71 }
  86  002a 81            	ret
 389                     .const:	section	.text
 390  0000               L01:
 391  0000 00000064      	dc.l	100
 392                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 392                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 392                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 392                     ; 93 {
 393                     	switch	.text
 394  002b               _UART1_Init:
 396  002b 520c          	subw	sp,#12
 397       0000000c      OFST:	set	12
 400                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 404                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 406                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 408                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 410                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 412                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 414                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 416                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 418  002d 72195234      	bres	21044,#4
 419                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 421  0031 c65234        	ld	a,21044
 422  0034 1a13          	or	a,(OFST+7,sp)
 423  0036 c75234        	ld	21044,a
 424                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 426  0039 c65236        	ld	a,21046
 427  003c a4cf          	and	a,#207
 428  003e c75236        	ld	21046,a
 429                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 431  0041 c65236        	ld	a,21046
 432  0044 1a14          	or	a,(OFST+8,sp)
 433  0046 c75236        	ld	21046,a
 434                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 436  0049 c65234        	ld	a,21044
 437  004c a4f9          	and	a,#249
 438  004e c75234        	ld	21044,a
 439                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 441  0051 c65234        	ld	a,21044
 442  0054 1a15          	or	a,(OFST+9,sp)
 443  0056 c75234        	ld	21044,a
 444                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 446  0059 725f5232      	clr	21042
 447                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 449  005d c65233        	ld	a,21043
 450  0060 a40f          	and	a,#15
 451  0062 c75233        	ld	21043,a
 452                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 454  0065 c65233        	ld	a,21043
 455  0068 a4f0          	and	a,#240
 456  006a c75233        	ld	21043,a
 457                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 459  006d 96            	ldw	x,sp
 460  006e 1c000f        	addw	x,#OFST+3
 461  0071 cd0000        	call	c_ltor
 463  0074 a604          	ld	a,#4
 464  0076 cd0000        	call	c_llsh
 466  0079 96            	ldw	x,sp
 467  007a 1c0001        	addw	x,#OFST-11
 468  007d cd0000        	call	c_rtol
 471  0080 cd0000        	call	_CLK_GetClockFreq
 473  0083 96            	ldw	x,sp
 474  0084 1c0001        	addw	x,#OFST-11
 475  0087 cd0000        	call	c_ludv
 477  008a 96            	ldw	x,sp
 478  008b 1c0009        	addw	x,#OFST-3
 479  008e cd0000        	call	c_rtol
 482                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 484  0091 96            	ldw	x,sp
 485  0092 1c000f        	addw	x,#OFST+3
 486  0095 cd0000        	call	c_ltor
 488  0098 a604          	ld	a,#4
 489  009a cd0000        	call	c_llsh
 491  009d 96            	ldw	x,sp
 492  009e 1c0001        	addw	x,#OFST-11
 493  00a1 cd0000        	call	c_rtol
 496  00a4 cd0000        	call	_CLK_GetClockFreq
 498  00a7 a664          	ld	a,#100
 499  00a9 cd0000        	call	c_smul
 501  00ac 96            	ldw	x,sp
 502  00ad 1c0001        	addw	x,#OFST-11
 503  00b0 cd0000        	call	c_ludv
 505  00b3 96            	ldw	x,sp
 506  00b4 1c0005        	addw	x,#OFST-7
 507  00b7 cd0000        	call	c_rtol
 510                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 512  00ba 96            	ldw	x,sp
 513  00bb 1c0009        	addw	x,#OFST-3
 514  00be cd0000        	call	c_ltor
 516  00c1 a664          	ld	a,#100
 517  00c3 cd0000        	call	c_smul
 519  00c6 96            	ldw	x,sp
 520  00c7 1c0001        	addw	x,#OFST-11
 521  00ca cd0000        	call	c_rtol
 524  00cd 96            	ldw	x,sp
 525  00ce 1c0005        	addw	x,#OFST-7
 526  00d1 cd0000        	call	c_ltor
 528  00d4 96            	ldw	x,sp
 529  00d5 1c0001        	addw	x,#OFST-11
 530  00d8 cd0000        	call	c_lsub
 532  00db a604          	ld	a,#4
 533  00dd cd0000        	call	c_llsh
 535  00e0 ae0000        	ldw	x,#L01
 536  00e3 cd0000        	call	c_ludv
 538  00e6 b603          	ld	a,c_lreg+3
 539  00e8 a40f          	and	a,#15
 540  00ea ca5233        	or	a,21043
 541  00ed c75233        	ld	21043,a
 542                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 544  00f0 96            	ldw	x,sp
 545  00f1 1c0009        	addw	x,#OFST-3
 546  00f4 cd0000        	call	c_ltor
 548  00f7 a604          	ld	a,#4
 549  00f9 cd0000        	call	c_lursh
 551  00fc b603          	ld	a,c_lreg+3
 552  00fe a4f0          	and	a,#240
 553  0100 b703          	ld	c_lreg+3,a
 554  0102 3f02          	clr	c_lreg+2
 555  0104 3f01          	clr	c_lreg+1
 556  0106 3f00          	clr	c_lreg
 557  0108 b603          	ld	a,c_lreg+3
 558  010a ca5233        	or	a,21043
 559  010d c75233        	ld	21043,a
 560                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 562  0110 c65232        	ld	a,21042
 563  0113 1a0c          	or	a,(OFST+0,sp)
 564  0115 c75232        	ld	21042,a
 565                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 567  0118 c65235        	ld	a,21045
 568  011b a4f3          	and	a,#243
 569  011d c75235        	ld	21045,a
 570                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 572  0120 c65236        	ld	a,21046
 573  0123 a4f8          	and	a,#248
 574  0125 c75236        	ld	21046,a
 575                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 575                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 577  0128 7b16          	ld	a,(OFST+10,sp)
 578  012a a407          	and	a,#7
 579  012c ca5236        	or	a,21046
 580  012f c75236        	ld	21046,a
 581                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 583  0132 7b17          	ld	a,(OFST+11,sp)
 584  0134 a504          	bcp	a,#4
 585  0136 2706          	jreq	L371
 586                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 588  0138 72165235      	bset	21045,#3
 590  013c 2004          	jra	L571
 591  013e               L371:
 592                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 594  013e 72175235      	bres	21045,#3
 595  0142               L571:
 596                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 598  0142 7b17          	ld	a,(OFST+11,sp)
 599  0144 a508          	bcp	a,#8
 600  0146 2706          	jreq	L771
 601                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 603  0148 72145235      	bset	21045,#2
 605  014c 2004          	jra	L102
 606  014e               L771:
 607                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 609  014e 72155235      	bres	21045,#2
 610  0152               L102:
 611                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 613  0152 7b16          	ld	a,(OFST+10,sp)
 614  0154 a580          	bcp	a,#128
 615  0156 2706          	jreq	L302
 616                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 618  0158 72175236      	bres	21046,#3
 620  015c 200a          	jra	L502
 621  015e               L302:
 622                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 624  015e 7b16          	ld	a,(OFST+10,sp)
 625  0160 a408          	and	a,#8
 626  0162 ca5236        	or	a,21046
 627  0165 c75236        	ld	21046,a
 628  0168               L502:
 629                     ; 176 }
 632  0168 5b0c          	addw	sp,#12
 633  016a 81            	ret
 688                     ; 184 void UART1_Cmd(FunctionalState NewState)
 688                     ; 185 {
 689                     	switch	.text
 690  016b               _UART1_Cmd:
 694                     ; 186   if (NewState != DISABLE)
 696  016b 4d            	tnz	a
 697  016c 2706          	jreq	L532
 698                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 700  016e 721b5234      	bres	21044,#5
 702  0172 2004          	jra	L732
 703  0174               L532:
 704                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 706  0174 721a5234      	bset	21044,#5
 707  0178               L732:
 708                     ; 196 }
 711  0178 81            	ret
 836                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 836                     ; 212 {
 837                     	switch	.text
 838  0179               _UART1_ITConfig:
 840  0179 89            	pushw	x
 841  017a 89            	pushw	x
 842       00000002      OFST:	set	2
 845                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 849                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 851                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 853                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 855  017b 9e            	ld	a,xh
 856  017c 6b01          	ld	(OFST-1,sp),a
 858                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 860  017e 9f            	ld	a,xl
 861  017f a40f          	and	a,#15
 862  0181 5f            	clrw	x
 863  0182 97            	ld	xl,a
 864  0183 a601          	ld	a,#1
 865  0185 5d            	tnzw	x
 866  0186 2704          	jreq	L61
 867  0188               L02:
 868  0188 48            	sll	a
 869  0189 5a            	decw	x
 870  018a 26fc          	jrne	L02
 871  018c               L61:
 872  018c 6b02          	ld	(OFST+0,sp),a
 874                     ; 224   if (NewState != DISABLE)
 876  018e 0d07          	tnz	(OFST+5,sp)
 877  0190 272a          	jreq	L713
 878                     ; 227     if (uartreg == 0x01)
 880  0192 7b01          	ld	a,(OFST-1,sp)
 881  0194 a101          	cp	a,#1
 882  0196 260a          	jrne	L123
 883                     ; 229       UART1->CR1 |= itpos;
 885  0198 c65234        	ld	a,21044
 886  019b 1a02          	or	a,(OFST+0,sp)
 887  019d c75234        	ld	21044,a
 889  01a0 2045          	jra	L133
 890  01a2               L123:
 891                     ; 231     else if (uartreg == 0x02)
 893  01a2 7b01          	ld	a,(OFST-1,sp)
 894  01a4 a102          	cp	a,#2
 895  01a6 260a          	jrne	L523
 896                     ; 233       UART1->CR2 |= itpos;
 898  01a8 c65235        	ld	a,21045
 899  01ab 1a02          	or	a,(OFST+0,sp)
 900  01ad c75235        	ld	21045,a
 902  01b0 2035          	jra	L133
 903  01b2               L523:
 904                     ; 237       UART1->CR4 |= itpos;
 906  01b2 c65237        	ld	a,21047
 907  01b5 1a02          	or	a,(OFST+0,sp)
 908  01b7 c75237        	ld	21047,a
 909  01ba 202b          	jra	L133
 910  01bc               L713:
 911                     ; 243     if (uartreg == 0x01)
 913  01bc 7b01          	ld	a,(OFST-1,sp)
 914  01be a101          	cp	a,#1
 915  01c0 260b          	jrne	L333
 916                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
 918  01c2 7b02          	ld	a,(OFST+0,sp)
 919  01c4 43            	cpl	a
 920  01c5 c45234        	and	a,21044
 921  01c8 c75234        	ld	21044,a
 923  01cb 201a          	jra	L133
 924  01cd               L333:
 925                     ; 247     else if (uartreg == 0x02)
 927  01cd 7b01          	ld	a,(OFST-1,sp)
 928  01cf a102          	cp	a,#2
 929  01d1 260b          	jrne	L733
 930                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
 932  01d3 7b02          	ld	a,(OFST+0,sp)
 933  01d5 43            	cpl	a
 934  01d6 c45235        	and	a,21045
 935  01d9 c75235        	ld	21045,a
 937  01dc 2009          	jra	L133
 938  01de               L733:
 939                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
 941  01de 7b02          	ld	a,(OFST+0,sp)
 942  01e0 43            	cpl	a
 943  01e1 c45237        	and	a,21047
 944  01e4 c75237        	ld	21047,a
 945  01e7               L133:
 946                     ; 257 }
 949  01e7 5b04          	addw	sp,#4
 950  01e9 81            	ret
 986                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
 986                     ; 266 {
 987                     	switch	.text
 988  01ea               _UART1_HalfDuplexCmd:
 992                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 994                     ; 269   if (NewState != DISABLE)
 996  01ea 4d            	tnz	a
 997  01eb 2706          	jreq	L163
 998                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
1000  01ed 72165238      	bset	21048,#3
1002  01f1 2004          	jra	L363
1003  01f3               L163:
1004                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1006  01f3 72175238      	bres	21048,#3
1007  01f7               L363:
1008                     ; 277 }
1011  01f7 81            	ret
1068                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1068                     ; 286 {
1069                     	switch	.text
1070  01f8               _UART1_IrDAConfig:
1074                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1076                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1078  01f8 4d            	tnz	a
1079  01f9 2706          	jreq	L314
1080                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1082  01fb 72145238      	bset	21048,#2
1084  01ff 2004          	jra	L514
1085  0201               L314:
1086                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1088  0201 72155238      	bres	21048,#2
1089  0205               L514:
1090                     ; 297 }
1093  0205 81            	ret
1128                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1128                     ; 306 {
1129                     	switch	.text
1130  0206               _UART1_IrDACmd:
1134                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1136                     ; 310   if (NewState != DISABLE)
1138  0206 4d            	tnz	a
1139  0207 2706          	jreq	L534
1140                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1142  0209 72125238      	bset	21048,#1
1144  020d 2004          	jra	L734
1145  020f               L534:
1146                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1148  020f 72135238      	bres	21048,#1
1149  0213               L734:
1150                     ; 320 }
1153  0213 81            	ret
1212                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1212                     ; 330 {
1213                     	switch	.text
1214  0214               _UART1_LINBreakDetectionConfig:
1218                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1220                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1222  0214 4d            	tnz	a
1223  0215 2706          	jreq	L764
1224                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1226  0217 721a5237      	bset	21047,#5
1228  021b 2004          	jra	L174
1229  021d               L764:
1230                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1232  021d 721b5237      	bres	21047,#5
1233  0221               L174:
1234                     ; 341 }
1237  0221 81            	ret
1272                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1272                     ; 350 {
1273                     	switch	.text
1274  0222               _UART1_LINCmd:
1278                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1280                     ; 353   if (NewState != DISABLE)
1282  0222 4d            	tnz	a
1283  0223 2706          	jreq	L115
1284                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1286  0225 721c5236      	bset	21046,#6
1288  0229 2004          	jra	L315
1289  022b               L115:
1290                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1292  022b 721d5236      	bres	21046,#6
1293  022f               L315:
1294                     ; 363 }
1297  022f 81            	ret
1332                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1332                     ; 372 {
1333                     	switch	.text
1334  0230               _UART1_SmartCardCmd:
1338                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1340                     ; 375   if (NewState != DISABLE)
1342  0230 4d            	tnz	a
1343  0231 2706          	jreq	L335
1344                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1346  0233 721a5238      	bset	21048,#5
1348  0237 2004          	jra	L535
1349  0239               L335:
1350                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1352  0239 721b5238      	bres	21048,#5
1353  023d               L535:
1354                     ; 385 }
1357  023d 81            	ret
1393                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1393                     ; 395 {
1394                     	switch	.text
1395  023e               _UART1_SmartCardNACKCmd:
1399                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1401                     ; 398   if (NewState != DISABLE)
1403  023e 4d            	tnz	a
1404  023f 2706          	jreq	L555
1405                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1407  0241 72185238      	bset	21048,#4
1409  0245 2004          	jra	L755
1410  0247               L555:
1411                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1413  0247 72195238      	bres	21048,#4
1414  024b               L755:
1415                     ; 408 }
1418  024b 81            	ret
1475                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1475                     ; 417 {
1476                     	switch	.text
1477  024c               _UART1_WakeUpConfig:
1481                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1483                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1485  024c 72175234      	bres	21044,#3
1486                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1488  0250 ca5234        	or	a,21044
1489  0253 c75234        	ld	21044,a
1490                     ; 422 }
1493  0256 81            	ret
1529                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1529                     ; 431 {
1530                     	switch	.text
1531  0257               _UART1_ReceiverWakeUpCmd:
1535                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1537                     ; 434   if (NewState != DISABLE)
1539  0257 4d            	tnz	a
1540  0258 2706          	jreq	L526
1541                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1543  025a 72125235      	bset	21045,#1
1545  025e 2004          	jra	L726
1546  0260               L526:
1547                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1549  0260 72135235      	bres	21045,#1
1550  0264               L726:
1551                     ; 444 }
1554  0264 81            	ret
1577                     ; 451 uint8_t UART1_ReceiveData8(void)
1577                     ; 452 {
1578                     	switch	.text
1579  0265               _UART1_ReceiveData8:
1583                     ; 453   return ((uint8_t)UART1->DR);
1585  0265 c65231        	ld	a,21041
1588  0268 81            	ret
1622                     ; 461 uint16_t UART1_ReceiveData9(void)
1622                     ; 462 {
1623                     	switch	.text
1624  0269               _UART1_ReceiveData9:
1626  0269 89            	pushw	x
1627       00000002      OFST:	set	2
1630                     ; 463   uint16_t temp = 0;
1632                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
1634  026a c65234        	ld	a,21044
1635  026d 5f            	clrw	x
1636  026e a480          	and	a,#128
1637  0270 5f            	clrw	x
1638  0271 02            	rlwa	x,a
1639  0272 58            	sllw	x
1640  0273 1f01          	ldw	(OFST-1,sp),x
1642                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
1644  0275 c65231        	ld	a,21041
1645  0278 5f            	clrw	x
1646  0279 97            	ld	xl,a
1647  027a 01            	rrwa	x,a
1648  027b 1a02          	or	a,(OFST+0,sp)
1649  027d 01            	rrwa	x,a
1650  027e 1a01          	or	a,(OFST-1,sp)
1651  0280 01            	rrwa	x,a
1652  0281 01            	rrwa	x,a
1653  0282 a4ff          	and	a,#255
1654  0284 01            	rrwa	x,a
1655  0285 a401          	and	a,#1
1656  0287 01            	rrwa	x,a
1659  0288 5b02          	addw	sp,#2
1660  028a 81            	ret
1694                     ; 474 void UART1_SendData8(uint8_t Data)
1694                     ; 475 {
1695                     	switch	.text
1696  028b               _UART1_SendData8:
1700                     ; 477   UART1->DR = Data;
1702  028b c75231        	ld	21041,a
1703                     ; 478 }
1706  028e 81            	ret
1740                     ; 486 void UART1_SendData9(uint16_t Data)
1740                     ; 487 {
1741                     	switch	.text
1742  028f               _UART1_SendData9:
1744  028f 89            	pushw	x
1745       00000000      OFST:	set	0
1748                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
1750  0290 721d5234      	bres	21044,#6
1751                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
1753  0294 54            	srlw	x
1754  0295 54            	srlw	x
1755  0296 9f            	ld	a,xl
1756  0297 a440          	and	a,#64
1757  0299 ca5234        	or	a,21044
1758  029c c75234        	ld	21044,a
1759                     ; 493   UART1->DR   = (uint8_t)(Data);
1761  029f 7b02          	ld	a,(OFST+2,sp)
1762  02a1 c75231        	ld	21041,a
1763                     ; 494 }
1766  02a4 85            	popw	x
1767  02a5 81            	ret
1790                     ; 501 void UART1_SendBreak(void)
1790                     ; 502 {
1791                     	switch	.text
1792  02a6               _UART1_SendBreak:
1796                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
1798  02a6 72105235      	bset	21045,#0
1799                     ; 504 }
1802  02aa 81            	ret
1836                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
1836                     ; 512 {
1837                     	switch	.text
1838  02ab               _UART1_SetAddress:
1840  02ab 88            	push	a
1841       00000000      OFST:	set	0
1844                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
1846                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
1848  02ac c65237        	ld	a,21047
1849  02af a4f0          	and	a,#240
1850  02b1 c75237        	ld	21047,a
1851                     ; 519   UART1->CR4 |= UART1_Address;
1853  02b4 c65237        	ld	a,21047
1854  02b7 1a01          	or	a,(OFST+1,sp)
1855  02b9 c75237        	ld	21047,a
1856                     ; 520 }
1859  02bc 84            	pop	a
1860  02bd 81            	ret
1894                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
1894                     ; 529 {
1895                     	switch	.text
1896  02be               _UART1_SetGuardTime:
1900                     ; 531   UART1->GTR = UART1_GuardTime;
1902  02be c75239        	ld	21049,a
1903                     ; 532 }
1906  02c1 81            	ret
1940                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
1940                     ; 557 {
1941                     	switch	.text
1942  02c2               _UART1_SetPrescaler:
1946                     ; 559   UART1->PSCR = UART1_Prescaler;
1948  02c2 c7523a        	ld	21050,a
1949                     ; 560 }
1952  02c5 81            	ret
2095                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2095                     ; 569 {
2096                     	switch	.text
2097  02c6               _UART1_GetFlagStatus:
2099  02c6 89            	pushw	x
2100  02c7 88            	push	a
2101       00000001      OFST:	set	1
2104                     ; 570   FlagStatus status = RESET;
2106                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2108                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2110  02c8 a30210        	cpw	x,#528
2111  02cb 2610          	jrne	L7501
2112                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2114  02cd 9f            	ld	a,xl
2115  02ce c45237        	and	a,21047
2116  02d1 2706          	jreq	L1601
2117                     ; 582       status = SET;
2119  02d3 a601          	ld	a,#1
2120  02d5 6b01          	ld	(OFST+0,sp),a
2123  02d7 202b          	jra	L5601
2124  02d9               L1601:
2125                     ; 587       status = RESET;
2127  02d9 0f01          	clr	(OFST+0,sp)
2129  02db 2027          	jra	L5601
2130  02dd               L7501:
2131                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2133  02dd 1e02          	ldw	x,(OFST+1,sp)
2134  02df a30101        	cpw	x,#257
2135  02e2 2611          	jrne	L7601
2136                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2138  02e4 c65235        	ld	a,21045
2139  02e7 1503          	bcp	a,(OFST+2,sp)
2140  02e9 2706          	jreq	L1701
2141                     ; 595       status = SET;
2143  02eb a601          	ld	a,#1
2144  02ed 6b01          	ld	(OFST+0,sp),a
2147  02ef 2013          	jra	L5601
2148  02f1               L1701:
2149                     ; 600       status = RESET;
2151  02f1 0f01          	clr	(OFST+0,sp)
2153  02f3 200f          	jra	L5601
2154  02f5               L7601:
2155                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2157  02f5 c65230        	ld	a,21040
2158  02f8 1503          	bcp	a,(OFST+2,sp)
2159  02fa 2706          	jreq	L7701
2160                     ; 608       status = SET;
2162  02fc a601          	ld	a,#1
2163  02fe 6b01          	ld	(OFST+0,sp),a
2166  0300 2002          	jra	L5601
2167  0302               L7701:
2168                     ; 613       status = RESET;
2170  0302 0f01          	clr	(OFST+0,sp)
2172  0304               L5601:
2173                     ; 617   return status;
2175  0304 7b01          	ld	a,(OFST+0,sp)
2178  0306 5b03          	addw	sp,#3
2179  0308 81            	ret
2214                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2214                     ; 647 {
2215                     	switch	.text
2216  0309               _UART1_ClearFlag:
2220                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2222                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2224  0309 a30020        	cpw	x,#32
2225  030c 2606          	jrne	L1211
2226                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2228  030e 35df5230      	mov	21040,#223
2230  0312 2004          	jra	L3211
2231  0314               L1211:
2232                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2234  0314 72195237      	bres	21047,#4
2235  0318               L3211:
2236                     ; 660 }
2239  0318 81            	ret
2321                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2321                     ; 676 {
2322                     	switch	.text
2323  0319               _UART1_GetITStatus:
2325  0319 89            	pushw	x
2326  031a 89            	pushw	x
2327       00000002      OFST:	set	2
2330                     ; 677   ITStatus pendingbitstatus = RESET;
2332                     ; 678   uint8_t itpos = 0;
2334                     ; 679   uint8_t itmask1 = 0;
2336                     ; 680   uint8_t itmask2 = 0;
2338                     ; 681   uint8_t enablestatus = 0;
2340                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2342                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2344  031b 9f            	ld	a,xl
2345  031c a40f          	and	a,#15
2346  031e 5f            	clrw	x
2347  031f 97            	ld	xl,a
2348  0320 a601          	ld	a,#1
2349  0322 5d            	tnzw	x
2350  0323 2704          	jreq	L27
2351  0325               L47:
2352  0325 48            	sll	a
2353  0326 5a            	decw	x
2354  0327 26fc          	jrne	L47
2355  0329               L27:
2356  0329 6b01          	ld	(OFST-1,sp),a
2358                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2360  032b 7b04          	ld	a,(OFST+2,sp)
2361  032d 4e            	swap	a
2362  032e a40f          	and	a,#15
2363  0330 6b02          	ld	(OFST+0,sp),a
2365                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2367  0332 7b02          	ld	a,(OFST+0,sp)
2368  0334 5f            	clrw	x
2369  0335 97            	ld	xl,a
2370  0336 a601          	ld	a,#1
2371  0338 5d            	tnzw	x
2372  0339 2704          	jreq	L67
2373  033b               L001:
2374  033b 48            	sll	a
2375  033c 5a            	decw	x
2376  033d 26fc          	jrne	L001
2377  033f               L67:
2378  033f 6b02          	ld	(OFST+0,sp),a
2380                     ; 695   if (UART1_IT == UART1_IT_PE)
2382  0341 1e03          	ldw	x,(OFST+1,sp)
2383  0343 a30100        	cpw	x,#256
2384  0346 261c          	jrne	L7611
2385                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2387  0348 c65234        	ld	a,21044
2388  034b 1402          	and	a,(OFST+0,sp)
2389  034d 6b02          	ld	(OFST+0,sp),a
2391                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2393  034f c65230        	ld	a,21040
2394  0352 1501          	bcp	a,(OFST-1,sp)
2395  0354 270a          	jreq	L1711
2397  0356 0d02          	tnz	(OFST+0,sp)
2398  0358 2706          	jreq	L1711
2399                     ; 704       pendingbitstatus = SET;
2401  035a a601          	ld	a,#1
2402  035c 6b02          	ld	(OFST+0,sp),a
2405  035e 2041          	jra	L5711
2406  0360               L1711:
2407                     ; 709       pendingbitstatus = RESET;
2409  0360 0f02          	clr	(OFST+0,sp)
2411  0362 203d          	jra	L5711
2412  0364               L7611:
2413                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2415  0364 1e03          	ldw	x,(OFST+1,sp)
2416  0366 a30346        	cpw	x,#838
2417  0369 261c          	jrne	L7711
2418                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2420  036b c65237        	ld	a,21047
2421  036e 1402          	and	a,(OFST+0,sp)
2422  0370 6b02          	ld	(OFST+0,sp),a
2424                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2426  0372 c65237        	ld	a,21047
2427  0375 1501          	bcp	a,(OFST-1,sp)
2428  0377 270a          	jreq	L1021
2430  0379 0d02          	tnz	(OFST+0,sp)
2431  037b 2706          	jreq	L1021
2432                     ; 721       pendingbitstatus = SET;
2434  037d a601          	ld	a,#1
2435  037f 6b02          	ld	(OFST+0,sp),a
2438  0381 201e          	jra	L5711
2439  0383               L1021:
2440                     ; 726       pendingbitstatus = RESET;
2442  0383 0f02          	clr	(OFST+0,sp)
2444  0385 201a          	jra	L5711
2445  0387               L7711:
2446                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2448  0387 c65235        	ld	a,21045
2449  038a 1402          	and	a,(OFST+0,sp)
2450  038c 6b02          	ld	(OFST+0,sp),a
2452                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2454  038e c65230        	ld	a,21040
2455  0391 1501          	bcp	a,(OFST-1,sp)
2456  0393 270a          	jreq	L7021
2458  0395 0d02          	tnz	(OFST+0,sp)
2459  0397 2706          	jreq	L7021
2460                     ; 737       pendingbitstatus = SET;
2462  0399 a601          	ld	a,#1
2463  039b 6b02          	ld	(OFST+0,sp),a
2466  039d 2002          	jra	L5711
2467  039f               L7021:
2468                     ; 742       pendingbitstatus = RESET;
2470  039f 0f02          	clr	(OFST+0,sp)
2472  03a1               L5711:
2473                     ; 747   return  pendingbitstatus;
2475  03a1 7b02          	ld	a,(OFST+0,sp)
2478  03a3 5b04          	addw	sp,#4
2479  03a5 81            	ret
2515                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2515                     ; 776 {
2516                     	switch	.text
2517  03a6               _UART1_ClearITPendingBit:
2521                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2523                     ; 780   if (UART1_IT == UART1_IT_RXNE)
2525  03a6 a30255        	cpw	x,#597
2526  03a9 2606          	jrne	L1321
2527                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2529  03ab 35df5230      	mov	21040,#223
2531  03af 2004          	jra	L3321
2532  03b1               L1321:
2533                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2535  03b1 72195237      	bres	21047,#4
2536  03b5               L3321:
2537                     ; 789 }
2540  03b5 81            	ret
2553                     	xdef	_UART1_ClearITPendingBit
2554                     	xdef	_UART1_GetITStatus
2555                     	xdef	_UART1_ClearFlag
2556                     	xdef	_UART1_GetFlagStatus
2557                     	xdef	_UART1_SetPrescaler
2558                     	xdef	_UART1_SetGuardTime
2559                     	xdef	_UART1_SetAddress
2560                     	xdef	_UART1_SendBreak
2561                     	xdef	_UART1_SendData9
2562                     	xdef	_UART1_SendData8
2563                     	xdef	_UART1_ReceiveData9
2564                     	xdef	_UART1_ReceiveData8
2565                     	xdef	_UART1_ReceiverWakeUpCmd
2566                     	xdef	_UART1_WakeUpConfig
2567                     	xdef	_UART1_SmartCardNACKCmd
2568                     	xdef	_UART1_SmartCardCmd
2569                     	xdef	_UART1_LINCmd
2570                     	xdef	_UART1_LINBreakDetectionConfig
2571                     	xdef	_UART1_IrDACmd
2572                     	xdef	_UART1_IrDAConfig
2573                     	xdef	_UART1_HalfDuplexCmd
2574                     	xdef	_UART1_ITConfig
2575                     	xdef	_UART1_Cmd
2576                     	xdef	_UART1_Init
2577                     	xdef	_UART1_DeInit
2578                     	xref	_CLK_GetClockFreq
2579                     	xref.b	c_lreg
2580                     	xref.b	c_x
2599                     	xref	c_lursh
2600                     	xref	c_lsub
2601                     	xref	c_smul
2602                     	xref	c_ludv
2603                     	xref	c_rtol
2604                     	xref	c_llsh
2605                     	xref	c_ltor
2606                     	end
