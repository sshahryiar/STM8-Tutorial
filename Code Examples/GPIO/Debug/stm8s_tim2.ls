   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  43                     ; 52 void TIM2_DeInit(void)
  43                     ; 53 {
  45                     	switch	.text
  46  0000               _TIM2_DeInit:
  50                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  52  0000 725f5300      	clr	21248
  53                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  55  0004 725f5303      	clr	21251
  56                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  58  0008 725f5305      	clr	21253
  59                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  61  000c 725f530a      	clr	21258
  62                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  64  0010 725f530b      	clr	21259
  65                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  67  0014 725f530a      	clr	21258
  68                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  70  0018 725f530b      	clr	21259
  71                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  73  001c 725f5307      	clr	21255
  74                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  76  0020 725f5308      	clr	21256
  77                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  79  0024 725f5309      	clr	21257
  80                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  82  0028 725f530c      	clr	21260
  83                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  85  002c 725f530d      	clr	21261
  86                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  88  0030 725f530e      	clr	21262
  89                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  91  0034 35ff530f      	mov	21263,#255
  92                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  94  0038 35ff5310      	mov	21264,#255
  95                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
  97  003c 725f5311      	clr	21265
  98                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 100  0040 725f5312      	clr	21266
 101                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 103  0044 725f5313      	clr	21267
 104                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 106  0048 725f5314      	clr	21268
 107                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 109  004c 725f5315      	clr	21269
 110                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 112  0050 725f5316      	clr	21270
 113                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 115  0054 725f5304      	clr	21252
 116                     ; 81 }
 119  0058 81            	ret
 287                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 287                     ; 90                         uint16_t TIM2_Period)
 287                     ; 91 {
 288                     	switch	.text
 289  0059               _TIM2_TimeBaseInit:
 291  0059 88            	push	a
 292       00000000      OFST:	set	0
 295                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 297  005a c7530e        	ld	21262,a
 298                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 300  005d 7b04          	ld	a,(OFST+4,sp)
 301  005f c7530f        	ld	21263,a
 302                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 304  0062 7b05          	ld	a,(OFST+5,sp)
 305  0064 c75310        	ld	21264,a
 306                     ; 97 }
 309  0067 84            	pop	a
 310  0068 81            	ret
 467                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 467                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 467                     ; 110                   uint16_t TIM2_Pulse,
 467                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 467                     ; 112 {
 468                     	switch	.text
 469  0069               _TIM2_OC1Init:
 471  0069 89            	pushw	x
 472  006a 88            	push	a
 473       00000001      OFST:	set	1
 476                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 478                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 480                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 482                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 484  006b c6530a        	ld	a,21258
 485  006e a4fc          	and	a,#252
 486  0070 c7530a        	ld	21258,a
 487                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 487                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 489  0073 7b08          	ld	a,(OFST+7,sp)
 490  0075 a402          	and	a,#2
 491  0077 6b01          	ld	(OFST+0,sp),a
 493  0079 9f            	ld	a,xl
 494  007a a401          	and	a,#1
 495  007c 1a01          	or	a,(OFST+0,sp)
 496  007e ca530a        	or	a,21258
 497  0081 c7530a        	ld	21258,a
 498                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 498                     ; 126                           (uint8_t)TIM2_OCMode);
 500  0084 c65307        	ld	a,21255
 501  0087 a48f          	and	a,#143
 502  0089 1a02          	or	a,(OFST+1,sp)
 503  008b c75307        	ld	21255,a
 504                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 506  008e 7b06          	ld	a,(OFST+5,sp)
 507  0090 c75311        	ld	21265,a
 508                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 510  0093 7b07          	ld	a,(OFST+6,sp)
 511  0095 c75312        	ld	21266,a
 512                     ; 131 }
 515  0098 5b03          	addw	sp,#3
 516  009a 81            	ret
 580                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 580                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 580                     ; 144                   uint16_t TIM2_Pulse,
 580                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 580                     ; 146 {
 581                     	switch	.text
 582  009b               _TIM2_OC2Init:
 584  009b 89            	pushw	x
 585  009c 88            	push	a
 586       00000001      OFST:	set	1
 589                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 591                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 593                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 595                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 597  009d c6530a        	ld	a,21258
 598  00a0 a4cf          	and	a,#207
 599  00a2 c7530a        	ld	21258,a
 600                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 600                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 602  00a5 7b08          	ld	a,(OFST+7,sp)
 603  00a7 a420          	and	a,#32
 604  00a9 6b01          	ld	(OFST+0,sp),a
 606  00ab 9f            	ld	a,xl
 607  00ac a410          	and	a,#16
 608  00ae 1a01          	or	a,(OFST+0,sp)
 609  00b0 ca530a        	or	a,21258
 610  00b3 c7530a        	ld	21258,a
 611                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 611                     ; 162                           (uint8_t)TIM2_OCMode);
 613  00b6 c65308        	ld	a,21256
 614  00b9 a48f          	and	a,#143
 615  00bb 1a02          	or	a,(OFST+1,sp)
 616  00bd c75308        	ld	21256,a
 617                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 619  00c0 7b06          	ld	a,(OFST+5,sp)
 620  00c2 c75313        	ld	21267,a
 621                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 623  00c5 7b07          	ld	a,(OFST+6,sp)
 624  00c7 c75314        	ld	21268,a
 625                     ; 168 }
 628  00ca 5b03          	addw	sp,#3
 629  00cc 81            	ret
 693                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 693                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 693                     ; 181                   uint16_t TIM2_Pulse,
 693                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 693                     ; 183 {
 694                     	switch	.text
 695  00cd               _TIM2_OC3Init:
 697  00cd 89            	pushw	x
 698  00ce 88            	push	a
 699       00000001      OFST:	set	1
 702                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 704                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 706                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 708                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 710  00cf c6530b        	ld	a,21259
 711  00d2 a4fc          	and	a,#252
 712  00d4 c7530b        	ld	21259,a
 713                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 713                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 715  00d7 7b08          	ld	a,(OFST+7,sp)
 716  00d9 a402          	and	a,#2
 717  00db 6b01          	ld	(OFST+0,sp),a
 719  00dd 9f            	ld	a,xl
 720  00de a401          	and	a,#1
 721  00e0 1a01          	or	a,(OFST+0,sp)
 722  00e2 ca530b        	or	a,21259
 723  00e5 c7530b        	ld	21259,a
 724                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 724                     ; 196                           (uint8_t)TIM2_OCMode);
 726  00e8 c65309        	ld	a,21257
 727  00eb a48f          	and	a,#143
 728  00ed 1a02          	or	a,(OFST+1,sp)
 729  00ef c75309        	ld	21257,a
 730                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 732  00f2 7b06          	ld	a,(OFST+5,sp)
 733  00f4 c75315        	ld	21269,a
 734                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 736  00f7 7b07          	ld	a,(OFST+6,sp)
 737  00f9 c75316        	ld	21270,a
 738                     ; 201 }
 741  00fc 5b03          	addw	sp,#3
 742  00fe 81            	ret
 935                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 935                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 935                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 935                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 935                     ; 216                  uint8_t TIM2_ICFilter)
 935                     ; 217 {
 936                     	switch	.text
 937  00ff               _TIM2_ICInit:
 939  00ff 89            	pushw	x
 940       00000000      OFST:	set	0
 943                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 945                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 947                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 949                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 951                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 953                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
 955  0100 9e            	ld	a,xh
 956  0101 4d            	tnz	a
 957  0102 2614          	jrne	L104
 958                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
 958                     ; 229                (uint8_t)TIM2_ICSelection,
 958                     ; 230                (uint8_t)TIM2_ICFilter);
 960  0104 7b07          	ld	a,(OFST+7,sp)
 961  0106 88            	push	a
 962  0107 7b06          	ld	a,(OFST+6,sp)
 963  0109 97            	ld	xl,a
 964  010a 7b03          	ld	a,(OFST+3,sp)
 965  010c 95            	ld	xh,a
 966  010d cd044a        	call	L3_TI1_Config
 968  0110 84            	pop	a
 969                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 971  0111 7b06          	ld	a,(OFST+6,sp)
 972  0113 cd0340        	call	_TIM2_SetIC1Prescaler
 975  0116 202c          	jra	L304
 976  0118               L104:
 977                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
 979  0118 7b01          	ld	a,(OFST+1,sp)
 980  011a a101          	cp	a,#1
 981  011c 2614          	jrne	L504
 982                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
 982                     ; 239                (uint8_t)TIM2_ICSelection,
 982                     ; 240                (uint8_t)TIM2_ICFilter);
 984  011e 7b07          	ld	a,(OFST+7,sp)
 985  0120 88            	push	a
 986  0121 7b06          	ld	a,(OFST+6,sp)
 987  0123 97            	ld	xl,a
 988  0124 7b03          	ld	a,(OFST+3,sp)
 989  0126 95            	ld	xh,a
 990  0127 cd047a        	call	L5_TI2_Config
 992  012a 84            	pop	a
 993                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 995  012b 7b06          	ld	a,(OFST+6,sp)
 996  012d cd034d        	call	_TIM2_SetIC2Prescaler
 999  0130 2012          	jra	L304
1000  0132               L504:
1001                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
1001                     ; 249                (uint8_t)TIM2_ICSelection,
1001                     ; 250                (uint8_t)TIM2_ICFilter);
1003  0132 7b07          	ld	a,(OFST+7,sp)
1004  0134 88            	push	a
1005  0135 7b06          	ld	a,(OFST+6,sp)
1006  0137 97            	ld	xl,a
1007  0138 7b03          	ld	a,(OFST+3,sp)
1008  013a 95            	ld	xh,a
1009  013b cd04aa        	call	L7_TI3_Config
1011  013e 84            	pop	a
1012                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1014  013f 7b06          	ld	a,(OFST+6,sp)
1015  0141 cd035a        	call	_TIM2_SetIC3Prescaler
1017  0144               L304:
1018                     ; 255 }
1021  0144 85            	popw	x
1022  0145 81            	ret
1118                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1118                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1118                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1118                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1118                     ; 270                      uint8_t TIM2_ICFilter)
1118                     ; 271 {
1119                     	switch	.text
1120  0146               _TIM2_PWMIConfig:
1122  0146 89            	pushw	x
1123  0147 89            	pushw	x
1124       00000002      OFST:	set	2
1127                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1129                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1131                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1133                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1135                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1137                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1139                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1141  0148 9f            	ld	a,xl
1142  0149 a144          	cp	a,#68
1143  014b 2706          	jreq	L754
1144                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1146  014d a644          	ld	a,#68
1147  014f 6b01          	ld	(OFST-1,sp),a
1150  0151 2002          	jra	L164
1151  0153               L754:
1152                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1154  0153 0f01          	clr	(OFST-1,sp)
1156  0155               L164:
1157                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1159  0155 7b07          	ld	a,(OFST+5,sp)
1160  0157 a101          	cp	a,#1
1161  0159 2606          	jrne	L364
1162                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1164  015b a602          	ld	a,#2
1165  015d 6b02          	ld	(OFST+0,sp),a
1168  015f 2004          	jra	L564
1169  0161               L364:
1170                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1172  0161 a601          	ld	a,#1
1173  0163 6b02          	ld	(OFST+0,sp),a
1175  0165               L564:
1176                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1178  0165 0d03          	tnz	(OFST+1,sp)
1179  0167 2626          	jrne	L764
1180                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1180                     ; 305                (uint8_t)TIM2_ICFilter);
1182  0169 7b09          	ld	a,(OFST+7,sp)
1183  016b 88            	push	a
1184  016c 7b08          	ld	a,(OFST+6,sp)
1185  016e 97            	ld	xl,a
1186  016f 7b05          	ld	a,(OFST+3,sp)
1187  0171 95            	ld	xh,a
1188  0172 cd044a        	call	L3_TI1_Config
1190  0175 84            	pop	a
1191                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1193  0176 7b08          	ld	a,(OFST+6,sp)
1194  0178 cd0340        	call	_TIM2_SetIC1Prescaler
1196                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1198  017b 7b09          	ld	a,(OFST+7,sp)
1199  017d 88            	push	a
1200  017e 7b03          	ld	a,(OFST+1,sp)
1201  0180 97            	ld	xl,a
1202  0181 7b02          	ld	a,(OFST+0,sp)
1203  0183 95            	ld	xh,a
1204  0184 cd047a        	call	L5_TI2_Config
1206  0187 84            	pop	a
1207                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1209  0188 7b08          	ld	a,(OFST+6,sp)
1210  018a cd034d        	call	_TIM2_SetIC2Prescaler
1213  018d 2024          	jra	L174
1214  018f               L764:
1215                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1215                     ; 320                (uint8_t)TIM2_ICFilter);
1217  018f 7b09          	ld	a,(OFST+7,sp)
1218  0191 88            	push	a
1219  0192 7b08          	ld	a,(OFST+6,sp)
1220  0194 97            	ld	xl,a
1221  0195 7b05          	ld	a,(OFST+3,sp)
1222  0197 95            	ld	xh,a
1223  0198 cd047a        	call	L5_TI2_Config
1225  019b 84            	pop	a
1226                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1228  019c 7b08          	ld	a,(OFST+6,sp)
1229  019e cd034d        	call	_TIM2_SetIC2Prescaler
1231                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1233  01a1 7b09          	ld	a,(OFST+7,sp)
1234  01a3 88            	push	a
1235  01a4 7b03          	ld	a,(OFST+1,sp)
1236  01a6 97            	ld	xl,a
1237  01a7 7b02          	ld	a,(OFST+0,sp)
1238  01a9 95            	ld	xh,a
1239  01aa cd044a        	call	L3_TI1_Config
1241  01ad 84            	pop	a
1242                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1244  01ae 7b08          	ld	a,(OFST+6,sp)
1245  01b0 cd0340        	call	_TIM2_SetIC1Prescaler
1247  01b3               L174:
1248                     ; 331 }
1251  01b3 5b04          	addw	sp,#4
1252  01b5 81            	ret
1307                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1307                     ; 340 {
1308                     	switch	.text
1309  01b6               _TIM2_Cmd:
1313                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1315                     ; 345   if (NewState != DISABLE)
1317  01b6 4d            	tnz	a
1318  01b7 2706          	jreq	L125
1319                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1321  01b9 72105300      	bset	21248,#0
1323  01bd 2004          	jra	L325
1324  01bf               L125:
1325                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1327  01bf 72115300      	bres	21248,#0
1328  01c3               L325:
1329                     ; 353 }
1332  01c3 81            	ret
1411                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1411                     ; 369 {
1412                     	switch	.text
1413  01c4               _TIM2_ITConfig:
1415  01c4 89            	pushw	x
1416       00000000      OFST:	set	0
1419                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1421                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1423                     ; 374   if (NewState != DISABLE)
1425  01c5 9f            	ld	a,xl
1426  01c6 4d            	tnz	a
1427  01c7 2709          	jreq	L365
1428                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1430  01c9 9e            	ld	a,xh
1431  01ca ca5303        	or	a,21251
1432  01cd c75303        	ld	21251,a
1434  01d0 2009          	jra	L565
1435  01d2               L365:
1436                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1438  01d2 7b01          	ld	a,(OFST+1,sp)
1439  01d4 43            	cpl	a
1440  01d5 c45303        	and	a,21251
1441  01d8 c75303        	ld	21251,a
1442  01db               L565:
1443                     ; 384 }
1446  01db 85            	popw	x
1447  01dc 81            	ret
1483                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1483                     ; 393 {
1484                     	switch	.text
1485  01dd               _TIM2_UpdateDisableConfig:
1489                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1491                     ; 398   if (NewState != DISABLE)
1493  01dd 4d            	tnz	a
1494  01de 2706          	jreq	L506
1495                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1497  01e0 72125300      	bset	21248,#1
1499  01e4 2004          	jra	L706
1500  01e6               L506:
1501                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1503  01e6 72135300      	bres	21248,#1
1504  01ea               L706:
1505                     ; 406 }
1508  01ea 81            	ret
1566                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1566                     ; 417 {
1567                     	switch	.text
1568  01eb               _TIM2_UpdateRequestConfig:
1572                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1574                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1576  01eb 4d            	tnz	a
1577  01ec 2706          	jreq	L736
1578                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1580  01ee 72145300      	bset	21248,#2
1582  01f2 2004          	jra	L146
1583  01f4               L736:
1584                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1586  01f4 72155300      	bres	21248,#2
1587  01f8               L146:
1588                     ; 430 }
1591  01f8 81            	ret
1648                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1648                     ; 441 {
1649                     	switch	.text
1650  01f9               _TIM2_SelectOnePulseMode:
1654                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1656                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1658  01f9 4d            	tnz	a
1659  01fa 2706          	jreq	L176
1660                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1662  01fc 72165300      	bset	21248,#3
1664  0200 2004          	jra	L376
1665  0202               L176:
1666                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1668  0202 72175300      	bres	21248,#3
1669  0206               L376:
1670                     ; 454 }
1673  0206 81            	ret
1741                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1741                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1741                     ; 486 {
1742                     	switch	.text
1743  0207               _TIM2_PrescalerConfig:
1747                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1749                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1751                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
1753  0207 9e            	ld	a,xh
1754  0208 c7530e        	ld	21262,a
1755                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
1757  020b 9f            	ld	a,xl
1758  020c c75306        	ld	21254,a
1759                     ; 496 }
1762  020f 81            	ret
1820                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1820                     ; 508 {
1821                     	switch	.text
1822  0210               _TIM2_ForcedOC1Config:
1824  0210 88            	push	a
1825       00000000      OFST:	set	0
1828                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1830                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
1830                     ; 514                             | (uint8_t)TIM2_ForcedAction);
1832  0211 c65307        	ld	a,21255
1833  0214 a48f          	and	a,#143
1834  0216 1a01          	or	a,(OFST+1,sp)
1835  0218 c75307        	ld	21255,a
1836                     ; 515 }
1839  021b 84            	pop	a
1840  021c 81            	ret
1876                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1876                     ; 527 {
1877                     	switch	.text
1878  021d               _TIM2_ForcedOC2Config:
1880  021d 88            	push	a
1881       00000000      OFST:	set	0
1884                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1886                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
1886                     ; 533                           | (uint8_t)TIM2_ForcedAction);
1888  021e c65308        	ld	a,21256
1889  0221 a48f          	and	a,#143
1890  0223 1a01          	or	a,(OFST+1,sp)
1891  0225 c75308        	ld	21256,a
1892                     ; 534 }
1895  0228 84            	pop	a
1896  0229 81            	ret
1932                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1932                     ; 546 {
1933                     	switch	.text
1934  022a               _TIM2_ForcedOC3Config:
1936  022a 88            	push	a
1937       00000000      OFST:	set	0
1940                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1942                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
1942                     ; 552                             | (uint8_t)TIM2_ForcedAction);
1944  022b c65309        	ld	a,21257
1945  022e a48f          	and	a,#143
1946  0230 1a01          	or	a,(OFST+1,sp)
1947  0232 c75309        	ld	21257,a
1948                     ; 553 }
1951  0235 84            	pop	a
1952  0236 81            	ret
1988                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1988                     ; 562 {
1989                     	switch	.text
1990  0237               _TIM2_ARRPreloadConfig:
1994                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1996                     ; 567   if (NewState != DISABLE)
1998  0237 4d            	tnz	a
1999  0238 2706          	jreq	L7201
2000                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
2002  023a 721e5300      	bset	21248,#7
2004  023e 2004          	jra	L1301
2005  0240               L7201:
2006                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2008  0240 721f5300      	bres	21248,#7
2009  0244               L1301:
2010                     ; 575 }
2013  0244 81            	ret
2049                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2049                     ; 584 {
2050                     	switch	.text
2051  0245               _TIM2_OC1PreloadConfig:
2055                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2057                     ; 589   if (NewState != DISABLE)
2059  0245 4d            	tnz	a
2060  0246 2706          	jreq	L1501
2061                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2063  0248 72165307      	bset	21255,#3
2065  024c 2004          	jra	L3501
2066  024e               L1501:
2067                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2069  024e 72175307      	bres	21255,#3
2070  0252               L3501:
2071                     ; 597 }
2074  0252 81            	ret
2110                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2110                     ; 606 {
2111                     	switch	.text
2112  0253               _TIM2_OC2PreloadConfig:
2116                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2118                     ; 611   if (NewState != DISABLE)
2120  0253 4d            	tnz	a
2121  0254 2706          	jreq	L3701
2122                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2124  0256 72165308      	bset	21256,#3
2126  025a 2004          	jra	L5701
2127  025c               L3701:
2128                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2130  025c 72175308      	bres	21256,#3
2131  0260               L5701:
2132                     ; 619 }
2135  0260 81            	ret
2171                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2171                     ; 628 {
2172                     	switch	.text
2173  0261               _TIM2_OC3PreloadConfig:
2177                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2179                     ; 633   if (NewState != DISABLE)
2181  0261 4d            	tnz	a
2182  0262 2706          	jreq	L5111
2183                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2185  0264 72165309      	bset	21257,#3
2187  0268 2004          	jra	L7111
2188  026a               L5111:
2189                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2191  026a 72175309      	bres	21257,#3
2192  026e               L7111:
2193                     ; 641 }
2196  026e 81            	ret
2269                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2269                     ; 654 {
2270                     	switch	.text
2271  026f               _TIM2_GenerateEvent:
2275                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2277                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
2279  026f c75306        	ld	21254,a
2280                     ; 660 }
2283  0272 81            	ret
2319                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2319                     ; 671 {
2320                     	switch	.text
2321  0273               _TIM2_OC1PolarityConfig:
2325                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2327                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2329  0273 4d            	tnz	a
2330  0274 2706          	jreq	L1711
2331                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2333  0276 7212530a      	bset	21258,#1
2335  027a 2004          	jra	L3711
2336  027c               L1711:
2337                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2339  027c 7213530a      	bres	21258,#1
2340  0280               L3711:
2341                     ; 684 }
2344  0280 81            	ret
2380                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2380                     ; 695 {
2381                     	switch	.text
2382  0281               _TIM2_OC2PolarityConfig:
2386                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2388                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2390  0281 4d            	tnz	a
2391  0282 2706          	jreq	L3121
2392                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2394  0284 721a530a      	bset	21258,#5
2396  0288 2004          	jra	L5121
2397  028a               L3121:
2398                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2400  028a 721b530a      	bres	21258,#5
2401  028e               L5121:
2402                     ; 708 }
2405  028e 81            	ret
2441                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2441                     ; 719 {
2442                     	switch	.text
2443  028f               _TIM2_OC3PolarityConfig:
2447                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2449                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2451  028f 4d            	tnz	a
2452  0290 2706          	jreq	L5321
2453                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2455  0292 7212530b      	bset	21259,#1
2457  0296 2004          	jra	L7321
2458  0298               L5321:
2459                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2461  0298 7213530b      	bres	21259,#1
2462  029c               L7321:
2463                     ; 732 }
2466  029c 81            	ret
2511                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2511                     ; 746 {
2512                     	switch	.text
2513  029d               _TIM2_CCxCmd:
2515  029d 89            	pushw	x
2516       00000000      OFST:	set	0
2519                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2521                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2523                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
2525  029e 9e            	ld	a,xh
2526  029f 4d            	tnz	a
2527  02a0 2610          	jrne	L3621
2528                     ; 754     if (NewState != DISABLE)
2530  02a2 9f            	ld	a,xl
2531  02a3 4d            	tnz	a
2532  02a4 2706          	jreq	L5621
2533                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2535  02a6 7210530a      	bset	21258,#0
2537  02aa 202a          	jra	L1721
2538  02ac               L5621:
2539                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2541  02ac 7211530a      	bres	21258,#0
2542  02b0 2024          	jra	L1721
2543  02b2               L3621:
2544                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
2546  02b2 7b01          	ld	a,(OFST+1,sp)
2547  02b4 a101          	cp	a,#1
2548  02b6 2610          	jrne	L3721
2549                     ; 767     if (NewState != DISABLE)
2551  02b8 0d02          	tnz	(OFST+2,sp)
2552  02ba 2706          	jreq	L5721
2553                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2555  02bc 7218530a      	bset	21258,#4
2557  02c0 2014          	jra	L1721
2558  02c2               L5721:
2559                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2561  02c2 7219530a      	bres	21258,#4
2562  02c6 200e          	jra	L1721
2563  02c8               L3721:
2564                     ; 779     if (NewState != DISABLE)
2566  02c8 0d02          	tnz	(OFST+2,sp)
2567  02ca 2706          	jreq	L3031
2568                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2570  02cc 7210530b      	bset	21259,#0
2572  02d0 2004          	jra	L1721
2573  02d2               L3031:
2574                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2576  02d2 7211530b      	bres	21259,#0
2577  02d6               L1721:
2578                     ; 788 }
2581  02d6 85            	popw	x
2582  02d7 81            	ret
2627                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2627                     ; 811 {
2628                     	switch	.text
2629  02d8               _TIM2_SelectOCxM:
2631  02d8 89            	pushw	x
2632       00000000      OFST:	set	0
2635                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2637                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2639                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
2641  02d9 9e            	ld	a,xh
2642  02da 4d            	tnz	a
2643  02db 2610          	jrne	L1331
2644                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2646  02dd 7211530a      	bres	21258,#0
2647                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2647                     ; 823                             | (uint8_t)TIM2_OCMode);
2649  02e1 c65307        	ld	a,21255
2650  02e4 a48f          	and	a,#143
2651  02e6 1a02          	or	a,(OFST+2,sp)
2652  02e8 c75307        	ld	21255,a
2654  02eb 2024          	jra	L3331
2655  02ed               L1331:
2656                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
2658  02ed 7b01          	ld	a,(OFST+1,sp)
2659  02ef a101          	cp	a,#1
2660  02f1 2610          	jrne	L5331
2661                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2663  02f3 7219530a      	bres	21258,#4
2664                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2664                     ; 832                             | (uint8_t)TIM2_OCMode);
2666  02f7 c65308        	ld	a,21256
2667  02fa a48f          	and	a,#143
2668  02fc 1a02          	or	a,(OFST+2,sp)
2669  02fe c75308        	ld	21256,a
2671  0301 200e          	jra	L3331
2672  0303               L5331:
2673                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2675  0303 7211530b      	bres	21259,#0
2676                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2676                     ; 841                             | (uint8_t)TIM2_OCMode);
2678  0307 c65309        	ld	a,21257
2679  030a a48f          	and	a,#143
2680  030c 1a02          	or	a,(OFST+2,sp)
2681  030e c75309        	ld	21257,a
2682  0311               L3331:
2683                     ; 843 }
2686  0311 85            	popw	x
2687  0312 81            	ret
2721                     ; 851 void TIM2_SetCounter(uint16_t Counter)
2721                     ; 852 {
2722                     	switch	.text
2723  0313               _TIM2_SetCounter:
2727                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
2729  0313 9e            	ld	a,xh
2730  0314 c7530c        	ld	21260,a
2731                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
2733  0317 9f            	ld	a,xl
2734  0318 c7530d        	ld	21261,a
2735                     ; 856 }
2738  031b 81            	ret
2772                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
2772                     ; 865 {
2773                     	switch	.text
2774  031c               _TIM2_SetAutoreload:
2778                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2780  031c 9e            	ld	a,xh
2781  031d c7530f        	ld	21263,a
2782                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
2784  0320 9f            	ld	a,xl
2785  0321 c75310        	ld	21264,a
2786                     ; 869 }
2789  0324 81            	ret
2823                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
2823                     ; 878 {
2824                     	switch	.text
2825  0325               _TIM2_SetCompare1:
2829                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
2831  0325 9e            	ld	a,xh
2832  0326 c75311        	ld	21265,a
2833                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
2835  0329 9f            	ld	a,xl
2836  032a c75312        	ld	21266,a
2837                     ; 882 }
2840  032d 81            	ret
2874                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
2874                     ; 891 {
2875                     	switch	.text
2876  032e               _TIM2_SetCompare2:
2880                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
2882  032e 9e            	ld	a,xh
2883  032f c75313        	ld	21267,a
2884                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
2886  0332 9f            	ld	a,xl
2887  0333 c75314        	ld	21268,a
2888                     ; 895 }
2891  0336 81            	ret
2925                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
2925                     ; 904 {
2926                     	switch	.text
2927  0337               _TIM2_SetCompare3:
2931                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
2933  0337 9e            	ld	a,xh
2934  0338 c75315        	ld	21269,a
2935                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
2937  033b 9f            	ld	a,xl
2938  033c c75316        	ld	21270,a
2939                     ; 908 }
2942  033f 81            	ret
2978                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2978                     ; 921 {
2979                     	switch	.text
2980  0340               _TIM2_SetIC1Prescaler:
2982  0340 88            	push	a
2983       00000000      OFST:	set	0
2986                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2988                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2988                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
2990  0341 c65307        	ld	a,21255
2991  0344 a4f3          	and	a,#243
2992  0346 1a01          	or	a,(OFST+1,sp)
2993  0348 c75307        	ld	21255,a
2994                     ; 928 }
2997  034b 84            	pop	a
2998  034c 81            	ret
3034                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3034                     ; 941 {
3035                     	switch	.text
3036  034d               _TIM2_SetIC2Prescaler:
3038  034d 88            	push	a
3039       00000000      OFST:	set	0
3042                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3044                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3044                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
3046  034e c65308        	ld	a,21256
3047  0351 a4f3          	and	a,#243
3048  0353 1a01          	or	a,(OFST+1,sp)
3049  0355 c75308        	ld	21256,a
3050                     ; 948 }
3053  0358 84            	pop	a
3054  0359 81            	ret
3090                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3090                     ; 961 {
3091                     	switch	.text
3092  035a               _TIM2_SetIC3Prescaler:
3094  035a 88            	push	a
3095       00000000      OFST:	set	0
3098                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3100                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3100                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
3102  035b c65309        	ld	a,21257
3103  035e a4f3          	and	a,#243
3104  0360 1a01          	or	a,(OFST+1,sp)
3105  0362 c75309        	ld	21257,a
3106                     ; 968 }
3109  0365 84            	pop	a
3110  0366 81            	ret
3162                     ; 975 uint16_t TIM2_GetCapture1(void)
3162                     ; 976 {
3163                     	switch	.text
3164  0367               _TIM2_GetCapture1:
3166  0367 5204          	subw	sp,#4
3167       00000004      OFST:	set	4
3170                     ; 978   uint16_t tmpccr1 = 0;
3172                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
3176                     ; 981   tmpccr1h = TIM2->CCR1H;
3178  0369 c65311        	ld	a,21265
3179  036c 6b02          	ld	(OFST-2,sp),a
3181                     ; 982   tmpccr1l = TIM2->CCR1L;
3183  036e c65312        	ld	a,21266
3184  0371 6b01          	ld	(OFST-3,sp),a
3186                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
3188  0373 7b01          	ld	a,(OFST-3,sp)
3189  0375 5f            	clrw	x
3190  0376 97            	ld	xl,a
3191  0377 1f03          	ldw	(OFST-1,sp),x
3193                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3195  0379 7b02          	ld	a,(OFST-2,sp)
3196  037b 5f            	clrw	x
3197  037c 97            	ld	xl,a
3198  037d 4f            	clr	a
3199  037e 02            	rlwa	x,a
3200  037f 01            	rrwa	x,a
3201  0380 1a04          	or	a,(OFST+0,sp)
3202  0382 01            	rrwa	x,a
3203  0383 1a03          	or	a,(OFST-1,sp)
3204  0385 01            	rrwa	x,a
3205  0386 1f03          	ldw	(OFST-1,sp),x
3207                     ; 987   return (uint16_t)tmpccr1;
3209  0388 1e03          	ldw	x,(OFST-1,sp)
3212  038a 5b04          	addw	sp,#4
3213  038c 81            	ret
3265                     ; 995 uint16_t TIM2_GetCapture2(void)
3265                     ; 996 {
3266                     	switch	.text
3267  038d               _TIM2_GetCapture2:
3269  038d 5204          	subw	sp,#4
3270       00000004      OFST:	set	4
3273                     ; 998   uint16_t tmpccr2 = 0;
3275                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
3279                     ; 1001   tmpccr2h = TIM2->CCR2H;
3281  038f c65313        	ld	a,21267
3282  0392 6b02          	ld	(OFST-2,sp),a
3284                     ; 1002   tmpccr2l = TIM2->CCR2L;
3286  0394 c65314        	ld	a,21268
3287  0397 6b01          	ld	(OFST-3,sp),a
3289                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
3291  0399 7b01          	ld	a,(OFST-3,sp)
3292  039b 5f            	clrw	x
3293  039c 97            	ld	xl,a
3294  039d 1f03          	ldw	(OFST-1,sp),x
3296                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3298  039f 7b02          	ld	a,(OFST-2,sp)
3299  03a1 5f            	clrw	x
3300  03a2 97            	ld	xl,a
3301  03a3 4f            	clr	a
3302  03a4 02            	rlwa	x,a
3303  03a5 01            	rrwa	x,a
3304  03a6 1a04          	or	a,(OFST+0,sp)
3305  03a8 01            	rrwa	x,a
3306  03a9 1a03          	or	a,(OFST-1,sp)
3307  03ab 01            	rrwa	x,a
3308  03ac 1f03          	ldw	(OFST-1,sp),x
3310                     ; 1007   return (uint16_t)tmpccr2;
3312  03ae 1e03          	ldw	x,(OFST-1,sp)
3315  03b0 5b04          	addw	sp,#4
3316  03b2 81            	ret
3368                     ; 1015 uint16_t TIM2_GetCapture3(void)
3368                     ; 1016 {
3369                     	switch	.text
3370  03b3               _TIM2_GetCapture3:
3372  03b3 5204          	subw	sp,#4
3373       00000004      OFST:	set	4
3376                     ; 1018   uint16_t tmpccr3 = 0;
3378                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
3382                     ; 1021   tmpccr3h = TIM2->CCR3H;
3384  03b5 c65315        	ld	a,21269
3385  03b8 6b02          	ld	(OFST-2,sp),a
3387                     ; 1022   tmpccr3l = TIM2->CCR3L;
3389  03ba c65316        	ld	a,21270
3390  03bd 6b01          	ld	(OFST-3,sp),a
3392                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
3394  03bf 7b01          	ld	a,(OFST-3,sp)
3395  03c1 5f            	clrw	x
3396  03c2 97            	ld	xl,a
3397  03c3 1f03          	ldw	(OFST-1,sp),x
3399                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3401  03c5 7b02          	ld	a,(OFST-2,sp)
3402  03c7 5f            	clrw	x
3403  03c8 97            	ld	xl,a
3404  03c9 4f            	clr	a
3405  03ca 02            	rlwa	x,a
3406  03cb 01            	rrwa	x,a
3407  03cc 1a04          	or	a,(OFST+0,sp)
3408  03ce 01            	rrwa	x,a
3409  03cf 1a03          	or	a,(OFST-1,sp)
3410  03d1 01            	rrwa	x,a
3411  03d2 1f03          	ldw	(OFST-1,sp),x
3413                     ; 1027   return (uint16_t)tmpccr3;
3415  03d4 1e03          	ldw	x,(OFST-1,sp)
3418  03d6 5b04          	addw	sp,#4
3419  03d8 81            	ret
3453                     ; 1035 uint16_t TIM2_GetCounter(void)
3453                     ; 1036 {
3454                     	switch	.text
3455  03d9               _TIM2_GetCounter:
3457  03d9 89            	pushw	x
3458       00000002      OFST:	set	2
3461                     ; 1037   uint16_t tmpcntr = 0;
3463                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3465  03da c6530c        	ld	a,21260
3466  03dd 5f            	clrw	x
3467  03de 97            	ld	xl,a
3468  03df 4f            	clr	a
3469  03e0 02            	rlwa	x,a
3470  03e1 1f01          	ldw	(OFST-1,sp),x
3472                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3474  03e3 c6530d        	ld	a,21261
3475  03e6 5f            	clrw	x
3476  03e7 97            	ld	xl,a
3477  03e8 01            	rrwa	x,a
3478  03e9 1a02          	or	a,(OFST+0,sp)
3479  03eb 01            	rrwa	x,a
3480  03ec 1a01          	or	a,(OFST-1,sp)
3481  03ee 01            	rrwa	x,a
3484  03ef 5b02          	addw	sp,#2
3485  03f1 81            	ret
3509                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3509                     ; 1050 {
3510                     	switch	.text
3511  03f2               _TIM2_GetPrescaler:
3515                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3517  03f2 c6530e        	ld	a,21262
3520  03f5 81            	ret
3659                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3659                     ; 1069 {
3660                     	switch	.text
3661  03f6               _TIM2_GetFlagStatus:
3663  03f6 89            	pushw	x
3664  03f7 89            	pushw	x
3665       00000002      OFST:	set	2
3668                     ; 1070   FlagStatus bitstatus = RESET;
3670                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3674                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3676                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3678  03f8 9f            	ld	a,xl
3679  03f9 c45304        	and	a,21252
3680  03fc 6b01          	ld	(OFST-1,sp),a
3682                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3684  03fe 7b03          	ld	a,(OFST+1,sp)
3685  0400 6b02          	ld	(OFST+0,sp),a
3687                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3689  0402 c65305        	ld	a,21253
3690  0405 1402          	and	a,(OFST+0,sp)
3691  0407 1a01          	or	a,(OFST-1,sp)
3692  0409 2706          	jreq	L5371
3693                     ; 1081     bitstatus = SET;
3695  040b a601          	ld	a,#1
3696  040d 6b02          	ld	(OFST+0,sp),a
3699  040f 2002          	jra	L7371
3700  0411               L5371:
3701                     ; 1085     bitstatus = RESET;
3703  0411 0f02          	clr	(OFST+0,sp)
3705  0413               L7371:
3706                     ; 1087   return (FlagStatus)bitstatus;
3708  0413 7b02          	ld	a,(OFST+0,sp)
3711  0415 5b04          	addw	sp,#4
3712  0417 81            	ret
3747                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3747                     ; 1104 {
3748                     	switch	.text
3749  0418               _TIM2_ClearFlag:
3753                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3755                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3757  0418 9f            	ld	a,xl
3758  0419 43            	cpl	a
3759  041a c75304        	ld	21252,a
3760                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3762  041d 35ff5305      	mov	21253,#255
3763                     ; 1111 }
3766  0421 81            	ret
3830                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3830                     ; 1124 {
3831                     	switch	.text
3832  0422               _TIM2_GetITStatus:
3834  0422 88            	push	a
3835  0423 89            	pushw	x
3836       00000002      OFST:	set	2
3839                     ; 1125   ITStatus bitstatus = RESET;
3841                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3845                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3847                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3849  0424 c45304        	and	a,21252
3850  0427 6b01          	ld	(OFST-1,sp),a
3852                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3854  0429 c65303        	ld	a,21251
3855  042c 1403          	and	a,(OFST+1,sp)
3856  042e 6b02          	ld	(OFST+0,sp),a
3858                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3860  0430 0d01          	tnz	(OFST-1,sp)
3861  0432 270a          	jreq	L1102
3863  0434 0d02          	tnz	(OFST+0,sp)
3864  0436 2706          	jreq	L1102
3865                     ; 1137     bitstatus = SET;
3867  0438 a601          	ld	a,#1
3868  043a 6b02          	ld	(OFST+0,sp),a
3871  043c 2002          	jra	L3102
3872  043e               L1102:
3873                     ; 1141     bitstatus = RESET;
3875  043e 0f02          	clr	(OFST+0,sp)
3877  0440               L3102:
3878                     ; 1143   return (ITStatus)(bitstatus);
3880  0440 7b02          	ld	a,(OFST+0,sp)
3883  0442 5b03          	addw	sp,#3
3884  0444 81            	ret
3920                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3920                     ; 1157 {
3921                     	switch	.text
3922  0445               _TIM2_ClearITPendingBit:
3926                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
3928                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
3930  0445 43            	cpl	a
3931  0446 c75304        	ld	21252,a
3932                     ; 1163 }
3935  0449 81            	ret
3987                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
3987                     ; 1182                        uint8_t TIM2_ICSelection,
3987                     ; 1183                        uint8_t TIM2_ICFilter)
3987                     ; 1184 {
3988                     	switch	.text
3989  044a               L3_TI1_Config:
3991  044a 89            	pushw	x
3992  044b 88            	push	a
3993       00000001      OFST:	set	1
3996                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3998  044c 7211530a      	bres	21258,#0
3999                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
3999                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4001  0450 7b06          	ld	a,(OFST+5,sp)
4002  0452 97            	ld	xl,a
4003  0453 a610          	ld	a,#16
4004  0455 42            	mul	x,a
4005  0456 9f            	ld	a,xl
4006  0457 1a03          	or	a,(OFST+2,sp)
4007  0459 6b01          	ld	(OFST+0,sp),a
4009  045b c65307        	ld	a,21255
4010  045e a40c          	and	a,#12
4011  0460 1a01          	or	a,(OFST+0,sp)
4012  0462 c75307        	ld	21255,a
4013                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4015  0465 0d02          	tnz	(OFST+1,sp)
4016  0467 2706          	jreq	L1602
4017                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
4019  0469 7212530a      	bset	21258,#1
4021  046d 2004          	jra	L3602
4022  046f               L1602:
4023                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
4025  046f 7213530a      	bres	21258,#1
4026  0473               L3602:
4027                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
4029  0473 7210530a      	bset	21258,#0
4030                     ; 1203 }
4033  0477 5b03          	addw	sp,#3
4034  0479 81            	ret
4086                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
4086                     ; 1222                        uint8_t TIM2_ICSelection,
4086                     ; 1223                        uint8_t TIM2_ICFilter)
4086                     ; 1224 {
4087                     	switch	.text
4088  047a               L5_TI2_Config:
4090  047a 89            	pushw	x
4091  047b 88            	push	a
4092       00000001      OFST:	set	1
4095                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4097  047c 7219530a      	bres	21258,#4
4098                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4098                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4100  0480 7b06          	ld	a,(OFST+5,sp)
4101  0482 97            	ld	xl,a
4102  0483 a610          	ld	a,#16
4103  0485 42            	mul	x,a
4104  0486 9f            	ld	a,xl
4105  0487 1a03          	or	a,(OFST+2,sp)
4106  0489 6b01          	ld	(OFST+0,sp),a
4108  048b c65308        	ld	a,21256
4109  048e a40c          	and	a,#12
4110  0490 1a01          	or	a,(OFST+0,sp)
4111  0492 c75308        	ld	21256,a
4112                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4114  0495 0d02          	tnz	(OFST+1,sp)
4115  0497 2706          	jreq	L3112
4116                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
4118  0499 721a530a      	bset	21258,#5
4120  049d 2004          	jra	L5112
4121  049f               L3112:
4122                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4124  049f 721b530a      	bres	21258,#5
4125  04a3               L5112:
4126                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
4128  04a3 7218530a      	bset	21258,#4
4129                     ; 1245 }
4132  04a7 5b03          	addw	sp,#3
4133  04a9 81            	ret
4185                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4185                     ; 1262                        uint8_t TIM2_ICFilter)
4185                     ; 1263 {
4186                     	switch	.text
4187  04aa               L7_TI3_Config:
4189  04aa 89            	pushw	x
4190  04ab 88            	push	a
4191       00000001      OFST:	set	1
4194                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4196  04ac 7211530b      	bres	21259,#0
4197                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4197                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4199  04b0 7b06          	ld	a,(OFST+5,sp)
4200  04b2 97            	ld	xl,a
4201  04b3 a610          	ld	a,#16
4202  04b5 42            	mul	x,a
4203  04b6 9f            	ld	a,xl
4204  04b7 1a03          	or	a,(OFST+2,sp)
4205  04b9 6b01          	ld	(OFST+0,sp),a
4207  04bb c65309        	ld	a,21257
4208  04be a40c          	and	a,#12
4209  04c0 1a01          	or	a,(OFST+0,sp)
4210  04c2 c75309        	ld	21257,a
4211                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4213  04c5 0d02          	tnz	(OFST+1,sp)
4214  04c7 2706          	jreq	L5412
4215                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
4217  04c9 7212530b      	bset	21259,#1
4219  04cd 2004          	jra	L7412
4220  04cf               L5412:
4221                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4223  04cf 7213530b      	bres	21259,#1
4224  04d3               L7412:
4225                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
4227  04d3 7210530b      	bset	21259,#0
4228                     ; 1283 }
4231  04d7 5b03          	addw	sp,#3
4232  04d9 81            	ret
4245                     	xdef	_TIM2_ClearITPendingBit
4246                     	xdef	_TIM2_GetITStatus
4247                     	xdef	_TIM2_ClearFlag
4248                     	xdef	_TIM2_GetFlagStatus
4249                     	xdef	_TIM2_GetPrescaler
4250                     	xdef	_TIM2_GetCounter
4251                     	xdef	_TIM2_GetCapture3
4252                     	xdef	_TIM2_GetCapture2
4253                     	xdef	_TIM2_GetCapture1
4254                     	xdef	_TIM2_SetIC3Prescaler
4255                     	xdef	_TIM2_SetIC2Prescaler
4256                     	xdef	_TIM2_SetIC1Prescaler
4257                     	xdef	_TIM2_SetCompare3
4258                     	xdef	_TIM2_SetCompare2
4259                     	xdef	_TIM2_SetCompare1
4260                     	xdef	_TIM2_SetAutoreload
4261                     	xdef	_TIM2_SetCounter
4262                     	xdef	_TIM2_SelectOCxM
4263                     	xdef	_TIM2_CCxCmd
4264                     	xdef	_TIM2_OC3PolarityConfig
4265                     	xdef	_TIM2_OC2PolarityConfig
4266                     	xdef	_TIM2_OC1PolarityConfig
4267                     	xdef	_TIM2_GenerateEvent
4268                     	xdef	_TIM2_OC3PreloadConfig
4269                     	xdef	_TIM2_OC2PreloadConfig
4270                     	xdef	_TIM2_OC1PreloadConfig
4271                     	xdef	_TIM2_ARRPreloadConfig
4272                     	xdef	_TIM2_ForcedOC3Config
4273                     	xdef	_TIM2_ForcedOC2Config
4274                     	xdef	_TIM2_ForcedOC1Config
4275                     	xdef	_TIM2_PrescalerConfig
4276                     	xdef	_TIM2_SelectOnePulseMode
4277                     	xdef	_TIM2_UpdateRequestConfig
4278                     	xdef	_TIM2_UpdateDisableConfig
4279                     	xdef	_TIM2_ITConfig
4280                     	xdef	_TIM2_Cmd
4281                     	xdef	_TIM2_PWMIConfig
4282                     	xdef	_TIM2_ICInit
4283                     	xdef	_TIM2_OC3Init
4284                     	xdef	_TIM2_OC2Init
4285                     	xdef	_TIM2_OC1Init
4286                     	xdef	_TIM2_TimeBaseInit
4287                     	xdef	_TIM2_DeInit
4306                     	end
