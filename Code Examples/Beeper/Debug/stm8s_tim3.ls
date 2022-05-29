   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  43                     ; 51 void TIM3_DeInit(void)
  43                     ; 52 {
  45                     	switch	.text
  46  0000               _TIM3_DeInit:
  50                     ; 53   TIM3->CR1 = (uint8_t)TIM3_CR1_RESET_VALUE;
  52  0000 725f5320      	clr	21280
  53                     ; 54   TIM3->IER = (uint8_t)TIM3_IER_RESET_VALUE;
  55  0004 725f5321      	clr	21281
  56                     ; 55   TIM3->SR2 = (uint8_t)TIM3_SR2_RESET_VALUE;
  58  0008 725f5323      	clr	21283
  59                     ; 58   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  61  000c 725f5327      	clr	21287
  62                     ; 61   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  64  0010 725f5327      	clr	21287
  65                     ; 62   TIM3->CCMR1 = (uint8_t)TIM3_CCMR1_RESET_VALUE;
  67  0014 725f5325      	clr	21285
  68                     ; 63   TIM3->CCMR2 = (uint8_t)TIM3_CCMR2_RESET_VALUE;
  70  0018 725f5326      	clr	21286
  71                     ; 64   TIM3->CNTRH = (uint8_t)TIM3_CNTRH_RESET_VALUE;
  73  001c 725f5328      	clr	21288
  74                     ; 65   TIM3->CNTRL = (uint8_t)TIM3_CNTRL_RESET_VALUE;
  76  0020 725f5329      	clr	21289
  77                     ; 66   TIM3->PSCR = (uint8_t)TIM3_PSCR_RESET_VALUE;
  79  0024 725f532a      	clr	21290
  80                     ; 67   TIM3->ARRH  = (uint8_t)TIM3_ARRH_RESET_VALUE;
  82  0028 35ff532b      	mov	21291,#255
  83                     ; 68   TIM3->ARRL  = (uint8_t)TIM3_ARRL_RESET_VALUE;
  85  002c 35ff532c      	mov	21292,#255
  86                     ; 69   TIM3->CCR1H = (uint8_t)TIM3_CCR1H_RESET_VALUE;
  88  0030 725f532d      	clr	21293
  89                     ; 70   TIM3->CCR1L = (uint8_t)TIM3_CCR1L_RESET_VALUE;
  91  0034 725f532e      	clr	21294
  92                     ; 71   TIM3->CCR2H = (uint8_t)TIM3_CCR2H_RESET_VALUE;
  94  0038 725f532f      	clr	21295
  95                     ; 72   TIM3->CCR2L = (uint8_t)TIM3_CCR2L_RESET_VALUE;
  97  003c 725f5330      	clr	21296
  98                     ; 73   TIM3->SR1 = (uint8_t)TIM3_SR1_RESET_VALUE;
 100  0040 725f5322      	clr	21282
 101                     ; 74 }
 104  0044 81            	ret
 272                     ; 82 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
 272                     ; 83                         uint16_t TIM3_Period)
 272                     ; 84 {
 273                     	switch	.text
 274  0045               _TIM3_TimeBaseInit:
 276  0045 88            	push	a
 277       00000000      OFST:	set	0
 280                     ; 86   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 282  0046 c7532a        	ld	21290,a
 283                     ; 88   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8);
 285  0049 7b04          	ld	a,(OFST+4,sp)
 286  004b c7532b        	ld	21291,a
 287                     ; 89   TIM3->ARRL = (uint8_t)(TIM3_Period);
 289  004e 7b05          	ld	a,(OFST+5,sp)
 290  0050 c7532c        	ld	21292,a
 291                     ; 90 }
 294  0053 84            	pop	a
 295  0054 81            	ret
 452                     ; 100 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 452                     ; 101                   TIM3_OutputState_TypeDef TIM3_OutputState,
 452                     ; 102                   uint16_t TIM3_Pulse,
 452                     ; 103                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 452                     ; 104 {
 453                     	switch	.text
 454  0055               _TIM3_OC1Init:
 456  0055 89            	pushw	x
 457  0056 88            	push	a
 458       00000001      OFST:	set	1
 461                     ; 106   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 463                     ; 107   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 465                     ; 108   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 467                     ; 111   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
 469  0057 c65327        	ld	a,21287
 470  005a a4fc          	and	a,#252
 471  005c c75327        	ld	21287,a
 472                     ; 113   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
 474  005f 7b08          	ld	a,(OFST+7,sp)
 475  0061 a402          	and	a,#2
 476  0063 6b01          	ld	(OFST+0,sp),a
 478  0065 9f            	ld	a,xl
 479  0066 a401          	and	a,#1
 480  0068 1a01          	or	a,(OFST+0,sp)
 481  006a ca5327        	or	a,21287
 482  006d c75327        	ld	21287,a
 483                     ; 116   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 485  0070 c65325        	ld	a,21285
 486  0073 a48f          	and	a,#143
 487  0075 1a02          	or	a,(OFST+1,sp)
 488  0077 c75325        	ld	21285,a
 489                     ; 119   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 491  007a 7b06          	ld	a,(OFST+5,sp)
 492  007c c7532d        	ld	21293,a
 493                     ; 120   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 495  007f 7b07          	ld	a,(OFST+6,sp)
 496  0081 c7532e        	ld	21294,a
 497                     ; 121 }
 500  0084 5b03          	addw	sp,#3
 501  0086 81            	ret
 565                     ; 131 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 565                     ; 132                   TIM3_OutputState_TypeDef TIM3_OutputState,
 565                     ; 133                   uint16_t TIM3_Pulse,
 565                     ; 134                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 565                     ; 135 {
 566                     	switch	.text
 567  0087               _TIM3_OC2Init:
 569  0087 89            	pushw	x
 570  0088 88            	push	a
 571       00000001      OFST:	set	1
 574                     ; 137   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 576                     ; 138   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 578                     ; 139   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 580                     ; 143   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
 582  0089 c65327        	ld	a,21287
 583  008c a4cf          	and	a,#207
 584  008e c75327        	ld	21287,a
 585                     ; 145   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
 587  0091 7b08          	ld	a,(OFST+7,sp)
 588  0093 a420          	and	a,#32
 589  0095 6b01          	ld	(OFST+0,sp),a
 591  0097 9f            	ld	a,xl
 592  0098 a410          	and	a,#16
 593  009a 1a01          	or	a,(OFST+0,sp)
 594  009c ca5327        	or	a,21287
 595  009f c75327        	ld	21287,a
 596                     ; 149   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 598  00a2 c65326        	ld	a,21286
 599  00a5 a48f          	and	a,#143
 600  00a7 1a02          	or	a,(OFST+1,sp)
 601  00a9 c75326        	ld	21286,a
 602                     ; 153   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 604  00ac 7b06          	ld	a,(OFST+5,sp)
 605  00ae c7532f        	ld	21295,a
 606                     ; 154   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 608  00b1 7b07          	ld	a,(OFST+6,sp)
 609  00b3 c75330        	ld	21296,a
 610                     ; 155 }
 613  00b6 5b03          	addw	sp,#3
 614  00b8 81            	ret
 798                     ; 166 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 798                     ; 167                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 798                     ; 168                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 798                     ; 169                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 798                     ; 170                  uint8_t TIM3_ICFilter)
 798                     ; 171 {
 799                     	switch	.text
 800  00b9               _TIM3_ICInit:
 802  00b9 89            	pushw	x
 803       00000000      OFST:	set	0
 806                     ; 173   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
 808                     ; 174   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 810                     ; 175   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 812                     ; 176   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 814                     ; 177   assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
 816                     ; 179   if (TIM3_Channel != TIM3_CHANNEL_2)
 818  00ba 9e            	ld	a,xh
 819  00bb a101          	cp	a,#1
 820  00bd 2714          	jreq	L343
 821                     ; 182     TI1_Config((uint8_t)TIM3_ICPolarity,
 821                     ; 183                (uint8_t)TIM3_ICSelection,
 821                     ; 184                (uint8_t)TIM3_ICFilter);
 823  00bf 7b07          	ld	a,(OFST+7,sp)
 824  00c1 88            	push	a
 825  00c2 7b06          	ld	a,(OFST+6,sp)
 826  00c4 97            	ld	xl,a
 827  00c5 7b03          	ld	a,(OFST+3,sp)
 828  00c7 95            	ld	xh,a
 829  00c8 cd0360        	call	L3_TI1_Config
 831  00cb 84            	pop	a
 832                     ; 187     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
 834  00cc 7b06          	ld	a,(OFST+6,sp)
 835  00ce cd0285        	call	_TIM3_SetIC1Prescaler
 838  00d1 2012          	jra	L543
 839  00d3               L343:
 840                     ; 192     TI2_Config((uint8_t)TIM3_ICPolarity,
 840                     ; 193                (uint8_t)TIM3_ICSelection,
 840                     ; 194                (uint8_t)TIM3_ICFilter);
 842  00d3 7b07          	ld	a,(OFST+7,sp)
 843  00d5 88            	push	a
 844  00d6 7b06          	ld	a,(OFST+6,sp)
 845  00d8 97            	ld	xl,a
 846  00d9 7b03          	ld	a,(OFST+3,sp)
 847  00db 95            	ld	xh,a
 848  00dc cd0390        	call	L5_TI2_Config
 850  00df 84            	pop	a
 851                     ; 197     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
 853  00e0 7b06          	ld	a,(OFST+6,sp)
 854  00e2 cd0292        	call	_TIM3_SetIC2Prescaler
 856  00e5               L543:
 857                     ; 199 }
 860  00e5 85            	popw	x
 861  00e6 81            	ret
 957                     ; 210 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
 957                     ; 211                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 957                     ; 212                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
 957                     ; 213                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 957                     ; 214                      uint8_t TIM3_ICFilter)
 957                     ; 215 {
 958                     	switch	.text
 959  00e7               _TIM3_PWMIConfig:
 961  00e7 89            	pushw	x
 962  00e8 89            	pushw	x
 963       00000002      OFST:	set	2
 966                     ; 216   uint8_t icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 968                     ; 217   uint8_t icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
 970                     ; 220   assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
 972                     ; 221   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 974                     ; 222   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 976                     ; 223   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 978                     ; 226   if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
 980  00e9 9f            	ld	a,xl
 981  00ea a144          	cp	a,#68
 982  00ec 2706          	jreq	L514
 983                     ; 228     icpolarity = (uint8_t)TIM3_ICPOLARITY_FALLING;
 985  00ee a644          	ld	a,#68
 986  00f0 6b01          	ld	(OFST-1,sp),a
 989  00f2 2002          	jra	L714
 990  00f4               L514:
 991                     ; 232     icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 993  00f4 0f01          	clr	(OFST-1,sp)
 995  00f6               L714:
 996                     ; 236   if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
 998  00f6 7b07          	ld	a,(OFST+5,sp)
 999  00f8 a101          	cp	a,#1
1000  00fa 2606          	jrne	L124
1001                     ; 238     icselection = (uint8_t)TIM3_ICSELECTION_INDIRECTTI;
1003  00fc a602          	ld	a,#2
1004  00fe 6b02          	ld	(OFST+0,sp),a
1007  0100 2004          	jra	L324
1008  0102               L124:
1009                     ; 242     icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
1011  0102 a601          	ld	a,#1
1012  0104 6b02          	ld	(OFST+0,sp),a
1014  0106               L324:
1015                     ; 245   if (TIM3_Channel != TIM3_CHANNEL_2)
1017  0106 7b03          	ld	a,(OFST+1,sp)
1018  0108 a101          	cp	a,#1
1019  010a 2726          	jreq	L524
1020                     ; 248     TI1_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1020                     ; 249                (uint8_t)TIM3_ICFilter);
1022  010c 7b09          	ld	a,(OFST+7,sp)
1023  010e 88            	push	a
1024  010f 7b08          	ld	a,(OFST+6,sp)
1025  0111 97            	ld	xl,a
1026  0112 7b05          	ld	a,(OFST+3,sp)
1027  0114 95            	ld	xh,a
1028  0115 cd0360        	call	L3_TI1_Config
1030  0118 84            	pop	a
1031                     ; 252     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1033  0119 7b08          	ld	a,(OFST+6,sp)
1034  011b cd0285        	call	_TIM3_SetIC1Prescaler
1036                     ; 255     TI2_Config(icpolarity, icselection, TIM3_ICFilter);
1038  011e 7b09          	ld	a,(OFST+7,sp)
1039  0120 88            	push	a
1040  0121 7b03          	ld	a,(OFST+1,sp)
1041  0123 97            	ld	xl,a
1042  0124 7b02          	ld	a,(OFST+0,sp)
1043  0126 95            	ld	xh,a
1044  0127 cd0390        	call	L5_TI2_Config
1046  012a 84            	pop	a
1047                     ; 258     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1049  012b 7b08          	ld	a,(OFST+6,sp)
1050  012d cd0292        	call	_TIM3_SetIC2Prescaler
1053  0130 2024          	jra	L724
1054  0132               L524:
1055                     ; 263     TI2_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1055                     ; 264                (uint8_t)TIM3_ICFilter);
1057  0132 7b09          	ld	a,(OFST+7,sp)
1058  0134 88            	push	a
1059  0135 7b08          	ld	a,(OFST+6,sp)
1060  0137 97            	ld	xl,a
1061  0138 7b05          	ld	a,(OFST+3,sp)
1062  013a 95            	ld	xh,a
1063  013b cd0390        	call	L5_TI2_Config
1065  013e 84            	pop	a
1066                     ; 267     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1068  013f 7b08          	ld	a,(OFST+6,sp)
1069  0141 cd0292        	call	_TIM3_SetIC2Prescaler
1071                     ; 270     TI1_Config(icpolarity, icselection, TIM3_ICFilter);
1073  0144 7b09          	ld	a,(OFST+7,sp)
1074  0146 88            	push	a
1075  0147 7b03          	ld	a,(OFST+1,sp)
1076  0149 97            	ld	xl,a
1077  014a 7b02          	ld	a,(OFST+0,sp)
1078  014c 95            	ld	xh,a
1079  014d cd0360        	call	L3_TI1_Config
1081  0150 84            	pop	a
1082                     ; 273     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1084  0151 7b08          	ld	a,(OFST+6,sp)
1085  0153 cd0285        	call	_TIM3_SetIC1Prescaler
1087  0156               L724:
1088                     ; 275 }
1091  0156 5b04          	addw	sp,#4
1092  0158 81            	ret
1147                     ; 283 void TIM3_Cmd(FunctionalState NewState)
1147                     ; 284 {
1148                     	switch	.text
1149  0159               _TIM3_Cmd:
1153                     ; 286   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1155                     ; 289   if (NewState != DISABLE)
1157  0159 4d            	tnz	a
1158  015a 2706          	jreq	L754
1159                     ; 291     TIM3->CR1 |= (uint8_t)TIM3_CR1_CEN;
1161  015c 72105320      	bset	21280,#0
1163  0160 2004          	jra	L164
1164  0162               L754:
1165                     ; 295     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_CEN);
1167  0162 72115320      	bres	21280,#0
1168  0166               L164:
1169                     ; 297 }
1172  0166 81            	ret
1244                     ; 311 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1244                     ; 312 {
1245                     	switch	.text
1246  0167               _TIM3_ITConfig:
1248  0167 89            	pushw	x
1249       00000000      OFST:	set	0
1252                     ; 314   assert_param(IS_TIM3_IT_OK(TIM3_IT));
1254                     ; 315   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1256                     ; 317   if (NewState != DISABLE)
1258  0168 9f            	ld	a,xl
1259  0169 4d            	tnz	a
1260  016a 2709          	jreq	L715
1261                     ; 320     TIM3->IER |= (uint8_t)TIM3_IT;
1263  016c 9e            	ld	a,xh
1264  016d ca5321        	or	a,21281
1265  0170 c75321        	ld	21281,a
1267  0173 2009          	jra	L125
1268  0175               L715:
1269                     ; 325     TIM3->IER &= (uint8_t)(~TIM3_IT);
1271  0175 7b01          	ld	a,(OFST+1,sp)
1272  0177 43            	cpl	a
1273  0178 c45321        	and	a,21281
1274  017b c75321        	ld	21281,a
1275  017e               L125:
1276                     ; 327 }
1279  017e 85            	popw	x
1280  017f 81            	ret
1316                     ; 335 void TIM3_UpdateDisableConfig(FunctionalState NewState)
1316                     ; 336 {
1317                     	switch	.text
1318  0180               _TIM3_UpdateDisableConfig:
1322                     ; 338   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1324                     ; 341   if (NewState != DISABLE)
1326  0180 4d            	tnz	a
1327  0181 2706          	jreq	L145
1328                     ; 343     TIM3->CR1 |= TIM3_CR1_UDIS;
1330  0183 72125320      	bset	21280,#1
1332  0187 2004          	jra	L345
1333  0189               L145:
1334                     ; 347     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_UDIS);
1336  0189 72135320      	bres	21280,#1
1337  018d               L345:
1338                     ; 349 }
1341  018d 81            	ret
1399                     ; 359 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
1399                     ; 360 {
1400                     	switch	.text
1401  018e               _TIM3_UpdateRequestConfig:
1405                     ; 362   assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
1407                     ; 365   if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
1409  018e 4d            	tnz	a
1410  018f 2706          	jreq	L375
1411                     ; 367     TIM3->CR1 |= TIM3_CR1_URS;
1413  0191 72145320      	bset	21280,#2
1415  0195 2004          	jra	L575
1416  0197               L375:
1417                     ; 371     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_URS);
1419  0197 72155320      	bres	21280,#2
1420  019b               L575:
1421                     ; 373 }
1424  019b 81            	ret
1481                     ; 383 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1481                     ; 384 {
1482                     	switch	.text
1483  019c               _TIM3_SelectOnePulseMode:
1487                     ; 386   assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
1489                     ; 389   if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
1491  019c 4d            	tnz	a
1492  019d 2706          	jreq	L526
1493                     ; 391     TIM3->CR1 |= TIM3_CR1_OPM;
1495  019f 72165320      	bset	21280,#3
1497  01a3 2004          	jra	L726
1498  01a5               L526:
1499                     ; 395     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_OPM);
1501  01a5 72175320      	bres	21280,#3
1502  01a9               L726:
1503                     ; 397 }
1506  01a9 81            	ret
1574                     ; 427 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
1574                     ; 428                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
1574                     ; 429 {
1575                     	switch	.text
1576  01aa               _TIM3_PrescalerConfig:
1580                     ; 431   assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
1582                     ; 432   assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
1584                     ; 435   TIM3->PSCR = (uint8_t)Prescaler;
1586  01aa 9e            	ld	a,xh
1587  01ab c7532a        	ld	21290,a
1588                     ; 438   TIM3->EGR = (uint8_t)TIM3_PSCReloadMode;
1590  01ae 9f            	ld	a,xl
1591  01af c75324        	ld	21284,a
1592                     ; 439 }
1595  01b2 81            	ret
1653                     ; 450 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1653                     ; 451 {
1654                     	switch	.text
1655  01b3               _TIM3_ForcedOC1Config:
1657  01b3 88            	push	a
1658       00000000      OFST:	set	0
1661                     ; 453   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1663                     ; 456   TIM3->CCMR1 =  (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM))  | (uint8_t)TIM3_ForcedAction);
1665  01b4 c65325        	ld	a,21285
1666  01b7 a48f          	and	a,#143
1667  01b9 1a01          	or	a,(OFST+1,sp)
1668  01bb c75325        	ld	21285,a
1669                     ; 457 }
1672  01be 84            	pop	a
1673  01bf 81            	ret
1709                     ; 468 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1709                     ; 469 {
1710                     	switch	.text
1711  01c0               _TIM3_ForcedOC2Config:
1713  01c0 88            	push	a
1714       00000000      OFST:	set	0
1717                     ; 471   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1719                     ; 474   TIM3->CCMR2 =  (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_ForcedAction);
1721  01c1 c65326        	ld	a,21286
1722  01c4 a48f          	and	a,#143
1723  01c6 1a01          	or	a,(OFST+1,sp)
1724  01c8 c75326        	ld	21286,a
1725                     ; 475 }
1728  01cb 84            	pop	a
1729  01cc 81            	ret
1765                     ; 483 void TIM3_ARRPreloadConfig(FunctionalState NewState)
1765                     ; 484 {
1766                     	switch	.text
1767  01cd               _TIM3_ARRPreloadConfig:
1771                     ; 486   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1773                     ; 489   if (NewState != DISABLE)
1775  01cd 4d            	tnz	a
1776  01ce 2706          	jreq	L547
1777                     ; 491     TIM3->CR1 |= TIM3_CR1_ARPE;
1779  01d0 721e5320      	bset	21280,#7
1781  01d4 2004          	jra	L747
1782  01d6               L547:
1783                     ; 495     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_ARPE);
1785  01d6 721f5320      	bres	21280,#7
1786  01da               L747:
1787                     ; 497 }
1790  01da 81            	ret
1826                     ; 505 void TIM3_OC1PreloadConfig(FunctionalState NewState)
1826                     ; 506 {
1827                     	switch	.text
1828  01db               _TIM3_OC1PreloadConfig:
1832                     ; 508   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1834                     ; 511   if (NewState != DISABLE)
1836  01db 4d            	tnz	a
1837  01dc 2706          	jreq	L767
1838                     ; 513     TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
1840  01de 72165325      	bset	21285,#3
1842  01e2 2004          	jra	L177
1843  01e4               L767:
1844                     ; 517     TIM3->CCMR1 &= (uint8_t)(~TIM3_CCMR_OCxPE);
1846  01e4 72175325      	bres	21285,#3
1847  01e8               L177:
1848                     ; 519 }
1851  01e8 81            	ret
1887                     ; 527 void TIM3_OC2PreloadConfig(FunctionalState NewState)
1887                     ; 528 {
1888                     	switch	.text
1889  01e9               _TIM3_OC2PreloadConfig:
1893                     ; 530   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1895                     ; 533   if (NewState != DISABLE)
1897  01e9 4d            	tnz	a
1898  01ea 2706          	jreq	L1101
1899                     ; 535     TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
1901  01ec 72165326      	bset	21286,#3
1903  01f0 2004          	jra	L3101
1904  01f2               L1101:
1905                     ; 539     TIM3->CCMR2 &= (uint8_t)(~TIM3_CCMR_OCxPE);
1907  01f2 72175326      	bres	21286,#3
1908  01f6               L3101:
1909                     ; 541 }
1912  01f6 81            	ret
1977                     ; 552 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
1977                     ; 553 {
1978                     	switch	.text
1979  01f7               _TIM3_GenerateEvent:
1983                     ; 555   assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
1985                     ; 558   TIM3->EGR = (uint8_t)TIM3_EventSource;
1987  01f7 c75324        	ld	21284,a
1988                     ; 559 }
1991  01fa 81            	ret
2027                     ; 569 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2027                     ; 570 {
2028                     	switch	.text
2029  01fb               _TIM3_OC1PolarityConfig:
2033                     ; 572   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2035                     ; 575   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2037  01fb 4d            	tnz	a
2038  01fc 2706          	jreq	L3601
2039                     ; 577     TIM3->CCER1 |= TIM3_CCER1_CC1P;
2041  01fe 72125327      	bset	21287,#1
2043  0202 2004          	jra	L5601
2044  0204               L3601:
2045                     ; 581     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
2047  0204 72135327      	bres	21287,#1
2048  0208               L5601:
2049                     ; 583 }
2052  0208 81            	ret
2088                     ; 593 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2088                     ; 594 {
2089                     	switch	.text
2090  0209               _TIM3_OC2PolarityConfig:
2094                     ; 596   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2096                     ; 599   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2098  0209 4d            	tnz	a
2099  020a 2706          	jreq	L5011
2100                     ; 601     TIM3->CCER1 |= TIM3_CCER1_CC2P;
2102  020c 721a5327      	bset	21287,#5
2104  0210 2004          	jra	L7011
2105  0212               L5011:
2106                     ; 605     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
2108  0212 721b5327      	bres	21287,#5
2109  0216               L7011:
2110                     ; 607 }
2113  0216 81            	ret
2158                     ; 619 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
2158                     ; 620 {
2159                     	switch	.text
2160  0217               _TIM3_CCxCmd:
2162  0217 89            	pushw	x
2163       00000000      OFST:	set	0
2166                     ; 622   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2168                     ; 623   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2170                     ; 625   if (TIM3_Channel == TIM3_CHANNEL_1)
2172  0218 9e            	ld	a,xh
2173  0219 4d            	tnz	a
2174  021a 2610          	jrne	L3311
2175                     ; 628     if (NewState != DISABLE)
2177  021c 9f            	ld	a,xl
2178  021d 4d            	tnz	a
2179  021e 2706          	jreq	L5311
2180                     ; 630       TIM3->CCER1 |= TIM3_CCER1_CC1E;
2182  0220 72105327      	bset	21287,#0
2184  0224 2014          	jra	L1411
2185  0226               L5311:
2186                     ; 634       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2188  0226 72115327      	bres	21287,#0
2189  022a 200e          	jra	L1411
2190  022c               L3311:
2191                     ; 641     if (NewState != DISABLE)
2193  022c 0d02          	tnz	(OFST+2,sp)
2194  022e 2706          	jreq	L3411
2195                     ; 643       TIM3->CCER1 |= TIM3_CCER1_CC2E;
2197  0230 72185327      	bset	21287,#4
2199  0234 2004          	jra	L1411
2200  0236               L3411:
2201                     ; 647       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2203  0236 72195327      	bres	21287,#4
2204  023a               L1411:
2205                     ; 650 }
2208  023a 85            	popw	x
2209  023b 81            	ret
2254                     ; 671 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
2254                     ; 672 {
2255                     	switch	.text
2256  023c               _TIM3_SelectOCxM:
2258  023c 89            	pushw	x
2259       00000000      OFST:	set	0
2262                     ; 674   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2264                     ; 675   assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
2266                     ; 677   if (TIM3_Channel == TIM3_CHANNEL_1)
2268  023d 9e            	ld	a,xh
2269  023e 4d            	tnz	a
2270  023f 2610          	jrne	L1711
2271                     ; 680     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2273  0241 72115327      	bres	21287,#0
2274                     ; 683     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2276  0245 c65325        	ld	a,21285
2277  0248 a48f          	and	a,#143
2278  024a 1a02          	or	a,(OFST+2,sp)
2279  024c c75325        	ld	21285,a
2281  024f 200e          	jra	L3711
2282  0251               L1711:
2283                     ; 688     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2285  0251 72195327      	bres	21287,#4
2286                     ; 691     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2288  0255 c65326        	ld	a,21286
2289  0258 a48f          	and	a,#143
2290  025a 1a02          	or	a,(OFST+2,sp)
2291  025c c75326        	ld	21286,a
2292  025f               L3711:
2293                     ; 693 }
2296  025f 85            	popw	x
2297  0260 81            	ret
2331                     ; 701 void TIM3_SetCounter(uint16_t Counter)
2331                     ; 702 {
2332                     	switch	.text
2333  0261               _TIM3_SetCounter:
2337                     ; 704   TIM3->CNTRH = (uint8_t)(Counter >> 8);
2339  0261 9e            	ld	a,xh
2340  0262 c75328        	ld	21288,a
2341                     ; 705   TIM3->CNTRL = (uint8_t)(Counter);
2343  0265 9f            	ld	a,xl
2344  0266 c75329        	ld	21289,a
2345                     ; 706 }
2348  0269 81            	ret
2382                     ; 714 void TIM3_SetAutoreload(uint16_t Autoreload)
2382                     ; 715 {
2383                     	switch	.text
2384  026a               _TIM3_SetAutoreload:
2388                     ; 717   TIM3->ARRH = (uint8_t)(Autoreload >> 8);
2390  026a 9e            	ld	a,xh
2391  026b c7532b        	ld	21291,a
2392                     ; 718   TIM3->ARRL = (uint8_t)(Autoreload);
2394  026e 9f            	ld	a,xl
2395  026f c7532c        	ld	21292,a
2396                     ; 719 }
2399  0272 81            	ret
2433                     ; 727 void TIM3_SetCompare1(uint16_t Compare1)
2433                     ; 728 {
2434                     	switch	.text
2435  0273               _TIM3_SetCompare1:
2439                     ; 730   TIM3->CCR1H = (uint8_t)(Compare1 >> 8);
2441  0273 9e            	ld	a,xh
2442  0274 c7532d        	ld	21293,a
2443                     ; 731   TIM3->CCR1L = (uint8_t)(Compare1);
2445  0277 9f            	ld	a,xl
2446  0278 c7532e        	ld	21294,a
2447                     ; 732 }
2450  027b 81            	ret
2484                     ; 740 void TIM3_SetCompare2(uint16_t Compare2)
2484                     ; 741 {
2485                     	switch	.text
2486  027c               _TIM3_SetCompare2:
2490                     ; 743   TIM3->CCR2H = (uint8_t)(Compare2 >> 8);
2492  027c 9e            	ld	a,xh
2493  027d c7532f        	ld	21295,a
2494                     ; 744   TIM3->CCR2L = (uint8_t)(Compare2);
2496  0280 9f            	ld	a,xl
2497  0281 c75330        	ld	21296,a
2498                     ; 745 }
2501  0284 81            	ret
2537                     ; 757 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
2537                     ; 758 {
2538                     	switch	.text
2539  0285               _TIM3_SetIC1Prescaler:
2541  0285 88            	push	a
2542       00000000      OFST:	set	0
2545                     ; 760   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
2547                     ; 763   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC1Prescaler);
2549  0286 c65325        	ld	a,21285
2550  0289 a4f3          	and	a,#243
2551  028b 1a01          	or	a,(OFST+1,sp)
2552  028d c75325        	ld	21285,a
2553                     ; 764 }
2556  0290 84            	pop	a
2557  0291 81            	ret
2593                     ; 776 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
2593                     ; 777 {
2594                     	switch	.text
2595  0292               _TIM3_SetIC2Prescaler:
2597  0292 88            	push	a
2598       00000000      OFST:	set	0
2601                     ; 779   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
2603                     ; 782   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC2Prescaler);
2605  0293 c65326        	ld	a,21286
2606  0296 a4f3          	and	a,#243
2607  0298 1a01          	or	a,(OFST+1,sp)
2608  029a c75326        	ld	21286,a
2609                     ; 783 }
2612  029d 84            	pop	a
2613  029e 81            	ret
2665                     ; 790 uint16_t TIM3_GetCapture1(void)
2665                     ; 791 {
2666                     	switch	.text
2667  029f               _TIM3_GetCapture1:
2669  029f 5204          	subw	sp,#4
2670       00000004      OFST:	set	4
2673                     ; 793   uint16_t tmpccr1 = 0;
2675                     ; 794   uint8_t tmpccr1l=0, tmpccr1h=0;
2679                     ; 796   tmpccr1h = TIM3->CCR1H;
2681  02a1 c6532d        	ld	a,21293
2682  02a4 6b02          	ld	(OFST-2,sp),a
2684                     ; 797   tmpccr1l = TIM3->CCR1L;
2686  02a6 c6532e        	ld	a,21294
2687  02a9 6b01          	ld	(OFST-3,sp),a
2689                     ; 799   tmpccr1 = (uint16_t)(tmpccr1l);
2691  02ab 7b01          	ld	a,(OFST-3,sp)
2692  02ad 5f            	clrw	x
2693  02ae 97            	ld	xl,a
2694  02af 1f03          	ldw	(OFST-1,sp),x
2696                     ; 800   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
2698  02b1 7b02          	ld	a,(OFST-2,sp)
2699  02b3 5f            	clrw	x
2700  02b4 97            	ld	xl,a
2701  02b5 4f            	clr	a
2702  02b6 02            	rlwa	x,a
2703  02b7 01            	rrwa	x,a
2704  02b8 1a04          	or	a,(OFST+0,sp)
2705  02ba 01            	rrwa	x,a
2706  02bb 1a03          	or	a,(OFST-1,sp)
2707  02bd 01            	rrwa	x,a
2708  02be 1f03          	ldw	(OFST-1,sp),x
2710                     ; 802   return (uint16_t)tmpccr1;
2712  02c0 1e03          	ldw	x,(OFST-1,sp)
2715  02c2 5b04          	addw	sp,#4
2716  02c4 81            	ret
2768                     ; 810 uint16_t TIM3_GetCapture2(void)
2768                     ; 811 {
2769                     	switch	.text
2770  02c5               _TIM3_GetCapture2:
2772  02c5 5204          	subw	sp,#4
2773       00000004      OFST:	set	4
2776                     ; 813   uint16_t tmpccr2 = 0;
2778                     ; 814   uint8_t tmpccr2l=0, tmpccr2h=0;
2782                     ; 816   tmpccr2h = TIM3->CCR2H;
2784  02c7 c6532f        	ld	a,21295
2785  02ca 6b02          	ld	(OFST-2,sp),a
2787                     ; 817   tmpccr2l = TIM3->CCR2L;
2789  02cc c65330        	ld	a,21296
2790  02cf 6b01          	ld	(OFST-3,sp),a
2792                     ; 819   tmpccr2 = (uint16_t)(tmpccr2l);
2794  02d1 7b01          	ld	a,(OFST-3,sp)
2795  02d3 5f            	clrw	x
2796  02d4 97            	ld	xl,a
2797  02d5 1f03          	ldw	(OFST-1,sp),x
2799                     ; 820   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
2801  02d7 7b02          	ld	a,(OFST-2,sp)
2802  02d9 5f            	clrw	x
2803  02da 97            	ld	xl,a
2804  02db 4f            	clr	a
2805  02dc 02            	rlwa	x,a
2806  02dd 01            	rrwa	x,a
2807  02de 1a04          	or	a,(OFST+0,sp)
2808  02e0 01            	rrwa	x,a
2809  02e1 1a03          	or	a,(OFST-1,sp)
2810  02e3 01            	rrwa	x,a
2811  02e4 1f03          	ldw	(OFST-1,sp),x
2813                     ; 822   return (uint16_t)tmpccr2;
2815  02e6 1e03          	ldw	x,(OFST-1,sp)
2818  02e8 5b04          	addw	sp,#4
2819  02ea 81            	ret
2853                     ; 830 uint16_t TIM3_GetCounter(void)
2853                     ; 831 {
2854                     	switch	.text
2855  02eb               _TIM3_GetCounter:
2857  02eb 89            	pushw	x
2858       00000002      OFST:	set	2
2861                     ; 832   uint16_t tmpcntr = 0;
2863                     ; 834   tmpcntr = ((uint16_t)TIM3->CNTRH << 8);
2865  02ec c65328        	ld	a,21288
2866  02ef 5f            	clrw	x
2867  02f0 97            	ld	xl,a
2868  02f1 4f            	clr	a
2869  02f2 02            	rlwa	x,a
2870  02f3 1f01          	ldw	(OFST-1,sp),x
2872                     ; 836   return (uint16_t)( tmpcntr| (uint16_t)(TIM3->CNTRL));
2874  02f5 c65329        	ld	a,21289
2875  02f8 5f            	clrw	x
2876  02f9 97            	ld	xl,a
2877  02fa 01            	rrwa	x,a
2878  02fb 1a02          	or	a,(OFST+0,sp)
2879  02fd 01            	rrwa	x,a
2880  02fe 1a01          	or	a,(OFST-1,sp)
2881  0300 01            	rrwa	x,a
2884  0301 5b02          	addw	sp,#2
2885  0303 81            	ret
2909                     ; 844 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
2909                     ; 845 {
2910                     	switch	.text
2911  0304               _TIM3_GetPrescaler:
2915                     ; 847   return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
2917  0304 c6532a        	ld	a,21290
2920  0307 81            	ret
3045                     ; 861 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
3045                     ; 862 {
3046                     	switch	.text
3047  0308               _TIM3_GetFlagStatus:
3049  0308 89            	pushw	x
3050  0309 89            	pushw	x
3051       00000002      OFST:	set	2
3054                     ; 863   FlagStatus bitstatus = RESET;
3056                     ; 864   uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
3060                     ; 867   assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
3062                     ; 869   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_FLAG);
3064  030a 9f            	ld	a,xl
3065  030b c45322        	and	a,21282
3066  030e 6b01          	ld	(OFST-1,sp),a
3068                     ; 870   tim3_flag_h = (uint8_t)((uint16_t)TIM3_FLAG >> 8);
3070  0310 7b03          	ld	a,(OFST+1,sp)
3071  0312 6b02          	ld	(OFST+0,sp),a
3073                     ; 872   if (((tim3_flag_l) | (uint8_t)(TIM3->SR2 & tim3_flag_h)) != (uint8_t)RESET )
3075  0314 c65323        	ld	a,21283
3076  0317 1402          	and	a,(OFST+0,sp)
3077  0319 1a01          	or	a,(OFST-1,sp)
3078  031b 2706          	jreq	L3051
3079                     ; 874     bitstatus = SET;
3081  031d a601          	ld	a,#1
3082  031f 6b02          	ld	(OFST+0,sp),a
3085  0321 2002          	jra	L5051
3086  0323               L3051:
3087                     ; 878     bitstatus = RESET;
3089  0323 0f02          	clr	(OFST+0,sp)
3091  0325               L5051:
3092                     ; 880   return (FlagStatus)bitstatus;
3094  0325 7b02          	ld	a,(OFST+0,sp)
3097  0327 5b04          	addw	sp,#4
3098  0329 81            	ret
3133                     ; 894 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3133                     ; 895 {
3134                     	switch	.text
3135  032a               _TIM3_ClearFlag:
3137  032a 89            	pushw	x
3138       00000000      OFST:	set	0
3141                     ; 897   assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
3143                     ; 900   TIM3->SR1 = (uint8_t)(~((uint8_t)(TIM3_FLAG)));
3145  032b 9f            	ld	a,xl
3146  032c 43            	cpl	a
3147  032d c75322        	ld	21282,a
3148                     ; 901   TIM3->SR2 = (uint8_t)(~((uint8_t)((uint16_t)TIM3_FLAG >> 8)));
3150  0330 7b01          	ld	a,(OFST+1,sp)
3151  0332 43            	cpl	a
3152  0333 c75323        	ld	21283,a
3153                     ; 902 }
3156  0336 85            	popw	x
3157  0337 81            	ret
3221                     ; 913 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
3221                     ; 914 {
3222                     	switch	.text
3223  0338               _TIM3_GetITStatus:
3225  0338 88            	push	a
3226  0339 89            	pushw	x
3227       00000002      OFST:	set	2
3230                     ; 915   ITStatus bitstatus = RESET;
3232                     ; 916   uint8_t TIM3_itStatus = 0, TIM3_itEnable = 0;
3236                     ; 919   assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
3238                     ; 921   TIM3_itStatus = (uint8_t)(TIM3->SR1 & TIM3_IT);
3240  033a c45322        	and	a,21282
3241  033d 6b01          	ld	(OFST-1,sp),a
3243                     ; 923   TIM3_itEnable = (uint8_t)(TIM3->IER & TIM3_IT);
3245  033f c65321        	ld	a,21281
3246  0342 1403          	and	a,(OFST+1,sp)
3247  0344 6b02          	ld	(OFST+0,sp),a
3249                     ; 925   if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET ))
3251  0346 0d01          	tnz	(OFST-1,sp)
3252  0348 270a          	jreq	L7551
3254  034a 0d02          	tnz	(OFST+0,sp)
3255  034c 2706          	jreq	L7551
3256                     ; 927     bitstatus = SET;
3258  034e a601          	ld	a,#1
3259  0350 6b02          	ld	(OFST+0,sp),a
3262  0352 2002          	jra	L1651
3263  0354               L7551:
3264                     ; 931     bitstatus = RESET;
3266  0354 0f02          	clr	(OFST+0,sp)
3268  0356               L1651:
3269                     ; 933   return (ITStatus)(bitstatus);
3271  0356 7b02          	ld	a,(OFST+0,sp)
3274  0358 5b03          	addw	sp,#3
3275  035a 81            	ret
3311                     ; 945 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
3311                     ; 946 {
3312                     	switch	.text
3313  035b               _TIM3_ClearITPendingBit:
3317                     ; 948   assert_param(IS_TIM3_IT_OK(TIM3_IT));
3319                     ; 951   TIM3->SR1 = (uint8_t)(~TIM3_IT);
3321  035b 43            	cpl	a
3322  035c c75322        	ld	21282,a
3323                     ; 952 }
3326  035f 81            	ret
3378                     ; 970 static void TI1_Config(uint8_t TIM3_ICPolarity,
3378                     ; 971                        uint8_t TIM3_ICSelection,
3378                     ; 972                        uint8_t TIM3_ICFilter)
3378                     ; 973 {
3379                     	switch	.text
3380  0360               L3_TI1_Config:
3382  0360 89            	pushw	x
3383  0361 88            	push	a
3384       00000001      OFST:	set	1
3387                     ; 975   TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
3389  0362 72115327      	bres	21287,#0
3390                     ; 978   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~( TIM3_CCMR_CCxS | TIM3_CCMR_ICxF))) | (uint8_t)(( (TIM3_ICSelection)) | ((uint8_t)( TIM3_ICFilter << 4))));
3392  0366 7b06          	ld	a,(OFST+5,sp)
3393  0368 97            	ld	xl,a
3394  0369 a610          	ld	a,#16
3395  036b 42            	mul	x,a
3396  036c 9f            	ld	a,xl
3397  036d 1a03          	or	a,(OFST+2,sp)
3398  036f 6b01          	ld	(OFST+0,sp),a
3400  0371 c65325        	ld	a,21285
3401  0374 a40c          	and	a,#12
3402  0376 1a01          	or	a,(OFST+0,sp)
3403  0378 c75325        	ld	21285,a
3404                     ; 981   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3406  037b 0d02          	tnz	(OFST+1,sp)
3407  037d 2706          	jreq	L7261
3408                     ; 983     TIM3->CCER1 |= TIM3_CCER1_CC1P;
3410  037f 72125327      	bset	21287,#1
3412  0383 2004          	jra	L1361
3413  0385               L7261:
3414                     ; 987     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
3416  0385 72135327      	bres	21287,#1
3417  0389               L1361:
3418                     ; 990   TIM3->CCER1 |= TIM3_CCER1_CC1E;
3420  0389 72105327      	bset	21287,#0
3421                     ; 991 }
3424  038d 5b03          	addw	sp,#3
3425  038f 81            	ret
3477                     ; 1009 static void TI2_Config(uint8_t TIM3_ICPolarity,
3477                     ; 1010                        uint8_t TIM3_ICSelection,
3477                     ; 1011                        uint8_t TIM3_ICFilter)
3477                     ; 1012 {
3478                     	switch	.text
3479  0390               L5_TI2_Config:
3481  0390 89            	pushw	x
3482  0391 88            	push	a
3483       00000001      OFST:	set	1
3486                     ; 1014   TIM3->CCER1 &=  (uint8_t)(~TIM3_CCER1_CC2E);
3488  0392 72195327      	bres	21287,#4
3489                     ; 1017   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~( TIM3_CCMR_CCxS |
3489                     ; 1018                                                               TIM3_CCMR_ICxF    ))) | (uint8_t)(( (TIM3_ICSelection)) | 
3489                     ; 1019                                                                                                 ((uint8_t)( TIM3_ICFilter << 4))));
3491  0396 7b06          	ld	a,(OFST+5,sp)
3492  0398 97            	ld	xl,a
3493  0399 a610          	ld	a,#16
3494  039b 42            	mul	x,a
3495  039c 9f            	ld	a,xl
3496  039d 1a03          	or	a,(OFST+2,sp)
3497  039f 6b01          	ld	(OFST+0,sp),a
3499  03a1 c65326        	ld	a,21286
3500  03a4 a40c          	and	a,#12
3501  03a6 1a01          	or	a,(OFST+0,sp)
3502  03a8 c75326        	ld	21286,a
3503                     ; 1022   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3505  03ab 0d02          	tnz	(OFST+1,sp)
3506  03ad 2706          	jreq	L1661
3507                     ; 1024     TIM3->CCER1 |= TIM3_CCER1_CC2P;
3509  03af 721a5327      	bset	21287,#5
3511  03b3 2004          	jra	L3661
3512  03b5               L1661:
3513                     ; 1028     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
3515  03b5 721b5327      	bres	21287,#5
3516  03b9               L3661:
3517                     ; 1032   TIM3->CCER1 |= TIM3_CCER1_CC2E;
3519  03b9 72185327      	bset	21287,#4
3520                     ; 1033 }
3523  03bd 5b03          	addw	sp,#3
3524  03bf 81            	ret
3537                     	xdef	_TIM3_ClearITPendingBit
3538                     	xdef	_TIM3_GetITStatus
3539                     	xdef	_TIM3_ClearFlag
3540                     	xdef	_TIM3_GetFlagStatus
3541                     	xdef	_TIM3_GetPrescaler
3542                     	xdef	_TIM3_GetCounter
3543                     	xdef	_TIM3_GetCapture2
3544                     	xdef	_TIM3_GetCapture1
3545                     	xdef	_TIM3_SetIC2Prescaler
3546                     	xdef	_TIM3_SetIC1Prescaler
3547                     	xdef	_TIM3_SetCompare2
3548                     	xdef	_TIM3_SetCompare1
3549                     	xdef	_TIM3_SetAutoreload
3550                     	xdef	_TIM3_SetCounter
3551                     	xdef	_TIM3_SelectOCxM
3552                     	xdef	_TIM3_CCxCmd
3553                     	xdef	_TIM3_OC2PolarityConfig
3554                     	xdef	_TIM3_OC1PolarityConfig
3555                     	xdef	_TIM3_GenerateEvent
3556                     	xdef	_TIM3_OC2PreloadConfig
3557                     	xdef	_TIM3_OC1PreloadConfig
3558                     	xdef	_TIM3_ARRPreloadConfig
3559                     	xdef	_TIM3_ForcedOC2Config
3560                     	xdef	_TIM3_ForcedOC1Config
3561                     	xdef	_TIM3_PrescalerConfig
3562                     	xdef	_TIM3_SelectOnePulseMode
3563                     	xdef	_TIM3_UpdateRequestConfig
3564                     	xdef	_TIM3_UpdateDisableConfig
3565                     	xdef	_TIM3_ITConfig
3566                     	xdef	_TIM3_Cmd
3567                     	xdef	_TIM3_PWMIConfig
3568                     	xdef	_TIM3_ICInit
3569                     	xdef	_TIM3_OC2Init
3570                     	xdef	_TIM3_OC1Init
3571                     	xdef	_TIM3_TimeBaseInit
3572                     	xdef	_TIM3_DeInit
3591                     	end
