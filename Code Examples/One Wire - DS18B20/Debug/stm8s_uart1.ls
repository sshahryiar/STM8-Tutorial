   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
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
 388                     .const:	section	.text
 389  0000               L01:
 390  0000 00000064      	dc.l	100
 391                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 391                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 391                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 391                     ; 93 {
 392                     	switch	.text
 393  002b               _UART1_Init:
 395  002b 520c          	subw	sp,#12
 396       0000000c      OFST:	set	12
 399                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 403                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 405                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 407                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 409                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 411                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 413                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 415                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 417  002d 72195234      	bres	21044,#4
 418                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 420  0031 c65234        	ld	a,21044
 421  0034 1a13          	or	a,(OFST+7,sp)
 422  0036 c75234        	ld	21044,a
 423                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 425  0039 c65236        	ld	a,21046
 426  003c a4cf          	and	a,#207
 427  003e c75236        	ld	21046,a
 428                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 430  0041 c65236        	ld	a,21046
 431  0044 1a14          	or	a,(OFST+8,sp)
 432  0046 c75236        	ld	21046,a
 433                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 435  0049 c65234        	ld	a,21044
 436  004c a4f9          	and	a,#249
 437  004e c75234        	ld	21044,a
 438                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 440  0051 c65234        	ld	a,21044
 441  0054 1a15          	or	a,(OFST+9,sp)
 442  0056 c75234        	ld	21044,a
 443                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 445  0059 725f5232      	clr	21042
 446                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 448  005d c65233        	ld	a,21043
 449  0060 a40f          	and	a,#15
 450  0062 c75233        	ld	21043,a
 451                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 453  0065 c65233        	ld	a,21043
 454  0068 a4f0          	and	a,#240
 455  006a c75233        	ld	21043,a
 456                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 458  006d 96            	ldw	x,sp
 459  006e 1c000f        	addw	x,#OFST+3
 460  0071 cd0000        	call	c_ltor
 462  0074 a604          	ld	a,#4
 463  0076 cd0000        	call	c_llsh
 465  0079 96            	ldw	x,sp
 466  007a 1c0001        	addw	x,#OFST-11
 467  007d cd0000        	call	c_rtol
 470  0080 cd0000        	call	_CLK_GetClockFreq
 472  0083 96            	ldw	x,sp
 473  0084 1c0001        	addw	x,#OFST-11
 474  0087 cd0000        	call	c_ludv
 476  008a 96            	ldw	x,sp
 477  008b 1c0009        	addw	x,#OFST-3
 478  008e cd0000        	call	c_rtol
 481                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 483  0091 96            	ldw	x,sp
 484  0092 1c000f        	addw	x,#OFST+3
 485  0095 cd0000        	call	c_ltor
 487  0098 a604          	ld	a,#4
 488  009a cd0000        	call	c_llsh
 490  009d 96            	ldw	x,sp
 491  009e 1c0001        	addw	x,#OFST-11
 492  00a1 cd0000        	call	c_rtol
 495  00a4 cd0000        	call	_CLK_GetClockFreq
 497  00a7 a664          	ld	a,#100
 498  00a9 cd0000        	call	c_smul
 500  00ac 96            	ldw	x,sp
 501  00ad 1c0001        	addw	x,#OFST-11
 502  00b0 cd0000        	call	c_ludv
 504  00b3 96            	ldw	x,sp
 505  00b4 1c0005        	addw	x,#OFST-7
 506  00b7 cd0000        	call	c_rtol
 509                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 511  00ba 96            	ldw	x,sp
 512  00bb 1c0009        	addw	x,#OFST-3
 513  00be cd0000        	call	c_ltor
 515  00c1 a664          	ld	a,#100
 516  00c3 cd0000        	call	c_smul
 518  00c6 96            	ldw	x,sp
 519  00c7 1c0001        	addw	x,#OFST-11
 520  00ca cd0000        	call	c_rtol
 523  00cd 96            	ldw	x,sp
 524  00ce 1c0005        	addw	x,#OFST-7
 525  00d1 cd0000        	call	c_ltor
 527  00d4 96            	ldw	x,sp
 528  00d5 1c0001        	addw	x,#OFST-11
 529  00d8 cd0000        	call	c_lsub
 531  00db a604          	ld	a,#4
 532  00dd cd0000        	call	c_llsh
 534  00e0 ae0000        	ldw	x,#L01
 535  00e3 cd0000        	call	c_ludv
 537  00e6 b603          	ld	a,c_lreg+3
 538  00e8 a40f          	and	a,#15
 539  00ea ca5233        	or	a,21043
 540  00ed c75233        	ld	21043,a
 541                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 543  00f0 96            	ldw	x,sp
 544  00f1 1c0009        	addw	x,#OFST-3
 545  00f4 cd0000        	call	c_ltor
 547  00f7 a604          	ld	a,#4
 548  00f9 cd0000        	call	c_lursh
 550  00fc b603          	ld	a,c_lreg+3
 551  00fe a4f0          	and	a,#240
 552  0100 b703          	ld	c_lreg+3,a
 553  0102 3f02          	clr	c_lreg+2
 554  0104 3f01          	clr	c_lreg+1
 555  0106 3f00          	clr	c_lreg
 556  0108 b603          	ld	a,c_lreg+3
 557  010a ca5233        	or	a,21043
 558  010d c75233        	ld	21043,a
 559                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 561  0110 c65232        	ld	a,21042
 562  0113 1a0c          	or	a,(OFST+0,sp)
 563  0115 c75232        	ld	21042,a
 564                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 566  0118 c65235        	ld	a,21045
 567  011b a4f3          	and	a,#243
 568  011d c75235        	ld	21045,a
 569                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 571  0120 c65236        	ld	a,21046
 572  0123 a4f8          	and	a,#248
 573  0125 c75236        	ld	21046,a
 574                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 574                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 576  0128 7b16          	ld	a,(OFST+10,sp)
 577  012a a407          	and	a,#7
 578  012c ca5236        	or	a,21046
 579  012f c75236        	ld	21046,a
 580                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 582  0132 7b17          	ld	a,(OFST+11,sp)
 583  0134 a504          	bcp	a,#4
 584  0136 2706          	jreq	L371
 585                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 587  0138 72165235      	bset	21045,#3
 589  013c 2004          	jra	L571
 590  013e               L371:
 591                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 593  013e 72175235      	bres	21045,#3
 594  0142               L571:
 595                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 597  0142 7b17          	ld	a,(OFST+11,sp)
 598  0144 a508          	bcp	a,#8
 599  0146 2706          	jreq	L771
 600                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 602  0148 72145235      	bset	21045,#2
 604  014c 2004          	jra	L102
 605  014e               L771:
 606                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 608  014e 72155235      	bres	21045,#2
 609  0152               L102:
 610                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 612  0152 7b16          	ld	a,(OFST+10,sp)
 613  0154 a580          	bcp	a,#128
 614  0156 2706          	jreq	L302
 615                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 617  0158 72175236      	bres	21046,#3
 619  015c 200a          	jra	L502
 620  015e               L302:
 621                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 623  015e 7b16          	ld	a,(OFST+10,sp)
 624  0160 a408          	and	a,#8
 625  0162 ca5236        	or	a,21046
 626  0165 c75236        	ld	21046,a
 627  0168               L502:
 628                     ; 176 }
 631  0168 5b0c          	addw	sp,#12
 632  016a 81            	ret
 687                     ; 184 void UART1_Cmd(FunctionalState NewState)
 687                     ; 185 {
 688                     	switch	.text
 689  016b               _UART1_Cmd:
 693                     ; 186   if (NewState != DISABLE)
 695  016b 4d            	tnz	a
 696  016c 2706          	jreq	L532
 697                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 699  016e 721b5234      	bres	21044,#5
 701  0172 2004          	jra	L732
 702  0174               L532:
 703                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 705  0174 721a5234      	bset	21044,#5
 706  0178               L732:
 707                     ; 196 }
 710  0178 81            	ret
 835                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 835                     ; 212 {
 836                     	switch	.text
 837  0179               _UART1_ITConfig:
 839  0179 89            	pushw	x
 840  017a 89            	pushw	x
 841       00000002      OFST:	set	2
 844                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 848                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 850                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 852                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 854  017b 9e            	ld	a,xh
 855  017c 6b01          	ld	(OFST-1,sp),a
 857                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 859  017e 9f            	ld	a,xl
 860  017f a40f          	and	a,#15
 861  0181 5f            	clrw	x
 862  0182 97            	ld	xl,a
 863  0183 a601          	ld	a,#1
 864  0185 5d            	tnzw	x
 865  0186 2704          	jreq	L61
 866  0188               L02:
 867  0188 48            	sll	a
 868  0189 5a            	decw	x
 869  018a 26fc          	jrne	L02
 870  018c               L61:
 871  018c 6b02          	ld	(OFST+0,sp),a
 873                     ; 224   if (NewState != DISABLE)
 875  018e 0d07          	tnz	(OFST+5,sp)
 876  0190 272a          	jreq	L713
 877                     ; 227     if (uartreg == 0x01)
 879  0192 7b01          	ld	a,(OFST-1,sp)
 880  0194 a101          	cp	a,#1
 881  0196 260a          	jrne	L123
 882                     ; 229       UART1->CR1 |= itpos;
 884  0198 c65234        	ld	a,21044
 885  019b 1a02          	or	a,(OFST+0,sp)
 886  019d c75234        	ld	21044,a
 888  01a0 2045          	jra	L133
 889  01a2               L123:
 890                     ; 231     else if (uartreg == 0x02)
 892  01a2 7b01          	ld	a,(OFST-1,sp)
 893  01a4 a102          	cp	a,#2
 894  01a6 260a          	jrne	L523
 895                     ; 233       UART1->CR2 |= itpos;
 897  01a8 c65235        	ld	a,21045
 898  01ab 1a02          	or	a,(OFST+0,sp)
 899  01ad c75235        	ld	21045,a
 901  01b0 2035          	jra	L133
 902  01b2               L523:
 903                     ; 237       UART1->CR4 |= itpos;
 905  01b2 c65237        	ld	a,21047
 906  01b5 1a02          	or	a,(OFST+0,sp)
 907  01b7 c75237        	ld	21047,a
 908  01ba 202b          	jra	L133
 909  01bc               L713:
 910                     ; 243     if (uartreg == 0x01)
 912  01bc 7b01          	ld	a,(OFST-1,sp)
 913  01be a101          	cp	a,#1
 914  01c0 260b          	jrne	L333
 915                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
 917  01c2 7b02          	ld	a,(OFST+0,sp)
 918  01c4 43            	cpl	a
 919  01c5 c45234        	and	a,21044
 920  01c8 c75234        	ld	21044,a
 922  01cb 201a          	jra	L133
 923  01cd               L333:
 924                     ; 247     else if (uartreg == 0x02)
 926  01cd 7b01          	ld	a,(OFST-1,sp)
 927  01cf a102          	cp	a,#2
 928  01d1 260b          	jrne	L733
 929                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
 931  01d3 7b02          	ld	a,(OFST+0,sp)
 932  01d5 43            	cpl	a
 933  01d6 c45235        	and	a,21045
 934  01d9 c75235        	ld	21045,a
 936  01dc 2009          	jra	L133
 937  01de               L733:
 938                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
 940  01de 7b02          	ld	a,(OFST+0,sp)
 941  01e0 43            	cpl	a
 942  01e1 c45237        	and	a,21047
 943  01e4 c75237        	ld	21047,a
 944  01e7               L133:
 945                     ; 257 }
 948  01e7 5b04          	addw	sp,#4
 949  01e9 81            	ret
 985                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
 985                     ; 266 {
 986                     	switch	.text
 987  01ea               _UART1_HalfDuplexCmd:
 991                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 993                     ; 269   if (NewState != DISABLE)
 995  01ea 4d            	tnz	a
 996  01eb 2706          	jreq	L163
 997                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
 999  01ed 72165238      	bset	21048,#3
1001  01f1 2004          	jra	L363
1002  01f3               L163:
1003                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1005  01f3 72175238      	bres	21048,#3
1006  01f7               L363:
1007                     ; 277 }
1010  01f7 81            	ret
1067                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1067                     ; 286 {
1068                     	switch	.text
1069  01f8               _UART1_IrDAConfig:
1073                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1075                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1077  01f8 4d            	tnz	a
1078  01f9 2706          	jreq	L314
1079                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1081  01fb 72145238      	bset	21048,#2
1083  01ff 2004          	jra	L514
1084  0201               L314:
1085                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1087  0201 72155238      	bres	21048,#2
1088  0205               L514:
1089                     ; 297 }
1092  0205 81            	ret
1127                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1127                     ; 306 {
1128                     	switch	.text
1129  0206               _UART1_IrDACmd:
1133                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1135                     ; 310   if (NewState != DISABLE)
1137  0206 4d            	tnz	a
1138  0207 2706          	jreq	L534
1139                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1141  0209 72125238      	bset	21048,#1
1143  020d 2004          	jra	L734
1144  020f               L534:
1145                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1147  020f 72135238      	bres	21048,#1
1148  0213               L734:
1149                     ; 320 }
1152  0213 81            	ret
1211                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1211                     ; 330 {
1212                     	switch	.text
1213  0214               _UART1_LINBreakDetectionConfig:
1217                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1219                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1221  0214 4d            	tnz	a
1222  0215 2706          	jreq	L764
1223                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1225  0217 721a5237      	bset	21047,#5
1227  021b 2004          	jra	L174
1228  021d               L764:
1229                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1231  021d 721b5237      	bres	21047,#5
1232  0221               L174:
1233                     ; 341 }
1236  0221 81            	ret
1271                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1271                     ; 350 {
1272                     	switch	.text
1273  0222               _UART1_LINCmd:
1277                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1279                     ; 353   if (NewState != DISABLE)
1281  0222 4d            	tnz	a
1282  0223 2706          	jreq	L115
1283                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1285  0225 721c5236      	bset	21046,#6
1287  0229 2004          	jra	L315
1288  022b               L115:
1289                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1291  022b 721d5236      	bres	21046,#6
1292  022f               L315:
1293                     ; 363 }
1296  022f 81            	ret
1331                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1331                     ; 372 {
1332                     	switch	.text
1333  0230               _UART1_SmartCardCmd:
1337                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1339                     ; 375   if (NewState != DISABLE)
1341  0230 4d            	tnz	a
1342  0231 2706          	jreq	L335
1343                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1345  0233 721a5238      	bset	21048,#5
1347  0237 2004          	jra	L535
1348  0239               L335:
1349                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1351  0239 721b5238      	bres	21048,#5
1352  023d               L535:
1353                     ; 385 }
1356  023d 81            	ret
1392                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1392                     ; 395 {
1393                     	switch	.text
1394  023e               _UART1_SmartCardNACKCmd:
1398                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1400                     ; 398   if (NewState != DISABLE)
1402  023e 4d            	tnz	a
1403  023f 2706          	jreq	L555
1404                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1406  0241 72185238      	bset	21048,#4
1408  0245 2004          	jra	L755
1409  0247               L555:
1410                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1412  0247 72195238      	bres	21048,#4
1413  024b               L755:
1414                     ; 408 }
1417  024b 81            	ret
1474                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1474                     ; 417 {
1475                     	switch	.text
1476  024c               _UART1_WakeUpConfig:
1480                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1482                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1484  024c 72175234      	bres	21044,#3
1485                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1487  0250 ca5234        	or	a,21044
1488  0253 c75234        	ld	21044,a
1489                     ; 422 }
1492  0256 81            	ret
1528                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1528                     ; 431 {
1529                     	switch	.text
1530  0257               _UART1_ReceiverWakeUpCmd:
1534                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1536                     ; 434   if (NewState != DISABLE)
1538  0257 4d            	tnz	a
1539  0258 2706          	jreq	L526
1540                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1542  025a 72125235      	bset	21045,#1
1544  025e 2004          	jra	L726
1545  0260               L526:
1546                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1548  0260 72135235      	bres	21045,#1
1549  0264               L726:
1550                     ; 444 }
1553  0264 81            	ret
1576                     ; 451 uint8_t UART1_ReceiveData8(void)
1576                     ; 452 {
1577                     	switch	.text
1578  0265               _UART1_ReceiveData8:
1582                     ; 453   return ((uint8_t)UART1->DR);
1584  0265 c65231        	ld	a,21041
1587  0268 81            	ret
1621                     ; 461 uint16_t UART1_ReceiveData9(void)
1621                     ; 462 {
1622                     	switch	.text
1623  0269               _UART1_ReceiveData9:
1625  0269 89            	pushw	x
1626       00000002      OFST:	set	2
1629                     ; 463   uint16_t temp = 0;
1631                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
1633  026a c65234        	ld	a,21044
1634  026d 5f            	clrw	x
1635  026e a480          	and	a,#128
1636  0270 5f            	clrw	x
1637  0271 02            	rlwa	x,a
1638  0272 58            	sllw	x
1639  0273 1f01          	ldw	(OFST-1,sp),x
1641                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
1643  0275 c65231        	ld	a,21041
1644  0278 5f            	clrw	x
1645  0279 97            	ld	xl,a
1646  027a 01            	rrwa	x,a
1647  027b 1a02          	or	a,(OFST+0,sp)
1648  027d 01            	rrwa	x,a
1649  027e 1a01          	or	a,(OFST-1,sp)
1650  0280 01            	rrwa	x,a
1651  0281 01            	rrwa	x,a
1652  0282 a4ff          	and	a,#255
1653  0284 01            	rrwa	x,a
1654  0285 a401          	and	a,#1
1655  0287 01            	rrwa	x,a
1658  0288 5b02          	addw	sp,#2
1659  028a 81            	ret
1693                     ; 474 void UART1_SendData8(uint8_t Data)
1693                     ; 475 {
1694                     	switch	.text
1695  028b               _UART1_SendData8:
1699                     ; 477   UART1->DR = Data;
1701  028b c75231        	ld	21041,a
1702                     ; 478 }
1705  028e 81            	ret
1739                     ; 486 void UART1_SendData9(uint16_t Data)
1739                     ; 487 {
1740                     	switch	.text
1741  028f               _UART1_SendData9:
1743  028f 89            	pushw	x
1744       00000000      OFST:	set	0
1747                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
1749  0290 721d5234      	bres	21044,#6
1750                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
1752  0294 54            	srlw	x
1753  0295 54            	srlw	x
1754  0296 9f            	ld	a,xl
1755  0297 a440          	and	a,#64
1756  0299 ca5234        	or	a,21044
1757  029c c75234        	ld	21044,a
1758                     ; 493   UART1->DR   = (uint8_t)(Data);
1760  029f 7b02          	ld	a,(OFST+2,sp)
1761  02a1 c75231        	ld	21041,a
1762                     ; 494 }
1765  02a4 85            	popw	x
1766  02a5 81            	ret
1789                     ; 501 void UART1_SendBreak(void)
1789                     ; 502 {
1790                     	switch	.text
1791  02a6               _UART1_SendBreak:
1795                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
1797  02a6 72105235      	bset	21045,#0
1798                     ; 504 }
1801  02aa 81            	ret
1835                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
1835                     ; 512 {
1836                     	switch	.text
1837  02ab               _UART1_SetAddress:
1839  02ab 88            	push	a
1840       00000000      OFST:	set	0
1843                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
1845                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
1847  02ac c65237        	ld	a,21047
1848  02af a4f0          	and	a,#240
1849  02b1 c75237        	ld	21047,a
1850                     ; 519   UART1->CR4 |= UART1_Address;
1852  02b4 c65237        	ld	a,21047
1853  02b7 1a01          	or	a,(OFST+1,sp)
1854  02b9 c75237        	ld	21047,a
1855                     ; 520 }
1858  02bc 84            	pop	a
1859  02bd 81            	ret
1893                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
1893                     ; 529 {
1894                     	switch	.text
1895  02be               _UART1_SetGuardTime:
1899                     ; 531   UART1->GTR = UART1_GuardTime;
1901  02be c75239        	ld	21049,a
1902                     ; 532 }
1905  02c1 81            	ret
1939                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
1939                     ; 557 {
1940                     	switch	.text
1941  02c2               _UART1_SetPrescaler:
1945                     ; 559   UART1->PSCR = UART1_Prescaler;
1947  02c2 c7523a        	ld	21050,a
1948                     ; 560 }
1951  02c5 81            	ret
2094                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2094                     ; 569 {
2095                     	switch	.text
2096  02c6               _UART1_GetFlagStatus:
2098  02c6 89            	pushw	x
2099  02c7 88            	push	a
2100       00000001      OFST:	set	1
2103                     ; 570   FlagStatus status = RESET;
2105                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2107                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2109  02c8 a30210        	cpw	x,#528
2110  02cb 2610          	jrne	L7501
2111                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2113  02cd 9f            	ld	a,xl
2114  02ce c45237        	and	a,21047
2115  02d1 2706          	jreq	L1601
2116                     ; 582       status = SET;
2118  02d3 a601          	ld	a,#1
2119  02d5 6b01          	ld	(OFST+0,sp),a
2122  02d7 202b          	jra	L5601
2123  02d9               L1601:
2124                     ; 587       status = RESET;
2126  02d9 0f01          	clr	(OFST+0,sp)
2128  02db 2027          	jra	L5601
2129  02dd               L7501:
2130                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2132  02dd 1e02          	ldw	x,(OFST+1,sp)
2133  02df a30101        	cpw	x,#257
2134  02e2 2611          	jrne	L7601
2135                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2137  02e4 c65235        	ld	a,21045
2138  02e7 1503          	bcp	a,(OFST+2,sp)
2139  02e9 2706          	jreq	L1701
2140                     ; 595       status = SET;
2142  02eb a601          	ld	a,#1
2143  02ed 6b01          	ld	(OFST+0,sp),a
2146  02ef 2013          	jra	L5601
2147  02f1               L1701:
2148                     ; 600       status = RESET;
2150  02f1 0f01          	clr	(OFST+0,sp)
2152  02f3 200f          	jra	L5601
2153  02f5               L7601:
2154                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2156  02f5 c65230        	ld	a,21040
2157  02f8 1503          	bcp	a,(OFST+2,sp)
2158  02fa 2706          	jreq	L7701
2159                     ; 608       status = SET;
2161  02fc a601          	ld	a,#1
2162  02fe 6b01          	ld	(OFST+0,sp),a
2165  0300 2002          	jra	L5601
2166  0302               L7701:
2167                     ; 613       status = RESET;
2169  0302 0f01          	clr	(OFST+0,sp)
2171  0304               L5601:
2172                     ; 617   return status;
2174  0304 7b01          	ld	a,(OFST+0,sp)
2177  0306 5b03          	addw	sp,#3
2178  0308 81            	ret
2213                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2213                     ; 647 {
2214                     	switch	.text
2215  0309               _UART1_ClearFlag:
2219                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2221                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2223  0309 a30020        	cpw	x,#32
2224  030c 2606          	jrne	L1211
2225                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2227  030e 35df5230      	mov	21040,#223
2229  0312 2004          	jra	L3211
2230  0314               L1211:
2231                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2233  0314 72195237      	bres	21047,#4
2234  0318               L3211:
2235                     ; 660 }
2238  0318 81            	ret
2320                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2320                     ; 676 {
2321                     	switch	.text
2322  0319               _UART1_GetITStatus:
2324  0319 89            	pushw	x
2325  031a 89            	pushw	x
2326       00000002      OFST:	set	2
2329                     ; 677   ITStatus pendingbitstatus = RESET;
2331                     ; 678   uint8_t itpos = 0;
2333                     ; 679   uint8_t itmask1 = 0;
2335                     ; 680   uint8_t itmask2 = 0;
2337                     ; 681   uint8_t enablestatus = 0;
2339                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2341                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2343  031b 9f            	ld	a,xl
2344  031c a40f          	and	a,#15
2345  031e 5f            	clrw	x
2346  031f 97            	ld	xl,a
2347  0320 a601          	ld	a,#1
2348  0322 5d            	tnzw	x
2349  0323 2704          	jreq	L27
2350  0325               L47:
2351  0325 48            	sll	a
2352  0326 5a            	decw	x
2353  0327 26fc          	jrne	L47
2354  0329               L27:
2355  0329 6b01          	ld	(OFST-1,sp),a
2357                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2359  032b 7b04          	ld	a,(OFST+2,sp)
2360  032d 4e            	swap	a
2361  032e a40f          	and	a,#15
2362  0330 6b02          	ld	(OFST+0,sp),a
2364                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2366  0332 7b02          	ld	a,(OFST+0,sp)
2367  0334 5f            	clrw	x
2368  0335 97            	ld	xl,a
2369  0336 a601          	ld	a,#1
2370  0338 5d            	tnzw	x
2371  0339 2704          	jreq	L67
2372  033b               L001:
2373  033b 48            	sll	a
2374  033c 5a            	decw	x
2375  033d 26fc          	jrne	L001
2376  033f               L67:
2377  033f 6b02          	ld	(OFST+0,sp),a
2379                     ; 695   if (UART1_IT == UART1_IT_PE)
2381  0341 1e03          	ldw	x,(OFST+1,sp)
2382  0343 a30100        	cpw	x,#256
2383  0346 261c          	jrne	L7611
2384                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2386  0348 c65234        	ld	a,21044
2387  034b 1402          	and	a,(OFST+0,sp)
2388  034d 6b02          	ld	(OFST+0,sp),a
2390                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2392  034f c65230        	ld	a,21040
2393  0352 1501          	bcp	a,(OFST-1,sp)
2394  0354 270a          	jreq	L1711
2396  0356 0d02          	tnz	(OFST+0,sp)
2397  0358 2706          	jreq	L1711
2398                     ; 704       pendingbitstatus = SET;
2400  035a a601          	ld	a,#1
2401  035c 6b02          	ld	(OFST+0,sp),a
2404  035e 2041          	jra	L5711
2405  0360               L1711:
2406                     ; 709       pendingbitstatus = RESET;
2408  0360 0f02          	clr	(OFST+0,sp)
2410  0362 203d          	jra	L5711
2411  0364               L7611:
2412                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2414  0364 1e03          	ldw	x,(OFST+1,sp)
2415  0366 a30346        	cpw	x,#838
2416  0369 261c          	jrne	L7711
2417                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2419  036b c65237        	ld	a,21047
2420  036e 1402          	and	a,(OFST+0,sp)
2421  0370 6b02          	ld	(OFST+0,sp),a
2423                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2425  0372 c65237        	ld	a,21047
2426  0375 1501          	bcp	a,(OFST-1,sp)
2427  0377 270a          	jreq	L1021
2429  0379 0d02          	tnz	(OFST+0,sp)
2430  037b 2706          	jreq	L1021
2431                     ; 721       pendingbitstatus = SET;
2433  037d a601          	ld	a,#1
2434  037f 6b02          	ld	(OFST+0,sp),a
2437  0381 201e          	jra	L5711
2438  0383               L1021:
2439                     ; 726       pendingbitstatus = RESET;
2441  0383 0f02          	clr	(OFST+0,sp)
2443  0385 201a          	jra	L5711
2444  0387               L7711:
2445                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2447  0387 c65235        	ld	a,21045
2448  038a 1402          	and	a,(OFST+0,sp)
2449  038c 6b02          	ld	(OFST+0,sp),a
2451                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2453  038e c65230        	ld	a,21040
2454  0391 1501          	bcp	a,(OFST-1,sp)
2455  0393 270a          	jreq	L7021
2457  0395 0d02          	tnz	(OFST+0,sp)
2458  0397 2706          	jreq	L7021
2459                     ; 737       pendingbitstatus = SET;
2461  0399 a601          	ld	a,#1
2462  039b 6b02          	ld	(OFST+0,sp),a
2465  039d 2002          	jra	L5711
2466  039f               L7021:
2467                     ; 742       pendingbitstatus = RESET;
2469  039f 0f02          	clr	(OFST+0,sp)
2471  03a1               L5711:
2472                     ; 747   return  pendingbitstatus;
2474  03a1 7b02          	ld	a,(OFST+0,sp)
2477  03a3 5b04          	addw	sp,#4
2478  03a5 81            	ret
2514                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2514                     ; 776 {
2515                     	switch	.text
2516  03a6               _UART1_ClearITPendingBit:
2520                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2522                     ; 780   if (UART1_IT == UART1_IT_RXNE)
2524  03a6 a30255        	cpw	x,#597
2525  03a9 2606          	jrne	L1321
2526                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2528  03ab 35df5230      	mov	21040,#223
2530  03af 2004          	jra	L3321
2531  03b1               L1321:
2532                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2534  03b1 72195237      	bres	21047,#4
2535  03b5               L3321:
2536                     ; 789 }
2539  03b5 81            	ret
2552                     	xdef	_UART1_ClearITPendingBit
2553                     	xdef	_UART1_GetITStatus
2554                     	xdef	_UART1_ClearFlag
2555                     	xdef	_UART1_GetFlagStatus
2556                     	xdef	_UART1_SetPrescaler
2557                     	xdef	_UART1_SetGuardTime
2558                     	xdef	_UART1_SetAddress
2559                     	xdef	_UART1_SendBreak
2560                     	xdef	_UART1_SendData9
2561                     	xdef	_UART1_SendData8
2562                     	xdef	_UART1_ReceiveData9
2563                     	xdef	_UART1_ReceiveData8
2564                     	xdef	_UART1_ReceiverWakeUpCmd
2565                     	xdef	_UART1_WakeUpConfig
2566                     	xdef	_UART1_SmartCardNACKCmd
2567                     	xdef	_UART1_SmartCardCmd
2568                     	xdef	_UART1_LINCmd
2569                     	xdef	_UART1_LINBreakDetectionConfig
2570                     	xdef	_UART1_IrDACmd
2571                     	xdef	_UART1_IrDAConfig
2572                     	xdef	_UART1_HalfDuplexCmd
2573                     	xdef	_UART1_ITConfig
2574                     	xdef	_UART1_Cmd
2575                     	xdef	_UART1_Init
2576                     	xdef	_UART1_DeInit
2577                     	xref	_CLK_GetClockFreq
2578                     	xref.b	c_lreg
2579                     	xref.b	c_x
2598                     	xref	c_lursh
2599                     	xref	c_lsub
2600                     	xref	c_smul
2601                     	xref	c_ludv
2602                     	xref	c_rtol
2603                     	xref	c_llsh
2604                     	xref	c_ltor
2605                     	end
