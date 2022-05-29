   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  42                     ; 52 void TIM2_DeInit(void)
  42                     ; 53 {
  44                     	switch	.text
  45  0000               _TIM2_DeInit:
  49                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  51  0000 725f5300      	clr	21248
  52                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  54  0004 725f5301      	clr	21249
  55                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  57  0008 725f5303      	clr	21251
  58                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  60  000c 725f5308      	clr	21256
  61                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  63  0010 725f5309      	clr	21257
  64                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  66  0014 725f5308      	clr	21256
  67                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  69  0018 725f5309      	clr	21257
  70                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  72  001c 725f5305      	clr	21253
  73                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  75  0020 725f5306      	clr	21254
  76                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  78  0024 725f5307      	clr	21255
  79                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  81  0028 725f530a      	clr	21258
  82                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  84  002c 725f530b      	clr	21259
  85                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  87  0030 725f530c      	clr	21260
  88                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  90  0034 35ff530d      	mov	21261,#255
  91                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  93  0038 35ff530e      	mov	21262,#255
  94                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
  96  003c 725f530f      	clr	21263
  97                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
  99  0040 725f5310      	clr	21264
 100                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 102  0044 725f5311      	clr	21265
 103                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 105  0048 725f5312      	clr	21266
 106                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 108  004c 725f5313      	clr	21267
 109                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 111  0050 725f5314      	clr	21268
 112                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 114  0054 725f5302      	clr	21250
 115                     ; 81 }
 118  0058 81            	ret
 284                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 284                     ; 90                         uint16_t TIM2_Period)
 284                     ; 91 {
 285                     	switch	.text
 286  0059               _TIM2_TimeBaseInit:
 288  0059 88            	push	a
 289       00000000      OFST:	set	0
 292                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 294  005a c7530c        	ld	21260,a
 295                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 297  005d 7b04          	ld	a,(OFST+4,sp)
 298  005f c7530d        	ld	21261,a
 299                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 301  0062 7b05          	ld	a,(OFST+5,sp)
 302  0064 c7530e        	ld	21262,a
 303                     ; 97 }
 306  0067 84            	pop	a
 307  0068 81            	ret
 462                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 462                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 462                     ; 110                   uint16_t TIM2_Pulse,
 462                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 462                     ; 112 {
 463                     	switch	.text
 464  0069               _TIM2_OC1Init:
 466  0069 89            	pushw	x
 467  006a 88            	push	a
 468       00000001      OFST:	set	1
 471                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 473                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 475                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 477                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 479  006b c65308        	ld	a,21256
 480  006e a4fc          	and	a,#252
 481  0070 c75308        	ld	21256,a
 482                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 482                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 484  0073 7b08          	ld	a,(OFST+7,sp)
 485  0075 a402          	and	a,#2
 486  0077 6b01          	ld	(OFST+0,sp),a
 488  0079 9f            	ld	a,xl
 489  007a a401          	and	a,#1
 490  007c 1a01          	or	a,(OFST+0,sp)
 491  007e ca5308        	or	a,21256
 492  0081 c75308        	ld	21256,a
 493                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 493                     ; 126                           (uint8_t)TIM2_OCMode);
 495  0084 c65305        	ld	a,21253
 496  0087 a48f          	and	a,#143
 497  0089 1a02          	or	a,(OFST+1,sp)
 498  008b c75305        	ld	21253,a
 499                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 501  008e 7b06          	ld	a,(OFST+5,sp)
 502  0090 c7530f        	ld	21263,a
 503                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 505  0093 7b07          	ld	a,(OFST+6,sp)
 506  0095 c75310        	ld	21264,a
 507                     ; 131 }
 510  0098 5b03          	addw	sp,#3
 511  009a 81            	ret
 573                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 573                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 573                     ; 144                   uint16_t TIM2_Pulse,
 573                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 573                     ; 146 {
 574                     	switch	.text
 575  009b               _TIM2_OC2Init:
 577  009b 89            	pushw	x
 578  009c 88            	push	a
 579       00000001      OFST:	set	1
 582                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 584                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 586                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 588                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 590  009d c65308        	ld	a,21256
 591  00a0 a4cf          	and	a,#207
 592  00a2 c75308        	ld	21256,a
 593                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 593                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 595  00a5 7b08          	ld	a,(OFST+7,sp)
 596  00a7 a420          	and	a,#32
 597  00a9 6b01          	ld	(OFST+0,sp),a
 599  00ab 9f            	ld	a,xl
 600  00ac a410          	and	a,#16
 601  00ae 1a01          	or	a,(OFST+0,sp)
 602  00b0 ca5308        	or	a,21256
 603  00b3 c75308        	ld	21256,a
 604                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 604                     ; 162                           (uint8_t)TIM2_OCMode);
 606  00b6 c65306        	ld	a,21254
 607  00b9 a48f          	and	a,#143
 608  00bb 1a02          	or	a,(OFST+1,sp)
 609  00bd c75306        	ld	21254,a
 610                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 612  00c0 7b06          	ld	a,(OFST+5,sp)
 613  00c2 c75311        	ld	21265,a
 614                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 616  00c5 7b07          	ld	a,(OFST+6,sp)
 617  00c7 c75312        	ld	21266,a
 618                     ; 168 }
 621  00ca 5b03          	addw	sp,#3
 622  00cc 81            	ret
 684                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 684                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 684                     ; 181                   uint16_t TIM2_Pulse,
 684                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 684                     ; 183 {
 685                     	switch	.text
 686  00cd               _TIM2_OC3Init:
 688  00cd 89            	pushw	x
 689  00ce 88            	push	a
 690       00000001      OFST:	set	1
 693                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 695                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 697                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 699                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 701  00cf c65309        	ld	a,21257
 702  00d2 a4fc          	and	a,#252
 703  00d4 c75309        	ld	21257,a
 704                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 704                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 706  00d7 7b08          	ld	a,(OFST+7,sp)
 707  00d9 a402          	and	a,#2
 708  00db 6b01          	ld	(OFST+0,sp),a
 710  00dd 9f            	ld	a,xl
 711  00de a401          	and	a,#1
 712  00e0 1a01          	or	a,(OFST+0,sp)
 713  00e2 ca5309        	or	a,21257
 714  00e5 c75309        	ld	21257,a
 715                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 715                     ; 196                           (uint8_t)TIM2_OCMode);
 717  00e8 c65307        	ld	a,21255
 718  00eb a48f          	and	a,#143
 719  00ed 1a02          	or	a,(OFST+1,sp)
 720  00ef c75307        	ld	21255,a
 721                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 723  00f2 7b06          	ld	a,(OFST+5,sp)
 724  00f4 c75313        	ld	21267,a
 725                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 727  00f7 7b07          	ld	a,(OFST+6,sp)
 728  00f9 c75314        	ld	21268,a
 729                     ; 201 }
 732  00fc 5b03          	addw	sp,#3
 733  00fe 81            	ret
 924                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 924                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 924                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 924                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 924                     ; 216                  uint8_t TIM2_ICFilter)
 924                     ; 217 {
 925                     	switch	.text
 926  00ff               _TIM2_ICInit:
 928  00ff 89            	pushw	x
 929       00000000      OFST:	set	0
 932                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 934                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 936                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 938                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 940                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 942                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
 944  0100 9e            	ld	a,xh
 945  0101 4d            	tnz	a
 946  0102 2614          	jrne	L763
 947                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
 947                     ; 229                (uint8_t)TIM2_ICSelection,
 947                     ; 230                (uint8_t)TIM2_ICFilter);
 949  0104 7b07          	ld	a,(OFST+7,sp)
 950  0106 88            	push	a
 951  0107 7b06          	ld	a,(OFST+6,sp)
 952  0109 97            	ld	xl,a
 953  010a 7b03          	ld	a,(OFST+3,sp)
 954  010c 95            	ld	xh,a
 955  010d cd044a        	call	L3_TI1_Config
 957  0110 84            	pop	a
 958                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 960  0111 7b06          	ld	a,(OFST+6,sp)
 961  0113 cd0340        	call	_TIM2_SetIC1Prescaler
 964  0116 202c          	jra	L173
 965  0118               L763:
 966                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
 968  0118 7b01          	ld	a,(OFST+1,sp)
 969  011a a101          	cp	a,#1
 970  011c 2614          	jrne	L373
 971                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
 971                     ; 239                (uint8_t)TIM2_ICSelection,
 971                     ; 240                (uint8_t)TIM2_ICFilter);
 973  011e 7b07          	ld	a,(OFST+7,sp)
 974  0120 88            	push	a
 975  0121 7b06          	ld	a,(OFST+6,sp)
 976  0123 97            	ld	xl,a
 977  0124 7b03          	ld	a,(OFST+3,sp)
 978  0126 95            	ld	xh,a
 979  0127 cd047a        	call	L5_TI2_Config
 981  012a 84            	pop	a
 982                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 984  012b 7b06          	ld	a,(OFST+6,sp)
 985  012d cd034d        	call	_TIM2_SetIC2Prescaler
 988  0130 2012          	jra	L173
 989  0132               L373:
 990                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
 990                     ; 249                (uint8_t)TIM2_ICSelection,
 990                     ; 250                (uint8_t)TIM2_ICFilter);
 992  0132 7b07          	ld	a,(OFST+7,sp)
 993  0134 88            	push	a
 994  0135 7b06          	ld	a,(OFST+6,sp)
 995  0137 97            	ld	xl,a
 996  0138 7b03          	ld	a,(OFST+3,sp)
 997  013a 95            	ld	xh,a
 998  013b cd04aa        	call	L7_TI3_Config
1000  013e 84            	pop	a
1001                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1003  013f 7b06          	ld	a,(OFST+6,sp)
1004  0141 cd035a        	call	_TIM2_SetIC3Prescaler
1006  0144               L173:
1007                     ; 255 }
1010  0144 85            	popw	x
1011  0145 81            	ret
1101                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1101                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1101                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1101                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1101                     ; 270                      uint8_t TIM2_ICFilter)
1101                     ; 271 {
1102                     	switch	.text
1103  0146               _TIM2_PWMIConfig:
1105  0146 89            	pushw	x
1106  0147 89            	pushw	x
1107       00000002      OFST:	set	2
1110                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1112                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1114                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1116                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1118                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1120                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1122                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1124  0148 9f            	ld	a,xl
1125  0149 a144          	cp	a,#68
1126  014b 2706          	jreq	L734
1127                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1129  014d a644          	ld	a,#68
1130  014f 6b01          	ld	(OFST-1,sp),a
1133  0151 2002          	jra	L144
1134  0153               L734:
1135                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1137  0153 0f01          	clr	(OFST-1,sp)
1139  0155               L144:
1140                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1142  0155 7b07          	ld	a,(OFST+5,sp)
1143  0157 a101          	cp	a,#1
1144  0159 2606          	jrne	L344
1145                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1147  015b a602          	ld	a,#2
1148  015d 6b02          	ld	(OFST+0,sp),a
1151  015f 2004          	jra	L544
1152  0161               L344:
1153                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1155  0161 a601          	ld	a,#1
1156  0163 6b02          	ld	(OFST+0,sp),a
1158  0165               L544:
1159                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1161  0165 0d03          	tnz	(OFST+1,sp)
1162  0167 2626          	jrne	L744
1163                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1163                     ; 305                (uint8_t)TIM2_ICFilter);
1165  0169 7b09          	ld	a,(OFST+7,sp)
1166  016b 88            	push	a
1167  016c 7b08          	ld	a,(OFST+6,sp)
1168  016e 97            	ld	xl,a
1169  016f 7b05          	ld	a,(OFST+3,sp)
1170  0171 95            	ld	xh,a
1171  0172 cd044a        	call	L3_TI1_Config
1173  0175 84            	pop	a
1174                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1176  0176 7b08          	ld	a,(OFST+6,sp)
1177  0178 cd0340        	call	_TIM2_SetIC1Prescaler
1179                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1181  017b 7b09          	ld	a,(OFST+7,sp)
1182  017d 88            	push	a
1183  017e 7b03          	ld	a,(OFST+1,sp)
1184  0180 97            	ld	xl,a
1185  0181 7b02          	ld	a,(OFST+0,sp)
1186  0183 95            	ld	xh,a
1187  0184 cd047a        	call	L5_TI2_Config
1189  0187 84            	pop	a
1190                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1192  0188 7b08          	ld	a,(OFST+6,sp)
1193  018a cd034d        	call	_TIM2_SetIC2Prescaler
1196  018d 2024          	jra	L154
1197  018f               L744:
1198                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1198                     ; 320                (uint8_t)TIM2_ICFilter);
1200  018f 7b09          	ld	a,(OFST+7,sp)
1201  0191 88            	push	a
1202  0192 7b08          	ld	a,(OFST+6,sp)
1203  0194 97            	ld	xl,a
1204  0195 7b05          	ld	a,(OFST+3,sp)
1205  0197 95            	ld	xh,a
1206  0198 cd047a        	call	L5_TI2_Config
1208  019b 84            	pop	a
1209                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1211  019c 7b08          	ld	a,(OFST+6,sp)
1212  019e cd034d        	call	_TIM2_SetIC2Prescaler
1214                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1216  01a1 7b09          	ld	a,(OFST+7,sp)
1217  01a3 88            	push	a
1218  01a4 7b03          	ld	a,(OFST+1,sp)
1219  01a6 97            	ld	xl,a
1220  01a7 7b02          	ld	a,(OFST+0,sp)
1221  01a9 95            	ld	xh,a
1222  01aa cd044a        	call	L3_TI1_Config
1224  01ad 84            	pop	a
1225                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1227  01ae 7b08          	ld	a,(OFST+6,sp)
1228  01b0 cd0340        	call	_TIM2_SetIC1Prescaler
1230  01b3               L154:
1231                     ; 331 }
1234  01b3 5b04          	addw	sp,#4
1235  01b5 81            	ret
1290                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1290                     ; 340 {
1291                     	switch	.text
1292  01b6               _TIM2_Cmd:
1296                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1298                     ; 345   if (NewState != DISABLE)
1300  01b6 4d            	tnz	a
1301  01b7 2706          	jreq	L105
1302                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1304  01b9 72105300      	bset	21248,#0
1306  01bd 2004          	jra	L305
1307  01bf               L105:
1308                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1310  01bf 72115300      	bres	21248,#0
1311  01c3               L305:
1312                     ; 353 }
1315  01c3 81            	ret
1394                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1394                     ; 369 {
1395                     	switch	.text
1396  01c4               _TIM2_ITConfig:
1398  01c4 89            	pushw	x
1399       00000000      OFST:	set	0
1402                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1404                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1406                     ; 374   if (NewState != DISABLE)
1408  01c5 9f            	ld	a,xl
1409  01c6 4d            	tnz	a
1410  01c7 2709          	jreq	L345
1411                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1413  01c9 9e            	ld	a,xh
1414  01ca ca5301        	or	a,21249
1415  01cd c75301        	ld	21249,a
1417  01d0 2009          	jra	L545
1418  01d2               L345:
1419                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1421  01d2 7b01          	ld	a,(OFST+1,sp)
1422  01d4 43            	cpl	a
1423  01d5 c45301        	and	a,21249
1424  01d8 c75301        	ld	21249,a
1425  01db               L545:
1426                     ; 384 }
1429  01db 85            	popw	x
1430  01dc 81            	ret
1466                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1466                     ; 393 {
1467                     	switch	.text
1468  01dd               _TIM2_UpdateDisableConfig:
1472                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1474                     ; 398   if (NewState != DISABLE)
1476  01dd 4d            	tnz	a
1477  01de 2706          	jreq	L565
1478                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1480  01e0 72125300      	bset	21248,#1
1482  01e4 2004          	jra	L765
1483  01e6               L565:
1484                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1486  01e6 72135300      	bres	21248,#1
1487  01ea               L765:
1488                     ; 406 }
1491  01ea 81            	ret
1549                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1549                     ; 417 {
1550                     	switch	.text
1551  01eb               _TIM2_UpdateRequestConfig:
1555                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1557                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1559  01eb 4d            	tnz	a
1560  01ec 2706          	jreq	L716
1561                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1563  01ee 72145300      	bset	21248,#2
1565  01f2 2004          	jra	L126
1566  01f4               L716:
1567                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1569  01f4 72155300      	bres	21248,#2
1570  01f8               L126:
1571                     ; 430 }
1574  01f8 81            	ret
1631                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1631                     ; 441 {
1632                     	switch	.text
1633  01f9               _TIM2_SelectOnePulseMode:
1637                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1639                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1641  01f9 4d            	tnz	a
1642  01fa 2706          	jreq	L156
1643                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1645  01fc 72165300      	bset	21248,#3
1647  0200 2004          	jra	L356
1648  0202               L156:
1649                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1651  0202 72175300      	bres	21248,#3
1652  0206               L356:
1653                     ; 454 }
1656  0206 81            	ret
1724                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1724                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1724                     ; 486 {
1725                     	switch	.text
1726  0207               _TIM2_PrescalerConfig:
1730                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1732                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1734                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
1736  0207 9e            	ld	a,xh
1737  0208 c7530c        	ld	21260,a
1738                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
1740  020b 9f            	ld	a,xl
1741  020c c75304        	ld	21252,a
1742                     ; 496 }
1745  020f 81            	ret
1803                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1803                     ; 508 {
1804                     	switch	.text
1805  0210               _TIM2_ForcedOC1Config:
1807  0210 88            	push	a
1808       00000000      OFST:	set	0
1811                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1813                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
1813                     ; 514                             | (uint8_t)TIM2_ForcedAction);
1815  0211 c65305        	ld	a,21253
1816  0214 a48f          	and	a,#143
1817  0216 1a01          	or	a,(OFST+1,sp)
1818  0218 c75305        	ld	21253,a
1819                     ; 515 }
1822  021b 84            	pop	a
1823  021c 81            	ret
1859                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1859                     ; 527 {
1860                     	switch	.text
1861  021d               _TIM2_ForcedOC2Config:
1863  021d 88            	push	a
1864       00000000      OFST:	set	0
1867                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1869                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
1869                     ; 533                           | (uint8_t)TIM2_ForcedAction);
1871  021e c65306        	ld	a,21254
1872  0221 a48f          	and	a,#143
1873  0223 1a01          	or	a,(OFST+1,sp)
1874  0225 c75306        	ld	21254,a
1875                     ; 534 }
1878  0228 84            	pop	a
1879  0229 81            	ret
1915                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1915                     ; 546 {
1916                     	switch	.text
1917  022a               _TIM2_ForcedOC3Config:
1919  022a 88            	push	a
1920       00000000      OFST:	set	0
1923                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1925                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
1925                     ; 552                             | (uint8_t)TIM2_ForcedAction);
1927  022b c65307        	ld	a,21255
1928  022e a48f          	and	a,#143
1929  0230 1a01          	or	a,(OFST+1,sp)
1930  0232 c75307        	ld	21255,a
1931                     ; 553 }
1934  0235 84            	pop	a
1935  0236 81            	ret
1971                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1971                     ; 562 {
1972                     	switch	.text
1973  0237               _TIM2_ARRPreloadConfig:
1977                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1979                     ; 567   if (NewState != DISABLE)
1981  0237 4d            	tnz	a
1982  0238 2706          	jreq	L7001
1983                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
1985  023a 721e5300      	bset	21248,#7
1987  023e 2004          	jra	L1101
1988  0240               L7001:
1989                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
1991  0240 721f5300      	bres	21248,#7
1992  0244               L1101:
1993                     ; 575 }
1996  0244 81            	ret
2032                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2032                     ; 584 {
2033                     	switch	.text
2034  0245               _TIM2_OC1PreloadConfig:
2038                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2040                     ; 589   if (NewState != DISABLE)
2042  0245 4d            	tnz	a
2043  0246 2706          	jreq	L1301
2044                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2046  0248 72165305      	bset	21253,#3
2048  024c 2004          	jra	L3301
2049  024e               L1301:
2050                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2052  024e 72175305      	bres	21253,#3
2053  0252               L3301:
2054                     ; 597 }
2057  0252 81            	ret
2093                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2093                     ; 606 {
2094                     	switch	.text
2095  0253               _TIM2_OC2PreloadConfig:
2099                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2101                     ; 611   if (NewState != DISABLE)
2103  0253 4d            	tnz	a
2104  0254 2706          	jreq	L3501
2105                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2107  0256 72165306      	bset	21254,#3
2109  025a 2004          	jra	L5501
2110  025c               L3501:
2111                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2113  025c 72175306      	bres	21254,#3
2114  0260               L5501:
2115                     ; 619 }
2118  0260 81            	ret
2154                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2154                     ; 628 {
2155                     	switch	.text
2156  0261               _TIM2_OC3PreloadConfig:
2160                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2162                     ; 633   if (NewState != DISABLE)
2164  0261 4d            	tnz	a
2165  0262 2706          	jreq	L5701
2166                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2168  0264 72165307      	bset	21255,#3
2170  0268 2004          	jra	L7701
2171  026a               L5701:
2172                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2174  026a 72175307      	bres	21255,#3
2175  026e               L7701:
2176                     ; 641 }
2179  026e 81            	ret
2252                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2252                     ; 654 {
2253                     	switch	.text
2254  026f               _TIM2_GenerateEvent:
2258                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2260                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
2262  026f c75304        	ld	21252,a
2263                     ; 660 }
2266  0272 81            	ret
2302                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2302                     ; 671 {
2303                     	switch	.text
2304  0273               _TIM2_OC1PolarityConfig:
2308                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2310                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2312  0273 4d            	tnz	a
2313  0274 2706          	jreq	L1511
2314                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2316  0276 72125308      	bset	21256,#1
2318  027a 2004          	jra	L3511
2319  027c               L1511:
2320                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2322  027c 72135308      	bres	21256,#1
2323  0280               L3511:
2324                     ; 684 }
2327  0280 81            	ret
2363                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2363                     ; 695 {
2364                     	switch	.text
2365  0281               _TIM2_OC2PolarityConfig:
2369                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2371                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2373  0281 4d            	tnz	a
2374  0282 2706          	jreq	L3711
2375                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2377  0284 721a5308      	bset	21256,#5
2379  0288 2004          	jra	L5711
2380  028a               L3711:
2381                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2383  028a 721b5308      	bres	21256,#5
2384  028e               L5711:
2385                     ; 708 }
2388  028e 81            	ret
2424                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2424                     ; 719 {
2425                     	switch	.text
2426  028f               _TIM2_OC3PolarityConfig:
2430                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2432                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2434  028f 4d            	tnz	a
2435  0290 2706          	jreq	L5121
2436                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2438  0292 72125309      	bset	21257,#1
2440  0296 2004          	jra	L7121
2441  0298               L5121:
2442                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2444  0298 72135309      	bres	21257,#1
2445  029c               L7121:
2446                     ; 732 }
2449  029c 81            	ret
2494                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2494                     ; 746 {
2495                     	switch	.text
2496  029d               _TIM2_CCxCmd:
2498  029d 89            	pushw	x
2499       00000000      OFST:	set	0
2502                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2504                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2506                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
2508  029e 9e            	ld	a,xh
2509  029f 4d            	tnz	a
2510  02a0 2610          	jrne	L3421
2511                     ; 754     if (NewState != DISABLE)
2513  02a2 9f            	ld	a,xl
2514  02a3 4d            	tnz	a
2515  02a4 2706          	jreq	L5421
2516                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2518  02a6 72105308      	bset	21256,#0
2520  02aa 202a          	jra	L1521
2521  02ac               L5421:
2522                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2524  02ac 72115308      	bres	21256,#0
2525  02b0 2024          	jra	L1521
2526  02b2               L3421:
2527                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
2529  02b2 7b01          	ld	a,(OFST+1,sp)
2530  02b4 a101          	cp	a,#1
2531  02b6 2610          	jrne	L3521
2532                     ; 767     if (NewState != DISABLE)
2534  02b8 0d02          	tnz	(OFST+2,sp)
2535  02ba 2706          	jreq	L5521
2536                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2538  02bc 72185308      	bset	21256,#4
2540  02c0 2014          	jra	L1521
2541  02c2               L5521:
2542                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2544  02c2 72195308      	bres	21256,#4
2545  02c6 200e          	jra	L1521
2546  02c8               L3521:
2547                     ; 779     if (NewState != DISABLE)
2549  02c8 0d02          	tnz	(OFST+2,sp)
2550  02ca 2706          	jreq	L3621
2551                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2553  02cc 72105309      	bset	21257,#0
2555  02d0 2004          	jra	L1521
2556  02d2               L3621:
2557                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2559  02d2 72115309      	bres	21257,#0
2560  02d6               L1521:
2561                     ; 788 }
2564  02d6 85            	popw	x
2565  02d7 81            	ret
2610                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2610                     ; 811 {
2611                     	switch	.text
2612  02d8               _TIM2_SelectOCxM:
2614  02d8 89            	pushw	x
2615       00000000      OFST:	set	0
2618                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2620                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2622                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
2624  02d9 9e            	ld	a,xh
2625  02da 4d            	tnz	a
2626  02db 2610          	jrne	L1131
2627                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2629  02dd 72115308      	bres	21256,#0
2630                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2630                     ; 823                             | (uint8_t)TIM2_OCMode);
2632  02e1 c65305        	ld	a,21253
2633  02e4 a48f          	and	a,#143
2634  02e6 1a02          	or	a,(OFST+2,sp)
2635  02e8 c75305        	ld	21253,a
2637  02eb 2024          	jra	L3131
2638  02ed               L1131:
2639                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
2641  02ed 7b01          	ld	a,(OFST+1,sp)
2642  02ef a101          	cp	a,#1
2643  02f1 2610          	jrne	L5131
2644                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2646  02f3 72195308      	bres	21256,#4
2647                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2647                     ; 832                             | (uint8_t)TIM2_OCMode);
2649  02f7 c65306        	ld	a,21254
2650  02fa a48f          	and	a,#143
2651  02fc 1a02          	or	a,(OFST+2,sp)
2652  02fe c75306        	ld	21254,a
2654  0301 200e          	jra	L3131
2655  0303               L5131:
2656                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2658  0303 72115309      	bres	21257,#0
2659                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2659                     ; 841                             | (uint8_t)TIM2_OCMode);
2661  0307 c65307        	ld	a,21255
2662  030a a48f          	and	a,#143
2663  030c 1a02          	or	a,(OFST+2,sp)
2664  030e c75307        	ld	21255,a
2665  0311               L3131:
2666                     ; 843 }
2669  0311 85            	popw	x
2670  0312 81            	ret
2702                     ; 851 void TIM2_SetCounter(uint16_t Counter)
2702                     ; 852 {
2703                     	switch	.text
2704  0313               _TIM2_SetCounter:
2708                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
2710  0313 9e            	ld	a,xh
2711  0314 c7530a        	ld	21258,a
2712                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
2714  0317 9f            	ld	a,xl
2715  0318 c7530b        	ld	21259,a
2716                     ; 856 }
2719  031b 81            	ret
2751                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
2751                     ; 865 {
2752                     	switch	.text
2753  031c               _TIM2_SetAutoreload:
2757                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2759  031c 9e            	ld	a,xh
2760  031d c7530d        	ld	21261,a
2761                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
2763  0320 9f            	ld	a,xl
2764  0321 c7530e        	ld	21262,a
2765                     ; 869 }
2768  0324 81            	ret
2800                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
2800                     ; 878 {
2801                     	switch	.text
2802  0325               _TIM2_SetCompare1:
2806                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
2808  0325 9e            	ld	a,xh
2809  0326 c7530f        	ld	21263,a
2810                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
2812  0329 9f            	ld	a,xl
2813  032a c75310        	ld	21264,a
2814                     ; 882 }
2817  032d 81            	ret
2849                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
2849                     ; 891 {
2850                     	switch	.text
2851  032e               _TIM2_SetCompare2:
2855                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
2857  032e 9e            	ld	a,xh
2858  032f c75311        	ld	21265,a
2859                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
2861  0332 9f            	ld	a,xl
2862  0333 c75312        	ld	21266,a
2863                     ; 895 }
2866  0336 81            	ret
2898                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
2898                     ; 904 {
2899                     	switch	.text
2900  0337               _TIM2_SetCompare3:
2904                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
2906  0337 9e            	ld	a,xh
2907  0338 c75313        	ld	21267,a
2908                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
2910  033b 9f            	ld	a,xl
2911  033c c75314        	ld	21268,a
2912                     ; 908 }
2915  033f 81            	ret
2951                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2951                     ; 921 {
2952                     	switch	.text
2953  0340               _TIM2_SetIC1Prescaler:
2955  0340 88            	push	a
2956       00000000      OFST:	set	0
2959                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2961                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2961                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
2963  0341 c65305        	ld	a,21253
2964  0344 a4f3          	and	a,#243
2965  0346 1a01          	or	a,(OFST+1,sp)
2966  0348 c75305        	ld	21253,a
2967                     ; 928 }
2970  034b 84            	pop	a
2971  034c 81            	ret
3007                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3007                     ; 941 {
3008                     	switch	.text
3009  034d               _TIM2_SetIC2Prescaler:
3011  034d 88            	push	a
3012       00000000      OFST:	set	0
3015                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3017                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3017                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
3019  034e c65306        	ld	a,21254
3020  0351 a4f3          	and	a,#243
3021  0353 1a01          	or	a,(OFST+1,sp)
3022  0355 c75306        	ld	21254,a
3023                     ; 948 }
3026  0358 84            	pop	a
3027  0359 81            	ret
3063                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3063                     ; 961 {
3064                     	switch	.text
3065  035a               _TIM2_SetIC3Prescaler:
3067  035a 88            	push	a
3068       00000000      OFST:	set	0
3071                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3073                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3073                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
3075  035b c65307        	ld	a,21255
3076  035e a4f3          	and	a,#243
3077  0360 1a01          	or	a,(OFST+1,sp)
3078  0362 c75307        	ld	21255,a
3079                     ; 968 }
3082  0365 84            	pop	a
3083  0366 81            	ret
3129                     ; 975 uint16_t TIM2_GetCapture1(void)
3129                     ; 976 {
3130                     	switch	.text
3131  0367               _TIM2_GetCapture1:
3133  0367 5204          	subw	sp,#4
3134       00000004      OFST:	set	4
3137                     ; 978   uint16_t tmpccr1 = 0;
3139                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
3143                     ; 981   tmpccr1h = TIM2->CCR1H;
3145  0369 c6530f        	ld	a,21263
3146  036c 6b02          	ld	(OFST-2,sp),a
3148                     ; 982   tmpccr1l = TIM2->CCR1L;
3150  036e c65310        	ld	a,21264
3151  0371 6b01          	ld	(OFST-3,sp),a
3153                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
3155  0373 7b01          	ld	a,(OFST-3,sp)
3156  0375 5f            	clrw	x
3157  0376 97            	ld	xl,a
3158  0377 1f03          	ldw	(OFST-1,sp),x
3160                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3162  0379 7b02          	ld	a,(OFST-2,sp)
3163  037b 5f            	clrw	x
3164  037c 97            	ld	xl,a
3165  037d 4f            	clr	a
3166  037e 02            	rlwa	x,a
3167  037f 01            	rrwa	x,a
3168  0380 1a04          	or	a,(OFST+0,sp)
3169  0382 01            	rrwa	x,a
3170  0383 1a03          	or	a,(OFST-1,sp)
3171  0385 01            	rrwa	x,a
3172  0386 1f03          	ldw	(OFST-1,sp),x
3174                     ; 987   return (uint16_t)tmpccr1;
3176  0388 1e03          	ldw	x,(OFST-1,sp)
3179  038a 5b04          	addw	sp,#4
3180  038c 81            	ret
3226                     ; 995 uint16_t TIM2_GetCapture2(void)
3226                     ; 996 {
3227                     	switch	.text
3228  038d               _TIM2_GetCapture2:
3230  038d 5204          	subw	sp,#4
3231       00000004      OFST:	set	4
3234                     ; 998   uint16_t tmpccr2 = 0;
3236                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
3240                     ; 1001   tmpccr2h = TIM2->CCR2H;
3242  038f c65311        	ld	a,21265
3243  0392 6b02          	ld	(OFST-2,sp),a
3245                     ; 1002   tmpccr2l = TIM2->CCR2L;
3247  0394 c65312        	ld	a,21266
3248  0397 6b01          	ld	(OFST-3,sp),a
3250                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
3252  0399 7b01          	ld	a,(OFST-3,sp)
3253  039b 5f            	clrw	x
3254  039c 97            	ld	xl,a
3255  039d 1f03          	ldw	(OFST-1,sp),x
3257                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3259  039f 7b02          	ld	a,(OFST-2,sp)
3260  03a1 5f            	clrw	x
3261  03a2 97            	ld	xl,a
3262  03a3 4f            	clr	a
3263  03a4 02            	rlwa	x,a
3264  03a5 01            	rrwa	x,a
3265  03a6 1a04          	or	a,(OFST+0,sp)
3266  03a8 01            	rrwa	x,a
3267  03a9 1a03          	or	a,(OFST-1,sp)
3268  03ab 01            	rrwa	x,a
3269  03ac 1f03          	ldw	(OFST-1,sp),x
3271                     ; 1007   return (uint16_t)tmpccr2;
3273  03ae 1e03          	ldw	x,(OFST-1,sp)
3276  03b0 5b04          	addw	sp,#4
3277  03b2 81            	ret
3323                     ; 1015 uint16_t TIM2_GetCapture3(void)
3323                     ; 1016 {
3324                     	switch	.text
3325  03b3               _TIM2_GetCapture3:
3327  03b3 5204          	subw	sp,#4
3328       00000004      OFST:	set	4
3331                     ; 1018   uint16_t tmpccr3 = 0;
3333                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
3337                     ; 1021   tmpccr3h = TIM2->CCR3H;
3339  03b5 c65313        	ld	a,21267
3340  03b8 6b02          	ld	(OFST-2,sp),a
3342                     ; 1022   tmpccr3l = TIM2->CCR3L;
3344  03ba c65314        	ld	a,21268
3345  03bd 6b01          	ld	(OFST-3,sp),a
3347                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
3349  03bf 7b01          	ld	a,(OFST-3,sp)
3350  03c1 5f            	clrw	x
3351  03c2 97            	ld	xl,a
3352  03c3 1f03          	ldw	(OFST-1,sp),x
3354                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3356  03c5 7b02          	ld	a,(OFST-2,sp)
3357  03c7 5f            	clrw	x
3358  03c8 97            	ld	xl,a
3359  03c9 4f            	clr	a
3360  03ca 02            	rlwa	x,a
3361  03cb 01            	rrwa	x,a
3362  03cc 1a04          	or	a,(OFST+0,sp)
3363  03ce 01            	rrwa	x,a
3364  03cf 1a03          	or	a,(OFST-1,sp)
3365  03d1 01            	rrwa	x,a
3366  03d2 1f03          	ldw	(OFST-1,sp),x
3368                     ; 1027   return (uint16_t)tmpccr3;
3370  03d4 1e03          	ldw	x,(OFST-1,sp)
3373  03d6 5b04          	addw	sp,#4
3374  03d8 81            	ret
3406                     ; 1035 uint16_t TIM2_GetCounter(void)
3406                     ; 1036 {
3407                     	switch	.text
3408  03d9               _TIM2_GetCounter:
3410  03d9 89            	pushw	x
3411       00000002      OFST:	set	2
3414                     ; 1037   uint16_t tmpcntr = 0;
3416                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3418  03da c6530a        	ld	a,21258
3419  03dd 5f            	clrw	x
3420  03de 97            	ld	xl,a
3421  03df 4f            	clr	a
3422  03e0 02            	rlwa	x,a
3423  03e1 1f01          	ldw	(OFST-1,sp),x
3425                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3427  03e3 c6530b        	ld	a,21259
3428  03e6 5f            	clrw	x
3429  03e7 97            	ld	xl,a
3430  03e8 01            	rrwa	x,a
3431  03e9 1a02          	or	a,(OFST+0,sp)
3432  03eb 01            	rrwa	x,a
3433  03ec 1a01          	or	a,(OFST-1,sp)
3434  03ee 01            	rrwa	x,a
3437  03ef 5b02          	addw	sp,#2
3438  03f1 81            	ret
3462                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3462                     ; 1050 {
3463                     	switch	.text
3464  03f2               _TIM2_GetPrescaler:
3468                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3470  03f2 c6530c        	ld	a,21260
3473  03f5 81            	ret
3608                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3608                     ; 1069 {
3609                     	switch	.text
3610  03f6               _TIM2_GetFlagStatus:
3612  03f6 89            	pushw	x
3613  03f7 89            	pushw	x
3614       00000002      OFST:	set	2
3617                     ; 1070   FlagStatus bitstatus = RESET;
3619                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3623                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3625                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3627  03f8 9f            	ld	a,xl
3628  03f9 c45302        	and	a,21250
3629  03fc 6b01          	ld	(OFST-1,sp),a
3631                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3633  03fe 7b03          	ld	a,(OFST+1,sp)
3634  0400 6b02          	ld	(OFST+0,sp),a
3636                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3638  0402 c65303        	ld	a,21251
3639  0405 1402          	and	a,(OFST+0,sp)
3640  0407 1a01          	or	a,(OFST-1,sp)
3641  0409 2706          	jreq	L3561
3642                     ; 1081     bitstatus = SET;
3644  040b a601          	ld	a,#1
3645  040d 6b02          	ld	(OFST+0,sp),a
3648  040f 2002          	jra	L5561
3649  0411               L3561:
3650                     ; 1085     bitstatus = RESET;
3652  0411 0f02          	clr	(OFST+0,sp)
3654  0413               L5561:
3655                     ; 1087   return (FlagStatus)bitstatus;
3657  0413 7b02          	ld	a,(OFST+0,sp)
3660  0415 5b04          	addw	sp,#4
3661  0417 81            	ret
3696                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3696                     ; 1104 {
3697                     	switch	.text
3698  0418               _TIM2_ClearFlag:
3702                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3704                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3706  0418 9f            	ld	a,xl
3707  0419 43            	cpl	a
3708  041a c75302        	ld	21250,a
3709                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3711  041d 35ff5303      	mov	21251,#255
3712                     ; 1111 }
3715  0421 81            	ret
3775                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3775                     ; 1124 {
3776                     	switch	.text
3777  0422               _TIM2_GetITStatus:
3779  0422 88            	push	a
3780  0423 89            	pushw	x
3781       00000002      OFST:	set	2
3784                     ; 1125   ITStatus bitstatus = RESET;
3786                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3790                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3792                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3794  0424 c45302        	and	a,21250
3795  0427 6b01          	ld	(OFST-1,sp),a
3797                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3799  0429 c65301        	ld	a,21249
3800  042c 1403          	and	a,(OFST+1,sp)
3801  042e 6b02          	ld	(OFST+0,sp),a
3803                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3805  0430 0d01          	tnz	(OFST-1,sp)
3806  0432 270a          	jreq	L3271
3808  0434 0d02          	tnz	(OFST+0,sp)
3809  0436 2706          	jreq	L3271
3810                     ; 1137     bitstatus = SET;
3812  0438 a601          	ld	a,#1
3813  043a 6b02          	ld	(OFST+0,sp),a
3816  043c 2002          	jra	L5271
3817  043e               L3271:
3818                     ; 1141     bitstatus = RESET;
3820  043e 0f02          	clr	(OFST+0,sp)
3822  0440               L5271:
3823                     ; 1143   return (ITStatus)(bitstatus);
3825  0440 7b02          	ld	a,(OFST+0,sp)
3828  0442 5b03          	addw	sp,#3
3829  0444 81            	ret
3865                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3865                     ; 1157 {
3866                     	switch	.text
3867  0445               _TIM2_ClearITPendingBit:
3871                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
3873                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
3875  0445 43            	cpl	a
3876  0446 c75302        	ld	21250,a
3877                     ; 1163 }
3880  0449 81            	ret
3926                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
3926                     ; 1182                        uint8_t TIM2_ICSelection,
3926                     ; 1183                        uint8_t TIM2_ICFilter)
3926                     ; 1184 {
3927                     	switch	.text
3928  044a               L3_TI1_Config:
3930  044a 89            	pushw	x
3931  044b 88            	push	a
3932       00000001      OFST:	set	1
3935                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3937  044c 72115308      	bres	21256,#0
3938                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
3938                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
3940  0450 7b06          	ld	a,(OFST+5,sp)
3941  0452 97            	ld	xl,a
3942  0453 a610          	ld	a,#16
3943  0455 42            	mul	x,a
3944  0456 9f            	ld	a,xl
3945  0457 1a03          	or	a,(OFST+2,sp)
3946  0459 6b01          	ld	(OFST+0,sp),a
3948  045b c65305        	ld	a,21253
3949  045e a40c          	and	a,#12
3950  0460 1a01          	or	a,(OFST+0,sp)
3951  0462 c75305        	ld	21253,a
3952                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
3954  0465 0d02          	tnz	(OFST+1,sp)
3955  0467 2706          	jreq	L5671
3956                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
3958  0469 72125308      	bset	21256,#1
3960  046d 2004          	jra	L7671
3961  046f               L5671:
3962                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3964  046f 72135308      	bres	21256,#1
3965  0473               L7671:
3966                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
3968  0473 72105308      	bset	21256,#0
3969                     ; 1203 }
3972  0477 5b03          	addw	sp,#3
3973  0479 81            	ret
4019                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
4019                     ; 1222                        uint8_t TIM2_ICSelection,
4019                     ; 1223                        uint8_t TIM2_ICFilter)
4019                     ; 1224 {
4020                     	switch	.text
4021  047a               L5_TI2_Config:
4023  047a 89            	pushw	x
4024  047b 88            	push	a
4025       00000001      OFST:	set	1
4028                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4030  047c 72195308      	bres	21256,#4
4031                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4031                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4033  0480 7b06          	ld	a,(OFST+5,sp)
4034  0482 97            	ld	xl,a
4035  0483 a610          	ld	a,#16
4036  0485 42            	mul	x,a
4037  0486 9f            	ld	a,xl
4038  0487 1a03          	or	a,(OFST+2,sp)
4039  0489 6b01          	ld	(OFST+0,sp),a
4041  048b c65306        	ld	a,21254
4042  048e a40c          	and	a,#12
4043  0490 1a01          	or	a,(OFST+0,sp)
4044  0492 c75306        	ld	21254,a
4045                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4047  0495 0d02          	tnz	(OFST+1,sp)
4048  0497 2706          	jreq	L1102
4049                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
4051  0499 721a5308      	bset	21256,#5
4053  049d 2004          	jra	L3102
4054  049f               L1102:
4055                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4057  049f 721b5308      	bres	21256,#5
4058  04a3               L3102:
4059                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
4061  04a3 72185308      	bset	21256,#4
4062                     ; 1245 }
4065  04a7 5b03          	addw	sp,#3
4066  04a9 81            	ret
4112                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4112                     ; 1262                        uint8_t TIM2_ICFilter)
4112                     ; 1263 {
4113                     	switch	.text
4114  04aa               L7_TI3_Config:
4116  04aa 89            	pushw	x
4117  04ab 88            	push	a
4118       00000001      OFST:	set	1
4121                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4123  04ac 72115309      	bres	21257,#0
4124                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4124                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4126  04b0 7b06          	ld	a,(OFST+5,sp)
4127  04b2 97            	ld	xl,a
4128  04b3 a610          	ld	a,#16
4129  04b5 42            	mul	x,a
4130  04b6 9f            	ld	a,xl
4131  04b7 1a03          	or	a,(OFST+2,sp)
4132  04b9 6b01          	ld	(OFST+0,sp),a
4134  04bb c65307        	ld	a,21255
4135  04be a40c          	and	a,#12
4136  04c0 1a01          	or	a,(OFST+0,sp)
4137  04c2 c75307        	ld	21255,a
4138                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4140  04c5 0d02          	tnz	(OFST+1,sp)
4141  04c7 2706          	jreq	L5302
4142                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
4144  04c9 72125309      	bset	21257,#1
4146  04cd 2004          	jra	L7302
4147  04cf               L5302:
4148                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4150  04cf 72135309      	bres	21257,#1
4151  04d3               L7302:
4152                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
4154  04d3 72105309      	bset	21257,#0
4155                     ; 1283 }
4158  04d7 5b03          	addw	sp,#3
4159  04d9 81            	ret
4172                     	xdef	_TIM2_ClearITPendingBit
4173                     	xdef	_TIM2_GetITStatus
4174                     	xdef	_TIM2_ClearFlag
4175                     	xdef	_TIM2_GetFlagStatus
4176                     	xdef	_TIM2_GetPrescaler
4177                     	xdef	_TIM2_GetCounter
4178                     	xdef	_TIM2_GetCapture3
4179                     	xdef	_TIM2_GetCapture2
4180                     	xdef	_TIM2_GetCapture1
4181                     	xdef	_TIM2_SetIC3Prescaler
4182                     	xdef	_TIM2_SetIC2Prescaler
4183                     	xdef	_TIM2_SetIC1Prescaler
4184                     	xdef	_TIM2_SetCompare3
4185                     	xdef	_TIM2_SetCompare2
4186                     	xdef	_TIM2_SetCompare1
4187                     	xdef	_TIM2_SetAutoreload
4188                     	xdef	_TIM2_SetCounter
4189                     	xdef	_TIM2_SelectOCxM
4190                     	xdef	_TIM2_CCxCmd
4191                     	xdef	_TIM2_OC3PolarityConfig
4192                     	xdef	_TIM2_OC2PolarityConfig
4193                     	xdef	_TIM2_OC1PolarityConfig
4194                     	xdef	_TIM2_GenerateEvent
4195                     	xdef	_TIM2_OC3PreloadConfig
4196                     	xdef	_TIM2_OC2PreloadConfig
4197                     	xdef	_TIM2_OC1PreloadConfig
4198                     	xdef	_TIM2_ARRPreloadConfig
4199                     	xdef	_TIM2_ForcedOC3Config
4200                     	xdef	_TIM2_ForcedOC2Config
4201                     	xdef	_TIM2_ForcedOC1Config
4202                     	xdef	_TIM2_PrescalerConfig
4203                     	xdef	_TIM2_SelectOnePulseMode
4204                     	xdef	_TIM2_UpdateRequestConfig
4205                     	xdef	_TIM2_UpdateDisableConfig
4206                     	xdef	_TIM2_ITConfig
4207                     	xdef	_TIM2_Cmd
4208                     	xdef	_TIM2_PWMIConfig
4209                     	xdef	_TIM2_ICInit
4210                     	xdef	_TIM2_OC3Init
4211                     	xdef	_TIM2_OC2Init
4212                     	xdef	_TIM2_OC1Init
4213                     	xdef	_TIM2_TimeBaseInit
4214                     	xdef	_TIM2_DeInit
4233                     	end
