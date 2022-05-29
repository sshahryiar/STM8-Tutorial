   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  42                     ; 53 void UART1_DeInit(void)
  42                     ; 54 {
  44                     	switch	.text
  45  0000               _UART1_DeInit:
  49                     ; 57   (void)UART1->SR;
  51  0000 c65230        	ld	a,21040
  52                     ; 58   (void)UART1->DR;
  54  0003 c65231        	ld	a,21041
  55                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  57  0006 725f5233      	clr	21043
  58                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  60  000a 725f5232      	clr	21042
  61                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  63  000e 725f5234      	clr	21044
  64                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  66  0012 725f5235      	clr	21045
  67                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  69  0016 725f5236      	clr	21046
  70                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  72  001a 725f5237      	clr	21047
  73                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  75  001e 725f5238      	clr	21048
  76                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
  78  0022 725f5239      	clr	21049
  79                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
  81  0026 725f523a      	clr	21050
  82                     ; 71 }
  85  002a 81            	ret
 382                     .const:	section	.text
 383  0000               L01:
 384  0000 00000064      	dc.l	100
 385                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 385                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 385                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 385                     ; 93 {
 386                     	switch	.text
 387  002b               _UART1_Init:
 389  002b 520c          	subw	sp,#12
 390       0000000c      OFST:	set	12
 393                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 397                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 399                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 401                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 403                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 405                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 407                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 409                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 411  002d 72195234      	bres	21044,#4
 412                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 414  0031 c65234        	ld	a,21044
 415  0034 1a13          	or	a,(OFST+7,sp)
 416  0036 c75234        	ld	21044,a
 417                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 419  0039 c65236        	ld	a,21046
 420  003c a4cf          	and	a,#207
 421  003e c75236        	ld	21046,a
 422                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 424  0041 c65236        	ld	a,21046
 425  0044 1a14          	or	a,(OFST+8,sp)
 426  0046 c75236        	ld	21046,a
 427                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 429  0049 c65234        	ld	a,21044
 430  004c a4f9          	and	a,#249
 431  004e c75234        	ld	21044,a
 432                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 434  0051 c65234        	ld	a,21044
 435  0054 1a15          	or	a,(OFST+9,sp)
 436  0056 c75234        	ld	21044,a
 437                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 439  0059 725f5232      	clr	21042
 440                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 442  005d c65233        	ld	a,21043
 443  0060 a40f          	and	a,#15
 444  0062 c75233        	ld	21043,a
 445                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 447  0065 c65233        	ld	a,21043
 448  0068 a4f0          	and	a,#240
 449  006a c75233        	ld	21043,a
 450                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 452  006d 96            	ldw	x,sp
 453  006e 1c000f        	addw	x,#OFST+3
 454  0071 cd0000        	call	c_ltor
 456  0074 a604          	ld	a,#4
 457  0076 cd0000        	call	c_llsh
 459  0079 96            	ldw	x,sp
 460  007a 1c0001        	addw	x,#OFST-11
 461  007d cd0000        	call	c_rtol
 464  0080 cd0000        	call	_CLK_GetClockFreq
 466  0083 96            	ldw	x,sp
 467  0084 1c0001        	addw	x,#OFST-11
 468  0087 cd0000        	call	c_ludv
 470  008a 96            	ldw	x,sp
 471  008b 1c0009        	addw	x,#OFST-3
 472  008e cd0000        	call	c_rtol
 475                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 477  0091 96            	ldw	x,sp
 478  0092 1c000f        	addw	x,#OFST+3
 479  0095 cd0000        	call	c_ltor
 481  0098 a604          	ld	a,#4
 482  009a cd0000        	call	c_llsh
 484  009d 96            	ldw	x,sp
 485  009e 1c0001        	addw	x,#OFST-11
 486  00a1 cd0000        	call	c_rtol
 489  00a4 cd0000        	call	_CLK_GetClockFreq
 491  00a7 a664          	ld	a,#100
 492  00a9 cd0000        	call	c_smul
 494  00ac 96            	ldw	x,sp
 495  00ad 1c0001        	addw	x,#OFST-11
 496  00b0 cd0000        	call	c_ludv
 498  00b3 96            	ldw	x,sp
 499  00b4 1c0005        	addw	x,#OFST-7
 500  00b7 cd0000        	call	c_rtol
 503                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 505  00ba 96            	ldw	x,sp
 506  00bb 1c0009        	addw	x,#OFST-3
 507  00be cd0000        	call	c_ltor
 509  00c1 a664          	ld	a,#100
 510  00c3 cd0000        	call	c_smul
 512  00c6 96            	ldw	x,sp
 513  00c7 1c0001        	addw	x,#OFST-11
 514  00ca cd0000        	call	c_rtol
 517  00cd 96            	ldw	x,sp
 518  00ce 1c0005        	addw	x,#OFST-7
 519  00d1 cd0000        	call	c_ltor
 521  00d4 96            	ldw	x,sp
 522  00d5 1c0001        	addw	x,#OFST-11
 523  00d8 cd0000        	call	c_lsub
 525  00db a604          	ld	a,#4
 526  00dd cd0000        	call	c_llsh
 528  00e0 ae0000        	ldw	x,#L01
 529  00e3 cd0000        	call	c_ludv
 531  00e6 b603          	ld	a,c_lreg+3
 532  00e8 a40f          	and	a,#15
 533  00ea ca5233        	or	a,21043
 534  00ed c75233        	ld	21043,a
 535                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 537  00f0 96            	ldw	x,sp
 538  00f1 1c0009        	addw	x,#OFST-3
 539  00f4 cd0000        	call	c_ltor
 541  00f7 a604          	ld	a,#4
 542  00f9 cd0000        	call	c_lursh
 544  00fc b603          	ld	a,c_lreg+3
 545  00fe a4f0          	and	a,#240
 546  0100 b703          	ld	c_lreg+3,a
 547  0102 3f02          	clr	c_lreg+2
 548  0104 3f01          	clr	c_lreg+1
 549  0106 3f00          	clr	c_lreg
 550  0108 b603          	ld	a,c_lreg+3
 551  010a ca5233        	or	a,21043
 552  010d c75233        	ld	21043,a
 553                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 555  0110 c65232        	ld	a,21042
 556  0113 1a0c          	or	a,(OFST+0,sp)
 557  0115 c75232        	ld	21042,a
 558                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 560  0118 c65235        	ld	a,21045
 561  011b a4f3          	and	a,#243
 562  011d c75235        	ld	21045,a
 563                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 565  0120 c65236        	ld	a,21046
 566  0123 a4f8          	and	a,#248
 567  0125 c75236        	ld	21046,a
 568                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 568                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 570  0128 7b16          	ld	a,(OFST+10,sp)
 571  012a a407          	and	a,#7
 572  012c ca5236        	or	a,21046
 573  012f c75236        	ld	21046,a
 574                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 576  0132 7b17          	ld	a,(OFST+11,sp)
 577  0134 a504          	bcp	a,#4
 578  0136 2706          	jreq	L561
 579                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 581  0138 72165235      	bset	21045,#3
 583  013c 2004          	jra	L761
 584  013e               L561:
 585                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 587  013e 72175235      	bres	21045,#3
 588  0142               L761:
 589                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 591  0142 7b17          	ld	a,(OFST+11,sp)
 592  0144 a508          	bcp	a,#8
 593  0146 2706          	jreq	L171
 594                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 596  0148 72145235      	bset	21045,#2
 598  014c 2004          	jra	L371
 599  014e               L171:
 600                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 602  014e 72155235      	bres	21045,#2
 603  0152               L371:
 604                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 606  0152 7b16          	ld	a,(OFST+10,sp)
 607  0154 a580          	bcp	a,#128
 608  0156 2706          	jreq	L571
 609                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 611  0158 72175236      	bres	21046,#3
 613  015c 200a          	jra	L771
 614  015e               L571:
 615                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 617  015e 7b16          	ld	a,(OFST+10,sp)
 618  0160 a408          	and	a,#8
 619  0162 ca5236        	or	a,21046
 620  0165 c75236        	ld	21046,a
 621  0168               L771:
 622                     ; 176 }
 625  0168 5b0c          	addw	sp,#12
 626  016a 81            	ret
 681                     ; 184 void UART1_Cmd(FunctionalState NewState)
 681                     ; 185 {
 682                     	switch	.text
 683  016b               _UART1_Cmd:
 687                     ; 186   if (NewState != DISABLE)
 689  016b 4d            	tnz	a
 690  016c 2706          	jreq	L722
 691                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 693  016e 721b5234      	bres	21044,#5
 695  0172 2004          	jra	L132
 696  0174               L722:
 697                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 699  0174 721a5234      	bset	21044,#5
 700  0178               L132:
 701                     ; 196 }
 704  0178 81            	ret
 825                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 825                     ; 212 {
 826                     	switch	.text
 827  0179               _UART1_ITConfig:
 829  0179 89            	pushw	x
 830  017a 89            	pushw	x
 831       00000002      OFST:	set	2
 834                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 838                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 840                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 842                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 844  017b 9e            	ld	a,xh
 845  017c 6b01          	ld	(OFST-1,sp),a
 847                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 849  017e 9f            	ld	a,xl
 850  017f a40f          	and	a,#15
 851  0181 5f            	clrw	x
 852  0182 97            	ld	xl,a
 853  0183 a601          	ld	a,#1
 854  0185 5d            	tnzw	x
 855  0186 2704          	jreq	L61
 856  0188               L02:
 857  0188 48            	sll	a
 858  0189 5a            	decw	x
 859  018a 26fc          	jrne	L02
 860  018c               L61:
 861  018c 6b02          	ld	(OFST+0,sp),a
 863                     ; 224   if (NewState != DISABLE)
 865  018e 0d07          	tnz	(OFST+5,sp)
 866  0190 272a          	jreq	L503
 867                     ; 227     if (uartreg == 0x01)
 869  0192 7b01          	ld	a,(OFST-1,sp)
 870  0194 a101          	cp	a,#1
 871  0196 260a          	jrne	L703
 872                     ; 229       UART1->CR1 |= itpos;
 874  0198 c65234        	ld	a,21044
 875  019b 1a02          	or	a,(OFST+0,sp)
 876  019d c75234        	ld	21044,a
 878  01a0 2045          	jra	L713
 879  01a2               L703:
 880                     ; 231     else if (uartreg == 0x02)
 882  01a2 7b01          	ld	a,(OFST-1,sp)
 883  01a4 a102          	cp	a,#2
 884  01a6 260a          	jrne	L313
 885                     ; 233       UART1->CR2 |= itpos;
 887  01a8 c65235        	ld	a,21045
 888  01ab 1a02          	or	a,(OFST+0,sp)
 889  01ad c75235        	ld	21045,a
 891  01b0 2035          	jra	L713
 892  01b2               L313:
 893                     ; 237       UART1->CR4 |= itpos;
 895  01b2 c65237        	ld	a,21047
 896  01b5 1a02          	or	a,(OFST+0,sp)
 897  01b7 c75237        	ld	21047,a
 898  01ba 202b          	jra	L713
 899  01bc               L503:
 900                     ; 243     if (uartreg == 0x01)
 902  01bc 7b01          	ld	a,(OFST-1,sp)
 903  01be a101          	cp	a,#1
 904  01c0 260b          	jrne	L123
 905                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
 907  01c2 7b02          	ld	a,(OFST+0,sp)
 908  01c4 43            	cpl	a
 909  01c5 c45234        	and	a,21044
 910  01c8 c75234        	ld	21044,a
 912  01cb 201a          	jra	L713
 913  01cd               L123:
 914                     ; 247     else if (uartreg == 0x02)
 916  01cd 7b01          	ld	a,(OFST-1,sp)
 917  01cf a102          	cp	a,#2
 918  01d1 260b          	jrne	L523
 919                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
 921  01d3 7b02          	ld	a,(OFST+0,sp)
 922  01d5 43            	cpl	a
 923  01d6 c45235        	and	a,21045
 924  01d9 c75235        	ld	21045,a
 926  01dc 2009          	jra	L713
 927  01de               L523:
 928                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
 930  01de 7b02          	ld	a,(OFST+0,sp)
 931  01e0 43            	cpl	a
 932  01e1 c45237        	and	a,21047
 933  01e4 c75237        	ld	21047,a
 934  01e7               L713:
 935                     ; 257 }
 938  01e7 5b04          	addw	sp,#4
 939  01e9 81            	ret
 975                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
 975                     ; 266 {
 976                     	switch	.text
 977  01ea               _UART1_HalfDuplexCmd:
 981                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 983                     ; 269   if (NewState != DISABLE)
 985  01ea 4d            	tnz	a
 986  01eb 2706          	jreq	L743
 987                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
 989  01ed 72165238      	bset	21048,#3
 991  01f1 2004          	jra	L153
 992  01f3               L743:
 993                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
 995  01f3 72175238      	bres	21048,#3
 996  01f7               L153:
 997                     ; 277 }
1000  01f7 81            	ret
1057                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1057                     ; 286 {
1058                     	switch	.text
1059  01f8               _UART1_IrDAConfig:
1063                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1065                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1067  01f8 4d            	tnz	a
1068  01f9 2706          	jreq	L104
1069                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1071  01fb 72145238      	bset	21048,#2
1073  01ff 2004          	jra	L304
1074  0201               L104:
1075                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1077  0201 72155238      	bres	21048,#2
1078  0205               L304:
1079                     ; 297 }
1082  0205 81            	ret
1117                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1117                     ; 306 {
1118                     	switch	.text
1119  0206               _UART1_IrDACmd:
1123                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1125                     ; 310   if (NewState != DISABLE)
1127  0206 4d            	tnz	a
1128  0207 2706          	jreq	L324
1129                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1131  0209 72125238      	bset	21048,#1
1133  020d 2004          	jra	L524
1134  020f               L324:
1135                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1137  020f 72135238      	bres	21048,#1
1138  0213               L524:
1139                     ; 320 }
1142  0213 81            	ret
1201                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1201                     ; 330 {
1202                     	switch	.text
1203  0214               _UART1_LINBreakDetectionConfig:
1207                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1209                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1211  0214 4d            	tnz	a
1212  0215 2706          	jreq	L554
1213                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1215  0217 721a5237      	bset	21047,#5
1217  021b 2004          	jra	L754
1218  021d               L554:
1219                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1221  021d 721b5237      	bres	21047,#5
1222  0221               L754:
1223                     ; 341 }
1226  0221 81            	ret
1261                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1261                     ; 350 {
1262                     	switch	.text
1263  0222               _UART1_LINCmd:
1267                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1269                     ; 353   if (NewState != DISABLE)
1271  0222 4d            	tnz	a
1272  0223 2706          	jreq	L774
1273                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1275  0225 721c5236      	bset	21046,#6
1277  0229 2004          	jra	L105
1278  022b               L774:
1279                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1281  022b 721d5236      	bres	21046,#6
1282  022f               L105:
1283                     ; 363 }
1286  022f 81            	ret
1321                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1321                     ; 372 {
1322                     	switch	.text
1323  0230               _UART1_SmartCardCmd:
1327                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1329                     ; 375   if (NewState != DISABLE)
1331  0230 4d            	tnz	a
1332  0231 2706          	jreq	L125
1333                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1335  0233 721a5238      	bset	21048,#5
1337  0237 2004          	jra	L325
1338  0239               L125:
1339                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1341  0239 721b5238      	bres	21048,#5
1342  023d               L325:
1343                     ; 385 }
1346  023d 81            	ret
1382                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1382                     ; 395 {
1383                     	switch	.text
1384  023e               _UART1_SmartCardNACKCmd:
1388                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1390                     ; 398   if (NewState != DISABLE)
1392  023e 4d            	tnz	a
1393  023f 2706          	jreq	L345
1394                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1396  0241 72185238      	bset	21048,#4
1398  0245 2004          	jra	L545
1399  0247               L345:
1400                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1402  0247 72195238      	bres	21048,#4
1403  024b               L545:
1404                     ; 408 }
1407  024b 81            	ret
1464                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1464                     ; 417 {
1465                     	switch	.text
1466  024c               _UART1_WakeUpConfig:
1470                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1472                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1474  024c 72175234      	bres	21044,#3
1475                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1477  0250 ca5234        	or	a,21044
1478  0253 c75234        	ld	21044,a
1479                     ; 422 }
1482  0256 81            	ret
1518                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1518                     ; 431 {
1519                     	switch	.text
1520  0257               _UART1_ReceiverWakeUpCmd:
1524                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1526                     ; 434   if (NewState != DISABLE)
1528  0257 4d            	tnz	a
1529  0258 2706          	jreq	L316
1530                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1532  025a 72125235      	bset	21045,#1
1534  025e 2004          	jra	L516
1535  0260               L316:
1536                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1538  0260 72135235      	bres	21045,#1
1539  0264               L516:
1540                     ; 444 }
1543  0264 81            	ret
1566                     ; 451 uint8_t UART1_ReceiveData8(void)
1566                     ; 452 {
1567                     	switch	.text
1568  0265               _UART1_ReceiveData8:
1572                     ; 453   return ((uint8_t)UART1->DR);
1574  0265 c65231        	ld	a,21041
1577  0268 81            	ret
1609                     ; 461 uint16_t UART1_ReceiveData9(void)
1609                     ; 462 {
1610                     	switch	.text
1611  0269               _UART1_ReceiveData9:
1613  0269 89            	pushw	x
1614       00000002      OFST:	set	2
1617                     ; 463   uint16_t temp = 0;
1619                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
1621  026a c65234        	ld	a,21044
1622  026d 5f            	clrw	x
1623  026e a480          	and	a,#128
1624  0270 5f            	clrw	x
1625  0271 02            	rlwa	x,a
1626  0272 58            	sllw	x
1627  0273 1f01          	ldw	(OFST-1,sp),x
1629                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
1631  0275 c65231        	ld	a,21041
1632  0278 5f            	clrw	x
1633  0279 97            	ld	xl,a
1634  027a 01            	rrwa	x,a
1635  027b 1a02          	or	a,(OFST+0,sp)
1636  027d 01            	rrwa	x,a
1637  027e 1a01          	or	a,(OFST-1,sp)
1638  0280 01            	rrwa	x,a
1639  0281 01            	rrwa	x,a
1640  0282 a4ff          	and	a,#255
1641  0284 01            	rrwa	x,a
1642  0285 a401          	and	a,#1
1643  0287 01            	rrwa	x,a
1646  0288 5b02          	addw	sp,#2
1647  028a 81            	ret
1679                     ; 474 void UART1_SendData8(uint8_t Data)
1679                     ; 475 {
1680                     	switch	.text
1681  028b               _UART1_SendData8:
1685                     ; 477   UART1->DR = Data;
1687  028b c75231        	ld	21041,a
1688                     ; 478 }
1691  028e 81            	ret
1723                     ; 486 void UART1_SendData9(uint16_t Data)
1723                     ; 487 {
1724                     	switch	.text
1725  028f               _UART1_SendData9:
1727  028f 89            	pushw	x
1728       00000000      OFST:	set	0
1731                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
1733  0290 721d5234      	bres	21044,#6
1734                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
1736  0294 54            	srlw	x
1737  0295 54            	srlw	x
1738  0296 9f            	ld	a,xl
1739  0297 a440          	and	a,#64
1740  0299 ca5234        	or	a,21044
1741  029c c75234        	ld	21044,a
1742                     ; 493   UART1->DR   = (uint8_t)(Data);
1744  029f 7b02          	ld	a,(OFST+2,sp)
1745  02a1 c75231        	ld	21041,a
1746                     ; 494 }
1749  02a4 85            	popw	x
1750  02a5 81            	ret
1773                     ; 501 void UART1_SendBreak(void)
1773                     ; 502 {
1774                     	switch	.text
1775  02a6               _UART1_SendBreak:
1779                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
1781  02a6 72105235      	bset	21045,#0
1782                     ; 504 }
1785  02aa 81            	ret
1817                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
1817                     ; 512 {
1818                     	switch	.text
1819  02ab               _UART1_SetAddress:
1821  02ab 88            	push	a
1822       00000000      OFST:	set	0
1825                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
1827                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
1829  02ac c65237        	ld	a,21047
1830  02af a4f0          	and	a,#240
1831  02b1 c75237        	ld	21047,a
1832                     ; 519   UART1->CR4 |= UART1_Address;
1834  02b4 c65237        	ld	a,21047
1835  02b7 1a01          	or	a,(OFST+1,sp)
1836  02b9 c75237        	ld	21047,a
1837                     ; 520 }
1840  02bc 84            	pop	a
1841  02bd 81            	ret
1873                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
1873                     ; 529 {
1874                     	switch	.text
1875  02be               _UART1_SetGuardTime:
1879                     ; 531   UART1->GTR = UART1_GuardTime;
1881  02be c75239        	ld	21049,a
1882                     ; 532 }
1885  02c1 81            	ret
1917                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
1917                     ; 557 {
1918                     	switch	.text
1919  02c2               _UART1_SetPrescaler:
1923                     ; 559   UART1->PSCR = UART1_Prescaler;
1925  02c2 c7523a        	ld	21050,a
1926                     ; 560 }
1929  02c5 81            	ret
2072                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2072                     ; 569 {
2073                     	switch	.text
2074  02c6               _UART1_GetFlagStatus:
2076  02c6 89            	pushw	x
2077  02c7 88            	push	a
2078       00000001      OFST:	set	1
2081                     ; 570   FlagStatus status = RESET;
2083                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2085                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2087  02c8 a30210        	cpw	x,#528
2088  02cb 2610          	jrne	L1301
2089                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2091  02cd 9f            	ld	a,xl
2092  02ce c45237        	and	a,21047
2093  02d1 2706          	jreq	L3301
2094                     ; 582       status = SET;
2096  02d3 a601          	ld	a,#1
2097  02d5 6b01          	ld	(OFST+0,sp),a
2100  02d7 202b          	jra	L7301
2101  02d9               L3301:
2102                     ; 587       status = RESET;
2104  02d9 0f01          	clr	(OFST+0,sp)
2106  02db 2027          	jra	L7301
2107  02dd               L1301:
2108                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2110  02dd 1e02          	ldw	x,(OFST+1,sp)
2111  02df a30101        	cpw	x,#257
2112  02e2 2611          	jrne	L1401
2113                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2115  02e4 c65235        	ld	a,21045
2116  02e7 1503          	bcp	a,(OFST+2,sp)
2117  02e9 2706          	jreq	L3401
2118                     ; 595       status = SET;
2120  02eb a601          	ld	a,#1
2121  02ed 6b01          	ld	(OFST+0,sp),a
2124  02ef 2013          	jra	L7301
2125  02f1               L3401:
2126                     ; 600       status = RESET;
2128  02f1 0f01          	clr	(OFST+0,sp)
2130  02f3 200f          	jra	L7301
2131  02f5               L1401:
2132                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2134  02f5 c65230        	ld	a,21040
2135  02f8 1503          	bcp	a,(OFST+2,sp)
2136  02fa 2706          	jreq	L1501
2137                     ; 608       status = SET;
2139  02fc a601          	ld	a,#1
2140  02fe 6b01          	ld	(OFST+0,sp),a
2143  0300 2002          	jra	L7301
2144  0302               L1501:
2145                     ; 613       status = RESET;
2147  0302 0f01          	clr	(OFST+0,sp)
2149  0304               L7301:
2150                     ; 617   return status;
2152  0304 7b01          	ld	a,(OFST+0,sp)
2155  0306 5b03          	addw	sp,#3
2156  0308 81            	ret
2191                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2191                     ; 647 {
2192                     	switch	.text
2193  0309               _UART1_ClearFlag:
2197                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2199                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2201  0309 a30020        	cpw	x,#32
2202  030c 2606          	jrne	L3701
2203                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2205  030e 35df5230      	mov	21040,#223
2207  0312 2004          	jra	L5701
2208  0314               L3701:
2209                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2211  0314 72195237      	bres	21047,#4
2212  0318               L5701:
2213                     ; 660 }
2216  0318 81            	ret
2290                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2290                     ; 676 {
2291                     	switch	.text
2292  0319               _UART1_GetITStatus:
2294  0319 89            	pushw	x
2295  031a 89            	pushw	x
2296       00000002      OFST:	set	2
2299                     ; 677   ITStatus pendingbitstatus = RESET;
2301                     ; 678   uint8_t itpos = 0;
2303                     ; 679   uint8_t itmask1 = 0;
2305                     ; 680   uint8_t itmask2 = 0;
2307                     ; 681   uint8_t enablestatus = 0;
2309                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2311                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2313  031b 9f            	ld	a,xl
2314  031c a40f          	and	a,#15
2315  031e 5f            	clrw	x
2316  031f 97            	ld	xl,a
2317  0320 a601          	ld	a,#1
2318  0322 5d            	tnzw	x
2319  0323 2704          	jreq	L27
2320  0325               L47:
2321  0325 48            	sll	a
2322  0326 5a            	decw	x
2323  0327 26fc          	jrne	L47
2324  0329               L27:
2325  0329 6b01          	ld	(OFST-1,sp),a
2327                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2329  032b 7b04          	ld	a,(OFST+2,sp)
2330  032d 4e            	swap	a
2331  032e a40f          	and	a,#15
2332  0330 6b02          	ld	(OFST+0,sp),a
2334                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2336  0332 7b02          	ld	a,(OFST+0,sp)
2337  0334 5f            	clrw	x
2338  0335 97            	ld	xl,a
2339  0336 a601          	ld	a,#1
2340  0338 5d            	tnzw	x
2341  0339 2704          	jreq	L67
2342  033b               L001:
2343  033b 48            	sll	a
2344  033c 5a            	decw	x
2345  033d 26fc          	jrne	L001
2346  033f               L67:
2347  033f 6b02          	ld	(OFST+0,sp),a
2349                     ; 695   if (UART1_IT == UART1_IT_PE)
2351  0341 1e03          	ldw	x,(OFST+1,sp)
2352  0343 a30100        	cpw	x,#256
2353  0346 261c          	jrne	L1311
2354                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2356  0348 c65234        	ld	a,21044
2357  034b 1402          	and	a,(OFST+0,sp)
2358  034d 6b02          	ld	(OFST+0,sp),a
2360                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2362  034f c65230        	ld	a,21040
2363  0352 1501          	bcp	a,(OFST-1,sp)
2364  0354 270a          	jreq	L3311
2366  0356 0d02          	tnz	(OFST+0,sp)
2367  0358 2706          	jreq	L3311
2368                     ; 704       pendingbitstatus = SET;
2370  035a a601          	ld	a,#1
2371  035c 6b02          	ld	(OFST+0,sp),a
2374  035e 2041          	jra	L7311
2375  0360               L3311:
2376                     ; 709       pendingbitstatus = RESET;
2378  0360 0f02          	clr	(OFST+0,sp)
2380  0362 203d          	jra	L7311
2381  0364               L1311:
2382                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2384  0364 1e03          	ldw	x,(OFST+1,sp)
2385  0366 a30346        	cpw	x,#838
2386  0369 261c          	jrne	L1411
2387                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2389  036b c65237        	ld	a,21047
2390  036e 1402          	and	a,(OFST+0,sp)
2391  0370 6b02          	ld	(OFST+0,sp),a
2393                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2395  0372 c65237        	ld	a,21047
2396  0375 1501          	bcp	a,(OFST-1,sp)
2397  0377 270a          	jreq	L3411
2399  0379 0d02          	tnz	(OFST+0,sp)
2400  037b 2706          	jreq	L3411
2401                     ; 721       pendingbitstatus = SET;
2403  037d a601          	ld	a,#1
2404  037f 6b02          	ld	(OFST+0,sp),a
2407  0381 201e          	jra	L7311
2408  0383               L3411:
2409                     ; 726       pendingbitstatus = RESET;
2411  0383 0f02          	clr	(OFST+0,sp)
2413  0385 201a          	jra	L7311
2414  0387               L1411:
2415                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2417  0387 c65235        	ld	a,21045
2418  038a 1402          	and	a,(OFST+0,sp)
2419  038c 6b02          	ld	(OFST+0,sp),a
2421                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2423  038e c65230        	ld	a,21040
2424  0391 1501          	bcp	a,(OFST-1,sp)
2425  0393 270a          	jreq	L1511
2427  0395 0d02          	tnz	(OFST+0,sp)
2428  0397 2706          	jreq	L1511
2429                     ; 737       pendingbitstatus = SET;
2431  0399 a601          	ld	a,#1
2432  039b 6b02          	ld	(OFST+0,sp),a
2435  039d 2002          	jra	L7311
2436  039f               L1511:
2437                     ; 742       pendingbitstatus = RESET;
2439  039f 0f02          	clr	(OFST+0,sp)
2441  03a1               L7311:
2442                     ; 747   return  pendingbitstatus;
2444  03a1 7b02          	ld	a,(OFST+0,sp)
2447  03a3 5b04          	addw	sp,#4
2448  03a5 81            	ret
2484                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2484                     ; 776 {
2485                     	switch	.text
2486  03a6               _UART1_ClearITPendingBit:
2490                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2492                     ; 780   if (UART1_IT == UART1_IT_RXNE)
2494  03a6 a30255        	cpw	x,#597
2495  03a9 2606          	jrne	L3711
2496                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2498  03ab 35df5230      	mov	21040,#223
2500  03af 2004          	jra	L5711
2501  03b1               L3711:
2502                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2504  03b1 72195237      	bres	21047,#4
2505  03b5               L5711:
2506                     ; 789 }
2509  03b5 81            	ret
2522                     	xdef	_UART1_ClearITPendingBit
2523                     	xdef	_UART1_GetITStatus
2524                     	xdef	_UART1_ClearFlag
2525                     	xdef	_UART1_GetFlagStatus
2526                     	xdef	_UART1_SetPrescaler
2527                     	xdef	_UART1_SetGuardTime
2528                     	xdef	_UART1_SetAddress
2529                     	xdef	_UART1_SendBreak
2530                     	xdef	_UART1_SendData9
2531                     	xdef	_UART1_SendData8
2532                     	xdef	_UART1_ReceiveData9
2533                     	xdef	_UART1_ReceiveData8
2534                     	xdef	_UART1_ReceiverWakeUpCmd
2535                     	xdef	_UART1_WakeUpConfig
2536                     	xdef	_UART1_SmartCardNACKCmd
2537                     	xdef	_UART1_SmartCardCmd
2538                     	xdef	_UART1_LINCmd
2539                     	xdef	_UART1_LINBreakDetectionConfig
2540                     	xdef	_UART1_IrDACmd
2541                     	xdef	_UART1_IrDAConfig
2542                     	xdef	_UART1_HalfDuplexCmd
2543                     	xdef	_UART1_ITConfig
2544                     	xdef	_UART1_Cmd
2545                     	xdef	_UART1_Init
2546                     	xdef	_UART1_DeInit
2547                     	xref	_CLK_GetClockFreq
2548                     	xref.b	c_lreg
2549                     	xref.b	c_x
2568                     	xref	c_lursh
2569                     	xref	c_lsub
2570                     	xref	c_smul
2571                     	xref	c_ludv
2572                     	xref	c_rtol
2573                     	xref	c_llsh
2574                     	xref	c_ltor
2575                     	end
