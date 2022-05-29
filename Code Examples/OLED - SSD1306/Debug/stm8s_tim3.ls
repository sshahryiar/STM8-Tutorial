   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  47                     ; 51 void TIM3_DeInit(void)
  47                     ; 52 {
  49                     	switch	.text
  50  0000               _TIM3_DeInit:
  54                     ; 53   TIM3->CR1 = (uint8_t)TIM3_CR1_RESET_VALUE;
  56  0000 725f5320      	clr	21280
  57                     ; 54   TIM3->IER = (uint8_t)TIM3_IER_RESET_VALUE;
  59  0004 725f5321      	clr	21281
  60                     ; 55   TIM3->SR2 = (uint8_t)TIM3_SR2_RESET_VALUE;
  62  0008 725f5323      	clr	21283
  63                     ; 58   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  65  000c 725f5327      	clr	21287
  66                     ; 61   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  68  0010 725f5327      	clr	21287
  69                     ; 62   TIM3->CCMR1 = (uint8_t)TIM3_CCMR1_RESET_VALUE;
  71  0014 725f5325      	clr	21285
  72                     ; 63   TIM3->CCMR2 = (uint8_t)TIM3_CCMR2_RESET_VALUE;
  74  0018 725f5326      	clr	21286
  75                     ; 64   TIM3->CNTRH = (uint8_t)TIM3_CNTRH_RESET_VALUE;
  77  001c 725f5328      	clr	21288
  78                     ; 65   TIM3->CNTRL = (uint8_t)TIM3_CNTRL_RESET_VALUE;
  80  0020 725f5329      	clr	21289
  81                     ; 66   TIM3->PSCR = (uint8_t)TIM3_PSCR_RESET_VALUE;
  83  0024 725f532a      	clr	21290
  84                     ; 67   TIM3->ARRH  = (uint8_t)TIM3_ARRH_RESET_VALUE;
  86  0028 35ff532b      	mov	21291,#255
  87                     ; 68   TIM3->ARRL  = (uint8_t)TIM3_ARRL_RESET_VALUE;
  89  002c 35ff532c      	mov	21292,#255
  90                     ; 69   TIM3->CCR1H = (uint8_t)TIM3_CCR1H_RESET_VALUE;
  92  0030 725f532d      	clr	21293
  93                     ; 70   TIM3->CCR1L = (uint8_t)TIM3_CCR1L_RESET_VALUE;
  95  0034 725f532e      	clr	21294
  96                     ; 71   TIM3->CCR2H = (uint8_t)TIM3_CCR2H_RESET_VALUE;
  98  0038 725f532f      	clr	21295
  99                     ; 72   TIM3->CCR2L = (uint8_t)TIM3_CCR2L_RESET_VALUE;
 101  003c 725f5330      	clr	21296
 102                     ; 73   TIM3->SR1 = (uint8_t)TIM3_SR1_RESET_VALUE;
 104  0040 725f5322      	clr	21282
 105                     ; 74 }
 108  0044 81            	ret	
 274                     ; 82 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
 274                     ; 83                         uint16_t TIM3_Period)
 274                     ; 84 {
 275                     	switch	.text
 276  0045               _TIM3_TimeBaseInit:
 278       ffffffff      OFST: set -1
 281                     ; 86   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 283  0045 c7532a        	ld	21290,a
 284                     ; 88   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8);
 286  0048 7b03          	ld	a,(OFST+4,sp)
 287  004a c7532b        	ld	21291,a
 288                     ; 89   TIM3->ARRL = (uint8_t)(TIM3_Period);
 290  004d 7b04          	ld	a,(OFST+5,sp)
 291  004f c7532c        	ld	21292,a
 292                     ; 90 }
 295  0052 81            	ret	
 450                     ; 100 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 450                     ; 101                   TIM3_OutputState_TypeDef TIM3_OutputState,
 450                     ; 102                   uint16_t TIM3_Pulse,
 450                     ; 103                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 450                     ; 104 {
 451                     	switch	.text
 452  0053               _TIM3_OC1Init:
 454  0053 89            	pushw	x
 455  0054 88            	push	a
 456       00000001      OFST:	set	1
 459                     ; 106   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 461                     ; 107   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 463                     ; 108   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 465                     ; 111   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
 467  0055 c65327        	ld	a,21287
 468  0058 a4fc          	and	a,#252
 469  005a c75327        	ld	21287,a
 470                     ; 113   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
 472  005d 7b08          	ld	a,(OFST+7,sp)
 473  005f a402          	and	a,#2
 474  0061 6b01          	ld	(OFST+0,sp),a
 476  0063 9f            	ld	a,xl
 477  0064 a401          	and	a,#1
 478  0066 1a01          	or	a,(OFST+0,sp)
 479  0068 ca5327        	or	a,21287
 480  006b c75327        	ld	21287,a
 481                     ; 116   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 483  006e c65325        	ld	a,21285
 484  0071 a48f          	and	a,#143
 485  0073 1a02          	or	a,(OFST+1,sp)
 486  0075 c75325        	ld	21285,a
 487                     ; 119   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 489  0078 7b06          	ld	a,(OFST+5,sp)
 490  007a c7532d        	ld	21293,a
 491                     ; 120   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 493  007d 7b07          	ld	a,(OFST+6,sp)
 494  007f c7532e        	ld	21294,a
 495                     ; 121 }
 498  0082 5b03          	addw	sp,#3
 499  0084 81            	ret	
 561                     ; 131 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 561                     ; 132                   TIM3_OutputState_TypeDef TIM3_OutputState,
 561                     ; 133                   uint16_t TIM3_Pulse,
 561                     ; 134                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 561                     ; 135 {
 562                     	switch	.text
 563  0085               _TIM3_OC2Init:
 565  0085 89            	pushw	x
 566  0086 88            	push	a
 567       00000001      OFST:	set	1
 570                     ; 137   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 572                     ; 138   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 574                     ; 139   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 576                     ; 143   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
 578  0087 c65327        	ld	a,21287
 579  008a a4cf          	and	a,#207
 580  008c c75327        	ld	21287,a
 581                     ; 145   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
 583  008f 7b08          	ld	a,(OFST+7,sp)
 584  0091 a420          	and	a,#32
 585  0093 6b01          	ld	(OFST+0,sp),a
 587  0095 9f            	ld	a,xl
 588  0096 a410          	and	a,#16
 589  0098 1a01          	or	a,(OFST+0,sp)
 590  009a ca5327        	or	a,21287
 591  009d c75327        	ld	21287,a
 592                     ; 149   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 594  00a0 c65326        	ld	a,21286
 595  00a3 a48f          	and	a,#143
 596  00a5 1a02          	or	a,(OFST+1,sp)
 597  00a7 c75326        	ld	21286,a
 598                     ; 153   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 600  00aa 7b06          	ld	a,(OFST+5,sp)
 601  00ac c7532f        	ld	21295,a
 602                     ; 154   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 604  00af 7b07          	ld	a,(OFST+6,sp)
 605  00b1 c75330        	ld	21296,a
 606                     ; 155 }
 609  00b4 5b03          	addw	sp,#3
 610  00b6 81            	ret	
 792                     ; 166 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 792                     ; 167                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 792                     ; 168                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 792                     ; 169                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 792                     ; 170                  uint8_t TIM3_ICFilter)
 792                     ; 171 {
 793                     	switch	.text
 794  00b7               _TIM3_ICInit:
 796  00b7 89            	pushw	x
 797       00000000      OFST:	set	0
 800                     ; 173   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
 802                     ; 174   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 804                     ; 175   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 806                     ; 176   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 808                     ; 177   assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
 810                     ; 179   if (TIM3_Channel != TIM3_CHANNEL_2)
 812  00b8 9e            	ld	a,xh
 813  00b9 4a            	dec	a
 814  00ba 2714          	jreq	L333
 815                     ; 182     TI1_Config((uint8_t)TIM3_ICPolarity,
 815                     ; 183                (uint8_t)TIM3_ICSelection,
 815                     ; 184                (uint8_t)TIM3_ICFilter);
 817  00bc 7b07          	ld	a,(OFST+7,sp)
 818  00be 88            	push	a
 819  00bf 7b06          	ld	a,(OFST+6,sp)
 820  00c1 97            	ld	xl,a
 821  00c2 7b03          	ld	a,(OFST+3,sp)
 822  00c4 95            	ld	xh,a
 823  00c5 cd032b        	call	L3_TI1_Config
 825  00c8 84            	pop	a
 826                     ; 187     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
 828  00c9 7b06          	ld	a,(OFST+6,sp)
 829  00cb cd0272        	call	_TIM3_SetIC1Prescaler
 832  00ce 2012          	jra	L533
 833  00d0               L333:
 834                     ; 192     TI2_Config((uint8_t)TIM3_ICPolarity,
 834                     ; 193                (uint8_t)TIM3_ICSelection,
 834                     ; 194                (uint8_t)TIM3_ICFilter);
 836  00d0 7b07          	ld	a,(OFST+7,sp)
 837  00d2 88            	push	a
 838  00d3 7b06          	ld	a,(OFST+6,sp)
 839  00d5 97            	ld	xl,a
 840  00d6 7b03          	ld	a,(OFST+3,sp)
 841  00d8 95            	ld	xh,a
 842  00d9 cd035b        	call	L5_TI2_Config
 844  00dc 84            	pop	a
 845                     ; 197     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
 847  00dd 7b06          	ld	a,(OFST+6,sp)
 848  00df cd027f        	call	_TIM3_SetIC2Prescaler
 850  00e2               L533:
 851                     ; 199 }
 854  00e2 85            	popw	x
 855  00e3 81            	ret	
 945                     ; 210 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
 945                     ; 211                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 945                     ; 212                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
 945                     ; 213                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 945                     ; 214                      uint8_t TIM3_ICFilter)
 945                     ; 215 {
 946                     	switch	.text
 947  00e4               _TIM3_PWMIConfig:
 949  00e4 89            	pushw	x
 950  00e5 89            	pushw	x
 951       00000002      OFST:	set	2
 954                     ; 216   uint8_t icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 956                     ; 217   uint8_t icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
 958                     ; 220   assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
 960                     ; 221   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 962                     ; 222   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 964                     ; 223   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 966                     ; 226   if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
 968  00e6 9f            	ld	a,xl
 969  00e7 a144          	cp	a,#68
 970  00e9 2706          	jreq	L773
 971                     ; 228     icpolarity = (uint8_t)TIM3_ICPOLARITY_FALLING;
 973  00eb a644          	ld	a,#68
 974  00ed 6b01          	ld	(OFST-1,sp),a
 977  00ef 2002          	jra	L104
 978  00f1               L773:
 979                     ; 232     icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 981  00f1 0f01          	clr	(OFST-1,sp)
 983  00f3               L104:
 984                     ; 236   if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
 986  00f3 7b07          	ld	a,(OFST+5,sp)
 987  00f5 4a            	dec	a
 988  00f6 2604          	jrne	L304
 989                     ; 238     icselection = (uint8_t)TIM3_ICSELECTION_INDIRECTTI;
 991  00f8 a602          	ld	a,#2
 993  00fa 2002          	jra	L504
 994  00fc               L304:
 995                     ; 242     icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
 997  00fc a601          	ld	a,#1
 998  00fe               L504:
 999  00fe 6b02          	ld	(OFST+0,sp),a
1001                     ; 245   if (TIM3_Channel != TIM3_CHANNEL_2)
1003  0100 7b03          	ld	a,(OFST+1,sp)
1004  0102 4a            	dec	a
1005  0103 2726          	jreq	L704
1006                     ; 248     TI1_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1006                     ; 249                (uint8_t)TIM3_ICFilter);
1008  0105 7b09          	ld	a,(OFST+7,sp)
1009  0107 88            	push	a
1010  0108 7b08          	ld	a,(OFST+6,sp)
1011  010a 97            	ld	xl,a
1012  010b 7b05          	ld	a,(OFST+3,sp)
1013  010d 95            	ld	xh,a
1014  010e cd032b        	call	L3_TI1_Config
1016  0111 84            	pop	a
1017                     ; 252     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1019  0112 7b08          	ld	a,(OFST+6,sp)
1020  0114 cd0272        	call	_TIM3_SetIC1Prescaler
1022                     ; 255     TI2_Config(icpolarity, icselection, TIM3_ICFilter);
1024  0117 7b09          	ld	a,(OFST+7,sp)
1025  0119 88            	push	a
1026  011a 7b03          	ld	a,(OFST+1,sp)
1027  011c 97            	ld	xl,a
1028  011d 7b02          	ld	a,(OFST+0,sp)
1029  011f 95            	ld	xh,a
1030  0120 cd035b        	call	L5_TI2_Config
1032  0123 84            	pop	a
1033                     ; 258     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1035  0124 7b08          	ld	a,(OFST+6,sp)
1036  0126 cd027f        	call	_TIM3_SetIC2Prescaler
1039  0129 2024          	jra	L114
1040  012b               L704:
1041                     ; 263     TI2_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1041                     ; 264                (uint8_t)TIM3_ICFilter);
1043  012b 7b09          	ld	a,(OFST+7,sp)
1044  012d 88            	push	a
1045  012e 7b08          	ld	a,(OFST+6,sp)
1046  0130 97            	ld	xl,a
1047  0131 7b05          	ld	a,(OFST+3,sp)
1048  0133 95            	ld	xh,a
1049  0134 cd035b        	call	L5_TI2_Config
1051  0137 84            	pop	a
1052                     ; 267     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1054  0138 7b08          	ld	a,(OFST+6,sp)
1055  013a cd027f        	call	_TIM3_SetIC2Prescaler
1057                     ; 270     TI1_Config(icpolarity, icselection, TIM3_ICFilter);
1059  013d 7b09          	ld	a,(OFST+7,sp)
1060  013f 88            	push	a
1061  0140 7b03          	ld	a,(OFST+1,sp)
1062  0142 97            	ld	xl,a
1063  0143 7b02          	ld	a,(OFST+0,sp)
1064  0145 95            	ld	xh,a
1065  0146 cd032b        	call	L3_TI1_Config
1067  0149 84            	pop	a
1068                     ; 273     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1070  014a 7b08          	ld	a,(OFST+6,sp)
1071  014c cd0272        	call	_TIM3_SetIC1Prescaler
1073  014f               L114:
1074                     ; 275 }
1077  014f 5b04          	addw	sp,#4
1078  0151 81            	ret	
1133                     ; 283 void TIM3_Cmd(FunctionalState NewState)
1133                     ; 284 {
1134                     	switch	.text
1135  0152               _TIM3_Cmd:
1139                     ; 286   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1141                     ; 289   if (NewState != DISABLE)
1143  0152 4d            	tnz	a
1144  0153 2705          	jreq	L144
1145                     ; 291     TIM3->CR1 |= (uint8_t)TIM3_CR1_CEN;
1147  0155 72105320      	bset	21280,#0
1150  0159 81            	ret	
1151  015a               L144:
1152                     ; 295     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_CEN);
1154  015a 72115320      	bres	21280,#0
1155                     ; 297 }
1158  015e 81            	ret	
1230                     ; 311 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1230                     ; 312 {
1231                     	switch	.text
1232  015f               _TIM3_ITConfig:
1234  015f 89            	pushw	x
1235       00000000      OFST:	set	0
1238                     ; 314   assert_param(IS_TIM3_IT_OK(TIM3_IT));
1240                     ; 315   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1242                     ; 317   if (NewState != DISABLE)
1244  0160 9f            	ld	a,xl
1245  0161 4d            	tnz	a
1246  0162 2706          	jreq	L105
1247                     ; 320     TIM3->IER |= (uint8_t)TIM3_IT;
1249  0164 9e            	ld	a,xh
1250  0165 ca5321        	or	a,21281
1252  0168 2006          	jra	L305
1253  016a               L105:
1254                     ; 325     TIM3->IER &= (uint8_t)(~TIM3_IT);
1256  016a 7b01          	ld	a,(OFST+1,sp)
1257  016c 43            	cpl	a
1258  016d c45321        	and	a,21281
1259  0170               L305:
1260  0170 c75321        	ld	21281,a
1261                     ; 327 }
1264  0173 85            	popw	x
1265  0174 81            	ret	
1301                     ; 335 void TIM3_UpdateDisableConfig(FunctionalState NewState)
1301                     ; 336 {
1302                     	switch	.text
1303  0175               _TIM3_UpdateDisableConfig:
1307                     ; 338   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1309                     ; 341   if (NewState != DISABLE)
1311  0175 4d            	tnz	a
1312  0176 2705          	jreq	L325
1313                     ; 343     TIM3->CR1 |= TIM3_CR1_UDIS;
1315  0178 72125320      	bset	21280,#1
1318  017c 81            	ret	
1319  017d               L325:
1320                     ; 347     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_UDIS);
1322  017d 72135320      	bres	21280,#1
1323                     ; 349 }
1326  0181 81            	ret	
1384                     ; 359 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
1384                     ; 360 {
1385                     	switch	.text
1386  0182               _TIM3_UpdateRequestConfig:
1390                     ; 362   assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
1392                     ; 365   if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
1394  0182 4d            	tnz	a
1395  0183 2705          	jreq	L555
1396                     ; 367     TIM3->CR1 |= TIM3_CR1_URS;
1398  0185 72145320      	bset	21280,#2
1401  0189 81            	ret	
1402  018a               L555:
1403                     ; 371     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_URS);
1405  018a 72155320      	bres	21280,#2
1406                     ; 373 }
1409  018e 81            	ret	
1466                     ; 383 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1466                     ; 384 {
1467                     	switch	.text
1468  018f               _TIM3_SelectOnePulseMode:
1472                     ; 386   assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
1474                     ; 389   if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
1476  018f 4d            	tnz	a
1477  0190 2705          	jreq	L706
1478                     ; 391     TIM3->CR1 |= TIM3_CR1_OPM;
1480  0192 72165320      	bset	21280,#3
1483  0196 81            	ret	
1484  0197               L706:
1485                     ; 395     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_OPM);
1487  0197 72175320      	bres	21280,#3
1488                     ; 397 }
1491  019b 81            	ret	
1559                     ; 427 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
1559                     ; 428                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
1559                     ; 429 {
1560                     	switch	.text
1561  019c               _TIM3_PrescalerConfig:
1565                     ; 431   assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
1567                     ; 432   assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
1569                     ; 435   TIM3->PSCR = (uint8_t)Prescaler;
1571  019c 9e            	ld	a,xh
1572  019d c7532a        	ld	21290,a
1573                     ; 438   TIM3->EGR = (uint8_t)TIM3_PSCReloadMode;
1575  01a0 9f            	ld	a,xl
1576  01a1 c75324        	ld	21284,a
1577                     ; 439 }
1580  01a4 81            	ret	
1638                     ; 450 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1638                     ; 451 {
1639                     	switch	.text
1640  01a5               _TIM3_ForcedOC1Config:
1642  01a5 88            	push	a
1643       00000000      OFST:	set	0
1646                     ; 453   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1648                     ; 456   TIM3->CCMR1 =  (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM))  | (uint8_t)TIM3_ForcedAction);
1650  01a6 c65325        	ld	a,21285
1651  01a9 a48f          	and	a,#143
1652  01ab 1a01          	or	a,(OFST+1,sp)
1653  01ad c75325        	ld	21285,a
1654                     ; 457 }
1657  01b0 84            	pop	a
1658  01b1 81            	ret	
1694                     ; 468 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1694                     ; 469 {
1695                     	switch	.text
1696  01b2               _TIM3_ForcedOC2Config:
1698  01b2 88            	push	a
1699       00000000      OFST:	set	0
1702                     ; 471   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1704                     ; 474   TIM3->CCMR2 =  (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_ForcedAction);
1706  01b3 c65326        	ld	a,21286
1707  01b6 a48f          	and	a,#143
1708  01b8 1a01          	or	a,(OFST+1,sp)
1709  01ba c75326        	ld	21286,a
1710                     ; 475 }
1713  01bd 84            	pop	a
1714  01be 81            	ret	
1750                     ; 483 void TIM3_ARRPreloadConfig(FunctionalState NewState)
1750                     ; 484 {
1751                     	switch	.text
1752  01bf               _TIM3_ARRPreloadConfig:
1756                     ; 486   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1758                     ; 489   if (NewState != DISABLE)
1760  01bf 4d            	tnz	a
1761  01c0 2705          	jreq	L727
1762                     ; 491     TIM3->CR1 |= TIM3_CR1_ARPE;
1764  01c2 721e5320      	bset	21280,#7
1767  01c6 81            	ret	
1768  01c7               L727:
1769                     ; 495     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_ARPE);
1771  01c7 721f5320      	bres	21280,#7
1772                     ; 497 }
1775  01cb 81            	ret	
1811                     ; 505 void TIM3_OC1PreloadConfig(FunctionalState NewState)
1811                     ; 506 {
1812                     	switch	.text
1813  01cc               _TIM3_OC1PreloadConfig:
1817                     ; 508   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1819                     ; 511   if (NewState != DISABLE)
1821  01cc 4d            	tnz	a
1822  01cd 2705          	jreq	L157
1823                     ; 513     TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
1825  01cf 72165325      	bset	21285,#3
1828  01d3 81            	ret	
1829  01d4               L157:
1830                     ; 517     TIM3->CCMR1 &= (uint8_t)(~TIM3_CCMR_OCxPE);
1832  01d4 72175325      	bres	21285,#3
1833                     ; 519 }
1836  01d8 81            	ret	
1872                     ; 527 void TIM3_OC2PreloadConfig(FunctionalState NewState)
1872                     ; 528 {
1873                     	switch	.text
1874  01d9               _TIM3_OC2PreloadConfig:
1878                     ; 530   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1880                     ; 533   if (NewState != DISABLE)
1882  01d9 4d            	tnz	a
1883  01da 2705          	jreq	L377
1884                     ; 535     TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
1886  01dc 72165326      	bset	21286,#3
1889  01e0 81            	ret	
1890  01e1               L377:
1891                     ; 539     TIM3->CCMR2 &= (uint8_t)(~TIM3_CCMR_OCxPE);
1893  01e1 72175326      	bres	21286,#3
1894                     ; 541 }
1897  01e5 81            	ret	
1962                     ; 552 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
1962                     ; 553 {
1963                     	switch	.text
1964  01e6               _TIM3_GenerateEvent:
1968                     ; 555   assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
1970                     ; 558   TIM3->EGR = (uint8_t)TIM3_EventSource;
1972  01e6 c75324        	ld	21284,a
1973                     ; 559 }
1976  01e9 81            	ret	
2012                     ; 569 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2012                     ; 570 {
2013                     	switch	.text
2014  01ea               _TIM3_OC1PolarityConfig:
2018                     ; 572   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2020                     ; 575   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2022  01ea 4d            	tnz	a
2023  01eb 2705          	jreq	L5401
2024                     ; 577     TIM3->CCER1 |= TIM3_CCER1_CC1P;
2026  01ed 72125327      	bset	21287,#1
2029  01f1 81            	ret	
2030  01f2               L5401:
2031                     ; 581     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
2033  01f2 72135327      	bres	21287,#1
2034                     ; 583 }
2037  01f6 81            	ret	
2073                     ; 593 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2073                     ; 594 {
2074                     	switch	.text
2075  01f7               _TIM3_OC2PolarityConfig:
2079                     ; 596   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2081                     ; 599   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2083  01f7 4d            	tnz	a
2084  01f8 2705          	jreq	L7601
2085                     ; 601     TIM3->CCER1 |= TIM3_CCER1_CC2P;
2087  01fa 721a5327      	bset	21287,#5
2090  01fe 81            	ret	
2091  01ff               L7601:
2092                     ; 605     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
2094  01ff 721b5327      	bres	21287,#5
2095                     ; 607 }
2098  0203 81            	ret	
2143                     ; 619 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
2143                     ; 620 {
2144                     	switch	.text
2145  0204               _TIM3_CCxCmd:
2147  0204 89            	pushw	x
2148       00000000      OFST:	set	0
2151                     ; 622   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2153                     ; 623   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2155                     ; 625   if (TIM3_Channel == TIM3_CHANNEL_1)
2157  0205 9e            	ld	a,xh
2158  0206 4d            	tnz	a
2159  0207 2610          	jrne	L5111
2160                     ; 628     if (NewState != DISABLE)
2162  0209 9f            	ld	a,xl
2163  020a 4d            	tnz	a
2164  020b 2706          	jreq	L7111
2165                     ; 630       TIM3->CCER1 |= TIM3_CCER1_CC1E;
2167  020d 72105327      	bset	21287,#0
2169  0211 2014          	jra	L3211
2170  0213               L7111:
2171                     ; 634       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2173  0213 72115327      	bres	21287,#0
2174  0217 200e          	jra	L3211
2175  0219               L5111:
2176                     ; 641     if (NewState != DISABLE)
2178  0219 7b02          	ld	a,(OFST+2,sp)
2179  021b 2706          	jreq	L5211
2180                     ; 643       TIM3->CCER1 |= TIM3_CCER1_CC2E;
2182  021d 72185327      	bset	21287,#4
2184  0221 2004          	jra	L3211
2185  0223               L5211:
2186                     ; 647       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2188  0223 72195327      	bres	21287,#4
2189  0227               L3211:
2190                     ; 650 }
2193  0227 85            	popw	x
2194  0228 81            	ret	
2239                     ; 671 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
2239                     ; 672 {
2240                     	switch	.text
2241  0229               _TIM3_SelectOCxM:
2243  0229 89            	pushw	x
2244       00000000      OFST:	set	0
2247                     ; 674   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2249                     ; 675   assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
2251                     ; 677   if (TIM3_Channel == TIM3_CHANNEL_1)
2253  022a 9e            	ld	a,xh
2254  022b 4d            	tnz	a
2255  022c 2610          	jrne	L3511
2256                     ; 680     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2258  022e 72115327      	bres	21287,#0
2259                     ; 683     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2261  0232 c65325        	ld	a,21285
2262  0235 a48f          	and	a,#143
2263  0237 1a02          	or	a,(OFST+2,sp)
2264  0239 c75325        	ld	21285,a
2266  023c 200e          	jra	L5511
2267  023e               L3511:
2268                     ; 688     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2270  023e 72195327      	bres	21287,#4
2271                     ; 691     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2273  0242 c65326        	ld	a,21286
2274  0245 a48f          	and	a,#143
2275  0247 1a02          	or	a,(OFST+2,sp)
2276  0249 c75326        	ld	21286,a
2277  024c               L5511:
2278                     ; 693 }
2281  024c 85            	popw	x
2282  024d 81            	ret	
2314                     ; 701 void TIM3_SetCounter(uint16_t Counter)
2314                     ; 702 {
2315                     	switch	.text
2316  024e               _TIM3_SetCounter:
2320                     ; 704   TIM3->CNTRH = (uint8_t)(Counter >> 8);
2322  024e 9e            	ld	a,xh
2323  024f c75328        	ld	21288,a
2324                     ; 705   TIM3->CNTRL = (uint8_t)(Counter);
2326  0252 9f            	ld	a,xl
2327  0253 c75329        	ld	21289,a
2328                     ; 706 }
2331  0256 81            	ret	
2363                     ; 714 void TIM3_SetAutoreload(uint16_t Autoreload)
2363                     ; 715 {
2364                     	switch	.text
2365  0257               _TIM3_SetAutoreload:
2369                     ; 717   TIM3->ARRH = (uint8_t)(Autoreload >> 8);
2371  0257 9e            	ld	a,xh
2372  0258 c7532b        	ld	21291,a
2373                     ; 718   TIM3->ARRL = (uint8_t)(Autoreload);
2375  025b 9f            	ld	a,xl
2376  025c c7532c        	ld	21292,a
2377                     ; 719 }
2380  025f 81            	ret	
2412                     ; 727 void TIM3_SetCompare1(uint16_t Compare1)
2412                     ; 728 {
2413                     	switch	.text
2414  0260               _TIM3_SetCompare1:
2418                     ; 730   TIM3->CCR1H = (uint8_t)(Compare1 >> 8);
2420  0260 9e            	ld	a,xh
2421  0261 c7532d        	ld	21293,a
2422                     ; 731   TIM3->CCR1L = (uint8_t)(Compare1);
2424  0264 9f            	ld	a,xl
2425  0265 c7532e        	ld	21294,a
2426                     ; 732 }
2429  0268 81            	ret	
2461                     ; 740 void TIM3_SetCompare2(uint16_t Compare2)
2461                     ; 741 {
2462                     	switch	.text
2463  0269               _TIM3_SetCompare2:
2467                     ; 743   TIM3->CCR2H = (uint8_t)(Compare2 >> 8);
2469  0269 9e            	ld	a,xh
2470  026a c7532f        	ld	21295,a
2471                     ; 744   TIM3->CCR2L = (uint8_t)(Compare2);
2473  026d 9f            	ld	a,xl
2474  026e c75330        	ld	21296,a
2475                     ; 745 }
2478  0271 81            	ret	
2514                     ; 757 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
2514                     ; 758 {
2515                     	switch	.text
2516  0272               _TIM3_SetIC1Prescaler:
2518  0272 88            	push	a
2519       00000000      OFST:	set	0
2522                     ; 760   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
2524                     ; 763   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC1Prescaler);
2526  0273 c65325        	ld	a,21285
2527  0276 a4f3          	and	a,#243
2528  0278 1a01          	or	a,(OFST+1,sp)
2529  027a c75325        	ld	21285,a
2530                     ; 764 }
2533  027d 84            	pop	a
2534  027e 81            	ret	
2570                     ; 776 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
2570                     ; 777 {
2571                     	switch	.text
2572  027f               _TIM3_SetIC2Prescaler:
2574  027f 88            	push	a
2575       00000000      OFST:	set	0
2578                     ; 779   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
2580                     ; 782   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC2Prescaler);
2582  0280 c65326        	ld	a,21286
2583  0283 a4f3          	and	a,#243
2584  0285 1a01          	or	a,(OFST+1,sp)
2585  0287 c75326        	ld	21286,a
2586                     ; 783 }
2589  028a 84            	pop	a
2590  028b 81            	ret	
2636                     ; 790 uint16_t TIM3_GetCapture1(void)
2636                     ; 791 {
2637                     	switch	.text
2638  028c               _TIM3_GetCapture1:
2640  028c 5204          	subw	sp,#4
2641       00000004      OFST:	set	4
2644                     ; 793   uint16_t tmpccr1 = 0;
2646                     ; 794   uint8_t tmpccr1l=0, tmpccr1h=0;
2650                     ; 796   tmpccr1h = TIM3->CCR1H;
2652  028e c6532d        	ld	a,21293
2653  0291 6b02          	ld	(OFST-2,sp),a
2655                     ; 797   tmpccr1l = TIM3->CCR1L;
2657  0293 c6532e        	ld	a,21294
2658  0296 6b01          	ld	(OFST-3,sp),a
2660                     ; 799   tmpccr1 = (uint16_t)(tmpccr1l);
2662  0298 5f            	clrw	x
2663  0299 97            	ld	xl,a
2664  029a 1f03          	ldw	(OFST-1,sp),x
2666                     ; 800   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
2668  029c 5f            	clrw	x
2669  029d 7b02          	ld	a,(OFST-2,sp)
2670  029f 97            	ld	xl,a
2671  02a0 7b04          	ld	a,(OFST+0,sp)
2672  02a2 01            	rrwa	x,a
2673  02a3 1a03          	or	a,(OFST-1,sp)
2674  02a5 01            	rrwa	x,a
2676                     ; 802   return (uint16_t)tmpccr1;
2680  02a6 5b04          	addw	sp,#4
2681  02a8 81            	ret	
2727                     ; 810 uint16_t TIM3_GetCapture2(void)
2727                     ; 811 {
2728                     	switch	.text
2729  02a9               _TIM3_GetCapture2:
2731  02a9 5204          	subw	sp,#4
2732       00000004      OFST:	set	4
2735                     ; 813   uint16_t tmpccr2 = 0;
2737                     ; 814   uint8_t tmpccr2l=0, tmpccr2h=0;
2741                     ; 816   tmpccr2h = TIM3->CCR2H;
2743  02ab c6532f        	ld	a,21295
2744  02ae 6b02          	ld	(OFST-2,sp),a
2746                     ; 817   tmpccr2l = TIM3->CCR2L;
2748  02b0 c65330        	ld	a,21296
2749  02b3 6b01          	ld	(OFST-3,sp),a
2751                     ; 819   tmpccr2 = (uint16_t)(tmpccr2l);
2753  02b5 5f            	clrw	x
2754  02b6 97            	ld	xl,a
2755  02b7 1f03          	ldw	(OFST-1,sp),x
2757                     ; 820   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
2759  02b9 5f            	clrw	x
2760  02ba 7b02          	ld	a,(OFST-2,sp)
2761  02bc 97            	ld	xl,a
2762  02bd 7b04          	ld	a,(OFST+0,sp)
2763  02bf 01            	rrwa	x,a
2764  02c0 1a03          	or	a,(OFST-1,sp)
2765  02c2 01            	rrwa	x,a
2767                     ; 822   return (uint16_t)tmpccr2;
2771  02c3 5b04          	addw	sp,#4
2772  02c5 81            	ret	
2804                     ; 830 uint16_t TIM3_GetCounter(void)
2804                     ; 831 {
2805                     	switch	.text
2806  02c6               _TIM3_GetCounter:
2808  02c6 89            	pushw	x
2809       00000002      OFST:	set	2
2812                     ; 832   uint16_t tmpcntr = 0;
2814                     ; 834   tmpcntr = ((uint16_t)TIM3->CNTRH << 8);
2816  02c7 c65328        	ld	a,21288
2817  02ca 97            	ld	xl,a
2818  02cb 4f            	clr	a
2819  02cc 02            	rlwa	x,a
2820  02cd 1f01          	ldw	(OFST-1,sp),x
2822                     ; 836   return (uint16_t)( tmpcntr| (uint16_t)(TIM3->CNTRL));
2824  02cf c65329        	ld	a,21289
2825  02d2 5f            	clrw	x
2826  02d3 97            	ld	xl,a
2827  02d4 01            	rrwa	x,a
2828  02d5 1a02          	or	a,(OFST+0,sp)
2829  02d7 01            	rrwa	x,a
2830  02d8 1a01          	or	a,(OFST-1,sp)
2831  02da 01            	rrwa	x,a
2834  02db 5b02          	addw	sp,#2
2835  02dd 81            	ret	
2859                     ; 844 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
2859                     ; 845 {
2860                     	switch	.text
2861  02de               _TIM3_GetPrescaler:
2865                     ; 847   return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
2867  02de c6532a        	ld	a,21290
2870  02e1 81            	ret	
2991                     ; 861 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
2991                     ; 862 {
2992                     	switch	.text
2993  02e2               _TIM3_GetFlagStatus:
2995  02e2 89            	pushw	x
2996  02e3 89            	pushw	x
2997       00000002      OFST:	set	2
3000                     ; 863   FlagStatus bitstatus = RESET;
3002                     ; 864   uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
3006                     ; 867   assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
3008                     ; 869   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_FLAG);
3010  02e4 9f            	ld	a,xl
3011  02e5 c45322        	and	a,21282
3012  02e8 6b01          	ld	(OFST-1,sp),a
3014                     ; 870   tim3_flag_h = (uint8_t)((uint16_t)TIM3_FLAG >> 8);
3016  02ea 7b03          	ld	a,(OFST+1,sp)
3017  02ec 6b02          	ld	(OFST+0,sp),a
3019                     ; 872   if (((tim3_flag_l) | (uint8_t)(TIM3->SR2 & tim3_flag_h)) != (uint8_t)RESET )
3021  02ee c45323        	and	a,21283
3022  02f1 1a01          	or	a,(OFST-1,sp)
3023  02f3 2702          	jreq	L3341
3024                     ; 874     bitstatus = SET;
3026  02f5 a601          	ld	a,#1
3029  02f7               L3341:
3030                     ; 878     bitstatus = RESET;
3033                     ; 880   return (FlagStatus)bitstatus;
3037  02f7 5b04          	addw	sp,#4
3038  02f9 81            	ret	
3073                     ; 894 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3073                     ; 895 {
3074                     	switch	.text
3075  02fa               _TIM3_ClearFlag:
3077  02fa 89            	pushw	x
3078       00000000      OFST:	set	0
3081                     ; 897   assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
3083                     ; 900   TIM3->SR1 = (uint8_t)(~((uint8_t)(TIM3_FLAG)));
3085  02fb 9f            	ld	a,xl
3086  02fc 43            	cpl	a
3087  02fd c75322        	ld	21282,a
3088                     ; 901   TIM3->SR2 = (uint8_t)(~((uint8_t)((uint16_t)TIM3_FLAG >> 8)));
3090  0300 7b01          	ld	a,(OFST+1,sp)
3091  0302 43            	cpl	a
3092  0303 c75323        	ld	21283,a
3093                     ; 902 }
3096  0306 85            	popw	x
3097  0307 81            	ret	
3157                     ; 913 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
3157                     ; 914 {
3158                     	switch	.text
3159  0308               _TIM3_GetITStatus:
3161  0308 88            	push	a
3162  0309 89            	pushw	x
3163       00000002      OFST:	set	2
3166                     ; 915   ITStatus bitstatus = RESET;
3168                     ; 916   uint8_t TIM3_itStatus = 0, TIM3_itEnable = 0;
3172                     ; 919   assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
3174                     ; 921   TIM3_itStatus = (uint8_t)(TIM3->SR1 & TIM3_IT);
3176  030a c45322        	and	a,21282
3177  030d 6b01          	ld	(OFST-1,sp),a
3179                     ; 923   TIM3_itEnable = (uint8_t)(TIM3->IER & TIM3_IT);
3181  030f c65321        	ld	a,21281
3182  0312 1403          	and	a,(OFST+1,sp)
3183  0314 6b02          	ld	(OFST+0,sp),a
3185                     ; 925   if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET ))
3187  0316 7b01          	ld	a,(OFST-1,sp)
3188  0318 2708          	jreq	L3051
3190  031a 7b02          	ld	a,(OFST+0,sp)
3191  031c 2704          	jreq	L3051
3192                     ; 927     bitstatus = SET;
3194  031e a601          	ld	a,#1
3197  0320 2001          	jra	L5051
3198  0322               L3051:
3199                     ; 931     bitstatus = RESET;
3201  0322 4f            	clr	a
3203  0323               L5051:
3204                     ; 933   return (ITStatus)(bitstatus);
3208  0323 5b03          	addw	sp,#3
3209  0325 81            	ret	
3245                     ; 945 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
3245                     ; 946 {
3246                     	switch	.text
3247  0326               _TIM3_ClearITPendingBit:
3251                     ; 948   assert_param(IS_TIM3_IT_OK(TIM3_IT));
3253                     ; 951   TIM3->SR1 = (uint8_t)(~TIM3_IT);
3255  0326 43            	cpl	a
3256  0327 c75322        	ld	21282,a
3257                     ; 952 }
3260  032a 81            	ret	
3306                     ; 970 static void TI1_Config(uint8_t TIM3_ICPolarity,
3306                     ; 971                        uint8_t TIM3_ICSelection,
3306                     ; 972                        uint8_t TIM3_ICFilter)
3306                     ; 973 {
3307                     	switch	.text
3308  032b               L3_TI1_Config:
3310  032b 89            	pushw	x
3311  032c 88            	push	a
3312       00000001      OFST:	set	1
3315                     ; 975   TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
3317  032d 72115327      	bres	21287,#0
3318                     ; 978   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~( TIM3_CCMR_CCxS | TIM3_CCMR_ICxF))) | (uint8_t)(( (TIM3_ICSelection)) | ((uint8_t)( TIM3_ICFilter << 4))));
3320  0331 7b06          	ld	a,(OFST+5,sp)
3321  0333 97            	ld	xl,a
3322  0334 a610          	ld	a,#16
3323  0336 42            	mul	x,a
3324  0337 9f            	ld	a,xl
3325  0338 1a03          	or	a,(OFST+2,sp)
3326  033a 6b01          	ld	(OFST+0,sp),a
3328  033c c65325        	ld	a,21285
3329  033f a40c          	and	a,#12
3330  0341 1a01          	or	a,(OFST+0,sp)
3331  0343 c75325        	ld	21285,a
3332                     ; 981   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3334  0346 7b02          	ld	a,(OFST+1,sp)
3335  0348 2706          	jreq	L5451
3336                     ; 983     TIM3->CCER1 |= TIM3_CCER1_CC1P;
3338  034a 72125327      	bset	21287,#1
3340  034e 2004          	jra	L7451
3341  0350               L5451:
3342                     ; 987     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
3344  0350 72135327      	bres	21287,#1
3345  0354               L7451:
3346                     ; 990   TIM3->CCER1 |= TIM3_CCER1_CC1E;
3348  0354 72105327      	bset	21287,#0
3349                     ; 991 }
3352  0358 5b03          	addw	sp,#3
3353  035a 81            	ret	
3399                     ; 1009 static void TI2_Config(uint8_t TIM3_ICPolarity,
3399                     ; 1010                        uint8_t TIM3_ICSelection,
3399                     ; 1011                        uint8_t TIM3_ICFilter)
3399                     ; 1012 {
3400                     	switch	.text
3401  035b               L5_TI2_Config:
3403  035b 89            	pushw	x
3404  035c 88            	push	a
3405       00000001      OFST:	set	1
3408                     ; 1014   TIM3->CCER1 &=  (uint8_t)(~TIM3_CCER1_CC2E);
3410  035d 72195327      	bres	21287,#4
3411                     ; 1017   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~( TIM3_CCMR_CCxS |
3411                     ; 1018                                                               TIM3_CCMR_ICxF    ))) | (uint8_t)(( (TIM3_ICSelection)) | 
3411                     ; 1019                                                                                                 ((uint8_t)( TIM3_ICFilter << 4))));
3413  0361 7b06          	ld	a,(OFST+5,sp)
3414  0363 97            	ld	xl,a
3415  0364 a610          	ld	a,#16
3416  0366 42            	mul	x,a
3417  0367 9f            	ld	a,xl
3418  0368 1a03          	or	a,(OFST+2,sp)
3419  036a 6b01          	ld	(OFST+0,sp),a
3421  036c c65326        	ld	a,21286
3422  036f a40c          	and	a,#12
3423  0371 1a01          	or	a,(OFST+0,sp)
3424  0373 c75326        	ld	21286,a
3425                     ; 1022   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3427  0376 7b02          	ld	a,(OFST+1,sp)
3428  0378 2706          	jreq	L1751
3429                     ; 1024     TIM3->CCER1 |= TIM3_CCER1_CC2P;
3431  037a 721a5327      	bset	21287,#5
3433  037e 2004          	jra	L3751
3434  0380               L1751:
3435                     ; 1028     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
3437  0380 721b5327      	bres	21287,#5
3438  0384               L3751:
3439                     ; 1032   TIM3->CCER1 |= TIM3_CCER1_CC2E;
3441  0384 72185327      	bset	21287,#4
3442                     ; 1033 }
3445  0388 5b03          	addw	sp,#3
3446  038a 81            	ret	
3459                     	xdef	_TIM3_ClearITPendingBit
3460                     	xdef	_TIM3_GetITStatus
3461                     	xdef	_TIM3_ClearFlag
3462                     	xdef	_TIM3_GetFlagStatus
3463                     	xdef	_TIM3_GetPrescaler
3464                     	xdef	_TIM3_GetCounter
3465                     	xdef	_TIM3_GetCapture2
3466                     	xdef	_TIM3_GetCapture1
3467                     	xdef	_TIM3_SetIC2Prescaler
3468                     	xdef	_TIM3_SetIC1Prescaler
3469                     	xdef	_TIM3_SetCompare2
3470                     	xdef	_TIM3_SetCompare1
3471                     	xdef	_TIM3_SetAutoreload
3472                     	xdef	_TIM3_SetCounter
3473                     	xdef	_TIM3_SelectOCxM
3474                     	xdef	_TIM3_CCxCmd
3475                     	xdef	_TIM3_OC2PolarityConfig
3476                     	xdef	_TIM3_OC1PolarityConfig
3477                     	xdef	_TIM3_GenerateEvent
3478                     	xdef	_TIM3_OC2PreloadConfig
3479                     	xdef	_TIM3_OC1PreloadConfig
3480                     	xdef	_TIM3_ARRPreloadConfig
3481                     	xdef	_TIM3_ForcedOC2Config
3482                     	xdef	_TIM3_ForcedOC1Config
3483                     	xdef	_TIM3_PrescalerConfig
3484                     	xdef	_TIM3_SelectOnePulseMode
3485                     	xdef	_TIM3_UpdateRequestConfig
3486                     	xdef	_TIM3_UpdateDisableConfig
3487                     	xdef	_TIM3_ITConfig
3488                     	xdef	_TIM3_Cmd
3489                     	xdef	_TIM3_PWMIConfig
3490                     	xdef	_TIM3_ICInit
3491                     	xdef	_TIM3_OC2Init
3492                     	xdef	_TIM3_OC1Init
3493                     	xdef	_TIM3_TimeBaseInit
3494                     	xdef	_TIM3_DeInit
3513                     	end
