   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  47                     ; 49 void TIM4_DeInit(void)
  47                     ; 50 {
  49                     	switch	.text
  50  0000               _TIM4_DeInit:
  54                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  56  0000 725f5340      	clr	21312
  57                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  59  0004 725f5341      	clr	21313
  60                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  62  0008 725f5344      	clr	21316
  63                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  65  000c 725f5345      	clr	21317
  66                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  68  0010 35ff5346      	mov	21318,#255
  69                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  71  0014 725f5342      	clr	21314
  72                     ; 57 }
  75  0018 81            	ret	
 179                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 179                     ; 66 {
 180                     	switch	.text
 181  0019               _TIM4_TimeBaseInit:
 185                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 187                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 189  0019 9e            	ld	a,xh
 190  001a c75345        	ld	21317,a
 191                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 193  001d 9f            	ld	a,xl
 194  001e c75346        	ld	21318,a
 195                     ; 73 }
 198  0021 81            	ret	
 253                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 253                     ; 82 {
 254                     	switch	.text
 255  0022               _TIM4_Cmd:
 259                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 261                     ; 87   if (NewState != DISABLE)
 263  0022 4d            	tnz	a
 264  0023 2705          	jreq	L311
 265                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 267  0025 72105340      	bset	21312,#0
 270  0029 81            	ret	
 271  002a               L311:
 272                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 274  002a 72115340      	bres	21312,#0
 275                     ; 95 }
 278  002e 81            	ret	
 336                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 336                     ; 108 {
 337                     	switch	.text
 338  002f               _TIM4_ITConfig:
 340  002f 89            	pushw	x
 341       00000000      OFST:	set	0
 344                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 346                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 348                     ; 113   if (NewState != DISABLE)
 350  0030 9f            	ld	a,xl
 351  0031 4d            	tnz	a
 352  0032 2706          	jreq	L741
 353                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 355  0034 9e            	ld	a,xh
 356  0035 ca5341        	or	a,21313
 358  0038 2006          	jra	L151
 359  003a               L741:
 360                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 362  003a 7b01          	ld	a,(OFST+1,sp)
 363  003c 43            	cpl	a
 364  003d c45341        	and	a,21313
 365  0040               L151:
 366  0040 c75341        	ld	21313,a
 367                     ; 123 }
 370  0043 85            	popw	x
 371  0044 81            	ret	
 407                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 407                     ; 132 {
 408                     	switch	.text
 409  0045               _TIM4_UpdateDisableConfig:
 413                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 415                     ; 137   if (NewState != DISABLE)
 417  0045 4d            	tnz	a
 418  0046 2705          	jreq	L171
 419                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 421  0048 72125340      	bset	21312,#1
 424  004c 81            	ret	
 425  004d               L171:
 426                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 428  004d 72135340      	bres	21312,#1
 429                     ; 145 }
 432  0051 81            	ret	
 490                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 490                     ; 156 {
 491                     	switch	.text
 492  0052               _TIM4_UpdateRequestConfig:
 496                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 498                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 500  0052 4d            	tnz	a
 501  0053 2705          	jreq	L322
 502                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 504  0055 72145340      	bset	21312,#2
 507  0059 81            	ret	
 508  005a               L322:
 509                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 511  005a 72155340      	bres	21312,#2
 512                     ; 169 }
 515  005e 81            	ret	
 572                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 572                     ; 180 {
 573                     	switch	.text
 574  005f               _TIM4_SelectOnePulseMode:
 578                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 580                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 582  005f 4d            	tnz	a
 583  0060 2705          	jreq	L552
 584                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 586  0062 72165340      	bset	21312,#3
 589  0066 81            	ret	
 590  0067               L552:
 591                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 593  0067 72175340      	bres	21312,#3
 594                     ; 193 }
 597  006b 81            	ret	
 665                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 665                     ; 216 {
 666                     	switch	.text
 667  006c               _TIM4_PrescalerConfig:
 671                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 673                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 675                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 677  006c 9e            	ld	a,xh
 678  006d c75345        	ld	21317,a
 679                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 681  0070 9f            	ld	a,xl
 682  0071 c75343        	ld	21315,a
 683                     ; 226 }
 686  0074 81            	ret	
 722                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 722                     ; 235 {
 723                     	switch	.text
 724  0075               _TIM4_ARRPreloadConfig:
 728                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 730                     ; 240   if (NewState != DISABLE)
 732  0075 4d            	tnz	a
 733  0076 2705          	jreq	L133
 734                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 736  0078 721e5340      	bset	21312,#7
 739  007c 81            	ret	
 740  007d               L133:
 741                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 743  007d 721f5340      	bres	21312,#7
 744                     ; 248 }
 747  0081 81            	ret	
 796                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 796                     ; 258 {
 797                     	switch	.text
 798  0082               _TIM4_GenerateEvent:
 802                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 804                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
 806  0082 c75343        	ld	21315,a
 807                     ; 264 }
 810  0085 81            	ret	
 842                     ; 272 void TIM4_SetCounter(uint8_t Counter)
 842                     ; 273 {
 843                     	switch	.text
 844  0086               _TIM4_SetCounter:
 848                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
 850  0086 c75344        	ld	21316,a
 851                     ; 276 }
 854  0089 81            	ret	
 886                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
 886                     ; 285 {
 887                     	switch	.text
 888  008a               _TIM4_SetAutoreload:
 892                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
 894  008a c75346        	ld	21318,a
 895                     ; 288 }
 898  008d 81            	ret	
 921                     ; 295 uint8_t TIM4_GetCounter(void)
 921                     ; 296 {
 922                     	switch	.text
 923  008e               _TIM4_GetCounter:
 927                     ; 298   return (uint8_t)(TIM4->CNTR);
 929  008e c65344        	ld	a,21316
 932  0091 81            	ret	
 956                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 956                     ; 307 {
 957                     	switch	.text
 958  0092               _TIM4_GetPrescaler:
 962                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 964  0092 c65345        	ld	a,21317
 967  0095 81            	ret	
1046                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1046                     ; 320 {
1047                     	switch	.text
1048  0096               _TIM4_GetFlagStatus:
1050       00000001      OFST:	set	1
1053                     ; 321   FlagStatus bitstatus = RESET;
1055                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1057                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1059  0096 c45342        	and	a,21314
1060  0099 2702          	jreq	L174
1061                     ; 328     bitstatus = SET;
1063  009b a601          	ld	a,#1
1066  009d               L174:
1067                     ; 332     bitstatus = RESET;
1070                     ; 334   return ((FlagStatus)bitstatus);
1074  009d 81            	ret	
1109                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1109                     ; 345 {
1110                     	switch	.text
1111  009e               _TIM4_ClearFlag:
1115                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1117                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1119  009e 43            	cpl	a
1120  009f c75342        	ld	21314,a
1121                     ; 351 }
1124  00a2 81            	ret	
1184                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1184                     ; 361 {
1185                     	switch	.text
1186  00a3               _TIM4_GetITStatus:
1188  00a3 88            	push	a
1189  00a4 89            	pushw	x
1190       00000002      OFST:	set	2
1193                     ; 362   ITStatus bitstatus = RESET;
1195                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1199                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1201                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1203  00a5 c45342        	and	a,21314
1204  00a8 6b01          	ld	(OFST-1,sp),a
1206                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1208  00aa c65341        	ld	a,21313
1209  00ad 1403          	and	a,(OFST+1,sp)
1210  00af 6b02          	ld	(OFST+0,sp),a
1212                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1214  00b1 7b01          	ld	a,(OFST-1,sp)
1215  00b3 2708          	jreq	L145
1217  00b5 7b02          	ld	a,(OFST+0,sp)
1218  00b7 2704          	jreq	L145
1219                     ; 375     bitstatus = (ITStatus)SET;
1221  00b9 a601          	ld	a,#1
1224  00bb 2001          	jra	L345
1225  00bd               L145:
1226                     ; 379     bitstatus = (ITStatus)RESET;
1228  00bd 4f            	clr	a
1230  00be               L345:
1231                     ; 381   return ((ITStatus)bitstatus);
1235  00be 5b03          	addw	sp,#3
1236  00c0 81            	ret	
1272                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1272                     ; 392 {
1273                     	switch	.text
1274  00c1               _TIM4_ClearITPendingBit:
1278                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1280                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1282  00c1 43            	cpl	a
1283  00c2 c75342        	ld	21314,a
1284                     ; 398 }
1287  00c5 81            	ret	
1300                     	xdef	_TIM4_ClearITPendingBit
1301                     	xdef	_TIM4_GetITStatus
1302                     	xdef	_TIM4_ClearFlag
1303                     	xdef	_TIM4_GetFlagStatus
1304                     	xdef	_TIM4_GetPrescaler
1305                     	xdef	_TIM4_GetCounter
1306                     	xdef	_TIM4_SetAutoreload
1307                     	xdef	_TIM4_SetCounter
1308                     	xdef	_TIM4_GenerateEvent
1309                     	xdef	_TIM4_ARRPreloadConfig
1310                     	xdef	_TIM4_PrescalerConfig
1311                     	xdef	_TIM4_SelectOnePulseMode
1312                     	xdef	_TIM4_UpdateRequestConfig
1313                     	xdef	_TIM4_UpdateDisableConfig
1314                     	xdef	_TIM4_ITConfig
1315                     	xdef	_TIM4_Cmd
1316                     	xdef	_TIM4_TimeBaseInit
1317                     	xdef	_TIM4_DeInit
1336                     	end
