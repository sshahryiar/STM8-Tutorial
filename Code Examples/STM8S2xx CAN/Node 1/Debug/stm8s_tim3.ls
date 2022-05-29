   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
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
 269                     ; 82 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
 269                     ; 83                         uint16_t TIM3_Period)
 269                     ; 84 {
 270                     	switch	.text
 271  0045               _TIM3_TimeBaseInit:
 273  0045 88            	push	a
 274       00000000      OFST:	set	0
 277                     ; 86   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 279  0046 c7532a        	ld	21290,a
 280                     ; 88   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8);
 282  0049 7b04          	ld	a,(OFST+4,sp)
 283  004b c7532b        	ld	21291,a
 284                     ; 89   TIM3->ARRL = (uint8_t)(TIM3_Period);
 286  004e 7b05          	ld	a,(OFST+5,sp)
 287  0050 c7532c        	ld	21292,a
 288                     ; 90 }
 291  0053 84            	pop	a
 292  0054 81            	ret
 447                     ; 100 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 447                     ; 101                   TIM3_OutputState_TypeDef TIM3_OutputState,
 447                     ; 102                   uint16_t TIM3_Pulse,
 447                     ; 103                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 447                     ; 104 {
 448                     	switch	.text
 449  0055               _TIM3_OC1Init:
 451  0055 89            	pushw	x
 452  0056 88            	push	a
 453       00000001      OFST:	set	1
 456                     ; 106   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 458                     ; 107   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 460                     ; 108   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 462                     ; 111   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
 464  0057 c65327        	ld	a,21287
 465  005a a4fc          	and	a,#252
 466  005c c75327        	ld	21287,a
 467                     ; 113   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
 469  005f 7b08          	ld	a,(OFST+7,sp)
 470  0061 a402          	and	a,#2
 471  0063 6b01          	ld	(OFST+0,sp),a
 473  0065 9f            	ld	a,xl
 474  0066 a401          	and	a,#1
 475  0068 1a01          	or	a,(OFST+0,sp)
 476  006a ca5327        	or	a,21287
 477  006d c75327        	ld	21287,a
 478                     ; 116   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 480  0070 c65325        	ld	a,21285
 481  0073 a48f          	and	a,#143
 482  0075 1a02          	or	a,(OFST+1,sp)
 483  0077 c75325        	ld	21285,a
 484                     ; 119   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 486  007a 7b06          	ld	a,(OFST+5,sp)
 487  007c c7532d        	ld	21293,a
 488                     ; 120   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 490  007f 7b07          	ld	a,(OFST+6,sp)
 491  0081 c7532e        	ld	21294,a
 492                     ; 121 }
 495  0084 5b03          	addw	sp,#3
 496  0086 81            	ret
 558                     ; 131 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 558                     ; 132                   TIM3_OutputState_TypeDef TIM3_OutputState,
 558                     ; 133                   uint16_t TIM3_Pulse,
 558                     ; 134                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 558                     ; 135 {
 559                     	switch	.text
 560  0087               _TIM3_OC2Init:
 562  0087 89            	pushw	x
 563  0088 88            	push	a
 564       00000001      OFST:	set	1
 567                     ; 137   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 569                     ; 138   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 571                     ; 139   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 573                     ; 143   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
 575  0089 c65327        	ld	a,21287
 576  008c a4cf          	and	a,#207
 577  008e c75327        	ld	21287,a
 578                     ; 145   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
 580  0091 7b08          	ld	a,(OFST+7,sp)
 581  0093 a420          	and	a,#32
 582  0095 6b01          	ld	(OFST+0,sp),a
 584  0097 9f            	ld	a,xl
 585  0098 a410          	and	a,#16
 586  009a 1a01          	or	a,(OFST+0,sp)
 587  009c ca5327        	or	a,21287
 588  009f c75327        	ld	21287,a
 589                     ; 149   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 591  00a2 c65326        	ld	a,21286
 592  00a5 a48f          	and	a,#143
 593  00a7 1a02          	or	a,(OFST+1,sp)
 594  00a9 c75326        	ld	21286,a
 595                     ; 153   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 597  00ac 7b06          	ld	a,(OFST+5,sp)
 598  00ae c7532f        	ld	21295,a
 599                     ; 154   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 601  00b1 7b07          	ld	a,(OFST+6,sp)
 602  00b3 c75330        	ld	21296,a
 603                     ; 155 }
 606  00b6 5b03          	addw	sp,#3
 607  00b8 81            	ret
 789                     ; 166 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 789                     ; 167                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 789                     ; 168                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 789                     ; 169                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 789                     ; 170                  uint8_t TIM3_ICFilter)
 789                     ; 171 {
 790                     	switch	.text
 791  00b9               _TIM3_ICInit:
 793  00b9 89            	pushw	x
 794       00000000      OFST:	set	0
 797                     ; 173   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
 799                     ; 174   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 801                     ; 175   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 803                     ; 176   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 805                     ; 177   assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
 807                     ; 179   if (TIM3_Channel != TIM3_CHANNEL_2)
 809  00ba 9e            	ld	a,xh
 810  00bb a101          	cp	a,#1
 811  00bd 2714          	jreq	L333
 812                     ; 182     TI1_Config((uint8_t)TIM3_ICPolarity,
 812                     ; 183                (uint8_t)TIM3_ICSelection,
 812                     ; 184                (uint8_t)TIM3_ICFilter);
 814  00bf 7b07          	ld	a,(OFST+7,sp)
 815  00c1 88            	push	a
 816  00c2 7b06          	ld	a,(OFST+6,sp)
 817  00c4 97            	ld	xl,a
 818  00c5 7b03          	ld	a,(OFST+3,sp)
 819  00c7 95            	ld	xh,a
 820  00c8 cd0360        	call	L3_TI1_Config
 822  00cb 84            	pop	a
 823                     ; 187     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
 825  00cc 7b06          	ld	a,(OFST+6,sp)
 826  00ce cd0285        	call	_TIM3_SetIC1Prescaler
 829  00d1 2012          	jra	L533
 830  00d3               L333:
 831                     ; 192     TI2_Config((uint8_t)TIM3_ICPolarity,
 831                     ; 193                (uint8_t)TIM3_ICSelection,
 831                     ; 194                (uint8_t)TIM3_ICFilter);
 833  00d3 7b07          	ld	a,(OFST+7,sp)
 834  00d5 88            	push	a
 835  00d6 7b06          	ld	a,(OFST+6,sp)
 836  00d8 97            	ld	xl,a
 837  00d9 7b03          	ld	a,(OFST+3,sp)
 838  00db 95            	ld	xh,a
 839  00dc cd0390        	call	L5_TI2_Config
 841  00df 84            	pop	a
 842                     ; 197     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
 844  00e0 7b06          	ld	a,(OFST+6,sp)
 845  00e2 cd0292        	call	_TIM3_SetIC2Prescaler
 847  00e5               L533:
 848                     ; 199 }
 851  00e5 85            	popw	x
 852  00e6 81            	ret
 942                     ; 210 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
 942                     ; 211                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 942                     ; 212                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
 942                     ; 213                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 942                     ; 214                      uint8_t TIM3_ICFilter)
 942                     ; 215 {
 943                     	switch	.text
 944  00e7               _TIM3_PWMIConfig:
 946  00e7 89            	pushw	x
 947  00e8 89            	pushw	x
 948       00000002      OFST:	set	2
 951                     ; 216   uint8_t icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 953                     ; 217   uint8_t icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
 955                     ; 220   assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
 957                     ; 221   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 959                     ; 222   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 961                     ; 223   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 963                     ; 226   if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
 965  00e9 9f            	ld	a,xl
 966  00ea a144          	cp	a,#68
 967  00ec 2706          	jreq	L773
 968                     ; 228     icpolarity = (uint8_t)TIM3_ICPOLARITY_FALLING;
 970  00ee a644          	ld	a,#68
 971  00f0 6b01          	ld	(OFST-1,sp),a
 974  00f2 2002          	jra	L104
 975  00f4               L773:
 976                     ; 232     icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 978  00f4 0f01          	clr	(OFST-1,sp)
 980  00f6               L104:
 981                     ; 236   if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
 983  00f6 7b07          	ld	a,(OFST+5,sp)
 984  00f8 a101          	cp	a,#1
 985  00fa 2606          	jrne	L304
 986                     ; 238     icselection = (uint8_t)TIM3_ICSELECTION_INDIRECTTI;
 988  00fc a602          	ld	a,#2
 989  00fe 6b02          	ld	(OFST+0,sp),a
 992  0100 2004          	jra	L504
 993  0102               L304:
 994                     ; 242     icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
 996  0102 a601          	ld	a,#1
 997  0104 6b02          	ld	(OFST+0,sp),a
 999  0106               L504:
1000                     ; 245   if (TIM3_Channel != TIM3_CHANNEL_2)
1002  0106 7b03          	ld	a,(OFST+1,sp)
1003  0108 a101          	cp	a,#1
1004  010a 2726          	jreq	L704
1005                     ; 248     TI1_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1005                     ; 249                (uint8_t)TIM3_ICFilter);
1007  010c 7b09          	ld	a,(OFST+7,sp)
1008  010e 88            	push	a
1009  010f 7b08          	ld	a,(OFST+6,sp)
1010  0111 97            	ld	xl,a
1011  0112 7b05          	ld	a,(OFST+3,sp)
1012  0114 95            	ld	xh,a
1013  0115 cd0360        	call	L3_TI1_Config
1015  0118 84            	pop	a
1016                     ; 252     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1018  0119 7b08          	ld	a,(OFST+6,sp)
1019  011b cd0285        	call	_TIM3_SetIC1Prescaler
1021                     ; 255     TI2_Config(icpolarity, icselection, TIM3_ICFilter);
1023  011e 7b09          	ld	a,(OFST+7,sp)
1024  0120 88            	push	a
1025  0121 7b03          	ld	a,(OFST+1,sp)
1026  0123 97            	ld	xl,a
1027  0124 7b02          	ld	a,(OFST+0,sp)
1028  0126 95            	ld	xh,a
1029  0127 cd0390        	call	L5_TI2_Config
1031  012a 84            	pop	a
1032                     ; 258     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1034  012b 7b08          	ld	a,(OFST+6,sp)
1035  012d cd0292        	call	_TIM3_SetIC2Prescaler
1038  0130 2024          	jra	L114
1039  0132               L704:
1040                     ; 263     TI2_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1040                     ; 264                (uint8_t)TIM3_ICFilter);
1042  0132 7b09          	ld	a,(OFST+7,sp)
1043  0134 88            	push	a
1044  0135 7b08          	ld	a,(OFST+6,sp)
1045  0137 97            	ld	xl,a
1046  0138 7b05          	ld	a,(OFST+3,sp)
1047  013a 95            	ld	xh,a
1048  013b cd0390        	call	L5_TI2_Config
1050  013e 84            	pop	a
1051                     ; 267     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1053  013f 7b08          	ld	a,(OFST+6,sp)
1054  0141 cd0292        	call	_TIM3_SetIC2Prescaler
1056                     ; 270     TI1_Config(icpolarity, icselection, TIM3_ICFilter);
1058  0144 7b09          	ld	a,(OFST+7,sp)
1059  0146 88            	push	a
1060  0147 7b03          	ld	a,(OFST+1,sp)
1061  0149 97            	ld	xl,a
1062  014a 7b02          	ld	a,(OFST+0,sp)
1063  014c 95            	ld	xh,a
1064  014d cd0360        	call	L3_TI1_Config
1066  0150 84            	pop	a
1067                     ; 273     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1069  0151 7b08          	ld	a,(OFST+6,sp)
1070  0153 cd0285        	call	_TIM3_SetIC1Prescaler
1072  0156               L114:
1073                     ; 275 }
1076  0156 5b04          	addw	sp,#4
1077  0158 81            	ret
1132                     ; 283 void TIM3_Cmd(FunctionalState NewState)
1132                     ; 284 {
1133                     	switch	.text
1134  0159               _TIM3_Cmd:
1138                     ; 286   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1140                     ; 289   if (NewState != DISABLE)
1142  0159 4d            	tnz	a
1143  015a 2706          	jreq	L144
1144                     ; 291     TIM3->CR1 |= (uint8_t)TIM3_CR1_CEN;
1146  015c 72105320      	bset	21280,#0
1148  0160 2004          	jra	L344
1149  0162               L144:
1150                     ; 295     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_CEN);
1152  0162 72115320      	bres	21280,#0
1153  0166               L344:
1154                     ; 297 }
1157  0166 81            	ret
1229                     ; 311 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1229                     ; 312 {
1230                     	switch	.text
1231  0167               _TIM3_ITConfig:
1233  0167 89            	pushw	x
1234       00000000      OFST:	set	0
1237                     ; 314   assert_param(IS_TIM3_IT_OK(TIM3_IT));
1239                     ; 315   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1241                     ; 317   if (NewState != DISABLE)
1243  0168 9f            	ld	a,xl
1244  0169 4d            	tnz	a
1245  016a 2709          	jreq	L105
1246                     ; 320     TIM3->IER |= (uint8_t)TIM3_IT;
1248  016c 9e            	ld	a,xh
1249  016d ca5321        	or	a,21281
1250  0170 c75321        	ld	21281,a
1252  0173 2009          	jra	L305
1253  0175               L105:
1254                     ; 325     TIM3->IER &= (uint8_t)(~TIM3_IT);
1256  0175 7b01          	ld	a,(OFST+1,sp)
1257  0177 43            	cpl	a
1258  0178 c45321        	and	a,21281
1259  017b c75321        	ld	21281,a
1260  017e               L305:
1261                     ; 327 }
1264  017e 85            	popw	x
1265  017f 81            	ret
1301                     ; 335 void TIM3_UpdateDisableConfig(FunctionalState NewState)
1301                     ; 336 {
1302                     	switch	.text
1303  0180               _TIM3_UpdateDisableConfig:
1307                     ; 338   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1309                     ; 341   if (NewState != DISABLE)
1311  0180 4d            	tnz	a
1312  0181 2706          	jreq	L325
1313                     ; 343     TIM3->CR1 |= TIM3_CR1_UDIS;
1315  0183 72125320      	bset	21280,#1
1317  0187 2004          	jra	L525
1318  0189               L325:
1319                     ; 347     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_UDIS);
1321  0189 72135320      	bres	21280,#1
1322  018d               L525:
1323                     ; 349 }
1326  018d 81            	ret
1384                     ; 359 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
1384                     ; 360 {
1385                     	switch	.text
1386  018e               _TIM3_UpdateRequestConfig:
1390                     ; 362   assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
1392                     ; 365   if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
1394  018e 4d            	tnz	a
1395  018f 2706          	jreq	L555
1396                     ; 367     TIM3->CR1 |= TIM3_CR1_URS;
1398  0191 72145320      	bset	21280,#2
1400  0195 2004          	jra	L755
1401  0197               L555:
1402                     ; 371     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_URS);
1404  0197 72155320      	bres	21280,#2
1405  019b               L755:
1406                     ; 373 }
1409  019b 81            	ret
1466                     ; 383 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1466                     ; 384 {
1467                     	switch	.text
1468  019c               _TIM3_SelectOnePulseMode:
1472                     ; 386   assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
1474                     ; 389   if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
1476  019c 4d            	tnz	a
1477  019d 2706          	jreq	L706
1478                     ; 391     TIM3->CR1 |= TIM3_CR1_OPM;
1480  019f 72165320      	bset	21280,#3
1482  01a3 2004          	jra	L116
1483  01a5               L706:
1484                     ; 395     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_OPM);
1486  01a5 72175320      	bres	21280,#3
1487  01a9               L116:
1488                     ; 397 }
1491  01a9 81            	ret
1559                     ; 427 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
1559                     ; 428                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
1559                     ; 429 {
1560                     	switch	.text
1561  01aa               _TIM3_PrescalerConfig:
1565                     ; 431   assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
1567                     ; 432   assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
1569                     ; 435   TIM3->PSCR = (uint8_t)Prescaler;
1571  01aa 9e            	ld	a,xh
1572  01ab c7532a        	ld	21290,a
1573                     ; 438   TIM3->EGR = (uint8_t)TIM3_PSCReloadMode;
1575  01ae 9f            	ld	a,xl
1576  01af c75324        	ld	21284,a
1577                     ; 439 }
1580  01b2 81            	ret
1638                     ; 450 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1638                     ; 451 {
1639                     	switch	.text
1640  01b3               _TIM3_ForcedOC1Config:
1642  01b3 88            	push	a
1643       00000000      OFST:	set	0
1646                     ; 453   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1648                     ; 456   TIM3->CCMR1 =  (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM))  | (uint8_t)TIM3_ForcedAction);
1650  01b4 c65325        	ld	a,21285
1651  01b7 a48f          	and	a,#143
1652  01b9 1a01          	or	a,(OFST+1,sp)
1653  01bb c75325        	ld	21285,a
1654                     ; 457 }
1657  01be 84            	pop	a
1658  01bf 81            	ret
1694                     ; 468 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1694                     ; 469 {
1695                     	switch	.text
1696  01c0               _TIM3_ForcedOC2Config:
1698  01c0 88            	push	a
1699       00000000      OFST:	set	0
1702                     ; 471   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1704                     ; 474   TIM3->CCMR2 =  (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_ForcedAction);
1706  01c1 c65326        	ld	a,21286
1707  01c4 a48f          	and	a,#143
1708  01c6 1a01          	or	a,(OFST+1,sp)
1709  01c8 c75326        	ld	21286,a
1710                     ; 475 }
1713  01cb 84            	pop	a
1714  01cc 81            	ret
1750                     ; 483 void TIM3_ARRPreloadConfig(FunctionalState NewState)
1750                     ; 484 {
1751                     	switch	.text
1752  01cd               _TIM3_ARRPreloadConfig:
1756                     ; 486   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1758                     ; 489   if (NewState != DISABLE)
1760  01cd 4d            	tnz	a
1761  01ce 2706          	jreq	L727
1762                     ; 491     TIM3->CR1 |= TIM3_CR1_ARPE;
1764  01d0 721e5320      	bset	21280,#7
1766  01d4 2004          	jra	L137
1767  01d6               L727:
1768                     ; 495     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_ARPE);
1770  01d6 721f5320      	bres	21280,#7
1771  01da               L137:
1772                     ; 497 }
1775  01da 81            	ret
1811                     ; 505 void TIM3_OC1PreloadConfig(FunctionalState NewState)
1811                     ; 506 {
1812                     	switch	.text
1813  01db               _TIM3_OC1PreloadConfig:
1817                     ; 508   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1819                     ; 511   if (NewState != DISABLE)
1821  01db 4d            	tnz	a
1822  01dc 2706          	jreq	L157
1823                     ; 513     TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
1825  01de 72165325      	bset	21285,#3
1827  01e2 2004          	jra	L357
1828  01e4               L157:
1829                     ; 517     TIM3->CCMR1 &= (uint8_t)(~TIM3_CCMR_OCxPE);
1831  01e4 72175325      	bres	21285,#3
1832  01e8               L357:
1833                     ; 519 }
1836  01e8 81            	ret
1872                     ; 527 void TIM3_OC2PreloadConfig(FunctionalState NewState)
1872                     ; 528 {
1873                     	switch	.text
1874  01e9               _TIM3_OC2PreloadConfig:
1878                     ; 530   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1880                     ; 533   if (NewState != DISABLE)
1882  01e9 4d            	tnz	a
1883  01ea 2706          	jreq	L377
1884                     ; 535     TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
1886  01ec 72165326      	bset	21286,#3
1888  01f0 2004          	jra	L577
1889  01f2               L377:
1890                     ; 539     TIM3->CCMR2 &= (uint8_t)(~TIM3_CCMR_OCxPE);
1892  01f2 72175326      	bres	21286,#3
1893  01f6               L577:
1894                     ; 541 }
1897  01f6 81            	ret
1962                     ; 552 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
1962                     ; 553 {
1963                     	switch	.text
1964  01f7               _TIM3_GenerateEvent:
1968                     ; 555   assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
1970                     ; 558   TIM3->EGR = (uint8_t)TIM3_EventSource;
1972  01f7 c75324        	ld	21284,a
1973                     ; 559 }
1976  01fa 81            	ret
2012                     ; 569 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2012                     ; 570 {
2013                     	switch	.text
2014  01fb               _TIM3_OC1PolarityConfig:
2018                     ; 572   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2020                     ; 575   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2022  01fb 4d            	tnz	a
2023  01fc 2706          	jreq	L5401
2024                     ; 577     TIM3->CCER1 |= TIM3_CCER1_CC1P;
2026  01fe 72125327      	bset	21287,#1
2028  0202 2004          	jra	L7401
2029  0204               L5401:
2030                     ; 581     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
2032  0204 72135327      	bres	21287,#1
2033  0208               L7401:
2034                     ; 583 }
2037  0208 81            	ret
2073                     ; 593 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2073                     ; 594 {
2074                     	switch	.text
2075  0209               _TIM3_OC2PolarityConfig:
2079                     ; 596   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2081                     ; 599   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2083  0209 4d            	tnz	a
2084  020a 2706          	jreq	L7601
2085                     ; 601     TIM3->CCER1 |= TIM3_CCER1_CC2P;
2087  020c 721a5327      	bset	21287,#5
2089  0210 2004          	jra	L1701
2090  0212               L7601:
2091                     ; 605     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
2093  0212 721b5327      	bres	21287,#5
2094  0216               L1701:
2095                     ; 607 }
2098  0216 81            	ret
2143                     ; 619 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
2143                     ; 620 {
2144                     	switch	.text
2145  0217               _TIM3_CCxCmd:
2147  0217 89            	pushw	x
2148       00000000      OFST:	set	0
2151                     ; 622   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2153                     ; 623   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2155                     ; 625   if (TIM3_Channel == TIM3_CHANNEL_1)
2157  0218 9e            	ld	a,xh
2158  0219 4d            	tnz	a
2159  021a 2610          	jrne	L5111
2160                     ; 628     if (NewState != DISABLE)
2162  021c 9f            	ld	a,xl
2163  021d 4d            	tnz	a
2164  021e 2706          	jreq	L7111
2165                     ; 630       TIM3->CCER1 |= TIM3_CCER1_CC1E;
2167  0220 72105327      	bset	21287,#0
2169  0224 2014          	jra	L3211
2170  0226               L7111:
2171                     ; 634       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2173  0226 72115327      	bres	21287,#0
2174  022a 200e          	jra	L3211
2175  022c               L5111:
2176                     ; 641     if (NewState != DISABLE)
2178  022c 0d02          	tnz	(OFST+2,sp)
2179  022e 2706          	jreq	L5211
2180                     ; 643       TIM3->CCER1 |= TIM3_CCER1_CC2E;
2182  0230 72185327      	bset	21287,#4
2184  0234 2004          	jra	L3211
2185  0236               L5211:
2186                     ; 647       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2188  0236 72195327      	bres	21287,#4
2189  023a               L3211:
2190                     ; 650 }
2193  023a 85            	popw	x
2194  023b 81            	ret
2239                     ; 671 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
2239                     ; 672 {
2240                     	switch	.text
2241  023c               _TIM3_SelectOCxM:
2243  023c 89            	pushw	x
2244       00000000      OFST:	set	0
2247                     ; 674   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2249                     ; 675   assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
2251                     ; 677   if (TIM3_Channel == TIM3_CHANNEL_1)
2253  023d 9e            	ld	a,xh
2254  023e 4d            	tnz	a
2255  023f 2610          	jrne	L3511
2256                     ; 680     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2258  0241 72115327      	bres	21287,#0
2259                     ; 683     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2261  0245 c65325        	ld	a,21285
2262  0248 a48f          	and	a,#143
2263  024a 1a02          	or	a,(OFST+2,sp)
2264  024c c75325        	ld	21285,a
2266  024f 200e          	jra	L5511
2267  0251               L3511:
2268                     ; 688     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2270  0251 72195327      	bres	21287,#4
2271                     ; 691     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2273  0255 c65326        	ld	a,21286
2274  0258 a48f          	and	a,#143
2275  025a 1a02          	or	a,(OFST+2,sp)
2276  025c c75326        	ld	21286,a
2277  025f               L5511:
2278                     ; 693 }
2281  025f 85            	popw	x
2282  0260 81            	ret
2314                     ; 701 void TIM3_SetCounter(uint16_t Counter)
2314                     ; 702 {
2315                     	switch	.text
2316  0261               _TIM3_SetCounter:
2320                     ; 704   TIM3->CNTRH = (uint8_t)(Counter >> 8);
2322  0261 9e            	ld	a,xh
2323  0262 c75328        	ld	21288,a
2324                     ; 705   TIM3->CNTRL = (uint8_t)(Counter);
2326  0265 9f            	ld	a,xl
2327  0266 c75329        	ld	21289,a
2328                     ; 706 }
2331  0269 81            	ret
2363                     ; 714 void TIM3_SetAutoreload(uint16_t Autoreload)
2363                     ; 715 {
2364                     	switch	.text
2365  026a               _TIM3_SetAutoreload:
2369                     ; 717   TIM3->ARRH = (uint8_t)(Autoreload >> 8);
2371  026a 9e            	ld	a,xh
2372  026b c7532b        	ld	21291,a
2373                     ; 718   TIM3->ARRL = (uint8_t)(Autoreload);
2375  026e 9f            	ld	a,xl
2376  026f c7532c        	ld	21292,a
2377                     ; 719 }
2380  0272 81            	ret
2412                     ; 727 void TIM3_SetCompare1(uint16_t Compare1)
2412                     ; 728 {
2413                     	switch	.text
2414  0273               _TIM3_SetCompare1:
2418                     ; 730   TIM3->CCR1H = (uint8_t)(Compare1 >> 8);
2420  0273 9e            	ld	a,xh
2421  0274 c7532d        	ld	21293,a
2422                     ; 731   TIM3->CCR1L = (uint8_t)(Compare1);
2424  0277 9f            	ld	a,xl
2425  0278 c7532e        	ld	21294,a
2426                     ; 732 }
2429  027b 81            	ret
2461                     ; 740 void TIM3_SetCompare2(uint16_t Compare2)
2461                     ; 741 {
2462                     	switch	.text
2463  027c               _TIM3_SetCompare2:
2467                     ; 743   TIM3->CCR2H = (uint8_t)(Compare2 >> 8);
2469  027c 9e            	ld	a,xh
2470  027d c7532f        	ld	21295,a
2471                     ; 744   TIM3->CCR2L = (uint8_t)(Compare2);
2473  0280 9f            	ld	a,xl
2474  0281 c75330        	ld	21296,a
2475                     ; 745 }
2478  0284 81            	ret
2514                     ; 757 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
2514                     ; 758 {
2515                     	switch	.text
2516  0285               _TIM3_SetIC1Prescaler:
2518  0285 88            	push	a
2519       00000000      OFST:	set	0
2522                     ; 760   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
2524                     ; 763   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC1Prescaler);
2526  0286 c65325        	ld	a,21285
2527  0289 a4f3          	and	a,#243
2528  028b 1a01          	or	a,(OFST+1,sp)
2529  028d c75325        	ld	21285,a
2530                     ; 764 }
2533  0290 84            	pop	a
2534  0291 81            	ret
2570                     ; 776 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
2570                     ; 777 {
2571                     	switch	.text
2572  0292               _TIM3_SetIC2Prescaler:
2574  0292 88            	push	a
2575       00000000      OFST:	set	0
2578                     ; 779   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
2580                     ; 782   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC2Prescaler);
2582  0293 c65326        	ld	a,21286
2583  0296 a4f3          	and	a,#243
2584  0298 1a01          	or	a,(OFST+1,sp)
2585  029a c75326        	ld	21286,a
2586                     ; 783 }
2589  029d 84            	pop	a
2590  029e 81            	ret
2636                     ; 790 uint16_t TIM3_GetCapture1(void)
2636                     ; 791 {
2637                     	switch	.text
2638  029f               _TIM3_GetCapture1:
2640  029f 5204          	subw	sp,#4
2641       00000004      OFST:	set	4
2644                     ; 793   uint16_t tmpccr1 = 0;
2646                     ; 794   uint8_t tmpccr1l=0, tmpccr1h=0;
2650                     ; 796   tmpccr1h = TIM3->CCR1H;
2652  02a1 c6532d        	ld	a,21293
2653  02a4 6b02          	ld	(OFST-2,sp),a
2655                     ; 797   tmpccr1l = TIM3->CCR1L;
2657  02a6 c6532e        	ld	a,21294
2658  02a9 6b01          	ld	(OFST-3,sp),a
2660                     ; 799   tmpccr1 = (uint16_t)(tmpccr1l);
2662  02ab 7b01          	ld	a,(OFST-3,sp)
2663  02ad 5f            	clrw	x
2664  02ae 97            	ld	xl,a
2665  02af 1f03          	ldw	(OFST-1,sp),x
2667                     ; 800   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
2669  02b1 7b02          	ld	a,(OFST-2,sp)
2670  02b3 5f            	clrw	x
2671  02b4 97            	ld	xl,a
2672  02b5 4f            	clr	a
2673  02b6 02            	rlwa	x,a
2674  02b7 01            	rrwa	x,a
2675  02b8 1a04          	or	a,(OFST+0,sp)
2676  02ba 01            	rrwa	x,a
2677  02bb 1a03          	or	a,(OFST-1,sp)
2678  02bd 01            	rrwa	x,a
2679  02be 1f03          	ldw	(OFST-1,sp),x
2681                     ; 802   return (uint16_t)tmpccr1;
2683  02c0 1e03          	ldw	x,(OFST-1,sp)
2686  02c2 5b04          	addw	sp,#4
2687  02c4 81            	ret
2733                     ; 810 uint16_t TIM3_GetCapture2(void)
2733                     ; 811 {
2734                     	switch	.text
2735  02c5               _TIM3_GetCapture2:
2737  02c5 5204          	subw	sp,#4
2738       00000004      OFST:	set	4
2741                     ; 813   uint16_t tmpccr2 = 0;
2743                     ; 814   uint8_t tmpccr2l=0, tmpccr2h=0;
2747                     ; 816   tmpccr2h = TIM3->CCR2H;
2749  02c7 c6532f        	ld	a,21295
2750  02ca 6b02          	ld	(OFST-2,sp),a
2752                     ; 817   tmpccr2l = TIM3->CCR2L;
2754  02cc c65330        	ld	a,21296
2755  02cf 6b01          	ld	(OFST-3,sp),a
2757                     ; 819   tmpccr2 = (uint16_t)(tmpccr2l);
2759  02d1 7b01          	ld	a,(OFST-3,sp)
2760  02d3 5f            	clrw	x
2761  02d4 97            	ld	xl,a
2762  02d5 1f03          	ldw	(OFST-1,sp),x
2764                     ; 820   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
2766  02d7 7b02          	ld	a,(OFST-2,sp)
2767  02d9 5f            	clrw	x
2768  02da 97            	ld	xl,a
2769  02db 4f            	clr	a
2770  02dc 02            	rlwa	x,a
2771  02dd 01            	rrwa	x,a
2772  02de 1a04          	or	a,(OFST+0,sp)
2773  02e0 01            	rrwa	x,a
2774  02e1 1a03          	or	a,(OFST-1,sp)
2775  02e3 01            	rrwa	x,a
2776  02e4 1f03          	ldw	(OFST-1,sp),x
2778                     ; 822   return (uint16_t)tmpccr2;
2780  02e6 1e03          	ldw	x,(OFST-1,sp)
2783  02e8 5b04          	addw	sp,#4
2784  02ea 81            	ret
2816                     ; 830 uint16_t TIM3_GetCounter(void)
2816                     ; 831 {
2817                     	switch	.text
2818  02eb               _TIM3_GetCounter:
2820  02eb 89            	pushw	x
2821       00000002      OFST:	set	2
2824                     ; 832   uint16_t tmpcntr = 0;
2826                     ; 834   tmpcntr = ((uint16_t)TIM3->CNTRH << 8);
2828  02ec c65328        	ld	a,21288
2829  02ef 5f            	clrw	x
2830  02f0 97            	ld	xl,a
2831  02f1 4f            	clr	a
2832  02f2 02            	rlwa	x,a
2833  02f3 1f01          	ldw	(OFST-1,sp),x
2835                     ; 836   return (uint16_t)( tmpcntr| (uint16_t)(TIM3->CNTRL));
2837  02f5 c65329        	ld	a,21289
2838  02f8 5f            	clrw	x
2839  02f9 97            	ld	xl,a
2840  02fa 01            	rrwa	x,a
2841  02fb 1a02          	or	a,(OFST+0,sp)
2842  02fd 01            	rrwa	x,a
2843  02fe 1a01          	or	a,(OFST-1,sp)
2844  0300 01            	rrwa	x,a
2847  0301 5b02          	addw	sp,#2
2848  0303 81            	ret
2872                     ; 844 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
2872                     ; 845 {
2873                     	switch	.text
2874  0304               _TIM3_GetPrescaler:
2878                     ; 847   return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
2880  0304 c6532a        	ld	a,21290
2883  0307 81            	ret
3004                     ; 861 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
3004                     ; 862 {
3005                     	switch	.text
3006  0308               _TIM3_GetFlagStatus:
3008  0308 89            	pushw	x
3009  0309 89            	pushw	x
3010       00000002      OFST:	set	2
3013                     ; 863   FlagStatus bitstatus = RESET;
3015                     ; 864   uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
3019                     ; 867   assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
3021                     ; 869   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_FLAG);
3023  030a 9f            	ld	a,xl
3024  030b c45322        	and	a,21282
3025  030e 6b01          	ld	(OFST-1,sp),a
3027                     ; 870   tim3_flag_h = (uint8_t)((uint16_t)TIM3_FLAG >> 8);
3029  0310 7b03          	ld	a,(OFST+1,sp)
3030  0312 6b02          	ld	(OFST+0,sp),a
3032                     ; 872   if (((tim3_flag_l) | (uint8_t)(TIM3->SR2 & tim3_flag_h)) != (uint8_t)RESET )
3034  0314 c65323        	ld	a,21283
3035  0317 1402          	and	a,(OFST+0,sp)
3036  0319 1a01          	or	a,(OFST-1,sp)
3037  031b 2706          	jreq	L3341
3038                     ; 874     bitstatus = SET;
3040  031d a601          	ld	a,#1
3041  031f 6b02          	ld	(OFST+0,sp),a
3044  0321 2002          	jra	L5341
3045  0323               L3341:
3046                     ; 878     bitstatus = RESET;
3048  0323 0f02          	clr	(OFST+0,sp)
3050  0325               L5341:
3051                     ; 880   return (FlagStatus)bitstatus;
3053  0325 7b02          	ld	a,(OFST+0,sp)
3056  0327 5b04          	addw	sp,#4
3057  0329 81            	ret
3092                     ; 894 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3092                     ; 895 {
3093                     	switch	.text
3094  032a               _TIM3_ClearFlag:
3096  032a 89            	pushw	x
3097       00000000      OFST:	set	0
3100                     ; 897   assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
3102                     ; 900   TIM3->SR1 = (uint8_t)(~((uint8_t)(TIM3_FLAG)));
3104  032b 9f            	ld	a,xl
3105  032c 43            	cpl	a
3106  032d c75322        	ld	21282,a
3107                     ; 901   TIM3->SR2 = (uint8_t)(~((uint8_t)((uint16_t)TIM3_FLAG >> 8)));
3109  0330 7b01          	ld	a,(OFST+1,sp)
3110  0332 43            	cpl	a
3111  0333 c75323        	ld	21283,a
3112                     ; 902 }
3115  0336 85            	popw	x
3116  0337 81            	ret
3176                     ; 913 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
3176                     ; 914 {
3177                     	switch	.text
3178  0338               _TIM3_GetITStatus:
3180  0338 88            	push	a
3181  0339 89            	pushw	x
3182       00000002      OFST:	set	2
3185                     ; 915   ITStatus bitstatus = RESET;
3187                     ; 916   uint8_t TIM3_itStatus = 0, TIM3_itEnable = 0;
3191                     ; 919   assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
3193                     ; 921   TIM3_itStatus = (uint8_t)(TIM3->SR1 & TIM3_IT);
3195  033a c45322        	and	a,21282
3196  033d 6b01          	ld	(OFST-1,sp),a
3198                     ; 923   TIM3_itEnable = (uint8_t)(TIM3->IER & TIM3_IT);
3200  033f c65321        	ld	a,21281
3201  0342 1403          	and	a,(OFST+1,sp)
3202  0344 6b02          	ld	(OFST+0,sp),a
3204                     ; 925   if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET ))
3206  0346 0d01          	tnz	(OFST-1,sp)
3207  0348 270a          	jreq	L3051
3209  034a 0d02          	tnz	(OFST+0,sp)
3210  034c 2706          	jreq	L3051
3211                     ; 927     bitstatus = SET;
3213  034e a601          	ld	a,#1
3214  0350 6b02          	ld	(OFST+0,sp),a
3217  0352 2002          	jra	L5051
3218  0354               L3051:
3219                     ; 931     bitstatus = RESET;
3221  0354 0f02          	clr	(OFST+0,sp)
3223  0356               L5051:
3224                     ; 933   return (ITStatus)(bitstatus);
3226  0356 7b02          	ld	a,(OFST+0,sp)
3229  0358 5b03          	addw	sp,#3
3230  035a 81            	ret
3266                     ; 945 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
3266                     ; 946 {
3267                     	switch	.text
3268  035b               _TIM3_ClearITPendingBit:
3272                     ; 948   assert_param(IS_TIM3_IT_OK(TIM3_IT));
3274                     ; 951   TIM3->SR1 = (uint8_t)(~TIM3_IT);
3276  035b 43            	cpl	a
3277  035c c75322        	ld	21282,a
3278                     ; 952 }
3281  035f 81            	ret
3327                     ; 970 static void TI1_Config(uint8_t TIM3_ICPolarity,
3327                     ; 971                        uint8_t TIM3_ICSelection,
3327                     ; 972                        uint8_t TIM3_ICFilter)
3327                     ; 973 {
3328                     	switch	.text
3329  0360               L3_TI1_Config:
3331  0360 89            	pushw	x
3332  0361 88            	push	a
3333       00000001      OFST:	set	1
3336                     ; 975   TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
3338  0362 72115327      	bres	21287,#0
3339                     ; 978   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~( TIM3_CCMR_CCxS | TIM3_CCMR_ICxF))) | (uint8_t)(( (TIM3_ICSelection)) | ((uint8_t)( TIM3_ICFilter << 4))));
3341  0366 7b06          	ld	a,(OFST+5,sp)
3342  0368 97            	ld	xl,a
3343  0369 a610          	ld	a,#16
3344  036b 42            	mul	x,a
3345  036c 9f            	ld	a,xl
3346  036d 1a03          	or	a,(OFST+2,sp)
3347  036f 6b01          	ld	(OFST+0,sp),a
3349  0371 c65325        	ld	a,21285
3350  0374 a40c          	and	a,#12
3351  0376 1a01          	or	a,(OFST+0,sp)
3352  0378 c75325        	ld	21285,a
3353                     ; 981   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3355  037b 0d02          	tnz	(OFST+1,sp)
3356  037d 2706          	jreq	L5451
3357                     ; 983     TIM3->CCER1 |= TIM3_CCER1_CC1P;
3359  037f 72125327      	bset	21287,#1
3361  0383 2004          	jra	L7451
3362  0385               L5451:
3363                     ; 987     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
3365  0385 72135327      	bres	21287,#1
3366  0389               L7451:
3367                     ; 990   TIM3->CCER1 |= TIM3_CCER1_CC1E;
3369  0389 72105327      	bset	21287,#0
3370                     ; 991 }
3373  038d 5b03          	addw	sp,#3
3374  038f 81            	ret
3420                     ; 1009 static void TI2_Config(uint8_t TIM3_ICPolarity,
3420                     ; 1010                        uint8_t TIM3_ICSelection,
3420                     ; 1011                        uint8_t TIM3_ICFilter)
3420                     ; 1012 {
3421                     	switch	.text
3422  0390               L5_TI2_Config:
3424  0390 89            	pushw	x
3425  0391 88            	push	a
3426       00000001      OFST:	set	1
3429                     ; 1014   TIM3->CCER1 &=  (uint8_t)(~TIM3_CCER1_CC2E);
3431  0392 72195327      	bres	21287,#4
3432                     ; 1017   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~( TIM3_CCMR_CCxS |
3432                     ; 1018                                                               TIM3_CCMR_ICxF    ))) | (uint8_t)(( (TIM3_ICSelection)) | 
3432                     ; 1019                                                                                                 ((uint8_t)( TIM3_ICFilter << 4))));
3434  0396 7b06          	ld	a,(OFST+5,sp)
3435  0398 97            	ld	xl,a
3436  0399 a610          	ld	a,#16
3437  039b 42            	mul	x,a
3438  039c 9f            	ld	a,xl
3439  039d 1a03          	or	a,(OFST+2,sp)
3440  039f 6b01          	ld	(OFST+0,sp),a
3442  03a1 c65326        	ld	a,21286
3443  03a4 a40c          	and	a,#12
3444  03a6 1a01          	or	a,(OFST+0,sp)
3445  03a8 c75326        	ld	21286,a
3446                     ; 1022   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3448  03ab 0d02          	tnz	(OFST+1,sp)
3449  03ad 2706          	jreq	L1751
3450                     ; 1024     TIM3->CCER1 |= TIM3_CCER1_CC2P;
3452  03af 721a5327      	bset	21287,#5
3454  03b3 2004          	jra	L3751
3455  03b5               L1751:
3456                     ; 1028     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
3458  03b5 721b5327      	bres	21287,#5
3459  03b9               L3751:
3460                     ; 1032   TIM3->CCER1 |= TIM3_CCER1_CC2E;
3462  03b9 72185327      	bset	21287,#4
3463                     ; 1033 }
3466  03bd 5b03          	addw	sp,#3
3467  03bf 81            	ret
3480                     	xdef	_TIM3_ClearITPendingBit
3481                     	xdef	_TIM3_GetITStatus
3482                     	xdef	_TIM3_ClearFlag
3483                     	xdef	_TIM3_GetFlagStatus
3484                     	xdef	_TIM3_GetPrescaler
3485                     	xdef	_TIM3_GetCounter
3486                     	xdef	_TIM3_GetCapture2
3487                     	xdef	_TIM3_GetCapture1
3488                     	xdef	_TIM3_SetIC2Prescaler
3489                     	xdef	_TIM3_SetIC1Prescaler
3490                     	xdef	_TIM3_SetCompare2
3491                     	xdef	_TIM3_SetCompare1
3492                     	xdef	_TIM3_SetAutoreload
3493                     	xdef	_TIM3_SetCounter
3494                     	xdef	_TIM3_SelectOCxM
3495                     	xdef	_TIM3_CCxCmd
3496                     	xdef	_TIM3_OC2PolarityConfig
3497                     	xdef	_TIM3_OC1PolarityConfig
3498                     	xdef	_TIM3_GenerateEvent
3499                     	xdef	_TIM3_OC2PreloadConfig
3500                     	xdef	_TIM3_OC1PreloadConfig
3501                     	xdef	_TIM3_ARRPreloadConfig
3502                     	xdef	_TIM3_ForcedOC2Config
3503                     	xdef	_TIM3_ForcedOC1Config
3504                     	xdef	_TIM3_PrescalerConfig
3505                     	xdef	_TIM3_SelectOnePulseMode
3506                     	xdef	_TIM3_UpdateRequestConfig
3507                     	xdef	_TIM3_UpdateDisableConfig
3508                     	xdef	_TIM3_ITConfig
3509                     	xdef	_TIM3_Cmd
3510                     	xdef	_TIM3_PWMIConfig
3511                     	xdef	_TIM3_ICInit
3512                     	xdef	_TIM3_OC2Init
3513                     	xdef	_TIM3_OC1Init
3514                     	xdef	_TIM3_TimeBaseInit
3515                     	xdef	_TIM3_DeInit
3534                     	end
