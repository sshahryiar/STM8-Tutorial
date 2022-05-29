   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
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
  58                     	switch	.text
  59  0000               f_CLK_DeInit:
  63                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  65  0000 350150c0      	mov	20672,#1
  66                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  68  0004 725f50c1      	clr	20673
  69                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  71  0008 35e150c4      	mov	20676,#225
  72                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  74  000c 725f50c5      	clr	20677
  75                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  77  0010 351850c6      	mov	20678,#24
  78                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  80  0014 35ff50c7      	mov	20679,#255
  81                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  83  0018 35ff50ca      	mov	20682,#255
  84                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  86  001c 725f50c8      	clr	20680
  87                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  89  0020 725f50c9      	clr	20681
  91  0024               L52:
  92                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  94  0024 c650c9        	ld	a,20681
  95  0027 a501          	bcp	a,#1
  96  0029 26f9          	jrne	L52
  97                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  99  002b 725f50c9      	clr	20681
 100                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 102  002f 725f50cc      	clr	20684
 103                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 105  0033 725f50cd      	clr	20685
 106                     ; 88 }
 109  0037 87            	retf
 164                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 164                     ; 100 {
 165                     	switch	.text
 166  0038               f_CLK_FastHaltWakeUpCmd:
 170                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 172                     ; 104   if (NewState != DISABLE)
 174  0038 4d            	tnz	a
 175  0039 2706          	jreq	L75
 176                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 178  003b 721450c0      	bset	20672,#2
 180  003f 2004          	jra	L16
 181  0041               L75:
 182                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 184  0041 721550c0      	bres	20672,#2
 185  0045               L16:
 186                     ; 114 }
 189  0045 87            	retf
 223                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 223                     ; 122 {
 224                     	switch	.text
 225  0046               f_CLK_HSECmd:
 229                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 231                     ; 126   if (NewState != DISABLE)
 233  0046 4d            	tnz	a
 234  0047 2706          	jreq	L101
 235                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 237  0049 721050c1      	bset	20673,#0
 239  004d 2004          	jra	L301
 240  004f               L101:
 241                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 243  004f 721150c1      	bres	20673,#0
 244  0053               L301:
 245                     ; 136 }
 248  0053 87            	retf
 282                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 282                     ; 144 {
 283                     	switch	.text
 284  0054               f_CLK_HSICmd:
 288                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 290                     ; 148   if (NewState != DISABLE)
 292  0054 4d            	tnz	a
 293  0055 2706          	jreq	L321
 294                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 296  0057 721050c0      	bset	20672,#0
 298  005b 2004          	jra	L521
 299  005d               L321:
 300                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 302  005d 721150c0      	bres	20672,#0
 303  0061               L521:
 304                     ; 158 }
 307  0061 87            	retf
 341                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 341                     ; 167 {
 342                     	switch	.text
 343  0062               f_CLK_LSICmd:
 347                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 349                     ; 171   if (NewState != DISABLE)
 351  0062 4d            	tnz	a
 352  0063 2706          	jreq	L541
 353                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 355  0065 721650c0      	bset	20672,#3
 357  0069 2004          	jra	L741
 358  006b               L541:
 359                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 361  006b 721750c0      	bres	20672,#3
 362  006f               L741:
 363                     ; 181 }
 366  006f 87            	retf
 400                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 400                     ; 190 {
 401                     	switch	.text
 402  0070               f_CLK_CCOCmd:
 406                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 408                     ; 194   if (NewState != DISABLE)
 410  0070 4d            	tnz	a
 411  0071 2706          	jreq	L761
 412                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 414  0073 721050c9      	bset	20681,#0
 416  0077 2004          	jra	L171
 417  0079               L761:
 418                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 420  0079 721150c9      	bres	20681,#0
 421  007d               L171:
 422                     ; 204 }
 425  007d 87            	retf
 459                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 459                     ; 214 {
 460                     	switch	.text
 461  007e               f_CLK_ClockSwitchCmd:
 465                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 467                     ; 218   if (NewState != DISABLE )
 469  007e 4d            	tnz	a
 470  007f 2706          	jreq	L112
 471                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 473  0081 721250c5      	bset	20677,#1
 475  0085 2004          	jra	L312
 476  0087               L112:
 477                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 479  0087 721350c5      	bres	20677,#1
 480  008b               L312:
 481                     ; 228 }
 484  008b 87            	retf
 519                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 519                     ; 239 {
 520                     	switch	.text
 521  008c               f_CLK_SlowActiveHaltWakeUpCmd:
 525                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 527                     ; 243   if (NewState != DISABLE)
 529  008c 4d            	tnz	a
 530  008d 2706          	jreq	L332
 531                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 533  008f 721a50c0      	bset	20672,#5
 535  0093 2004          	jra	L532
 536  0095               L332:
 537                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 539  0095 721b50c0      	bres	20672,#5
 540  0099               L532:
 541                     ; 253 }
 544  0099 87            	retf
 702                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 702                     ; 264 {
 703                     	switch	.text
 704  009a               f_CLK_PeripheralClockConfig:
 706  009a 89            	pushw	x
 707       00000000      OFST:	set	0
 710                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 712                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 714                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 716  009b 9e            	ld	a,xh
 717  009c a510          	bcp	a,#16
 718  009e 2633          	jrne	L123
 719                     ; 271     if (NewState != DISABLE)
 721  00a0 0d02          	tnz	(OFST+2,sp)
 722  00a2 2717          	jreq	L323
 723                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 725  00a4 7b01          	ld	a,(OFST+1,sp)
 726  00a6 a40f          	and	a,#15
 727  00a8 5f            	clrw	x
 728  00a9 97            	ld	xl,a
 729  00aa a601          	ld	a,#1
 730  00ac 5d            	tnzw	x
 731  00ad 2704          	jreq	L62
 732  00af               L03:
 733  00af 48            	sll	a
 734  00b0 5a            	decw	x
 735  00b1 26fc          	jrne	L03
 736  00b3               L62:
 737  00b3 ca50c7        	or	a,20679
 738  00b6 c750c7        	ld	20679,a
 740  00b9 2049          	jra	L723
 741  00bb               L323:
 742                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 744  00bb 7b01          	ld	a,(OFST+1,sp)
 745  00bd a40f          	and	a,#15
 746  00bf 5f            	clrw	x
 747  00c0 97            	ld	xl,a
 748  00c1 a601          	ld	a,#1
 749  00c3 5d            	tnzw	x
 750  00c4 2704          	jreq	L23
 751  00c6               L43:
 752  00c6 48            	sll	a
 753  00c7 5a            	decw	x
 754  00c8 26fc          	jrne	L43
 755  00ca               L23:
 756  00ca 43            	cpl	a
 757  00cb c450c7        	and	a,20679
 758  00ce c750c7        	ld	20679,a
 759  00d1 2031          	jra	L723
 760  00d3               L123:
 761                     ; 284     if (NewState != DISABLE)
 763  00d3 0d02          	tnz	(OFST+2,sp)
 764  00d5 2717          	jreq	L133
 765                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 767  00d7 7b01          	ld	a,(OFST+1,sp)
 768  00d9 a40f          	and	a,#15
 769  00db 5f            	clrw	x
 770  00dc 97            	ld	xl,a
 771  00dd a601          	ld	a,#1
 772  00df 5d            	tnzw	x
 773  00e0 2704          	jreq	L63
 774  00e2               L04:
 775  00e2 48            	sll	a
 776  00e3 5a            	decw	x
 777  00e4 26fc          	jrne	L04
 778  00e6               L63:
 779  00e6 ca50ca        	or	a,20682
 780  00e9 c750ca        	ld	20682,a
 782  00ec 2016          	jra	L723
 783  00ee               L133:
 784                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 786  00ee 7b01          	ld	a,(OFST+1,sp)
 787  00f0 a40f          	and	a,#15
 788  00f2 5f            	clrw	x
 789  00f3 97            	ld	xl,a
 790  00f4 a601          	ld	a,#1
 791  00f6 5d            	tnzw	x
 792  00f7 2704          	jreq	L24
 793  00f9               L44:
 794  00f9 48            	sll	a
 795  00fa 5a            	decw	x
 796  00fb 26fc          	jrne	L44
 797  00fd               L24:
 798  00fd 43            	cpl	a
 799  00fe c450ca        	and	a,20682
 800  0101 c750ca        	ld	20682,a
 801  0104               L723:
 802                     ; 295 }
 805  0104 85            	popw	x
 806  0105 87            	retf
 991                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
 991                     ; 310 {
 992                     	switch	.text
 993  0106               f_CLK_ClockSwitchConfig:
 995  0106 89            	pushw	x
 996  0107 5204          	subw	sp,#4
 997       00000004      OFST:	set	4
1000                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1002  0109 aeffff        	ldw	x,#65535
1003  010c 1f03          	ldw	(OFST-1,sp),x
1005                     ; 313   ErrorStatus Swif = ERROR;
1007                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1009                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1011                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1013                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1015                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1017  010e c650c3        	ld	a,20675
1018  0111 6b01          	ld	(OFST-3,sp),a
1020                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1022  0113 7b05          	ld	a,(OFST+1,sp)
1023  0115 a101          	cp	a,#1
1024  0117 264b          	jrne	L344
1025                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1027  0119 721250c5      	bset	20677,#1
1028                     ; 331     if (ITState != DISABLE)
1030  011d 0d0a          	tnz	(OFST+6,sp)
1031  011f 2706          	jreq	L544
1032                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1034  0121 721450c5      	bset	20677,#2
1036  0125 2004          	jra	L744
1037  0127               L544:
1038                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1040  0127 721550c5      	bres	20677,#2
1041  012b               L744:
1042                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1044  012b 7b06          	ld	a,(OFST+2,sp)
1045  012d c750c4        	ld	20676,a
1047  0130 2007          	jra	L554
1048  0132               L154:
1049                     ; 346       DownCounter--;
1051  0132 1e03          	ldw	x,(OFST-1,sp)
1052  0134 1d0001        	subw	x,#1
1053  0137 1f03          	ldw	(OFST-1,sp),x
1055  0139               L554:
1056                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1058  0139 c650c5        	ld	a,20677
1059  013c a501          	bcp	a,#1
1060  013e 2704          	jreq	L164
1062  0140 1e03          	ldw	x,(OFST-1,sp)
1063  0142 26ee          	jrne	L154
1064  0144               L164:
1065                     ; 349     if(DownCounter != 0)
1067  0144 1e03          	ldw	x,(OFST-1,sp)
1068  0146 2706          	jreq	L364
1069                     ; 351       Swif = SUCCESS;
1071  0148 a601          	ld	a,#1
1072  014a 6b02          	ld	(OFST-2,sp),a
1075  014c 2002          	jra	L764
1076  014e               L364:
1077                     ; 355       Swif = ERROR;
1079  014e 0f02          	clr	(OFST-2,sp)
1081  0150               L764:
1082                     ; 390   if(Swif != ERROR)
1084  0150 0d02          	tnz	(OFST-2,sp)
1085  0152 2767          	jreq	L315
1086                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1088  0154 0d0b          	tnz	(OFST+7,sp)
1089  0156 2645          	jrne	L515
1091  0158 7b01          	ld	a,(OFST-3,sp)
1092  015a a1e1          	cp	a,#225
1093  015c 263f          	jrne	L515
1094                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1096  015e 721150c0      	bres	20672,#0
1098  0162 2057          	jra	L315
1099  0164               L344:
1100                     ; 361     if (ITState != DISABLE)
1102  0164 0d0a          	tnz	(OFST+6,sp)
1103  0166 2706          	jreq	L174
1104                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1106  0168 721450c5      	bset	20677,#2
1108  016c 2004          	jra	L374
1109  016e               L174:
1110                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1112  016e 721550c5      	bres	20677,#2
1113  0172               L374:
1114                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1116  0172 7b06          	ld	a,(OFST+2,sp)
1117  0174 c750c4        	ld	20676,a
1119  0177 2007          	jra	L105
1120  0179               L574:
1121                     ; 376       DownCounter--;
1123  0179 1e03          	ldw	x,(OFST-1,sp)
1124  017b 1d0001        	subw	x,#1
1125  017e 1f03          	ldw	(OFST-1,sp),x
1127  0180               L105:
1128                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1130  0180 c650c5        	ld	a,20677
1131  0183 a508          	bcp	a,#8
1132  0185 2704          	jreq	L505
1134  0187 1e03          	ldw	x,(OFST-1,sp)
1135  0189 26ee          	jrne	L574
1136  018b               L505:
1137                     ; 379     if(DownCounter != 0)
1139  018b 1e03          	ldw	x,(OFST-1,sp)
1140  018d 270a          	jreq	L705
1141                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1143  018f 721250c5      	bset	20677,#1
1144                     ; 383       Swif = SUCCESS;
1146  0193 a601          	ld	a,#1
1147  0195 6b02          	ld	(OFST-2,sp),a
1150  0197 20b7          	jra	L764
1151  0199               L705:
1152                     ; 387       Swif = ERROR;
1154  0199 0f02          	clr	(OFST-2,sp)
1156  019b 20b3          	jra	L764
1157  019d               L515:
1158                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1160  019d 0d0b          	tnz	(OFST+7,sp)
1161  019f 260c          	jrne	L125
1163  01a1 7b01          	ld	a,(OFST-3,sp)
1164  01a3 a1d2          	cp	a,#210
1165  01a5 2606          	jrne	L125
1166                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1168  01a7 721750c0      	bres	20672,#3
1170  01ab 200e          	jra	L315
1171  01ad               L125:
1172                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1174  01ad 0d0b          	tnz	(OFST+7,sp)
1175  01af 260a          	jrne	L315
1177  01b1 7b01          	ld	a,(OFST-3,sp)
1178  01b3 a1b4          	cp	a,#180
1179  01b5 2604          	jrne	L315
1180                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1182  01b7 721150c1      	bres	20673,#0
1183  01bb               L315:
1184                     ; 406   return(Swif);
1186  01bb 7b02          	ld	a,(OFST-2,sp)
1189  01bd 5b06          	addw	sp,#6
1190  01bf 87            	retf
1327                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1327                     ; 416 {
1328                     	switch	.text
1329  01c0               f_CLK_HSIPrescalerConfig:
1331  01c0 88            	push	a
1332       00000000      OFST:	set	0
1335                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1337                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1339  01c1 c650c6        	ld	a,20678
1340  01c4 a4e7          	and	a,#231
1341  01c6 c750c6        	ld	20678,a
1342                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1344  01c9 c650c6        	ld	a,20678
1345  01cc 1a01          	or	a,(OFST+1,sp)
1346  01ce c750c6        	ld	20678,a
1347                     ; 425 }
1350  01d1 84            	pop	a
1351  01d2 87            	retf
1485                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1485                     ; 437 {
1486                     	switch	.text
1487  01d3               f_CLK_CCOConfig:
1489  01d3 88            	push	a
1490       00000000      OFST:	set	0
1493                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1495                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1497  01d4 c650c9        	ld	a,20681
1498  01d7 a4e1          	and	a,#225
1499  01d9 c750c9        	ld	20681,a
1500                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1502  01dc c650c9        	ld	a,20681
1503  01df 1a01          	or	a,(OFST+1,sp)
1504  01e1 c750c9        	ld	20681,a
1505                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1507  01e4 721050c9      	bset	20681,#0
1508                     ; 449 }
1511  01e8 84            	pop	a
1512  01e9 87            	retf
1576                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1576                     ; 460 {
1577                     	switch	.text
1578  01ea               f_CLK_ITConfig:
1580  01ea 89            	pushw	x
1581       00000000      OFST:	set	0
1584                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1586                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1588                     ; 465   if (NewState != DISABLE)
1590  01eb 9f            	ld	a,xl
1591  01ec 4d            	tnz	a
1592  01ed 2719          	jreq	L327
1593                     ; 467     switch (CLK_IT)
1595  01ef 9e            	ld	a,xh
1597                     ; 475     default:
1597                     ; 476       break;
1598  01f0 a00c          	sub	a,#12
1599  01f2 270a          	jreq	L756
1600  01f4 a010          	sub	a,#16
1601  01f6 2624          	jrne	L137
1602                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1602                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1604  01f8 721450c5      	bset	20677,#2
1605                     ; 471       break;
1607  01fc 201e          	jra	L137
1608  01fe               L756:
1609                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1609                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1611  01fe 721450c8      	bset	20680,#2
1612                     ; 474       break;
1614  0202 2018          	jra	L137
1615  0204               L166:
1616                     ; 475     default:
1616                     ; 476       break;
1618  0204 2016          	jra	L137
1619  0206               L727:
1621  0206 2014          	jra	L137
1622  0208               L327:
1623                     ; 481     switch (CLK_IT)
1625  0208 7b01          	ld	a,(OFST+1,sp)
1627                     ; 489     default:
1627                     ; 490       break;
1628  020a a00c          	sub	a,#12
1629  020c 270a          	jreq	L566
1630  020e a010          	sub	a,#16
1631  0210 260a          	jrne	L137
1632                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1632                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1634  0212 721550c5      	bres	20677,#2
1635                     ; 485       break;
1637  0216 2004          	jra	L137
1638  0218               L566:
1639                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1639                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1641  0218 721550c8      	bres	20680,#2
1642                     ; 488       break;
1643  021c               L137:
1644                     ; 493 }
1647  021c 85            	popw	x
1648  021d 87            	retf
1649  021e               L766:
1650                     ; 489     default:
1650                     ; 490       break;
1652  021e 20fc          	jra	L137
1653  0220               L537:
1654  0220 20fa          	jra	L137
1688                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1688                     ; 501 {
1689                     	switch	.text
1690  0222               f_CLK_SYSCLKConfig:
1692  0222 88            	push	a
1693       00000000      OFST:	set	0
1696                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1698                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1700  0223 a580          	bcp	a,#128
1701  0225 2614          	jrne	L557
1702                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1704  0227 c650c6        	ld	a,20678
1705  022a a4e7          	and	a,#231
1706  022c c750c6        	ld	20678,a
1707                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1709  022f 7b01          	ld	a,(OFST+1,sp)
1710  0231 a418          	and	a,#24
1711  0233 ca50c6        	or	a,20678
1712  0236 c750c6        	ld	20678,a
1714  0239 2012          	jra	L757
1715  023b               L557:
1716                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1718  023b c650c6        	ld	a,20678
1719  023e a4f8          	and	a,#248
1720  0240 c750c6        	ld	20678,a
1721                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1723  0243 7b01          	ld	a,(OFST+1,sp)
1724  0245 a407          	and	a,#7
1725  0247 ca50c6        	or	a,20678
1726  024a c750c6        	ld	20678,a
1727  024d               L757:
1728                     ; 515 }
1731  024d 84            	pop	a
1732  024e 87            	retf
1787                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1787                     ; 524 {
1788                     	switch	.text
1789  024f               f_CLK_SWIMConfig:
1793                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1795                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1797  024f 4d            	tnz	a
1798  0250 2706          	jreq	L7001
1799                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1801  0252 721050cd      	bset	20685,#0
1803  0256 2004          	jra	L1101
1804  0258               L7001:
1805                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1807  0258 721150cd      	bres	20685,#0
1808  025c               L1101:
1809                     ; 538 }
1812  025c 87            	retf
1835                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1835                     ; 548 {
1836                     	switch	.text
1837  025d               f_CLK_ClockSecuritySystemEnable:
1841                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1843  025d 721050c8      	bset	20680,#0
1844                     ; 551 }
1847  0261 87            	retf
1871                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1871                     ; 560 {
1872                     	switch	.text
1873  0262               f_CLK_GetSYSCLKSource:
1877                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1879  0262 c650c3        	ld	a,20675
1882  0265 87            	retf
1938                     ; 569 uint32_t CLK_GetClockFreq(void)
1938                     ; 570 {
1939                     	switch	.text
1940  0266               f_CLK_GetClockFreq:
1942  0266 5209          	subw	sp,#9
1943       00000009      OFST:	set	9
1946                     ; 571   uint32_t clockfrequency = 0;
1948                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1950                     ; 573   uint8_t tmp = 0, presc = 0;
1954                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1956  0268 c650c3        	ld	a,20675
1957  026b 6b09          	ld	(OFST+0,sp),a
1959                     ; 578   if (clocksource == CLK_SOURCE_HSI)
1961  026d 7b09          	ld	a,(OFST+0,sp)
1962  026f a1e1          	cp	a,#225
1963  0271 2644          	jrne	L7501
1964                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1966  0273 c650c6        	ld	a,20678
1967  0276 a418          	and	a,#24
1968  0278 6b09          	ld	(OFST+0,sp),a
1970                     ; 581     tmp = (uint8_t)(tmp >> 3);
1972  027a 0409          	srl	(OFST+0,sp)
1973  027c 0409          	srl	(OFST+0,sp)
1974  027e 0409          	srl	(OFST+0,sp)
1976                     ; 582     presc = HSIDivFactor[tmp];
1978  0280 7b09          	ld	a,(OFST+0,sp)
1979  0282 5f            	clrw	x
1980  0283 97            	ld	xl,a
1981  0284 d60000        	ld	a,(_HSIDivFactor,x)
1982  0287 6b09          	ld	(OFST+0,sp),a
1984                     ; 583     clockfrequency = HSI_VALUE / presc;
1986  0289 7b09          	ld	a,(OFST+0,sp)
1987  028b b703          	ld	c_lreg+3,a
1988  028d 3f02          	clr	c_lreg+2
1989  028f 3f01          	clr	c_lreg+1
1990  0291 3f00          	clr	c_lreg
1991  0293 96            	ldw	x,sp
1992  0294 1c0001        	addw	x,#OFST-8
1993  0297 8d000000      	callf	d_rtol
1996  029b ae2400        	ldw	x,#9216
1997  029e bf02          	ldw	c_lreg+2,x
1998  02a0 ae00f4        	ldw	x,#244
1999  02a3 bf00          	ldw	c_lreg,x
2000  02a5 96            	ldw	x,sp
2001  02a6 1c0001        	addw	x,#OFST-8
2002  02a9 8d000000      	callf	d_ludv
2004  02ad 96            	ldw	x,sp
2005  02ae 1c0005        	addw	x,#OFST-4
2006  02b1 8d000000      	callf	d_rtol
2010  02b5 201c          	jra	L1601
2011  02b7               L7501:
2012                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2014  02b7 7b09          	ld	a,(OFST+0,sp)
2015  02b9 a1d2          	cp	a,#210
2016  02bb 260c          	jrne	L3601
2017                     ; 587     clockfrequency = LSI_VALUE;
2019  02bd aef400        	ldw	x,#62464
2020  02c0 1f07          	ldw	(OFST-2,sp),x
2021  02c2 ae0001        	ldw	x,#1
2022  02c5 1f05          	ldw	(OFST-4,sp),x
2025  02c7 200a          	jra	L1601
2026  02c9               L3601:
2027                     ; 591     clockfrequency = HSE_VALUE;
2029  02c9 ae2400        	ldw	x,#9216
2030  02cc 1f07          	ldw	(OFST-2,sp),x
2031  02ce ae00f4        	ldw	x,#244
2032  02d1 1f05          	ldw	(OFST-4,sp),x
2034  02d3               L1601:
2035                     ; 594   return((uint32_t)clockfrequency);
2037  02d3 96            	ldw	x,sp
2038  02d4 1c0005        	addw	x,#OFST-4
2039  02d7 8d000000      	callf	d_ltor
2043  02db 5b09          	addw	sp,#9
2044  02dd 87            	retf
2142                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2142                     ; 605 {
2143                     	switch	.text
2144  02de               f_CLK_AdjustHSICalibrationValue:
2146  02de 88            	push	a
2147       00000000      OFST:	set	0
2150                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2152                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2154  02df c650cc        	ld	a,20684
2155  02e2 a4f8          	and	a,#248
2156  02e4 1a01          	or	a,(OFST+1,sp)
2157  02e6 c750cc        	ld	20684,a
2158                     ; 611 }
2161  02e9 84            	pop	a
2162  02ea 87            	retf
2185                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2185                     ; 623 {
2186                     	switch	.text
2187  02eb               f_CLK_SYSCLKEmergencyClear:
2191                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2193  02eb 721150c5      	bres	20677,#0
2194                     ; 625 }
2197  02ef 87            	retf
2345                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2345                     ; 635 {
2346                     	switch	.text
2347  02f0               f_CLK_GetFlagStatus:
2349  02f0 89            	pushw	x
2350  02f1 5203          	subw	sp,#3
2351       00000003      OFST:	set	3
2354                     ; 636   uint16_t statusreg = 0;
2356                     ; 637   uint8_t tmpreg = 0;
2358                     ; 638   FlagStatus bitstatus = RESET;
2360                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2362                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2364  02f3 01            	rrwa	x,a
2365  02f4 9f            	ld	a,xl
2366  02f5 a4ff          	and	a,#255
2367  02f7 97            	ld	xl,a
2368  02f8 4f            	clr	a
2369  02f9 02            	rlwa	x,a
2370  02fa 1f01          	ldw	(OFST-2,sp),x
2371  02fc 01            	rrwa	x,a
2373                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2375  02fd 1e01          	ldw	x,(OFST-2,sp)
2376  02ff a30100        	cpw	x,#256
2377  0302 2607          	jrne	L5221
2378                     ; 649     tmpreg = CLK->ICKR;
2380  0304 c650c0        	ld	a,20672
2381  0307 6b03          	ld	(OFST+0,sp),a
2384  0309 202f          	jra	L7221
2385  030b               L5221:
2386                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2388  030b 1e01          	ldw	x,(OFST-2,sp)
2389  030d a30200        	cpw	x,#512
2390  0310 2607          	jrne	L1321
2391                     ; 653     tmpreg = CLK->ECKR;
2393  0312 c650c1        	ld	a,20673
2394  0315 6b03          	ld	(OFST+0,sp),a
2397  0317 2021          	jra	L7221
2398  0319               L1321:
2399                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2401  0319 1e01          	ldw	x,(OFST-2,sp)
2402  031b a30300        	cpw	x,#768
2403  031e 2607          	jrne	L5321
2404                     ; 657     tmpreg = CLK->SWCR;
2406  0320 c650c5        	ld	a,20677
2407  0323 6b03          	ld	(OFST+0,sp),a
2410  0325 2013          	jra	L7221
2411  0327               L5321:
2412                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2414  0327 1e01          	ldw	x,(OFST-2,sp)
2415  0329 a30400        	cpw	x,#1024
2416  032c 2607          	jrne	L1421
2417                     ; 661     tmpreg = CLK->CSSR;
2419  032e c650c8        	ld	a,20680
2420  0331 6b03          	ld	(OFST+0,sp),a
2423  0333 2005          	jra	L7221
2424  0335               L1421:
2425                     ; 665     tmpreg = CLK->CCOR;
2427  0335 c650c9        	ld	a,20681
2428  0338 6b03          	ld	(OFST+0,sp),a
2430  033a               L7221:
2431                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2433  033a 7b05          	ld	a,(OFST+2,sp)
2434  033c 1503          	bcp	a,(OFST+0,sp)
2435  033e 2706          	jreq	L5421
2436                     ; 670     bitstatus = SET;
2438  0340 a601          	ld	a,#1
2439  0342 6b03          	ld	(OFST+0,sp),a
2442  0344 2002          	jra	L7421
2443  0346               L5421:
2444                     ; 674     bitstatus = RESET;
2446  0346 0f03          	clr	(OFST+0,sp)
2448  0348               L7421:
2449                     ; 678   return((FlagStatus)bitstatus);
2451  0348 7b03          	ld	a,(OFST+0,sp)
2454  034a 5b05          	addw	sp,#5
2455  034c 87            	retf
2500                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2500                     ; 688 {
2501                     	switch	.text
2502  034d               f_CLK_GetITStatus:
2504  034d 88            	push	a
2505  034e 88            	push	a
2506       00000001      OFST:	set	1
2509                     ; 689   ITStatus bitstatus = RESET;
2511                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2513                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2515  034f a11c          	cp	a,#28
2516  0351 2611          	jrne	L3721
2517                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2519  0353 c450c5        	and	a,20677
2520  0356 a10c          	cp	a,#12
2521  0358 2606          	jrne	L5721
2522                     ; 699       bitstatus = SET;
2524  035a a601          	ld	a,#1
2525  035c 6b01          	ld	(OFST+0,sp),a
2528  035e 2015          	jra	L1031
2529  0360               L5721:
2530                     ; 703       bitstatus = RESET;
2532  0360 0f01          	clr	(OFST+0,sp)
2534  0362 2011          	jra	L1031
2535  0364               L3721:
2536                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2538  0364 c650c8        	ld	a,20680
2539  0367 1402          	and	a,(OFST+1,sp)
2540  0369 a10c          	cp	a,#12
2541  036b 2606          	jrne	L3031
2542                     ; 711       bitstatus = SET;
2544  036d a601          	ld	a,#1
2545  036f 6b01          	ld	(OFST+0,sp),a
2548  0371 2002          	jra	L1031
2549  0373               L3031:
2550                     ; 715       bitstatus = RESET;
2552  0373 0f01          	clr	(OFST+0,sp)
2554  0375               L1031:
2555                     ; 720   return bitstatus;
2557  0375 7b01          	ld	a,(OFST+0,sp)
2560  0377 85            	popw	x
2561  0378 87            	retf
2596                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2596                     ; 730 {
2597                     	switch	.text
2598  0379               f_CLK_ClearITPendingBit:
2602                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2604                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2606  0379 a10c          	cp	a,#12
2607  037b 2606          	jrne	L5231
2608                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2610  037d 721750c8      	bres	20680,#3
2612  0381 2004          	jra	L7231
2613  0383               L5231:
2614                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2616  0383 721750c5      	bres	20677,#3
2617  0387               L7231:
2618                     ; 745 }
2621  0387 87            	retf
2655                     	xdef	_CLKPrescTable
2656                     	xdef	_HSIDivFactor
2657                     	xdef	f_CLK_ClearITPendingBit
2658                     	xdef	f_CLK_GetITStatus
2659                     	xdef	f_CLK_GetFlagStatus
2660                     	xdef	f_CLK_GetSYSCLKSource
2661                     	xdef	f_CLK_GetClockFreq
2662                     	xdef	f_CLK_AdjustHSICalibrationValue
2663                     	xdef	f_CLK_SYSCLKEmergencyClear
2664                     	xdef	f_CLK_ClockSecuritySystemEnable
2665                     	xdef	f_CLK_SWIMConfig
2666                     	xdef	f_CLK_SYSCLKConfig
2667                     	xdef	f_CLK_ITConfig
2668                     	xdef	f_CLK_CCOConfig
2669                     	xdef	f_CLK_HSIPrescalerConfig
2670                     	xdef	f_CLK_ClockSwitchConfig
2671                     	xdef	f_CLK_PeripheralClockConfig
2672                     	xdef	f_CLK_SlowActiveHaltWakeUpCmd
2673                     	xdef	f_CLK_FastHaltWakeUpCmd
2674                     	xdef	f_CLK_ClockSwitchCmd
2675                     	xdef	f_CLK_CCOCmd
2676                     	xdef	f_CLK_LSICmd
2677                     	xdef	f_CLK_HSICmd
2678                     	xdef	f_CLK_HSECmd
2679                     	xdef	f_CLK_DeInit
2680                     	xref.b	c_lreg
2681                     	xref.b	c_x
2700                     	xref	d_ltor
2701                     	xref	d_ludv
2702                     	xref	d_rtol
2703                     	end
