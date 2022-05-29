   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  42                     ; 49 void TIM4_DeInit(void)
  42                     ; 50 {
  44                     	switch	.text
  45  0000               _TIM4_DeInit:
  49                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  51  0000 725f5340      	clr	21312
  52                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  54  0004 725f5341      	clr	21313
  55                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  57  0008 725f5344      	clr	21316
  58                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  60  000c 725f5345      	clr	21317
  61                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  63  0010 35ff5346      	mov	21318,#255
  64                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  66  0014 725f5342      	clr	21314
  67                     ; 57 }
  70  0018 81            	ret
 174                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 174                     ; 66 {
 175                     	switch	.text
 176  0019               _TIM4_TimeBaseInit:
 180                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 182                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 184  0019 9e            	ld	a,xh
 185  001a c75345        	ld	21317,a
 186                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 188  001d 9f            	ld	a,xl
 189  001e c75346        	ld	21318,a
 190                     ; 73 }
 193  0021 81            	ret
 248                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 248                     ; 82 {
 249                     	switch	.text
 250  0022               _TIM4_Cmd:
 254                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 256                     ; 87   if (NewState != DISABLE)
 258  0022 4d            	tnz	a
 259  0023 2706          	jreq	L311
 260                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 262  0025 72105340      	bset	21312,#0
 264  0029 2004          	jra	L511
 265  002b               L311:
 266                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 268  002b 72115340      	bres	21312,#0
 269  002f               L511:
 270                     ; 95 }
 273  002f 81            	ret
 331                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 331                     ; 108 {
 332                     	switch	.text
 333  0030               _TIM4_ITConfig:
 335  0030 89            	pushw	x
 336       00000000      OFST:	set	0
 339                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 341                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 343                     ; 113   if (NewState != DISABLE)
 345  0031 9f            	ld	a,xl
 346  0032 4d            	tnz	a
 347  0033 2709          	jreq	L741
 348                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 350  0035 9e            	ld	a,xh
 351  0036 ca5341        	or	a,21313
 352  0039 c75341        	ld	21313,a
 354  003c 2009          	jra	L151
 355  003e               L741:
 356                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 358  003e 7b01          	ld	a,(OFST+1,sp)
 359  0040 43            	cpl	a
 360  0041 c45341        	and	a,21313
 361  0044 c75341        	ld	21313,a
 362  0047               L151:
 363                     ; 123 }
 366  0047 85            	popw	x
 367  0048 81            	ret
 403                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 403                     ; 132 {
 404                     	switch	.text
 405  0049               _TIM4_UpdateDisableConfig:
 409                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 411                     ; 137   if (NewState != DISABLE)
 413  0049 4d            	tnz	a
 414  004a 2706          	jreq	L171
 415                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 417  004c 72125340      	bset	21312,#1
 419  0050 2004          	jra	L371
 420  0052               L171:
 421                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 423  0052 72135340      	bres	21312,#1
 424  0056               L371:
 425                     ; 145 }
 428  0056 81            	ret
 486                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 486                     ; 156 {
 487                     	switch	.text
 488  0057               _TIM4_UpdateRequestConfig:
 492                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 494                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 496  0057 4d            	tnz	a
 497  0058 2706          	jreq	L322
 498                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 500  005a 72145340      	bset	21312,#2
 502  005e 2004          	jra	L522
 503  0060               L322:
 504                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 506  0060 72155340      	bres	21312,#2
 507  0064               L522:
 508                     ; 169 }
 511  0064 81            	ret
 568                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 568                     ; 180 {
 569                     	switch	.text
 570  0065               _TIM4_SelectOnePulseMode:
 574                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 576                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 578  0065 4d            	tnz	a
 579  0066 2706          	jreq	L552
 580                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 582  0068 72165340      	bset	21312,#3
 584  006c 2004          	jra	L752
 585  006e               L552:
 586                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 588  006e 72175340      	bres	21312,#3
 589  0072               L752:
 590                     ; 193 }
 593  0072 81            	ret
 661                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 661                     ; 216 {
 662                     	switch	.text
 663  0073               _TIM4_PrescalerConfig:
 667                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 669                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 671                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 673  0073 9e            	ld	a,xh
 674  0074 c75345        	ld	21317,a
 675                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 677  0077 9f            	ld	a,xl
 678  0078 c75343        	ld	21315,a
 679                     ; 226 }
 682  007b 81            	ret
 718                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 718                     ; 235 {
 719                     	switch	.text
 720  007c               _TIM4_ARRPreloadConfig:
 724                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 726                     ; 240   if (NewState != DISABLE)
 728  007c 4d            	tnz	a
 729  007d 2706          	jreq	L133
 730                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 732  007f 721e5340      	bset	21312,#7
 734  0083 2004          	jra	L333
 735  0085               L133:
 736                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 738  0085 721f5340      	bres	21312,#7
 739  0089               L333:
 740                     ; 248 }
 743  0089 81            	ret
 792                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 792                     ; 258 {
 793                     	switch	.text
 794  008a               _TIM4_GenerateEvent:
 798                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 800                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
 802  008a c75343        	ld	21315,a
 803                     ; 264 }
 806  008d 81            	ret
 838                     ; 272 void TIM4_SetCounter(uint8_t Counter)
 838                     ; 273 {
 839                     	switch	.text
 840  008e               _TIM4_SetCounter:
 844                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
 846  008e c75344        	ld	21316,a
 847                     ; 276 }
 850  0091 81            	ret
 882                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
 882                     ; 285 {
 883                     	switch	.text
 884  0092               _TIM4_SetAutoreload:
 888                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
 890  0092 c75346        	ld	21318,a
 891                     ; 288 }
 894  0095 81            	ret
 917                     ; 295 uint8_t TIM4_GetCounter(void)
 917                     ; 296 {
 918                     	switch	.text
 919  0096               _TIM4_GetCounter:
 923                     ; 298   return (uint8_t)(TIM4->CNTR);
 925  0096 c65344        	ld	a,21316
 928  0099 81            	ret
 952                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 952                     ; 307 {
 953                     	switch	.text
 954  009a               _TIM4_GetPrescaler:
 958                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 960  009a c65345        	ld	a,21317
 963  009d 81            	ret
1042                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1042                     ; 320 {
1043                     	switch	.text
1044  009e               _TIM4_GetFlagStatus:
1046  009e 88            	push	a
1047       00000001      OFST:	set	1
1050                     ; 321   FlagStatus bitstatus = RESET;
1052                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1054                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1056  009f c45342        	and	a,21314
1057  00a2 2706          	jreq	L174
1058                     ; 328     bitstatus = SET;
1060  00a4 a601          	ld	a,#1
1061  00a6 6b01          	ld	(OFST+0,sp),a
1064  00a8 2002          	jra	L374
1065  00aa               L174:
1066                     ; 332     bitstatus = RESET;
1068  00aa 0f01          	clr	(OFST+0,sp)
1070  00ac               L374:
1071                     ; 334   return ((FlagStatus)bitstatus);
1073  00ac 7b01          	ld	a,(OFST+0,sp)
1076  00ae 5b01          	addw	sp,#1
1077  00b0 81            	ret
1112                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1112                     ; 345 {
1113                     	switch	.text
1114  00b1               _TIM4_ClearFlag:
1118                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1120                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1122  00b1 43            	cpl	a
1123  00b2 c75342        	ld	21314,a
1124                     ; 351 }
1127  00b5 81            	ret
1187                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1187                     ; 361 {
1188                     	switch	.text
1189  00b6               _TIM4_GetITStatus:
1191  00b6 88            	push	a
1192  00b7 89            	pushw	x
1193       00000002      OFST:	set	2
1196                     ; 362   ITStatus bitstatus = RESET;
1198                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1202                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1204                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1206  00b8 c45342        	and	a,21314
1207  00bb 6b01          	ld	(OFST-1,sp),a
1209                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1211  00bd c65341        	ld	a,21313
1212  00c0 1403          	and	a,(OFST+1,sp)
1213  00c2 6b02          	ld	(OFST+0,sp),a
1215                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1217  00c4 0d01          	tnz	(OFST-1,sp)
1218  00c6 270a          	jreq	L145
1220  00c8 0d02          	tnz	(OFST+0,sp)
1221  00ca 2706          	jreq	L145
1222                     ; 375     bitstatus = (ITStatus)SET;
1224  00cc a601          	ld	a,#1
1225  00ce 6b02          	ld	(OFST+0,sp),a
1228  00d0 2002          	jra	L345
1229  00d2               L145:
1230                     ; 379     bitstatus = (ITStatus)RESET;
1232  00d2 0f02          	clr	(OFST+0,sp)
1234  00d4               L345:
1235                     ; 381   return ((ITStatus)bitstatus);
1237  00d4 7b02          	ld	a,(OFST+0,sp)
1240  00d6 5b03          	addw	sp,#3
1241  00d8 81            	ret
1277                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1277                     ; 392 {
1278                     	switch	.text
1279  00d9               _TIM4_ClearITPendingBit:
1283                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1285                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1287  00d9 43            	cpl	a
1288  00da c75342        	ld	21314,a
1289                     ; 398 }
1292  00dd 81            	ret
1305                     	xdef	_TIM4_ClearITPendingBit
1306                     	xdef	_TIM4_GetITStatus
1307                     	xdef	_TIM4_ClearFlag
1308                     	xdef	_TIM4_GetFlagStatus
1309                     	xdef	_TIM4_GetPrescaler
1310                     	xdef	_TIM4_GetCounter
1311                     	xdef	_TIM4_SetAutoreload
1312                     	xdef	_TIM4_SetCounter
1313                     	xdef	_TIM4_GenerateEvent
1314                     	xdef	_TIM4_ARRPreloadConfig
1315                     	xdef	_TIM4_PrescalerConfig
1316                     	xdef	_TIM4_SelectOnePulseMode
1317                     	xdef	_TIM4_UpdateRequestConfig
1318                     	xdef	_TIM4_UpdateDisableConfig
1319                     	xdef	_TIM4_ITConfig
1320                     	xdef	_TIM4_Cmd
1321                     	xdef	_TIM4_TimeBaseInit
1322                     	xdef	_TIM4_DeInit
1341                     	end
