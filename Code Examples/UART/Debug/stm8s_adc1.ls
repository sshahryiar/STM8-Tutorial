   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  43                     ; 52 void ADC1_DeInit(void)
  43                     ; 53 {
  45                     	switch	.text
  46  0000               _ADC1_DeInit:
  50                     ; 54   ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  52  0000 725f5400      	clr	21504
  53                     ; 55   ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  55  0004 725f5401      	clr	21505
  56                     ; 56   ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  58  0008 725f5402      	clr	21506
  59                     ; 57   ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  61  000c 725f5403      	clr	21507
  62                     ; 58   ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  64  0010 725f5406      	clr	21510
  65                     ; 59   ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  67  0014 725f5407      	clr	21511
  68                     ; 60   ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  70  0018 35ff5408      	mov	21512,#255
  71                     ; 61   ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  73  001c 35035409      	mov	21513,#3
  74                     ; 62   ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  76  0020 725f540a      	clr	21514
  77                     ; 63   ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  79  0024 725f540b      	clr	21515
  80                     ; 64   ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  82  0028 725f540e      	clr	21518
  83                     ; 65   ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  85  002c 725f540f      	clr	21519
  86                     ; 66 }
  89  0030 81            	ret
 540                     ; 88 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 540                     ; 89 {
 541                     	switch	.text
 542  0031               _ADC1_Init:
 544  0031 89            	pushw	x
 545       00000000      OFST:	set	0
 548                     ; 91   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 550                     ; 92   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 552                     ; 93   assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 554                     ; 94   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 556                     ; 95   assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 558                     ; 96   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 560                     ; 97   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 562                     ; 98   assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 564                     ; 103   ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 566  0032 7b08          	ld	a,(OFST+8,sp)
 567  0034 88            	push	a
 568  0035 9f            	ld	a,xl
 569  0036 97            	ld	xl,a
 570  0037 7b02          	ld	a,(OFST+2,sp)
 571  0039 95            	ld	xh,a
 572  003a cd013d        	call	_ADC1_ConversionConfig
 574  003d 84            	pop	a
 575                     ; 105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 577  003e 7b05          	ld	a,(OFST+5,sp)
 578  0040 ad5a          	call	_ADC1_PrescalerConfig
 580                     ; 110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 582  0042 7b07          	ld	a,(OFST+7,sp)
 583  0044 97            	ld	xl,a
 584  0045 7b06          	ld	a,(OFST+6,sp)
 585  0047 95            	ld	xh,a
 586  0048 cd016b        	call	_ADC1_ExternalTriggerConfig
 588                     ; 115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 590  004b 7b0a          	ld	a,(OFST+10,sp)
 591  004d 97            	ld	xl,a
 592  004e 7b09          	ld	a,(OFST+9,sp)
 593  0050 95            	ld	xh,a
 594  0051 ad5c          	call	_ADC1_SchmittTriggerConfig
 596                     ; 118   ADC1->CR1 |= ADC1_CR1_ADON;
 598  0053 72105401      	bset	21505,#0
 599                     ; 119 }
 602  0057 85            	popw	x
 603  0058 81            	ret
 638                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 638                     ; 127 {
 639                     	switch	.text
 640  0059               _ADC1_Cmd:
 644                     ; 129   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 646                     ; 131   if (NewState != DISABLE)
 648  0059 4d            	tnz	a
 649  005a 2706          	jreq	L362
 650                     ; 133     ADC1->CR1 |= ADC1_CR1_ADON;
 652  005c 72105401      	bset	21505,#0
 654  0060 2004          	jra	L562
 655  0062               L362:
 656                     ; 137     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 658  0062 72115401      	bres	21505,#0
 659  0066               L562:
 660                     ; 139 }
 663  0066 81            	ret
 698                     ; 146 void ADC1_ScanModeCmd(FunctionalState NewState)
 698                     ; 147 {
 699                     	switch	.text
 700  0067               _ADC1_ScanModeCmd:
 704                     ; 149   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 706                     ; 151   if (NewState != DISABLE)
 708  0067 4d            	tnz	a
 709  0068 2706          	jreq	L503
 710                     ; 153     ADC1->CR2 |= ADC1_CR2_SCAN;
 712  006a 72125402      	bset	21506,#1
 714  006e 2004          	jra	L703
 715  0070               L503:
 716                     ; 157     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 718  0070 72135402      	bres	21506,#1
 719  0074               L703:
 720                     ; 159 }
 723  0074 81            	ret
 758                     ; 166 void ADC1_DataBufferCmd(FunctionalState NewState)
 758                     ; 167 {
 759                     	switch	.text
 760  0075               _ADC1_DataBufferCmd:
 764                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 766                     ; 171   if (NewState != DISABLE)
 768  0075 4d            	tnz	a
 769  0076 2706          	jreq	L723
 770                     ; 173     ADC1->CR3 |= ADC1_CR3_DBUF;
 772  0078 721e5403      	bset	21507,#7
 774  007c 2004          	jra	L133
 775  007e               L723:
 776                     ; 177     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 778  007e 721f5403      	bres	21507,#7
 779  0082               L133:
 780                     ; 179 }
 783  0082 81            	ret
 939                     ; 190 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 939                     ; 191 {
 940                     	switch	.text
 941  0083               _ADC1_ITConfig:
 943  0083 89            	pushw	x
 944       00000000      OFST:	set	0
 947                     ; 193   assert_param(IS_ADC1_IT_OK(ADC1_IT));
 949                     ; 194   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 951                     ; 196   if (NewState != DISABLE)
 953  0084 0d05          	tnz	(OFST+5,sp)
 954  0086 2709          	jreq	L714
 955                     ; 199     ADC1->CSR |= (uint8_t)ADC1_IT;
 957  0088 9f            	ld	a,xl
 958  0089 ca5400        	or	a,21504
 959  008c c75400        	ld	21504,a
 961  008f 2009          	jra	L124
 962  0091               L714:
 963                     ; 204     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
 965  0091 7b02          	ld	a,(OFST+2,sp)
 966  0093 43            	cpl	a
 967  0094 c45400        	and	a,21504
 968  0097 c75400        	ld	21504,a
 969  009a               L124:
 970                     ; 206 }
 973  009a 85            	popw	x
 974  009b 81            	ret
1010                     ; 214 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1010                     ; 215 {
1011                     	switch	.text
1012  009c               _ADC1_PrescalerConfig:
1014  009c 88            	push	a
1015       00000000      OFST:	set	0
1018                     ; 217   assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1020                     ; 220   ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1022  009d c65401        	ld	a,21505
1023  00a0 a48f          	and	a,#143
1024  00a2 c75401        	ld	21505,a
1025                     ; 222   ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1027  00a5 c65401        	ld	a,21505
1028  00a8 1a01          	or	a,(OFST+1,sp)
1029  00aa c75401        	ld	21505,a
1030                     ; 223 }
1033  00ad 84            	pop	a
1034  00ae 81            	ret
1081                     ; 233 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1081                     ; 234 {
1082                     	switch	.text
1083  00af               _ADC1_SchmittTriggerConfig:
1085  00af 89            	pushw	x
1086       00000000      OFST:	set	0
1089                     ; 236   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1091                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1093                     ; 239   if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1095  00b0 9e            	ld	a,xh
1096  00b1 a1ff          	cp	a,#255
1097  00b3 2620          	jrne	L364
1098                     ; 241     if (NewState != DISABLE)
1100  00b5 9f            	ld	a,xl
1101  00b6 4d            	tnz	a
1102  00b7 270a          	jreq	L564
1103                     ; 243       ADC1->TDRL &= (uint8_t)0x0;
1105  00b9 725f5407      	clr	21511
1106                     ; 244       ADC1->TDRH &= (uint8_t)0x0;
1108  00bd 725f5406      	clr	21510
1110  00c1 2078          	jra	L174
1111  00c3               L564:
1112                     ; 248       ADC1->TDRL |= (uint8_t)0xFF;
1114  00c3 c65407        	ld	a,21511
1115  00c6 aaff          	or	a,#255
1116  00c8 c75407        	ld	21511,a
1117                     ; 249       ADC1->TDRH |= (uint8_t)0xFF;
1119  00cb c65406        	ld	a,21510
1120  00ce aaff          	or	a,#255
1121  00d0 c75406        	ld	21510,a
1122  00d3 2066          	jra	L174
1123  00d5               L364:
1124                     ; 252   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1126  00d5 7b01          	ld	a,(OFST+1,sp)
1127  00d7 a108          	cp	a,#8
1128  00d9 242f          	jruge	L374
1129                     ; 254     if (NewState != DISABLE)
1131  00db 0d02          	tnz	(OFST+2,sp)
1132  00dd 2716          	jreq	L574
1133                     ; 256       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1135  00df 7b01          	ld	a,(OFST+1,sp)
1136  00e1 5f            	clrw	x
1137  00e2 97            	ld	xl,a
1138  00e3 a601          	ld	a,#1
1139  00e5 5d            	tnzw	x
1140  00e6 2704          	jreq	L42
1141  00e8               L62:
1142  00e8 48            	sll	a
1143  00e9 5a            	decw	x
1144  00ea 26fc          	jrne	L62
1145  00ec               L42:
1146  00ec 43            	cpl	a
1147  00ed c45407        	and	a,21511
1148  00f0 c75407        	ld	21511,a
1150  00f3 2046          	jra	L174
1151  00f5               L574:
1152                     ; 260       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1154  00f5 7b01          	ld	a,(OFST+1,sp)
1155  00f7 5f            	clrw	x
1156  00f8 97            	ld	xl,a
1157  00f9 a601          	ld	a,#1
1158  00fb 5d            	tnzw	x
1159  00fc 2704          	jreq	L03
1160  00fe               L23:
1161  00fe 48            	sll	a
1162  00ff 5a            	decw	x
1163  0100 26fc          	jrne	L23
1164  0102               L03:
1165  0102 ca5407        	or	a,21511
1166  0105 c75407        	ld	21511,a
1167  0108 2031          	jra	L174
1168  010a               L374:
1169                     ; 265     if (NewState != DISABLE)
1171  010a 0d02          	tnz	(OFST+2,sp)
1172  010c 2718          	jreq	L305
1173                     ; 267       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1175  010e 7b01          	ld	a,(OFST+1,sp)
1176  0110 a008          	sub	a,#8
1177  0112 5f            	clrw	x
1178  0113 97            	ld	xl,a
1179  0114 a601          	ld	a,#1
1180  0116 5d            	tnzw	x
1181  0117 2704          	jreq	L43
1182  0119               L63:
1183  0119 48            	sll	a
1184  011a 5a            	decw	x
1185  011b 26fc          	jrne	L63
1186  011d               L43:
1187  011d 43            	cpl	a
1188  011e c45406        	and	a,21510
1189  0121 c75406        	ld	21510,a
1191  0124 2015          	jra	L174
1192  0126               L305:
1193                     ; 271       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1195  0126 7b01          	ld	a,(OFST+1,sp)
1196  0128 a008          	sub	a,#8
1197  012a 5f            	clrw	x
1198  012b 97            	ld	xl,a
1199  012c a601          	ld	a,#1
1200  012e 5d            	tnzw	x
1201  012f 2704          	jreq	L04
1202  0131               L24:
1203  0131 48            	sll	a
1204  0132 5a            	decw	x
1205  0133 26fc          	jrne	L24
1206  0135               L04:
1207  0135 ca5406        	or	a,21510
1208  0138 c75406        	ld	21510,a
1209  013b               L174:
1210                     ; 274 }
1213  013b 85            	popw	x
1214  013c 81            	ret
1271                     ; 286 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1271                     ; 287 {
1272                     	switch	.text
1273  013d               _ADC1_ConversionConfig:
1275  013d 89            	pushw	x
1276       00000000      OFST:	set	0
1279                     ; 289   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1281                     ; 290   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1283                     ; 291   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1285                     ; 294   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1287  013e 72175402      	bres	21506,#3
1288                     ; 296   ADC1->CR2 |= (uint8_t)(ADC1_Align);
1290  0142 c65402        	ld	a,21506
1291  0145 1a05          	or	a,(OFST+5,sp)
1292  0147 c75402        	ld	21506,a
1293                     ; 298   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1295  014a 9e            	ld	a,xh
1296  014b a101          	cp	a,#1
1297  014d 2606          	jrne	L535
1298                     ; 301     ADC1->CR1 |= ADC1_CR1_CONT;
1300  014f 72125401      	bset	21505,#1
1302  0153 2004          	jra	L735
1303  0155               L535:
1304                     ; 306     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1306  0155 72135401      	bres	21505,#1
1307  0159               L735:
1308                     ; 310   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1310  0159 c65400        	ld	a,21504
1311  015c a4f0          	and	a,#240
1312  015e c75400        	ld	21504,a
1313                     ; 312   ADC1->CSR |= (uint8_t)(ADC1_Channel);
1315  0161 c65400        	ld	a,21504
1316  0164 1a02          	or	a,(OFST+2,sp)
1317  0166 c75400        	ld	21504,a
1318                     ; 313 }
1321  0169 85            	popw	x
1322  016a 81            	ret
1368                     ; 325 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1368                     ; 326 {
1369                     	switch	.text
1370  016b               _ADC1_ExternalTriggerConfig:
1372  016b 89            	pushw	x
1373       00000000      OFST:	set	0
1376                     ; 328   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1378                     ; 329   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1380                     ; 332   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1382  016c c65402        	ld	a,21506
1383  016f a4cf          	and	a,#207
1384  0171 c75402        	ld	21506,a
1385                     ; 334   if (NewState != DISABLE)
1387  0174 9f            	ld	a,xl
1388  0175 4d            	tnz	a
1389  0176 2706          	jreq	L365
1390                     ; 337     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1392  0178 721c5402      	bset	21506,#6
1394  017c 2004          	jra	L565
1395  017e               L365:
1396                     ; 342     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1398  017e 721d5402      	bres	21506,#6
1399  0182               L565:
1400                     ; 346   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1402  0182 c65402        	ld	a,21506
1403  0185 1a01          	or	a,(OFST+1,sp)
1404  0187 c75402        	ld	21506,a
1405                     ; 347 }
1408  018a 85            	popw	x
1409  018b 81            	ret
1433                     ; 358 void ADC1_StartConversion(void)
1433                     ; 359 {
1434                     	switch	.text
1435  018c               _ADC1_StartConversion:
1439                     ; 360   ADC1->CR1 |= ADC1_CR1_ADON;
1441  018c 72105401      	bset	21505,#0
1442                     ; 361 }
1445  0190 81            	ret
1489                     ; 370 uint16_t ADC1_GetConversionValue(void)
1489                     ; 371 {
1490                     	switch	.text
1491  0191               _ADC1_GetConversionValue:
1493  0191 5205          	subw	sp,#5
1494       00000005      OFST:	set	5
1497                     ; 372   uint16_t temph = 0;
1499                     ; 373   uint8_t templ = 0;
1501                     ; 375   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1503  0193 c65402        	ld	a,21506
1504  0196 a508          	bcp	a,#8
1505  0198 2715          	jreq	L126
1506                     ; 378     templ = ADC1->DRL;
1508  019a c65405        	ld	a,21509
1509  019d 6b03          	ld	(OFST-2,sp),a
1511                     ; 380     temph = ADC1->DRH;
1513  019f c65404        	ld	a,21508
1514  01a2 5f            	clrw	x
1515  01a3 97            	ld	xl,a
1516  01a4 1f04          	ldw	(OFST-1,sp),x
1518                     ; 382     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1520  01a6 1e04          	ldw	x,(OFST-1,sp)
1521  01a8 7b03          	ld	a,(OFST-2,sp)
1522  01aa 02            	rlwa	x,a
1523  01ab 1f04          	ldw	(OFST-1,sp),x
1526  01ad 2021          	jra	L326
1527  01af               L126:
1528                     ; 387     temph = ADC1->DRH;
1530  01af c65404        	ld	a,21508
1531  01b2 5f            	clrw	x
1532  01b3 97            	ld	xl,a
1533  01b4 1f04          	ldw	(OFST-1,sp),x
1535                     ; 389     templ = ADC1->DRL;
1537  01b6 c65405        	ld	a,21509
1538  01b9 6b03          	ld	(OFST-2,sp),a
1540                     ; 391     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1542  01bb 1e04          	ldw	x,(OFST-1,sp)
1543  01bd 4f            	clr	a
1544  01be 02            	rlwa	x,a
1545  01bf 1f01          	ldw	(OFST-4,sp),x
1547  01c1 7b03          	ld	a,(OFST-2,sp)
1548  01c3 97            	ld	xl,a
1549  01c4 a640          	ld	a,#64
1550  01c6 42            	mul	x,a
1551  01c7 01            	rrwa	x,a
1552  01c8 1a02          	or	a,(OFST-3,sp)
1553  01ca 01            	rrwa	x,a
1554  01cb 1a01          	or	a,(OFST-4,sp)
1555  01cd 01            	rrwa	x,a
1556  01ce 1f04          	ldw	(OFST-1,sp),x
1558  01d0               L326:
1559                     ; 394   return ((uint16_t)temph);
1561  01d0 1e04          	ldw	x,(OFST-1,sp)
1564  01d2 5b05          	addw	sp,#5
1565  01d4 81            	ret
1611                     ; 405 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1611                     ; 406 {
1612                     	switch	.text
1613  01d5               _ADC1_AWDChannelConfig:
1615  01d5 89            	pushw	x
1616       00000000      OFST:	set	0
1619                     ; 408   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1621                     ; 409   assert_param(IS_ADC1_CHANNEL_OK(Channel));
1623                     ; 411   if (Channel < (uint8_t)8)
1625  01d6 9e            	ld	a,xh
1626  01d7 a108          	cp	a,#8
1627  01d9 242e          	jruge	L746
1628                     ; 413     if (NewState != DISABLE)
1630  01db 9f            	ld	a,xl
1631  01dc 4d            	tnz	a
1632  01dd 2714          	jreq	L156
1633                     ; 415       ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1635  01df 9e            	ld	a,xh
1636  01e0 5f            	clrw	x
1637  01e1 97            	ld	xl,a
1638  01e2 a601          	ld	a,#1
1639  01e4 5d            	tnzw	x
1640  01e5 2704          	jreq	L65
1641  01e7               L06:
1642  01e7 48            	sll	a
1643  01e8 5a            	decw	x
1644  01e9 26fc          	jrne	L06
1645  01eb               L65:
1646  01eb ca540f        	or	a,21519
1647  01ee c7540f        	ld	21519,a
1649  01f1 2047          	jra	L556
1650  01f3               L156:
1651                     ; 419       ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1653  01f3 7b01          	ld	a,(OFST+1,sp)
1654  01f5 5f            	clrw	x
1655  01f6 97            	ld	xl,a
1656  01f7 a601          	ld	a,#1
1657  01f9 5d            	tnzw	x
1658  01fa 2704          	jreq	L26
1659  01fc               L46:
1660  01fc 48            	sll	a
1661  01fd 5a            	decw	x
1662  01fe 26fc          	jrne	L46
1663  0200               L26:
1664  0200 43            	cpl	a
1665  0201 c4540f        	and	a,21519
1666  0204 c7540f        	ld	21519,a
1667  0207 2031          	jra	L556
1668  0209               L746:
1669                     ; 424     if (NewState != DISABLE)
1671  0209 0d02          	tnz	(OFST+2,sp)
1672  020b 2717          	jreq	L756
1673                     ; 426       ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1675  020d 7b01          	ld	a,(OFST+1,sp)
1676  020f a008          	sub	a,#8
1677  0211 5f            	clrw	x
1678  0212 97            	ld	xl,a
1679  0213 a601          	ld	a,#1
1680  0215 5d            	tnzw	x
1681  0216 2704          	jreq	L66
1682  0218               L07:
1683  0218 48            	sll	a
1684  0219 5a            	decw	x
1685  021a 26fc          	jrne	L07
1686  021c               L66:
1687  021c ca540e        	or	a,21518
1688  021f c7540e        	ld	21518,a
1690  0222 2016          	jra	L556
1691  0224               L756:
1692                     ; 430       ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1694  0224 7b01          	ld	a,(OFST+1,sp)
1695  0226 a008          	sub	a,#8
1696  0228 5f            	clrw	x
1697  0229 97            	ld	xl,a
1698  022a a601          	ld	a,#1
1699  022c 5d            	tnzw	x
1700  022d 2704          	jreq	L27
1701  022f               L47:
1702  022f 48            	sll	a
1703  0230 5a            	decw	x
1704  0231 26fc          	jrne	L47
1705  0233               L27:
1706  0233 43            	cpl	a
1707  0234 c4540e        	and	a,21518
1708  0237 c7540e        	ld	21518,a
1709  023a               L556:
1710                     ; 433 }
1713  023a 85            	popw	x
1714  023b 81            	ret
1749                     ; 441 void ADC1_SetHighThreshold(uint16_t Threshold)
1749                     ; 442 {
1750                     	switch	.text
1751  023c               _ADC1_SetHighThreshold:
1753  023c 89            	pushw	x
1754       00000000      OFST:	set	0
1757                     ; 443   ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
1759  023d 54            	srlw	x
1760  023e 54            	srlw	x
1761  023f 9f            	ld	a,xl
1762  0240 c75408        	ld	21512,a
1763                     ; 444   ADC1->HTRL = (uint8_t)Threshold;
1765  0243 7b02          	ld	a,(OFST+2,sp)
1766  0245 c75409        	ld	21513,a
1767                     ; 445 }
1770  0248 85            	popw	x
1771  0249 81            	ret
1806                     ; 453 void ADC1_SetLowThreshold(uint16_t Threshold)
1806                     ; 454 {
1807                     	switch	.text
1808  024a               _ADC1_SetLowThreshold:
1812                     ; 455   ADC1->LTRL = (uint8_t)Threshold;
1814  024a 9f            	ld	a,xl
1815  024b c7540b        	ld	21515,a
1816                     ; 456   ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
1818  024e 54            	srlw	x
1819  024f 54            	srlw	x
1820  0250 9f            	ld	a,xl
1821  0251 c7540a        	ld	21514,a
1822                     ; 457 }
1825  0254 81            	ret
1878                     ; 466 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
1878                     ; 467 {
1879                     	switch	.text
1880  0255               _ADC1_GetBufferValue:
1882  0255 88            	push	a
1883  0256 5205          	subw	sp,#5
1884       00000005      OFST:	set	5
1887                     ; 468   uint16_t temph = 0;
1889                     ; 469   uint8_t templ = 0;
1891                     ; 472   assert_param(IS_ADC1_BUFFER_OK(Buffer));
1893                     ; 474   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1895  0258 c65402        	ld	a,21506
1896  025b a508          	bcp	a,#8
1897  025d 271f          	jreq	L547
1898                     ; 477     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1900  025f 7b06          	ld	a,(OFST+1,sp)
1901  0261 48            	sll	a
1902  0262 5f            	clrw	x
1903  0263 97            	ld	xl,a
1904  0264 d653e1        	ld	a,(21473,x)
1905  0267 6b03          	ld	(OFST-2,sp),a
1907                     ; 479     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1909  0269 7b06          	ld	a,(OFST+1,sp)
1910  026b 48            	sll	a
1911  026c 5f            	clrw	x
1912  026d 97            	ld	xl,a
1913  026e d653e0        	ld	a,(21472,x)
1914  0271 5f            	clrw	x
1915  0272 97            	ld	xl,a
1916  0273 1f04          	ldw	(OFST-1,sp),x
1918                     ; 481     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1920  0275 1e04          	ldw	x,(OFST-1,sp)
1921  0277 7b03          	ld	a,(OFST-2,sp)
1922  0279 02            	rlwa	x,a
1923  027a 1f04          	ldw	(OFST-1,sp),x
1926  027c 202b          	jra	L747
1927  027e               L547:
1928                     ; 486     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1930  027e 7b06          	ld	a,(OFST+1,sp)
1931  0280 48            	sll	a
1932  0281 5f            	clrw	x
1933  0282 97            	ld	xl,a
1934  0283 d653e0        	ld	a,(21472,x)
1935  0286 5f            	clrw	x
1936  0287 97            	ld	xl,a
1937  0288 1f04          	ldw	(OFST-1,sp),x
1939                     ; 488     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1941  028a 7b06          	ld	a,(OFST+1,sp)
1942  028c 48            	sll	a
1943  028d 5f            	clrw	x
1944  028e 97            	ld	xl,a
1945  028f d653e1        	ld	a,(21473,x)
1946  0292 6b03          	ld	(OFST-2,sp),a
1948                     ; 490     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
1950  0294 1e04          	ldw	x,(OFST-1,sp)
1951  0296 4f            	clr	a
1952  0297 02            	rlwa	x,a
1953  0298 1f01          	ldw	(OFST-4,sp),x
1955  029a 7b03          	ld	a,(OFST-2,sp)
1956  029c 97            	ld	xl,a
1957  029d a640          	ld	a,#64
1958  029f 42            	mul	x,a
1959  02a0 01            	rrwa	x,a
1960  02a1 1a02          	or	a,(OFST-3,sp)
1961  02a3 01            	rrwa	x,a
1962  02a4 1a01          	or	a,(OFST-4,sp)
1963  02a6 01            	rrwa	x,a
1964  02a7 1f04          	ldw	(OFST-1,sp),x
1966  02a9               L747:
1967                     ; 493   return ((uint16_t)temph);
1969  02a9 1e04          	ldw	x,(OFST-1,sp)
1972  02ab 5b06          	addw	sp,#6
1973  02ad 81            	ret
2039                     ; 502 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
2039                     ; 503 {
2040                     	switch	.text
2041  02ae               _ADC1_GetAWDChannelStatus:
2043  02ae 88            	push	a
2044  02af 88            	push	a
2045       00000001      OFST:	set	1
2048                     ; 504   uint8_t status = 0;
2050                     ; 507   assert_param(IS_ADC1_CHANNEL_OK(Channel));
2052                     ; 509   if (Channel < (uint8_t)8)
2054  02b0 a108          	cp	a,#8
2055  02b2 2412          	jruge	L3001
2056                     ; 511     status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2058  02b4 5f            	clrw	x
2059  02b5 97            	ld	xl,a
2060  02b6 a601          	ld	a,#1
2061  02b8 5d            	tnzw	x
2062  02b9 2704          	jreq	L601
2063  02bb               L011:
2064  02bb 48            	sll	a
2065  02bc 5a            	decw	x
2066  02bd 26fc          	jrne	L011
2067  02bf               L601:
2068  02bf c4540d        	and	a,21517
2069  02c2 6b01          	ld	(OFST+0,sp),a
2072  02c4 2014          	jra	L5001
2073  02c6               L3001:
2074                     ; 515     status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2076  02c6 7b02          	ld	a,(OFST+1,sp)
2077  02c8 a008          	sub	a,#8
2078  02ca 5f            	clrw	x
2079  02cb 97            	ld	xl,a
2080  02cc a601          	ld	a,#1
2081  02ce 5d            	tnzw	x
2082  02cf 2704          	jreq	L211
2083  02d1               L411:
2084  02d1 48            	sll	a
2085  02d2 5a            	decw	x
2086  02d3 26fc          	jrne	L411
2087  02d5               L211:
2088  02d5 c4540c        	and	a,21516
2089  02d8 6b01          	ld	(OFST+0,sp),a
2091  02da               L5001:
2092                     ; 518   return ((FlagStatus)status);
2094  02da 7b01          	ld	a,(OFST+0,sp)
2097  02dc 85            	popw	x
2098  02dd 81            	ret
2256                     ; 527 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2256                     ; 528 {
2257                     	switch	.text
2258  02de               _ADC1_GetFlagStatus:
2260  02de 88            	push	a
2261  02df 88            	push	a
2262       00000001      OFST:	set	1
2265                     ; 529   uint8_t flagstatus = 0;
2267                     ; 530   uint8_t temp = 0;
2269                     ; 533   assert_param(IS_ADC1_FLAG_OK(Flag));
2271                     ; 535   if ((Flag & 0x0F) == 0x01)
2273  02e0 a40f          	and	a,#15
2274  02e2 a101          	cp	a,#1
2275  02e4 2609          	jrne	L5701
2276                     ; 538     flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2278  02e6 c65403        	ld	a,21507
2279  02e9 a440          	and	a,#64
2280  02eb 6b01          	ld	(OFST+0,sp),a
2283  02ed 2045          	jra	L7701
2284  02ef               L5701:
2285                     ; 540   else if ((Flag & 0xF0) == 0x10)
2287  02ef 7b02          	ld	a,(OFST+1,sp)
2288  02f1 a4f0          	and	a,#240
2289  02f3 a110          	cp	a,#16
2290  02f5 2636          	jrne	L1011
2291                     ; 543     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2293  02f7 7b02          	ld	a,(OFST+1,sp)
2294  02f9 a40f          	and	a,#15
2295  02fb 6b01          	ld	(OFST+0,sp),a
2297                     ; 544     if (temp < 8)
2299  02fd 7b01          	ld	a,(OFST+0,sp)
2300  02ff a108          	cp	a,#8
2301  0301 2414          	jruge	L3011
2302                     ; 546       flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2304  0303 7b01          	ld	a,(OFST+0,sp)
2305  0305 5f            	clrw	x
2306  0306 97            	ld	xl,a
2307  0307 a601          	ld	a,#1
2308  0309 5d            	tnzw	x
2309  030a 2704          	jreq	L021
2310  030c               L221:
2311  030c 48            	sll	a
2312  030d 5a            	decw	x
2313  030e 26fc          	jrne	L221
2314  0310               L021:
2315  0310 c4540d        	and	a,21517
2316  0313 6b01          	ld	(OFST+0,sp),a
2319  0315 201d          	jra	L7701
2320  0317               L3011:
2321                     ; 550       flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2323  0317 7b01          	ld	a,(OFST+0,sp)
2324  0319 a008          	sub	a,#8
2325  031b 5f            	clrw	x
2326  031c 97            	ld	xl,a
2327  031d a601          	ld	a,#1
2328  031f 5d            	tnzw	x
2329  0320 2704          	jreq	L421
2330  0322               L621:
2331  0322 48            	sll	a
2332  0323 5a            	decw	x
2333  0324 26fc          	jrne	L621
2334  0326               L421:
2335  0326 c4540c        	and	a,21516
2336  0329 6b01          	ld	(OFST+0,sp),a
2338  032b 2007          	jra	L7701
2339  032d               L1011:
2340                     ; 555     flagstatus = (uint8_t)(ADC1->CSR & Flag);
2342  032d c65400        	ld	a,21504
2343  0330 1402          	and	a,(OFST+1,sp)
2344  0332 6b01          	ld	(OFST+0,sp),a
2346  0334               L7701:
2347                     ; 557   return ((FlagStatus)flagstatus);
2349  0334 7b01          	ld	a,(OFST+0,sp)
2352  0336 85            	popw	x
2353  0337 81            	ret
2397                     ; 567 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2397                     ; 568 {
2398                     	switch	.text
2399  0338               _ADC1_ClearFlag:
2401  0338 88            	push	a
2402  0339 88            	push	a
2403       00000001      OFST:	set	1
2406                     ; 569   uint8_t temp = 0;
2408                     ; 572   assert_param(IS_ADC1_FLAG_OK(Flag));
2410                     ; 574   if ((Flag & 0x0F) == 0x01)
2412  033a a40f          	and	a,#15
2413  033c a101          	cp	a,#1
2414  033e 2606          	jrne	L3311
2415                     ; 577     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2417  0340 721d5403      	bres	21507,#6
2419  0344 204b          	jra	L5311
2420  0346               L3311:
2421                     ; 579   else if ((Flag & 0xF0) == 0x10)
2423  0346 7b02          	ld	a,(OFST+1,sp)
2424  0348 a4f0          	and	a,#240
2425  034a a110          	cp	a,#16
2426  034c 263a          	jrne	L7311
2427                     ; 582     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2429  034e 7b02          	ld	a,(OFST+1,sp)
2430  0350 a40f          	and	a,#15
2431  0352 6b01          	ld	(OFST+0,sp),a
2433                     ; 583     if (temp < 8)
2435  0354 7b01          	ld	a,(OFST+0,sp)
2436  0356 a108          	cp	a,#8
2437  0358 2416          	jruge	L1411
2438                     ; 585       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2440  035a 7b01          	ld	a,(OFST+0,sp)
2441  035c 5f            	clrw	x
2442  035d 97            	ld	xl,a
2443  035e a601          	ld	a,#1
2444  0360 5d            	tnzw	x
2445  0361 2704          	jreq	L231
2446  0363               L431:
2447  0363 48            	sll	a
2448  0364 5a            	decw	x
2449  0365 26fc          	jrne	L431
2450  0367               L231:
2451  0367 43            	cpl	a
2452  0368 c4540d        	and	a,21517
2453  036b c7540d        	ld	21517,a
2455  036e 2021          	jra	L5311
2456  0370               L1411:
2457                     ; 589       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2459  0370 7b01          	ld	a,(OFST+0,sp)
2460  0372 a008          	sub	a,#8
2461  0374 5f            	clrw	x
2462  0375 97            	ld	xl,a
2463  0376 a601          	ld	a,#1
2464  0378 5d            	tnzw	x
2465  0379 2704          	jreq	L631
2466  037b               L041:
2467  037b 48            	sll	a
2468  037c 5a            	decw	x
2469  037d 26fc          	jrne	L041
2470  037f               L631:
2471  037f 43            	cpl	a
2472  0380 c4540c        	and	a,21516
2473  0383 c7540c        	ld	21516,a
2474  0386 2009          	jra	L5311
2475  0388               L7311:
2476                     ; 594     ADC1->CSR &= (uint8_t) (~Flag);
2478  0388 7b02          	ld	a,(OFST+1,sp)
2479  038a 43            	cpl	a
2480  038b c45400        	and	a,21504
2481  038e c75400        	ld	21504,a
2482  0391               L5311:
2483                     ; 596 }
2486  0391 85            	popw	x
2487  0392 81            	ret
2542                     ; 616 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2542                     ; 617 {
2543                     	switch	.text
2544  0393               _ADC1_GetITStatus:
2546  0393 89            	pushw	x
2547  0394 88            	push	a
2548       00000001      OFST:	set	1
2551                     ; 618   ITStatus itstatus = RESET;
2553                     ; 619   uint8_t temp = 0;
2555                     ; 622   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2557                     ; 624   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2559  0395 01            	rrwa	x,a
2560  0396 a4f0          	and	a,#240
2561  0398 5f            	clrw	x
2562  0399 02            	rlwa	x,a
2563  039a a30010        	cpw	x,#16
2564  039d 2636          	jrne	L5711
2565                     ; 627     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2567  039f 7b03          	ld	a,(OFST+2,sp)
2568  03a1 a40f          	and	a,#15
2569  03a3 6b01          	ld	(OFST+0,sp),a
2571                     ; 628     if (temp < 8)
2573  03a5 7b01          	ld	a,(OFST+0,sp)
2574  03a7 a108          	cp	a,#8
2575  03a9 2414          	jruge	L7711
2576                     ; 630       itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2578  03ab 7b01          	ld	a,(OFST+0,sp)
2579  03ad 5f            	clrw	x
2580  03ae 97            	ld	xl,a
2581  03af a601          	ld	a,#1
2582  03b1 5d            	tnzw	x
2583  03b2 2704          	jreq	L441
2584  03b4               L641:
2585  03b4 48            	sll	a
2586  03b5 5a            	decw	x
2587  03b6 26fc          	jrne	L641
2588  03b8               L441:
2589  03b8 c4540d        	and	a,21517
2590  03bb 6b01          	ld	(OFST+0,sp),a
2593  03bd 201d          	jra	L3021
2594  03bf               L7711:
2595                     ; 634       itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2597  03bf 7b01          	ld	a,(OFST+0,sp)
2598  03c1 a008          	sub	a,#8
2599  03c3 5f            	clrw	x
2600  03c4 97            	ld	xl,a
2601  03c5 a601          	ld	a,#1
2602  03c7 5d            	tnzw	x
2603  03c8 2704          	jreq	L051
2604  03ca               L251:
2605  03ca 48            	sll	a
2606  03cb 5a            	decw	x
2607  03cc 26fc          	jrne	L251
2608  03ce               L051:
2609  03ce c4540c        	and	a,21516
2610  03d1 6b01          	ld	(OFST+0,sp),a
2612  03d3 2007          	jra	L3021
2613  03d5               L5711:
2614                     ; 639     itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
2616  03d5 c65400        	ld	a,21504
2617  03d8 1403          	and	a,(OFST+2,sp)
2618  03da 6b01          	ld	(OFST+0,sp),a
2620  03dc               L3021:
2621                     ; 641   return ((ITStatus)itstatus);
2623  03dc 7b01          	ld	a,(OFST+0,sp)
2626  03de 5b03          	addw	sp,#3
2627  03e0 81            	ret
2672                     ; 662 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2672                     ; 663 {
2673                     	switch	.text
2674  03e1               _ADC1_ClearITPendingBit:
2676  03e1 89            	pushw	x
2677  03e2 88            	push	a
2678       00000001      OFST:	set	1
2681                     ; 664   uint8_t temp = 0;
2683                     ; 667   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2685                     ; 669   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2687  03e3 01            	rrwa	x,a
2688  03e4 a4f0          	and	a,#240
2689  03e6 5f            	clrw	x
2690  03e7 02            	rlwa	x,a
2691  03e8 a30010        	cpw	x,#16
2692  03eb 263a          	jrne	L7221
2693                     ; 672     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2695  03ed 7b03          	ld	a,(OFST+2,sp)
2696  03ef a40f          	and	a,#15
2697  03f1 6b01          	ld	(OFST+0,sp),a
2699                     ; 673     if (temp < 8)
2701  03f3 7b01          	ld	a,(OFST+0,sp)
2702  03f5 a108          	cp	a,#8
2703  03f7 2416          	jruge	L1321
2704                     ; 675       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2706  03f9 7b01          	ld	a,(OFST+0,sp)
2707  03fb 5f            	clrw	x
2708  03fc 97            	ld	xl,a
2709  03fd a601          	ld	a,#1
2710  03ff 5d            	tnzw	x
2711  0400 2704          	jreq	L651
2712  0402               L061:
2713  0402 48            	sll	a
2714  0403 5a            	decw	x
2715  0404 26fc          	jrne	L061
2716  0406               L651:
2717  0406 43            	cpl	a
2718  0407 c4540d        	and	a,21517
2719  040a c7540d        	ld	21517,a
2721  040d 2021          	jra	L5321
2722  040f               L1321:
2723                     ; 679       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2725  040f 7b01          	ld	a,(OFST+0,sp)
2726  0411 a008          	sub	a,#8
2727  0413 5f            	clrw	x
2728  0414 97            	ld	xl,a
2729  0415 a601          	ld	a,#1
2730  0417 5d            	tnzw	x
2731  0418 2704          	jreq	L261
2732  041a               L461:
2733  041a 48            	sll	a
2734  041b 5a            	decw	x
2735  041c 26fc          	jrne	L461
2736  041e               L261:
2737  041e 43            	cpl	a
2738  041f c4540c        	and	a,21516
2739  0422 c7540c        	ld	21516,a
2740  0425 2009          	jra	L5321
2741  0427               L7221:
2742                     ; 684     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
2744  0427 7b03          	ld	a,(OFST+2,sp)
2745  0429 43            	cpl	a
2746  042a c45400        	and	a,21504
2747  042d c75400        	ld	21504,a
2748  0430               L5321:
2749                     ; 686 }
2752  0430 5b03          	addw	sp,#3
2753  0432 81            	ret
2766                     	xdef	_ADC1_ClearITPendingBit
2767                     	xdef	_ADC1_GetITStatus
2768                     	xdef	_ADC1_ClearFlag
2769                     	xdef	_ADC1_GetFlagStatus
2770                     	xdef	_ADC1_GetAWDChannelStatus
2771                     	xdef	_ADC1_GetBufferValue
2772                     	xdef	_ADC1_SetLowThreshold
2773                     	xdef	_ADC1_SetHighThreshold
2774                     	xdef	_ADC1_GetConversionValue
2775                     	xdef	_ADC1_StartConversion
2776                     	xdef	_ADC1_AWDChannelConfig
2777                     	xdef	_ADC1_ExternalTriggerConfig
2778                     	xdef	_ADC1_ConversionConfig
2779                     	xdef	_ADC1_SchmittTriggerConfig
2780                     	xdef	_ADC1_PrescalerConfig
2781                     	xdef	_ADC1_ITConfig
2782                     	xdef	_ADC1_DataBufferCmd
2783                     	xdef	_ADC1_ScanModeCmd
2784                     	xdef	_ADC1_Cmd
2785                     	xdef	_ADC1_Init
2786                     	xdef	_ADC1_DeInit
2805                     	end
