   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  19                     .const:	section	.text
  20  0000               _HSIDivFactor:
  21  0000 01            	dc.b	1
  22  0001 02            	dc.b	2
  23  0002 04            	dc.b	4
  24  0003 08            	dc.b	8
  25  0004               _CLKPrescTable:
  26  0004 01            	dc.b	1
  27  0005 02            	dc.b	2
  28  0006 04            	dc.b	4
  29  0007 08            	dc.b	8
  30  0008 0a            	dc.b	10
  31  0009 10            	dc.b	16
  32  000a 14            	dc.b	20
  33  000b 28            	dc.b	40
  62                     ; 72 void CLK_DeInit(void)
  62                     ; 73 {
  64                     	switch	.text
  65  0000               _CLK_DeInit:
  69                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  71  0000 350150c0      	mov	20672,#1
  72                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  74  0004 725f50c1      	clr	20673
  75                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  77  0008 35e150c4      	mov	20676,#225
  78                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  80  000c 725f50c5      	clr	20677
  81                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  83  0010 351850c6      	mov	20678,#24
  84                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  86  0014 35ff50c7      	mov	20679,#255
  87                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  89  0018 35ff50ca      	mov	20682,#255
  90                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  92  001c 725f50c8      	clr	20680
  93                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  95  0020 725f50c9      	clr	20681
  97  0024               L52:
  98                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
 100  0024 720050c9fb    	btjt	20681,#0,L52
 101                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 103  0029 725f50c9      	clr	20681
 104                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 106  002d 725f50cc      	clr	20684
 107                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 109  0031 725f50cd      	clr	20685
 110                     ; 88 }
 113  0035 81            	ret	
 169                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 169                     ; 100 {
 170                     	switch	.text
 171  0036               _CLK_FastHaltWakeUpCmd:
 175                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 177                     ; 104   if (NewState != DISABLE)
 179  0036 4d            	tnz	a
 180  0037 2705          	jreq	L75
 181                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 183  0039 721450c0      	bset	20672,#2
 186  003d 81            	ret	
 187  003e               L75:
 188                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 190  003e 721550c0      	bres	20672,#2
 191                     ; 114 }
 194  0042 81            	ret	
 229                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 229                     ; 122 {
 230                     	switch	.text
 231  0043               _CLK_HSECmd:
 235                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 237                     ; 126   if (NewState != DISABLE)
 239  0043 4d            	tnz	a
 240  0044 2705          	jreq	L101
 241                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 243  0046 721050c1      	bset	20673,#0
 246  004a 81            	ret	
 247  004b               L101:
 248                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 250  004b 721150c1      	bres	20673,#0
 251                     ; 136 }
 254  004f 81            	ret	
 289                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 289                     ; 144 {
 290                     	switch	.text
 291  0050               _CLK_HSICmd:
 295                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 297                     ; 148   if (NewState != DISABLE)
 299  0050 4d            	tnz	a
 300  0051 2705          	jreq	L321
 301                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 303  0053 721050c0      	bset	20672,#0
 306  0057 81            	ret	
 307  0058               L321:
 308                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 310  0058 721150c0      	bres	20672,#0
 311                     ; 158 }
 314  005c 81            	ret	
 349                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 349                     ; 167 {
 350                     	switch	.text
 351  005d               _CLK_LSICmd:
 355                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 357                     ; 171   if (NewState != DISABLE)
 359  005d 4d            	tnz	a
 360  005e 2705          	jreq	L541
 361                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 363  0060 721650c0      	bset	20672,#3
 366  0064 81            	ret	
 367  0065               L541:
 368                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 370  0065 721750c0      	bres	20672,#3
 371                     ; 181 }
 374  0069 81            	ret	
 409                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 409                     ; 190 {
 410                     	switch	.text
 411  006a               _CLK_CCOCmd:
 415                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 417                     ; 194   if (NewState != DISABLE)
 419  006a 4d            	tnz	a
 420  006b 2705          	jreq	L761
 421                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 423  006d 721050c9      	bset	20681,#0
 426  0071 81            	ret	
 427  0072               L761:
 428                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 430  0072 721150c9      	bres	20681,#0
 431                     ; 204 }
 434  0076 81            	ret	
 469                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 469                     ; 214 {
 470                     	switch	.text
 471  0077               _CLK_ClockSwitchCmd:
 475                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 477                     ; 218   if (NewState != DISABLE )
 479  0077 4d            	tnz	a
 480  0078 2705          	jreq	L112
 481                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 483  007a 721250c5      	bset	20677,#1
 486  007e 81            	ret	
 487  007f               L112:
 488                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 490  007f 721350c5      	bres	20677,#1
 491                     ; 228 }
 494  0083 81            	ret	
 530                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 530                     ; 239 {
 531                     	switch	.text
 532  0084               _CLK_SlowActiveHaltWakeUpCmd:
 536                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 538                     ; 243   if (NewState != DISABLE)
 540  0084 4d            	tnz	a
 541  0085 2705          	jreq	L332
 542                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 544  0087 721a50c0      	bset	20672,#5
 547  008b 81            	ret	
 548  008c               L332:
 549                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 551  008c 721b50c0      	bres	20672,#5
 552                     ; 253 }
 555  0090 81            	ret	
 714                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 714                     ; 264 {
 715                     	switch	.text
 716  0091               _CLK_PeripheralClockConfig:
 718  0091 89            	pushw	x
 719       00000000      OFST:	set	0
 722                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 724                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 726                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 728  0092 9e            	ld	a,xh
 729  0093 a510          	bcp	a,#16
 730  0095 2626          	jrne	L123
 731                     ; 271     if (NewState != DISABLE)
 733  0097 7b02          	ld	a,(OFST+2,sp)
 734  0099 270f          	jreq	L323
 735                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 737  009b 7b01          	ld	a,(OFST+1,sp)
 738  009d ad44          	call	LC003
 739  009f 2704          	jreq	L62
 740  00a1               L03:
 741  00a1 48            	sll	a
 742  00a2 5a            	decw	x
 743  00a3 26fc          	jrne	L03
 744  00a5               L62:
 745  00a5 ca50c7        	or	a,20679
 747  00a8 200e          	jp	LC002
 748  00aa               L323:
 749                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 751  00aa 7b01          	ld	a,(OFST+1,sp)
 752  00ac ad35          	call	LC003
 753  00ae 2704          	jreq	L23
 754  00b0               L43:
 755  00b0 48            	sll	a
 756  00b1 5a            	decw	x
 757  00b2 26fc          	jrne	L43
 758  00b4               L23:
 759  00b4 43            	cpl	a
 760  00b5 c450c7        	and	a,20679
 761  00b8               LC002:
 762  00b8 c750c7        	ld	20679,a
 763  00bb 2024          	jra	L723
 764  00bd               L123:
 765                     ; 284     if (NewState != DISABLE)
 767  00bd 7b02          	ld	a,(OFST+2,sp)
 768  00bf 270f          	jreq	L133
 769                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 771  00c1 7b01          	ld	a,(OFST+1,sp)
 772  00c3 ad1e          	call	LC003
 773  00c5 2704          	jreq	L63
 774  00c7               L04:
 775  00c7 48            	sll	a
 776  00c8 5a            	decw	x
 777  00c9 26fc          	jrne	L04
 778  00cb               L63:
 779  00cb ca50ca        	or	a,20682
 781  00ce 200e          	jp	LC001
 782  00d0               L133:
 783                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 785  00d0 7b01          	ld	a,(OFST+1,sp)
 786  00d2 ad0f          	call	LC003
 787  00d4 2704          	jreq	L24
 788  00d6               L44:
 789  00d6 48            	sll	a
 790  00d7 5a            	decw	x
 791  00d8 26fc          	jrne	L44
 792  00da               L24:
 793  00da 43            	cpl	a
 794  00db c450ca        	and	a,20682
 795  00de               LC001:
 796  00de c750ca        	ld	20682,a
 797  00e1               L723:
 798                     ; 295 }
 801  00e1 85            	popw	x
 802  00e2 81            	ret	
 803  00e3               LC003:
 804  00e3 a40f          	and	a,#15
 805  00e5 5f            	clrw	x
 806  00e6 97            	ld	xl,a
 807  00e7 a601          	ld	a,#1
 808  00e9 5d            	tnzw	x
 809  00ea 81            	ret	
 995                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
 995                     ; 310 {
 996                     	switch	.text
 997  00eb               _CLK_ClockSwitchConfig:
 999  00eb 89            	pushw	x
1000  00ec 5204          	subw	sp,#4
1001       00000004      OFST:	set	4
1004                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1006  00ee aeffff        	ldw	x,#65535
1007  00f1 1f03          	ldw	(OFST-1,sp),x
1009                     ; 313   ErrorStatus Swif = ERROR;
1011                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1013                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1015                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1017                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1019                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1021  00f3 c650c3        	ld	a,20675
1022  00f6 6b01          	ld	(OFST-3,sp),a
1024                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1026  00f8 7b05          	ld	a,(OFST+1,sp)
1027  00fa 4a            	dec	a
1028  00fb 263d          	jrne	L344
1029                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1031  00fd 721250c5      	bset	20677,#1
1032                     ; 331     if (ITState != DISABLE)
1034  0101 7b09          	ld	a,(OFST+5,sp)
1035  0103 2706          	jreq	L544
1036                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1038  0105 721450c5      	bset	20677,#2
1040  0109 2004          	jra	L744
1041  010b               L544:
1042                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1044  010b 721550c5      	bres	20677,#2
1045  010f               L744:
1046                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1048  010f 7b06          	ld	a,(OFST+2,sp)
1049  0111 c750c4        	ld	20676,a
1051  0114 2003          	jra	L554
1052  0116               L154:
1053                     ; 346       DownCounter--;
1055  0116 5a            	decw	x
1056  0117 1f03          	ldw	(OFST-1,sp),x
1058  0119               L554:
1059                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1061  0119 720150c504    	btjf	20677,#0,L164
1063  011e 1e03          	ldw	x,(OFST-1,sp)
1064  0120 26f4          	jrne	L154
1065  0122               L164:
1066                     ; 349     if(DownCounter != 0)
1068  0122 1e03          	ldw	x,(OFST-1,sp)
1069                     ; 351       Swif = SUCCESS;
1071  0124 263d          	jrne	LC005
1072  0126               L364:
1073                     ; 355       Swif = ERROR;
1076  0126 0f02          	clr	(OFST-2,sp)
1078  0128               L764:
1079                     ; 390   if(Swif != ERROR)
1081  0128 275d          	jreq	L315
1082                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1084  012a 7b0a          	ld	a,(OFST+6,sp)
1085  012c 263b          	jrne	L515
1087  012e 7b01          	ld	a,(OFST-3,sp)
1088  0130 a1e1          	cp	a,#225
1089  0132 2635          	jrne	L515
1090                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1092  0134 721150c0      	bres	20672,#0
1094  0138 204d          	jra	L315
1095  013a               L344:
1096                     ; 361     if (ITState != DISABLE)
1098  013a 7b09          	ld	a,(OFST+5,sp)
1099  013c 2706          	jreq	L174
1100                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1102  013e 721450c5      	bset	20677,#2
1104  0142 2004          	jra	L374
1105  0144               L174:
1106                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1108  0144 721550c5      	bres	20677,#2
1109  0148               L374:
1110                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1112  0148 7b06          	ld	a,(OFST+2,sp)
1113  014a c750c4        	ld	20676,a
1115  014d 2003          	jra	L105
1116  014f               L574:
1117                     ; 376       DownCounter--;
1119  014f 5a            	decw	x
1120  0150 1f03          	ldw	(OFST-1,sp),x
1122  0152               L105:
1123                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1125  0152 720750c504    	btjf	20677,#3,L505
1127  0157 1e03          	ldw	x,(OFST-1,sp)
1128  0159 26f4          	jrne	L574
1129  015b               L505:
1130                     ; 379     if(DownCounter != 0)
1132  015b 1e03          	ldw	x,(OFST-1,sp)
1133  015d 27c7          	jreq	L364
1134                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1136  015f 721250c5      	bset	20677,#1
1137                     ; 383       Swif = SUCCESS;
1139  0163               LC005:
1141  0163 a601          	ld	a,#1
1142  0165 6b02          	ld	(OFST-2,sp),a
1145  0167 20bf          	jra	L764
1146                     ; 387       Swif = ERROR;
1147  0169               L515:
1148                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1150  0169 7b0a          	ld	a,(OFST+6,sp)
1151  016b 260c          	jrne	L125
1153  016d 7b01          	ld	a,(OFST-3,sp)
1154  016f a1d2          	cp	a,#210
1155  0171 2606          	jrne	L125
1156                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1158  0173 721750c0      	bres	20672,#3
1160  0177 200e          	jra	L315
1161  0179               L125:
1162                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1164  0179 7b0a          	ld	a,(OFST+6,sp)
1165  017b 260a          	jrne	L315
1167  017d 7b01          	ld	a,(OFST-3,sp)
1168  017f a1b4          	cp	a,#180
1169  0181 2604          	jrne	L315
1170                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1172  0183 721150c1      	bres	20673,#0
1173  0187               L315:
1174                     ; 406   return(Swif);
1176  0187 7b02          	ld	a,(OFST-2,sp)
1179  0189 5b06          	addw	sp,#6
1180  018b 81            	ret	
1318                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1318                     ; 416 {
1319                     	switch	.text
1320  018c               _CLK_HSIPrescalerConfig:
1322  018c 88            	push	a
1323       00000000      OFST:	set	0
1326                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1328                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1330  018d c650c6        	ld	a,20678
1331  0190 a4e7          	and	a,#231
1332  0192 c750c6        	ld	20678,a
1333                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1335  0195 c650c6        	ld	a,20678
1336  0198 1a01          	or	a,(OFST+1,sp)
1337  019a c750c6        	ld	20678,a
1338                     ; 425 }
1341  019d 84            	pop	a
1342  019e 81            	ret	
1477                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1477                     ; 437 {
1478                     	switch	.text
1479  019f               _CLK_CCOConfig:
1481  019f 88            	push	a
1482       00000000      OFST:	set	0
1485                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1487                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1489  01a0 c650c9        	ld	a,20681
1490  01a3 a4e1          	and	a,#225
1491  01a5 c750c9        	ld	20681,a
1492                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1494  01a8 c650c9        	ld	a,20681
1495  01ab 1a01          	or	a,(OFST+1,sp)
1496  01ad c750c9        	ld	20681,a
1497                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1499  01b0 721050c9      	bset	20681,#0
1500                     ; 449 }
1503  01b4 84            	pop	a
1504  01b5 81            	ret	
1569                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1569                     ; 460 {
1570                     	switch	.text
1571  01b6               _CLK_ITConfig:
1573  01b6 89            	pushw	x
1574       00000000      OFST:	set	0
1577                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1579                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1581                     ; 465   if (NewState != DISABLE)
1583  01b7 9f            	ld	a,xl
1584  01b8 4d            	tnz	a
1585  01b9 2715          	jreq	L327
1586                     ; 467     switch (CLK_IT)
1588  01bb 9e            	ld	a,xh
1590                     ; 475     default:
1590                     ; 476       break;
1591  01bc a00c          	sub	a,#12
1592  01be 270a          	jreq	L756
1593  01c0 a010          	sub	a,#16
1594  01c2 2620          	jrne	L137
1595                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1595                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1597  01c4 721450c5      	bset	20677,#2
1598                     ; 471       break;
1600  01c8 201a          	jra	L137
1601  01ca               L756:
1602                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1602                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1604  01ca 721450c8      	bset	20680,#2
1605                     ; 474       break;
1607  01ce 2014          	jra	L137
1608                     ; 475     default:
1608                     ; 476       break;
1611  01d0               L327:
1612                     ; 481     switch (CLK_IT)
1614  01d0 7b01          	ld	a,(OFST+1,sp)
1616                     ; 489     default:
1616                     ; 490       break;
1617  01d2 a00c          	sub	a,#12
1618  01d4 270a          	jreq	L566
1619  01d6 a010          	sub	a,#16
1620  01d8 260a          	jrne	L137
1621                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1621                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1623  01da 721550c5      	bres	20677,#2
1624                     ; 485       break;
1626  01de 2004          	jra	L137
1627  01e0               L566:
1628                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1628                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1630  01e0 721550c8      	bres	20680,#2
1631                     ; 488       break;
1632  01e4               L137:
1633                     ; 493 }
1636  01e4 85            	popw	x
1637  01e5 81            	ret	
1638                     ; 489     default:
1638                     ; 490       break;
1674                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1674                     ; 501 {
1675                     	switch	.text
1676  01e6               _CLK_SYSCLKConfig:
1678  01e6 88            	push	a
1679       00000000      OFST:	set	0
1682                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1684                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1686  01e7 a580          	bcp	a,#128
1687  01e9 260e          	jrne	L557
1688                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1690  01eb c650c6        	ld	a,20678
1691  01ee a4e7          	and	a,#231
1692  01f0 c750c6        	ld	20678,a
1693                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1695  01f3 7b01          	ld	a,(OFST+1,sp)
1696  01f5 a418          	and	a,#24
1698  01f7 200c          	jra	L757
1699  01f9               L557:
1700                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1702  01f9 c650c6        	ld	a,20678
1703  01fc a4f8          	and	a,#248
1704  01fe c750c6        	ld	20678,a
1705                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1707  0201 7b01          	ld	a,(OFST+1,sp)
1708  0203 a407          	and	a,#7
1709  0205               L757:
1710  0205 ca50c6        	or	a,20678
1711  0208 c750c6        	ld	20678,a
1712                     ; 515 }
1715  020b 84            	pop	a
1716  020c 81            	ret	
1772                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1772                     ; 524 {
1773                     	switch	.text
1774  020d               _CLK_SWIMConfig:
1778                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1780                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1782  020d 4d            	tnz	a
1783  020e 2705          	jreq	L7001
1784                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1786  0210 721050cd      	bset	20685,#0
1789  0214 81            	ret	
1790  0215               L7001:
1791                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1793  0215 721150cd      	bres	20685,#0
1794                     ; 538 }
1797  0219 81            	ret	
1821                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1821                     ; 548 {
1822                     	switch	.text
1823  021a               _CLK_ClockSecuritySystemEnable:
1827                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1829  021a 721050c8      	bset	20680,#0
1830                     ; 551 }
1833  021e 81            	ret	
1858                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1858                     ; 560 {
1859                     	switch	.text
1860  021f               _CLK_GetSYSCLKSource:
1864                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1866  021f c650c3        	ld	a,20675
1869  0222 81            	ret	
1926                     ; 569 uint32_t CLK_GetClockFreq(void)
1926                     ; 570 {
1927                     	switch	.text
1928  0223               _CLK_GetClockFreq:
1930  0223 5209          	subw	sp,#9
1931       00000009      OFST:	set	9
1934                     ; 571   uint32_t clockfrequency = 0;
1936                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1938                     ; 573   uint8_t tmp = 0, presc = 0;
1942                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1944  0225 c650c3        	ld	a,20675
1945  0228 6b09          	ld	(OFST+0,sp),a
1947                     ; 578   if (clocksource == CLK_SOURCE_HSI)
1949  022a a1e1          	cp	a,#225
1950  022c 2634          	jrne	L7501
1951                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1953  022e c650c6        	ld	a,20678
1954  0231 a418          	and	a,#24
1955  0233 44            	srl	a
1956  0234 44            	srl	a
1957  0235 44            	srl	a
1959                     ; 581     tmp = (uint8_t)(tmp >> 3);
1962                     ; 582     presc = HSIDivFactor[tmp];
1964  0236 5f            	clrw	x
1965  0237 97            	ld	xl,a
1966  0238 d60000        	ld	a,(_HSIDivFactor,x)
1967  023b 6b09          	ld	(OFST+0,sp),a
1969                     ; 583     clockfrequency = HSI_VALUE / presc;
1971  023d b703          	ld	c_lreg+3,a
1972  023f 3f02          	clr	c_lreg+2
1973  0241 3f01          	clr	c_lreg+1
1974  0243 3f00          	clr	c_lreg
1975  0245 96            	ldw	x,sp
1976  0246 5c            	incw	x
1977  0247 cd0000        	call	c_rtol
1980  024a ae2400        	ldw	x,#9216
1981  024d bf02          	ldw	c_lreg+2,x
1982  024f ae00f4        	ldw	x,#244
1983  0252 bf00          	ldw	c_lreg,x
1984  0254 96            	ldw	x,sp
1985  0255 5c            	incw	x
1986  0256 cd0000        	call	c_ludv
1988  0259 96            	ldw	x,sp
1989  025a 1c0005        	addw	x,#OFST-4
1990  025d cd0000        	call	c_rtol
1994  0260 2018          	jra	L1601
1995  0262               L7501:
1996                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
1998  0262 a1d2          	cp	a,#210
1999  0264 260a          	jrne	L3601
2000                     ; 587     clockfrequency = LSI_VALUE;
2002  0266 aef400        	ldw	x,#62464
2003  0269 1f07          	ldw	(OFST-2,sp),x
2004  026b ae0001        	ldw	x,#1
2006  026e 2008          	jp	LC006
2007  0270               L3601:
2008                     ; 591     clockfrequency = HSE_VALUE;
2010  0270 ae2400        	ldw	x,#9216
2011  0273 1f07          	ldw	(OFST-2,sp),x
2012  0275 ae00f4        	ldw	x,#244
2013  0278               LC006:
2014  0278 1f05          	ldw	(OFST-4,sp),x
2016  027a               L1601:
2017                     ; 594   return((uint32_t)clockfrequency);
2019  027a 96            	ldw	x,sp
2020  027b 1c0005        	addw	x,#OFST-4
2021  027e cd0000        	call	c_ltor
2025  0281 5b09          	addw	sp,#9
2026  0283 81            	ret	
2125                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2125                     ; 605 {
2126                     	switch	.text
2127  0284               _CLK_AdjustHSICalibrationValue:
2129  0284 88            	push	a
2130       00000000      OFST:	set	0
2133                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2135                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2137  0285 c650cc        	ld	a,20684
2138  0288 a4f8          	and	a,#248
2139  028a 1a01          	or	a,(OFST+1,sp)
2140  028c c750cc        	ld	20684,a
2141                     ; 611 }
2144  028f 84            	pop	a
2145  0290 81            	ret	
2169                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2169                     ; 623 {
2170                     	switch	.text
2171  0291               _CLK_SYSCLKEmergencyClear:
2175                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2177  0291 721150c5      	bres	20677,#0
2178                     ; 625 }
2181  0295 81            	ret	
2330                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2330                     ; 635 {
2331                     	switch	.text
2332  0296               _CLK_GetFlagStatus:
2334  0296 89            	pushw	x
2335  0297 5203          	subw	sp,#3
2336       00000003      OFST:	set	3
2339                     ; 636   uint16_t statusreg = 0;
2341                     ; 637   uint8_t tmpreg = 0;
2343                     ; 638   FlagStatus bitstatus = RESET;
2345                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2347                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2349  0299 01            	rrwa	x,a
2350  029a 4f            	clr	a
2351  029b 02            	rlwa	x,a
2352  029c 1f01          	ldw	(OFST-2,sp),x
2354                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2356  029e a30100        	cpw	x,#256
2357  02a1 2605          	jrne	L5221
2358                     ; 649     tmpreg = CLK->ICKR;
2360  02a3 c650c0        	ld	a,20672
2362  02a6 2021          	jra	L7221
2363  02a8               L5221:
2364                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2366  02a8 a30200        	cpw	x,#512
2367  02ab 2605          	jrne	L1321
2368                     ; 653     tmpreg = CLK->ECKR;
2370  02ad c650c1        	ld	a,20673
2372  02b0 2017          	jra	L7221
2373  02b2               L1321:
2374                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2376  02b2 a30300        	cpw	x,#768
2377  02b5 2605          	jrne	L5321
2378                     ; 657     tmpreg = CLK->SWCR;
2380  02b7 c650c5        	ld	a,20677
2382  02ba 200d          	jra	L7221
2383  02bc               L5321:
2384                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2386  02bc a30400        	cpw	x,#1024
2387  02bf 2605          	jrne	L1421
2388                     ; 661     tmpreg = CLK->CSSR;
2390  02c1 c650c8        	ld	a,20680
2392  02c4 2003          	jra	L7221
2393  02c6               L1421:
2394                     ; 665     tmpreg = CLK->CCOR;
2396  02c6 c650c9        	ld	a,20681
2397  02c9               L7221:
2398  02c9 6b03          	ld	(OFST+0,sp),a
2400                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2402  02cb 7b05          	ld	a,(OFST+2,sp)
2403  02cd 1503          	bcp	a,(OFST+0,sp)
2404  02cf 2704          	jreq	L5421
2405                     ; 670     bitstatus = SET;
2407  02d1 a601          	ld	a,#1
2410  02d3 2001          	jra	L7421
2411  02d5               L5421:
2412                     ; 674     bitstatus = RESET;
2414  02d5 4f            	clr	a
2416  02d6               L7421:
2417                     ; 678   return((FlagStatus)bitstatus);
2421  02d6 5b05          	addw	sp,#5
2422  02d8 81            	ret	
2468                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2468                     ; 688 {
2469                     	switch	.text
2470  02d9               _CLK_GetITStatus:
2472  02d9 88            	push	a
2473  02da 88            	push	a
2474       00000001      OFST:	set	1
2477                     ; 689   ITStatus bitstatus = RESET;
2479                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2481                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2483  02db a11c          	cp	a,#28
2484  02dd 2609          	jrne	L3721
2485                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2487  02df c450c5        	and	a,20677
2488  02e2 a10c          	cp	a,#12
2489  02e4 260f          	jrne	L3031
2490                     ; 699       bitstatus = SET;
2492  02e6 2009          	jp	LC008
2493                     ; 703       bitstatus = RESET;
2494  02e8               L3721:
2495                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2497  02e8 c650c8        	ld	a,20680
2498  02eb 1402          	and	a,(OFST+1,sp)
2499  02ed a10c          	cp	a,#12
2500  02ef 2604          	jrne	L3031
2501                     ; 711       bitstatus = SET;
2503  02f1               LC008:
2505  02f1 a601          	ld	a,#1
2508  02f3 2001          	jra	L1031
2509  02f5               L3031:
2510                     ; 715       bitstatus = RESET;
2513  02f5 4f            	clr	a
2515  02f6               L1031:
2516                     ; 720   return bitstatus;
2520  02f6 85            	popw	x
2521  02f7 81            	ret	
2557                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2557                     ; 730 {
2558                     	switch	.text
2559  02f8               _CLK_ClearITPendingBit:
2563                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2565                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2567  02f8 a10c          	cp	a,#12
2568  02fa 2605          	jrne	L5231
2569                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2571  02fc 721750c8      	bres	20680,#3
2574  0300 81            	ret	
2575  0301               L5231:
2576                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2578  0301 721750c5      	bres	20677,#3
2579                     ; 745 }
2582  0305 81            	ret	
2617                     	xdef	_CLKPrescTable
2618                     	xdef	_HSIDivFactor
2619                     	xdef	_CLK_ClearITPendingBit
2620                     	xdef	_CLK_GetITStatus
2621                     	xdef	_CLK_GetFlagStatus
2622                     	xdef	_CLK_GetSYSCLKSource
2623                     	xdef	_CLK_GetClockFreq
2624                     	xdef	_CLK_AdjustHSICalibrationValue
2625                     	xdef	_CLK_SYSCLKEmergencyClear
2626                     	xdef	_CLK_ClockSecuritySystemEnable
2627                     	xdef	_CLK_SWIMConfig
2628                     	xdef	_CLK_SYSCLKConfig
2629                     	xdef	_CLK_ITConfig
2630                     	xdef	_CLK_CCOConfig
2631                     	xdef	_CLK_HSIPrescalerConfig
2632                     	xdef	_CLK_ClockSwitchConfig
2633                     	xdef	_CLK_PeripheralClockConfig
2634                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2635                     	xdef	_CLK_FastHaltWakeUpCmd
2636                     	xdef	_CLK_ClockSwitchCmd
2637                     	xdef	_CLK_CCOCmd
2638                     	xdef	_CLK_LSICmd
2639                     	xdef	_CLK_HSICmd
2640                     	xdef	_CLK_HSECmd
2641                     	xdef	_CLK_DeInit
2642                     	xref.b	c_lreg
2643                     	xref.b	c_x
2662                     	xref	c_ltor
2663                     	xref	c_ludv
2664                     	xref	c_rtol
2665                     	end
