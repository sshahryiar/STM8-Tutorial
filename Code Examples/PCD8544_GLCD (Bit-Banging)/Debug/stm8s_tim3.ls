   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  42                     ; 51 void TIM3_DeInit(void)
  42                     ; 52 {
  43                     	switch	.text
  44  0000               f_TIM3_DeInit:
  48                     ; 53   TIM3->CR1 = (uint8_t)TIM3_CR1_RESET_VALUE;
  50  0000 725f5320      	clr	21280
  51                     ; 54   TIM3->IER = (uint8_t)TIM3_IER_RESET_VALUE;
  53  0004 725f5321      	clr	21281
  54                     ; 55   TIM3->SR2 = (uint8_t)TIM3_SR2_RESET_VALUE;
  56  0008 725f5323      	clr	21283
  57                     ; 58   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  59  000c 725f5327      	clr	21287
  60                     ; 61   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  62  0010 725f5327      	clr	21287
  63                     ; 62   TIM3->CCMR1 = (uint8_t)TIM3_CCMR1_RESET_VALUE;
  65  0014 725f5325      	clr	21285
  66                     ; 63   TIM3->CCMR2 = (uint8_t)TIM3_CCMR2_RESET_VALUE;
  68  0018 725f5326      	clr	21286
  69                     ; 64   TIM3->CNTRH = (uint8_t)TIM3_CNTRH_RESET_VALUE;
  71  001c 725f5328      	clr	21288
  72                     ; 65   TIM3->CNTRL = (uint8_t)TIM3_CNTRL_RESET_VALUE;
  74  0020 725f5329      	clr	21289
  75                     ; 66   TIM3->PSCR = (uint8_t)TIM3_PSCR_RESET_VALUE;
  77  0024 725f532a      	clr	21290
  78                     ; 67   TIM3->ARRH  = (uint8_t)TIM3_ARRH_RESET_VALUE;
  80  0028 35ff532b      	mov	21291,#255
  81                     ; 68   TIM3->ARRL  = (uint8_t)TIM3_ARRL_RESET_VALUE;
  83  002c 35ff532c      	mov	21292,#255
  84                     ; 69   TIM3->CCR1H = (uint8_t)TIM3_CCR1H_RESET_VALUE;
  86  0030 725f532d      	clr	21293
  87                     ; 70   TIM3->CCR1L = (uint8_t)TIM3_CCR1L_RESET_VALUE;
  89  0034 725f532e      	clr	21294
  90                     ; 71   TIM3->CCR2H = (uint8_t)TIM3_CCR2H_RESET_VALUE;
  92  0038 725f532f      	clr	21295
  93                     ; 72   TIM3->CCR2L = (uint8_t)TIM3_CCR2L_RESET_VALUE;
  95  003c 725f5330      	clr	21296
  96                     ; 73   TIM3->SR1 = (uint8_t)TIM3_SR1_RESET_VALUE;
  98  0040 725f5322      	clr	21282
  99                     ; 74 }
 102  0044 87            	retf
 267                     ; 82 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
 267                     ; 83                         uint16_t TIM3_Period)
 267                     ; 84 {
 268                     	switch	.text
 269  0045               f_TIM3_TimeBaseInit:
 271  0045 88            	push	a
 272       00000000      OFST:	set	0
 275                     ; 86   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 277  0046 c7532a        	ld	21290,a
 278                     ; 88   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8);
 280  0049 7b05          	ld	a,(OFST+5,sp)
 281  004b c7532b        	ld	21291,a
 282                     ; 89   TIM3->ARRL = (uint8_t)(TIM3_Period);
 284  004e 7b06          	ld	a,(OFST+6,sp)
 285  0050 c7532c        	ld	21292,a
 286                     ; 90 }
 289  0053 84            	pop	a
 290  0054 87            	retf
 444                     ; 100 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 444                     ; 101                   TIM3_OutputState_TypeDef TIM3_OutputState,
 444                     ; 102                   uint16_t TIM3_Pulse,
 444                     ; 103                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 444                     ; 104 {
 445                     	switch	.text
 446  0055               f_TIM3_OC1Init:
 448  0055 89            	pushw	x
 449  0056 88            	push	a
 450       00000001      OFST:	set	1
 453                     ; 106   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 455                     ; 107   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 457                     ; 108   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 459                     ; 111   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
 461  0057 c65327        	ld	a,21287
 462  005a a4fc          	and	a,#252
 463  005c c75327        	ld	21287,a
 464                     ; 113   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
 466  005f 7b09          	ld	a,(OFST+8,sp)
 467  0061 a402          	and	a,#2
 468  0063 6b01          	ld	(OFST+0,sp),a
 470  0065 9f            	ld	a,xl
 471  0066 a401          	and	a,#1
 472  0068 1a01          	or	a,(OFST+0,sp)
 473  006a ca5327        	or	a,21287
 474  006d c75327        	ld	21287,a
 475                     ; 116   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 477  0070 c65325        	ld	a,21285
 478  0073 a48f          	and	a,#143
 479  0075 1a02          	or	a,(OFST+1,sp)
 480  0077 c75325        	ld	21285,a
 481                     ; 119   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 483  007a 7b07          	ld	a,(OFST+6,sp)
 484  007c c7532d        	ld	21293,a
 485                     ; 120   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 487  007f 7b08          	ld	a,(OFST+7,sp)
 488  0081 c7532e        	ld	21294,a
 489                     ; 121 }
 492  0084 5b03          	addw	sp,#3
 493  0086 87            	retf
 554                     ; 131 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 554                     ; 132                   TIM3_OutputState_TypeDef TIM3_OutputState,
 554                     ; 133                   uint16_t TIM3_Pulse,
 554                     ; 134                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 554                     ; 135 {
 555                     	switch	.text
 556  0087               f_TIM3_OC2Init:
 558  0087 89            	pushw	x
 559  0088 88            	push	a
 560       00000001      OFST:	set	1
 563                     ; 137   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 565                     ; 138   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 567                     ; 139   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 569                     ; 143   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
 571  0089 c65327        	ld	a,21287
 572  008c a4cf          	and	a,#207
 573  008e c75327        	ld	21287,a
 574                     ; 145   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
 576  0091 7b09          	ld	a,(OFST+8,sp)
 577  0093 a420          	and	a,#32
 578  0095 6b01          	ld	(OFST+0,sp),a
 580  0097 9f            	ld	a,xl
 581  0098 a410          	and	a,#16
 582  009a 1a01          	or	a,(OFST+0,sp)
 583  009c ca5327        	or	a,21287
 584  009f c75327        	ld	21287,a
 585                     ; 149   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 587  00a2 c65326        	ld	a,21286
 588  00a5 a48f          	and	a,#143
 589  00a7 1a02          	or	a,(OFST+1,sp)
 590  00a9 c75326        	ld	21286,a
 591                     ; 153   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 593  00ac 7b07          	ld	a,(OFST+6,sp)
 594  00ae c7532f        	ld	21295,a
 595                     ; 154   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 597  00b1 7b08          	ld	a,(OFST+7,sp)
 598  00b3 c75330        	ld	21296,a
 599                     ; 155 }
 602  00b6 5b03          	addw	sp,#3
 603  00b8 87            	retf
 784                     ; 166 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 784                     ; 167                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 784                     ; 168                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 784                     ; 169                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 784                     ; 170                  uint8_t TIM3_ICFilter)
 784                     ; 171 {
 785                     	switch	.text
 786  00b9               f_TIM3_ICInit:
 788  00b9 89            	pushw	x
 789       00000000      OFST:	set	0
 792                     ; 173   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
 794                     ; 174   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 796                     ; 175   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 798                     ; 176   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 800                     ; 177   assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
 802                     ; 179   if (TIM3_Channel != TIM3_CHANNEL_2)
 804  00ba 9e            	ld	a,xh
 805  00bb a101          	cp	a,#1
 806  00bd 2716          	jreq	L333
 807                     ; 182     TI1_Config((uint8_t)TIM3_ICPolarity,
 807                     ; 183                (uint8_t)TIM3_ICSelection,
 807                     ; 184                (uint8_t)TIM3_ICFilter);
 809  00bf 7b08          	ld	a,(OFST+8,sp)
 810  00c1 88            	push	a
 811  00c2 7b07          	ld	a,(OFST+7,sp)
 812  00c4 97            	ld	xl,a
 813  00c5 7b03          	ld	a,(OFST+3,sp)
 814  00c7 95            	ld	xh,a
 815  00c8 8d6c036c      	callf	L3f_TI1_Config
 817  00cc 84            	pop	a
 818                     ; 187     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
 820  00cd 7b07          	ld	a,(OFST+7,sp)
 821  00cf 8d910291      	callf	f_TIM3_SetIC1Prescaler
 824  00d3 2014          	jra	L533
 825  00d5               L333:
 826                     ; 192     TI2_Config((uint8_t)TIM3_ICPolarity,
 826                     ; 193                (uint8_t)TIM3_ICSelection,
 826                     ; 194                (uint8_t)TIM3_ICFilter);
 828  00d5 7b08          	ld	a,(OFST+8,sp)
 829  00d7 88            	push	a
 830  00d8 7b07          	ld	a,(OFST+7,sp)
 831  00da 97            	ld	xl,a
 832  00db 7b03          	ld	a,(OFST+3,sp)
 833  00dd 95            	ld	xh,a
 834  00de 8d9c039c      	callf	L5f_TI2_Config
 836  00e2 84            	pop	a
 837                     ; 197     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
 839  00e3 7b07          	ld	a,(OFST+7,sp)
 840  00e5 8d9e029e      	callf	f_TIM3_SetIC2Prescaler
 842  00e9               L533:
 843                     ; 199 }
 846  00e9 85            	popw	x
 847  00ea 87            	retf
 936                     ; 210 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
 936                     ; 211                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 936                     ; 212                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
 936                     ; 213                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 936                     ; 214                      uint8_t TIM3_ICFilter)
 936                     ; 215 {
 937                     	switch	.text
 938  00eb               f_TIM3_PWMIConfig:
 940  00eb 89            	pushw	x
 941  00ec 89            	pushw	x
 942       00000002      OFST:	set	2
 945                     ; 216   uint8_t icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 947                     ; 217   uint8_t icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
 949                     ; 220   assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
 951                     ; 221   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 953                     ; 222   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 955                     ; 223   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 957                     ; 226   if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
 959  00ed 9f            	ld	a,xl
 960  00ee a144          	cp	a,#68
 961  00f0 2706          	jreq	L773
 962                     ; 228     icpolarity = (uint8_t)TIM3_ICPOLARITY_FALLING;
 964  00f2 a644          	ld	a,#68
 965  00f4 6b01          	ld	(OFST-1,sp),a
 968  00f6 2002          	jra	L104
 969  00f8               L773:
 970                     ; 232     icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 972  00f8 0f01          	clr	(OFST-1,sp)
 974  00fa               L104:
 975                     ; 236   if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
 977  00fa 7b08          	ld	a,(OFST+6,sp)
 978  00fc a101          	cp	a,#1
 979  00fe 2606          	jrne	L304
 980                     ; 238     icselection = (uint8_t)TIM3_ICSELECTION_INDIRECTTI;
 982  0100 a602          	ld	a,#2
 983  0102 6b02          	ld	(OFST+0,sp),a
 986  0104 2004          	jra	L504
 987  0106               L304:
 988                     ; 242     icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
 990  0106 a601          	ld	a,#1
 991  0108 6b02          	ld	(OFST+0,sp),a
 993  010a               L504:
 994                     ; 245   if (TIM3_Channel != TIM3_CHANNEL_2)
 996  010a 7b03          	ld	a,(OFST+1,sp)
 997  010c a101          	cp	a,#1
 998  010e 272a          	jreq	L704
 999                     ; 248     TI1_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
 999                     ; 249                (uint8_t)TIM3_ICFilter);
1001  0110 7b0a          	ld	a,(OFST+8,sp)
1002  0112 88            	push	a
1003  0113 7b09          	ld	a,(OFST+7,sp)
1004  0115 97            	ld	xl,a
1005  0116 7b05          	ld	a,(OFST+3,sp)
1006  0118 95            	ld	xh,a
1007  0119 8d6c036c      	callf	L3f_TI1_Config
1009  011d 84            	pop	a
1010                     ; 252     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1012  011e 7b09          	ld	a,(OFST+7,sp)
1013  0120 8d910291      	callf	f_TIM3_SetIC1Prescaler
1015                     ; 255     TI2_Config(icpolarity, icselection, TIM3_ICFilter);
1017  0124 7b0a          	ld	a,(OFST+8,sp)
1018  0126 88            	push	a
1019  0127 7b03          	ld	a,(OFST+1,sp)
1020  0129 97            	ld	xl,a
1021  012a 7b02          	ld	a,(OFST+0,sp)
1022  012c 95            	ld	xh,a
1023  012d 8d9c039c      	callf	L5f_TI2_Config
1025  0131 84            	pop	a
1026                     ; 258     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1028  0132 7b09          	ld	a,(OFST+7,sp)
1029  0134 8d9e029e      	callf	f_TIM3_SetIC2Prescaler
1032  0138 2028          	jra	L114
1033  013a               L704:
1034                     ; 263     TI2_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1034                     ; 264                (uint8_t)TIM3_ICFilter);
1036  013a 7b0a          	ld	a,(OFST+8,sp)
1037  013c 88            	push	a
1038  013d 7b09          	ld	a,(OFST+7,sp)
1039  013f 97            	ld	xl,a
1040  0140 7b05          	ld	a,(OFST+3,sp)
1041  0142 95            	ld	xh,a
1042  0143 8d9c039c      	callf	L5f_TI2_Config
1044  0147 84            	pop	a
1045                     ; 267     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1047  0148 7b09          	ld	a,(OFST+7,sp)
1048  014a 8d9e029e      	callf	f_TIM3_SetIC2Prescaler
1050                     ; 270     TI1_Config(icpolarity, icselection, TIM3_ICFilter);
1052  014e 7b0a          	ld	a,(OFST+8,sp)
1053  0150 88            	push	a
1054  0151 7b03          	ld	a,(OFST+1,sp)
1055  0153 97            	ld	xl,a
1056  0154 7b02          	ld	a,(OFST+0,sp)
1057  0156 95            	ld	xh,a
1058  0157 8d6c036c      	callf	L3f_TI1_Config
1060  015b 84            	pop	a
1061                     ; 273     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1063  015c 7b09          	ld	a,(OFST+7,sp)
1064  015e 8d910291      	callf	f_TIM3_SetIC1Prescaler
1066  0162               L114:
1067                     ; 275 }
1070  0162 5b04          	addw	sp,#4
1071  0164 87            	retf
1125                     ; 283 void TIM3_Cmd(FunctionalState NewState)
1125                     ; 284 {
1126                     	switch	.text
1127  0165               f_TIM3_Cmd:
1131                     ; 286   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1133                     ; 289   if (NewState != DISABLE)
1135  0165 4d            	tnz	a
1136  0166 2706          	jreq	L144
1137                     ; 291     TIM3->CR1 |= (uint8_t)TIM3_CR1_CEN;
1139  0168 72105320      	bset	21280,#0
1141  016c 2004          	jra	L344
1142  016e               L144:
1143                     ; 295     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_CEN);
1145  016e 72115320      	bres	21280,#0
1146  0172               L344:
1147                     ; 297 }
1150  0172 87            	retf
1221                     ; 311 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1221                     ; 312 {
1222                     	switch	.text
1223  0173               f_TIM3_ITConfig:
1225  0173 89            	pushw	x
1226       00000000      OFST:	set	0
1229                     ; 314   assert_param(IS_TIM3_IT_OK(TIM3_IT));
1231                     ; 315   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1233                     ; 317   if (NewState != DISABLE)
1235  0174 9f            	ld	a,xl
1236  0175 4d            	tnz	a
1237  0176 2709          	jreq	L105
1238                     ; 320     TIM3->IER |= (uint8_t)TIM3_IT;
1240  0178 9e            	ld	a,xh
1241  0179 ca5321        	or	a,21281
1242  017c c75321        	ld	21281,a
1244  017f 2009          	jra	L305
1245  0181               L105:
1246                     ; 325     TIM3->IER &= (uint8_t)(~TIM3_IT);
1248  0181 7b01          	ld	a,(OFST+1,sp)
1249  0183 43            	cpl	a
1250  0184 c45321        	and	a,21281
1251  0187 c75321        	ld	21281,a
1252  018a               L305:
1253                     ; 327 }
1256  018a 85            	popw	x
1257  018b 87            	retf
1292                     ; 335 void TIM3_UpdateDisableConfig(FunctionalState NewState)
1292                     ; 336 {
1293                     	switch	.text
1294  018c               f_TIM3_UpdateDisableConfig:
1298                     ; 338   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1300                     ; 341   if (NewState != DISABLE)
1302  018c 4d            	tnz	a
1303  018d 2706          	jreq	L325
1304                     ; 343     TIM3->CR1 |= TIM3_CR1_UDIS;
1306  018f 72125320      	bset	21280,#1
1308  0193 2004          	jra	L525
1309  0195               L325:
1310                     ; 347     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_UDIS);
1312  0195 72135320      	bres	21280,#1
1313  0199               L525:
1314                     ; 349 }
1317  0199 87            	retf
1374                     ; 359 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
1374                     ; 360 {
1375                     	switch	.text
1376  019a               f_TIM3_UpdateRequestConfig:
1380                     ; 362   assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
1382                     ; 365   if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
1384  019a 4d            	tnz	a
1385  019b 2706          	jreq	L555
1386                     ; 367     TIM3->CR1 |= TIM3_CR1_URS;
1388  019d 72145320      	bset	21280,#2
1390  01a1 2004          	jra	L755
1391  01a3               L555:
1392                     ; 371     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_URS);
1394  01a3 72155320      	bres	21280,#2
1395  01a7               L755:
1396                     ; 373 }
1399  01a7 87            	retf
1455                     ; 383 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1455                     ; 384 {
1456                     	switch	.text
1457  01a8               f_TIM3_SelectOnePulseMode:
1461                     ; 386   assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
1463                     ; 389   if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
1465  01a8 4d            	tnz	a
1466  01a9 2706          	jreq	L706
1467                     ; 391     TIM3->CR1 |= TIM3_CR1_OPM;
1469  01ab 72165320      	bset	21280,#3
1471  01af 2004          	jra	L116
1472  01b1               L706:
1473                     ; 395     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_OPM);
1475  01b1 72175320      	bres	21280,#3
1476  01b5               L116:
1477                     ; 397 }
1480  01b5 87            	retf
1547                     ; 427 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
1547                     ; 428                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
1547                     ; 429 {
1548                     	switch	.text
1549  01b6               f_TIM3_PrescalerConfig:
1553                     ; 431   assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
1555                     ; 432   assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
1557                     ; 435   TIM3->PSCR = (uint8_t)Prescaler;
1559  01b6 9e            	ld	a,xh
1560  01b7 c7532a        	ld	21290,a
1561                     ; 438   TIM3->EGR = (uint8_t)TIM3_PSCReloadMode;
1563  01ba 9f            	ld	a,xl
1564  01bb c75324        	ld	21284,a
1565                     ; 439 }
1568  01be 87            	retf
1625                     ; 450 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1625                     ; 451 {
1626                     	switch	.text
1627  01bf               f_TIM3_ForcedOC1Config:
1629  01bf 88            	push	a
1630       00000000      OFST:	set	0
1633                     ; 453   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1635                     ; 456   TIM3->CCMR1 =  (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM))  | (uint8_t)TIM3_ForcedAction);
1637  01c0 c65325        	ld	a,21285
1638  01c3 a48f          	and	a,#143
1639  01c5 1a01          	or	a,(OFST+1,sp)
1640  01c7 c75325        	ld	21285,a
1641                     ; 457 }
1644  01ca 84            	pop	a
1645  01cb 87            	retf
1680                     ; 468 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1680                     ; 469 {
1681                     	switch	.text
1682  01cc               f_TIM3_ForcedOC2Config:
1684  01cc 88            	push	a
1685       00000000      OFST:	set	0
1688                     ; 471   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1690                     ; 474   TIM3->CCMR2 =  (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_ForcedAction);
1692  01cd c65326        	ld	a,21286
1693  01d0 a48f          	and	a,#143
1694  01d2 1a01          	or	a,(OFST+1,sp)
1695  01d4 c75326        	ld	21286,a
1696                     ; 475 }
1699  01d7 84            	pop	a
1700  01d8 87            	retf
1735                     ; 483 void TIM3_ARRPreloadConfig(FunctionalState NewState)
1735                     ; 484 {
1736                     	switch	.text
1737  01d9               f_TIM3_ARRPreloadConfig:
1741                     ; 486   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1743                     ; 489   if (NewState != DISABLE)
1745  01d9 4d            	tnz	a
1746  01da 2706          	jreq	L727
1747                     ; 491     TIM3->CR1 |= TIM3_CR1_ARPE;
1749  01dc 721e5320      	bset	21280,#7
1751  01e0 2004          	jra	L137
1752  01e2               L727:
1753                     ; 495     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_ARPE);
1755  01e2 721f5320      	bres	21280,#7
1756  01e6               L137:
1757                     ; 497 }
1760  01e6 87            	retf
1795                     ; 505 void TIM3_OC1PreloadConfig(FunctionalState NewState)
1795                     ; 506 {
1796                     	switch	.text
1797  01e7               f_TIM3_OC1PreloadConfig:
1801                     ; 508   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1803                     ; 511   if (NewState != DISABLE)
1805  01e7 4d            	tnz	a
1806  01e8 2706          	jreq	L157
1807                     ; 513     TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
1809  01ea 72165325      	bset	21285,#3
1811  01ee 2004          	jra	L357
1812  01f0               L157:
1813                     ; 517     TIM3->CCMR1 &= (uint8_t)(~TIM3_CCMR_OCxPE);
1815  01f0 72175325      	bres	21285,#3
1816  01f4               L357:
1817                     ; 519 }
1820  01f4 87            	retf
1855                     ; 527 void TIM3_OC2PreloadConfig(FunctionalState NewState)
1855                     ; 528 {
1856                     	switch	.text
1857  01f5               f_TIM3_OC2PreloadConfig:
1861                     ; 530   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1863                     ; 533   if (NewState != DISABLE)
1865  01f5 4d            	tnz	a
1866  01f6 2706          	jreq	L377
1867                     ; 535     TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
1869  01f8 72165326      	bset	21286,#3
1871  01fc 2004          	jra	L577
1872  01fe               L377:
1873                     ; 539     TIM3->CCMR2 &= (uint8_t)(~TIM3_CCMR_OCxPE);
1875  01fe 72175326      	bres	21286,#3
1876  0202               L577:
1877                     ; 541 }
1880  0202 87            	retf
1944                     ; 552 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
1944                     ; 553 {
1945                     	switch	.text
1946  0203               f_TIM3_GenerateEvent:
1950                     ; 555   assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
1952                     ; 558   TIM3->EGR = (uint8_t)TIM3_EventSource;
1954  0203 c75324        	ld	21284,a
1955                     ; 559 }
1958  0206 87            	retf
1993                     ; 569 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
1993                     ; 570 {
1994                     	switch	.text
1995  0207               f_TIM3_OC1PolarityConfig:
1999                     ; 572   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2001                     ; 575   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2003  0207 4d            	tnz	a
2004  0208 2706          	jreq	L5401
2005                     ; 577     TIM3->CCER1 |= TIM3_CCER1_CC1P;
2007  020a 72125327      	bset	21287,#1
2009  020e 2004          	jra	L7401
2010  0210               L5401:
2011                     ; 581     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
2013  0210 72135327      	bres	21287,#1
2014  0214               L7401:
2015                     ; 583 }
2018  0214 87            	retf
2053                     ; 593 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2053                     ; 594 {
2054                     	switch	.text
2055  0215               f_TIM3_OC2PolarityConfig:
2059                     ; 596   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2061                     ; 599   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2063  0215 4d            	tnz	a
2064  0216 2706          	jreq	L7601
2065                     ; 601     TIM3->CCER1 |= TIM3_CCER1_CC2P;
2067  0218 721a5327      	bset	21287,#5
2069  021c 2004          	jra	L1701
2070  021e               L7601:
2071                     ; 605     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
2073  021e 721b5327      	bres	21287,#5
2074  0222               L1701:
2075                     ; 607 }
2078  0222 87            	retf
2122                     ; 619 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
2122                     ; 620 {
2123                     	switch	.text
2124  0223               f_TIM3_CCxCmd:
2126  0223 89            	pushw	x
2127       00000000      OFST:	set	0
2130                     ; 622   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2132                     ; 623   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2134                     ; 625   if (TIM3_Channel == TIM3_CHANNEL_1)
2136  0224 9e            	ld	a,xh
2137  0225 4d            	tnz	a
2138  0226 2610          	jrne	L5111
2139                     ; 628     if (NewState != DISABLE)
2141  0228 9f            	ld	a,xl
2142  0229 4d            	tnz	a
2143  022a 2706          	jreq	L7111
2144                     ; 630       TIM3->CCER1 |= TIM3_CCER1_CC1E;
2146  022c 72105327      	bset	21287,#0
2148  0230 2014          	jra	L3211
2149  0232               L7111:
2150                     ; 634       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2152  0232 72115327      	bres	21287,#0
2153  0236 200e          	jra	L3211
2154  0238               L5111:
2155                     ; 641     if (NewState != DISABLE)
2157  0238 0d02          	tnz	(OFST+2,sp)
2158  023a 2706          	jreq	L5211
2159                     ; 643       TIM3->CCER1 |= TIM3_CCER1_CC2E;
2161  023c 72185327      	bset	21287,#4
2163  0240 2004          	jra	L3211
2164  0242               L5211:
2165                     ; 647       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2167  0242 72195327      	bres	21287,#4
2168  0246               L3211:
2169                     ; 650 }
2172  0246 85            	popw	x
2173  0247 87            	retf
2217                     ; 671 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
2217                     ; 672 {
2218                     	switch	.text
2219  0248               f_TIM3_SelectOCxM:
2221  0248 89            	pushw	x
2222       00000000      OFST:	set	0
2225                     ; 674   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2227                     ; 675   assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
2229                     ; 677   if (TIM3_Channel == TIM3_CHANNEL_1)
2231  0249 9e            	ld	a,xh
2232  024a 4d            	tnz	a
2233  024b 2610          	jrne	L3511
2234                     ; 680     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2236  024d 72115327      	bres	21287,#0
2237                     ; 683     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2239  0251 c65325        	ld	a,21285
2240  0254 a48f          	and	a,#143
2241  0256 1a02          	or	a,(OFST+2,sp)
2242  0258 c75325        	ld	21285,a
2244  025b 200e          	jra	L5511
2245  025d               L3511:
2246                     ; 688     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2248  025d 72195327      	bres	21287,#4
2249                     ; 691     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2251  0261 c65326        	ld	a,21286
2252  0264 a48f          	and	a,#143
2253  0266 1a02          	or	a,(OFST+2,sp)
2254  0268 c75326        	ld	21286,a
2255  026b               L5511:
2256                     ; 693 }
2259  026b 85            	popw	x
2260  026c 87            	retf
2291                     ; 701 void TIM3_SetCounter(uint16_t Counter)
2291                     ; 702 {
2292                     	switch	.text
2293  026d               f_TIM3_SetCounter:
2297                     ; 704   TIM3->CNTRH = (uint8_t)(Counter >> 8);
2299  026d 9e            	ld	a,xh
2300  026e c75328        	ld	21288,a
2301                     ; 705   TIM3->CNTRL = (uint8_t)(Counter);
2303  0271 9f            	ld	a,xl
2304  0272 c75329        	ld	21289,a
2305                     ; 706 }
2308  0275 87            	retf
2339                     ; 714 void TIM3_SetAutoreload(uint16_t Autoreload)
2339                     ; 715 {
2340                     	switch	.text
2341  0276               f_TIM3_SetAutoreload:
2345                     ; 717   TIM3->ARRH = (uint8_t)(Autoreload >> 8);
2347  0276 9e            	ld	a,xh
2348  0277 c7532b        	ld	21291,a
2349                     ; 718   TIM3->ARRL = (uint8_t)(Autoreload);
2351  027a 9f            	ld	a,xl
2352  027b c7532c        	ld	21292,a
2353                     ; 719 }
2356  027e 87            	retf
2387                     ; 727 void TIM3_SetCompare1(uint16_t Compare1)
2387                     ; 728 {
2388                     	switch	.text
2389  027f               f_TIM3_SetCompare1:
2393                     ; 730   TIM3->CCR1H = (uint8_t)(Compare1 >> 8);
2395  027f 9e            	ld	a,xh
2396  0280 c7532d        	ld	21293,a
2397                     ; 731   TIM3->CCR1L = (uint8_t)(Compare1);
2399  0283 9f            	ld	a,xl
2400  0284 c7532e        	ld	21294,a
2401                     ; 732 }
2404  0287 87            	retf
2435                     ; 740 void TIM3_SetCompare2(uint16_t Compare2)
2435                     ; 741 {
2436                     	switch	.text
2437  0288               f_TIM3_SetCompare2:
2441                     ; 743   TIM3->CCR2H = (uint8_t)(Compare2 >> 8);
2443  0288 9e            	ld	a,xh
2444  0289 c7532f        	ld	21295,a
2445                     ; 744   TIM3->CCR2L = (uint8_t)(Compare2);
2447  028c 9f            	ld	a,xl
2448  028d c75330        	ld	21296,a
2449                     ; 745 }
2452  0290 87            	retf
2487                     ; 757 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
2487                     ; 758 {
2488                     	switch	.text
2489  0291               f_TIM3_SetIC1Prescaler:
2491  0291 88            	push	a
2492       00000000      OFST:	set	0
2495                     ; 760   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
2497                     ; 763   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC1Prescaler);
2499  0292 c65325        	ld	a,21285
2500  0295 a4f3          	and	a,#243
2501  0297 1a01          	or	a,(OFST+1,sp)
2502  0299 c75325        	ld	21285,a
2503                     ; 764 }
2506  029c 84            	pop	a
2507  029d 87            	retf
2542                     ; 776 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
2542                     ; 777 {
2543                     	switch	.text
2544  029e               f_TIM3_SetIC2Prescaler:
2546  029e 88            	push	a
2547       00000000      OFST:	set	0
2550                     ; 779   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
2552                     ; 782   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC2Prescaler);
2554  029f c65326        	ld	a,21286
2555  02a2 a4f3          	and	a,#243
2556  02a4 1a01          	or	a,(OFST+1,sp)
2557  02a6 c75326        	ld	21286,a
2558                     ; 783 }
2561  02a9 84            	pop	a
2562  02aa 87            	retf
2607                     ; 790 uint16_t TIM3_GetCapture1(void)
2607                     ; 791 {
2608                     	switch	.text
2609  02ab               f_TIM3_GetCapture1:
2611  02ab 5204          	subw	sp,#4
2612       00000004      OFST:	set	4
2615                     ; 793   uint16_t tmpccr1 = 0;
2617                     ; 794   uint8_t tmpccr1l=0, tmpccr1h=0;
2621                     ; 796   tmpccr1h = TIM3->CCR1H;
2623  02ad c6532d        	ld	a,21293
2624  02b0 6b02          	ld	(OFST-2,sp),a
2626                     ; 797   tmpccr1l = TIM3->CCR1L;
2628  02b2 c6532e        	ld	a,21294
2629  02b5 6b01          	ld	(OFST-3,sp),a
2631                     ; 799   tmpccr1 = (uint16_t)(tmpccr1l);
2633  02b7 7b01          	ld	a,(OFST-3,sp)
2634  02b9 5f            	clrw	x
2635  02ba 97            	ld	xl,a
2636  02bb 1f03          	ldw	(OFST-1,sp),x
2638                     ; 800   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
2640  02bd 7b02          	ld	a,(OFST-2,sp)
2641  02bf 5f            	clrw	x
2642  02c0 97            	ld	xl,a
2643  02c1 4f            	clr	a
2644  02c2 02            	rlwa	x,a
2645  02c3 01            	rrwa	x,a
2646  02c4 1a04          	or	a,(OFST+0,sp)
2647  02c6 01            	rrwa	x,a
2648  02c7 1a03          	or	a,(OFST-1,sp)
2649  02c9 01            	rrwa	x,a
2650  02ca 1f03          	ldw	(OFST-1,sp),x
2652                     ; 802   return (uint16_t)tmpccr1;
2654  02cc 1e03          	ldw	x,(OFST-1,sp)
2657  02ce 5b04          	addw	sp,#4
2658  02d0 87            	retf
2703                     ; 810 uint16_t TIM3_GetCapture2(void)
2703                     ; 811 {
2704                     	switch	.text
2705  02d1               f_TIM3_GetCapture2:
2707  02d1 5204          	subw	sp,#4
2708       00000004      OFST:	set	4
2711                     ; 813   uint16_t tmpccr2 = 0;
2713                     ; 814   uint8_t tmpccr2l=0, tmpccr2h=0;
2717                     ; 816   tmpccr2h = TIM3->CCR2H;
2719  02d3 c6532f        	ld	a,21295
2720  02d6 6b02          	ld	(OFST-2,sp),a
2722                     ; 817   tmpccr2l = TIM3->CCR2L;
2724  02d8 c65330        	ld	a,21296
2725  02db 6b01          	ld	(OFST-3,sp),a
2727                     ; 819   tmpccr2 = (uint16_t)(tmpccr2l);
2729  02dd 7b01          	ld	a,(OFST-3,sp)
2730  02df 5f            	clrw	x
2731  02e0 97            	ld	xl,a
2732  02e1 1f03          	ldw	(OFST-1,sp),x
2734                     ; 820   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
2736  02e3 7b02          	ld	a,(OFST-2,sp)
2737  02e5 5f            	clrw	x
2738  02e6 97            	ld	xl,a
2739  02e7 4f            	clr	a
2740  02e8 02            	rlwa	x,a
2741  02e9 01            	rrwa	x,a
2742  02ea 1a04          	or	a,(OFST+0,sp)
2743  02ec 01            	rrwa	x,a
2744  02ed 1a03          	or	a,(OFST-1,sp)
2745  02ef 01            	rrwa	x,a
2746  02f0 1f03          	ldw	(OFST-1,sp),x
2748                     ; 822   return (uint16_t)tmpccr2;
2750  02f2 1e03          	ldw	x,(OFST-1,sp)
2753  02f4 5b04          	addw	sp,#4
2754  02f6 87            	retf
2785                     ; 830 uint16_t TIM3_GetCounter(void)
2785                     ; 831 {
2786                     	switch	.text
2787  02f7               f_TIM3_GetCounter:
2789  02f7 89            	pushw	x
2790       00000002      OFST:	set	2
2793                     ; 832   uint16_t tmpcntr = 0;
2795                     ; 834   tmpcntr = ((uint16_t)TIM3->CNTRH << 8);
2797  02f8 c65328        	ld	a,21288
2798  02fb 5f            	clrw	x
2799  02fc 97            	ld	xl,a
2800  02fd 4f            	clr	a
2801  02fe 02            	rlwa	x,a
2802  02ff 1f01          	ldw	(OFST-1,sp),x
2804                     ; 836   return (uint16_t)( tmpcntr| (uint16_t)(TIM3->CNTRL));
2806  0301 c65329        	ld	a,21289
2807  0304 5f            	clrw	x
2808  0305 97            	ld	xl,a
2809  0306 01            	rrwa	x,a
2810  0307 1a02          	or	a,(OFST+0,sp)
2811  0309 01            	rrwa	x,a
2812  030a 1a01          	or	a,(OFST-1,sp)
2813  030c 01            	rrwa	x,a
2816  030d 5b02          	addw	sp,#2
2817  030f 87            	retf
2840                     ; 844 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
2840                     ; 845 {
2841                     	switch	.text
2842  0310               f_TIM3_GetPrescaler:
2846                     ; 847   return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
2848  0310 c6532a        	ld	a,21290
2851  0313 87            	retf
2971                     ; 861 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
2971                     ; 862 {
2972                     	switch	.text
2973  0314               f_TIM3_GetFlagStatus:
2975  0314 89            	pushw	x
2976  0315 89            	pushw	x
2977       00000002      OFST:	set	2
2980                     ; 863   FlagStatus bitstatus = RESET;
2982                     ; 864   uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
2986                     ; 867   assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
2988                     ; 869   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_FLAG);
2990  0316 9f            	ld	a,xl
2991  0317 c45322        	and	a,21282
2992  031a 6b01          	ld	(OFST-1,sp),a
2994                     ; 870   tim3_flag_h = (uint8_t)((uint16_t)TIM3_FLAG >> 8);
2996  031c 7b03          	ld	a,(OFST+1,sp)
2997  031e 6b02          	ld	(OFST+0,sp),a
2999                     ; 872   if (((tim3_flag_l) | (uint8_t)(TIM3->SR2 & tim3_flag_h)) != (uint8_t)RESET )
3001  0320 c65323        	ld	a,21283
3002  0323 1402          	and	a,(OFST+0,sp)
3003  0325 1a01          	or	a,(OFST-1,sp)
3004  0327 2706          	jreq	L3341
3005                     ; 874     bitstatus = SET;
3007  0329 a601          	ld	a,#1
3008  032b 6b02          	ld	(OFST+0,sp),a
3011  032d 2002          	jra	L5341
3012  032f               L3341:
3013                     ; 878     bitstatus = RESET;
3015  032f 0f02          	clr	(OFST+0,sp)
3017  0331               L5341:
3018                     ; 880   return (FlagStatus)bitstatus;
3020  0331 7b02          	ld	a,(OFST+0,sp)
3023  0333 5b04          	addw	sp,#4
3024  0335 87            	retf
3058                     ; 894 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3058                     ; 895 {
3059                     	switch	.text
3060  0336               f_TIM3_ClearFlag:
3062  0336 89            	pushw	x
3063       00000000      OFST:	set	0
3066                     ; 897   assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
3068                     ; 900   TIM3->SR1 = (uint8_t)(~((uint8_t)(TIM3_FLAG)));
3070  0337 9f            	ld	a,xl
3071  0338 43            	cpl	a
3072  0339 c75322        	ld	21282,a
3073                     ; 901   TIM3->SR2 = (uint8_t)(~((uint8_t)((uint16_t)TIM3_FLAG >> 8)));
3075  033c 7b01          	ld	a,(OFST+1,sp)
3076  033e 43            	cpl	a
3077  033f c75323        	ld	21283,a
3078                     ; 902 }
3081  0342 85            	popw	x
3082  0343 87            	retf
3141                     ; 913 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
3141                     ; 914 {
3142                     	switch	.text
3143  0344               f_TIM3_GetITStatus:
3145  0344 88            	push	a
3146  0345 89            	pushw	x
3147       00000002      OFST:	set	2
3150                     ; 915   ITStatus bitstatus = RESET;
3152                     ; 916   uint8_t TIM3_itStatus = 0, TIM3_itEnable = 0;
3156                     ; 919   assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
3158                     ; 921   TIM3_itStatus = (uint8_t)(TIM3->SR1 & TIM3_IT);
3160  0346 c45322        	and	a,21282
3161  0349 6b01          	ld	(OFST-1,sp),a
3163                     ; 923   TIM3_itEnable = (uint8_t)(TIM3->IER & TIM3_IT);
3165  034b c65321        	ld	a,21281
3166  034e 1403          	and	a,(OFST+1,sp)
3167  0350 6b02          	ld	(OFST+0,sp),a
3169                     ; 925   if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET ))
3171  0352 0d01          	tnz	(OFST-1,sp)
3172  0354 270a          	jreq	L3051
3174  0356 0d02          	tnz	(OFST+0,sp)
3175  0358 2706          	jreq	L3051
3176                     ; 927     bitstatus = SET;
3178  035a a601          	ld	a,#1
3179  035c 6b02          	ld	(OFST+0,sp),a
3182  035e 2002          	jra	L5051
3183  0360               L3051:
3184                     ; 931     bitstatus = RESET;
3186  0360 0f02          	clr	(OFST+0,sp)
3188  0362               L5051:
3189                     ; 933   return (ITStatus)(bitstatus);
3191  0362 7b02          	ld	a,(OFST+0,sp)
3194  0364 5b03          	addw	sp,#3
3195  0366 87            	retf
3230                     ; 945 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
3230                     ; 946 {
3231                     	switch	.text
3232  0367               f_TIM3_ClearITPendingBit:
3236                     ; 948   assert_param(IS_TIM3_IT_OK(TIM3_IT));
3238                     ; 951   TIM3->SR1 = (uint8_t)(~TIM3_IT);
3240  0367 43            	cpl	a
3241  0368 c75322        	ld	21282,a
3242                     ; 952 }
3245  036b 87            	retf
3290                     ; 970 static void TI1_Config(uint8_t TIM3_ICPolarity,
3290                     ; 971                        uint8_t TIM3_ICSelection,
3290                     ; 972                        uint8_t TIM3_ICFilter)
3290                     ; 973 {
3291                     	switch	.text
3292  036c               L3f_TI1_Config:
3294  036c 89            	pushw	x
3295  036d 88            	push	a
3296       00000001      OFST:	set	1
3299                     ; 975   TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
3301  036e 72115327      	bres	21287,#0
3302                     ; 978   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~( TIM3_CCMR_CCxS | TIM3_CCMR_ICxF))) | (uint8_t)(( (TIM3_ICSelection)) | ((uint8_t)( TIM3_ICFilter << 4))));
3304  0372 7b07          	ld	a,(OFST+6,sp)
3305  0374 97            	ld	xl,a
3306  0375 a610          	ld	a,#16
3307  0377 42            	mul	x,a
3308  0378 9f            	ld	a,xl
3309  0379 1a03          	or	a,(OFST+2,sp)
3310  037b 6b01          	ld	(OFST+0,sp),a
3312  037d c65325        	ld	a,21285
3313  0380 a40c          	and	a,#12
3314  0382 1a01          	or	a,(OFST+0,sp)
3315  0384 c75325        	ld	21285,a
3316                     ; 981   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3318  0387 0d02          	tnz	(OFST+1,sp)
3319  0389 2706          	jreq	L5451
3320                     ; 983     TIM3->CCER1 |= TIM3_CCER1_CC1P;
3322  038b 72125327      	bset	21287,#1
3324  038f 2004          	jra	L7451
3325  0391               L5451:
3326                     ; 987     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
3328  0391 72135327      	bres	21287,#1
3329  0395               L7451:
3330                     ; 990   TIM3->CCER1 |= TIM3_CCER1_CC1E;
3332  0395 72105327      	bset	21287,#0
3333                     ; 991 }
3336  0399 5b03          	addw	sp,#3
3337  039b 87            	retf
3382                     ; 1009 static void TI2_Config(uint8_t TIM3_ICPolarity,
3382                     ; 1010                        uint8_t TIM3_ICSelection,
3382                     ; 1011                        uint8_t TIM3_ICFilter)
3382                     ; 1012 {
3383                     	switch	.text
3384  039c               L5f_TI2_Config:
3386  039c 89            	pushw	x
3387  039d 88            	push	a
3388       00000001      OFST:	set	1
3391                     ; 1014   TIM3->CCER1 &=  (uint8_t)(~TIM3_CCER1_CC2E);
3393  039e 72195327      	bres	21287,#4
3394                     ; 1017   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~( TIM3_CCMR_CCxS |
3394                     ; 1018                                                               TIM3_CCMR_ICxF    ))) | (uint8_t)(( (TIM3_ICSelection)) | 
3394                     ; 1019                                                                                                 ((uint8_t)( TIM3_ICFilter << 4))));
3396  03a2 7b07          	ld	a,(OFST+6,sp)
3397  03a4 97            	ld	xl,a
3398  03a5 a610          	ld	a,#16
3399  03a7 42            	mul	x,a
3400  03a8 9f            	ld	a,xl
3401  03a9 1a03          	or	a,(OFST+2,sp)
3402  03ab 6b01          	ld	(OFST+0,sp),a
3404  03ad c65326        	ld	a,21286
3405  03b0 a40c          	and	a,#12
3406  03b2 1a01          	or	a,(OFST+0,sp)
3407  03b4 c75326        	ld	21286,a
3408                     ; 1022   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3410  03b7 0d02          	tnz	(OFST+1,sp)
3411  03b9 2706          	jreq	L1751
3412                     ; 1024     TIM3->CCER1 |= TIM3_CCER1_CC2P;
3414  03bb 721a5327      	bset	21287,#5
3416  03bf 2004          	jra	L3751
3417  03c1               L1751:
3418                     ; 1028     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
3420  03c1 721b5327      	bres	21287,#5
3421  03c5               L3751:
3422                     ; 1032   TIM3->CCER1 |= TIM3_CCER1_CC2E;
3424  03c5 72185327      	bset	21287,#4
3425                     ; 1033 }
3428  03c9 5b03          	addw	sp,#3
3429  03cb 87            	retf
3441                     	xdef	f_TIM3_ClearITPendingBit
3442                     	xdef	f_TIM3_GetITStatus
3443                     	xdef	f_TIM3_ClearFlag
3444                     	xdef	f_TIM3_GetFlagStatus
3445                     	xdef	f_TIM3_GetPrescaler
3446                     	xdef	f_TIM3_GetCounter
3447                     	xdef	f_TIM3_GetCapture2
3448                     	xdef	f_TIM3_GetCapture1
3449                     	xdef	f_TIM3_SetIC2Prescaler
3450                     	xdef	f_TIM3_SetIC1Prescaler
3451                     	xdef	f_TIM3_SetCompare2
3452                     	xdef	f_TIM3_SetCompare1
3453                     	xdef	f_TIM3_SetAutoreload
3454                     	xdef	f_TIM3_SetCounter
3455                     	xdef	f_TIM3_SelectOCxM
3456                     	xdef	f_TIM3_CCxCmd
3457                     	xdef	f_TIM3_OC2PolarityConfig
3458                     	xdef	f_TIM3_OC1PolarityConfig
3459                     	xdef	f_TIM3_GenerateEvent
3460                     	xdef	f_TIM3_OC2PreloadConfig
3461                     	xdef	f_TIM3_OC1PreloadConfig
3462                     	xdef	f_TIM3_ARRPreloadConfig
3463                     	xdef	f_TIM3_ForcedOC2Config
3464                     	xdef	f_TIM3_ForcedOC1Config
3465                     	xdef	f_TIM3_PrescalerConfig
3466                     	xdef	f_TIM3_SelectOnePulseMode
3467                     	xdef	f_TIM3_UpdateRequestConfig
3468                     	xdef	f_TIM3_UpdateDisableConfig
3469                     	xdef	f_TIM3_ITConfig
3470                     	xdef	f_TIM3_Cmd
3471                     	xdef	f_TIM3_PWMIConfig
3472                     	xdef	f_TIM3_ICInit
3473                     	xdef	f_TIM3_OC2Init
3474                     	xdef	f_TIM3_OC1Init
3475                     	xdef	f_TIM3_TimeBaseInit
3476                     	xdef	f_TIM3_DeInit
3495                     	end
