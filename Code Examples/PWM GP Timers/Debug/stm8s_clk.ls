   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  15                     .const:	section	.text
  16  0000               _HSIDivFactor:
  17  0000 01            	dc.b	1
  18  0001 02            	dc.b	2
  19  0002 04            	dc.b	4
  20  0003 08            	dc.b	8
  21  0004               _CLKPrescTable:
  22  0004 01            	dc.b	1
  23  0005 02            	dc.b	2
  24  0006 04            	dc.b	4
  25  0007 08            	dc.b	8
  26  0008 0a            	dc.b	10
  27  0009 10            	dc.b	16
  28  000a 14            	dc.b	20
  29  000b 28            	dc.b	40
  58                     ; 72 void CLK_DeInit(void)
  58                     ; 73 {
  60                     	switch	.text
  61  0000               _CLK_DeInit:
  65                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  67  0000 350150c0      	mov	20672,#1
  68                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  70  0004 725f50c1      	clr	20673
  71                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  73  0008 35e150c4      	mov	20676,#225
  74                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  76  000c 725f50c5      	clr	20677
  77                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  79  0010 351850c6      	mov	20678,#24
  80                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  82  0014 35ff50c7      	mov	20679,#255
  83                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  85  0018 35ff50ca      	mov	20682,#255
  86                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  88  001c 725f50c8      	clr	20680
  89                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  91  0020 725f50c9      	clr	20681
  93  0024               L52:
  94                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  96  0024 c650c9        	ld	a,20681
  97  0027 a501          	bcp	a,#1
  98  0029 26f9          	jrne	L52
  99                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 101  002b 725f50c9      	clr	20681
 102                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 104  002f 725f50cc      	clr	20684
 105                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 107  0033 725f50cd      	clr	20685
 108                     ; 88 }
 111  0037 81            	ret
 167                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 167                     ; 100 {
 168                     	switch	.text
 169  0038               _CLK_FastHaltWakeUpCmd:
 173                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 175                     ; 104   if (NewState != DISABLE)
 177  0038 4d            	tnz	a
 178  0039 2706          	jreq	L75
 179                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 181  003b 721450c0      	bset	20672,#2
 183  003f 2004          	jra	L16
 184  0041               L75:
 185                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 187  0041 721550c0      	bres	20672,#2
 188  0045               L16:
 189                     ; 114 }
 192  0045 81            	ret
 227                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 227                     ; 122 {
 228                     	switch	.text
 229  0046               _CLK_HSECmd:
 233                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 235                     ; 126   if (NewState != DISABLE)
 237  0046 4d            	tnz	a
 238  0047 2706          	jreq	L101
 239                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 241  0049 721050c1      	bset	20673,#0
 243  004d 2004          	jra	L301
 244  004f               L101:
 245                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 247  004f 721150c1      	bres	20673,#0
 248  0053               L301:
 249                     ; 136 }
 252  0053 81            	ret
 287                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 287                     ; 144 {
 288                     	switch	.text
 289  0054               _CLK_HSICmd:
 293                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 295                     ; 148   if (NewState != DISABLE)
 297  0054 4d            	tnz	a
 298  0055 2706          	jreq	L321
 299                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 301  0057 721050c0      	bset	20672,#0
 303  005b 2004          	jra	L521
 304  005d               L321:
 305                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 307  005d 721150c0      	bres	20672,#0
 308  0061               L521:
 309                     ; 158 }
 312  0061 81            	ret
 347                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 347                     ; 167 {
 348                     	switch	.text
 349  0062               _CLK_LSICmd:
 353                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 355                     ; 171   if (NewState != DISABLE)
 357  0062 4d            	tnz	a
 358  0063 2706          	jreq	L541
 359                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 361  0065 721650c0      	bset	20672,#3
 363  0069 2004          	jra	L741
 364  006b               L541:
 365                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 367  006b 721750c0      	bres	20672,#3
 368  006f               L741:
 369                     ; 181 }
 372  006f 81            	ret
 407                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 407                     ; 190 {
 408                     	switch	.text
 409  0070               _CLK_CCOCmd:
 413                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 415                     ; 194   if (NewState != DISABLE)
 417  0070 4d            	tnz	a
 418  0071 2706          	jreq	L761
 419                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 421  0073 721050c9      	bset	20681,#0
 423  0077 2004          	jra	L171
 424  0079               L761:
 425                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 427  0079 721150c9      	bres	20681,#0
 428  007d               L171:
 429                     ; 204 }
 432  007d 81            	ret
 467                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 467                     ; 214 {
 468                     	switch	.text
 469  007e               _CLK_ClockSwitchCmd:
 473                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 475                     ; 218   if (NewState != DISABLE )
 477  007e 4d            	tnz	a
 478  007f 2706          	jreq	L112
 479                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 481  0081 721250c5      	bset	20677,#1
 483  0085 2004          	jra	L312
 484  0087               L112:
 485                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 487  0087 721350c5      	bres	20677,#1
 488  008b               L312:
 489                     ; 228 }
 492  008b 81            	ret
 528                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 528                     ; 239 {
 529                     	switch	.text
 530  008c               _CLK_SlowActiveHaltWakeUpCmd:
 534                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 536                     ; 243   if (NewState != DISABLE)
 538  008c 4d            	tnz	a
 539  008d 2706          	jreq	L332
 540                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 542  008f 721a50c0      	bset	20672,#5
 544  0093 2004          	jra	L532
 545  0095               L332:
 546                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 548  0095 721b50c0      	bres	20672,#5
 549  0099               L532:
 550                     ; 253 }
 553  0099 81            	ret
 712                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 712                     ; 264 {
 713                     	switch	.text
 714  009a               _CLK_PeripheralClockConfig:
 716  009a 89            	pushw	x
 717       00000000      OFST:	set	0
 720                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 722                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 724                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 726  009b 9e            	ld	a,xh
 727  009c a510          	bcp	a,#16
 728  009e 2633          	jrne	L123
 729                     ; 271     if (NewState != DISABLE)
 731  00a0 0d02          	tnz	(OFST+2,sp)
 732  00a2 2717          	jreq	L323
 733                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 735  00a4 7b01          	ld	a,(OFST+1,sp)
 736  00a6 a40f          	and	a,#15
 737  00a8 5f            	clrw	x
 738  00a9 97            	ld	xl,a
 739  00aa a601          	ld	a,#1
 740  00ac 5d            	tnzw	x
 741  00ad 2704          	jreq	L62
 742  00af               L03:
 743  00af 48            	sll	a
 744  00b0 5a            	decw	x
 745  00b1 26fc          	jrne	L03
 746  00b3               L62:
 747  00b3 ca50c7        	or	a,20679
 748  00b6 c750c7        	ld	20679,a
 750  00b9 2049          	jra	L723
 751  00bb               L323:
 752                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 754  00bb 7b01          	ld	a,(OFST+1,sp)
 755  00bd a40f          	and	a,#15
 756  00bf 5f            	clrw	x
 757  00c0 97            	ld	xl,a
 758  00c1 a601          	ld	a,#1
 759  00c3 5d            	tnzw	x
 760  00c4 2704          	jreq	L23
 761  00c6               L43:
 762  00c6 48            	sll	a
 763  00c7 5a            	decw	x
 764  00c8 26fc          	jrne	L43
 765  00ca               L23:
 766  00ca 43            	cpl	a
 767  00cb c450c7        	and	a,20679
 768  00ce c750c7        	ld	20679,a
 769  00d1 2031          	jra	L723
 770  00d3               L123:
 771                     ; 284     if (NewState != DISABLE)
 773  00d3 0d02          	tnz	(OFST+2,sp)
 774  00d5 2717          	jreq	L133
 775                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 777  00d7 7b01          	ld	a,(OFST+1,sp)
 778  00d9 a40f          	and	a,#15
 779  00db 5f            	clrw	x
 780  00dc 97            	ld	xl,a
 781  00dd a601          	ld	a,#1
 782  00df 5d            	tnzw	x
 783  00e0 2704          	jreq	L63
 784  00e2               L04:
 785  00e2 48            	sll	a
 786  00e3 5a            	decw	x
 787  00e4 26fc          	jrne	L04
 788  00e6               L63:
 789  00e6 ca50ca        	or	a,20682
 790  00e9 c750ca        	ld	20682,a
 792  00ec 2016          	jra	L723
 793  00ee               L133:
 794                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 796  00ee 7b01          	ld	a,(OFST+1,sp)
 797  00f0 a40f          	and	a,#15
 798  00f2 5f            	clrw	x
 799  00f3 97            	ld	xl,a
 800  00f4 a601          	ld	a,#1
 801  00f6 5d            	tnzw	x
 802  00f7 2704          	jreq	L24
 803  00f9               L44:
 804  00f9 48            	sll	a
 805  00fa 5a            	decw	x
 806  00fb 26fc          	jrne	L44
 807  00fd               L24:
 808  00fd 43            	cpl	a
 809  00fe c450ca        	and	a,20682
 810  0101 c750ca        	ld	20682,a
 811  0104               L723:
 812                     ; 295 }
 815  0104 85            	popw	x
 816  0105 81            	ret
1004                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1004                     ; 310 {
1005                     	switch	.text
1006  0106               _CLK_ClockSwitchConfig:
1008  0106 89            	pushw	x
1009  0107 5204          	subw	sp,#4
1010       00000004      OFST:	set	4
1013                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1015  0109 aeffff        	ldw	x,#65535
1016  010c 1f03          	ldw	(OFST-1,sp),x
1018                     ; 313   ErrorStatus Swif = ERROR;
1020                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1022                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1024                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1026                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1028                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1030  010e c650c3        	ld	a,20675
1031  0111 6b01          	ld	(OFST-3,sp),a
1033                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1035  0113 7b05          	ld	a,(OFST+1,sp)
1036  0115 a101          	cp	a,#1
1037  0117 264b          	jrne	L544
1038                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1040  0119 721250c5      	bset	20677,#1
1041                     ; 331     if (ITState != DISABLE)
1043  011d 0d09          	tnz	(OFST+5,sp)
1044  011f 2706          	jreq	L744
1045                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1047  0121 721450c5      	bset	20677,#2
1049  0125 2004          	jra	L154
1050  0127               L744:
1051                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1053  0127 721550c5      	bres	20677,#2
1054  012b               L154:
1055                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1057  012b 7b06          	ld	a,(OFST+2,sp)
1058  012d c750c4        	ld	20676,a
1060  0130 2007          	jra	L754
1061  0132               L354:
1062                     ; 346       DownCounter--;
1064  0132 1e03          	ldw	x,(OFST-1,sp)
1065  0134 1d0001        	subw	x,#1
1066  0137 1f03          	ldw	(OFST-1,sp),x
1068  0139               L754:
1069                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1071  0139 c650c5        	ld	a,20677
1072  013c a501          	bcp	a,#1
1073  013e 2704          	jreq	L364
1075  0140 1e03          	ldw	x,(OFST-1,sp)
1076  0142 26ee          	jrne	L354
1077  0144               L364:
1078                     ; 349     if(DownCounter != 0)
1080  0144 1e03          	ldw	x,(OFST-1,sp)
1081  0146 2706          	jreq	L564
1082                     ; 351       Swif = SUCCESS;
1084  0148 a601          	ld	a,#1
1085  014a 6b02          	ld	(OFST-2,sp),a
1088  014c 2002          	jra	L174
1089  014e               L564:
1090                     ; 355       Swif = ERROR;
1092  014e 0f02          	clr	(OFST-2,sp)
1094  0150               L174:
1095                     ; 390   if(Swif != ERROR)
1097  0150 0d02          	tnz	(OFST-2,sp)
1098  0152 2767          	jreq	L515
1099                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1101  0154 0d0a          	tnz	(OFST+6,sp)
1102  0156 2645          	jrne	L715
1104  0158 7b01          	ld	a,(OFST-3,sp)
1105  015a a1e1          	cp	a,#225
1106  015c 263f          	jrne	L715
1107                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1109  015e 721150c0      	bres	20672,#0
1111  0162 2057          	jra	L515
1112  0164               L544:
1113                     ; 361     if (ITState != DISABLE)
1115  0164 0d09          	tnz	(OFST+5,sp)
1116  0166 2706          	jreq	L374
1117                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1119  0168 721450c5      	bset	20677,#2
1121  016c 2004          	jra	L574
1122  016e               L374:
1123                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1125  016e 721550c5      	bres	20677,#2
1126  0172               L574:
1127                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1129  0172 7b06          	ld	a,(OFST+2,sp)
1130  0174 c750c4        	ld	20676,a
1132  0177 2007          	jra	L305
1133  0179               L774:
1134                     ; 376       DownCounter--;
1136  0179 1e03          	ldw	x,(OFST-1,sp)
1137  017b 1d0001        	subw	x,#1
1138  017e 1f03          	ldw	(OFST-1,sp),x
1140  0180               L305:
1141                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1143  0180 c650c5        	ld	a,20677
1144  0183 a508          	bcp	a,#8
1145  0185 2704          	jreq	L705
1147  0187 1e03          	ldw	x,(OFST-1,sp)
1148  0189 26ee          	jrne	L774
1149  018b               L705:
1150                     ; 379     if(DownCounter != 0)
1152  018b 1e03          	ldw	x,(OFST-1,sp)
1153  018d 270a          	jreq	L115
1154                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1156  018f 721250c5      	bset	20677,#1
1157                     ; 383       Swif = SUCCESS;
1159  0193 a601          	ld	a,#1
1160  0195 6b02          	ld	(OFST-2,sp),a
1163  0197 20b7          	jra	L174
1164  0199               L115:
1165                     ; 387       Swif = ERROR;
1167  0199 0f02          	clr	(OFST-2,sp)
1169  019b 20b3          	jra	L174
1170  019d               L715:
1171                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1173  019d 0d0a          	tnz	(OFST+6,sp)
1174  019f 260c          	jrne	L325
1176  01a1 7b01          	ld	a,(OFST-3,sp)
1177  01a3 a1d2          	cp	a,#210
1178  01a5 2606          	jrne	L325
1179                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1181  01a7 721750c0      	bres	20672,#3
1183  01ab 200e          	jra	L515
1184  01ad               L325:
1185                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1187  01ad 0d0a          	tnz	(OFST+6,sp)
1188  01af 260a          	jrne	L515
1190  01b1 7b01          	ld	a,(OFST-3,sp)
1191  01b3 a1b4          	cp	a,#180
1192  01b5 2604          	jrne	L515
1193                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1195  01b7 721150c1      	bres	20673,#0
1196  01bb               L515:
1197                     ; 406   return(Swif);
1199  01bb 7b02          	ld	a,(OFST-2,sp)
1202  01bd 5b06          	addw	sp,#6
1203  01bf 81            	ret
1341                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1341                     ; 416 {
1342                     	switch	.text
1343  01c0               _CLK_HSIPrescalerConfig:
1345  01c0 88            	push	a
1346       00000000      OFST:	set	0
1349                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1351                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1353  01c1 c650c6        	ld	a,20678
1354  01c4 a4e7          	and	a,#231
1355  01c6 c750c6        	ld	20678,a
1356                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1358  01c9 c650c6        	ld	a,20678
1359  01cc 1a01          	or	a,(OFST+1,sp)
1360  01ce c750c6        	ld	20678,a
1361                     ; 425 }
1364  01d1 84            	pop	a
1365  01d2 81            	ret
1500                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1500                     ; 437 {
1501                     	switch	.text
1502  01d3               _CLK_CCOConfig:
1504  01d3 88            	push	a
1505       00000000      OFST:	set	0
1508                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1510                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1512  01d4 c650c9        	ld	a,20681
1513  01d7 a4e1          	and	a,#225
1514  01d9 c750c9        	ld	20681,a
1515                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1517  01dc c650c9        	ld	a,20681
1518  01df 1a01          	or	a,(OFST+1,sp)
1519  01e1 c750c9        	ld	20681,a
1520                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1522  01e4 721050c9      	bset	20681,#0
1523                     ; 449 }
1526  01e8 84            	pop	a
1527  01e9 81            	ret
1592                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1592                     ; 460 {
1593                     	switch	.text
1594  01ea               _CLK_ITConfig:
1596  01ea 89            	pushw	x
1597       00000000      OFST:	set	0
1600                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1602                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1604                     ; 465   if (NewState != DISABLE)
1606  01eb 9f            	ld	a,xl
1607  01ec 4d            	tnz	a
1608  01ed 2719          	jreq	L527
1609                     ; 467     switch (CLK_IT)
1611  01ef 9e            	ld	a,xh
1613                     ; 475     default:
1613                     ; 476       break;
1614  01f0 a00c          	sub	a,#12
1615  01f2 270a          	jreq	L166
1616  01f4 a010          	sub	a,#16
1617  01f6 2624          	jrne	L337
1618                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1618                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1620  01f8 721450c5      	bset	20677,#2
1621                     ; 471       break;
1623  01fc 201e          	jra	L337
1624  01fe               L166:
1625                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1625                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1627  01fe 721450c8      	bset	20680,#2
1628                     ; 474       break;
1630  0202 2018          	jra	L337
1631  0204               L366:
1632                     ; 475     default:
1632                     ; 476       break;
1634  0204 2016          	jra	L337
1635  0206               L137:
1637  0206 2014          	jra	L337
1638  0208               L527:
1639                     ; 481     switch (CLK_IT)
1641  0208 7b01          	ld	a,(OFST+1,sp)
1643                     ; 489     default:
1643                     ; 490       break;
1644  020a a00c          	sub	a,#12
1645  020c 270a          	jreq	L766
1646  020e a010          	sub	a,#16
1647  0210 260a          	jrne	L337
1648                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1648                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1650  0212 721550c5      	bres	20677,#2
1651                     ; 485       break;
1653  0216 2004          	jra	L337
1654  0218               L766:
1655                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1655                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1657  0218 721550c8      	bres	20680,#2
1658                     ; 488       break;
1659  021c               L337:
1660                     ; 493 }
1663  021c 85            	popw	x
1664  021d 81            	ret
1665  021e               L176:
1666                     ; 489     default:
1666                     ; 490       break;
1668  021e 20fc          	jra	L337
1669  0220               L737:
1670  0220 20fa          	jra	L337
1705                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1705                     ; 501 {
1706                     	switch	.text
1707  0222               _CLK_SYSCLKConfig:
1709  0222 88            	push	a
1710       00000000      OFST:	set	0
1713                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1715                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1717  0223 a580          	bcp	a,#128
1718  0225 2614          	jrne	L757
1719                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1721  0227 c650c6        	ld	a,20678
1722  022a a4e7          	and	a,#231
1723  022c c750c6        	ld	20678,a
1724                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1726  022f 7b01          	ld	a,(OFST+1,sp)
1727  0231 a418          	and	a,#24
1728  0233 ca50c6        	or	a,20678
1729  0236 c750c6        	ld	20678,a
1731  0239 2012          	jra	L167
1732  023b               L757:
1733                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1735  023b c650c6        	ld	a,20678
1736  023e a4f8          	and	a,#248
1737  0240 c750c6        	ld	20678,a
1738                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1740  0243 7b01          	ld	a,(OFST+1,sp)
1741  0245 a407          	and	a,#7
1742  0247 ca50c6        	or	a,20678
1743  024a c750c6        	ld	20678,a
1744  024d               L167:
1745                     ; 515 }
1748  024d 84            	pop	a
1749  024e 81            	ret
1805                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1805                     ; 524 {
1806                     	switch	.text
1807  024f               _CLK_SWIMConfig:
1811                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1813                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1815  024f 4d            	tnz	a
1816  0250 2706          	jreq	L1101
1817                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1819  0252 721050cd      	bset	20685,#0
1821  0256 2004          	jra	L3101
1822  0258               L1101:
1823                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1825  0258 721150cd      	bres	20685,#0
1826  025c               L3101:
1827                     ; 538 }
1830  025c 81            	ret
1854                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1854                     ; 548 {
1855                     	switch	.text
1856  025d               _CLK_ClockSecuritySystemEnable:
1860                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1862  025d 721050c8      	bset	20680,#0
1863                     ; 551 }
1866  0261 81            	ret
1891                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1891                     ; 560 {
1892                     	switch	.text
1893  0262               _CLK_GetSYSCLKSource:
1897                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1899  0262 c650c3        	ld	a,20675
1902  0265 81            	ret
1965                     ; 569 uint32_t CLK_GetClockFreq(void)
1965                     ; 570 {
1966                     	switch	.text
1967  0266               _CLK_GetClockFreq:
1969  0266 5209          	subw	sp,#9
1970       00000009      OFST:	set	9
1973                     ; 571   uint32_t clockfrequency = 0;
1975                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1977                     ; 573   uint8_t tmp = 0, presc = 0;
1981                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1983  0268 c650c3        	ld	a,20675
1984  026b 6b09          	ld	(OFST+0,sp),a
1986                     ; 578   if (clocksource == CLK_SOURCE_HSI)
1988  026d 7b09          	ld	a,(OFST+0,sp)
1989  026f a1e1          	cp	a,#225
1990  0271 2641          	jrne	L7601
1991                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1993  0273 c650c6        	ld	a,20678
1994  0276 a418          	and	a,#24
1995  0278 6b09          	ld	(OFST+0,sp),a
1997                     ; 581     tmp = (uint8_t)(tmp >> 3);
1999  027a 0409          	srl	(OFST+0,sp)
2000  027c 0409          	srl	(OFST+0,sp)
2001  027e 0409          	srl	(OFST+0,sp)
2003                     ; 582     presc = HSIDivFactor[tmp];
2005  0280 7b09          	ld	a,(OFST+0,sp)
2006  0282 5f            	clrw	x
2007  0283 97            	ld	xl,a
2008  0284 d60000        	ld	a,(_HSIDivFactor,x)
2009  0287 6b09          	ld	(OFST+0,sp),a
2011                     ; 583     clockfrequency = HSI_VALUE / presc;
2013  0289 7b09          	ld	a,(OFST+0,sp)
2014  028b b703          	ld	c_lreg+3,a
2015  028d 3f02          	clr	c_lreg+2
2016  028f 3f01          	clr	c_lreg+1
2017  0291 3f00          	clr	c_lreg
2018  0293 96            	ldw	x,sp
2019  0294 1c0001        	addw	x,#OFST-8
2020  0297 cd0000        	call	c_rtol
2023  029a ae2400        	ldw	x,#9216
2024  029d bf02          	ldw	c_lreg+2,x
2025  029f ae00f4        	ldw	x,#244
2026  02a2 bf00          	ldw	c_lreg,x
2027  02a4 96            	ldw	x,sp
2028  02a5 1c0001        	addw	x,#OFST-8
2029  02a8 cd0000        	call	c_ludv
2031  02ab 96            	ldw	x,sp
2032  02ac 1c0005        	addw	x,#OFST-4
2033  02af cd0000        	call	c_rtol
2037  02b2 201c          	jra	L1701
2038  02b4               L7601:
2039                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2041  02b4 7b09          	ld	a,(OFST+0,sp)
2042  02b6 a1d2          	cp	a,#210
2043  02b8 260c          	jrne	L3701
2044                     ; 587     clockfrequency = LSI_VALUE;
2046  02ba aef400        	ldw	x,#62464
2047  02bd 1f07          	ldw	(OFST-2,sp),x
2048  02bf ae0001        	ldw	x,#1
2049  02c2 1f05          	ldw	(OFST-4,sp),x
2052  02c4 200a          	jra	L1701
2053  02c6               L3701:
2054                     ; 591     clockfrequency = HSE_VALUE;
2056  02c6 ae2400        	ldw	x,#9216
2057  02c9 1f07          	ldw	(OFST-2,sp),x
2058  02cb ae00f4        	ldw	x,#244
2059  02ce 1f05          	ldw	(OFST-4,sp),x
2061  02d0               L1701:
2062                     ; 594   return((uint32_t)clockfrequency);
2064  02d0 96            	ldw	x,sp
2065  02d1 1c0005        	addw	x,#OFST-4
2066  02d4 cd0000        	call	c_ltor
2070  02d7 5b09          	addw	sp,#9
2071  02d9 81            	ret
2170                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2170                     ; 605 {
2171                     	switch	.text
2172  02da               _CLK_AdjustHSICalibrationValue:
2174  02da 88            	push	a
2175       00000000      OFST:	set	0
2178                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2180                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2182  02db c650cc        	ld	a,20684
2183  02de a4f8          	and	a,#248
2184  02e0 1a01          	or	a,(OFST+1,sp)
2185  02e2 c750cc        	ld	20684,a
2186                     ; 611 }
2189  02e5 84            	pop	a
2190  02e6 81            	ret
2214                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2214                     ; 623 {
2215                     	switch	.text
2216  02e7               _CLK_SYSCLKEmergencyClear:
2220                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2222  02e7 721150c5      	bres	20677,#0
2223                     ; 625 }
2226  02eb 81            	ret
2379                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2379                     ; 635 {
2380                     	switch	.text
2381  02ec               _CLK_GetFlagStatus:
2383  02ec 89            	pushw	x
2384  02ed 5203          	subw	sp,#3
2385       00000003      OFST:	set	3
2388                     ; 636   uint16_t statusreg = 0;
2390                     ; 637   uint8_t tmpreg = 0;
2392                     ; 638   FlagStatus bitstatus = RESET;
2394                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2396                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2398  02ef 01            	rrwa	x,a
2399  02f0 9f            	ld	a,xl
2400  02f1 a4ff          	and	a,#255
2401  02f3 97            	ld	xl,a
2402  02f4 4f            	clr	a
2403  02f5 02            	rlwa	x,a
2404  02f6 1f01          	ldw	(OFST-2,sp),x
2405  02f8 01            	rrwa	x,a
2407                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2409  02f9 1e01          	ldw	x,(OFST-2,sp)
2410  02fb a30100        	cpw	x,#256
2411  02fe 2607          	jrne	L1421
2412                     ; 649     tmpreg = CLK->ICKR;
2414  0300 c650c0        	ld	a,20672
2415  0303 6b03          	ld	(OFST+0,sp),a
2418  0305 202f          	jra	L3421
2419  0307               L1421:
2420                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2422  0307 1e01          	ldw	x,(OFST-2,sp)
2423  0309 a30200        	cpw	x,#512
2424  030c 2607          	jrne	L5421
2425                     ; 653     tmpreg = CLK->ECKR;
2427  030e c650c1        	ld	a,20673
2428  0311 6b03          	ld	(OFST+0,sp),a
2431  0313 2021          	jra	L3421
2432  0315               L5421:
2433                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2435  0315 1e01          	ldw	x,(OFST-2,sp)
2436  0317 a30300        	cpw	x,#768
2437  031a 2607          	jrne	L1521
2438                     ; 657     tmpreg = CLK->SWCR;
2440  031c c650c5        	ld	a,20677
2441  031f 6b03          	ld	(OFST+0,sp),a
2444  0321 2013          	jra	L3421
2445  0323               L1521:
2446                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2448  0323 1e01          	ldw	x,(OFST-2,sp)
2449  0325 a30400        	cpw	x,#1024
2450  0328 2607          	jrne	L5521
2451                     ; 661     tmpreg = CLK->CSSR;
2453  032a c650c8        	ld	a,20680
2454  032d 6b03          	ld	(OFST+0,sp),a
2457  032f 2005          	jra	L3421
2458  0331               L5521:
2459                     ; 665     tmpreg = CLK->CCOR;
2461  0331 c650c9        	ld	a,20681
2462  0334 6b03          	ld	(OFST+0,sp),a
2464  0336               L3421:
2465                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2467  0336 7b05          	ld	a,(OFST+2,sp)
2468  0338 1503          	bcp	a,(OFST+0,sp)
2469  033a 2706          	jreq	L1621
2470                     ; 670     bitstatus = SET;
2472  033c a601          	ld	a,#1
2473  033e 6b03          	ld	(OFST+0,sp),a
2476  0340 2002          	jra	L3621
2477  0342               L1621:
2478                     ; 674     bitstatus = RESET;
2480  0342 0f03          	clr	(OFST+0,sp)
2482  0344               L3621:
2483                     ; 678   return((FlagStatus)bitstatus);
2485  0344 7b03          	ld	a,(OFST+0,sp)
2488  0346 5b05          	addw	sp,#5
2489  0348 81            	ret
2535                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2535                     ; 688 {
2536                     	switch	.text
2537  0349               _CLK_GetITStatus:
2539  0349 88            	push	a
2540  034a 88            	push	a
2541       00000001      OFST:	set	1
2544                     ; 689   ITStatus bitstatus = RESET;
2546                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2548                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2550  034b a11c          	cp	a,#28
2551  034d 2611          	jrne	L7031
2552                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2554  034f c450c5        	and	a,20677
2555  0352 a10c          	cp	a,#12
2556  0354 2606          	jrne	L1131
2557                     ; 699       bitstatus = SET;
2559  0356 a601          	ld	a,#1
2560  0358 6b01          	ld	(OFST+0,sp),a
2563  035a 2015          	jra	L5131
2564  035c               L1131:
2565                     ; 703       bitstatus = RESET;
2567  035c 0f01          	clr	(OFST+0,sp)
2569  035e 2011          	jra	L5131
2570  0360               L7031:
2571                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2573  0360 c650c8        	ld	a,20680
2574  0363 1402          	and	a,(OFST+1,sp)
2575  0365 a10c          	cp	a,#12
2576  0367 2606          	jrne	L7131
2577                     ; 711       bitstatus = SET;
2579  0369 a601          	ld	a,#1
2580  036b 6b01          	ld	(OFST+0,sp),a
2583  036d 2002          	jra	L5131
2584  036f               L7131:
2585                     ; 715       bitstatus = RESET;
2587  036f 0f01          	clr	(OFST+0,sp)
2589  0371               L5131:
2590                     ; 720   return bitstatus;
2592  0371 7b01          	ld	a,(OFST+0,sp)
2595  0373 85            	popw	x
2596  0374 81            	ret
2632                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2632                     ; 730 {
2633                     	switch	.text
2634  0375               _CLK_ClearITPendingBit:
2638                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2640                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2642  0375 a10c          	cp	a,#12
2643  0377 2606          	jrne	L1431
2644                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2646  0379 721750c8      	bres	20680,#3
2648  037d 2004          	jra	L3431
2649  037f               L1431:
2650                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2652  037f 721750c5      	bres	20677,#3
2653  0383               L3431:
2654                     ; 745 }
2657  0383 81            	ret
2692                     	xdef	_CLKPrescTable
2693                     	xdef	_HSIDivFactor
2694                     	xdef	_CLK_ClearITPendingBit
2695                     	xdef	_CLK_GetITStatus
2696                     	xdef	_CLK_GetFlagStatus
2697                     	xdef	_CLK_GetSYSCLKSource
2698                     	xdef	_CLK_GetClockFreq
2699                     	xdef	_CLK_AdjustHSICalibrationValue
2700                     	xdef	_CLK_SYSCLKEmergencyClear
2701                     	xdef	_CLK_ClockSecuritySystemEnable
2702                     	xdef	_CLK_SWIMConfig
2703                     	xdef	_CLK_SYSCLKConfig
2704                     	xdef	_CLK_ITConfig
2705                     	xdef	_CLK_CCOConfig
2706                     	xdef	_CLK_HSIPrescalerConfig
2707                     	xdef	_CLK_ClockSwitchConfig
2708                     	xdef	_CLK_PeripheralClockConfig
2709                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2710                     	xdef	_CLK_FastHaltWakeUpCmd
2711                     	xdef	_CLK_ClockSwitchCmd
2712                     	xdef	_CLK_CCOCmd
2713                     	xdef	_CLK_LSICmd
2714                     	xdef	_CLK_HSICmd
2715                     	xdef	_CLK_HSECmd
2716                     	xdef	_CLK_DeInit
2717                     	xref.b	c_lreg
2718                     	xref.b	c_x
2737                     	xref	c_ltor
2738                     	xref	c_ludv
2739                     	xref	c_rtol
2740                     	end
