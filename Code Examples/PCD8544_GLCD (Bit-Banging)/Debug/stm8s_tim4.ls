   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  42                     ; 49 void TIM4_DeInit(void)
  42                     ; 50 {
  43                     	switch	.text
  44  0000               f_TIM4_DeInit:
  48                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  50  0000 725f5340      	clr	21312
  51                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  53  0004 725f5341      	clr	21313
  54                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  56  0008 725f5344      	clr	21316
  57                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  59  000c 725f5345      	clr	21317
  60                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  62  0010 35ff5346      	mov	21318,#255
  63                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  65  0014 725f5342      	clr	21314
  66                     ; 57 }
  69  0018 87            	retf
 172                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 172                     ; 66 {
 173                     	switch	.text
 174  0019               f_TIM4_TimeBaseInit:
 178                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 180                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 182  0019 9e            	ld	a,xh
 183  001a c75345        	ld	21317,a
 184                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 186  001d 9f            	ld	a,xl
 187  001e c75346        	ld	21318,a
 188                     ; 73 }
 191  0021 87            	retf
 245                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 245                     ; 82 {
 246                     	switch	.text
 247  0022               f_TIM4_Cmd:
 251                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 253                     ; 87   if (NewState != DISABLE)
 255  0022 4d            	tnz	a
 256  0023 2706          	jreq	L311
 257                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 259  0025 72105340      	bset	21312,#0
 261  0029 2004          	jra	L511
 262  002b               L311:
 263                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 265  002b 72115340      	bres	21312,#0
 266  002f               L511:
 267                     ; 95 }
 270  002f 87            	retf
 327                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 327                     ; 108 {
 328                     	switch	.text
 329  0030               f_TIM4_ITConfig:
 331  0030 89            	pushw	x
 332       00000000      OFST:	set	0
 335                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 337                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 339                     ; 113   if (NewState != DISABLE)
 341  0031 9f            	ld	a,xl
 342  0032 4d            	tnz	a
 343  0033 2709          	jreq	L741
 344                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 346  0035 9e            	ld	a,xh
 347  0036 ca5341        	or	a,21313
 348  0039 c75341        	ld	21313,a
 350  003c 2009          	jra	L151
 351  003e               L741:
 352                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 354  003e 7b01          	ld	a,(OFST+1,sp)
 355  0040 43            	cpl	a
 356  0041 c45341        	and	a,21313
 357  0044 c75341        	ld	21313,a
 358  0047               L151:
 359                     ; 123 }
 362  0047 85            	popw	x
 363  0048 87            	retf
 398                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 398                     ; 132 {
 399                     	switch	.text
 400  0049               f_TIM4_UpdateDisableConfig:
 404                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 406                     ; 137   if (NewState != DISABLE)
 408  0049 4d            	tnz	a
 409  004a 2706          	jreq	L171
 410                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 412  004c 72125340      	bset	21312,#1
 414  0050 2004          	jra	L371
 415  0052               L171:
 416                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 418  0052 72135340      	bres	21312,#1
 419  0056               L371:
 420                     ; 145 }
 423  0056 87            	retf
 480                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 480                     ; 156 {
 481                     	switch	.text
 482  0057               f_TIM4_UpdateRequestConfig:
 486                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 488                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 490  0057 4d            	tnz	a
 491  0058 2706          	jreq	L322
 492                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 494  005a 72145340      	bset	21312,#2
 496  005e 2004          	jra	L522
 497  0060               L322:
 498                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 500  0060 72155340      	bres	21312,#2
 501  0064               L522:
 502                     ; 169 }
 505  0064 87            	retf
 561                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 561                     ; 180 {
 562                     	switch	.text
 563  0065               f_TIM4_SelectOnePulseMode:
 567                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 569                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 571  0065 4d            	tnz	a
 572  0066 2706          	jreq	L552
 573                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 575  0068 72165340      	bset	21312,#3
 577  006c 2004          	jra	L752
 578  006e               L552:
 579                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 581  006e 72175340      	bres	21312,#3
 582  0072               L752:
 583                     ; 193 }
 586  0072 87            	retf
 653                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 653                     ; 216 {
 654                     	switch	.text
 655  0073               f_TIM4_PrescalerConfig:
 659                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 661                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 663                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 665  0073 9e            	ld	a,xh
 666  0074 c75345        	ld	21317,a
 667                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 669  0077 9f            	ld	a,xl
 670  0078 c75343        	ld	21315,a
 671                     ; 226 }
 674  007b 87            	retf
 709                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 709                     ; 235 {
 710                     	switch	.text
 711  007c               f_TIM4_ARRPreloadConfig:
 715                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 717                     ; 240   if (NewState != DISABLE)
 719  007c 4d            	tnz	a
 720  007d 2706          	jreq	L133
 721                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 723  007f 721e5340      	bset	21312,#7
 725  0083 2004          	jra	L333
 726  0085               L133:
 727                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 729  0085 721f5340      	bres	21312,#7
 730  0089               L333:
 731                     ; 248 }
 734  0089 87            	retf
 782                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 782                     ; 258 {
 783                     	switch	.text
 784  008a               f_TIM4_GenerateEvent:
 788                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 790                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
 792  008a c75343        	ld	21315,a
 793                     ; 264 }
 796  008d 87            	retf
 827                     ; 272 void TIM4_SetCounter(uint8_t Counter)
 827                     ; 273 {
 828                     	switch	.text
 829  008e               f_TIM4_SetCounter:
 833                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
 835  008e c75344        	ld	21316,a
 836                     ; 276 }
 839  0091 87            	retf
 870                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
 870                     ; 285 {
 871                     	switch	.text
 872  0092               f_TIM4_SetAutoreload:
 876                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
 878  0092 c75346        	ld	21318,a
 879                     ; 288 }
 882  0095 87            	retf
 904                     ; 295 uint8_t TIM4_GetCounter(void)
 904                     ; 296 {
 905                     	switch	.text
 906  0096               f_TIM4_GetCounter:
 910                     ; 298   return (uint8_t)(TIM4->CNTR);
 912  0096 c65344        	ld	a,21316
 915  0099 87            	retf
 938                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 938                     ; 307 {
 939                     	switch	.text
 940  009a               f_TIM4_GetPrescaler:
 944                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 946  009a c65345        	ld	a,21317
 949  009d 87            	retf
1027                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1027                     ; 320 {
1028                     	switch	.text
1029  009e               f_TIM4_GetFlagStatus:
1031  009e 88            	push	a
1032       00000001      OFST:	set	1
1035                     ; 321   FlagStatus bitstatus = RESET;
1037                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1039                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1041  009f c45342        	and	a,21314
1042  00a2 2706          	jreq	L174
1043                     ; 328     bitstatus = SET;
1045  00a4 a601          	ld	a,#1
1046  00a6 6b01          	ld	(OFST+0,sp),a
1049  00a8 2002          	jra	L374
1050  00aa               L174:
1051                     ; 332     bitstatus = RESET;
1053  00aa 0f01          	clr	(OFST+0,sp)
1055  00ac               L374:
1056                     ; 334   return ((FlagStatus)bitstatus);
1058  00ac 7b01          	ld	a,(OFST+0,sp)
1061  00ae 5b01          	addw	sp,#1
1062  00b0 87            	retf
1096                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1096                     ; 345 {
1097                     	switch	.text
1098  00b1               f_TIM4_ClearFlag:
1102                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1104                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1106  00b1 43            	cpl	a
1107  00b2 c75342        	ld	21314,a
1108                     ; 351 }
1111  00b5 87            	retf
1170                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1170                     ; 361 {
1171                     	switch	.text
1172  00b6               f_TIM4_GetITStatus:
1174  00b6 88            	push	a
1175  00b7 89            	pushw	x
1176       00000002      OFST:	set	2
1179                     ; 362   ITStatus bitstatus = RESET;
1181                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1185                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1187                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1189  00b8 c45342        	and	a,21314
1190  00bb 6b01          	ld	(OFST-1,sp),a
1192                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1194  00bd c65341        	ld	a,21313
1195  00c0 1403          	and	a,(OFST+1,sp)
1196  00c2 6b02          	ld	(OFST+0,sp),a
1198                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1200  00c4 0d01          	tnz	(OFST-1,sp)
1201  00c6 270a          	jreq	L145
1203  00c8 0d02          	tnz	(OFST+0,sp)
1204  00ca 2706          	jreq	L145
1205                     ; 375     bitstatus = (ITStatus)SET;
1207  00cc a601          	ld	a,#1
1208  00ce 6b02          	ld	(OFST+0,sp),a
1211  00d0 2002          	jra	L345
1212  00d2               L145:
1213                     ; 379     bitstatus = (ITStatus)RESET;
1215  00d2 0f02          	clr	(OFST+0,sp)
1217  00d4               L345:
1218                     ; 381   return ((ITStatus)bitstatus);
1220  00d4 7b02          	ld	a,(OFST+0,sp)
1223  00d6 5b03          	addw	sp,#3
1224  00d8 87            	retf
1259                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1259                     ; 392 {
1260                     	switch	.text
1261  00d9               f_TIM4_ClearITPendingBit:
1265                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1267                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1269  00d9 43            	cpl	a
1270  00da c75342        	ld	21314,a
1271                     ; 398 }
1274  00dd 87            	retf
1286                     	xdef	f_TIM4_ClearITPendingBit
1287                     	xdef	f_TIM4_GetITStatus
1288                     	xdef	f_TIM4_ClearFlag
1289                     	xdef	f_TIM4_GetFlagStatus
1290                     	xdef	f_TIM4_GetPrescaler
1291                     	xdef	f_TIM4_GetCounter
1292                     	xdef	f_TIM4_SetAutoreload
1293                     	xdef	f_TIM4_SetCounter
1294                     	xdef	f_TIM4_GenerateEvent
1295                     	xdef	f_TIM4_ARRPreloadConfig
1296                     	xdef	f_TIM4_PrescalerConfig
1297                     	xdef	f_TIM4_SelectOnePulseMode
1298                     	xdef	f_TIM4_UpdateRequestConfig
1299                     	xdef	f_TIM4_UpdateDisableConfig
1300                     	xdef	f_TIM4_ITConfig
1301                     	xdef	f_TIM4_Cmd
1302                     	xdef	f_TIM4_TimeBaseInit
1303                     	xdef	f_TIM4_DeInit
1322                     	end
