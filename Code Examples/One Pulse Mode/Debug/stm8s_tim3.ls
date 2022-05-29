   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  42                     ; 51 void TIM3_DeInit(void)
  42                     ; 52 {
  44                     	switch	.text
  45  0000               _TIM3_DeInit:
  49                     ; 53   TIM3->CR1 = (uint8_t)TIM3_CR1_RESET_VALUE;
  51  0000 725f5320      	clr	21280
  52                     ; 54   TIM3->IER = (uint8_t)TIM3_IER_RESET_VALUE;
  54  0004 725f5321      	clr	21281
  55                     ; 55   TIM3->SR2 = (uint8_t)TIM3_SR2_RESET_VALUE;
  57  0008 725f5323      	clr	21283
  58                     ; 58   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  60  000c 725f5327      	clr	21287
  61                     ; 61   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  63  0010 725f5327      	clr	21287
  64                     ; 62   TIM3->CCMR1 = (uint8_t)TIM3_CCMR1_RESET_VALUE;
  66  0014 725f5325      	clr	21285
  67                     ; 63   TIM3->CCMR2 = (uint8_t)TIM3_CCMR2_RESET_VALUE;
  69  0018 725f5326      	clr	21286
  70                     ; 64   TIM3->CNTRH = (uint8_t)TIM3_CNTRH_RESET_VALUE;
  72  001c 725f5328      	clr	21288
  73                     ; 65   TIM3->CNTRL = (uint8_t)TIM3_CNTRL_RESET_VALUE;
  75  0020 725f5329      	clr	21289
  76                     ; 66   TIM3->PSCR = (uint8_t)TIM3_PSCR_RESET_VALUE;
  78  0024 725f532a      	clr	21290
  79                     ; 67   TIM3->ARRH  = (uint8_t)TIM3_ARRH_RESET_VALUE;
  81  0028 35ff532b      	mov	21291,#255
  82                     ; 68   TIM3->ARRL  = (uint8_t)TIM3_ARRL_RESET_VALUE;
  84  002c 35ff532c      	mov	21292,#255
  85                     ; 69   TIM3->CCR1H = (uint8_t)TIM3_CCR1H_RESET_VALUE;
  87  0030 725f532d      	clr	21293
  88                     ; 70   TIM3->CCR1L = (uint8_t)TIM3_CCR1L_RESET_VALUE;
  90  0034 725f532e      	clr	21294
  91                     ; 71   TIM3->CCR2H = (uint8_t)TIM3_CCR2H_RESET_VALUE;
  93  0038 725f532f      	clr	21295
  94                     ; 72   TIM3->CCR2L = (uint8_t)TIM3_CCR2L_RESET_VALUE;
  96  003c 725f5330      	clr	21296
  97                     ; 73   TIM3->SR1 = (uint8_t)TIM3_SR1_RESET_VALUE;
  99  0040 725f5322      	clr	21282
 100                     ; 74 }
 103  0044 81            	ret
 271                     ; 82 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
 271                     ; 83                         uint16_t TIM3_Period)
 271                     ; 84 {
 272                     	switch	.text
 273  0045               _TIM3_TimeBaseInit:
 275  0045 88            	push	a
 276       00000000      OFST:	set	0
 279                     ; 86   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 281  0046 c7532a        	ld	21290,a
 282                     ; 88   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8);
 284  0049 7b04          	ld	a,(OFST+4,sp)
 285  004b c7532b        	ld	21291,a
 286                     ; 89   TIM3->ARRL = (uint8_t)(TIM3_Period);
 288  004e 7b05          	ld	a,(OFST+5,sp)
 289  0050 c7532c        	ld	21292,a
 290                     ; 90 }
 293  0053 84            	pop	a
 294  0054 81            	ret
 451                     ; 100 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 451                     ; 101                   TIM3_OutputState_TypeDef TIM3_OutputState,
 451                     ; 102                   uint16_t TIM3_Pulse,
 451                     ; 103                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 451                     ; 104 {
 452                     	switch	.text
 453  0055               _TIM3_OC1Init:
 455  0055 89            	pushw	x
 456  0056 88            	push	a
 457       00000001      OFST:	set	1
 460                     ; 106   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 462                     ; 107   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 464                     ; 108   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 466                     ; 111   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
 468  0057 c65327        	ld	a,21287
 469  005a a4fc          	and	a,#252
 470  005c c75327        	ld	21287,a
 471                     ; 113   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
 473  005f 7b08          	ld	a,(OFST+7,sp)
 474  0061 a402          	and	a,#2
 475  0063 6b01          	ld	(OFST+0,sp),a
 477  0065 9f            	ld	a,xl
 478  0066 a401          	and	a,#1
 479  0068 1a01          	or	a,(OFST+0,sp)
 480  006a ca5327        	or	a,21287
 481  006d c75327        	ld	21287,a
 482                     ; 116   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 484  0070 c65325        	ld	a,21285
 485  0073 a48f          	and	a,#143
 486  0075 1a02          	or	a,(OFST+1,sp)
 487  0077 c75325        	ld	21285,a
 488                     ; 119   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 490  007a 7b06          	ld	a,(OFST+5,sp)
 491  007c c7532d        	ld	21293,a
 492                     ; 120   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 494  007f 7b07          	ld	a,(OFST+6,sp)
 495  0081 c7532e        	ld	21294,a
 496                     ; 121 }
 499  0084 5b03          	addw	sp,#3
 500  0086 81            	ret
 564                     ; 131 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 564                     ; 132                   TIM3_OutputState_TypeDef TIM3_OutputState,
 564                     ; 133                   uint16_t TIM3_Pulse,
 564                     ; 134                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 564                     ; 135 {
 565                     	switch	.text
 566  0087               _TIM3_OC2Init:
 568  0087 89            	pushw	x
 569  0088 88            	push	a
 570       00000001      OFST:	set	1
 573                     ; 137   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 575                     ; 138   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 577                     ; 139   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 579                     ; 143   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
 581  0089 c65327        	ld	a,21287
 582  008c a4cf          	and	a,#207
 583  008e c75327        	ld	21287,a
 584                     ; 145   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
 586  0091 7b08          	ld	a,(OFST+7,sp)
 587  0093 a420          	and	a,#32
 588  0095 6b01          	ld	(OFST+0,sp),a
 590  0097 9f            	ld	a,xl
 591  0098 a410          	and	a,#16
 592  009a 1a01          	or	a,(OFST+0,sp)
 593  009c ca5327        	or	a,21287
 594  009f c75327        	ld	21287,a
 595                     ; 149   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 597  00a2 c65326        	ld	a,21286
 598  00a5 a48f          	and	a,#143
 599  00a7 1a02          	or	a,(OFST+1,sp)
 600  00a9 c75326        	ld	21286,a
 601                     ; 153   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 603  00ac 7b06          	ld	a,(OFST+5,sp)
 604  00ae c7532f        	ld	21295,a
 605                     ; 154   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 607  00b1 7b07          	ld	a,(OFST+6,sp)
 608  00b3 c75330        	ld	21296,a
 609                     ; 155 }
 612  00b6 5b03          	addw	sp,#3
 613  00b8 81            	ret
 797                     ; 166 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 797                     ; 167                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 797                     ; 168                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 797                     ; 169                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 797                     ; 170                  uint8_t TIM3_ICFilter)
 797                     ; 171 {
 798                     	switch	.text
 799  00b9               _TIM3_ICInit:
 801  00b9 89            	pushw	x
 802       00000000      OFST:	set	0
 805                     ; 173   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
 807                     ; 174   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 809                     ; 175   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 811                     ; 176   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 813                     ; 177   assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
 815                     ; 179   if (TIM3_Channel != TIM3_CHANNEL_2)
 817  00ba 9e            	ld	a,xh
 818  00bb a101          	cp	a,#1
 819  00bd 2714          	jreq	L343
 820                     ; 182     TI1_Config((uint8_t)TIM3_ICPolarity,
 820                     ; 183                (uint8_t)TIM3_ICSelection,
 820                     ; 184                (uint8_t)TIM3_ICFilter);
 822  00bf 7b07          	ld	a,(OFST+7,sp)
 823  00c1 88            	push	a
 824  00c2 7b06          	ld	a,(OFST+6,sp)
 825  00c4 97            	ld	xl,a
 826  00c5 7b03          	ld	a,(OFST+3,sp)
 827  00c7 95            	ld	xh,a
 828  00c8 cd0360        	call	L3_TI1_Config
 830  00cb 84            	pop	a
 831                     ; 187     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
 833  00cc 7b06          	ld	a,(OFST+6,sp)
 834  00ce cd0285        	call	_TIM3_SetIC1Prescaler
 837  00d1 2012          	jra	L543
 838  00d3               L343:
 839                     ; 192     TI2_Config((uint8_t)TIM3_ICPolarity,
 839                     ; 193                (uint8_t)TIM3_ICSelection,
 839                     ; 194                (uint8_t)TIM3_ICFilter);
 841  00d3 7b07          	ld	a,(OFST+7,sp)
 842  00d5 88            	push	a
 843  00d6 7b06          	ld	a,(OFST+6,sp)
 844  00d8 97            	ld	xl,a
 845  00d9 7b03          	ld	a,(OFST+3,sp)
 846  00db 95            	ld	xh,a
 847  00dc cd0390        	call	L5_TI2_Config
 849  00df 84            	pop	a
 850                     ; 197     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
 852  00e0 7b06          	ld	a,(OFST+6,sp)
 853  00e2 cd0292        	call	_TIM3_SetIC2Prescaler
 855  00e5               L543:
 856                     ; 199 }
 859  00e5 85            	popw	x
 860  00e6 81            	ret
 956                     ; 210 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
 956                     ; 211                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 956                     ; 212                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
 956                     ; 213                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 956                     ; 214                      uint8_t TIM3_ICFilter)
 956                     ; 215 {
 957                     	switch	.text
 958  00e7               _TIM3_PWMIConfig:
 960  00e7 89            	pushw	x
 961  00e8 89            	pushw	x
 962       00000002      OFST:	set	2
 965                     ; 216   uint8_t icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 967                     ; 217   uint8_t icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
 969                     ; 220   assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
 971                     ; 221   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 973                     ; 222   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 975                     ; 223   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 977                     ; 226   if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
 979  00e9 9f            	ld	a,xl
 980  00ea a144          	cp	a,#68
 981  00ec 2706          	jreq	L514
 982                     ; 228     icpolarity = (uint8_t)TIM3_ICPOLARITY_FALLING;
 984  00ee a644          	ld	a,#68
 985  00f0 6b01          	ld	(OFST-1,sp),a
 988  00f2 2002          	jra	L714
 989  00f4               L514:
 990                     ; 232     icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 992  00f4 0f01          	clr	(OFST-1,sp)
 994  00f6               L714:
 995                     ; 236   if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
 997  00f6 7b07          	ld	a,(OFST+5,sp)
 998  00f8 a101          	cp	a,#1
 999  00fa 2606          	jrne	L124
1000                     ; 238     icselection = (uint8_t)TIM3_ICSELECTION_INDIRECTTI;
1002  00fc a602          	ld	a,#2
1003  00fe 6b02          	ld	(OFST+0,sp),a
1006  0100 2004          	jra	L324
1007  0102               L124:
1008                     ; 242     icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
1010  0102 a601          	ld	a,#1
1011  0104 6b02          	ld	(OFST+0,sp),a
1013  0106               L324:
1014                     ; 245   if (TIM3_Channel != TIM3_CHANNEL_2)
1016  0106 7b03          	ld	a,(OFST+1,sp)
1017  0108 a101          	cp	a,#1
1018  010a 2726          	jreq	L524
1019                     ; 248     TI1_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1019                     ; 249                (uint8_t)TIM3_ICFilter);
1021  010c 7b09          	ld	a,(OFST+7,sp)
1022  010e 88            	push	a
1023  010f 7b08          	ld	a,(OFST+6,sp)
1024  0111 97            	ld	xl,a
1025  0112 7b05          	ld	a,(OFST+3,sp)
1026  0114 95            	ld	xh,a
1027  0115 cd0360        	call	L3_TI1_Config
1029  0118 84            	pop	a
1030                     ; 252     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1032  0119 7b08          	ld	a,(OFST+6,sp)
1033  011b cd0285        	call	_TIM3_SetIC1Prescaler
1035                     ; 255     TI2_Config(icpolarity, icselection, TIM3_ICFilter);
1037  011e 7b09          	ld	a,(OFST+7,sp)
1038  0120 88            	push	a
1039  0121 7b03          	ld	a,(OFST+1,sp)
1040  0123 97            	ld	xl,a
1041  0124 7b02          	ld	a,(OFST+0,sp)
1042  0126 95            	ld	xh,a
1043  0127 cd0390        	call	L5_TI2_Config
1045  012a 84            	pop	a
1046                     ; 258     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1048  012b 7b08          	ld	a,(OFST+6,sp)
1049  012d cd0292        	call	_TIM3_SetIC2Prescaler
1052  0130 2024          	jra	L724
1053  0132               L524:
1054                     ; 263     TI2_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1054                     ; 264                (uint8_t)TIM3_ICFilter);
1056  0132 7b09          	ld	a,(OFST+7,sp)
1057  0134 88            	push	a
1058  0135 7b08          	ld	a,(OFST+6,sp)
1059  0137 97            	ld	xl,a
1060  0138 7b05          	ld	a,(OFST+3,sp)
1061  013a 95            	ld	xh,a
1062  013b cd0390        	call	L5_TI2_Config
1064  013e 84            	pop	a
1065                     ; 267     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1067  013f 7b08          	ld	a,(OFST+6,sp)
1068  0141 cd0292        	call	_TIM3_SetIC2Prescaler
1070                     ; 270     TI1_Config(icpolarity, icselection, TIM3_ICFilter);
1072  0144 7b09          	ld	a,(OFST+7,sp)
1073  0146 88            	push	a
1074  0147 7b03          	ld	a,(OFST+1,sp)
1075  0149 97            	ld	xl,a
1076  014a 7b02          	ld	a,(OFST+0,sp)
1077  014c 95            	ld	xh,a
1078  014d cd0360        	call	L3_TI1_Config
1080  0150 84            	pop	a
1081                     ; 273     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1083  0151 7b08          	ld	a,(OFST+6,sp)
1084  0153 cd0285        	call	_TIM3_SetIC1Prescaler
1086  0156               L724:
1087                     ; 275 }
1090  0156 5b04          	addw	sp,#4
1091  0158 81            	ret
1146                     ; 283 void TIM3_Cmd(FunctionalState NewState)
1146                     ; 284 {
1147                     	switch	.text
1148  0159               _TIM3_Cmd:
1152                     ; 286   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1154                     ; 289   if (NewState != DISABLE)
1156  0159 4d            	tnz	a
1157  015a 2706          	jreq	L754
1158                     ; 291     TIM3->CR1 |= (uint8_t)TIM3_CR1_CEN;
1160  015c 72105320      	bset	21280,#0
1162  0160 2004          	jra	L164
1163  0162               L754:
1164                     ; 295     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_CEN);
1166  0162 72115320      	bres	21280,#0
1167  0166               L164:
1168                     ; 297 }
1171  0166 81            	ret
1243                     ; 311 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1243                     ; 312 {
1244                     	switch	.text
1245  0167               _TIM3_ITConfig:
1247  0167 89            	pushw	x
1248       00000000      OFST:	set	0
1251                     ; 314   assert_param(IS_TIM3_IT_OK(TIM3_IT));
1253                     ; 315   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1255                     ; 317   if (NewState != DISABLE)
1257  0168 9f            	ld	a,xl
1258  0169 4d            	tnz	a
1259  016a 2709          	jreq	L715
1260                     ; 320     TIM3->IER |= (uint8_t)TIM3_IT;
1262  016c 9e            	ld	a,xh
1263  016d ca5321        	or	a,21281
1264  0170 c75321        	ld	21281,a
1266  0173 2009          	jra	L125
1267  0175               L715:
1268                     ; 325     TIM3->IER &= (uint8_t)(~TIM3_IT);
1270  0175 7b01          	ld	a,(OFST+1,sp)
1271  0177 43            	cpl	a
1272  0178 c45321        	and	a,21281
1273  017b c75321        	ld	21281,a
1274  017e               L125:
1275                     ; 327 }
1278  017e 85            	popw	x
1279  017f 81            	ret
1315                     ; 335 void TIM3_UpdateDisableConfig(FunctionalState NewState)
1315                     ; 336 {
1316                     	switch	.text
1317  0180               _TIM3_UpdateDisableConfig:
1321                     ; 338   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1323                     ; 341   if (NewState != DISABLE)
1325  0180 4d            	tnz	a
1326  0181 2706          	jreq	L145
1327                     ; 343     TIM3->CR1 |= TIM3_CR1_UDIS;
1329  0183 72125320      	bset	21280,#1
1331  0187 2004          	jra	L345
1332  0189               L145:
1333                     ; 347     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_UDIS);
1335  0189 72135320      	bres	21280,#1
1336  018d               L345:
1337                     ; 349 }
1340  018d 81            	ret
1398                     ; 359 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
1398                     ; 360 {
1399                     	switch	.text
1400  018e               _TIM3_UpdateRequestConfig:
1404                     ; 362   assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
1406                     ; 365   if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
1408  018e 4d            	tnz	a
1409  018f 2706          	jreq	L375
1410                     ; 367     TIM3->CR1 |= TIM3_CR1_URS;
1412  0191 72145320      	bset	21280,#2
1414  0195 2004          	jra	L575
1415  0197               L375:
1416                     ; 371     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_URS);
1418  0197 72155320      	bres	21280,#2
1419  019b               L575:
1420                     ; 373 }
1423  019b 81            	ret
1480                     ; 383 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1480                     ; 384 {
1481                     	switch	.text
1482  019c               _TIM3_SelectOnePulseMode:
1486                     ; 386   assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
1488                     ; 389   if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
1490  019c 4d            	tnz	a
1491  019d 2706          	jreq	L526
1492                     ; 391     TIM3->CR1 |= TIM3_CR1_OPM;
1494  019f 72165320      	bset	21280,#3
1496  01a3 2004          	jra	L726
1497  01a5               L526:
1498                     ; 395     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_OPM);
1500  01a5 72175320      	bres	21280,#3
1501  01a9               L726:
1502                     ; 397 }
1505  01a9 81            	ret
1573                     ; 427 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
1573                     ; 428                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
1573                     ; 429 {
1574                     	switch	.text
1575  01aa               _TIM3_PrescalerConfig:
1579                     ; 431   assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
1581                     ; 432   assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
1583                     ; 435   TIM3->PSCR = (uint8_t)Prescaler;
1585  01aa 9e            	ld	a,xh
1586  01ab c7532a        	ld	21290,a
1587                     ; 438   TIM3->EGR = (uint8_t)TIM3_PSCReloadMode;
1589  01ae 9f            	ld	a,xl
1590  01af c75324        	ld	21284,a
1591                     ; 439 }
1594  01b2 81            	ret
1652                     ; 450 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1652                     ; 451 {
1653                     	switch	.text
1654  01b3               _TIM3_ForcedOC1Config:
1656  01b3 88            	push	a
1657       00000000      OFST:	set	0
1660                     ; 453   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1662                     ; 456   TIM3->CCMR1 =  (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM))  | (uint8_t)TIM3_ForcedAction);
1664  01b4 c65325        	ld	a,21285
1665  01b7 a48f          	and	a,#143
1666  01b9 1a01          	or	a,(OFST+1,sp)
1667  01bb c75325        	ld	21285,a
1668                     ; 457 }
1671  01be 84            	pop	a
1672  01bf 81            	ret
1708                     ; 468 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1708                     ; 469 {
1709                     	switch	.text
1710  01c0               _TIM3_ForcedOC2Config:
1712  01c0 88            	push	a
1713       00000000      OFST:	set	0
1716                     ; 471   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1718                     ; 474   TIM3->CCMR2 =  (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_ForcedAction);
1720  01c1 c65326        	ld	a,21286
1721  01c4 a48f          	and	a,#143
1722  01c6 1a01          	or	a,(OFST+1,sp)
1723  01c8 c75326        	ld	21286,a
1724                     ; 475 }
1727  01cb 84            	pop	a
1728  01cc 81            	ret
1764                     ; 483 void TIM3_ARRPreloadConfig(FunctionalState NewState)
1764                     ; 484 {
1765                     	switch	.text
1766  01cd               _TIM3_ARRPreloadConfig:
1770                     ; 486   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1772                     ; 489   if (NewState != DISABLE)
1774  01cd 4d            	tnz	a
1775  01ce 2706          	jreq	L547
1776                     ; 491     TIM3->CR1 |= TIM3_CR1_ARPE;
1778  01d0 721e5320      	bset	21280,#7
1780  01d4 2004          	jra	L747
1781  01d6               L547:
1782                     ; 495     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_ARPE);
1784  01d6 721f5320      	bres	21280,#7
1785  01da               L747:
1786                     ; 497 }
1789  01da 81            	ret
1825                     ; 505 void TIM3_OC1PreloadConfig(FunctionalState NewState)
1825                     ; 506 {
1826                     	switch	.text
1827  01db               _TIM3_OC1PreloadConfig:
1831                     ; 508   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1833                     ; 511   if (NewState != DISABLE)
1835  01db 4d            	tnz	a
1836  01dc 2706          	jreq	L767
1837                     ; 513     TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
1839  01de 72165325      	bset	21285,#3
1841  01e2 2004          	jra	L177
1842  01e4               L767:
1843                     ; 517     TIM3->CCMR1 &= (uint8_t)(~TIM3_CCMR_OCxPE);
1845  01e4 72175325      	bres	21285,#3
1846  01e8               L177:
1847                     ; 519 }
1850  01e8 81            	ret
1886                     ; 527 void TIM3_OC2PreloadConfig(FunctionalState NewState)
1886                     ; 528 {
1887                     	switch	.text
1888  01e9               _TIM3_OC2PreloadConfig:
1892                     ; 530   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1894                     ; 533   if (NewState != DISABLE)
1896  01e9 4d            	tnz	a
1897  01ea 2706          	jreq	L1101
1898                     ; 535     TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
1900  01ec 72165326      	bset	21286,#3
1902  01f0 2004          	jra	L3101
1903  01f2               L1101:
1904                     ; 539     TIM3->CCMR2 &= (uint8_t)(~TIM3_CCMR_OCxPE);
1906  01f2 72175326      	bres	21286,#3
1907  01f6               L3101:
1908                     ; 541 }
1911  01f6 81            	ret
1976                     ; 552 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
1976                     ; 553 {
1977                     	switch	.text
1978  01f7               _TIM3_GenerateEvent:
1982                     ; 555   assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
1984                     ; 558   TIM3->EGR = (uint8_t)TIM3_EventSource;
1986  01f7 c75324        	ld	21284,a
1987                     ; 559 }
1990  01fa 81            	ret
2026                     ; 569 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2026                     ; 570 {
2027                     	switch	.text
2028  01fb               _TIM3_OC1PolarityConfig:
2032                     ; 572   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2034                     ; 575   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2036  01fb 4d            	tnz	a
2037  01fc 2706          	jreq	L3601
2038                     ; 577     TIM3->CCER1 |= TIM3_CCER1_CC1P;
2040  01fe 72125327      	bset	21287,#1
2042  0202 2004          	jra	L5601
2043  0204               L3601:
2044                     ; 581     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
2046  0204 72135327      	bres	21287,#1
2047  0208               L5601:
2048                     ; 583 }
2051  0208 81            	ret
2087                     ; 593 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2087                     ; 594 {
2088                     	switch	.text
2089  0209               _TIM3_OC2PolarityConfig:
2093                     ; 596   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2095                     ; 599   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2097  0209 4d            	tnz	a
2098  020a 2706          	jreq	L5011
2099                     ; 601     TIM3->CCER1 |= TIM3_CCER1_CC2P;
2101  020c 721a5327      	bset	21287,#5
2103  0210 2004          	jra	L7011
2104  0212               L5011:
2105                     ; 605     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
2107  0212 721b5327      	bres	21287,#5
2108  0216               L7011:
2109                     ; 607 }
2112  0216 81            	ret
2157                     ; 619 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
2157                     ; 620 {
2158                     	switch	.text
2159  0217               _TIM3_CCxCmd:
2161  0217 89            	pushw	x
2162       00000000      OFST:	set	0
2165                     ; 622   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2167                     ; 623   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2169                     ; 625   if (TIM3_Channel == TIM3_CHANNEL_1)
2171  0218 9e            	ld	a,xh
2172  0219 4d            	tnz	a
2173  021a 2610          	jrne	L3311
2174                     ; 628     if (NewState != DISABLE)
2176  021c 9f            	ld	a,xl
2177  021d 4d            	tnz	a
2178  021e 2706          	jreq	L5311
2179                     ; 630       TIM3->CCER1 |= TIM3_CCER1_CC1E;
2181  0220 72105327      	bset	21287,#0
2183  0224 2014          	jra	L1411
2184  0226               L5311:
2185                     ; 634       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2187  0226 72115327      	bres	21287,#0
2188  022a 200e          	jra	L1411
2189  022c               L3311:
2190                     ; 641     if (NewState != DISABLE)
2192  022c 0d02          	tnz	(OFST+2,sp)
2193  022e 2706          	jreq	L3411
2194                     ; 643       TIM3->CCER1 |= TIM3_CCER1_CC2E;
2196  0230 72185327      	bset	21287,#4
2198  0234 2004          	jra	L1411
2199  0236               L3411:
2200                     ; 647       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2202  0236 72195327      	bres	21287,#4
2203  023a               L1411:
2204                     ; 650 }
2207  023a 85            	popw	x
2208  023b 81            	ret
2253                     ; 671 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
2253                     ; 672 {
2254                     	switch	.text
2255  023c               _TIM3_SelectOCxM:
2257  023c 89            	pushw	x
2258       00000000      OFST:	set	0
2261                     ; 674   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2263                     ; 675   assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
2265                     ; 677   if (TIM3_Channel == TIM3_CHANNEL_1)
2267  023d 9e            	ld	a,xh
2268  023e 4d            	tnz	a
2269  023f 2610          	jrne	L1711
2270                     ; 680     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2272  0241 72115327      	bres	21287,#0
2273                     ; 683     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2275  0245 c65325        	ld	a,21285
2276  0248 a48f          	and	a,#143
2277  024a 1a02          	or	a,(OFST+2,sp)
2278  024c c75325        	ld	21285,a
2280  024f 200e          	jra	L3711
2281  0251               L1711:
2282                     ; 688     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2284  0251 72195327      	bres	21287,#4
2285                     ; 691     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2287  0255 c65326        	ld	a,21286
2288  0258 a48f          	and	a,#143
2289  025a 1a02          	or	a,(OFST+2,sp)
2290  025c c75326        	ld	21286,a
2291  025f               L3711:
2292                     ; 693 }
2295  025f 85            	popw	x
2296  0260 81            	ret
2330                     ; 701 void TIM3_SetCounter(uint16_t Counter)
2330                     ; 702 {
2331                     	switch	.text
2332  0261               _TIM3_SetCounter:
2336                     ; 704   TIM3->CNTRH = (uint8_t)(Counter >> 8);
2338  0261 9e            	ld	a,xh
2339  0262 c75328        	ld	21288,a
2340                     ; 705   TIM3->CNTRL = (uint8_t)(Counter);
2342  0265 9f            	ld	a,xl
2343  0266 c75329        	ld	21289,a
2344                     ; 706 }
2347  0269 81            	ret
2381                     ; 714 void TIM3_SetAutoreload(uint16_t Autoreload)
2381                     ; 715 {
2382                     	switch	.text
2383  026a               _TIM3_SetAutoreload:
2387                     ; 717   TIM3->ARRH = (uint8_t)(Autoreload >> 8);
2389  026a 9e            	ld	a,xh
2390  026b c7532b        	ld	21291,a
2391                     ; 718   TIM3->ARRL = (uint8_t)(Autoreload);
2393  026e 9f            	ld	a,xl
2394  026f c7532c        	ld	21292,a
2395                     ; 719 }
2398  0272 81            	ret
2432                     ; 727 void TIM3_SetCompare1(uint16_t Compare1)
2432                     ; 728 {
2433                     	switch	.text
2434  0273               _TIM3_SetCompare1:
2438                     ; 730   TIM3->CCR1H = (uint8_t)(Compare1 >> 8);
2440  0273 9e            	ld	a,xh
2441  0274 c7532d        	ld	21293,a
2442                     ; 731   TIM3->CCR1L = (uint8_t)(Compare1);
2444  0277 9f            	ld	a,xl
2445  0278 c7532e        	ld	21294,a
2446                     ; 732 }
2449  027b 81            	ret
2483                     ; 740 void TIM3_SetCompare2(uint16_t Compare2)
2483                     ; 741 {
2484                     	switch	.text
2485  027c               _TIM3_SetCompare2:
2489                     ; 743   TIM3->CCR2H = (uint8_t)(Compare2 >> 8);
2491  027c 9e            	ld	a,xh
2492  027d c7532f        	ld	21295,a
2493                     ; 744   TIM3->CCR2L = (uint8_t)(Compare2);
2495  0280 9f            	ld	a,xl
2496  0281 c75330        	ld	21296,a
2497                     ; 745 }
2500  0284 81            	ret
2536                     ; 757 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
2536                     ; 758 {
2537                     	switch	.text
2538  0285               _TIM3_SetIC1Prescaler:
2540  0285 88            	push	a
2541       00000000      OFST:	set	0
2544                     ; 760   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
2546                     ; 763   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC1Prescaler);
2548  0286 c65325        	ld	a,21285
2549  0289 a4f3          	and	a,#243
2550  028b 1a01          	or	a,(OFST+1,sp)
2551  028d c75325        	ld	21285,a
2552                     ; 764 }
2555  0290 84            	pop	a
2556  0291 81            	ret
2592                     ; 776 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
2592                     ; 777 {
2593                     	switch	.text
2594  0292               _TIM3_SetIC2Prescaler:
2596  0292 88            	push	a
2597       00000000      OFST:	set	0
2600                     ; 779   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
2602                     ; 782   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC2Prescaler);
2604  0293 c65326        	ld	a,21286
2605  0296 a4f3          	and	a,#243
2606  0298 1a01          	or	a,(OFST+1,sp)
2607  029a c75326        	ld	21286,a
2608                     ; 783 }
2611  029d 84            	pop	a
2612  029e 81            	ret
2664                     ; 790 uint16_t TIM3_GetCapture1(void)
2664                     ; 791 {
2665                     	switch	.text
2666  029f               _TIM3_GetCapture1:
2668  029f 5204          	subw	sp,#4
2669       00000004      OFST:	set	4
2672                     ; 793   uint16_t tmpccr1 = 0;
2674                     ; 794   uint8_t tmpccr1l=0, tmpccr1h=0;
2678                     ; 796   tmpccr1h = TIM3->CCR1H;
2680  02a1 c6532d        	ld	a,21293
2681  02a4 6b02          	ld	(OFST-2,sp),a
2683                     ; 797   tmpccr1l = TIM3->CCR1L;
2685  02a6 c6532e        	ld	a,21294
2686  02a9 6b01          	ld	(OFST-3,sp),a
2688                     ; 799   tmpccr1 = (uint16_t)(tmpccr1l);
2690  02ab 7b01          	ld	a,(OFST-3,sp)
2691  02ad 5f            	clrw	x
2692  02ae 97            	ld	xl,a
2693  02af 1f03          	ldw	(OFST-1,sp),x
2695                     ; 800   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
2697  02b1 7b02          	ld	a,(OFST-2,sp)
2698  02b3 5f            	clrw	x
2699  02b4 97            	ld	xl,a
2700  02b5 4f            	clr	a
2701  02b6 02            	rlwa	x,a
2702  02b7 01            	rrwa	x,a
2703  02b8 1a04          	or	a,(OFST+0,sp)
2704  02ba 01            	rrwa	x,a
2705  02bb 1a03          	or	a,(OFST-1,sp)
2706  02bd 01            	rrwa	x,a
2707  02be 1f03          	ldw	(OFST-1,sp),x
2709                     ; 802   return (uint16_t)tmpccr1;
2711  02c0 1e03          	ldw	x,(OFST-1,sp)
2714  02c2 5b04          	addw	sp,#4
2715  02c4 81            	ret
2767                     ; 810 uint16_t TIM3_GetCapture2(void)
2767                     ; 811 {
2768                     	switch	.text
2769  02c5               _TIM3_GetCapture2:
2771  02c5 5204          	subw	sp,#4
2772       00000004      OFST:	set	4
2775                     ; 813   uint16_t tmpccr2 = 0;
2777                     ; 814   uint8_t tmpccr2l=0, tmpccr2h=0;
2781                     ; 816   tmpccr2h = TIM3->CCR2H;
2783  02c7 c6532f        	ld	a,21295
2784  02ca 6b02          	ld	(OFST-2,sp),a
2786                     ; 817   tmpccr2l = TIM3->CCR2L;
2788  02cc c65330        	ld	a,21296
2789  02cf 6b01          	ld	(OFST-3,sp),a
2791                     ; 819   tmpccr2 = (uint16_t)(tmpccr2l);
2793  02d1 7b01          	ld	a,(OFST-3,sp)
2794  02d3 5f            	clrw	x
2795  02d4 97            	ld	xl,a
2796  02d5 1f03          	ldw	(OFST-1,sp),x
2798                     ; 820   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
2800  02d7 7b02          	ld	a,(OFST-2,sp)
2801  02d9 5f            	clrw	x
2802  02da 97            	ld	xl,a
2803  02db 4f            	clr	a
2804  02dc 02            	rlwa	x,a
2805  02dd 01            	rrwa	x,a
2806  02de 1a04          	or	a,(OFST+0,sp)
2807  02e0 01            	rrwa	x,a
2808  02e1 1a03          	or	a,(OFST-1,sp)
2809  02e3 01            	rrwa	x,a
2810  02e4 1f03          	ldw	(OFST-1,sp),x
2812                     ; 822   return (uint16_t)tmpccr2;
2814  02e6 1e03          	ldw	x,(OFST-1,sp)
2817  02e8 5b04          	addw	sp,#4
2818  02ea 81            	ret
2852                     ; 830 uint16_t TIM3_GetCounter(void)
2852                     ; 831 {
2853                     	switch	.text
2854  02eb               _TIM3_GetCounter:
2856  02eb 89            	pushw	x
2857       00000002      OFST:	set	2
2860                     ; 832   uint16_t tmpcntr = 0;
2862                     ; 834   tmpcntr = ((uint16_t)TIM3->CNTRH << 8);
2864  02ec c65328        	ld	a,21288
2865  02ef 5f            	clrw	x
2866  02f0 97            	ld	xl,a
2867  02f1 4f            	clr	a
2868  02f2 02            	rlwa	x,a
2869  02f3 1f01          	ldw	(OFST-1,sp),x
2871                     ; 836   return (uint16_t)( tmpcntr| (uint16_t)(TIM3->CNTRL));
2873  02f5 c65329        	ld	a,21289
2874  02f8 5f            	clrw	x
2875  02f9 97            	ld	xl,a
2876  02fa 01            	rrwa	x,a
2877  02fb 1a02          	or	a,(OFST+0,sp)
2878  02fd 01            	rrwa	x,a
2879  02fe 1a01          	or	a,(OFST-1,sp)
2880  0300 01            	rrwa	x,a
2883  0301 5b02          	addw	sp,#2
2884  0303 81            	ret
2908                     ; 844 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
2908                     ; 845 {
2909                     	switch	.text
2910  0304               _TIM3_GetPrescaler:
2914                     ; 847   return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
2916  0304 c6532a        	ld	a,21290
2919  0307 81            	ret
3044                     ; 861 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
3044                     ; 862 {
3045                     	switch	.text
3046  0308               _TIM3_GetFlagStatus:
3048  0308 89            	pushw	x
3049  0309 89            	pushw	x
3050       00000002      OFST:	set	2
3053                     ; 863   FlagStatus bitstatus = RESET;
3055                     ; 864   uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
3059                     ; 867   assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
3061                     ; 869   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_FLAG);
3063  030a 9f            	ld	a,xl
3064  030b c45322        	and	a,21282
3065  030e 6b01          	ld	(OFST-1,sp),a
3067                     ; 870   tim3_flag_h = (uint8_t)((uint16_t)TIM3_FLAG >> 8);
3069  0310 7b03          	ld	a,(OFST+1,sp)
3070  0312 6b02          	ld	(OFST+0,sp),a
3072                     ; 872   if (((tim3_flag_l) | (uint8_t)(TIM3->SR2 & tim3_flag_h)) != (uint8_t)RESET )
3074  0314 c65323        	ld	a,21283
3075  0317 1402          	and	a,(OFST+0,sp)
3076  0319 1a01          	or	a,(OFST-1,sp)
3077  031b 2706          	jreq	L3051
3078                     ; 874     bitstatus = SET;
3080  031d a601          	ld	a,#1
3081  031f 6b02          	ld	(OFST+0,sp),a
3084  0321 2002          	jra	L5051
3085  0323               L3051:
3086                     ; 878     bitstatus = RESET;
3088  0323 0f02          	clr	(OFST+0,sp)
3090  0325               L5051:
3091                     ; 880   return (FlagStatus)bitstatus;
3093  0325 7b02          	ld	a,(OFST+0,sp)
3096  0327 5b04          	addw	sp,#4
3097  0329 81            	ret
3132                     ; 894 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3132                     ; 895 {
3133                     	switch	.text
3134  032a               _TIM3_ClearFlag:
3136  032a 89            	pushw	x
3137       00000000      OFST:	set	0
3140                     ; 897   assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
3142                     ; 900   TIM3->SR1 = (uint8_t)(~((uint8_t)(TIM3_FLAG)));
3144  032b 9f            	ld	a,xl
3145  032c 43            	cpl	a
3146  032d c75322        	ld	21282,a
3147                     ; 901   TIM3->SR2 = (uint8_t)(~((uint8_t)((uint16_t)TIM3_FLAG >> 8)));
3149  0330 7b01          	ld	a,(OFST+1,sp)
3150  0332 43            	cpl	a
3151  0333 c75323        	ld	21283,a
3152                     ; 902 }
3155  0336 85            	popw	x
3156  0337 81            	ret
3220                     ; 913 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
3220                     ; 914 {
3221                     	switch	.text
3222  0338               _TIM3_GetITStatus:
3224  0338 88            	push	a
3225  0339 89            	pushw	x
3226       00000002      OFST:	set	2
3229                     ; 915   ITStatus bitstatus = RESET;
3231                     ; 916   uint8_t TIM3_itStatus = 0, TIM3_itEnable = 0;
3235                     ; 919   assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
3237                     ; 921   TIM3_itStatus = (uint8_t)(TIM3->SR1 & TIM3_IT);
3239  033a c45322        	and	a,21282
3240  033d 6b01          	ld	(OFST-1,sp),a
3242                     ; 923   TIM3_itEnable = (uint8_t)(TIM3->IER & TIM3_IT);
3244  033f c65321        	ld	a,21281
3245  0342 1403          	and	a,(OFST+1,sp)
3246  0344 6b02          	ld	(OFST+0,sp),a
3248                     ; 925   if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET ))
3250  0346 0d01          	tnz	(OFST-1,sp)
3251  0348 270a          	jreq	L7551
3253  034a 0d02          	tnz	(OFST+0,sp)
3254  034c 2706          	jreq	L7551
3255                     ; 927     bitstatus = SET;
3257  034e a601          	ld	a,#1
3258  0350 6b02          	ld	(OFST+0,sp),a
3261  0352 2002          	jra	L1651
3262  0354               L7551:
3263                     ; 931     bitstatus = RESET;
3265  0354 0f02          	clr	(OFST+0,sp)
3267  0356               L1651:
3268                     ; 933   return (ITStatus)(bitstatus);
3270  0356 7b02          	ld	a,(OFST+0,sp)
3273  0358 5b03          	addw	sp,#3
3274  035a 81            	ret
3310                     ; 945 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
3310                     ; 946 {
3311                     	switch	.text
3312  035b               _TIM3_ClearITPendingBit:
3316                     ; 948   assert_param(IS_TIM3_IT_OK(TIM3_IT));
3318                     ; 951   TIM3->SR1 = (uint8_t)(~TIM3_IT);
3320  035b 43            	cpl	a
3321  035c c75322        	ld	21282,a
3322                     ; 952 }
3325  035f 81            	ret
3377                     ; 970 static void TI1_Config(uint8_t TIM3_ICPolarity,
3377                     ; 971                        uint8_t TIM3_ICSelection,
3377                     ; 972                        uint8_t TIM3_ICFilter)
3377                     ; 973 {
3378                     	switch	.text
3379  0360               L3_TI1_Config:
3381  0360 89            	pushw	x
3382  0361 88            	push	a
3383       00000001      OFST:	set	1
3386                     ; 975   TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
3388  0362 72115327      	bres	21287,#0
3389                     ; 978   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~( TIM3_CCMR_CCxS | TIM3_CCMR_ICxF))) | (uint8_t)(( (TIM3_ICSelection)) | ((uint8_t)( TIM3_ICFilter << 4))));
3391  0366 7b06          	ld	a,(OFST+5,sp)
3392  0368 97            	ld	xl,a
3393  0369 a610          	ld	a,#16
3394  036b 42            	mul	x,a
3395  036c 9f            	ld	a,xl
3396  036d 1a03          	or	a,(OFST+2,sp)
3397  036f 6b01          	ld	(OFST+0,sp),a
3399  0371 c65325        	ld	a,21285
3400  0374 a40c          	and	a,#12
3401  0376 1a01          	or	a,(OFST+0,sp)
3402  0378 c75325        	ld	21285,a
3403                     ; 981   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3405  037b 0d02          	tnz	(OFST+1,sp)
3406  037d 2706          	jreq	L7261
3407                     ; 983     TIM3->CCER1 |= TIM3_CCER1_CC1P;
3409  037f 72125327      	bset	21287,#1
3411  0383 2004          	jra	L1361
3412  0385               L7261:
3413                     ; 987     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
3415  0385 72135327      	bres	21287,#1
3416  0389               L1361:
3417                     ; 990   TIM3->CCER1 |= TIM3_CCER1_CC1E;
3419  0389 72105327      	bset	21287,#0
3420                     ; 991 }
3423  038d 5b03          	addw	sp,#3
3424  038f 81            	ret
3476                     ; 1009 static void TI2_Config(uint8_t TIM3_ICPolarity,
3476                     ; 1010                        uint8_t TIM3_ICSelection,
3476                     ; 1011                        uint8_t TIM3_ICFilter)
3476                     ; 1012 {
3477                     	switch	.text
3478  0390               L5_TI2_Config:
3480  0390 89            	pushw	x
3481  0391 88            	push	a
3482       00000001      OFST:	set	1
3485                     ; 1014   TIM3->CCER1 &=  (uint8_t)(~TIM3_CCER1_CC2E);
3487  0392 72195327      	bres	21287,#4
3488                     ; 1017   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~( TIM3_CCMR_CCxS |
3488                     ; 1018                                                               TIM3_CCMR_ICxF    ))) | (uint8_t)(( (TIM3_ICSelection)) | 
3488                     ; 1019                                                                                                 ((uint8_t)( TIM3_ICFilter << 4))));
3490  0396 7b06          	ld	a,(OFST+5,sp)
3491  0398 97            	ld	xl,a
3492  0399 a610          	ld	a,#16
3493  039b 42            	mul	x,a
3494  039c 9f            	ld	a,xl
3495  039d 1a03          	or	a,(OFST+2,sp)
3496  039f 6b01          	ld	(OFST+0,sp),a
3498  03a1 c65326        	ld	a,21286
3499  03a4 a40c          	and	a,#12
3500  03a6 1a01          	or	a,(OFST+0,sp)
3501  03a8 c75326        	ld	21286,a
3502                     ; 1022   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3504  03ab 0d02          	tnz	(OFST+1,sp)
3505  03ad 2706          	jreq	L1661
3506                     ; 1024     TIM3->CCER1 |= TIM3_CCER1_CC2P;
3508  03af 721a5327      	bset	21287,#5
3510  03b3 2004          	jra	L3661
3511  03b5               L1661:
3512                     ; 1028     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
3514  03b5 721b5327      	bres	21287,#5
3515  03b9               L3661:
3516                     ; 1032   TIM3->CCER1 |= TIM3_CCER1_CC2E;
3518  03b9 72185327      	bset	21287,#4
3519                     ; 1033 }
3522  03bd 5b03          	addw	sp,#3
3523  03bf 81            	ret
3536                     	xdef	_TIM3_ClearITPendingBit
3537                     	xdef	_TIM3_GetITStatus
3538                     	xdef	_TIM3_ClearFlag
3539                     	xdef	_TIM3_GetFlagStatus
3540                     	xdef	_TIM3_GetPrescaler
3541                     	xdef	_TIM3_GetCounter
3542                     	xdef	_TIM3_GetCapture2
3543                     	xdef	_TIM3_GetCapture1
3544                     	xdef	_TIM3_SetIC2Prescaler
3545                     	xdef	_TIM3_SetIC1Prescaler
3546                     	xdef	_TIM3_SetCompare2
3547                     	xdef	_TIM3_SetCompare1
3548                     	xdef	_TIM3_SetAutoreload
3549                     	xdef	_TIM3_SetCounter
3550                     	xdef	_TIM3_SelectOCxM
3551                     	xdef	_TIM3_CCxCmd
3552                     	xdef	_TIM3_OC2PolarityConfig
3553                     	xdef	_TIM3_OC1PolarityConfig
3554                     	xdef	_TIM3_GenerateEvent
3555                     	xdef	_TIM3_OC2PreloadConfig
3556                     	xdef	_TIM3_OC1PreloadConfig
3557                     	xdef	_TIM3_ARRPreloadConfig
3558                     	xdef	_TIM3_ForcedOC2Config
3559                     	xdef	_TIM3_ForcedOC1Config
3560                     	xdef	_TIM3_PrescalerConfig
3561                     	xdef	_TIM3_SelectOnePulseMode
3562                     	xdef	_TIM3_UpdateRequestConfig
3563                     	xdef	_TIM3_UpdateDisableConfig
3564                     	xdef	_TIM3_ITConfig
3565                     	xdef	_TIM3_Cmd
3566                     	xdef	_TIM3_PWMIConfig
3567                     	xdef	_TIM3_ICInit
3568                     	xdef	_TIM3_OC2Init
3569                     	xdef	_TIM3_OC1Init
3570                     	xdef	_TIM3_TimeBaseInit
3571                     	xdef	_TIM3_DeInit
3590                     	end
