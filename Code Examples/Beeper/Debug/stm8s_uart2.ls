   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  43                     ; 53 void UART2_DeInit(void)
  43                     ; 54 {
  45                     	switch	.text
  46  0000               _UART2_DeInit:
  50                     ; 57   (void) UART2->SR;
  52  0000 c65240        	ld	a,21056
  53                     ; 58   (void)UART2->DR;
  55  0003 c65241        	ld	a,21057
  56                     ; 60   UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*  Set UART2_BRR2 to reset value 0x00 */
  58  0006 725f5243      	clr	21059
  59                     ; 61   UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*  Set UART2_BRR1 to reset value 0x00 */
  61  000a 725f5242      	clr	21058
  62                     ; 63   UART2->CR1 = UART2_CR1_RESET_VALUE; /*  Set UART2_CR1 to reset value 0x00  */
  64  000e 725f5244      	clr	21060
  65                     ; 64   UART2->CR2 = UART2_CR2_RESET_VALUE; /*  Set UART2_CR2 to reset value 0x00  */
  67  0012 725f5245      	clr	21061
  68                     ; 65   UART2->CR3 = UART2_CR3_RESET_VALUE; /*  Set UART2_CR3 to reset value 0x00  */
  70  0016 725f5246      	clr	21062
  71                     ; 66   UART2->CR4 = UART2_CR4_RESET_VALUE; /*  Set UART2_CR4 to reset value 0x00  */
  73  001a 725f5247      	clr	21063
  74                     ; 67   UART2->CR5 = UART2_CR5_RESET_VALUE; /*  Set UART2_CR5 to reset value 0x00  */
  76  001e 725f5248      	clr	21064
  77                     ; 68   UART2->CR6 = UART2_CR6_RESET_VALUE; /*  Set UART2_CR6 to reset value 0x00  */
  79  0022 725f5249      	clr	21065
  80                     ; 69 }
  83  0026 81            	ret
 404                     .const:	section	.text
 405  0000               L01:
 406  0000 00000064      	dc.l	100
 407                     ; 85 void UART2_Init(uint32_t BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
 407                     ; 86 {
 408                     	switch	.text
 409  0027               _UART2_Init:
 411  0027 520e          	subw	sp,#14
 412       0000000e      OFST:	set	14
 415                     ; 87   uint8_t BRR2_1 = 0, BRR2_2 = 0;
 419                     ; 88   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 423                     ; 91   assert_param(IS_UART2_BAUDRATE_OK(BaudRate));
 425                     ; 92   assert_param(IS_UART2_WORDLENGTH_OK(WordLength));
 427                     ; 93   assert_param(IS_UART2_STOPBITS_OK(StopBits));
 429                     ; 94   assert_param(IS_UART2_PARITY_OK(Parity));
 431                     ; 95   assert_param(IS_UART2_MODE_OK((uint8_t)Mode));
 433                     ; 96   assert_param(IS_UART2_SYNCMODE_OK((uint8_t)SyncMode));
 435                     ; 99   UART2->CR1 &= (uint8_t)(~UART2_CR1_M);
 437  0029 72195244      	bres	21060,#4
 438                     ; 101   UART2->CR1 |= (uint8_t)WordLength; 
 440  002d c65244        	ld	a,21060
 441  0030 1a15          	or	a,(OFST+7,sp)
 442  0032 c75244        	ld	21060,a
 443                     ; 104   UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
 445  0035 c65246        	ld	a,21062
 446  0038 a4cf          	and	a,#207
 447  003a c75246        	ld	21062,a
 448                     ; 106   UART2->CR3 |= (uint8_t)StopBits; 
 450  003d c65246        	ld	a,21062
 451  0040 1a16          	or	a,(OFST+8,sp)
 452  0042 c75246        	ld	21062,a
 453                     ; 109   UART2->CR1 &= (uint8_t)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));
 455  0045 c65244        	ld	a,21060
 456  0048 a4f9          	and	a,#249
 457  004a c75244        	ld	21060,a
 458                     ; 111   UART2->CR1 |= (uint8_t)Parity;
 460  004d c65244        	ld	a,21060
 461  0050 1a17          	or	a,(OFST+9,sp)
 462  0052 c75244        	ld	21060,a
 463                     ; 114   UART2->BRR1 &= (uint8_t)(~UART2_BRR1_DIVM);
 465  0055 725f5242      	clr	21058
 466                     ; 116   UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVM);
 468  0059 c65243        	ld	a,21059
 469  005c a40f          	and	a,#15
 470  005e c75243        	ld	21059,a
 471                     ; 118   UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVF);
 473  0061 c65243        	ld	a,21059
 474  0064 a4f0          	and	a,#240
 475  0066 c75243        	ld	21059,a
 476                     ; 121   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 478  0069 96            	ldw	x,sp
 479  006a 1c0011        	addw	x,#OFST+3
 480  006d cd0000        	call	c_ltor
 482  0070 a604          	ld	a,#4
 483  0072 cd0000        	call	c_llsh
 485  0075 96            	ldw	x,sp
 486  0076 1c0001        	addw	x,#OFST-13
 487  0079 cd0000        	call	c_rtol
 490  007c cd0000        	call	_CLK_GetClockFreq
 492  007f 96            	ldw	x,sp
 493  0080 1c0001        	addw	x,#OFST-13
 494  0083 cd0000        	call	c_ludv
 496  0086 96            	ldw	x,sp
 497  0087 1c000b        	addw	x,#OFST-3
 498  008a cd0000        	call	c_rtol
 501                     ; 122   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 503  008d 96            	ldw	x,sp
 504  008e 1c0011        	addw	x,#OFST+3
 505  0091 cd0000        	call	c_ltor
 507  0094 a604          	ld	a,#4
 508  0096 cd0000        	call	c_llsh
 510  0099 96            	ldw	x,sp
 511  009a 1c0001        	addw	x,#OFST-13
 512  009d cd0000        	call	c_rtol
 515  00a0 cd0000        	call	_CLK_GetClockFreq
 517  00a3 a664          	ld	a,#100
 518  00a5 cd0000        	call	c_smul
 520  00a8 96            	ldw	x,sp
 521  00a9 1c0001        	addw	x,#OFST-13
 522  00ac cd0000        	call	c_ludv
 524  00af 96            	ldw	x,sp
 525  00b0 1c0007        	addw	x,#OFST-7
 526  00b3 cd0000        	call	c_rtol
 529                     ; 126   BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 529                     ; 127                                 << 4) / 100) & (uint8_t)0x0F); 
 531  00b6 96            	ldw	x,sp
 532  00b7 1c000b        	addw	x,#OFST-3
 533  00ba cd0000        	call	c_ltor
 535  00bd a664          	ld	a,#100
 536  00bf cd0000        	call	c_smul
 538  00c2 96            	ldw	x,sp
 539  00c3 1c0001        	addw	x,#OFST-13
 540  00c6 cd0000        	call	c_rtol
 543  00c9 96            	ldw	x,sp
 544  00ca 1c0007        	addw	x,#OFST-7
 545  00cd cd0000        	call	c_ltor
 547  00d0 96            	ldw	x,sp
 548  00d1 1c0001        	addw	x,#OFST-13
 549  00d4 cd0000        	call	c_lsub
 551  00d7 a604          	ld	a,#4
 552  00d9 cd0000        	call	c_llsh
 554  00dc ae0000        	ldw	x,#L01
 555  00df cd0000        	call	c_ludv
 557  00e2 b603          	ld	a,c_lreg+3
 558  00e4 a40f          	and	a,#15
 559  00e6 6b05          	ld	(OFST-9,sp),a
 561                     ; 128   BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 563  00e8 96            	ldw	x,sp
 564  00e9 1c000b        	addw	x,#OFST-3
 565  00ec cd0000        	call	c_ltor
 567  00ef a604          	ld	a,#4
 568  00f1 cd0000        	call	c_lursh
 570  00f4 b603          	ld	a,c_lreg+3
 571  00f6 a4f0          	and	a,#240
 572  00f8 b703          	ld	c_lreg+3,a
 573  00fa 3f02          	clr	c_lreg+2
 574  00fc 3f01          	clr	c_lreg+1
 575  00fe 3f00          	clr	c_lreg
 576  0100 b603          	ld	a,c_lreg+3
 577  0102 6b06          	ld	(OFST-8,sp),a
 579                     ; 130   UART2->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 581  0104 7b05          	ld	a,(OFST-9,sp)
 582  0106 1a06          	or	a,(OFST-8,sp)
 583  0108 c75243        	ld	21059,a
 584                     ; 132   UART2->BRR1 = (uint8_t)BaudRate_Mantissa;           
 586  010b 7b0e          	ld	a,(OFST+0,sp)
 587  010d c75242        	ld	21058,a
 588                     ; 135   UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
 590  0110 c65245        	ld	a,21061
 591  0113 a4f3          	and	a,#243
 592  0115 c75245        	ld	21061,a
 593                     ; 137   UART2->CR3 &= (uint8_t)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL);
 595  0118 c65246        	ld	a,21062
 596  011b a4f8          	and	a,#248
 597  011d c75246        	ld	21062,a
 598                     ; 139   UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART2_CR3_CPOL | \
 598                     ; 140     UART2_CR3_CPHA | UART2_CR3_LBCL));
 600  0120 7b18          	ld	a,(OFST+10,sp)
 601  0122 a407          	and	a,#7
 602  0124 ca5246        	or	a,21062
 603  0127 c75246        	ld	21062,a
 604                     ; 142   if ((uint8_t)(Mode & UART2_MODE_TX_ENABLE))
 606  012a 7b19          	ld	a,(OFST+11,sp)
 607  012c a504          	bcp	a,#4
 608  012e 2706          	jreq	L302
 609                     ; 145     UART2->CR2 |= (uint8_t)UART2_CR2_TEN;
 611  0130 72165245      	bset	21061,#3
 613  0134 2004          	jra	L502
 614  0136               L302:
 615                     ; 150     UART2->CR2 &= (uint8_t)(~UART2_CR2_TEN);
 617  0136 72175245      	bres	21061,#3
 618  013a               L502:
 619                     ; 152   if ((uint8_t)(Mode & UART2_MODE_RX_ENABLE))
 621  013a 7b19          	ld	a,(OFST+11,sp)
 622  013c a508          	bcp	a,#8
 623  013e 2706          	jreq	L702
 624                     ; 155     UART2->CR2 |= (uint8_t)UART2_CR2_REN;
 626  0140 72145245      	bset	21061,#2
 628  0144 2004          	jra	L112
 629  0146               L702:
 630                     ; 160     UART2->CR2 &= (uint8_t)(~UART2_CR2_REN);
 632  0146 72155245      	bres	21061,#2
 633  014a               L112:
 634                     ; 164   if ((uint8_t)(SyncMode & UART2_SYNCMODE_CLOCK_DISABLE))
 636  014a 7b18          	ld	a,(OFST+10,sp)
 637  014c a580          	bcp	a,#128
 638  014e 2706          	jreq	L312
 639                     ; 167     UART2->CR3 &= (uint8_t)(~UART2_CR3_CKEN); 
 641  0150 72175246      	bres	21062,#3
 643  0154 200a          	jra	L512
 644  0156               L312:
 645                     ; 171     UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & UART2_CR3_CKEN);
 647  0156 7b18          	ld	a,(OFST+10,sp)
 648  0158 a408          	and	a,#8
 649  015a ca5246        	or	a,21062
 650  015d c75246        	ld	21062,a
 651  0160               L512:
 652                     ; 173 }
 655  0160 5b0e          	addw	sp,#14
 656  0162 81            	ret
 711                     ; 181 void UART2_Cmd(FunctionalState NewState)
 711                     ; 182 {
 712                     	switch	.text
 713  0163               _UART2_Cmd:
 717                     ; 183   if (NewState != DISABLE)
 719  0163 4d            	tnz	a
 720  0164 2706          	jreq	L542
 721                     ; 186     UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
 723  0166 721b5244      	bres	21060,#5
 725  016a 2004          	jra	L742
 726  016c               L542:
 727                     ; 191     UART2->CR1 |= UART2_CR1_UARTD; 
 729  016c 721a5244      	bset	21060,#5
 730  0170               L742:
 731                     ; 193 }
 734  0170 81            	ret
 866                     ; 210 void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)
 866                     ; 211 {
 867                     	switch	.text
 868  0171               _UART2_ITConfig:
 870  0171 89            	pushw	x
 871  0172 89            	pushw	x
 872       00000002      OFST:	set	2
 875                     ; 212   uint8_t uartreg = 0, itpos = 0x00;
 879                     ; 215   assert_param(IS_UART2_CONFIG_IT_OK(UART2_IT));
 881                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 883                     ; 219   uartreg = (uint8_t)((uint16_t)UART2_IT >> 0x08);
 885  0173 9e            	ld	a,xh
 886  0174 6b01          	ld	(OFST-1,sp),a
 888                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
 890  0176 9f            	ld	a,xl
 891  0177 a40f          	and	a,#15
 892  0179 5f            	clrw	x
 893  017a 97            	ld	xl,a
 894  017b a601          	ld	a,#1
 895  017d 5d            	tnzw	x
 896  017e 2704          	jreq	L61
 897  0180               L02:
 898  0180 48            	sll	a
 899  0181 5a            	decw	x
 900  0182 26fc          	jrne	L02
 901  0184               L61:
 902  0184 6b02          	ld	(OFST+0,sp),a
 904                     ; 224   if (NewState != DISABLE)
 906  0186 0d07          	tnz	(OFST+5,sp)
 907  0188 273a          	jreq	L133
 908                     ; 227     if (uartreg == 0x01)
 910  018a 7b01          	ld	a,(OFST-1,sp)
 911  018c a101          	cp	a,#1
 912  018e 260a          	jrne	L333
 913                     ; 229       UART2->CR1 |= itpos;
 915  0190 c65244        	ld	a,21060
 916  0193 1a02          	or	a,(OFST+0,sp)
 917  0195 c75244        	ld	21060,a
 919  0198 2066          	jra	L743
 920  019a               L333:
 921                     ; 231     else if (uartreg == 0x02)
 923  019a 7b01          	ld	a,(OFST-1,sp)
 924  019c a102          	cp	a,#2
 925  019e 260a          	jrne	L733
 926                     ; 233       UART2->CR2 |= itpos;
 928  01a0 c65245        	ld	a,21061
 929  01a3 1a02          	or	a,(OFST+0,sp)
 930  01a5 c75245        	ld	21061,a
 932  01a8 2056          	jra	L743
 933  01aa               L733:
 934                     ; 235     else if (uartreg == 0x03)
 936  01aa 7b01          	ld	a,(OFST-1,sp)
 937  01ac a103          	cp	a,#3
 938  01ae 260a          	jrne	L343
 939                     ; 237       UART2->CR4 |= itpos;
 941  01b0 c65247        	ld	a,21063
 942  01b3 1a02          	or	a,(OFST+0,sp)
 943  01b5 c75247        	ld	21063,a
 945  01b8 2046          	jra	L743
 946  01ba               L343:
 947                     ; 241       UART2->CR6 |= itpos;
 949  01ba c65249        	ld	a,21065
 950  01bd 1a02          	or	a,(OFST+0,sp)
 951  01bf c75249        	ld	21065,a
 952  01c2 203c          	jra	L743
 953  01c4               L133:
 954                     ; 247     if (uartreg == 0x01)
 956  01c4 7b01          	ld	a,(OFST-1,sp)
 957  01c6 a101          	cp	a,#1
 958  01c8 260b          	jrne	L153
 959                     ; 249       UART2->CR1 &= (uint8_t)(~itpos);
 961  01ca 7b02          	ld	a,(OFST+0,sp)
 962  01cc 43            	cpl	a
 963  01cd c45244        	and	a,21060
 964  01d0 c75244        	ld	21060,a
 966  01d3 202b          	jra	L743
 967  01d5               L153:
 968                     ; 251     else if (uartreg == 0x02)
 970  01d5 7b01          	ld	a,(OFST-1,sp)
 971  01d7 a102          	cp	a,#2
 972  01d9 260b          	jrne	L553
 973                     ; 253       UART2->CR2 &= (uint8_t)(~itpos);
 975  01db 7b02          	ld	a,(OFST+0,sp)
 976  01dd 43            	cpl	a
 977  01de c45245        	and	a,21061
 978  01e1 c75245        	ld	21061,a
 980  01e4 201a          	jra	L743
 981  01e6               L553:
 982                     ; 255     else if (uartreg == 0x03)
 984  01e6 7b01          	ld	a,(OFST-1,sp)
 985  01e8 a103          	cp	a,#3
 986  01ea 260b          	jrne	L163
 987                     ; 257       UART2->CR4 &= (uint8_t)(~itpos);
 989  01ec 7b02          	ld	a,(OFST+0,sp)
 990  01ee 43            	cpl	a
 991  01ef c45247        	and	a,21063
 992  01f2 c75247        	ld	21063,a
 994  01f5 2009          	jra	L743
 995  01f7               L163:
 996                     ; 261       UART2->CR6 &= (uint8_t)(~itpos);
 998  01f7 7b02          	ld	a,(OFST+0,sp)
 999  01f9 43            	cpl	a
1000  01fa c45249        	and	a,21065
1001  01fd c75249        	ld	21065,a
1002  0200               L743:
1003                     ; 264 }
1006  0200 5b04          	addw	sp,#4
1007  0202 81            	ret
1064                     ; 272 void UART2_IrDAConfig(UART2_IrDAMode_TypeDef UART2_IrDAMode)
1064                     ; 273 {
1065                     	switch	.text
1066  0203               _UART2_IrDAConfig:
1070                     ; 274   assert_param(IS_UART2_IRDAMODE_OK(UART2_IrDAMode));
1072                     ; 276   if (UART2_IrDAMode != UART2_IRDAMODE_NORMAL)
1074  0203 4d            	tnz	a
1075  0204 2706          	jreq	L314
1076                     ; 278     UART2->CR5 |= UART2_CR5_IRLP;
1078  0206 72145248      	bset	21064,#2
1080  020a 2004          	jra	L514
1081  020c               L314:
1082                     ; 282     UART2->CR5 &= ((uint8_t)~UART2_CR5_IRLP);
1084  020c 72155248      	bres	21064,#2
1085  0210               L514:
1086                     ; 284 }
1089  0210 81            	ret
1124                     ; 292 void UART2_IrDACmd(FunctionalState NewState)
1124                     ; 293 {
1125                     	switch	.text
1126  0211               _UART2_IrDACmd:
1130                     ; 295   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1132                     ; 297   if (NewState != DISABLE)
1134  0211 4d            	tnz	a
1135  0212 2706          	jreq	L534
1136                     ; 300     UART2->CR5 |= UART2_CR5_IREN;
1138  0214 72125248      	bset	21064,#1
1140  0218 2004          	jra	L734
1141  021a               L534:
1142                     ; 305     UART2->CR5 &= ((uint8_t)~UART2_CR5_IREN);
1144  021a 72135248      	bres	21064,#1
1145  021e               L734:
1146                     ; 307 }
1149  021e 81            	ret
1208                     ; 316 void UART2_LINBreakDetectionConfig(UART2_LINBreakDetectionLength_TypeDef UART2_LINBreakDetectionLength)
1208                     ; 317 {
1209                     	switch	.text
1210  021f               _UART2_LINBreakDetectionConfig:
1214                     ; 319   assert_param(IS_UART2_LINBREAKDETECTIONLENGTH_OK(UART2_LINBreakDetectionLength));
1216                     ; 321   if (UART2_LINBreakDetectionLength != UART2_LINBREAKDETECTIONLENGTH_10BITS)
1218  021f 4d            	tnz	a
1219  0220 2706          	jreq	L764
1220                     ; 323     UART2->CR4 |= UART2_CR4_LBDL;
1222  0222 721a5247      	bset	21063,#5
1224  0226 2004          	jra	L174
1225  0228               L764:
1226                     ; 327     UART2->CR4 &= ((uint8_t)~UART2_CR4_LBDL);
1228  0228 721b5247      	bres	21063,#5
1229  022c               L174:
1230                     ; 329 }
1233  022c 81            	ret
1354                     ; 341 void UART2_LINConfig(UART2_LinMode_TypeDef UART2_Mode, 
1354                     ; 342                      UART2_LinAutosync_TypeDef UART2_Autosync, 
1354                     ; 343                      UART2_LinDivUp_TypeDef UART2_DivUp)
1354                     ; 344 {
1355                     	switch	.text
1356  022d               _UART2_LINConfig:
1358  022d 89            	pushw	x
1359       00000000      OFST:	set	0
1362                     ; 346   assert_param(IS_UART2_SLAVE_OK(UART2_Mode));
1364                     ; 347   assert_param(IS_UART2_AUTOSYNC_OK(UART2_Autosync));
1366                     ; 348   assert_param(IS_UART2_DIVUP_OK(UART2_DivUp));
1368                     ; 350   if (UART2_Mode != UART2_LIN_MODE_MASTER)
1370  022e 9e            	ld	a,xh
1371  022f 4d            	tnz	a
1372  0230 2706          	jreq	L155
1373                     ; 352     UART2->CR6 |=  UART2_CR6_LSLV;
1375  0232 721a5249      	bset	21065,#5
1377  0236 2004          	jra	L355
1378  0238               L155:
1379                     ; 356     UART2->CR6 &= ((uint8_t)~UART2_CR6_LSLV);
1381  0238 721b5249      	bres	21065,#5
1382  023c               L355:
1383                     ; 359   if (UART2_Autosync != UART2_LIN_AUTOSYNC_DISABLE)
1385  023c 0d02          	tnz	(OFST+2,sp)
1386  023e 2706          	jreq	L555
1387                     ; 361     UART2->CR6 |=  UART2_CR6_LASE ;
1389  0240 72185249      	bset	21065,#4
1391  0244 2004          	jra	L755
1392  0246               L555:
1393                     ; 365     UART2->CR6 &= ((uint8_t)~ UART2_CR6_LASE );
1395  0246 72195249      	bres	21065,#4
1396  024a               L755:
1397                     ; 368   if (UART2_DivUp != UART2_LIN_DIVUP_LBRR1)
1399  024a 0d05          	tnz	(OFST+5,sp)
1400  024c 2706          	jreq	L165
1401                     ; 370     UART2->CR6 |=  UART2_CR6_LDUM;
1403  024e 721e5249      	bset	21065,#7
1405  0252 2004          	jra	L365
1406  0254               L165:
1407                     ; 374     UART2->CR6 &= ((uint8_t)~ UART2_CR6_LDUM);
1409  0254 721f5249      	bres	21065,#7
1410  0258               L365:
1411                     ; 376 }
1414  0258 85            	popw	x
1415  0259 81            	ret
1450                     ; 384 void UART2_LINCmd(FunctionalState NewState)
1450                     ; 385 {
1451                     	switch	.text
1452  025a               _UART2_LINCmd:
1456                     ; 386   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1458                     ; 388   if (NewState != DISABLE)
1460  025a 4d            	tnz	a
1461  025b 2706          	jreq	L306
1462                     ; 391     UART2->CR3 |= UART2_CR3_LINEN;
1464  025d 721c5246      	bset	21062,#6
1466  0261 2004          	jra	L506
1467  0263               L306:
1468                     ; 396     UART2->CR3 &= ((uint8_t)~UART2_CR3_LINEN);
1470  0263 721d5246      	bres	21062,#6
1471  0267               L506:
1472                     ; 398 }
1475  0267 81            	ret
1510                     ; 406 void UART2_SmartCardCmd(FunctionalState NewState)
1510                     ; 407 {
1511                     	switch	.text
1512  0268               _UART2_SmartCardCmd:
1516                     ; 409   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1518                     ; 411   if (NewState != DISABLE)
1520  0268 4d            	tnz	a
1521  0269 2706          	jreq	L526
1522                     ; 414     UART2->CR5 |= UART2_CR5_SCEN;
1524  026b 721a5248      	bset	21064,#5
1526  026f 2004          	jra	L726
1527  0271               L526:
1528                     ; 419     UART2->CR5 &= ((uint8_t)(~UART2_CR5_SCEN));
1530  0271 721b5248      	bres	21064,#5
1531  0275               L726:
1532                     ; 421 }
1535  0275 81            	ret
1571                     ; 429 void UART2_SmartCardNACKCmd(FunctionalState NewState)
1571                     ; 430 {
1572                     	switch	.text
1573  0276               _UART2_SmartCardNACKCmd:
1577                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1579                     ; 434   if (NewState != DISABLE)
1581  0276 4d            	tnz	a
1582  0277 2706          	jreq	L746
1583                     ; 437     UART2->CR5 |= UART2_CR5_NACK;
1585  0279 72185248      	bset	21064,#4
1587  027d 2004          	jra	L156
1588  027f               L746:
1589                     ; 442     UART2->CR5 &= ((uint8_t)~(UART2_CR5_NACK));
1591  027f 72195248      	bres	21064,#4
1592  0283               L156:
1593                     ; 444 }
1596  0283 81            	ret
1653                     ; 452 void UART2_WakeUpConfig(UART2_WakeUp_TypeDef UART2_WakeUp)
1653                     ; 453 {
1654                     	switch	.text
1655  0284               _UART2_WakeUpConfig:
1659                     ; 454   assert_param(IS_UART2_WAKEUP_OK(UART2_WakeUp));
1661                     ; 456   UART2->CR1 &= ((uint8_t)~UART2_CR1_WAKE);
1663  0284 72175244      	bres	21060,#3
1664                     ; 457   UART2->CR1 |= (uint8_t)UART2_WakeUp;
1666  0288 ca5244        	or	a,21060
1667  028b c75244        	ld	21060,a
1668                     ; 458 }
1671  028e 81            	ret
1707                     ; 466 void UART2_ReceiverWakeUpCmd(FunctionalState NewState)
1707                     ; 467 {
1708                     	switch	.text
1709  028f               _UART2_ReceiverWakeUpCmd:
1713                     ; 468   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1715                     ; 470   if (NewState != DISABLE)
1717  028f 4d            	tnz	a
1718  0290 2706          	jreq	L717
1719                     ; 473     UART2->CR2 |= UART2_CR2_RWU;
1721  0292 72125245      	bset	21061,#1
1723  0296 2004          	jra	L127
1724  0298               L717:
1725                     ; 478     UART2->CR2 &= ((uint8_t)~UART2_CR2_RWU);
1727  0298 72135245      	bres	21061,#1
1728  029c               L127:
1729                     ; 480 }
1732  029c 81            	ret
1755                     ; 487 uint8_t UART2_ReceiveData8(void)
1755                     ; 488 {
1756                     	switch	.text
1757  029d               _UART2_ReceiveData8:
1761                     ; 489   return ((uint8_t)UART2->DR);
1763  029d c65241        	ld	a,21057
1766  02a0 81            	ret
1800                     ; 497 uint16_t UART2_ReceiveData9(void)
1800                     ; 498 {
1801                     	switch	.text
1802  02a1               _UART2_ReceiveData9:
1804  02a1 89            	pushw	x
1805       00000002      OFST:	set	2
1808                     ; 499   uint16_t temp = 0;
1810                     ; 501   temp = ((uint16_t)(((uint16_t)((uint16_t)UART2->CR1 & (uint16_t)UART2_CR1_R8)) << 1));
1812  02a2 c65244        	ld	a,21060
1813  02a5 5f            	clrw	x
1814  02a6 a480          	and	a,#128
1815  02a8 5f            	clrw	x
1816  02a9 02            	rlwa	x,a
1817  02aa 58            	sllw	x
1818  02ab 1f01          	ldw	(OFST-1,sp),x
1820                     ; 503   return (uint16_t)((((uint16_t)UART2->DR) | temp) & ((uint16_t)0x01FF));
1822  02ad c65241        	ld	a,21057
1823  02b0 5f            	clrw	x
1824  02b1 97            	ld	xl,a
1825  02b2 01            	rrwa	x,a
1826  02b3 1a02          	or	a,(OFST+0,sp)
1827  02b5 01            	rrwa	x,a
1828  02b6 1a01          	or	a,(OFST-1,sp)
1829  02b8 01            	rrwa	x,a
1830  02b9 01            	rrwa	x,a
1831  02ba a4ff          	and	a,#255
1832  02bc 01            	rrwa	x,a
1833  02bd a401          	and	a,#1
1834  02bf 01            	rrwa	x,a
1837  02c0 5b02          	addw	sp,#2
1838  02c2 81            	ret
1872                     ; 511 void UART2_SendData8(uint8_t Data)
1872                     ; 512 {
1873                     	switch	.text
1874  02c3               _UART2_SendData8:
1878                     ; 514   UART2->DR = Data;
1880  02c3 c75241        	ld	21057,a
1881                     ; 515 }
1884  02c6 81            	ret
1918                     ; 522 void UART2_SendData9(uint16_t Data)
1918                     ; 523 {
1919                     	switch	.text
1920  02c7               _UART2_SendData9:
1922  02c7 89            	pushw	x
1923       00000000      OFST:	set	0
1926                     ; 525   UART2->CR1 &= ((uint8_t)~UART2_CR1_T8);                  
1928  02c8 721d5244      	bres	21060,#6
1929                     ; 528   UART2->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART2_CR1_T8); 
1931  02cc 54            	srlw	x
1932  02cd 54            	srlw	x
1933  02ce 9f            	ld	a,xl
1934  02cf a440          	and	a,#64
1935  02d1 ca5244        	or	a,21060
1936  02d4 c75244        	ld	21060,a
1937                     ; 531   UART2->DR   = (uint8_t)(Data);                    
1939  02d7 7b02          	ld	a,(OFST+2,sp)
1940  02d9 c75241        	ld	21057,a
1941                     ; 532 }
1944  02dc 85            	popw	x
1945  02dd 81            	ret
1968                     ; 539 void UART2_SendBreak(void)
1968                     ; 540 {
1969                     	switch	.text
1970  02de               _UART2_SendBreak:
1974                     ; 541   UART2->CR2 |= UART2_CR2_SBK;
1976  02de 72105245      	bset	21061,#0
1977                     ; 542 }
1980  02e2 81            	ret
2014                     ; 549 void UART2_SetAddress(uint8_t UART2_Address)
2014                     ; 550 {
2015                     	switch	.text
2016  02e3               _UART2_SetAddress:
2018  02e3 88            	push	a
2019       00000000      OFST:	set	0
2022                     ; 552   assert_param(IS_UART2_ADDRESS_OK(UART2_Address));
2024                     ; 555   UART2->CR4 &= ((uint8_t)~UART2_CR4_ADD);
2026  02e4 c65247        	ld	a,21063
2027  02e7 a4f0          	and	a,#240
2028  02e9 c75247        	ld	21063,a
2029                     ; 557   UART2->CR4 |= UART2_Address;
2031  02ec c65247        	ld	a,21063
2032  02ef 1a01          	or	a,(OFST+1,sp)
2033  02f1 c75247        	ld	21063,a
2034                     ; 558 }
2037  02f4 84            	pop	a
2038  02f5 81            	ret
2072                     ; 566 void UART2_SetGuardTime(uint8_t UART2_GuardTime)
2072                     ; 567 {
2073                     	switch	.text
2074  02f6               _UART2_SetGuardTime:
2078                     ; 569   UART2->GTR = UART2_GuardTime;
2080  02f6 c7524a        	ld	21066,a
2081                     ; 570 }
2084  02f9 81            	ret
2118                     ; 594 void UART2_SetPrescaler(uint8_t UART2_Prescaler)
2118                     ; 595 {
2119                     	switch	.text
2120  02fa               _UART2_SetPrescaler:
2124                     ; 597   UART2->PSCR = UART2_Prescaler;
2126  02fa c7524b        	ld	21067,a
2127                     ; 598 }
2130  02fd 81            	ret
2287                     ; 606 FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
2287                     ; 607 {
2288                     	switch	.text
2289  02fe               _UART2_GetFlagStatus:
2291  02fe 89            	pushw	x
2292  02ff 88            	push	a
2293       00000001      OFST:	set	1
2296                     ; 608   FlagStatus status = RESET;
2298                     ; 611   assert_param(IS_UART2_FLAG_OK(UART2_FLAG));
2300                     ; 614   if (UART2_FLAG == UART2_FLAG_LBDF)
2302  0300 a30210        	cpw	x,#528
2303  0303 2610          	jrne	L5511
2304                     ; 616     if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2306  0305 9f            	ld	a,xl
2307  0306 c45247        	and	a,21063
2308  0309 2706          	jreq	L7511
2309                     ; 619       status = SET;
2311  030b a601          	ld	a,#1
2312  030d 6b01          	ld	(OFST+0,sp),a
2315  030f 2039          	jra	L3611
2316  0311               L7511:
2317                     ; 624       status = RESET;
2319  0311 0f01          	clr	(OFST+0,sp)
2321  0313 2035          	jra	L3611
2322  0315               L5511:
2323                     ; 627   else if (UART2_FLAG == UART2_FLAG_SBK)
2325  0315 1e02          	ldw	x,(OFST+1,sp)
2326  0317 a30101        	cpw	x,#257
2327  031a 2611          	jrne	L5611
2328                     ; 629     if ((UART2->CR2 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2330  031c c65245        	ld	a,21061
2331  031f 1503          	bcp	a,(OFST+2,sp)
2332  0321 2706          	jreq	L7611
2333                     ; 632       status = SET;
2335  0323 a601          	ld	a,#1
2336  0325 6b01          	ld	(OFST+0,sp),a
2339  0327 2021          	jra	L3611
2340  0329               L7611:
2341                     ; 637       status = RESET;
2343  0329 0f01          	clr	(OFST+0,sp)
2345  032b 201d          	jra	L3611
2346  032d               L5611:
2347                     ; 640   else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
2349  032d 1e02          	ldw	x,(OFST+1,sp)
2350  032f a30302        	cpw	x,#770
2351  0332 2707          	jreq	L7711
2353  0334 1e02          	ldw	x,(OFST+1,sp)
2354  0336 a30301        	cpw	x,#769
2355  0339 2614          	jrne	L5711
2356  033b               L7711:
2357                     ; 642     if ((UART2->CR6 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2359  033b c65249        	ld	a,21065
2360  033e 1503          	bcp	a,(OFST+2,sp)
2361  0340 2706          	jreq	L1021
2362                     ; 645       status = SET;
2364  0342 a601          	ld	a,#1
2365  0344 6b01          	ld	(OFST+0,sp),a
2368  0346 2002          	jra	L3611
2369  0348               L1021:
2370                     ; 650       status = RESET;
2372  0348 0f01          	clr	(OFST+0,sp)
2374  034a               L3611:
2375                     ; 668   return  status;
2377  034a 7b01          	ld	a,(OFST+0,sp)
2380  034c 5b03          	addw	sp,#3
2381  034e 81            	ret
2382  034f               L5711:
2383                     ; 655     if ((UART2->SR & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2385  034f c65240        	ld	a,21056
2386  0352 1503          	bcp	a,(OFST+2,sp)
2387  0354 2706          	jreq	L7021
2388                     ; 658       status = SET;
2390  0356 a601          	ld	a,#1
2391  0358 6b01          	ld	(OFST+0,sp),a
2394  035a 20ee          	jra	L3611
2395  035c               L7021:
2396                     ; 663       status = RESET;
2398  035c 0f01          	clr	(OFST+0,sp)
2400  035e 20ea          	jra	L3611
2435                     ; 699 void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)
2435                     ; 700 {
2436                     	switch	.text
2437  0360               _UART2_ClearFlag:
2439  0360 89            	pushw	x
2440       00000000      OFST:	set	0
2443                     ; 701   assert_param(IS_UART2_CLEAR_FLAG_OK(UART2_FLAG));
2445                     ; 704   if (UART2_FLAG == UART2_FLAG_RXNE)
2447  0361 a30020        	cpw	x,#32
2448  0364 2606          	jrne	L1321
2449                     ; 706     UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2451  0366 35df5240      	mov	21056,#223
2453  036a 201e          	jra	L3321
2454  036c               L1321:
2455                     ; 709   else if (UART2_FLAG == UART2_FLAG_LBDF)
2457  036c 1e01          	ldw	x,(OFST+1,sp)
2458  036e a30210        	cpw	x,#528
2459  0371 2606          	jrne	L5321
2460                     ; 711     UART2->CR4 &= (uint8_t)(~UART2_CR4_LBDF);
2462  0373 72195247      	bres	21063,#4
2464  0377 2011          	jra	L3321
2465  0379               L5321:
2466                     ; 714   else if (UART2_FLAG == UART2_FLAG_LHDF)
2468  0379 1e01          	ldw	x,(OFST+1,sp)
2469  037b a30302        	cpw	x,#770
2470  037e 2606          	jrne	L1421
2471                     ; 716     UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2473  0380 72135249      	bres	21065,#1
2475  0384 2004          	jra	L3321
2476  0386               L1421:
2477                     ; 721     UART2->CR6 &= (uint8_t)(~UART2_CR6_LSF);
2479  0386 72115249      	bres	21065,#0
2480  038a               L3321:
2481                     ; 723 }
2484  038a 85            	popw	x
2485  038b 81            	ret
2567                     ; 738 ITStatus UART2_GetITStatus(UART2_IT_TypeDef UART2_IT)
2567                     ; 739 {
2568                     	switch	.text
2569  038c               _UART2_GetITStatus:
2571  038c 89            	pushw	x
2572  038d 89            	pushw	x
2573       00000002      OFST:	set	2
2576                     ; 740   ITStatus pendingbitstatus = RESET;
2578                     ; 741   uint8_t itpos = 0;
2580                     ; 742   uint8_t itmask1 = 0;
2582                     ; 743   uint8_t itmask2 = 0;
2584                     ; 744   uint8_t enablestatus = 0;
2586                     ; 747   assert_param(IS_UART2_GET_IT_OK(UART2_IT));
2588                     ; 750   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
2590  038e 9f            	ld	a,xl
2591  038f a40f          	and	a,#15
2592  0391 5f            	clrw	x
2593  0392 97            	ld	xl,a
2594  0393 a601          	ld	a,#1
2595  0395 5d            	tnzw	x
2596  0396 2704          	jreq	L27
2597  0398               L47:
2598  0398 48            	sll	a
2599  0399 5a            	decw	x
2600  039a 26fc          	jrne	L47
2601  039c               L27:
2602  039c 6b01          	ld	(OFST-1,sp),a
2604                     ; 752   itmask1 = (uint8_t)((uint8_t)UART2_IT >> (uint8_t)4);
2606  039e 7b04          	ld	a,(OFST+2,sp)
2607  03a0 4e            	swap	a
2608  03a1 a40f          	and	a,#15
2609  03a3 6b02          	ld	(OFST+0,sp),a
2611                     ; 754   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2613  03a5 7b02          	ld	a,(OFST+0,sp)
2614  03a7 5f            	clrw	x
2615  03a8 97            	ld	xl,a
2616  03a9 a601          	ld	a,#1
2617  03ab 5d            	tnzw	x
2618  03ac 2704          	jreq	L67
2619  03ae               L001:
2620  03ae 48            	sll	a
2621  03af 5a            	decw	x
2622  03b0 26fc          	jrne	L001
2623  03b2               L67:
2624  03b2 6b02          	ld	(OFST+0,sp),a
2626                     ; 757   if (UART2_IT == UART2_IT_PE)
2628  03b4 1e03          	ldw	x,(OFST+1,sp)
2629  03b6 a30100        	cpw	x,#256
2630  03b9 261c          	jrne	L7031
2631                     ; 760     enablestatus = (uint8_t)((uint8_t)UART2->CR1 & itmask2);
2633  03bb c65244        	ld	a,21060
2634  03be 1402          	and	a,(OFST+0,sp)
2635  03c0 6b02          	ld	(OFST+0,sp),a
2637                     ; 763     if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2639  03c2 c65240        	ld	a,21056
2640  03c5 1501          	bcp	a,(OFST-1,sp)
2641  03c7 270a          	jreq	L1131
2643  03c9 0d02          	tnz	(OFST+0,sp)
2644  03cb 2706          	jreq	L1131
2645                     ; 766       pendingbitstatus = SET;
2647  03cd a601          	ld	a,#1
2648  03cf 6b02          	ld	(OFST+0,sp),a
2651  03d1 2064          	jra	L5131
2652  03d3               L1131:
2653                     ; 771       pendingbitstatus = RESET;
2655  03d3 0f02          	clr	(OFST+0,sp)
2657  03d5 2060          	jra	L5131
2658  03d7               L7031:
2659                     ; 774   else if (UART2_IT == UART2_IT_LBDF)
2661  03d7 1e03          	ldw	x,(OFST+1,sp)
2662  03d9 a30346        	cpw	x,#838
2663  03dc 261c          	jrne	L7131
2664                     ; 777     enablestatus = (uint8_t)((uint8_t)UART2->CR4 & itmask2);
2666  03de c65247        	ld	a,21063
2667  03e1 1402          	and	a,(OFST+0,sp)
2668  03e3 6b02          	ld	(OFST+0,sp),a
2670                     ; 779     if (((UART2->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2672  03e5 c65247        	ld	a,21063
2673  03e8 1501          	bcp	a,(OFST-1,sp)
2674  03ea 270a          	jreq	L1231
2676  03ec 0d02          	tnz	(OFST+0,sp)
2677  03ee 2706          	jreq	L1231
2678                     ; 782       pendingbitstatus = SET;
2680  03f0 a601          	ld	a,#1
2681  03f2 6b02          	ld	(OFST+0,sp),a
2684  03f4 2041          	jra	L5131
2685  03f6               L1231:
2686                     ; 787       pendingbitstatus = RESET;
2688  03f6 0f02          	clr	(OFST+0,sp)
2690  03f8 203d          	jra	L5131
2691  03fa               L7131:
2692                     ; 790   else if (UART2_IT == UART2_IT_LHDF)
2694  03fa 1e03          	ldw	x,(OFST+1,sp)
2695  03fc a30412        	cpw	x,#1042
2696  03ff 261c          	jrne	L7231
2697                     ; 793     enablestatus = (uint8_t)((uint8_t)UART2->CR6 & itmask2);
2699  0401 c65249        	ld	a,21065
2700  0404 1402          	and	a,(OFST+0,sp)
2701  0406 6b02          	ld	(OFST+0,sp),a
2703                     ; 795     if (((UART2->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2705  0408 c65249        	ld	a,21065
2706  040b 1501          	bcp	a,(OFST-1,sp)
2707  040d 270a          	jreq	L1331
2709  040f 0d02          	tnz	(OFST+0,sp)
2710  0411 2706          	jreq	L1331
2711                     ; 798       pendingbitstatus = SET;
2713  0413 a601          	ld	a,#1
2714  0415 6b02          	ld	(OFST+0,sp),a
2717  0417 201e          	jra	L5131
2718  0419               L1331:
2719                     ; 803       pendingbitstatus = RESET;
2721  0419 0f02          	clr	(OFST+0,sp)
2723  041b 201a          	jra	L5131
2724  041d               L7231:
2725                     ; 809     enablestatus = (uint8_t)((uint8_t)UART2->CR2 & itmask2);
2727  041d c65245        	ld	a,21061
2728  0420 1402          	and	a,(OFST+0,sp)
2729  0422 6b02          	ld	(OFST+0,sp),a
2731                     ; 811     if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2733  0424 c65240        	ld	a,21056
2734  0427 1501          	bcp	a,(OFST-1,sp)
2735  0429 270a          	jreq	L7331
2737  042b 0d02          	tnz	(OFST+0,sp)
2738  042d 2706          	jreq	L7331
2739                     ; 814       pendingbitstatus = SET;
2741  042f a601          	ld	a,#1
2742  0431 6b02          	ld	(OFST+0,sp),a
2745  0433 2002          	jra	L5131
2746  0435               L7331:
2747                     ; 819       pendingbitstatus = RESET;
2749  0435 0f02          	clr	(OFST+0,sp)
2751  0437               L5131:
2752                     ; 823   return  pendingbitstatus;
2754  0437 7b02          	ld	a,(OFST+0,sp)
2757  0439 5b04          	addw	sp,#4
2758  043b 81            	ret
2794                     ; 852 void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)
2794                     ; 853 {
2795                     	switch	.text
2796  043c               _UART2_ClearITPendingBit:
2798  043c 89            	pushw	x
2799       00000000      OFST:	set	0
2802                     ; 854   assert_param(IS_UART2_CLEAR_IT_OK(UART2_IT));
2804                     ; 857   if (UART2_IT == UART2_IT_RXNE)
2806  043d a30255        	cpw	x,#597
2807  0440 2606          	jrne	L1631
2808                     ; 859     UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2810  0442 35df5240      	mov	21056,#223
2812  0446 2011          	jra	L3631
2813  0448               L1631:
2814                     ; 862   else if (UART2_IT == UART2_IT_LBDF)
2816  0448 1e01          	ldw	x,(OFST+1,sp)
2817  044a a30346        	cpw	x,#838
2818  044d 2606          	jrne	L5631
2819                     ; 864     UART2->CR4 &= (uint8_t)~(UART2_CR4_LBDF);
2821  044f 72195247      	bres	21063,#4
2823  0453 2004          	jra	L3631
2824  0455               L5631:
2825                     ; 869     UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2827  0455 72135249      	bres	21065,#1
2828  0459               L3631:
2829                     ; 871 }
2832  0459 85            	popw	x
2833  045a 81            	ret
2846                     	xdef	_UART2_ClearITPendingBit
2847                     	xdef	_UART2_GetITStatus
2848                     	xdef	_UART2_ClearFlag
2849                     	xdef	_UART2_GetFlagStatus
2850                     	xdef	_UART2_SetPrescaler
2851                     	xdef	_UART2_SetGuardTime
2852                     	xdef	_UART2_SetAddress
2853                     	xdef	_UART2_SendBreak
2854                     	xdef	_UART2_SendData9
2855                     	xdef	_UART2_SendData8
2856                     	xdef	_UART2_ReceiveData9
2857                     	xdef	_UART2_ReceiveData8
2858                     	xdef	_UART2_ReceiverWakeUpCmd
2859                     	xdef	_UART2_WakeUpConfig
2860                     	xdef	_UART2_SmartCardNACKCmd
2861                     	xdef	_UART2_SmartCardCmd
2862                     	xdef	_UART2_LINCmd
2863                     	xdef	_UART2_LINConfig
2864                     	xdef	_UART2_LINBreakDetectionConfig
2865                     	xdef	_UART2_IrDACmd
2866                     	xdef	_UART2_IrDAConfig
2867                     	xdef	_UART2_ITConfig
2868                     	xdef	_UART2_Cmd
2869                     	xdef	_UART2_Init
2870                     	xdef	_UART2_DeInit
2871                     	xref	_CLK_GetClockFreq
2872                     	xref.b	c_lreg
2873                     	xref.b	c_x
2892                     	xref	c_lursh
2893                     	xref	c_lsub
2894                     	xref	c_smul
2895                     	xref	c_ludv
2896                     	xref	c_rtol
2897                     	xref	c_llsh
2898                     	xref	c_ltor
2899                     	end
