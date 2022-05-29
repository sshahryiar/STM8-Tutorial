   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  43                     ; 49 void TIM4_DeInit(void)
  43                     ; 50 {
  45                     	switch	.text
  46  0000               _TIM4_DeInit:
  50                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  52  0000 725f5340      	clr	21312
  53                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  55  0004 725f5343      	clr	21315
  56                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  58  0008 725f5346      	clr	21318
  59                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  61  000c 725f5347      	clr	21319
  62                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  64  0010 35ff5348      	mov	21320,#255
  65                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  67  0014 725f5344      	clr	21316
  68                     ; 57 }
  71  0018 81            	ret
 177                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 177                     ; 66 {
 178                     	switch	.text
 179  0019               _TIM4_TimeBaseInit:
 183                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 185                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 187  0019 9e            	ld	a,xh
 188  001a c75347        	ld	21319,a
 189                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 191  001d 9f            	ld	a,xl
 192  001e c75348        	ld	21320,a
 193                     ; 73 }
 196  0021 81            	ret
 251                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 251                     ; 82 {
 252                     	switch	.text
 253  0022               _TIM4_Cmd:
 257                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 259                     ; 87   if (NewState != DISABLE)
 261  0022 4d            	tnz	a
 262  0023 2706          	jreq	L511
 263                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 265  0025 72105340      	bset	21312,#0
 267  0029 2004          	jra	L711
 268  002b               L511:
 269                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 271  002b 72115340      	bres	21312,#0
 272  002f               L711:
 273                     ; 95 }
 276  002f 81            	ret
 334                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 334                     ; 108 {
 335                     	switch	.text
 336  0030               _TIM4_ITConfig:
 338  0030 89            	pushw	x
 339       00000000      OFST:	set	0
 342                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 344                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 346                     ; 113   if (NewState != DISABLE)
 348  0031 9f            	ld	a,xl
 349  0032 4d            	tnz	a
 350  0033 2709          	jreq	L151
 351                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 353  0035 9e            	ld	a,xh
 354  0036 ca5343        	or	a,21315
 355  0039 c75343        	ld	21315,a
 357  003c 2009          	jra	L351
 358  003e               L151:
 359                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 361  003e 7b01          	ld	a,(OFST+1,sp)
 362  0040 43            	cpl	a
 363  0041 c45343        	and	a,21315
 364  0044 c75343        	ld	21315,a
 365  0047               L351:
 366                     ; 123 }
 369  0047 85            	popw	x
 370  0048 81            	ret
 406                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 406                     ; 132 {
 407                     	switch	.text
 408  0049               _TIM4_UpdateDisableConfig:
 412                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 414                     ; 137   if (NewState != DISABLE)
 416  0049 4d            	tnz	a
 417  004a 2706          	jreq	L371
 418                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 420  004c 72125340      	bset	21312,#1
 422  0050 2004          	jra	L571
 423  0052               L371:
 424                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 426  0052 72135340      	bres	21312,#1
 427  0056               L571:
 428                     ; 145 }
 431  0056 81            	ret
 489                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 489                     ; 156 {
 490                     	switch	.text
 491  0057               _TIM4_UpdateRequestConfig:
 495                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 497                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 499  0057 4d            	tnz	a
 500  0058 2706          	jreq	L522
 501                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 503  005a 72145340      	bset	21312,#2
 505  005e 2004          	jra	L722
 506  0060               L522:
 507                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 509  0060 72155340      	bres	21312,#2
 510  0064               L722:
 511                     ; 169 }
 514  0064 81            	ret
 571                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 571                     ; 180 {
 572                     	switch	.text
 573  0065               _TIM4_SelectOnePulseMode:
 577                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 579                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 581  0065 4d            	tnz	a
 582  0066 2706          	jreq	L752
 583                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 585  0068 72165340      	bset	21312,#3
 587  006c 2004          	jra	L162
 588  006e               L752:
 589                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 591  006e 72175340      	bres	21312,#3
 592  0072               L162:
 593                     ; 193 }
 596  0072 81            	ret
 664                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 664                     ; 216 {
 665                     	switch	.text
 666  0073               _TIM4_PrescalerConfig:
 670                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 672                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 674                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 676  0073 9e            	ld	a,xh
 677  0074 c75347        	ld	21319,a
 678                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 680  0077 9f            	ld	a,xl
 681  0078 c75345        	ld	21317,a
 682                     ; 226 }
 685  007b 81            	ret
 721                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 721                     ; 235 {
 722                     	switch	.text
 723  007c               _TIM4_ARRPreloadConfig:
 727                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 729                     ; 240   if (NewState != DISABLE)
 731  007c 4d            	tnz	a
 732  007d 2706          	jreq	L333
 733                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 735  007f 721e5340      	bset	21312,#7
 737  0083 2004          	jra	L533
 738  0085               L333:
 739                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 741  0085 721f5340      	bres	21312,#7
 742  0089               L533:
 743                     ; 248 }
 746  0089 81            	ret
 795                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 795                     ; 258 {
 796                     	switch	.text
 797  008a               _TIM4_GenerateEvent:
 801                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 803                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
 805  008a c75345        	ld	21317,a
 806                     ; 264 }
 809  008d 81            	ret
 843                     ; 272 void TIM4_SetCounter(uint8_t Counter)
 843                     ; 273 {
 844                     	switch	.text
 845  008e               _TIM4_SetCounter:
 849                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
 851  008e c75346        	ld	21318,a
 852                     ; 276 }
 855  0091 81            	ret
 889                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
 889                     ; 285 {
 890                     	switch	.text
 891  0092               _TIM4_SetAutoreload:
 895                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
 897  0092 c75348        	ld	21320,a
 898                     ; 288 }
 901  0095 81            	ret
 924                     ; 295 uint8_t TIM4_GetCounter(void)
 924                     ; 296 {
 925                     	switch	.text
 926  0096               _TIM4_GetCounter:
 930                     ; 298   return (uint8_t)(TIM4->CNTR);
 932  0096 c65346        	ld	a,21318
 935  0099 81            	ret
 959                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 959                     ; 307 {
 960                     	switch	.text
 961  009a               _TIM4_GetPrescaler:
 965                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 967  009a c65347        	ld	a,21319
 970  009d 81            	ret
1049                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1049                     ; 320 {
1050                     	switch	.text
1051  009e               _TIM4_GetFlagStatus:
1053  009e 88            	push	a
1054       00000001      OFST:	set	1
1057                     ; 321   FlagStatus bitstatus = RESET;
1059                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1061                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1063  009f c45344        	and	a,21316
1064  00a2 2706          	jreq	L774
1065                     ; 328     bitstatus = SET;
1067  00a4 a601          	ld	a,#1
1068  00a6 6b01          	ld	(OFST+0,sp),a
1071  00a8 2002          	jra	L105
1072  00aa               L774:
1073                     ; 332     bitstatus = RESET;
1075  00aa 0f01          	clr	(OFST+0,sp)
1077  00ac               L105:
1078                     ; 334   return ((FlagStatus)bitstatus);
1080  00ac 7b01          	ld	a,(OFST+0,sp)
1083  00ae 5b01          	addw	sp,#1
1084  00b0 81            	ret
1119                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1119                     ; 345 {
1120                     	switch	.text
1121  00b1               _TIM4_ClearFlag:
1125                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1127                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1129  00b1 43            	cpl	a
1130  00b2 c75344        	ld	21316,a
1131                     ; 351 }
1134  00b5 81            	ret
1198                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1198                     ; 361 {
1199                     	switch	.text
1200  00b6               _TIM4_GetITStatus:
1202  00b6 88            	push	a
1203  00b7 89            	pushw	x
1204       00000002      OFST:	set	2
1207                     ; 362   ITStatus bitstatus = RESET;
1209                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1213                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1215                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1217  00b8 c45344        	and	a,21316
1218  00bb 6b01          	ld	(OFST-1,sp),a
1220                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1222  00bd c65343        	ld	a,21315
1223  00c0 1403          	and	a,(OFST+1,sp)
1224  00c2 6b02          	ld	(OFST+0,sp),a
1226                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1228  00c4 0d01          	tnz	(OFST-1,sp)
1229  00c6 270a          	jreq	L355
1231  00c8 0d02          	tnz	(OFST+0,sp)
1232  00ca 2706          	jreq	L355
1233                     ; 375     bitstatus = (ITStatus)SET;
1235  00cc a601          	ld	a,#1
1236  00ce 6b02          	ld	(OFST+0,sp),a
1239  00d0 2002          	jra	L555
1240  00d2               L355:
1241                     ; 379     bitstatus = (ITStatus)RESET;
1243  00d2 0f02          	clr	(OFST+0,sp)
1245  00d4               L555:
1246                     ; 381   return ((ITStatus)bitstatus);
1248  00d4 7b02          	ld	a,(OFST+0,sp)
1251  00d6 5b03          	addw	sp,#3
1252  00d8 81            	ret
1288                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1288                     ; 392 {
1289                     	switch	.text
1290  00d9               _TIM4_ClearITPendingBit:
1294                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1296                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1298  00d9 43            	cpl	a
1299  00da c75344        	ld	21316,a
1300                     ; 398 }
1303  00dd 81            	ret
1316                     	xdef	_TIM4_ClearITPendingBit
1317                     	xdef	_TIM4_GetITStatus
1318                     	xdef	_TIM4_ClearFlag
1319                     	xdef	_TIM4_GetFlagStatus
1320                     	xdef	_TIM4_GetPrescaler
1321                     	xdef	_TIM4_GetCounter
1322                     	xdef	_TIM4_SetAutoreload
1323                     	xdef	_TIM4_SetCounter
1324                     	xdef	_TIM4_GenerateEvent
1325                     	xdef	_TIM4_ARRPreloadConfig
1326                     	xdef	_TIM4_PrescalerConfig
1327                     	xdef	_TIM4_SelectOnePulseMode
1328                     	xdef	_TIM4_UpdateRequestConfig
1329                     	xdef	_TIM4_UpdateDisableConfig
1330                     	xdef	_TIM4_ITConfig
1331                     	xdef	_TIM4_Cmd
1332                     	xdef	_TIM4_TimeBaseInit
1333                     	xdef	_TIM4_DeInit
1352                     	end
