   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  14                     .const:	section	.text
  15  0000               _HSIDivFactor:
  16  0000 01            	dc.b	1
  17  0001 02            	dc.b	2
  18  0002 04            	dc.b	4
  19  0003 08            	dc.b	8
  20  0004               _CLKPrescTable:
  21  0004 01            	dc.b	1
  22  0005 02            	dc.b	2
  23  0006 04            	dc.b	4
  24  0007 08            	dc.b	8
  25  0008 0a            	dc.b	10
  26  0009 10            	dc.b	16
  27  000a 14            	dc.b	20
  28  000b 28            	dc.b	40
  57                     ; 72 void CLK_DeInit(void)
  57                     ; 73 {
  59                     	switch	.text
  60  0000               _CLK_DeInit:
  64                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  66  0000 350150c0      	mov	20672,#1
  67                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  69  0004 725f50c1      	clr	20673
  70                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  72  0008 35e150c4      	mov	20676,#225
  73                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  75  000c 725f50c5      	clr	20677
  76                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  78  0010 351850c6      	mov	20678,#24
  79                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  81  0014 35ff50c7      	mov	20679,#255
  82                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  84  0018 35ff50ca      	mov	20682,#255
  85                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  87  001c 725f50c8      	clr	20680
  88                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  90  0020 725f50c9      	clr	20681
  92  0024               L52:
  93                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  95  0024 c650c9        	ld	a,20681
  96  0027 a501          	bcp	a,#1
  97  0029 26f9          	jrne	L52
  98                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 100  002b 725f50c9      	clr	20681
 101                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 103  002f 725f50cc      	clr	20684
 104                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 106  0033 725f50cd      	clr	20685
 107                     ; 88 }
 110  0037 81            	ret
 166                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 166                     ; 100 {
 167                     	switch	.text
 168  0038               _CLK_FastHaltWakeUpCmd:
 172                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 174                     ; 104   if (NewState != DISABLE)
 176  0038 4d            	tnz	a
 177  0039 2706          	jreq	L75
 178                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 180  003b 721450c0      	bset	20672,#2
 182  003f 2004          	jra	L16
 183  0041               L75:
 184                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 186  0041 721550c0      	bres	20672,#2
 187  0045               L16:
 188                     ; 114 }
 191  0045 81            	ret
 226                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 226                     ; 122 {
 227                     	switch	.text
 228  0046               _CLK_HSECmd:
 232                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 234                     ; 126   if (NewState != DISABLE)
 236  0046 4d            	tnz	a
 237  0047 2706          	jreq	L101
 238                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 240  0049 721050c1      	bset	20673,#0
 242  004d 2004          	jra	L301
 243  004f               L101:
 244                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 246  004f 721150c1      	bres	20673,#0
 247  0053               L301:
 248                     ; 136 }
 251  0053 81            	ret
 286                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 286                     ; 144 {
 287                     	switch	.text
 288  0054               _CLK_HSICmd:
 292                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 294                     ; 148   if (NewState != DISABLE)
 296  0054 4d            	tnz	a
 297  0055 2706          	jreq	L321
 298                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 300  0057 721050c0      	bset	20672,#0
 302  005b 2004          	jra	L521
 303  005d               L321:
 304                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 306  005d 721150c0      	bres	20672,#0
 307  0061               L521:
 308                     ; 158 }
 311  0061 81            	ret
 346                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 346                     ; 167 {
 347                     	switch	.text
 348  0062               _CLK_LSICmd:
 352                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 354                     ; 171   if (NewState != DISABLE)
 356  0062 4d            	tnz	a
 357  0063 2706          	jreq	L541
 358                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 360  0065 721650c0      	bset	20672,#3
 362  0069 2004          	jra	L741
 363  006b               L541:
 364                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 366  006b 721750c0      	bres	20672,#3
 367  006f               L741:
 368                     ; 181 }
 371  006f 81            	ret
 406                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 406                     ; 190 {
 407                     	switch	.text
 408  0070               _CLK_CCOCmd:
 412                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 414                     ; 194   if (NewState != DISABLE)
 416  0070 4d            	tnz	a
 417  0071 2706          	jreq	L761
 418                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 420  0073 721050c9      	bset	20681,#0
 422  0077 2004          	jra	L171
 423  0079               L761:
 424                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 426  0079 721150c9      	bres	20681,#0
 427  007d               L171:
 428                     ; 204 }
 431  007d 81            	ret
 466                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 466                     ; 214 {
 467                     	switch	.text
 468  007e               _CLK_ClockSwitchCmd:
 472                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 474                     ; 218   if (NewState != DISABLE )
 476  007e 4d            	tnz	a
 477  007f 2706          	jreq	L112
 478                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 480  0081 721250c5      	bset	20677,#1
 482  0085 2004          	jra	L312
 483  0087               L112:
 484                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 486  0087 721350c5      	bres	20677,#1
 487  008b               L312:
 488                     ; 228 }
 491  008b 81            	ret
 527                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 527                     ; 239 {
 528                     	switch	.text
 529  008c               _CLK_SlowActiveHaltWakeUpCmd:
 533                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 535                     ; 243   if (NewState != DISABLE)
 537  008c 4d            	tnz	a
 538  008d 2706          	jreq	L332
 539                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 541  008f 721a50c0      	bset	20672,#5
 543  0093 2004          	jra	L532
 544  0095               L332:
 545                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 547  0095 721b50c0      	bres	20672,#5
 548  0099               L532:
 549                     ; 253 }
 552  0099 81            	ret
 711                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 711                     ; 264 {
 712                     	switch	.text
 713  009a               _CLK_PeripheralClockConfig:
 715  009a 89            	pushw	x
 716       00000000      OFST:	set	0
 719                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 721                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 723                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 725  009b 9e            	ld	a,xh
 726  009c a510          	bcp	a,#16
 727  009e 2633          	jrne	L123
 728                     ; 271     if (NewState != DISABLE)
 730  00a0 0d02          	tnz	(OFST+2,sp)
 731  00a2 2717          	jreq	L323
 732                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 734  00a4 7b01          	ld	a,(OFST+1,sp)
 735  00a6 a40f          	and	a,#15
 736  00a8 5f            	clrw	x
 737  00a9 97            	ld	xl,a
 738  00aa a601          	ld	a,#1
 739  00ac 5d            	tnzw	x
 740  00ad 2704          	jreq	L62
 741  00af               L03:
 742  00af 48            	sll	a
 743  00b0 5a            	decw	x
 744  00b1 26fc          	jrne	L03
 745  00b3               L62:
 746  00b3 ca50c7        	or	a,20679
 747  00b6 c750c7        	ld	20679,a
 749  00b9 2049          	jra	L723
 750  00bb               L323:
 751                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 753  00bb 7b01          	ld	a,(OFST+1,sp)
 754  00bd a40f          	and	a,#15
 755  00bf 5f            	clrw	x
 756  00c0 97            	ld	xl,a
 757  00c1 a601          	ld	a,#1
 758  00c3 5d            	tnzw	x
 759  00c4 2704          	jreq	L23
 760  00c6               L43:
 761  00c6 48            	sll	a
 762  00c7 5a            	decw	x
 763  00c8 26fc          	jrne	L43
 764  00ca               L23:
 765  00ca 43            	cpl	a
 766  00cb c450c7        	and	a,20679
 767  00ce c750c7        	ld	20679,a
 768  00d1 2031          	jra	L723
 769  00d3               L123:
 770                     ; 284     if (NewState != DISABLE)
 772  00d3 0d02          	tnz	(OFST+2,sp)
 773  00d5 2717          	jreq	L133
 774                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 776  00d7 7b01          	ld	a,(OFST+1,sp)
 777  00d9 a40f          	and	a,#15
 778  00db 5f            	clrw	x
 779  00dc 97            	ld	xl,a
 780  00dd a601          	ld	a,#1
 781  00df 5d            	tnzw	x
 782  00e0 2704          	jreq	L63
 783  00e2               L04:
 784  00e2 48            	sll	a
 785  00e3 5a            	decw	x
 786  00e4 26fc          	jrne	L04
 787  00e6               L63:
 788  00e6 ca50ca        	or	a,20682
 789  00e9 c750ca        	ld	20682,a
 791  00ec 2016          	jra	L723
 792  00ee               L133:
 793                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 795  00ee 7b01          	ld	a,(OFST+1,sp)
 796  00f0 a40f          	and	a,#15
 797  00f2 5f            	clrw	x
 798  00f3 97            	ld	xl,a
 799  00f4 a601          	ld	a,#1
 800  00f6 5d            	tnzw	x
 801  00f7 2704          	jreq	L24
 802  00f9               L44:
 803  00f9 48            	sll	a
 804  00fa 5a            	decw	x
 805  00fb 26fc          	jrne	L44
 806  00fd               L24:
 807  00fd 43            	cpl	a
 808  00fe c450ca        	and	a,20682
 809  0101 c750ca        	ld	20682,a
 810  0104               L723:
 811                     ; 295 }
 814  0104 85            	popw	x
 815  0105 81            	ret
1001                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1001                     ; 310 {
1002                     	switch	.text
1003  0106               _CLK_ClockSwitchConfig:
1005  0106 89            	pushw	x
1006  0107 5204          	subw	sp,#4
1007       00000004      OFST:	set	4
1010                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1012  0109 aeffff        	ldw	x,#65535
1013  010c 1f03          	ldw	(OFST-1,sp),x
1015                     ; 313   ErrorStatus Swif = ERROR;
1017                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1019                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1021                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1023                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1025                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1027  010e c650c3        	ld	a,20675
1028  0111 6b01          	ld	(OFST-3,sp),a
1030                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1032  0113 7b05          	ld	a,(OFST+1,sp)
1033  0115 a101          	cp	a,#1
1034  0117 264b          	jrne	L344
1035                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1037  0119 721250c5      	bset	20677,#1
1038                     ; 331     if (ITState != DISABLE)
1040  011d 0d09          	tnz	(OFST+5,sp)
1041  011f 2706          	jreq	L544
1042                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1044  0121 721450c5      	bset	20677,#2
1046  0125 2004          	jra	L744
1047  0127               L544:
1048                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1050  0127 721550c5      	bres	20677,#2
1051  012b               L744:
1052                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1054  012b 7b06          	ld	a,(OFST+2,sp)
1055  012d c750c4        	ld	20676,a
1057  0130 2007          	jra	L554
1058  0132               L154:
1059                     ; 346       DownCounter--;
1061  0132 1e03          	ldw	x,(OFST-1,sp)
1062  0134 1d0001        	subw	x,#1
1063  0137 1f03          	ldw	(OFST-1,sp),x
1065  0139               L554:
1066                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1068  0139 c650c5        	ld	a,20677
1069  013c a501          	bcp	a,#1
1070  013e 2704          	jreq	L164
1072  0140 1e03          	ldw	x,(OFST-1,sp)
1073  0142 26ee          	jrne	L154
1074  0144               L164:
1075                     ; 349     if(DownCounter != 0)
1077  0144 1e03          	ldw	x,(OFST-1,sp)
1078  0146 2706          	jreq	L364
1079                     ; 351       Swif = SUCCESS;
1081  0148 a601          	ld	a,#1
1082  014a 6b02          	ld	(OFST-2,sp),a
1085  014c 2002          	jra	L764
1086  014e               L364:
1087                     ; 355       Swif = ERROR;
1089  014e 0f02          	clr	(OFST-2,sp)
1091  0150               L764:
1092                     ; 390   if(Swif != ERROR)
1094  0150 0d02          	tnz	(OFST-2,sp)
1095  0152 2767          	jreq	L315
1096                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1098  0154 0d0a          	tnz	(OFST+6,sp)
1099  0156 2645          	jrne	L515
1101  0158 7b01          	ld	a,(OFST-3,sp)
1102  015a a1e1          	cp	a,#225
1103  015c 263f          	jrne	L515
1104                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1106  015e 721150c0      	bres	20672,#0
1108  0162 2057          	jra	L315
1109  0164               L344:
1110                     ; 361     if (ITState != DISABLE)
1112  0164 0d09          	tnz	(OFST+5,sp)
1113  0166 2706          	jreq	L174
1114                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1116  0168 721450c5      	bset	20677,#2
1118  016c 2004          	jra	L374
1119  016e               L174:
1120                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1122  016e 721550c5      	bres	20677,#2
1123  0172               L374:
1124                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1126  0172 7b06          	ld	a,(OFST+2,sp)
1127  0174 c750c4        	ld	20676,a
1129  0177 2007          	jra	L105
1130  0179               L574:
1131                     ; 376       DownCounter--;
1133  0179 1e03          	ldw	x,(OFST-1,sp)
1134  017b 1d0001        	subw	x,#1
1135  017e 1f03          	ldw	(OFST-1,sp),x
1137  0180               L105:
1138                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1140  0180 c650c5        	ld	a,20677
1141  0183 a508          	bcp	a,#8
1142  0185 2704          	jreq	L505
1144  0187 1e03          	ldw	x,(OFST-1,sp)
1145  0189 26ee          	jrne	L574
1146  018b               L505:
1147                     ; 379     if(DownCounter != 0)
1149  018b 1e03          	ldw	x,(OFST-1,sp)
1150  018d 270a          	jreq	L705
1151                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1153  018f 721250c5      	bset	20677,#1
1154                     ; 383       Swif = SUCCESS;
1156  0193 a601          	ld	a,#1
1157  0195 6b02          	ld	(OFST-2,sp),a
1160  0197 20b7          	jra	L764
1161  0199               L705:
1162                     ; 387       Swif = ERROR;
1164  0199 0f02          	clr	(OFST-2,sp)
1166  019b 20b3          	jra	L764
1167  019d               L515:
1168                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1170  019d 0d0a          	tnz	(OFST+6,sp)
1171  019f 260c          	jrne	L125
1173  01a1 7b01          	ld	a,(OFST-3,sp)
1174  01a3 a1d2          	cp	a,#210
1175  01a5 2606          	jrne	L125
1176                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1178  01a7 721750c0      	bres	20672,#3
1180  01ab 200e          	jra	L315
1181  01ad               L125:
1182                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1184  01ad 0d0a          	tnz	(OFST+6,sp)
1185  01af 260a          	jrne	L315
1187  01b1 7b01          	ld	a,(OFST-3,sp)
1188  01b3 a1b4          	cp	a,#180
1189  01b5 2604          	jrne	L315
1190                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1192  01b7 721150c1      	bres	20673,#0
1193  01bb               L315:
1194                     ; 406   return(Swif);
1196  01bb 7b02          	ld	a,(OFST-2,sp)
1199  01bd 5b06          	addw	sp,#6
1200  01bf 81            	ret
1338                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1338                     ; 416 {
1339                     	switch	.text
1340  01c0               _CLK_HSIPrescalerConfig:
1342  01c0 88            	push	a
1343       00000000      OFST:	set	0
1346                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1348                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1350  01c1 c650c6        	ld	a,20678
1351  01c4 a4e7          	and	a,#231
1352  01c6 c750c6        	ld	20678,a
1353                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1355  01c9 c650c6        	ld	a,20678
1356  01cc 1a01          	or	a,(OFST+1,sp)
1357  01ce c750c6        	ld	20678,a
1358                     ; 425 }
1361  01d1 84            	pop	a
1362  01d2 81            	ret
1497                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1497                     ; 437 {
1498                     	switch	.text
1499  01d3               _CLK_CCOConfig:
1501  01d3 88            	push	a
1502       00000000      OFST:	set	0
1505                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1507                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1509  01d4 c650c9        	ld	a,20681
1510  01d7 a4e1          	and	a,#225
1511  01d9 c750c9        	ld	20681,a
1512                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1514  01dc c650c9        	ld	a,20681
1515  01df 1a01          	or	a,(OFST+1,sp)
1516  01e1 c750c9        	ld	20681,a
1517                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1519  01e4 721050c9      	bset	20681,#0
1520                     ; 449 }
1523  01e8 84            	pop	a
1524  01e9 81            	ret
1589                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1589                     ; 460 {
1590                     	switch	.text
1591  01ea               _CLK_ITConfig:
1593  01ea 89            	pushw	x
1594       00000000      OFST:	set	0
1597                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1599                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1601                     ; 465   if (NewState != DISABLE)
1603  01eb 9f            	ld	a,xl
1604  01ec 4d            	tnz	a
1605  01ed 2719          	jreq	L327
1606                     ; 467     switch (CLK_IT)
1608  01ef 9e            	ld	a,xh
1610                     ; 475     default:
1610                     ; 476       break;
1611  01f0 a00c          	sub	a,#12
1612  01f2 270a          	jreq	L756
1613  01f4 a010          	sub	a,#16
1614  01f6 2624          	jrne	L137
1615                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1615                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1617  01f8 721450c5      	bset	20677,#2
1618                     ; 471       break;
1620  01fc 201e          	jra	L137
1621  01fe               L756:
1622                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1622                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1624  01fe 721450c8      	bset	20680,#2
1625                     ; 474       break;
1627  0202 2018          	jra	L137
1628  0204               L166:
1629                     ; 475     default:
1629                     ; 476       break;
1631  0204 2016          	jra	L137
1632  0206               L727:
1634  0206 2014          	jra	L137
1635  0208               L327:
1636                     ; 481     switch (CLK_IT)
1638  0208 7b01          	ld	a,(OFST+1,sp)
1640                     ; 489     default:
1640                     ; 490       break;
1641  020a a00c          	sub	a,#12
1642  020c 270a          	jreq	L566
1643  020e a010          	sub	a,#16
1644  0210 260a          	jrne	L137
1645                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1645                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1647  0212 721550c5      	bres	20677,#2
1648                     ; 485       break;
1650  0216 2004          	jra	L137
1651  0218               L566:
1652                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1652                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1654  0218 721550c8      	bres	20680,#2
1655                     ; 488       break;
1656  021c               L137:
1657                     ; 493 }
1660  021c 85            	popw	x
1661  021d 81            	ret
1662  021e               L766:
1663                     ; 489     default:
1663                     ; 490       break;
1665  021e 20fc          	jra	L137
1666  0220               L537:
1667  0220 20fa          	jra	L137
1702                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1702                     ; 501 {
1703                     	switch	.text
1704  0222               _CLK_SYSCLKConfig:
1706  0222 88            	push	a
1707       00000000      OFST:	set	0
1710                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1712                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1714  0223 a580          	bcp	a,#128
1715  0225 2614          	jrne	L557
1716                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1718  0227 c650c6        	ld	a,20678
1719  022a a4e7          	and	a,#231
1720  022c c750c6        	ld	20678,a
1721                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1723  022f 7b01          	ld	a,(OFST+1,sp)
1724  0231 a418          	and	a,#24
1725  0233 ca50c6        	or	a,20678
1726  0236 c750c6        	ld	20678,a
1728  0239 2012          	jra	L757
1729  023b               L557:
1730                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1732  023b c650c6        	ld	a,20678
1733  023e a4f8          	and	a,#248
1734  0240 c750c6        	ld	20678,a
1735                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1737  0243 7b01          	ld	a,(OFST+1,sp)
1738  0245 a407          	and	a,#7
1739  0247 ca50c6        	or	a,20678
1740  024a c750c6        	ld	20678,a
1741  024d               L757:
1742                     ; 515 }
1745  024d 84            	pop	a
1746  024e 81            	ret
1802                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1802                     ; 524 {
1803                     	switch	.text
1804  024f               _CLK_SWIMConfig:
1808                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1810                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1812  024f 4d            	tnz	a
1813  0250 2706          	jreq	L7001
1814                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1816  0252 721050cd      	bset	20685,#0
1818  0256 2004          	jra	L1101
1819  0258               L7001:
1820                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1822  0258 721150cd      	bres	20685,#0
1823  025c               L1101:
1824                     ; 538 }
1827  025c 81            	ret
1851                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1851                     ; 548 {
1852                     	switch	.text
1853  025d               _CLK_ClockSecuritySystemEnable:
1857                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1859  025d 721050c8      	bset	20680,#0
1860                     ; 551 }
1863  0261 81            	ret
1888                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1888                     ; 560 {
1889                     	switch	.text
1890  0262               _CLK_GetSYSCLKSource:
1894                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1896  0262 c650c3        	ld	a,20675
1899  0265 81            	ret
1956                     ; 569 uint32_t CLK_GetClockFreq(void)
1956                     ; 570 {
1957                     	switch	.text
1958  0266               _CLK_GetClockFreq:
1960  0266 5209          	subw	sp,#9
1961       00000009      OFST:	set	9
1964                     ; 571   uint32_t clockfrequency = 0;
1966                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1968                     ; 573   uint8_t tmp = 0, presc = 0;
1972                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1974  0268 c650c3        	ld	a,20675
1975  026b 6b09          	ld	(OFST+0,sp),a
1977                     ; 578   if (clocksource == CLK_SOURCE_HSI)
1979  026d 7b09          	ld	a,(OFST+0,sp)
1980  026f a1e1          	cp	a,#225
1981  0271 2641          	jrne	L7501
1982                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1984  0273 c650c6        	ld	a,20678
1985  0276 a418          	and	a,#24
1986  0278 6b09          	ld	(OFST+0,sp),a
1988                     ; 581     tmp = (uint8_t)(tmp >> 3);
1990  027a 0409          	srl	(OFST+0,sp)
1991  027c 0409          	srl	(OFST+0,sp)
1992  027e 0409          	srl	(OFST+0,sp)
1994                     ; 582     presc = HSIDivFactor[tmp];
1996  0280 7b09          	ld	a,(OFST+0,sp)
1997  0282 5f            	clrw	x
1998  0283 97            	ld	xl,a
1999  0284 d60000        	ld	a,(_HSIDivFactor,x)
2000  0287 6b09          	ld	(OFST+0,sp),a
2002                     ; 583     clockfrequency = HSI_VALUE / presc;
2004  0289 7b09          	ld	a,(OFST+0,sp)
2005  028b b703          	ld	c_lreg+3,a
2006  028d 3f02          	clr	c_lreg+2
2007  028f 3f01          	clr	c_lreg+1
2008  0291 3f00          	clr	c_lreg
2009  0293 96            	ldw	x,sp
2010  0294 1c0001        	addw	x,#OFST-8
2011  0297 cd0000        	call	c_rtol
2014  029a ae2400        	ldw	x,#9216
2015  029d bf02          	ldw	c_lreg+2,x
2016  029f ae00f4        	ldw	x,#244
2017  02a2 bf00          	ldw	c_lreg,x
2018  02a4 96            	ldw	x,sp
2019  02a5 1c0001        	addw	x,#OFST-8
2020  02a8 cd0000        	call	c_ludv
2022  02ab 96            	ldw	x,sp
2023  02ac 1c0005        	addw	x,#OFST-4
2024  02af cd0000        	call	c_rtol
2028  02b2 201c          	jra	L1601
2029  02b4               L7501:
2030                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2032  02b4 7b09          	ld	a,(OFST+0,sp)
2033  02b6 a1d2          	cp	a,#210
2034  02b8 260c          	jrne	L3601
2035                     ; 587     clockfrequency = LSI_VALUE;
2037  02ba aef400        	ldw	x,#62464
2038  02bd 1f07          	ldw	(OFST-2,sp),x
2039  02bf ae0001        	ldw	x,#1
2040  02c2 1f05          	ldw	(OFST-4,sp),x
2043  02c4 200a          	jra	L1601
2044  02c6               L3601:
2045                     ; 591     clockfrequency = HSE_VALUE;
2047  02c6 ae3600        	ldw	x,#13824
2048  02c9 1f07          	ldw	(OFST-2,sp),x
2049  02cb ae016e        	ldw	x,#366
2050  02ce 1f05          	ldw	(OFST-4,sp),x
2052  02d0               L1601:
2053                     ; 594   return((uint32_t)clockfrequency);
2055  02d0 96            	ldw	x,sp
2056  02d1 1c0005        	addw	x,#OFST-4
2057  02d4 cd0000        	call	c_ltor
2061  02d7 5b09          	addw	sp,#9
2062  02d9 81            	ret
2161                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2161                     ; 605 {
2162                     	switch	.text
2163  02da               _CLK_AdjustHSICalibrationValue:
2165  02da 88            	push	a
2166       00000000      OFST:	set	0
2169                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2171                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2173  02db c650cc        	ld	a,20684
2174  02de a4f8          	and	a,#248
2175  02e0 1a01          	or	a,(OFST+1,sp)
2176  02e2 c750cc        	ld	20684,a
2177                     ; 611 }
2180  02e5 84            	pop	a
2181  02e6 81            	ret
2205                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2205                     ; 623 {
2206                     	switch	.text
2207  02e7               _CLK_SYSCLKEmergencyClear:
2211                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2213  02e7 721150c5      	bres	20677,#0
2214                     ; 625 }
2217  02eb 81            	ret
2366                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2366                     ; 635 {
2367                     	switch	.text
2368  02ec               _CLK_GetFlagStatus:
2370  02ec 89            	pushw	x
2371  02ed 5203          	subw	sp,#3
2372       00000003      OFST:	set	3
2375                     ; 636   uint16_t statusreg = 0;
2377                     ; 637   uint8_t tmpreg = 0;
2379                     ; 638   FlagStatus bitstatus = RESET;
2381                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2383                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2385  02ef 01            	rrwa	x,a
2386  02f0 9f            	ld	a,xl
2387  02f1 a4ff          	and	a,#255
2388  02f3 97            	ld	xl,a
2389  02f4 4f            	clr	a
2390  02f5 02            	rlwa	x,a
2391  02f6 1f01          	ldw	(OFST-2,sp),x
2392  02f8 01            	rrwa	x,a
2394                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2396  02f9 1e01          	ldw	x,(OFST-2,sp)
2397  02fb a30100        	cpw	x,#256
2398  02fe 2607          	jrne	L5221
2399                     ; 649     tmpreg = CLK->ICKR;
2401  0300 c650c0        	ld	a,20672
2402  0303 6b03          	ld	(OFST+0,sp),a
2405  0305 202f          	jra	L7221
2406  0307               L5221:
2407                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2409  0307 1e01          	ldw	x,(OFST-2,sp)
2410  0309 a30200        	cpw	x,#512
2411  030c 2607          	jrne	L1321
2412                     ; 653     tmpreg = CLK->ECKR;
2414  030e c650c1        	ld	a,20673
2415  0311 6b03          	ld	(OFST+0,sp),a
2418  0313 2021          	jra	L7221
2419  0315               L1321:
2420                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2422  0315 1e01          	ldw	x,(OFST-2,sp)
2423  0317 a30300        	cpw	x,#768
2424  031a 2607          	jrne	L5321
2425                     ; 657     tmpreg = CLK->SWCR;
2427  031c c650c5        	ld	a,20677
2428  031f 6b03          	ld	(OFST+0,sp),a
2431  0321 2013          	jra	L7221
2432  0323               L5321:
2433                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2435  0323 1e01          	ldw	x,(OFST-2,sp)
2436  0325 a30400        	cpw	x,#1024
2437  0328 2607          	jrne	L1421
2438                     ; 661     tmpreg = CLK->CSSR;
2440  032a c650c8        	ld	a,20680
2441  032d 6b03          	ld	(OFST+0,sp),a
2444  032f 2005          	jra	L7221
2445  0331               L1421:
2446                     ; 665     tmpreg = CLK->CCOR;
2448  0331 c650c9        	ld	a,20681
2449  0334 6b03          	ld	(OFST+0,sp),a
2451  0336               L7221:
2452                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2454  0336 7b05          	ld	a,(OFST+2,sp)
2455  0338 1503          	bcp	a,(OFST+0,sp)
2456  033a 2706          	jreq	L5421
2457                     ; 670     bitstatus = SET;
2459  033c a601          	ld	a,#1
2460  033e 6b03          	ld	(OFST+0,sp),a
2463  0340 2002          	jra	L7421
2464  0342               L5421:
2465                     ; 674     bitstatus = RESET;
2467  0342 0f03          	clr	(OFST+0,sp)
2469  0344               L7421:
2470                     ; 678   return((FlagStatus)bitstatus);
2472  0344 7b03          	ld	a,(OFST+0,sp)
2475  0346 5b05          	addw	sp,#5
2476  0348 81            	ret
2522                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2522                     ; 688 {
2523                     	switch	.text
2524  0349               _CLK_GetITStatus:
2526  0349 88            	push	a
2527  034a 88            	push	a
2528       00000001      OFST:	set	1
2531                     ; 689   ITStatus bitstatus = RESET;
2533                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2535                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2537  034b a11c          	cp	a,#28
2538  034d 2611          	jrne	L3721
2539                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2541  034f c450c5        	and	a,20677
2542  0352 a10c          	cp	a,#12
2543  0354 2606          	jrne	L5721
2544                     ; 699       bitstatus = SET;
2546  0356 a601          	ld	a,#1
2547  0358 6b01          	ld	(OFST+0,sp),a
2550  035a 2015          	jra	L1031
2551  035c               L5721:
2552                     ; 703       bitstatus = RESET;
2554  035c 0f01          	clr	(OFST+0,sp)
2556  035e 2011          	jra	L1031
2557  0360               L3721:
2558                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2560  0360 c650c8        	ld	a,20680
2561  0363 1402          	and	a,(OFST+1,sp)
2562  0365 a10c          	cp	a,#12
2563  0367 2606          	jrne	L3031
2564                     ; 711       bitstatus = SET;
2566  0369 a601          	ld	a,#1
2567  036b 6b01          	ld	(OFST+0,sp),a
2570  036d 2002          	jra	L1031
2571  036f               L3031:
2572                     ; 715       bitstatus = RESET;
2574  036f 0f01          	clr	(OFST+0,sp)
2576  0371               L1031:
2577                     ; 720   return bitstatus;
2579  0371 7b01          	ld	a,(OFST+0,sp)
2582  0373 85            	popw	x
2583  0374 81            	ret
2619                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2619                     ; 730 {
2620                     	switch	.text
2621  0375               _CLK_ClearITPendingBit:
2625                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2627                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2629  0375 a10c          	cp	a,#12
2630  0377 2606          	jrne	L5231
2631                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2633  0379 721750c8      	bres	20680,#3
2635  037d 2004          	jra	L7231
2636  037f               L5231:
2637                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2639  037f 721750c5      	bres	20677,#3
2640  0383               L7231:
2641                     ; 745 }
2644  0383 81            	ret
2679                     	xdef	_CLKPrescTable
2680                     	xdef	_HSIDivFactor
2681                     	xdef	_CLK_ClearITPendingBit
2682                     	xdef	_CLK_GetITStatus
2683                     	xdef	_CLK_GetFlagStatus
2684                     	xdef	_CLK_GetSYSCLKSource
2685                     	xdef	_CLK_GetClockFreq
2686                     	xdef	_CLK_AdjustHSICalibrationValue
2687                     	xdef	_CLK_SYSCLKEmergencyClear
2688                     	xdef	_CLK_ClockSecuritySystemEnable
2689                     	xdef	_CLK_SWIMConfig
2690                     	xdef	_CLK_SYSCLKConfig
2691                     	xdef	_CLK_ITConfig
2692                     	xdef	_CLK_CCOConfig
2693                     	xdef	_CLK_HSIPrescalerConfig
2694                     	xdef	_CLK_ClockSwitchConfig
2695                     	xdef	_CLK_PeripheralClockConfig
2696                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2697                     	xdef	_CLK_FastHaltWakeUpCmd
2698                     	xdef	_CLK_ClockSwitchCmd
2699                     	xdef	_CLK_CCOCmd
2700                     	xdef	_CLK_LSICmd
2701                     	xdef	_CLK_HSICmd
2702                     	xdef	_CLK_HSECmd
2703                     	xdef	_CLK_DeInit
2704                     	xref.b	c_lreg
2705                     	xref.b	c_x
2724                     	xref	c_ltor
2725                     	xref	c_ludv
2726                     	xref	c_rtol
2727                     	end
