   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  47                     ; 52 void TIM2_DeInit(void)
  47                     ; 53 {
  49                     	switch	.text
  50  0000               _TIM2_DeInit:
  54                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  56  0000 725f5300      	clr	21248
  57                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  59  0004 725f5301      	clr	21249
  60                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  62  0008 725f5303      	clr	21251
  63                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  65  000c 725f5308      	clr	21256
  66                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  68  0010 725f5309      	clr	21257
  69                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  71  0014 725f5308      	clr	21256
  72                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  74  0018 725f5309      	clr	21257
  75                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  77  001c 725f5305      	clr	21253
  78                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  80  0020 725f5306      	clr	21254
  81                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  83  0024 725f5307      	clr	21255
  84                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  86  0028 725f530a      	clr	21258
  87                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  89  002c 725f530b      	clr	21259
  90                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  92  0030 725f530c      	clr	21260
  93                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  95  0034 35ff530d      	mov	21261,#255
  96                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  98  0038 35ff530e      	mov	21262,#255
  99                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
 101  003c 725f530f      	clr	21263
 102                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 104  0040 725f5310      	clr	21264
 105                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 107  0044 725f5311      	clr	21265
 108                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 110  0048 725f5312      	clr	21266
 111                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 113  004c 725f5313      	clr	21267
 114                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 116  0050 725f5314      	clr	21268
 117                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 119  0054 725f5302      	clr	21250
 120                     ; 81 }
 123  0058 81            	ret	
 289                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 289                     ; 90                         uint16_t TIM2_Period)
 289                     ; 91 {
 290                     	switch	.text
 291  0059               _TIM2_TimeBaseInit:
 293       ffffffff      OFST: set -1
 296                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 298  0059 c7530c        	ld	21260,a
 299                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 301  005c 7b03          	ld	a,(OFST+4,sp)
 302  005e c7530d        	ld	21261,a
 303                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 305  0061 7b04          	ld	a,(OFST+5,sp)
 306  0063 c7530e        	ld	21262,a
 307                     ; 97 }
 310  0066 81            	ret	
 465                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 465                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 465                     ; 110                   uint16_t TIM2_Pulse,
 465                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 465                     ; 112 {
 466                     	switch	.text
 467  0067               _TIM2_OC1Init:
 469  0067 89            	pushw	x
 470  0068 88            	push	a
 471       00000001      OFST:	set	1
 474                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 476                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 478                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 480                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 482  0069 c65308        	ld	a,21256
 483  006c a4fc          	and	a,#252
 484  006e c75308        	ld	21256,a
 485                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 485                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 487  0071 7b08          	ld	a,(OFST+7,sp)
 488  0073 a402          	and	a,#2
 489  0075 6b01          	ld	(OFST+0,sp),a
 491  0077 9f            	ld	a,xl
 492  0078 a401          	and	a,#1
 493  007a 1a01          	or	a,(OFST+0,sp)
 494  007c ca5308        	or	a,21256
 495  007f c75308        	ld	21256,a
 496                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 496                     ; 126                           (uint8_t)TIM2_OCMode);
 498  0082 c65305        	ld	a,21253
 499  0085 a48f          	and	a,#143
 500  0087 1a02          	or	a,(OFST+1,sp)
 501  0089 c75305        	ld	21253,a
 502                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 504  008c 7b06          	ld	a,(OFST+5,sp)
 505  008e c7530f        	ld	21263,a
 506                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 508  0091 7b07          	ld	a,(OFST+6,sp)
 509  0093 c75310        	ld	21264,a
 510                     ; 131 }
 513  0096 5b03          	addw	sp,#3
 514  0098 81            	ret	
 576                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 576                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 576                     ; 144                   uint16_t TIM2_Pulse,
 576                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 576                     ; 146 {
 577                     	switch	.text
 578  0099               _TIM2_OC2Init:
 580  0099 89            	pushw	x
 581  009a 88            	push	a
 582       00000001      OFST:	set	1
 585                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 587                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 589                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 591                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 593  009b c65308        	ld	a,21256
 594  009e a4cf          	and	a,#207
 595  00a0 c75308        	ld	21256,a
 596                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 596                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 598  00a3 7b08          	ld	a,(OFST+7,sp)
 599  00a5 a420          	and	a,#32
 600  00a7 6b01          	ld	(OFST+0,sp),a
 602  00a9 9f            	ld	a,xl
 603  00aa a410          	and	a,#16
 604  00ac 1a01          	or	a,(OFST+0,sp)
 605  00ae ca5308        	or	a,21256
 606  00b1 c75308        	ld	21256,a
 607                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 607                     ; 162                           (uint8_t)TIM2_OCMode);
 609  00b4 c65306        	ld	a,21254
 610  00b7 a48f          	and	a,#143
 611  00b9 1a02          	or	a,(OFST+1,sp)
 612  00bb c75306        	ld	21254,a
 613                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 615  00be 7b06          	ld	a,(OFST+5,sp)
 616  00c0 c75311        	ld	21265,a
 617                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 619  00c3 7b07          	ld	a,(OFST+6,sp)
 620  00c5 c75312        	ld	21266,a
 621                     ; 168 }
 624  00c8 5b03          	addw	sp,#3
 625  00ca 81            	ret	
 687                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 687                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 687                     ; 181                   uint16_t TIM2_Pulse,
 687                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 687                     ; 183 {
 688                     	switch	.text
 689  00cb               _TIM2_OC3Init:
 691  00cb 89            	pushw	x
 692  00cc 88            	push	a
 693       00000001      OFST:	set	1
 696                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 698                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 700                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 702                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 704  00cd c65309        	ld	a,21257
 705  00d0 a4fc          	and	a,#252
 706  00d2 c75309        	ld	21257,a
 707                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 707                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 709  00d5 7b08          	ld	a,(OFST+7,sp)
 710  00d7 a402          	and	a,#2
 711  00d9 6b01          	ld	(OFST+0,sp),a
 713  00db 9f            	ld	a,xl
 714  00dc a401          	and	a,#1
 715  00de 1a01          	or	a,(OFST+0,sp)
 716  00e0 ca5309        	or	a,21257
 717  00e3 c75309        	ld	21257,a
 718                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 718                     ; 196                           (uint8_t)TIM2_OCMode);
 720  00e6 c65307        	ld	a,21255
 721  00e9 a48f          	and	a,#143
 722  00eb 1a02          	or	a,(OFST+1,sp)
 723  00ed c75307        	ld	21255,a
 724                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 726  00f0 7b06          	ld	a,(OFST+5,sp)
 727  00f2 c75313        	ld	21267,a
 728                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 730  00f5 7b07          	ld	a,(OFST+6,sp)
 731  00f7 c75314        	ld	21268,a
 732                     ; 201 }
 735  00fa 5b03          	addw	sp,#3
 736  00fc 81            	ret	
 927                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 927                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 927                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 927                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 927                     ; 216                  uint8_t TIM2_ICFilter)
 927                     ; 217 {
 928                     	switch	.text
 929  00fd               _TIM2_ICInit:
 931  00fd 89            	pushw	x
 932       00000000      OFST:	set	0
 935                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 937                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 939                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 941                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 943                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 945                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
 947  00fe 9e            	ld	a,xh
 948  00ff 4d            	tnz	a
 949  0100 2614          	jrne	L763
 950                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
 950                     ; 229                (uint8_t)TIM2_ICSelection,
 950                     ; 230                (uint8_t)TIM2_ICFilter);
 952  0102 7b07          	ld	a,(OFST+7,sp)
 953  0104 88            	push	a
 954  0105 7b06          	ld	a,(OFST+6,sp)
 955  0107 97            	ld	xl,a
 956  0108 7b03          	ld	a,(OFST+3,sp)
 957  010a 95            	ld	xh,a
 958  010b cd0409        	call	L3_TI1_Config
 960  010e 84            	pop	a
 961                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 963  010f 7b06          	ld	a,(OFST+6,sp)
 964  0111 cd032a        	call	_TIM2_SetIC1Prescaler
 967  0114 202b          	jra	L173
 968  0116               L763:
 969                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
 971  0116 7b01          	ld	a,(OFST+1,sp)
 972  0118 4a            	dec	a
 973  0119 2614          	jrne	L373
 974                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
 974                     ; 239                (uint8_t)TIM2_ICSelection,
 974                     ; 240                (uint8_t)TIM2_ICFilter);
 976  011b 7b07          	ld	a,(OFST+7,sp)
 977  011d 88            	push	a
 978  011e 7b06          	ld	a,(OFST+6,sp)
 979  0120 97            	ld	xl,a
 980  0121 7b03          	ld	a,(OFST+3,sp)
 981  0123 95            	ld	xh,a
 982  0124 cd0439        	call	L5_TI2_Config
 984  0127 84            	pop	a
 985                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 987  0128 7b06          	ld	a,(OFST+6,sp)
 988  012a cd0337        	call	_TIM2_SetIC2Prescaler
 991  012d 2012          	jra	L173
 992  012f               L373:
 993                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
 993                     ; 249                (uint8_t)TIM2_ICSelection,
 993                     ; 250                (uint8_t)TIM2_ICFilter);
 995  012f 7b07          	ld	a,(OFST+7,sp)
 996  0131 88            	push	a
 997  0132 7b06          	ld	a,(OFST+6,sp)
 998  0134 97            	ld	xl,a
 999  0135 7b03          	ld	a,(OFST+3,sp)
1000  0137 95            	ld	xh,a
1001  0138 cd0469        	call	L7_TI3_Config
1003  013b 84            	pop	a
1004                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1006  013c 7b06          	ld	a,(OFST+6,sp)
1007  013e cd0344        	call	_TIM2_SetIC3Prescaler
1009  0141               L173:
1010                     ; 255 }
1013  0141 85            	popw	x
1014  0142 81            	ret	
1104                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1104                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1104                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1104                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1104                     ; 270                      uint8_t TIM2_ICFilter)
1104                     ; 271 {
1105                     	switch	.text
1106  0143               _TIM2_PWMIConfig:
1108  0143 89            	pushw	x
1109  0144 89            	pushw	x
1110       00000002      OFST:	set	2
1113                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1115                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1117                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1119                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1121                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1123                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1125                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1127  0145 9f            	ld	a,xl
1128  0146 a144          	cp	a,#68
1129  0148 2706          	jreq	L734
1130                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1132  014a a644          	ld	a,#68
1133  014c 6b01          	ld	(OFST-1,sp),a
1136  014e 2002          	jra	L144
1137  0150               L734:
1138                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1140  0150 0f01          	clr	(OFST-1,sp)
1142  0152               L144:
1143                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1145  0152 7b07          	ld	a,(OFST+5,sp)
1146  0154 4a            	dec	a
1147  0155 2604          	jrne	L344
1148                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1150  0157 a602          	ld	a,#2
1152  0159 2002          	jra	L544
1153  015b               L344:
1154                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1156  015b a601          	ld	a,#1
1157  015d               L544:
1158  015d 6b02          	ld	(OFST+0,sp),a
1160                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1162  015f 7b03          	ld	a,(OFST+1,sp)
1163  0161 2626          	jrne	L744
1164                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1164                     ; 305                (uint8_t)TIM2_ICFilter);
1166  0163 7b09          	ld	a,(OFST+7,sp)
1167  0165 88            	push	a
1168  0166 7b08          	ld	a,(OFST+6,sp)
1169  0168 97            	ld	xl,a
1170  0169 7b05          	ld	a,(OFST+3,sp)
1171  016b 95            	ld	xh,a
1172  016c cd0409        	call	L3_TI1_Config
1174  016f 84            	pop	a
1175                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1177  0170 7b08          	ld	a,(OFST+6,sp)
1178  0172 cd032a        	call	_TIM2_SetIC1Prescaler
1180                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1182  0175 7b09          	ld	a,(OFST+7,sp)
1183  0177 88            	push	a
1184  0178 7b03          	ld	a,(OFST+1,sp)
1185  017a 97            	ld	xl,a
1186  017b 7b02          	ld	a,(OFST+0,sp)
1187  017d 95            	ld	xh,a
1188  017e cd0439        	call	L5_TI2_Config
1190  0181 84            	pop	a
1191                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1193  0182 7b08          	ld	a,(OFST+6,sp)
1194  0184 cd0337        	call	_TIM2_SetIC2Prescaler
1197  0187 2024          	jra	L154
1198  0189               L744:
1199                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1199                     ; 320                (uint8_t)TIM2_ICFilter);
1201  0189 7b09          	ld	a,(OFST+7,sp)
1202  018b 88            	push	a
1203  018c 7b08          	ld	a,(OFST+6,sp)
1204  018e 97            	ld	xl,a
1205  018f 7b05          	ld	a,(OFST+3,sp)
1206  0191 95            	ld	xh,a
1207  0192 cd0439        	call	L5_TI2_Config
1209  0195 84            	pop	a
1210                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1212  0196 7b08          	ld	a,(OFST+6,sp)
1213  0198 cd0337        	call	_TIM2_SetIC2Prescaler
1215                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1217  019b 7b09          	ld	a,(OFST+7,sp)
1218  019d 88            	push	a
1219  019e 7b03          	ld	a,(OFST+1,sp)
1220  01a0 97            	ld	xl,a
1221  01a1 7b02          	ld	a,(OFST+0,sp)
1222  01a3 95            	ld	xh,a
1223  01a4 cd0409        	call	L3_TI1_Config
1225  01a7 84            	pop	a
1226                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1228  01a8 7b08          	ld	a,(OFST+6,sp)
1229  01aa cd032a        	call	_TIM2_SetIC1Prescaler
1231  01ad               L154:
1232                     ; 331 }
1235  01ad 5b04          	addw	sp,#4
1236  01af 81            	ret	
1291                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1291                     ; 340 {
1292                     	switch	.text
1293  01b0               _TIM2_Cmd:
1297                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1299                     ; 345   if (NewState != DISABLE)
1301  01b0 4d            	tnz	a
1302  01b1 2705          	jreq	L105
1303                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1305  01b3 72105300      	bset	21248,#0
1308  01b7 81            	ret	
1309  01b8               L105:
1310                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1312  01b8 72115300      	bres	21248,#0
1313                     ; 353 }
1316  01bc 81            	ret	
1395                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1395                     ; 369 {
1396                     	switch	.text
1397  01bd               _TIM2_ITConfig:
1399  01bd 89            	pushw	x
1400       00000000      OFST:	set	0
1403                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1405                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1407                     ; 374   if (NewState != DISABLE)
1409  01be 9f            	ld	a,xl
1410  01bf 4d            	tnz	a
1411  01c0 2706          	jreq	L345
1412                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1414  01c2 9e            	ld	a,xh
1415  01c3 ca5301        	or	a,21249
1417  01c6 2006          	jra	L545
1418  01c8               L345:
1419                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1421  01c8 7b01          	ld	a,(OFST+1,sp)
1422  01ca 43            	cpl	a
1423  01cb c45301        	and	a,21249
1424  01ce               L545:
1425  01ce c75301        	ld	21249,a
1426                     ; 384 }
1429  01d1 85            	popw	x
1430  01d2 81            	ret	
1466                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1466                     ; 393 {
1467                     	switch	.text
1468  01d3               _TIM2_UpdateDisableConfig:
1472                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1474                     ; 398   if (NewState != DISABLE)
1476  01d3 4d            	tnz	a
1477  01d4 2705          	jreq	L565
1478                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1480  01d6 72125300      	bset	21248,#1
1483  01da 81            	ret	
1484  01db               L565:
1485                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1487  01db 72135300      	bres	21248,#1
1488                     ; 406 }
1491  01df 81            	ret	
1549                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1549                     ; 417 {
1550                     	switch	.text
1551  01e0               _TIM2_UpdateRequestConfig:
1555                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1557                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1559  01e0 4d            	tnz	a
1560  01e1 2705          	jreq	L716
1561                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1563  01e3 72145300      	bset	21248,#2
1566  01e7 81            	ret	
1567  01e8               L716:
1568                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1570  01e8 72155300      	bres	21248,#2
1571                     ; 430 }
1574  01ec 81            	ret	
1631                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1631                     ; 441 {
1632                     	switch	.text
1633  01ed               _TIM2_SelectOnePulseMode:
1637                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1639                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1641  01ed 4d            	tnz	a
1642  01ee 2705          	jreq	L156
1643                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1645  01f0 72165300      	bset	21248,#3
1648  01f4 81            	ret	
1649  01f5               L156:
1650                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1652  01f5 72175300      	bres	21248,#3
1653                     ; 454 }
1656  01f9 81            	ret	
1724                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1724                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1724                     ; 486 {
1725                     	switch	.text
1726  01fa               _TIM2_PrescalerConfig:
1730                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1732                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1734                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
1736  01fa 9e            	ld	a,xh
1737  01fb c7530c        	ld	21260,a
1738                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
1740  01fe 9f            	ld	a,xl
1741  01ff c75304        	ld	21252,a
1742                     ; 496 }
1745  0202 81            	ret	
1803                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1803                     ; 508 {
1804                     	switch	.text
1805  0203               _TIM2_ForcedOC1Config:
1807  0203 88            	push	a
1808       00000000      OFST:	set	0
1811                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1813                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
1813                     ; 514                             | (uint8_t)TIM2_ForcedAction);
1815  0204 c65305        	ld	a,21253
1816  0207 a48f          	and	a,#143
1817  0209 1a01          	or	a,(OFST+1,sp)
1818  020b c75305        	ld	21253,a
1819                     ; 515 }
1822  020e 84            	pop	a
1823  020f 81            	ret	
1859                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1859                     ; 527 {
1860                     	switch	.text
1861  0210               _TIM2_ForcedOC2Config:
1863  0210 88            	push	a
1864       00000000      OFST:	set	0
1867                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1869                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
1869                     ; 533                           | (uint8_t)TIM2_ForcedAction);
1871  0211 c65306        	ld	a,21254
1872  0214 a48f          	and	a,#143
1873  0216 1a01          	or	a,(OFST+1,sp)
1874  0218 c75306        	ld	21254,a
1875                     ; 534 }
1878  021b 84            	pop	a
1879  021c 81            	ret	
1915                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1915                     ; 546 {
1916                     	switch	.text
1917  021d               _TIM2_ForcedOC3Config:
1919  021d 88            	push	a
1920       00000000      OFST:	set	0
1923                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1925                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
1925                     ; 552                             | (uint8_t)TIM2_ForcedAction);
1927  021e c65307        	ld	a,21255
1928  0221 a48f          	and	a,#143
1929  0223 1a01          	or	a,(OFST+1,sp)
1930  0225 c75307        	ld	21255,a
1931                     ; 553 }
1934  0228 84            	pop	a
1935  0229 81            	ret	
1971                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1971                     ; 562 {
1972                     	switch	.text
1973  022a               _TIM2_ARRPreloadConfig:
1977                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1979                     ; 567   if (NewState != DISABLE)
1981  022a 4d            	tnz	a
1982  022b 2705          	jreq	L7001
1983                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
1985  022d 721e5300      	bset	21248,#7
1988  0231 81            	ret	
1989  0232               L7001:
1990                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
1992  0232 721f5300      	bres	21248,#7
1993                     ; 575 }
1996  0236 81            	ret	
2032                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2032                     ; 584 {
2033                     	switch	.text
2034  0237               _TIM2_OC1PreloadConfig:
2038                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2040                     ; 589   if (NewState != DISABLE)
2042  0237 4d            	tnz	a
2043  0238 2705          	jreq	L1301
2044                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2046  023a 72165305      	bset	21253,#3
2049  023e 81            	ret	
2050  023f               L1301:
2051                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2053  023f 72175305      	bres	21253,#3
2054                     ; 597 }
2057  0243 81            	ret	
2093                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2093                     ; 606 {
2094                     	switch	.text
2095  0244               _TIM2_OC2PreloadConfig:
2099                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2101                     ; 611   if (NewState != DISABLE)
2103  0244 4d            	tnz	a
2104  0245 2705          	jreq	L3501
2105                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2107  0247 72165306      	bset	21254,#3
2110  024b 81            	ret	
2111  024c               L3501:
2112                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2114  024c 72175306      	bres	21254,#3
2115                     ; 619 }
2118  0250 81            	ret	
2154                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2154                     ; 628 {
2155                     	switch	.text
2156  0251               _TIM2_OC3PreloadConfig:
2160                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2162                     ; 633   if (NewState != DISABLE)
2164  0251 4d            	tnz	a
2165  0252 2705          	jreq	L5701
2166                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2168  0254 72165307      	bset	21255,#3
2171  0258 81            	ret	
2172  0259               L5701:
2173                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2175  0259 72175307      	bres	21255,#3
2176                     ; 641 }
2179  025d 81            	ret	
2252                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2252                     ; 654 {
2253                     	switch	.text
2254  025e               _TIM2_GenerateEvent:
2258                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2260                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
2262  025e c75304        	ld	21252,a
2263                     ; 660 }
2266  0261 81            	ret	
2302                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2302                     ; 671 {
2303                     	switch	.text
2304  0262               _TIM2_OC1PolarityConfig:
2308                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2310                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2312  0262 4d            	tnz	a
2313  0263 2705          	jreq	L1511
2314                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2316  0265 72125308      	bset	21256,#1
2319  0269 81            	ret	
2320  026a               L1511:
2321                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2323  026a 72135308      	bres	21256,#1
2324                     ; 684 }
2327  026e 81            	ret	
2363                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2363                     ; 695 {
2364                     	switch	.text
2365  026f               _TIM2_OC2PolarityConfig:
2369                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2371                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2373  026f 4d            	tnz	a
2374  0270 2705          	jreq	L3711
2375                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2377  0272 721a5308      	bset	21256,#5
2380  0276 81            	ret	
2381  0277               L3711:
2382                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2384  0277 721b5308      	bres	21256,#5
2385                     ; 708 }
2388  027b 81            	ret	
2424                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2424                     ; 719 {
2425                     	switch	.text
2426  027c               _TIM2_OC3PolarityConfig:
2430                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2432                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2434  027c 4d            	tnz	a
2435  027d 2705          	jreq	L5121
2436                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2438  027f 72125309      	bset	21257,#1
2441  0283 81            	ret	
2442  0284               L5121:
2443                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2445  0284 72135309      	bres	21257,#1
2446                     ; 732 }
2449  0288 81            	ret	
2494                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2494                     ; 746 {
2495                     	switch	.text
2496  0289               _TIM2_CCxCmd:
2498  0289 89            	pushw	x
2499       00000000      OFST:	set	0
2502                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2504                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2506                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
2508  028a 9e            	ld	a,xh
2509  028b 4d            	tnz	a
2510  028c 2610          	jrne	L3421
2511                     ; 754     if (NewState != DISABLE)
2513  028e 9f            	ld	a,xl
2514  028f 4d            	tnz	a
2515  0290 2706          	jreq	L5421
2516                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2518  0292 72105308      	bset	21256,#0
2520  0296 2029          	jra	L1521
2521  0298               L5421:
2522                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2524  0298 72115308      	bres	21256,#0
2525  029c 2023          	jra	L1521
2526  029e               L3421:
2527                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
2529  029e 7b01          	ld	a,(OFST+1,sp)
2530  02a0 4a            	dec	a
2531  02a1 2610          	jrne	L3521
2532                     ; 767     if (NewState != DISABLE)
2534  02a3 7b02          	ld	a,(OFST+2,sp)
2535  02a5 2706          	jreq	L5521
2536                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2538  02a7 72185308      	bset	21256,#4
2540  02ab 2014          	jra	L1521
2541  02ad               L5521:
2542                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2544  02ad 72195308      	bres	21256,#4
2545  02b1 200e          	jra	L1521
2546  02b3               L3521:
2547                     ; 779     if (NewState != DISABLE)
2549  02b3 7b02          	ld	a,(OFST+2,sp)
2550  02b5 2706          	jreq	L3621
2551                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2553  02b7 72105309      	bset	21257,#0
2555  02bb 2004          	jra	L1521
2556  02bd               L3621:
2557                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2559  02bd 72115309      	bres	21257,#0
2560  02c1               L1521:
2561                     ; 788 }
2564  02c1 85            	popw	x
2565  02c2 81            	ret	
2610                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2610                     ; 811 {
2611                     	switch	.text
2612  02c3               _TIM2_SelectOCxM:
2614  02c3 89            	pushw	x
2615       00000000      OFST:	set	0
2618                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2620                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2622                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
2624  02c4 9e            	ld	a,xh
2625  02c5 4d            	tnz	a
2626  02c6 2610          	jrne	L1131
2627                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2629  02c8 72115308      	bres	21256,#0
2630                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2630                     ; 823                             | (uint8_t)TIM2_OCMode);
2632  02cc c65305        	ld	a,21253
2633  02cf a48f          	and	a,#143
2634  02d1 1a02          	or	a,(OFST+2,sp)
2635  02d3 c75305        	ld	21253,a
2637  02d6 2023          	jra	L3131
2638  02d8               L1131:
2639                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
2641  02d8 7b01          	ld	a,(OFST+1,sp)
2642  02da 4a            	dec	a
2643  02db 2610          	jrne	L5131
2644                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2646  02dd 72195308      	bres	21256,#4
2647                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2647                     ; 832                             | (uint8_t)TIM2_OCMode);
2649  02e1 c65306        	ld	a,21254
2650  02e4 a48f          	and	a,#143
2651  02e6 1a02          	or	a,(OFST+2,sp)
2652  02e8 c75306        	ld	21254,a
2654  02eb 200e          	jra	L3131
2655  02ed               L5131:
2656                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2658  02ed 72115309      	bres	21257,#0
2659                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2659                     ; 841                             | (uint8_t)TIM2_OCMode);
2661  02f1 c65307        	ld	a,21255
2662  02f4 a48f          	and	a,#143
2663  02f6 1a02          	or	a,(OFST+2,sp)
2664  02f8 c75307        	ld	21255,a
2665  02fb               L3131:
2666                     ; 843 }
2669  02fb 85            	popw	x
2670  02fc 81            	ret	
2702                     ; 851 void TIM2_SetCounter(uint16_t Counter)
2702                     ; 852 {
2703                     	switch	.text
2704  02fd               _TIM2_SetCounter:
2708                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
2710  02fd 9e            	ld	a,xh
2711  02fe c7530a        	ld	21258,a
2712                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
2714  0301 9f            	ld	a,xl
2715  0302 c7530b        	ld	21259,a
2716                     ; 856 }
2719  0305 81            	ret	
2751                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
2751                     ; 865 {
2752                     	switch	.text
2753  0306               _TIM2_SetAutoreload:
2757                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2759  0306 9e            	ld	a,xh
2760  0307 c7530d        	ld	21261,a
2761                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
2763  030a 9f            	ld	a,xl
2764  030b c7530e        	ld	21262,a
2765                     ; 869 }
2768  030e 81            	ret	
2800                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
2800                     ; 878 {
2801                     	switch	.text
2802  030f               _TIM2_SetCompare1:
2806                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
2808  030f 9e            	ld	a,xh
2809  0310 c7530f        	ld	21263,a
2810                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
2812  0313 9f            	ld	a,xl
2813  0314 c75310        	ld	21264,a
2814                     ; 882 }
2817  0317 81            	ret	
2849                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
2849                     ; 891 {
2850                     	switch	.text
2851  0318               _TIM2_SetCompare2:
2855                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
2857  0318 9e            	ld	a,xh
2858  0319 c75311        	ld	21265,a
2859                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
2861  031c 9f            	ld	a,xl
2862  031d c75312        	ld	21266,a
2863                     ; 895 }
2866  0320 81            	ret	
2898                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
2898                     ; 904 {
2899                     	switch	.text
2900  0321               _TIM2_SetCompare3:
2904                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
2906  0321 9e            	ld	a,xh
2907  0322 c75313        	ld	21267,a
2908                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
2910  0325 9f            	ld	a,xl
2911  0326 c75314        	ld	21268,a
2912                     ; 908 }
2915  0329 81            	ret	
2951                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2951                     ; 921 {
2952                     	switch	.text
2953  032a               _TIM2_SetIC1Prescaler:
2955  032a 88            	push	a
2956       00000000      OFST:	set	0
2959                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2961                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2961                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
2963  032b c65305        	ld	a,21253
2964  032e a4f3          	and	a,#243
2965  0330 1a01          	or	a,(OFST+1,sp)
2966  0332 c75305        	ld	21253,a
2967                     ; 928 }
2970  0335 84            	pop	a
2971  0336 81            	ret	
3007                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3007                     ; 941 {
3008                     	switch	.text
3009  0337               _TIM2_SetIC2Prescaler:
3011  0337 88            	push	a
3012       00000000      OFST:	set	0
3015                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3017                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3017                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
3019  0338 c65306        	ld	a,21254
3020  033b a4f3          	and	a,#243
3021  033d 1a01          	or	a,(OFST+1,sp)
3022  033f c75306        	ld	21254,a
3023                     ; 948 }
3026  0342 84            	pop	a
3027  0343 81            	ret	
3063                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3063                     ; 961 {
3064                     	switch	.text
3065  0344               _TIM2_SetIC3Prescaler:
3067  0344 88            	push	a
3068       00000000      OFST:	set	0
3071                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3073                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3073                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
3075  0345 c65307        	ld	a,21255
3076  0348 a4f3          	and	a,#243
3077  034a 1a01          	or	a,(OFST+1,sp)
3078  034c c75307        	ld	21255,a
3079                     ; 968 }
3082  034f 84            	pop	a
3083  0350 81            	ret	
3129                     ; 975 uint16_t TIM2_GetCapture1(void)
3129                     ; 976 {
3130                     	switch	.text
3131  0351               _TIM2_GetCapture1:
3133  0351 5204          	subw	sp,#4
3134       00000004      OFST:	set	4
3137                     ; 978   uint16_t tmpccr1 = 0;
3139                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
3143                     ; 981   tmpccr1h = TIM2->CCR1H;
3145  0353 c6530f        	ld	a,21263
3146  0356 6b02          	ld	(OFST-2,sp),a
3148                     ; 982   tmpccr1l = TIM2->CCR1L;
3150  0358 c65310        	ld	a,21264
3151  035b 6b01          	ld	(OFST-3,sp),a
3153                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
3155  035d 5f            	clrw	x
3156  035e 97            	ld	xl,a
3157  035f 1f03          	ldw	(OFST-1,sp),x
3159                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3161  0361 5f            	clrw	x
3162  0362 7b02          	ld	a,(OFST-2,sp)
3163  0364 97            	ld	xl,a
3164  0365 7b04          	ld	a,(OFST+0,sp)
3165  0367 01            	rrwa	x,a
3166  0368 1a03          	or	a,(OFST-1,sp)
3167  036a 01            	rrwa	x,a
3169                     ; 987   return (uint16_t)tmpccr1;
3173  036b 5b04          	addw	sp,#4
3174  036d 81            	ret	
3220                     ; 995 uint16_t TIM2_GetCapture2(void)
3220                     ; 996 {
3221                     	switch	.text
3222  036e               _TIM2_GetCapture2:
3224  036e 5204          	subw	sp,#4
3225       00000004      OFST:	set	4
3228                     ; 998   uint16_t tmpccr2 = 0;
3230                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
3234                     ; 1001   tmpccr2h = TIM2->CCR2H;
3236  0370 c65311        	ld	a,21265
3237  0373 6b02          	ld	(OFST-2,sp),a
3239                     ; 1002   tmpccr2l = TIM2->CCR2L;
3241  0375 c65312        	ld	a,21266
3242  0378 6b01          	ld	(OFST-3,sp),a
3244                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
3246  037a 5f            	clrw	x
3247  037b 97            	ld	xl,a
3248  037c 1f03          	ldw	(OFST-1,sp),x
3250                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3252  037e 5f            	clrw	x
3253  037f 7b02          	ld	a,(OFST-2,sp)
3254  0381 97            	ld	xl,a
3255  0382 7b04          	ld	a,(OFST+0,sp)
3256  0384 01            	rrwa	x,a
3257  0385 1a03          	or	a,(OFST-1,sp)
3258  0387 01            	rrwa	x,a
3260                     ; 1007   return (uint16_t)tmpccr2;
3264  0388 5b04          	addw	sp,#4
3265  038a 81            	ret	
3311                     ; 1015 uint16_t TIM2_GetCapture3(void)
3311                     ; 1016 {
3312                     	switch	.text
3313  038b               _TIM2_GetCapture3:
3315  038b 5204          	subw	sp,#4
3316       00000004      OFST:	set	4
3319                     ; 1018   uint16_t tmpccr3 = 0;
3321                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
3325                     ; 1021   tmpccr3h = TIM2->CCR3H;
3327  038d c65313        	ld	a,21267
3328  0390 6b02          	ld	(OFST-2,sp),a
3330                     ; 1022   tmpccr3l = TIM2->CCR3L;
3332  0392 c65314        	ld	a,21268
3333  0395 6b01          	ld	(OFST-3,sp),a
3335                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
3337  0397 5f            	clrw	x
3338  0398 97            	ld	xl,a
3339  0399 1f03          	ldw	(OFST-1,sp),x
3341                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3343  039b 5f            	clrw	x
3344  039c 7b02          	ld	a,(OFST-2,sp)
3345  039e 97            	ld	xl,a
3346  039f 7b04          	ld	a,(OFST+0,sp)
3347  03a1 01            	rrwa	x,a
3348  03a2 1a03          	or	a,(OFST-1,sp)
3349  03a4 01            	rrwa	x,a
3351                     ; 1027   return (uint16_t)tmpccr3;
3355  03a5 5b04          	addw	sp,#4
3356  03a7 81            	ret	
3388                     ; 1035 uint16_t TIM2_GetCounter(void)
3388                     ; 1036 {
3389                     	switch	.text
3390  03a8               _TIM2_GetCounter:
3392  03a8 89            	pushw	x
3393       00000002      OFST:	set	2
3396                     ; 1037   uint16_t tmpcntr = 0;
3398                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3400  03a9 c6530a        	ld	a,21258
3401  03ac 97            	ld	xl,a
3402  03ad 4f            	clr	a
3403  03ae 02            	rlwa	x,a
3404  03af 1f01          	ldw	(OFST-1,sp),x
3406                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3408  03b1 c6530b        	ld	a,21259
3409  03b4 5f            	clrw	x
3410  03b5 97            	ld	xl,a
3411  03b6 01            	rrwa	x,a
3412  03b7 1a02          	or	a,(OFST+0,sp)
3413  03b9 01            	rrwa	x,a
3414  03ba 1a01          	or	a,(OFST-1,sp)
3415  03bc 01            	rrwa	x,a
3418  03bd 5b02          	addw	sp,#2
3419  03bf 81            	ret	
3443                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3443                     ; 1050 {
3444                     	switch	.text
3445  03c0               _TIM2_GetPrescaler:
3449                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3451  03c0 c6530c        	ld	a,21260
3454  03c3 81            	ret	
3589                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3589                     ; 1069 {
3590                     	switch	.text
3591  03c4               _TIM2_GetFlagStatus:
3593  03c4 89            	pushw	x
3594  03c5 89            	pushw	x
3595       00000002      OFST:	set	2
3598                     ; 1070   FlagStatus bitstatus = RESET;
3600                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3604                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3606                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3608  03c6 9f            	ld	a,xl
3609  03c7 c45302        	and	a,21250
3610  03ca 6b01          	ld	(OFST-1,sp),a
3612                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3614  03cc 7b03          	ld	a,(OFST+1,sp)
3615  03ce 6b02          	ld	(OFST+0,sp),a
3617                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3619  03d0 c45303        	and	a,21251
3620  03d3 1a01          	or	a,(OFST-1,sp)
3621  03d5 2702          	jreq	L3561
3622                     ; 1081     bitstatus = SET;
3624  03d7 a601          	ld	a,#1
3627  03d9               L3561:
3628                     ; 1085     bitstatus = RESET;
3631                     ; 1087   return (FlagStatus)bitstatus;
3635  03d9 5b04          	addw	sp,#4
3636  03db 81            	ret	
3671                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3671                     ; 1104 {
3672                     	switch	.text
3673  03dc               _TIM2_ClearFlag:
3677                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3679                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3681  03dc 9f            	ld	a,xl
3682  03dd 43            	cpl	a
3683  03de c75302        	ld	21250,a
3684                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3686  03e1 35ff5303      	mov	21251,#255
3687                     ; 1111 }
3690  03e5 81            	ret	
3750                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3750                     ; 1124 {
3751                     	switch	.text
3752  03e6               _TIM2_GetITStatus:
3754  03e6 88            	push	a
3755  03e7 89            	pushw	x
3756       00000002      OFST:	set	2
3759                     ; 1125   ITStatus bitstatus = RESET;
3761                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3765                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3767                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3769  03e8 c45302        	and	a,21250
3770  03eb 6b01          	ld	(OFST-1,sp),a
3772                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3774  03ed c65301        	ld	a,21249
3775  03f0 1403          	and	a,(OFST+1,sp)
3776  03f2 6b02          	ld	(OFST+0,sp),a
3778                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3780  03f4 7b01          	ld	a,(OFST-1,sp)
3781  03f6 2708          	jreq	L3271
3783  03f8 7b02          	ld	a,(OFST+0,sp)
3784  03fa 2704          	jreq	L3271
3785                     ; 1137     bitstatus = SET;
3787  03fc a601          	ld	a,#1
3790  03fe 2001          	jra	L5271
3791  0400               L3271:
3792                     ; 1141     bitstatus = RESET;
3794  0400 4f            	clr	a
3796  0401               L5271:
3797                     ; 1143   return (ITStatus)(bitstatus);
3801  0401 5b03          	addw	sp,#3
3802  0403 81            	ret	
3838                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3838                     ; 1157 {
3839                     	switch	.text
3840  0404               _TIM2_ClearITPendingBit:
3844                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
3846                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
3848  0404 43            	cpl	a
3849  0405 c75302        	ld	21250,a
3850                     ; 1163 }
3853  0408 81            	ret	
3899                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
3899                     ; 1182                        uint8_t TIM2_ICSelection,
3899                     ; 1183                        uint8_t TIM2_ICFilter)
3899                     ; 1184 {
3900                     	switch	.text
3901  0409               L3_TI1_Config:
3903  0409 89            	pushw	x
3904  040a 88            	push	a
3905       00000001      OFST:	set	1
3908                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3910  040b 72115308      	bres	21256,#0
3911                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
3911                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
3913  040f 7b06          	ld	a,(OFST+5,sp)
3914  0411 97            	ld	xl,a
3915  0412 a610          	ld	a,#16
3916  0414 42            	mul	x,a
3917  0415 9f            	ld	a,xl
3918  0416 1a03          	or	a,(OFST+2,sp)
3919  0418 6b01          	ld	(OFST+0,sp),a
3921  041a c65305        	ld	a,21253
3922  041d a40c          	and	a,#12
3923  041f 1a01          	or	a,(OFST+0,sp)
3924  0421 c75305        	ld	21253,a
3925                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
3927  0424 7b02          	ld	a,(OFST+1,sp)
3928  0426 2706          	jreq	L5671
3929                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
3931  0428 72125308      	bset	21256,#1
3933  042c 2004          	jra	L7671
3934  042e               L5671:
3935                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3937  042e 72135308      	bres	21256,#1
3938  0432               L7671:
3939                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
3941  0432 72105308      	bset	21256,#0
3942                     ; 1203 }
3945  0436 5b03          	addw	sp,#3
3946  0438 81            	ret	
3992                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
3992                     ; 1222                        uint8_t TIM2_ICSelection,
3992                     ; 1223                        uint8_t TIM2_ICFilter)
3992                     ; 1224 {
3993                     	switch	.text
3994  0439               L5_TI2_Config:
3996  0439 89            	pushw	x
3997  043a 88            	push	a
3998       00000001      OFST:	set	1
4001                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4003  043b 72195308      	bres	21256,#4
4004                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4004                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4006  043f 7b06          	ld	a,(OFST+5,sp)
4007  0441 97            	ld	xl,a
4008  0442 a610          	ld	a,#16
4009  0444 42            	mul	x,a
4010  0445 9f            	ld	a,xl
4011  0446 1a03          	or	a,(OFST+2,sp)
4012  0448 6b01          	ld	(OFST+0,sp),a
4014  044a c65306        	ld	a,21254
4015  044d a40c          	and	a,#12
4016  044f 1a01          	or	a,(OFST+0,sp)
4017  0451 c75306        	ld	21254,a
4018                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4020  0454 7b02          	ld	a,(OFST+1,sp)
4021  0456 2706          	jreq	L1102
4022                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
4024  0458 721a5308      	bset	21256,#5
4026  045c 2004          	jra	L3102
4027  045e               L1102:
4028                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4030  045e 721b5308      	bres	21256,#5
4031  0462               L3102:
4032                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
4034  0462 72185308      	bset	21256,#4
4035                     ; 1245 }
4038  0466 5b03          	addw	sp,#3
4039  0468 81            	ret	
4085                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4085                     ; 1262                        uint8_t TIM2_ICFilter)
4085                     ; 1263 {
4086                     	switch	.text
4087  0469               L7_TI3_Config:
4089  0469 89            	pushw	x
4090  046a 88            	push	a
4091       00000001      OFST:	set	1
4094                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4096  046b 72115309      	bres	21257,#0
4097                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4097                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4099  046f 7b06          	ld	a,(OFST+5,sp)
4100  0471 97            	ld	xl,a
4101  0472 a610          	ld	a,#16
4102  0474 42            	mul	x,a
4103  0475 9f            	ld	a,xl
4104  0476 1a03          	or	a,(OFST+2,sp)
4105  0478 6b01          	ld	(OFST+0,sp),a
4107  047a c65307        	ld	a,21255
4108  047d a40c          	and	a,#12
4109  047f 1a01          	or	a,(OFST+0,sp)
4110  0481 c75307        	ld	21255,a
4111                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4113  0484 7b02          	ld	a,(OFST+1,sp)
4114  0486 2706          	jreq	L5302
4115                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
4117  0488 72125309      	bset	21257,#1
4119  048c 2004          	jra	L7302
4120  048e               L5302:
4121                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4123  048e 72135309      	bres	21257,#1
4124  0492               L7302:
4125                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
4127  0492 72105309      	bset	21257,#0
4128                     ; 1283 }
4131  0496 5b03          	addw	sp,#3
4132  0498 81            	ret	
4145                     	xdef	_TIM2_ClearITPendingBit
4146                     	xdef	_TIM2_GetITStatus
4147                     	xdef	_TIM2_ClearFlag
4148                     	xdef	_TIM2_GetFlagStatus
4149                     	xdef	_TIM2_GetPrescaler
4150                     	xdef	_TIM2_GetCounter
4151                     	xdef	_TIM2_GetCapture3
4152                     	xdef	_TIM2_GetCapture2
4153                     	xdef	_TIM2_GetCapture1
4154                     	xdef	_TIM2_SetIC3Prescaler
4155                     	xdef	_TIM2_SetIC2Prescaler
4156                     	xdef	_TIM2_SetIC1Prescaler
4157                     	xdef	_TIM2_SetCompare3
4158                     	xdef	_TIM2_SetCompare2
4159                     	xdef	_TIM2_SetCompare1
4160                     	xdef	_TIM2_SetAutoreload
4161                     	xdef	_TIM2_SetCounter
4162                     	xdef	_TIM2_SelectOCxM
4163                     	xdef	_TIM2_CCxCmd
4164                     	xdef	_TIM2_OC3PolarityConfig
4165                     	xdef	_TIM2_OC2PolarityConfig
4166                     	xdef	_TIM2_OC1PolarityConfig
4167                     	xdef	_TIM2_GenerateEvent
4168                     	xdef	_TIM2_OC3PreloadConfig
4169                     	xdef	_TIM2_OC2PreloadConfig
4170                     	xdef	_TIM2_OC1PreloadConfig
4171                     	xdef	_TIM2_ARRPreloadConfig
4172                     	xdef	_TIM2_ForcedOC3Config
4173                     	xdef	_TIM2_ForcedOC2Config
4174                     	xdef	_TIM2_ForcedOC1Config
4175                     	xdef	_TIM2_PrescalerConfig
4176                     	xdef	_TIM2_SelectOnePulseMode
4177                     	xdef	_TIM2_UpdateRequestConfig
4178                     	xdef	_TIM2_UpdateDisableConfig
4179                     	xdef	_TIM2_ITConfig
4180                     	xdef	_TIM2_Cmd
4181                     	xdef	_TIM2_PWMIConfig
4182                     	xdef	_TIM2_ICInit
4183                     	xdef	_TIM2_OC3Init
4184                     	xdef	_TIM2_OC2Init
4185                     	xdef	_TIM2_OC1Init
4186                     	xdef	_TIM2_TimeBaseInit
4187                     	xdef	_TIM2_DeInit
4206                     	end
