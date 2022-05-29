   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  42                     ; 52 void TIM2_DeInit(void)
  42                     ; 53 {
  43                     	switch	.text
  44  0000               f_TIM2_DeInit:
  48                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  50  0000 725f5300      	clr	21248
  51                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  53  0004 725f5301      	clr	21249
  54                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  56  0008 725f5303      	clr	21251
  57                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  59  000c 725f5308      	clr	21256
  60                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  62  0010 725f5309      	clr	21257
  63                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  65  0014 725f5308      	clr	21256
  66                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  68  0018 725f5309      	clr	21257
  69                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  71  001c 725f5305      	clr	21253
  72                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  74  0020 725f5306      	clr	21254
  75                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  77  0024 725f5307      	clr	21255
  78                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  80  0028 725f530a      	clr	21258
  81                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  83  002c 725f530b      	clr	21259
  84                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  86  0030 725f530c      	clr	21260
  87                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  89  0034 35ff530d      	mov	21261,#255
  90                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  92  0038 35ff530e      	mov	21262,#255
  93                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
  95  003c 725f530f      	clr	21263
  96                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
  98  0040 725f5310      	clr	21264
  99                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 101  0044 725f5311      	clr	21265
 102                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 104  0048 725f5312      	clr	21266
 105                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 107  004c 725f5313      	clr	21267
 108                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 110  0050 725f5314      	clr	21268
 111                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 113  0054 725f5302      	clr	21250
 114                     ; 81 }
 117  0058 87            	retf
 282                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 282                     ; 90                         uint16_t TIM2_Period)
 282                     ; 91 {
 283                     	switch	.text
 284  0059               f_TIM2_TimeBaseInit:
 286  0059 88            	push	a
 287       00000000      OFST:	set	0
 290                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 292  005a c7530c        	ld	21260,a
 293                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 295  005d 7b05          	ld	a,(OFST+5,sp)
 296  005f c7530d        	ld	21261,a
 297                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 299  0062 7b06          	ld	a,(OFST+6,sp)
 300  0064 c7530e        	ld	21262,a
 301                     ; 97 }
 304  0067 84            	pop	a
 305  0068 87            	retf
 459                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 459                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 459                     ; 110                   uint16_t TIM2_Pulse,
 459                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 459                     ; 112 {
 460                     	switch	.text
 461  0069               f_TIM2_OC1Init:
 463  0069 89            	pushw	x
 464  006a 88            	push	a
 465       00000001      OFST:	set	1
 468                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 470                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 472                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 474                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 476  006b c65308        	ld	a,21256
 477  006e a4fc          	and	a,#252
 478  0070 c75308        	ld	21256,a
 479                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 479                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 481  0073 7b09          	ld	a,(OFST+8,sp)
 482  0075 a402          	and	a,#2
 483  0077 6b01          	ld	(OFST+0,sp),a
 485  0079 9f            	ld	a,xl
 486  007a a401          	and	a,#1
 487  007c 1a01          	or	a,(OFST+0,sp)
 488  007e ca5308        	or	a,21256
 489  0081 c75308        	ld	21256,a
 490                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 490                     ; 126                           (uint8_t)TIM2_OCMode);
 492  0084 c65305        	ld	a,21253
 493  0087 a48f          	and	a,#143
 494  0089 1a02          	or	a,(OFST+1,sp)
 495  008b c75305        	ld	21253,a
 496                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 498  008e 7b07          	ld	a,(OFST+6,sp)
 499  0090 c7530f        	ld	21263,a
 500                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 502  0093 7b08          	ld	a,(OFST+7,sp)
 503  0095 c75310        	ld	21264,a
 504                     ; 131 }
 507  0098 5b03          	addw	sp,#3
 508  009a 87            	retf
 569                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 569                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 569                     ; 144                   uint16_t TIM2_Pulse,
 569                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 569                     ; 146 {
 570                     	switch	.text
 571  009b               f_TIM2_OC2Init:
 573  009b 89            	pushw	x
 574  009c 88            	push	a
 575       00000001      OFST:	set	1
 578                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 580                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 582                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 584                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 586  009d c65308        	ld	a,21256
 587  00a0 a4cf          	and	a,#207
 588  00a2 c75308        	ld	21256,a
 589                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 589                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 591  00a5 7b09          	ld	a,(OFST+8,sp)
 592  00a7 a420          	and	a,#32
 593  00a9 6b01          	ld	(OFST+0,sp),a
 595  00ab 9f            	ld	a,xl
 596  00ac a410          	and	a,#16
 597  00ae 1a01          	or	a,(OFST+0,sp)
 598  00b0 ca5308        	or	a,21256
 599  00b3 c75308        	ld	21256,a
 600                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 600                     ; 162                           (uint8_t)TIM2_OCMode);
 602  00b6 c65306        	ld	a,21254
 603  00b9 a48f          	and	a,#143
 604  00bb 1a02          	or	a,(OFST+1,sp)
 605  00bd c75306        	ld	21254,a
 606                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 608  00c0 7b07          	ld	a,(OFST+6,sp)
 609  00c2 c75311        	ld	21265,a
 610                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 612  00c5 7b08          	ld	a,(OFST+7,sp)
 613  00c7 c75312        	ld	21266,a
 614                     ; 168 }
 617  00ca 5b03          	addw	sp,#3
 618  00cc 87            	retf
 679                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 679                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 679                     ; 181                   uint16_t TIM2_Pulse,
 679                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 679                     ; 183 {
 680                     	switch	.text
 681  00cd               f_TIM2_OC3Init:
 683  00cd 89            	pushw	x
 684  00ce 88            	push	a
 685       00000001      OFST:	set	1
 688                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 690                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 692                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 694                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 696  00cf c65309        	ld	a,21257
 697  00d2 a4fc          	and	a,#252
 698  00d4 c75309        	ld	21257,a
 699                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 699                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 701  00d7 7b09          	ld	a,(OFST+8,sp)
 702  00d9 a402          	and	a,#2
 703  00db 6b01          	ld	(OFST+0,sp),a
 705  00dd 9f            	ld	a,xl
 706  00de a401          	and	a,#1
 707  00e0 1a01          	or	a,(OFST+0,sp)
 708  00e2 ca5309        	or	a,21257
 709  00e5 c75309        	ld	21257,a
 710                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 710                     ; 196                           (uint8_t)TIM2_OCMode);
 712  00e8 c65307        	ld	a,21255
 713  00eb a48f          	and	a,#143
 714  00ed 1a02          	or	a,(OFST+1,sp)
 715  00ef c75307        	ld	21255,a
 716                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 718  00f2 7b07          	ld	a,(OFST+6,sp)
 719  00f4 c75313        	ld	21267,a
 720                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 722  00f7 7b08          	ld	a,(OFST+7,sp)
 723  00f9 c75314        	ld	21268,a
 724                     ; 201 }
 727  00fc 5b03          	addw	sp,#3
 728  00fe 87            	retf
 918                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 918                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 918                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 918                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 918                     ; 216                  uint8_t TIM2_ICFilter)
 918                     ; 217 {
 919                     	switch	.text
 920  00ff               f_TIM2_ICInit:
 922  00ff 89            	pushw	x
 923       00000000      OFST:	set	0
 926                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 928                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 930                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 932                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 934                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 936                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
 938  0100 9e            	ld	a,xh
 939  0101 4d            	tnz	a
 940  0102 2616          	jrne	L763
 941                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
 941                     ; 229                (uint8_t)TIM2_ICSelection,
 941                     ; 230                (uint8_t)TIM2_ICFilter);
 943  0104 7b08          	ld	a,(OFST+8,sp)
 944  0106 88            	push	a
 945  0107 7b07          	ld	a,(OFST+7,sp)
 946  0109 97            	ld	xl,a
 947  010a 7b03          	ld	a,(OFST+3,sp)
 948  010c 95            	ld	xh,a
 949  010d 8d580458      	callf	L3f_TI1_Config
 951  0111 84            	pop	a
 952                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 954  0112 7b07          	ld	a,(OFST+7,sp)
 955  0114 8d4e034e      	callf	f_TIM2_SetIC1Prescaler
 958  0118 2030          	jra	L173
 959  011a               L763:
 960                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
 962  011a 7b01          	ld	a,(OFST+1,sp)
 963  011c a101          	cp	a,#1
 964  011e 2616          	jrne	L373
 965                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
 965                     ; 239                (uint8_t)TIM2_ICSelection,
 965                     ; 240                (uint8_t)TIM2_ICFilter);
 967  0120 7b08          	ld	a,(OFST+8,sp)
 968  0122 88            	push	a
 969  0123 7b07          	ld	a,(OFST+7,sp)
 970  0125 97            	ld	xl,a
 971  0126 7b03          	ld	a,(OFST+3,sp)
 972  0128 95            	ld	xh,a
 973  0129 8d880488      	callf	L5f_TI2_Config
 975  012d 84            	pop	a
 976                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 978  012e 7b07          	ld	a,(OFST+7,sp)
 979  0130 8d5b035b      	callf	f_TIM2_SetIC2Prescaler
 982  0134 2014          	jra	L173
 983  0136               L373:
 984                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
 984                     ; 249                (uint8_t)TIM2_ICSelection,
 984                     ; 250                (uint8_t)TIM2_ICFilter);
 986  0136 7b08          	ld	a,(OFST+8,sp)
 987  0138 88            	push	a
 988  0139 7b07          	ld	a,(OFST+7,sp)
 989  013b 97            	ld	xl,a
 990  013c 7b03          	ld	a,(OFST+3,sp)
 991  013e 95            	ld	xh,a
 992  013f 8db804b8      	callf	L7f_TI3_Config
 994  0143 84            	pop	a
 995                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
 997  0144 7b07          	ld	a,(OFST+7,sp)
 998  0146 8d680368      	callf	f_TIM2_SetIC3Prescaler
1000  014a               L173:
1001                     ; 255 }
1004  014a 85            	popw	x
1005  014b 87            	retf
1094                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1094                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1094                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1094                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1094                     ; 270                      uint8_t TIM2_ICFilter)
1094                     ; 271 {
1095                     	switch	.text
1096  014c               f_TIM2_PWMIConfig:
1098  014c 89            	pushw	x
1099  014d 89            	pushw	x
1100       00000002      OFST:	set	2
1103                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1105                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1107                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1109                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1111                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1113                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1115                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1117  014e 9f            	ld	a,xl
1118  014f a144          	cp	a,#68
1119  0151 2706          	jreq	L734
1120                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1122  0153 a644          	ld	a,#68
1123  0155 6b01          	ld	(OFST-1,sp),a
1126  0157 2002          	jra	L144
1127  0159               L734:
1128                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1130  0159 0f01          	clr	(OFST-1,sp)
1132  015b               L144:
1133                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1135  015b 7b08          	ld	a,(OFST+6,sp)
1136  015d a101          	cp	a,#1
1137  015f 2606          	jrne	L344
1138                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1140  0161 a602          	ld	a,#2
1141  0163 6b02          	ld	(OFST+0,sp),a
1144  0165 2004          	jra	L544
1145  0167               L344:
1146                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1148  0167 a601          	ld	a,#1
1149  0169 6b02          	ld	(OFST+0,sp),a
1151  016b               L544:
1152                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1154  016b 0d03          	tnz	(OFST+1,sp)
1155  016d 262a          	jrne	L744
1156                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1156                     ; 305                (uint8_t)TIM2_ICFilter);
1158  016f 7b0a          	ld	a,(OFST+8,sp)
1159  0171 88            	push	a
1160  0172 7b09          	ld	a,(OFST+7,sp)
1161  0174 97            	ld	xl,a
1162  0175 7b05          	ld	a,(OFST+3,sp)
1163  0177 95            	ld	xh,a
1164  0178 8d580458      	callf	L3f_TI1_Config
1166  017c 84            	pop	a
1167                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1169  017d 7b09          	ld	a,(OFST+7,sp)
1170  017f 8d4e034e      	callf	f_TIM2_SetIC1Prescaler
1172                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1174  0183 7b0a          	ld	a,(OFST+8,sp)
1175  0185 88            	push	a
1176  0186 7b03          	ld	a,(OFST+1,sp)
1177  0188 97            	ld	xl,a
1178  0189 7b02          	ld	a,(OFST+0,sp)
1179  018b 95            	ld	xh,a
1180  018c 8d880488      	callf	L5f_TI2_Config
1182  0190 84            	pop	a
1183                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1185  0191 7b09          	ld	a,(OFST+7,sp)
1186  0193 8d5b035b      	callf	f_TIM2_SetIC2Prescaler
1189  0197 2028          	jra	L154
1190  0199               L744:
1191                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1191                     ; 320                (uint8_t)TIM2_ICFilter);
1193  0199 7b0a          	ld	a,(OFST+8,sp)
1194  019b 88            	push	a
1195  019c 7b09          	ld	a,(OFST+7,sp)
1196  019e 97            	ld	xl,a
1197  019f 7b05          	ld	a,(OFST+3,sp)
1198  01a1 95            	ld	xh,a
1199  01a2 8d880488      	callf	L5f_TI2_Config
1201  01a6 84            	pop	a
1202                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1204  01a7 7b09          	ld	a,(OFST+7,sp)
1205  01a9 8d5b035b      	callf	f_TIM2_SetIC2Prescaler
1207                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1209  01ad 7b0a          	ld	a,(OFST+8,sp)
1210  01af 88            	push	a
1211  01b0 7b03          	ld	a,(OFST+1,sp)
1212  01b2 97            	ld	xl,a
1213  01b3 7b02          	ld	a,(OFST+0,sp)
1214  01b5 95            	ld	xh,a
1215  01b6 8d580458      	callf	L3f_TI1_Config
1217  01ba 84            	pop	a
1218                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1220  01bb 7b09          	ld	a,(OFST+7,sp)
1221  01bd 8d4e034e      	callf	f_TIM2_SetIC1Prescaler
1223  01c1               L154:
1224                     ; 331 }
1227  01c1 5b04          	addw	sp,#4
1228  01c3 87            	retf
1282                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1282                     ; 340 {
1283                     	switch	.text
1284  01c4               f_TIM2_Cmd:
1288                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1290                     ; 345   if (NewState != DISABLE)
1292  01c4 4d            	tnz	a
1293  01c5 2706          	jreq	L105
1294                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1296  01c7 72105300      	bset	21248,#0
1298  01cb 2004          	jra	L305
1299  01cd               L105:
1300                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1302  01cd 72115300      	bres	21248,#0
1303  01d1               L305:
1304                     ; 353 }
1307  01d1 87            	retf
1385                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1385                     ; 369 {
1386                     	switch	.text
1387  01d2               f_TIM2_ITConfig:
1389  01d2 89            	pushw	x
1390       00000000      OFST:	set	0
1393                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1395                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1397                     ; 374   if (NewState != DISABLE)
1399  01d3 9f            	ld	a,xl
1400  01d4 4d            	tnz	a
1401  01d5 2709          	jreq	L345
1402                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1404  01d7 9e            	ld	a,xh
1405  01d8 ca5301        	or	a,21249
1406  01db c75301        	ld	21249,a
1408  01de 2009          	jra	L545
1409  01e0               L345:
1410                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1412  01e0 7b01          	ld	a,(OFST+1,sp)
1413  01e2 43            	cpl	a
1414  01e3 c45301        	and	a,21249
1415  01e6 c75301        	ld	21249,a
1416  01e9               L545:
1417                     ; 384 }
1420  01e9 85            	popw	x
1421  01ea 87            	retf
1456                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1456                     ; 393 {
1457                     	switch	.text
1458  01eb               f_TIM2_UpdateDisableConfig:
1462                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1464                     ; 398   if (NewState != DISABLE)
1466  01eb 4d            	tnz	a
1467  01ec 2706          	jreq	L565
1468                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1470  01ee 72125300      	bset	21248,#1
1472  01f2 2004          	jra	L765
1473  01f4               L565:
1474                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1476  01f4 72135300      	bres	21248,#1
1477  01f8               L765:
1478                     ; 406 }
1481  01f8 87            	retf
1538                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1538                     ; 417 {
1539                     	switch	.text
1540  01f9               f_TIM2_UpdateRequestConfig:
1544                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1546                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1548  01f9 4d            	tnz	a
1549  01fa 2706          	jreq	L716
1550                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1552  01fc 72145300      	bset	21248,#2
1554  0200 2004          	jra	L126
1555  0202               L716:
1556                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1558  0202 72155300      	bres	21248,#2
1559  0206               L126:
1560                     ; 430 }
1563  0206 87            	retf
1619                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1619                     ; 441 {
1620                     	switch	.text
1621  0207               f_TIM2_SelectOnePulseMode:
1625                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1627                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1629  0207 4d            	tnz	a
1630  0208 2706          	jreq	L156
1631                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1633  020a 72165300      	bset	21248,#3
1635  020e 2004          	jra	L356
1636  0210               L156:
1637                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1639  0210 72175300      	bres	21248,#3
1640  0214               L356:
1641                     ; 454 }
1644  0214 87            	retf
1711                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1711                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1711                     ; 486 {
1712                     	switch	.text
1713  0215               f_TIM2_PrescalerConfig:
1717                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1719                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1721                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
1723  0215 9e            	ld	a,xh
1724  0216 c7530c        	ld	21260,a
1725                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
1727  0219 9f            	ld	a,xl
1728  021a c75304        	ld	21252,a
1729                     ; 496 }
1732  021d 87            	retf
1789                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1789                     ; 508 {
1790                     	switch	.text
1791  021e               f_TIM2_ForcedOC1Config:
1793  021e 88            	push	a
1794       00000000      OFST:	set	0
1797                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1799                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
1799                     ; 514                             | (uint8_t)TIM2_ForcedAction);
1801  021f c65305        	ld	a,21253
1802  0222 a48f          	and	a,#143
1803  0224 1a01          	or	a,(OFST+1,sp)
1804  0226 c75305        	ld	21253,a
1805                     ; 515 }
1808  0229 84            	pop	a
1809  022a 87            	retf
1844                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1844                     ; 527 {
1845                     	switch	.text
1846  022b               f_TIM2_ForcedOC2Config:
1848  022b 88            	push	a
1849       00000000      OFST:	set	0
1852                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1854                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
1854                     ; 533                           | (uint8_t)TIM2_ForcedAction);
1856  022c c65306        	ld	a,21254
1857  022f a48f          	and	a,#143
1858  0231 1a01          	or	a,(OFST+1,sp)
1859  0233 c75306        	ld	21254,a
1860                     ; 534 }
1863  0236 84            	pop	a
1864  0237 87            	retf
1899                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1899                     ; 546 {
1900                     	switch	.text
1901  0238               f_TIM2_ForcedOC3Config:
1903  0238 88            	push	a
1904       00000000      OFST:	set	0
1907                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1909                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
1909                     ; 552                             | (uint8_t)TIM2_ForcedAction);
1911  0239 c65307        	ld	a,21255
1912  023c a48f          	and	a,#143
1913  023e 1a01          	or	a,(OFST+1,sp)
1914  0240 c75307        	ld	21255,a
1915                     ; 553 }
1918  0243 84            	pop	a
1919  0244 87            	retf
1954                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1954                     ; 562 {
1955                     	switch	.text
1956  0245               f_TIM2_ARRPreloadConfig:
1960                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1962                     ; 567   if (NewState != DISABLE)
1964  0245 4d            	tnz	a
1965  0246 2706          	jreq	L7001
1966                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
1968  0248 721e5300      	bset	21248,#7
1970  024c 2004          	jra	L1101
1971  024e               L7001:
1972                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
1974  024e 721f5300      	bres	21248,#7
1975  0252               L1101:
1976                     ; 575 }
1979  0252 87            	retf
2014                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2014                     ; 584 {
2015                     	switch	.text
2016  0253               f_TIM2_OC1PreloadConfig:
2020                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2022                     ; 589   if (NewState != DISABLE)
2024  0253 4d            	tnz	a
2025  0254 2706          	jreq	L1301
2026                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2028  0256 72165305      	bset	21253,#3
2030  025a 2004          	jra	L3301
2031  025c               L1301:
2032                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2034  025c 72175305      	bres	21253,#3
2035  0260               L3301:
2036                     ; 597 }
2039  0260 87            	retf
2074                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2074                     ; 606 {
2075                     	switch	.text
2076  0261               f_TIM2_OC2PreloadConfig:
2080                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2082                     ; 611   if (NewState != DISABLE)
2084  0261 4d            	tnz	a
2085  0262 2706          	jreq	L3501
2086                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2088  0264 72165306      	bset	21254,#3
2090  0268 2004          	jra	L5501
2091  026a               L3501:
2092                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2094  026a 72175306      	bres	21254,#3
2095  026e               L5501:
2096                     ; 619 }
2099  026e 87            	retf
2134                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2134                     ; 628 {
2135                     	switch	.text
2136  026f               f_TIM2_OC3PreloadConfig:
2140                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2142                     ; 633   if (NewState != DISABLE)
2144  026f 4d            	tnz	a
2145  0270 2706          	jreq	L5701
2146                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2148  0272 72165307      	bset	21255,#3
2150  0276 2004          	jra	L7701
2151  0278               L5701:
2152                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2154  0278 72175307      	bres	21255,#3
2155  027c               L7701:
2156                     ; 641 }
2159  027c 87            	retf
2231                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2231                     ; 654 {
2232                     	switch	.text
2233  027d               f_TIM2_GenerateEvent:
2237                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2239                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
2241  027d c75304        	ld	21252,a
2242                     ; 660 }
2245  0280 87            	retf
2280                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2280                     ; 671 {
2281                     	switch	.text
2282  0281               f_TIM2_OC1PolarityConfig:
2286                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2288                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2290  0281 4d            	tnz	a
2291  0282 2706          	jreq	L1511
2292                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2294  0284 72125308      	bset	21256,#1
2296  0288 2004          	jra	L3511
2297  028a               L1511:
2298                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2300  028a 72135308      	bres	21256,#1
2301  028e               L3511:
2302                     ; 684 }
2305  028e 87            	retf
2340                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2340                     ; 695 {
2341                     	switch	.text
2342  028f               f_TIM2_OC2PolarityConfig:
2346                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2348                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2350  028f 4d            	tnz	a
2351  0290 2706          	jreq	L3711
2352                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2354  0292 721a5308      	bset	21256,#5
2356  0296 2004          	jra	L5711
2357  0298               L3711:
2358                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2360  0298 721b5308      	bres	21256,#5
2361  029c               L5711:
2362                     ; 708 }
2365  029c 87            	retf
2400                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2400                     ; 719 {
2401                     	switch	.text
2402  029d               f_TIM2_OC3PolarityConfig:
2406                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2408                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2410  029d 4d            	tnz	a
2411  029e 2706          	jreq	L5121
2412                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2414  02a0 72125309      	bset	21257,#1
2416  02a4 2004          	jra	L7121
2417  02a6               L5121:
2418                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2420  02a6 72135309      	bres	21257,#1
2421  02aa               L7121:
2422                     ; 732 }
2425  02aa 87            	retf
2469                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2469                     ; 746 {
2470                     	switch	.text
2471  02ab               f_TIM2_CCxCmd:
2473  02ab 89            	pushw	x
2474       00000000      OFST:	set	0
2477                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2479                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2481                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
2483  02ac 9e            	ld	a,xh
2484  02ad 4d            	tnz	a
2485  02ae 2610          	jrne	L3421
2486                     ; 754     if (NewState != DISABLE)
2488  02b0 9f            	ld	a,xl
2489  02b1 4d            	tnz	a
2490  02b2 2706          	jreq	L5421
2491                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2493  02b4 72105308      	bset	21256,#0
2495  02b8 202a          	jra	L1521
2496  02ba               L5421:
2497                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2499  02ba 72115308      	bres	21256,#0
2500  02be 2024          	jra	L1521
2501  02c0               L3421:
2502                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
2504  02c0 7b01          	ld	a,(OFST+1,sp)
2505  02c2 a101          	cp	a,#1
2506  02c4 2610          	jrne	L3521
2507                     ; 767     if (NewState != DISABLE)
2509  02c6 0d02          	tnz	(OFST+2,sp)
2510  02c8 2706          	jreq	L5521
2511                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2513  02ca 72185308      	bset	21256,#4
2515  02ce 2014          	jra	L1521
2516  02d0               L5521:
2517                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2519  02d0 72195308      	bres	21256,#4
2520  02d4 200e          	jra	L1521
2521  02d6               L3521:
2522                     ; 779     if (NewState != DISABLE)
2524  02d6 0d02          	tnz	(OFST+2,sp)
2525  02d8 2706          	jreq	L3621
2526                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2528  02da 72105309      	bset	21257,#0
2530  02de 2004          	jra	L1521
2531  02e0               L3621:
2532                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2534  02e0 72115309      	bres	21257,#0
2535  02e4               L1521:
2536                     ; 788 }
2539  02e4 85            	popw	x
2540  02e5 87            	retf
2584                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2584                     ; 811 {
2585                     	switch	.text
2586  02e6               f_TIM2_SelectOCxM:
2588  02e6 89            	pushw	x
2589       00000000      OFST:	set	0
2592                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2594                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2596                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
2598  02e7 9e            	ld	a,xh
2599  02e8 4d            	tnz	a
2600  02e9 2610          	jrne	L1131
2601                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2603  02eb 72115308      	bres	21256,#0
2604                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2604                     ; 823                             | (uint8_t)TIM2_OCMode);
2606  02ef c65305        	ld	a,21253
2607  02f2 a48f          	and	a,#143
2608  02f4 1a02          	or	a,(OFST+2,sp)
2609  02f6 c75305        	ld	21253,a
2611  02f9 2024          	jra	L3131
2612  02fb               L1131:
2613                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
2615  02fb 7b01          	ld	a,(OFST+1,sp)
2616  02fd a101          	cp	a,#1
2617  02ff 2610          	jrne	L5131
2618                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2620  0301 72195308      	bres	21256,#4
2621                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2621                     ; 832                             | (uint8_t)TIM2_OCMode);
2623  0305 c65306        	ld	a,21254
2624  0308 a48f          	and	a,#143
2625  030a 1a02          	or	a,(OFST+2,sp)
2626  030c c75306        	ld	21254,a
2628  030f 200e          	jra	L3131
2629  0311               L5131:
2630                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2632  0311 72115309      	bres	21257,#0
2633                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2633                     ; 841                             | (uint8_t)TIM2_OCMode);
2635  0315 c65307        	ld	a,21255
2636  0318 a48f          	and	a,#143
2637  031a 1a02          	or	a,(OFST+2,sp)
2638  031c c75307        	ld	21255,a
2639  031f               L3131:
2640                     ; 843 }
2643  031f 85            	popw	x
2644  0320 87            	retf
2675                     ; 851 void TIM2_SetCounter(uint16_t Counter)
2675                     ; 852 {
2676                     	switch	.text
2677  0321               f_TIM2_SetCounter:
2681                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
2683  0321 9e            	ld	a,xh
2684  0322 c7530a        	ld	21258,a
2685                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
2687  0325 9f            	ld	a,xl
2688  0326 c7530b        	ld	21259,a
2689                     ; 856 }
2692  0329 87            	retf
2723                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
2723                     ; 865 {
2724                     	switch	.text
2725  032a               f_TIM2_SetAutoreload:
2729                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2731  032a 9e            	ld	a,xh
2732  032b c7530d        	ld	21261,a
2733                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
2735  032e 9f            	ld	a,xl
2736  032f c7530e        	ld	21262,a
2737                     ; 869 }
2740  0332 87            	retf
2771                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
2771                     ; 878 {
2772                     	switch	.text
2773  0333               f_TIM2_SetCompare1:
2777                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
2779  0333 9e            	ld	a,xh
2780  0334 c7530f        	ld	21263,a
2781                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
2783  0337 9f            	ld	a,xl
2784  0338 c75310        	ld	21264,a
2785                     ; 882 }
2788  033b 87            	retf
2819                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
2819                     ; 891 {
2820                     	switch	.text
2821  033c               f_TIM2_SetCompare2:
2825                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
2827  033c 9e            	ld	a,xh
2828  033d c75311        	ld	21265,a
2829                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
2831  0340 9f            	ld	a,xl
2832  0341 c75312        	ld	21266,a
2833                     ; 895 }
2836  0344 87            	retf
2867                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
2867                     ; 904 {
2868                     	switch	.text
2869  0345               f_TIM2_SetCompare3:
2873                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
2875  0345 9e            	ld	a,xh
2876  0346 c75313        	ld	21267,a
2877                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
2879  0349 9f            	ld	a,xl
2880  034a c75314        	ld	21268,a
2881                     ; 908 }
2884  034d 87            	retf
2919                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2919                     ; 921 {
2920                     	switch	.text
2921  034e               f_TIM2_SetIC1Prescaler:
2923  034e 88            	push	a
2924       00000000      OFST:	set	0
2927                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2929                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2929                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
2931  034f c65305        	ld	a,21253
2932  0352 a4f3          	and	a,#243
2933  0354 1a01          	or	a,(OFST+1,sp)
2934  0356 c75305        	ld	21253,a
2935                     ; 928 }
2938  0359 84            	pop	a
2939  035a 87            	retf
2974                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
2974                     ; 941 {
2975                     	switch	.text
2976  035b               f_TIM2_SetIC2Prescaler:
2978  035b 88            	push	a
2979       00000000      OFST:	set	0
2982                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
2984                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2984                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
2986  035c c65306        	ld	a,21254
2987  035f a4f3          	and	a,#243
2988  0361 1a01          	or	a,(OFST+1,sp)
2989  0363 c75306        	ld	21254,a
2990                     ; 948 }
2993  0366 84            	pop	a
2994  0367 87            	retf
3029                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3029                     ; 961 {
3030                     	switch	.text
3031  0368               f_TIM2_SetIC3Prescaler:
3033  0368 88            	push	a
3034       00000000      OFST:	set	0
3037                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3039                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3039                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
3041  0369 c65307        	ld	a,21255
3042  036c a4f3          	and	a,#243
3043  036e 1a01          	or	a,(OFST+1,sp)
3044  0370 c75307        	ld	21255,a
3045                     ; 968 }
3048  0373 84            	pop	a
3049  0374 87            	retf
3094                     ; 975 uint16_t TIM2_GetCapture1(void)
3094                     ; 976 {
3095                     	switch	.text
3096  0375               f_TIM2_GetCapture1:
3098  0375 5204          	subw	sp,#4
3099       00000004      OFST:	set	4
3102                     ; 978   uint16_t tmpccr1 = 0;
3104                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
3108                     ; 981   tmpccr1h = TIM2->CCR1H;
3110  0377 c6530f        	ld	a,21263
3111  037a 6b02          	ld	(OFST-2,sp),a
3113                     ; 982   tmpccr1l = TIM2->CCR1L;
3115  037c c65310        	ld	a,21264
3116  037f 6b01          	ld	(OFST-3,sp),a
3118                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
3120  0381 7b01          	ld	a,(OFST-3,sp)
3121  0383 5f            	clrw	x
3122  0384 97            	ld	xl,a
3123  0385 1f03          	ldw	(OFST-1,sp),x
3125                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3127  0387 7b02          	ld	a,(OFST-2,sp)
3128  0389 5f            	clrw	x
3129  038a 97            	ld	xl,a
3130  038b 4f            	clr	a
3131  038c 02            	rlwa	x,a
3132  038d 01            	rrwa	x,a
3133  038e 1a04          	or	a,(OFST+0,sp)
3134  0390 01            	rrwa	x,a
3135  0391 1a03          	or	a,(OFST-1,sp)
3136  0393 01            	rrwa	x,a
3137  0394 1f03          	ldw	(OFST-1,sp),x
3139                     ; 987   return (uint16_t)tmpccr1;
3141  0396 1e03          	ldw	x,(OFST-1,sp)
3144  0398 5b04          	addw	sp,#4
3145  039a 87            	retf
3190                     ; 995 uint16_t TIM2_GetCapture2(void)
3190                     ; 996 {
3191                     	switch	.text
3192  039b               f_TIM2_GetCapture2:
3194  039b 5204          	subw	sp,#4
3195       00000004      OFST:	set	4
3198                     ; 998   uint16_t tmpccr2 = 0;
3200                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
3204                     ; 1001   tmpccr2h = TIM2->CCR2H;
3206  039d c65311        	ld	a,21265
3207  03a0 6b02          	ld	(OFST-2,sp),a
3209                     ; 1002   tmpccr2l = TIM2->CCR2L;
3211  03a2 c65312        	ld	a,21266
3212  03a5 6b01          	ld	(OFST-3,sp),a
3214                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
3216  03a7 7b01          	ld	a,(OFST-3,sp)
3217  03a9 5f            	clrw	x
3218  03aa 97            	ld	xl,a
3219  03ab 1f03          	ldw	(OFST-1,sp),x
3221                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3223  03ad 7b02          	ld	a,(OFST-2,sp)
3224  03af 5f            	clrw	x
3225  03b0 97            	ld	xl,a
3226  03b1 4f            	clr	a
3227  03b2 02            	rlwa	x,a
3228  03b3 01            	rrwa	x,a
3229  03b4 1a04          	or	a,(OFST+0,sp)
3230  03b6 01            	rrwa	x,a
3231  03b7 1a03          	or	a,(OFST-1,sp)
3232  03b9 01            	rrwa	x,a
3233  03ba 1f03          	ldw	(OFST-1,sp),x
3235                     ; 1007   return (uint16_t)tmpccr2;
3237  03bc 1e03          	ldw	x,(OFST-1,sp)
3240  03be 5b04          	addw	sp,#4
3241  03c0 87            	retf
3286                     ; 1015 uint16_t TIM2_GetCapture3(void)
3286                     ; 1016 {
3287                     	switch	.text
3288  03c1               f_TIM2_GetCapture3:
3290  03c1 5204          	subw	sp,#4
3291       00000004      OFST:	set	4
3294                     ; 1018   uint16_t tmpccr3 = 0;
3296                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
3300                     ; 1021   tmpccr3h = TIM2->CCR3H;
3302  03c3 c65313        	ld	a,21267
3303  03c6 6b02          	ld	(OFST-2,sp),a
3305                     ; 1022   tmpccr3l = TIM2->CCR3L;
3307  03c8 c65314        	ld	a,21268
3308  03cb 6b01          	ld	(OFST-3,sp),a
3310                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
3312  03cd 7b01          	ld	a,(OFST-3,sp)
3313  03cf 5f            	clrw	x
3314  03d0 97            	ld	xl,a
3315  03d1 1f03          	ldw	(OFST-1,sp),x
3317                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3319  03d3 7b02          	ld	a,(OFST-2,sp)
3320  03d5 5f            	clrw	x
3321  03d6 97            	ld	xl,a
3322  03d7 4f            	clr	a
3323  03d8 02            	rlwa	x,a
3324  03d9 01            	rrwa	x,a
3325  03da 1a04          	or	a,(OFST+0,sp)
3326  03dc 01            	rrwa	x,a
3327  03dd 1a03          	or	a,(OFST-1,sp)
3328  03df 01            	rrwa	x,a
3329  03e0 1f03          	ldw	(OFST-1,sp),x
3331                     ; 1027   return (uint16_t)tmpccr3;
3333  03e2 1e03          	ldw	x,(OFST-1,sp)
3336  03e4 5b04          	addw	sp,#4
3337  03e6 87            	retf
3368                     ; 1035 uint16_t TIM2_GetCounter(void)
3368                     ; 1036 {
3369                     	switch	.text
3370  03e7               f_TIM2_GetCounter:
3372  03e7 89            	pushw	x
3373       00000002      OFST:	set	2
3376                     ; 1037   uint16_t tmpcntr = 0;
3378                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3380  03e8 c6530a        	ld	a,21258
3381  03eb 5f            	clrw	x
3382  03ec 97            	ld	xl,a
3383  03ed 4f            	clr	a
3384  03ee 02            	rlwa	x,a
3385  03ef 1f01          	ldw	(OFST-1,sp),x
3387                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3389  03f1 c6530b        	ld	a,21259
3390  03f4 5f            	clrw	x
3391  03f5 97            	ld	xl,a
3392  03f6 01            	rrwa	x,a
3393  03f7 1a02          	or	a,(OFST+0,sp)
3394  03f9 01            	rrwa	x,a
3395  03fa 1a01          	or	a,(OFST-1,sp)
3396  03fc 01            	rrwa	x,a
3399  03fd 5b02          	addw	sp,#2
3400  03ff 87            	retf
3423                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3423                     ; 1050 {
3424                     	switch	.text
3425  0400               f_TIM2_GetPrescaler:
3429                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3431  0400 c6530c        	ld	a,21260
3434  0403 87            	retf
3568                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3568                     ; 1069 {
3569                     	switch	.text
3570  0404               f_TIM2_GetFlagStatus:
3572  0404 89            	pushw	x
3573  0405 89            	pushw	x
3574       00000002      OFST:	set	2
3577                     ; 1070   FlagStatus bitstatus = RESET;
3579                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3583                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3585                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3587  0406 9f            	ld	a,xl
3588  0407 c45302        	and	a,21250
3589  040a 6b01          	ld	(OFST-1,sp),a
3591                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3593  040c 7b03          	ld	a,(OFST+1,sp)
3594  040e 6b02          	ld	(OFST+0,sp),a
3596                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3598  0410 c65303        	ld	a,21251
3599  0413 1402          	and	a,(OFST+0,sp)
3600  0415 1a01          	or	a,(OFST-1,sp)
3601  0417 2706          	jreq	L3561
3602                     ; 1081     bitstatus = SET;
3604  0419 a601          	ld	a,#1
3605  041b 6b02          	ld	(OFST+0,sp),a
3608  041d 2002          	jra	L5561
3609  041f               L3561:
3610                     ; 1085     bitstatus = RESET;
3612  041f 0f02          	clr	(OFST+0,sp)
3614  0421               L5561:
3615                     ; 1087   return (FlagStatus)bitstatus;
3617  0421 7b02          	ld	a,(OFST+0,sp)
3620  0423 5b04          	addw	sp,#4
3621  0425 87            	retf
3655                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3655                     ; 1104 {
3656                     	switch	.text
3657  0426               f_TIM2_ClearFlag:
3661                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3663                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3665  0426 9f            	ld	a,xl
3666  0427 43            	cpl	a
3667  0428 c75302        	ld	21250,a
3668                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3670  042b 35ff5303      	mov	21251,#255
3671                     ; 1111 }
3674  042f 87            	retf
3733                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3733                     ; 1124 {
3734                     	switch	.text
3735  0430               f_TIM2_GetITStatus:
3737  0430 88            	push	a
3738  0431 89            	pushw	x
3739       00000002      OFST:	set	2
3742                     ; 1125   ITStatus bitstatus = RESET;
3744                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3748                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3750                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3752  0432 c45302        	and	a,21250
3753  0435 6b01          	ld	(OFST-1,sp),a
3755                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3757  0437 c65301        	ld	a,21249
3758  043a 1403          	and	a,(OFST+1,sp)
3759  043c 6b02          	ld	(OFST+0,sp),a
3761                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3763  043e 0d01          	tnz	(OFST-1,sp)
3764  0440 270a          	jreq	L3271
3766  0442 0d02          	tnz	(OFST+0,sp)
3767  0444 2706          	jreq	L3271
3768                     ; 1137     bitstatus = SET;
3770  0446 a601          	ld	a,#1
3771  0448 6b02          	ld	(OFST+0,sp),a
3774  044a 2002          	jra	L5271
3775  044c               L3271:
3776                     ; 1141     bitstatus = RESET;
3778  044c 0f02          	clr	(OFST+0,sp)
3780  044e               L5271:
3781                     ; 1143   return (ITStatus)(bitstatus);
3783  044e 7b02          	ld	a,(OFST+0,sp)
3786  0450 5b03          	addw	sp,#3
3787  0452 87            	retf
3822                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3822                     ; 1157 {
3823                     	switch	.text
3824  0453               f_TIM2_ClearITPendingBit:
3828                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
3830                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
3832  0453 43            	cpl	a
3833  0454 c75302        	ld	21250,a
3834                     ; 1163 }
3837  0457 87            	retf
3882                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
3882                     ; 1182                        uint8_t TIM2_ICSelection,
3882                     ; 1183                        uint8_t TIM2_ICFilter)
3882                     ; 1184 {
3883                     	switch	.text
3884  0458               L3f_TI1_Config:
3886  0458 89            	pushw	x
3887  0459 88            	push	a
3888       00000001      OFST:	set	1
3891                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3893  045a 72115308      	bres	21256,#0
3894                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
3894                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
3896  045e 7b07          	ld	a,(OFST+6,sp)
3897  0460 97            	ld	xl,a
3898  0461 a610          	ld	a,#16
3899  0463 42            	mul	x,a
3900  0464 9f            	ld	a,xl
3901  0465 1a03          	or	a,(OFST+2,sp)
3902  0467 6b01          	ld	(OFST+0,sp),a
3904  0469 c65305        	ld	a,21253
3905  046c a40c          	and	a,#12
3906  046e 1a01          	or	a,(OFST+0,sp)
3907  0470 c75305        	ld	21253,a
3908                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
3910  0473 0d02          	tnz	(OFST+1,sp)
3911  0475 2706          	jreq	L5671
3912                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
3914  0477 72125308      	bset	21256,#1
3916  047b 2004          	jra	L7671
3917  047d               L5671:
3918                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3920  047d 72135308      	bres	21256,#1
3921  0481               L7671:
3922                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
3924  0481 72105308      	bset	21256,#0
3925                     ; 1203 }
3928  0485 5b03          	addw	sp,#3
3929  0487 87            	retf
3974                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
3974                     ; 1222                        uint8_t TIM2_ICSelection,
3974                     ; 1223                        uint8_t TIM2_ICFilter)
3974                     ; 1224 {
3975                     	switch	.text
3976  0488               L5f_TI2_Config:
3978  0488 89            	pushw	x
3979  0489 88            	push	a
3980       00000001      OFST:	set	1
3983                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3985  048a 72195308      	bres	21256,#4
3986                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
3986                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
3988  048e 7b07          	ld	a,(OFST+6,sp)
3989  0490 97            	ld	xl,a
3990  0491 a610          	ld	a,#16
3991  0493 42            	mul	x,a
3992  0494 9f            	ld	a,xl
3993  0495 1a03          	or	a,(OFST+2,sp)
3994  0497 6b01          	ld	(OFST+0,sp),a
3996  0499 c65306        	ld	a,21254
3997  049c a40c          	and	a,#12
3998  049e 1a01          	or	a,(OFST+0,sp)
3999  04a0 c75306        	ld	21254,a
4000                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4002  04a3 0d02          	tnz	(OFST+1,sp)
4003  04a5 2706          	jreq	L1102
4004                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
4006  04a7 721a5308      	bset	21256,#5
4008  04ab 2004          	jra	L3102
4009  04ad               L1102:
4010                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4012  04ad 721b5308      	bres	21256,#5
4013  04b1               L3102:
4014                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
4016  04b1 72185308      	bset	21256,#4
4017                     ; 1245 }
4020  04b5 5b03          	addw	sp,#3
4021  04b7 87            	retf
4066                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4066                     ; 1262                        uint8_t TIM2_ICFilter)
4066                     ; 1263 {
4067                     	switch	.text
4068  04b8               L7f_TI3_Config:
4070  04b8 89            	pushw	x
4071  04b9 88            	push	a
4072       00000001      OFST:	set	1
4075                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4077  04ba 72115309      	bres	21257,#0
4078                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4078                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4080  04be 7b07          	ld	a,(OFST+6,sp)
4081  04c0 97            	ld	xl,a
4082  04c1 a610          	ld	a,#16
4083  04c3 42            	mul	x,a
4084  04c4 9f            	ld	a,xl
4085  04c5 1a03          	or	a,(OFST+2,sp)
4086  04c7 6b01          	ld	(OFST+0,sp),a
4088  04c9 c65307        	ld	a,21255
4089  04cc a40c          	and	a,#12
4090  04ce 1a01          	or	a,(OFST+0,sp)
4091  04d0 c75307        	ld	21255,a
4092                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4094  04d3 0d02          	tnz	(OFST+1,sp)
4095  04d5 2706          	jreq	L5302
4096                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
4098  04d7 72125309      	bset	21257,#1
4100  04db 2004          	jra	L7302
4101  04dd               L5302:
4102                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4104  04dd 72135309      	bres	21257,#1
4105  04e1               L7302:
4106                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
4108  04e1 72105309      	bset	21257,#0
4109                     ; 1283 }
4112  04e5 5b03          	addw	sp,#3
4113  04e7 87            	retf
4125                     	xdef	f_TIM2_ClearITPendingBit
4126                     	xdef	f_TIM2_GetITStatus
4127                     	xdef	f_TIM2_ClearFlag
4128                     	xdef	f_TIM2_GetFlagStatus
4129                     	xdef	f_TIM2_GetPrescaler
4130                     	xdef	f_TIM2_GetCounter
4131                     	xdef	f_TIM2_GetCapture3
4132                     	xdef	f_TIM2_GetCapture2
4133                     	xdef	f_TIM2_GetCapture1
4134                     	xdef	f_TIM2_SetIC3Prescaler
4135                     	xdef	f_TIM2_SetIC2Prescaler
4136                     	xdef	f_TIM2_SetIC1Prescaler
4137                     	xdef	f_TIM2_SetCompare3
4138                     	xdef	f_TIM2_SetCompare2
4139                     	xdef	f_TIM2_SetCompare1
4140                     	xdef	f_TIM2_SetAutoreload
4141                     	xdef	f_TIM2_SetCounter
4142                     	xdef	f_TIM2_SelectOCxM
4143                     	xdef	f_TIM2_CCxCmd
4144                     	xdef	f_TIM2_OC3PolarityConfig
4145                     	xdef	f_TIM2_OC2PolarityConfig
4146                     	xdef	f_TIM2_OC1PolarityConfig
4147                     	xdef	f_TIM2_GenerateEvent
4148                     	xdef	f_TIM2_OC3PreloadConfig
4149                     	xdef	f_TIM2_OC2PreloadConfig
4150                     	xdef	f_TIM2_OC1PreloadConfig
4151                     	xdef	f_TIM2_ARRPreloadConfig
4152                     	xdef	f_TIM2_ForcedOC3Config
4153                     	xdef	f_TIM2_ForcedOC2Config
4154                     	xdef	f_TIM2_ForcedOC1Config
4155                     	xdef	f_TIM2_PrescalerConfig
4156                     	xdef	f_TIM2_SelectOnePulseMode
4157                     	xdef	f_TIM2_UpdateRequestConfig
4158                     	xdef	f_TIM2_UpdateDisableConfig
4159                     	xdef	f_TIM2_ITConfig
4160                     	xdef	f_TIM2_Cmd
4161                     	xdef	f_TIM2_PWMIConfig
4162                     	xdef	f_TIM2_ICInit
4163                     	xdef	f_TIM2_OC3Init
4164                     	xdef	f_TIM2_OC2Init
4165                     	xdef	f_TIM2_OC1Init
4166                     	xdef	f_TIM2_TimeBaseInit
4167                     	xdef	f_TIM2_DeInit
4186                     	end
