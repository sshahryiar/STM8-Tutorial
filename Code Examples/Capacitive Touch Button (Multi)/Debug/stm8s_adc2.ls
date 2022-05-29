   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  42                     ; 54 void ADC2_DeInit(void)
  42                     ; 55 {
  44                     	switch	.text
  45  0000               _ADC2_DeInit:
  49                     ; 56   ADC2->CSR  = ADC2_CSR_RESET_VALUE;
  51  0000 725f5400      	clr	21504
  52                     ; 57   ADC2->CR1  = ADC2_CR1_RESET_VALUE;
  54  0004 725f5401      	clr	21505
  55                     ; 58   ADC2->CR2  = ADC2_CR2_RESET_VALUE;
  57  0008 725f5402      	clr	21506
  58                     ; 59   ADC2->TDRH = ADC2_TDRH_RESET_VALUE;
  60  000c 725f5406      	clr	21510
  61                     ; 60   ADC2->TDRL = ADC2_TDRL_RESET_VALUE;
  63  0010 725f5407      	clr	21511
  64                     ; 61 }
  67  0014 81            	ret
 593                     ; 83 void ADC2_Init(ADC2_ConvMode_TypeDef ADC2_ConversionMode, ADC2_Channel_TypeDef ADC2_Channel, ADC2_PresSel_TypeDef ADC2_PrescalerSelection, ADC2_ExtTrig_TypeDef ADC2_ExtTrigger, FunctionalState ADC2_ExtTriggerState, ADC2_Align_TypeDef ADC2_Align, ADC2_SchmittTrigg_TypeDef ADC2_SchmittTriggerChannel, FunctionalState ADC2_SchmittTriggerState)
 593                     ; 84 {
 594                     	switch	.text
 595  0015               _ADC2_Init:
 597  0015 89            	pushw	x
 598       00000000      OFST:	set	0
 601                     ; 86   assert_param(IS_ADC2_CONVERSIONMODE_OK(ADC2_ConversionMode));
 603                     ; 87   assert_param(IS_ADC2_CHANNEL_OK(ADC2_Channel));
 605                     ; 88   assert_param(IS_ADC2_PRESSEL_OK(ADC2_PrescalerSelection));
 607                     ; 89   assert_param(IS_ADC2_EXTTRIG_OK(ADC2_ExtTrigger));
 609                     ; 90   assert_param(IS_FUNCTIONALSTATE_OK(((ADC2_ExtTriggerState))));
 611                     ; 91   assert_param(IS_ADC2_ALIGN_OK(ADC2_Align));
 613                     ; 92   assert_param(IS_ADC2_SCHMITTTRIG_OK(ADC2_SchmittTriggerChannel));
 615                     ; 93   assert_param(IS_FUNCTIONALSTATE_OK(ADC2_SchmittTriggerState));
 617                     ; 98   ADC2_ConversionConfig(ADC2_ConversionMode, ADC2_Channel, ADC2_Align);
 619  0016 7b08          	ld	a,(OFST+8,sp)
 620  0018 88            	push	a
 621  0019 9f            	ld	a,xl
 622  001a 97            	ld	xl,a
 623  001b 7b02          	ld	a,(OFST+2,sp)
 624  001d 95            	ld	xh,a
 625  001e cd00fa        	call	_ADC2_ConversionConfig
 627  0021 84            	pop	a
 628                     ; 100   ADC2_PrescalerConfig(ADC2_PrescalerSelection);
 630  0022 7b05          	ld	a,(OFST+5,sp)
 631  0024 ad33          	call	_ADC2_PrescalerConfig
 633                     ; 105   ADC2_ExternalTriggerConfig(ADC2_ExtTrigger, ADC2_ExtTriggerState);
 635  0026 7b07          	ld	a,(OFST+7,sp)
 636  0028 97            	ld	xl,a
 637  0029 7b06          	ld	a,(OFST+6,sp)
 638  002b 95            	ld	xh,a
 639  002c cd0128        	call	_ADC2_ExternalTriggerConfig
 641                     ; 110   ADC2_SchmittTriggerConfig(ADC2_SchmittTriggerChannel, ADC2_SchmittTriggerState);
 643  002f 7b0a          	ld	a,(OFST+10,sp)
 644  0031 97            	ld	xl,a
 645  0032 7b09          	ld	a,(OFST+9,sp)
 646  0034 95            	ld	xh,a
 647  0035 ad35          	call	_ADC2_SchmittTriggerConfig
 649                     ; 113   ADC2->CR1 |= ADC2_CR1_ADON;
 651  0037 72105401      	bset	21505,#0
 652                     ; 114 }
 655  003b 85            	popw	x
 656  003c 81            	ret
 691                     ; 121 void ADC2_Cmd(FunctionalState NewState)
 691                     ; 122 {
 692                     	switch	.text
 693  003d               _ADC2_Cmd:
 697                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 699                     ; 126   if (NewState != DISABLE)
 701  003d 4d            	tnz	a
 702  003e 2706          	jreq	L703
 703                     ; 128     ADC2->CR1 |= ADC2_CR1_ADON;
 705  0040 72105401      	bset	21505,#0
 707  0044 2004          	jra	L113
 708  0046               L703:
 709                     ; 132     ADC2->CR1 &= (uint8_t)(~ADC2_CR1_ADON);
 711  0046 72115401      	bres	21505,#0
 712  004a               L113:
 713                     ; 134 }
 716  004a 81            	ret
 751                     ; 141 void ADC2_ITConfig(FunctionalState NewState)
 751                     ; 142 {
 752                     	switch	.text
 753  004b               _ADC2_ITConfig:
 757                     ; 144   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 759                     ; 146   if (NewState != DISABLE)
 761  004b 4d            	tnz	a
 762  004c 2706          	jreq	L133
 763                     ; 149     ADC2->CSR |= (uint8_t)ADC2_CSR_EOCIE;
 765  004e 721a5400      	bset	21504,#5
 767  0052 2004          	jra	L333
 768  0054               L133:
 769                     ; 154     ADC2->CSR &= (uint8_t)(~ADC2_CSR_EOCIE);
 771  0054 721b5400      	bres	21504,#5
 772  0058               L333:
 773                     ; 156 }
 776  0058 81            	ret
 812                     ; 164 void ADC2_PrescalerConfig(ADC2_PresSel_TypeDef ADC2_Prescaler)
 812                     ; 165 {
 813                     	switch	.text
 814  0059               _ADC2_PrescalerConfig:
 816  0059 88            	push	a
 817       00000000      OFST:	set	0
 820                     ; 167   assert_param(IS_ADC2_PRESSEL_OK(ADC2_Prescaler));
 822                     ; 170   ADC2->CR1 &= (uint8_t)(~ADC2_CR1_SPSEL);
 824  005a c65401        	ld	a,21505
 825  005d a48f          	and	a,#143
 826  005f c75401        	ld	21505,a
 827                     ; 172   ADC2->CR1 |= (uint8_t)(ADC2_Prescaler);
 829  0062 c65401        	ld	a,21505
 830  0065 1a01          	or	a,(OFST+1,sp)
 831  0067 c75401        	ld	21505,a
 832                     ; 173 }
 835  006a 84            	pop	a
 836  006b 81            	ret
 883                     ; 183 void ADC2_SchmittTriggerConfig(ADC2_SchmittTrigg_TypeDef ADC2_SchmittTriggerChannel, FunctionalState NewState)
 883                     ; 184 {
 884                     	switch	.text
 885  006c               _ADC2_SchmittTriggerConfig:
 887  006c 89            	pushw	x
 888       00000000      OFST:	set	0
 891                     ; 186   assert_param(IS_ADC2_SCHMITTTRIG_OK(ADC2_SchmittTriggerChannel));
 893                     ; 187   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 895                     ; 189   if (ADC2_SchmittTriggerChannel == ADC2_SCHMITTTRIG_ALL)
 897  006d 9e            	ld	a,xh
 898  006e a11f          	cp	a,#31
 899  0070 2620          	jrne	L573
 900                     ; 191     if (NewState != DISABLE)
 902  0072 9f            	ld	a,xl
 903  0073 4d            	tnz	a
 904  0074 270a          	jreq	L773
 905                     ; 193       ADC2->TDRL &= (uint8_t)0x0;
 907  0076 725f5407      	clr	21511
 908                     ; 194       ADC2->TDRH &= (uint8_t)0x0;
 910  007a 725f5406      	clr	21510
 912  007e 2078          	jra	L304
 913  0080               L773:
 914                     ; 198       ADC2->TDRL |= (uint8_t)0xFF;
 916  0080 c65407        	ld	a,21511
 917  0083 aaff          	or	a,#255
 918  0085 c75407        	ld	21511,a
 919                     ; 199       ADC2->TDRH |= (uint8_t)0xFF;
 921  0088 c65406        	ld	a,21510
 922  008b aaff          	or	a,#255
 923  008d c75406        	ld	21510,a
 924  0090 2066          	jra	L304
 925  0092               L573:
 926                     ; 202   else if (ADC2_SchmittTriggerChannel < ADC2_SCHMITTTRIG_CHANNEL8)
 928  0092 7b01          	ld	a,(OFST+1,sp)
 929  0094 a108          	cp	a,#8
 930  0096 242f          	jruge	L504
 931                     ; 204     if (NewState != DISABLE)
 933  0098 0d02          	tnz	(OFST+2,sp)
 934  009a 2716          	jreq	L704
 935                     ; 206       ADC2->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC2_SchmittTriggerChannel));
 937  009c 7b01          	ld	a,(OFST+1,sp)
 938  009e 5f            	clrw	x
 939  009f 97            	ld	xl,a
 940  00a0 a601          	ld	a,#1
 941  00a2 5d            	tnzw	x
 942  00a3 2704          	jreq	L02
 943  00a5               L22:
 944  00a5 48            	sll	a
 945  00a6 5a            	decw	x
 946  00a7 26fc          	jrne	L22
 947  00a9               L02:
 948  00a9 43            	cpl	a
 949  00aa c45407        	and	a,21511
 950  00ad c75407        	ld	21511,a
 952  00b0 2046          	jra	L304
 953  00b2               L704:
 954                     ; 210       ADC2->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC2_SchmittTriggerChannel);
 956  00b2 7b01          	ld	a,(OFST+1,sp)
 957  00b4 5f            	clrw	x
 958  00b5 97            	ld	xl,a
 959  00b6 a601          	ld	a,#1
 960  00b8 5d            	tnzw	x
 961  00b9 2704          	jreq	L42
 962  00bb               L62:
 963  00bb 48            	sll	a
 964  00bc 5a            	decw	x
 965  00bd 26fc          	jrne	L62
 966  00bf               L42:
 967  00bf ca5407        	or	a,21511
 968  00c2 c75407        	ld	21511,a
 969  00c5 2031          	jra	L304
 970  00c7               L504:
 971                     ; 215     if (NewState != DISABLE)
 973  00c7 0d02          	tnz	(OFST+2,sp)
 974  00c9 2718          	jreq	L514
 975                     ; 217       ADC2->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC2_SchmittTriggerChannel - (uint8_t)8)));
 977  00cb 7b01          	ld	a,(OFST+1,sp)
 978  00cd a008          	sub	a,#8
 979  00cf 5f            	clrw	x
 980  00d0 97            	ld	xl,a
 981  00d1 a601          	ld	a,#1
 982  00d3 5d            	tnzw	x
 983  00d4 2704          	jreq	L03
 984  00d6               L23:
 985  00d6 48            	sll	a
 986  00d7 5a            	decw	x
 987  00d8 26fc          	jrne	L23
 988  00da               L03:
 989  00da 43            	cpl	a
 990  00db c45406        	and	a,21510
 991  00de c75406        	ld	21510,a
 993  00e1 2015          	jra	L304
 994  00e3               L514:
 995                     ; 221       ADC2->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC2_SchmittTriggerChannel - (uint8_t)8));
 997  00e3 7b01          	ld	a,(OFST+1,sp)
 998  00e5 a008          	sub	a,#8
 999  00e7 5f            	clrw	x
1000  00e8 97            	ld	xl,a
1001  00e9 a601          	ld	a,#1
1002  00eb 5d            	tnzw	x
1003  00ec 2704          	jreq	L43
1004  00ee               L63:
1005  00ee 48            	sll	a
1006  00ef 5a            	decw	x
1007  00f0 26fc          	jrne	L63
1008  00f2               L43:
1009  00f2 ca5406        	or	a,21510
1010  00f5 c75406        	ld	21510,a
1011  00f8               L304:
1012                     ; 224 }
1015  00f8 85            	popw	x
1016  00f9 81            	ret
1073                     ; 236 void ADC2_ConversionConfig(ADC2_ConvMode_TypeDef ADC2_ConversionMode, ADC2_Channel_TypeDef ADC2_Channel, ADC2_Align_TypeDef ADC2_Align)
1073                     ; 237 {
1074                     	switch	.text
1075  00fa               _ADC2_ConversionConfig:
1077  00fa 89            	pushw	x
1078       00000000      OFST:	set	0
1081                     ; 239   assert_param(IS_ADC2_CONVERSIONMODE_OK(ADC2_ConversionMode));
1083                     ; 240   assert_param(IS_ADC2_CHANNEL_OK(ADC2_Channel));
1085                     ; 241   assert_param(IS_ADC2_ALIGN_OK(ADC2_Align));
1087                     ; 244   ADC2->CR2 &= (uint8_t)(~ADC2_CR2_ALIGN);
1089  00fb 72175402      	bres	21506,#3
1090                     ; 246   ADC2->CR2 |= (uint8_t)(ADC2_Align);
1092  00ff c65402        	ld	a,21506
1093  0102 1a05          	or	a,(OFST+5,sp)
1094  0104 c75402        	ld	21506,a
1095                     ; 248   if (ADC2_ConversionMode == ADC2_CONVERSIONMODE_CONTINUOUS)
1097  0107 9e            	ld	a,xh
1098  0108 a101          	cp	a,#1
1099  010a 2606          	jrne	L744
1100                     ; 251     ADC2->CR1 |= ADC2_CR1_CONT;
1102  010c 72125401      	bset	21505,#1
1104  0110 2004          	jra	L154
1105  0112               L744:
1106                     ; 256     ADC2->CR1 &= (uint8_t)(~ADC2_CR1_CONT);
1108  0112 72135401      	bres	21505,#1
1109  0116               L154:
1110                     ; 260   ADC2->CSR &= (uint8_t)(~ADC2_CSR_CH);
1112  0116 c65400        	ld	a,21504
1113  0119 a4f0          	and	a,#240
1114  011b c75400        	ld	21504,a
1115                     ; 262   ADC2->CSR |= (uint8_t)(ADC2_Channel);
1117  011e c65400        	ld	a,21504
1118  0121 1a02          	or	a,(OFST+2,sp)
1119  0123 c75400        	ld	21504,a
1120                     ; 263 }
1123  0126 85            	popw	x
1124  0127 81            	ret
1170                     ; 275 void ADC2_ExternalTriggerConfig(ADC2_ExtTrig_TypeDef ADC2_ExtTrigger, FunctionalState NewState)
1170                     ; 276 {
1171                     	switch	.text
1172  0128               _ADC2_ExternalTriggerConfig:
1174  0128 89            	pushw	x
1175       00000000      OFST:	set	0
1178                     ; 278   assert_param(IS_ADC2_EXTTRIG_OK(ADC2_ExtTrigger));
1180                     ; 279   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1182                     ; 282   ADC2->CR2 &= (uint8_t)(~ADC2_CR2_EXTSEL);
1184  0129 c65402        	ld	a,21506
1185  012c a4cf          	and	a,#207
1186  012e c75402        	ld	21506,a
1187                     ; 284   if (NewState != DISABLE)
1189  0131 9f            	ld	a,xl
1190  0132 4d            	tnz	a
1191  0133 2706          	jreq	L574
1192                     ; 287     ADC2->CR2 |= (uint8_t)(ADC2_CR2_EXTTRIG);
1194  0135 721c5402      	bset	21506,#6
1196  0139 2004          	jra	L774
1197  013b               L574:
1198                     ; 292     ADC2->CR2 &= (uint8_t)(~ADC2_CR2_EXTTRIG);
1200  013b 721d5402      	bres	21506,#6
1201  013f               L774:
1202                     ; 296   ADC2->CR2 |= (uint8_t)(ADC2_ExtTrigger);
1204  013f c65402        	ld	a,21506
1205  0142 1a01          	or	a,(OFST+1,sp)
1206  0144 c75402        	ld	21506,a
1207                     ; 297 }
1210  0147 85            	popw	x
1211  0148 81            	ret
1235                     ; 308 void ADC2_StartConversion(void)
1235                     ; 309 {
1236                     	switch	.text
1237  0149               _ADC2_StartConversion:
1241                     ; 310   ADC2->CR1 |= ADC2_CR1_ADON;
1243  0149 72105401      	bset	21505,#0
1244                     ; 311 }
1247  014d 81            	ret
1291                     ; 320 uint16_t ADC2_GetConversionValue(void)
1291                     ; 321 {
1292                     	switch	.text
1293  014e               _ADC2_GetConversionValue:
1295  014e 5205          	subw	sp,#5
1296       00000005      OFST:	set	5
1299                     ; 322   uint16_t temph = 0;
1301                     ; 323   uint8_t templ = 0;
1303                     ; 325   if ((ADC2->CR2 & ADC2_CR2_ALIGN) != 0) /* Right alignment */
1305  0150 c65402        	ld	a,21506
1306  0153 a508          	bcp	a,#8
1307  0155 2715          	jreq	L335
1308                     ; 328     templ = ADC2->DRL;
1310  0157 c65405        	ld	a,21509
1311  015a 6b03          	ld	(OFST-2,sp),a
1313                     ; 330     temph = ADC2->DRH;
1315  015c c65404        	ld	a,21508
1316  015f 5f            	clrw	x
1317  0160 97            	ld	xl,a
1318  0161 1f04          	ldw	(OFST-1,sp),x
1320                     ; 332     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1322  0163 1e04          	ldw	x,(OFST-1,sp)
1323  0165 7b03          	ld	a,(OFST-2,sp)
1324  0167 02            	rlwa	x,a
1325  0168 1f04          	ldw	(OFST-1,sp),x
1328  016a 2021          	jra	L535
1329  016c               L335:
1330                     ; 337     temph = ADC2->DRH;
1332  016c c65404        	ld	a,21508
1333  016f 5f            	clrw	x
1334  0170 97            	ld	xl,a
1335  0171 1f04          	ldw	(OFST-1,sp),x
1337                     ; 339     templ = ADC2->DRL;
1339  0173 c65405        	ld	a,21509
1340  0176 6b03          	ld	(OFST-2,sp),a
1342                     ; 341     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1344  0178 1e04          	ldw	x,(OFST-1,sp)
1345  017a 4f            	clr	a
1346  017b 02            	rlwa	x,a
1347  017c 1f01          	ldw	(OFST-4,sp),x
1349  017e 7b03          	ld	a,(OFST-2,sp)
1350  0180 97            	ld	xl,a
1351  0181 a640          	ld	a,#64
1352  0183 42            	mul	x,a
1353  0184 01            	rrwa	x,a
1354  0185 1a02          	or	a,(OFST-3,sp)
1355  0187 01            	rrwa	x,a
1356  0188 1a01          	or	a,(OFST-4,sp)
1357  018a 01            	rrwa	x,a
1358  018b 1f04          	ldw	(OFST-1,sp),x
1360  018d               L535:
1361                     ; 344   return ((uint16_t)temph);
1363  018d 1e04          	ldw	x,(OFST-1,sp)
1366  018f 5b05          	addw	sp,#5
1367  0191 81            	ret
1411                     ; 352 FlagStatus ADC2_GetFlagStatus(void)
1411                     ; 353 {
1412                     	switch	.text
1413  0192               _ADC2_GetFlagStatus:
1417                     ; 355   return (FlagStatus)(ADC2->CSR & ADC2_CSR_EOC);
1419  0192 c65400        	ld	a,21504
1420  0195 a480          	and	a,#128
1423  0197 81            	ret
1446                     ; 363 void ADC2_ClearFlag(void)
1446                     ; 364 {
1447                     	switch	.text
1448  0198               _ADC2_ClearFlag:
1452                     ; 365   ADC2->CSR &= (uint8_t)(~ADC2_CSR_EOC);
1454  0198 721f5400      	bres	21504,#7
1455                     ; 366 }
1458  019c 81            	ret
1482                     ; 374 ITStatus ADC2_GetITStatus(void)
1482                     ; 375 {
1483                     	switch	.text
1484  019d               _ADC2_GetITStatus:
1488                     ; 376   return (ITStatus)(ADC2->CSR & ADC2_CSR_EOC);
1490  019d c65400        	ld	a,21504
1491  01a0 a480          	and	a,#128
1494  01a2 81            	ret
1518                     ; 384 void ADC2_ClearITPendingBit(void)
1518                     ; 385 {
1519                     	switch	.text
1520  01a3               _ADC2_ClearITPendingBit:
1524                     ; 386   ADC2->CSR &= (uint8_t)(~ADC2_CSR_EOC);
1526  01a3 721f5400      	bres	21504,#7
1527                     ; 387 }
1530  01a7 81            	ret
1543                     	xdef	_ADC2_ClearITPendingBit
1544                     	xdef	_ADC2_GetITStatus
1545                     	xdef	_ADC2_ClearFlag
1546                     	xdef	_ADC2_GetFlagStatus
1547                     	xdef	_ADC2_GetConversionValue
1548                     	xdef	_ADC2_StartConversion
1549                     	xdef	_ADC2_ExternalTriggerConfig
1550                     	xdef	_ADC2_ConversionConfig
1551                     	xdef	_ADC2_SchmittTriggerConfig
1552                     	xdef	_ADC2_PrescalerConfig
1553                     	xdef	_ADC2_ITConfig
1554                     	xdef	_ADC2_Cmd
1555                     	xdef	_ADC2_Init
1556                     	xdef	_ADC2_DeInit
1575                     	end
