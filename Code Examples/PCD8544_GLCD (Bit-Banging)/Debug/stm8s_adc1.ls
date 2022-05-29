   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  42                     ; 52 void ADC1_DeInit(void)
  42                     ; 53 {
  43                     	switch	.text
  44  0000               f_ADC1_DeInit:
  48                     ; 54   ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  50  0000 725f5400      	clr	21504
  51                     ; 55   ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  53  0004 725f5401      	clr	21505
  54                     ; 56   ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  56  0008 725f5402      	clr	21506
  57                     ; 57   ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  59  000c 725f5403      	clr	21507
  60                     ; 58   ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  62  0010 725f5406      	clr	21510
  63                     ; 59   ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  65  0014 725f5407      	clr	21511
  66                     ; 60   ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  68  0018 35ff5408      	mov	21512,#255
  69                     ; 61   ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  71  001c 35035409      	mov	21513,#3
  72                     ; 62   ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  74  0020 725f540a      	clr	21514
  75                     ; 63   ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  77  0024 725f540b      	clr	21515
  78                     ; 64   ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  80  0028 725f540e      	clr	21518
  81                     ; 65   ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  83  002c 725f540f      	clr	21519
  84                     ; 66 }
  87  0030 87            	retf
 537                     ; 88 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 537                     ; 89 {
 538                     	switch	.text
 539  0031               f_ADC1_Init:
 541  0031 89            	pushw	x
 542       00000000      OFST:	set	0
 545                     ; 91   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 547                     ; 92   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 549                     ; 93   assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 551                     ; 94   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 553                     ; 95   assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 555                     ; 96   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 557                     ; 97   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 559                     ; 98   assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 561                     ; 103   ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 563  0032 7b09          	ld	a,(OFST+9,sp)
 564  0034 88            	push	a
 565  0035 9f            	ld	a,xl
 566  0036 97            	ld	xl,a
 567  0037 7b02          	ld	a,(OFST+2,sp)
 568  0039 95            	ld	xh,a
 569  003a 8d430143      	callf	f_ADC1_ConversionConfig
 571  003e 84            	pop	a
 572                     ; 105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 574  003f 7b06          	ld	a,(OFST+6,sp)
 575  0041 8da200a2      	callf	f_ADC1_PrescalerConfig
 577                     ; 110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 579  0045 7b08          	ld	a,(OFST+8,sp)
 580  0047 97            	ld	xl,a
 581  0048 7b07          	ld	a,(OFST+7,sp)
 582  004a 95            	ld	xh,a
 583  004b 8d710171      	callf	f_ADC1_ExternalTriggerConfig
 585                     ; 115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 587  004f 7b0b          	ld	a,(OFST+11,sp)
 588  0051 97            	ld	xl,a
 589  0052 7b0a          	ld	a,(OFST+10,sp)
 590  0054 95            	ld	xh,a
 591  0055 8db500b5      	callf	f_ADC1_SchmittTriggerConfig
 593                     ; 118   ADC1->CR1 |= ADC1_CR1_ADON;
 595  0059 72105401      	bset	21505,#0
 596                     ; 119 }
 599  005d 85            	popw	x
 600  005e 87            	retf
 634                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 634                     ; 127 {
 635                     	switch	.text
 636  005f               f_ADC1_Cmd:
 640                     ; 129   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 642                     ; 131   if (NewState != DISABLE)
 644  005f 4d            	tnz	a
 645  0060 2706          	jreq	L362
 646                     ; 133     ADC1->CR1 |= ADC1_CR1_ADON;
 648  0062 72105401      	bset	21505,#0
 650  0066 2004          	jra	L562
 651  0068               L362:
 652                     ; 137     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 654  0068 72115401      	bres	21505,#0
 655  006c               L562:
 656                     ; 139 }
 659  006c 87            	retf
 693                     ; 146 void ADC1_ScanModeCmd(FunctionalState NewState)
 693                     ; 147 {
 694                     	switch	.text
 695  006d               f_ADC1_ScanModeCmd:
 699                     ; 149   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 701                     ; 151   if (NewState != DISABLE)
 703  006d 4d            	tnz	a
 704  006e 2706          	jreq	L503
 705                     ; 153     ADC1->CR2 |= ADC1_CR2_SCAN;
 707  0070 72125402      	bset	21506,#1
 709  0074 2004          	jra	L703
 710  0076               L503:
 711                     ; 157     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 713  0076 72135402      	bres	21506,#1
 714  007a               L703:
 715                     ; 159 }
 718  007a 87            	retf
 752                     ; 166 void ADC1_DataBufferCmd(FunctionalState NewState)
 752                     ; 167 {
 753                     	switch	.text
 754  007b               f_ADC1_DataBufferCmd:
 758                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 760                     ; 171   if (NewState != DISABLE)
 762  007b 4d            	tnz	a
 763  007c 2706          	jreq	L723
 764                     ; 173     ADC1->CR3 |= ADC1_CR3_DBUF;
 766  007e 721e5403      	bset	21507,#7
 768  0082 2004          	jra	L133
 769  0084               L723:
 770                     ; 177     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 772  0084 721f5403      	bres	21507,#7
 773  0088               L133:
 774                     ; 179 }
 777  0088 87            	retf
 932                     ; 190 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 932                     ; 191 {
 933                     	switch	.text
 934  0089               f_ADC1_ITConfig:
 936  0089 89            	pushw	x
 937       00000000      OFST:	set	0
 940                     ; 193   assert_param(IS_ADC1_IT_OK(ADC1_IT));
 942                     ; 194   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 944                     ; 196   if (NewState != DISABLE)
 946  008a 0d06          	tnz	(OFST+6,sp)
 947  008c 2709          	jreq	L714
 948                     ; 199     ADC1->CSR |= (uint8_t)ADC1_IT;
 950  008e 9f            	ld	a,xl
 951  008f ca5400        	or	a,21504
 952  0092 c75400        	ld	21504,a
 954  0095 2009          	jra	L124
 955  0097               L714:
 956                     ; 204     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
 958  0097 7b02          	ld	a,(OFST+2,sp)
 959  0099 43            	cpl	a
 960  009a c45400        	and	a,21504
 961  009d c75400        	ld	21504,a
 962  00a0               L124:
 963                     ; 206 }
 966  00a0 85            	popw	x
 967  00a1 87            	retf
1002                     ; 214 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1002                     ; 215 {
1003                     	switch	.text
1004  00a2               f_ADC1_PrescalerConfig:
1006  00a2 88            	push	a
1007       00000000      OFST:	set	0
1010                     ; 217   assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1012                     ; 220   ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1014  00a3 c65401        	ld	a,21505
1015  00a6 a48f          	and	a,#143
1016  00a8 c75401        	ld	21505,a
1017                     ; 222   ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1019  00ab c65401        	ld	a,21505
1020  00ae 1a01          	or	a,(OFST+1,sp)
1021  00b0 c75401        	ld	21505,a
1022                     ; 223 }
1025  00b3 84            	pop	a
1026  00b4 87            	retf
1072                     ; 233 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1072                     ; 234 {
1073                     	switch	.text
1074  00b5               f_ADC1_SchmittTriggerConfig:
1076  00b5 89            	pushw	x
1077       00000000      OFST:	set	0
1080                     ; 236   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1082                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1084                     ; 239   if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1086  00b6 9e            	ld	a,xh
1087  00b7 a1ff          	cp	a,#255
1088  00b9 2620          	jrne	L364
1089                     ; 241     if (NewState != DISABLE)
1091  00bb 9f            	ld	a,xl
1092  00bc 4d            	tnz	a
1093  00bd 270a          	jreq	L564
1094                     ; 243       ADC1->TDRL &= (uint8_t)0x0;
1096  00bf 725f5407      	clr	21511
1097                     ; 244       ADC1->TDRH &= (uint8_t)0x0;
1099  00c3 725f5406      	clr	21510
1101  00c7 2078          	jra	L174
1102  00c9               L564:
1103                     ; 248       ADC1->TDRL |= (uint8_t)0xFF;
1105  00c9 c65407        	ld	a,21511
1106  00cc aaff          	or	a,#255
1107  00ce c75407        	ld	21511,a
1108                     ; 249       ADC1->TDRH |= (uint8_t)0xFF;
1110  00d1 c65406        	ld	a,21510
1111  00d4 aaff          	or	a,#255
1112  00d6 c75406        	ld	21510,a
1113  00d9 2066          	jra	L174
1114  00db               L364:
1115                     ; 252   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1117  00db 7b01          	ld	a,(OFST+1,sp)
1118  00dd a108          	cp	a,#8
1119  00df 242f          	jruge	L374
1120                     ; 254     if (NewState != DISABLE)
1122  00e1 0d02          	tnz	(OFST+2,sp)
1123  00e3 2716          	jreq	L574
1124                     ; 256       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1126  00e5 7b01          	ld	a,(OFST+1,sp)
1127  00e7 5f            	clrw	x
1128  00e8 97            	ld	xl,a
1129  00e9 a601          	ld	a,#1
1130  00eb 5d            	tnzw	x
1131  00ec 2704          	jreq	L42
1132  00ee               L62:
1133  00ee 48            	sll	a
1134  00ef 5a            	decw	x
1135  00f0 26fc          	jrne	L62
1136  00f2               L42:
1137  00f2 43            	cpl	a
1138  00f3 c45407        	and	a,21511
1139  00f6 c75407        	ld	21511,a
1141  00f9 2046          	jra	L174
1142  00fb               L574:
1143                     ; 260       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1145  00fb 7b01          	ld	a,(OFST+1,sp)
1146  00fd 5f            	clrw	x
1147  00fe 97            	ld	xl,a
1148  00ff a601          	ld	a,#1
1149  0101 5d            	tnzw	x
1150  0102 2704          	jreq	L03
1151  0104               L23:
1152  0104 48            	sll	a
1153  0105 5a            	decw	x
1154  0106 26fc          	jrne	L23
1155  0108               L03:
1156  0108 ca5407        	or	a,21511
1157  010b c75407        	ld	21511,a
1158  010e 2031          	jra	L174
1159  0110               L374:
1160                     ; 265     if (NewState != DISABLE)
1162  0110 0d02          	tnz	(OFST+2,sp)
1163  0112 2718          	jreq	L305
1164                     ; 267       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1166  0114 7b01          	ld	a,(OFST+1,sp)
1167  0116 a008          	sub	a,#8
1168  0118 5f            	clrw	x
1169  0119 97            	ld	xl,a
1170  011a a601          	ld	a,#1
1171  011c 5d            	tnzw	x
1172  011d 2704          	jreq	L43
1173  011f               L63:
1174  011f 48            	sll	a
1175  0120 5a            	decw	x
1176  0121 26fc          	jrne	L63
1177  0123               L43:
1178  0123 43            	cpl	a
1179  0124 c45406        	and	a,21510
1180  0127 c75406        	ld	21510,a
1182  012a 2015          	jra	L174
1183  012c               L305:
1184                     ; 271       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1186  012c 7b01          	ld	a,(OFST+1,sp)
1187  012e a008          	sub	a,#8
1188  0130 5f            	clrw	x
1189  0131 97            	ld	xl,a
1190  0132 a601          	ld	a,#1
1191  0134 5d            	tnzw	x
1192  0135 2704          	jreq	L04
1193  0137               L24:
1194  0137 48            	sll	a
1195  0138 5a            	decw	x
1196  0139 26fc          	jrne	L24
1197  013b               L04:
1198  013b ca5406        	or	a,21510
1199  013e c75406        	ld	21510,a
1200  0141               L174:
1201                     ; 274 }
1204  0141 85            	popw	x
1205  0142 87            	retf
1261                     ; 286 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1261                     ; 287 {
1262                     	switch	.text
1263  0143               f_ADC1_ConversionConfig:
1265  0143 89            	pushw	x
1266       00000000      OFST:	set	0
1269                     ; 289   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1271                     ; 290   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1273                     ; 291   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1275                     ; 294   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1277  0144 72175402      	bres	21506,#3
1278                     ; 296   ADC1->CR2 |= (uint8_t)(ADC1_Align);
1280  0148 c65402        	ld	a,21506
1281  014b 1a06          	or	a,(OFST+6,sp)
1282  014d c75402        	ld	21506,a
1283                     ; 298   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1285  0150 9e            	ld	a,xh
1286  0151 a101          	cp	a,#1
1287  0153 2606          	jrne	L535
1288                     ; 301     ADC1->CR1 |= ADC1_CR1_CONT;
1290  0155 72125401      	bset	21505,#1
1292  0159 2004          	jra	L735
1293  015b               L535:
1294                     ; 306     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1296  015b 72135401      	bres	21505,#1
1297  015f               L735:
1298                     ; 310   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1300  015f c65400        	ld	a,21504
1301  0162 a4f0          	and	a,#240
1302  0164 c75400        	ld	21504,a
1303                     ; 312   ADC1->CSR |= (uint8_t)(ADC1_Channel);
1305  0167 c65400        	ld	a,21504
1306  016a 1a02          	or	a,(OFST+2,sp)
1307  016c c75400        	ld	21504,a
1308                     ; 313 }
1311  016f 85            	popw	x
1312  0170 87            	retf
1357                     ; 325 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1357                     ; 326 {
1358                     	switch	.text
1359  0171               f_ADC1_ExternalTriggerConfig:
1361  0171 89            	pushw	x
1362       00000000      OFST:	set	0
1365                     ; 328   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1367                     ; 329   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1369                     ; 332   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1371  0172 c65402        	ld	a,21506
1372  0175 a4cf          	and	a,#207
1373  0177 c75402        	ld	21506,a
1374                     ; 334   if (NewState != DISABLE)
1376  017a 9f            	ld	a,xl
1377  017b 4d            	tnz	a
1378  017c 2706          	jreq	L365
1379                     ; 337     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1381  017e 721c5402      	bset	21506,#6
1383  0182 2004          	jra	L565
1384  0184               L365:
1385                     ; 342     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1387  0184 721d5402      	bres	21506,#6
1388  0188               L565:
1389                     ; 346   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1391  0188 c65402        	ld	a,21506
1392  018b 1a01          	or	a,(OFST+1,sp)
1393  018d c75402        	ld	21506,a
1394                     ; 347 }
1397  0190 85            	popw	x
1398  0191 87            	retf
1421                     ; 358 void ADC1_StartConversion(void)
1421                     ; 359 {
1422                     	switch	.text
1423  0192               f_ADC1_StartConversion:
1427                     ; 360   ADC1->CR1 |= ADC1_CR1_ADON;
1429  0192 72105401      	bset	21505,#0
1430                     ; 361 }
1433  0196 87            	retf
1472                     ; 370 uint16_t ADC1_GetConversionValue(void)
1472                     ; 371 {
1473                     	switch	.text
1474  0197               f_ADC1_GetConversionValue:
1476  0197 5205          	subw	sp,#5
1477       00000005      OFST:	set	5
1480                     ; 372   uint16_t temph = 0;
1482                     ; 373   uint8_t templ = 0;
1484                     ; 375   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1486  0199 c65402        	ld	a,21506
1487  019c a508          	bcp	a,#8
1488  019e 2715          	jreq	L516
1489                     ; 378     templ = ADC1->DRL;
1491  01a0 c65405        	ld	a,21509
1492  01a3 6b03          	ld	(OFST-2,sp),a
1494                     ; 380     temph = ADC1->DRH;
1496  01a5 c65404        	ld	a,21508
1497  01a8 5f            	clrw	x
1498  01a9 97            	ld	xl,a
1499  01aa 1f04          	ldw	(OFST-1,sp),x
1501                     ; 382     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1503  01ac 1e04          	ldw	x,(OFST-1,sp)
1504  01ae 7b03          	ld	a,(OFST-2,sp)
1505  01b0 02            	rlwa	x,a
1506  01b1 1f04          	ldw	(OFST-1,sp),x
1509  01b3 2021          	jra	L716
1510  01b5               L516:
1511                     ; 387     temph = ADC1->DRH;
1513  01b5 c65404        	ld	a,21508
1514  01b8 5f            	clrw	x
1515  01b9 97            	ld	xl,a
1516  01ba 1f04          	ldw	(OFST-1,sp),x
1518                     ; 389     templ = ADC1->DRL;
1520  01bc c65405        	ld	a,21509
1521  01bf 6b03          	ld	(OFST-2,sp),a
1523                     ; 391     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1525  01c1 1e04          	ldw	x,(OFST-1,sp)
1526  01c3 4f            	clr	a
1527  01c4 02            	rlwa	x,a
1528  01c5 1f01          	ldw	(OFST-4,sp),x
1530  01c7 7b03          	ld	a,(OFST-2,sp)
1531  01c9 97            	ld	xl,a
1532  01ca a640          	ld	a,#64
1533  01cc 42            	mul	x,a
1534  01cd 01            	rrwa	x,a
1535  01ce 1a02          	or	a,(OFST-3,sp)
1536  01d0 01            	rrwa	x,a
1537  01d1 1a01          	or	a,(OFST-4,sp)
1538  01d3 01            	rrwa	x,a
1539  01d4 1f04          	ldw	(OFST-1,sp),x
1541  01d6               L716:
1542                     ; 394   return ((uint16_t)temph);
1544  01d6 1e04          	ldw	x,(OFST-1,sp)
1547  01d8 5b05          	addw	sp,#5
1548  01da 87            	retf
1593                     ; 405 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1593                     ; 406 {
1594                     	switch	.text
1595  01db               f_ADC1_AWDChannelConfig:
1597  01db 89            	pushw	x
1598       00000000      OFST:	set	0
1601                     ; 408   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1603                     ; 409   assert_param(IS_ADC1_CHANNEL_OK(Channel));
1605                     ; 411   if (Channel < (uint8_t)8)
1607  01dc 9e            	ld	a,xh
1608  01dd a108          	cp	a,#8
1609  01df 242e          	jruge	L346
1610                     ; 413     if (NewState != DISABLE)
1612  01e1 9f            	ld	a,xl
1613  01e2 4d            	tnz	a
1614  01e3 2714          	jreq	L546
1615                     ; 415       ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1617  01e5 9e            	ld	a,xh
1618  01e6 5f            	clrw	x
1619  01e7 97            	ld	xl,a
1620  01e8 a601          	ld	a,#1
1621  01ea 5d            	tnzw	x
1622  01eb 2704          	jreq	L65
1623  01ed               L06:
1624  01ed 48            	sll	a
1625  01ee 5a            	decw	x
1626  01ef 26fc          	jrne	L06
1627  01f1               L65:
1628  01f1 ca540f        	or	a,21519
1629  01f4 c7540f        	ld	21519,a
1631  01f7 2047          	jra	L156
1632  01f9               L546:
1633                     ; 419       ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1635  01f9 7b01          	ld	a,(OFST+1,sp)
1636  01fb 5f            	clrw	x
1637  01fc 97            	ld	xl,a
1638  01fd a601          	ld	a,#1
1639  01ff 5d            	tnzw	x
1640  0200 2704          	jreq	L26
1641  0202               L46:
1642  0202 48            	sll	a
1643  0203 5a            	decw	x
1644  0204 26fc          	jrne	L46
1645  0206               L26:
1646  0206 43            	cpl	a
1647  0207 c4540f        	and	a,21519
1648  020a c7540f        	ld	21519,a
1649  020d 2031          	jra	L156
1650  020f               L346:
1651                     ; 424     if (NewState != DISABLE)
1653  020f 0d02          	tnz	(OFST+2,sp)
1654  0211 2717          	jreq	L356
1655                     ; 426       ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1657  0213 7b01          	ld	a,(OFST+1,sp)
1658  0215 a008          	sub	a,#8
1659  0217 5f            	clrw	x
1660  0218 97            	ld	xl,a
1661  0219 a601          	ld	a,#1
1662  021b 5d            	tnzw	x
1663  021c 2704          	jreq	L66
1664  021e               L07:
1665  021e 48            	sll	a
1666  021f 5a            	decw	x
1667  0220 26fc          	jrne	L07
1668  0222               L66:
1669  0222 ca540e        	or	a,21518
1670  0225 c7540e        	ld	21518,a
1672  0228 2016          	jra	L156
1673  022a               L356:
1674                     ; 430       ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1676  022a 7b01          	ld	a,(OFST+1,sp)
1677  022c a008          	sub	a,#8
1678  022e 5f            	clrw	x
1679  022f 97            	ld	xl,a
1680  0230 a601          	ld	a,#1
1681  0232 5d            	tnzw	x
1682  0233 2704          	jreq	L27
1683  0235               L47:
1684  0235 48            	sll	a
1685  0236 5a            	decw	x
1686  0237 26fc          	jrne	L47
1687  0239               L27:
1688  0239 43            	cpl	a
1689  023a c4540e        	and	a,21518
1690  023d c7540e        	ld	21518,a
1691  0240               L156:
1692                     ; 433 }
1695  0240 85            	popw	x
1696  0241 87            	retf
1728                     ; 441 void ADC1_SetHighThreshold(uint16_t Threshold)
1728                     ; 442 {
1729                     	switch	.text
1730  0242               f_ADC1_SetHighThreshold:
1732  0242 89            	pushw	x
1733       00000000      OFST:	set	0
1736                     ; 443   ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
1738  0243 54            	srlw	x
1739  0244 54            	srlw	x
1740  0245 9f            	ld	a,xl
1741  0246 c75408        	ld	21512,a
1742                     ; 444   ADC1->HTRL = (uint8_t)Threshold;
1744  0249 7b02          	ld	a,(OFST+2,sp)
1745  024b c75409        	ld	21513,a
1746                     ; 445 }
1749  024e 85            	popw	x
1750  024f 87            	retf
1782                     ; 453 void ADC1_SetLowThreshold(uint16_t Threshold)
1782                     ; 454 {
1783                     	switch	.text
1784  0250               f_ADC1_SetLowThreshold:
1788                     ; 455   ADC1->LTRL = (uint8_t)Threshold;
1790  0250 9f            	ld	a,xl
1791  0251 c7540b        	ld	21515,a
1792                     ; 456   ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
1794  0254 54            	srlw	x
1795  0255 54            	srlw	x
1796  0256 9f            	ld	a,xl
1797  0257 c7540a        	ld	21514,a
1798                     ; 457 }
1801  025a 87            	retf
1847                     ; 466 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
1847                     ; 467 {
1848                     	switch	.text
1849  025b               f_ADC1_GetBufferValue:
1851  025b 88            	push	a
1852  025c 5205          	subw	sp,#5
1853       00000005      OFST:	set	5
1856                     ; 468   uint16_t temph = 0;
1858                     ; 469   uint8_t templ = 0;
1860                     ; 472   assert_param(IS_ADC1_BUFFER_OK(Buffer));
1862                     ; 474   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1864  025e c65402        	ld	a,21506
1865  0261 a508          	bcp	a,#8
1866  0263 271f          	jreq	L727
1867                     ; 477     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1869  0265 7b06          	ld	a,(OFST+1,sp)
1870  0267 48            	sll	a
1871  0268 5f            	clrw	x
1872  0269 97            	ld	xl,a
1873  026a d653e1        	ld	a,(21473,x)
1874  026d 6b03          	ld	(OFST-2,sp),a
1876                     ; 479     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1878  026f 7b06          	ld	a,(OFST+1,sp)
1879  0271 48            	sll	a
1880  0272 5f            	clrw	x
1881  0273 97            	ld	xl,a
1882  0274 d653e0        	ld	a,(21472,x)
1883  0277 5f            	clrw	x
1884  0278 97            	ld	xl,a
1885  0279 1f04          	ldw	(OFST-1,sp),x
1887                     ; 481     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1889  027b 1e04          	ldw	x,(OFST-1,sp)
1890  027d 7b03          	ld	a,(OFST-2,sp)
1891  027f 02            	rlwa	x,a
1892  0280 1f04          	ldw	(OFST-1,sp),x
1895  0282 202b          	jra	L137
1896  0284               L727:
1897                     ; 486     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1899  0284 7b06          	ld	a,(OFST+1,sp)
1900  0286 48            	sll	a
1901  0287 5f            	clrw	x
1902  0288 97            	ld	xl,a
1903  0289 d653e0        	ld	a,(21472,x)
1904  028c 5f            	clrw	x
1905  028d 97            	ld	xl,a
1906  028e 1f04          	ldw	(OFST-1,sp),x
1908                     ; 488     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1910  0290 7b06          	ld	a,(OFST+1,sp)
1911  0292 48            	sll	a
1912  0293 5f            	clrw	x
1913  0294 97            	ld	xl,a
1914  0295 d653e1        	ld	a,(21473,x)
1915  0298 6b03          	ld	(OFST-2,sp),a
1917                     ; 490     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
1919  029a 1e04          	ldw	x,(OFST-1,sp)
1920  029c 4f            	clr	a
1921  029d 02            	rlwa	x,a
1922  029e 1f01          	ldw	(OFST-4,sp),x
1924  02a0 7b03          	ld	a,(OFST-2,sp)
1925  02a2 97            	ld	xl,a
1926  02a3 a640          	ld	a,#64
1927  02a5 42            	mul	x,a
1928  02a6 01            	rrwa	x,a
1929  02a7 1a02          	or	a,(OFST-3,sp)
1930  02a9 01            	rrwa	x,a
1931  02aa 1a01          	or	a,(OFST-4,sp)
1932  02ac 01            	rrwa	x,a
1933  02ad 1f04          	ldw	(OFST-1,sp),x
1935  02af               L137:
1936                     ; 493   return ((uint16_t)temph);
1938  02af 1e04          	ldw	x,(OFST-1,sp)
1941  02b1 5b06          	addw	sp,#6
1942  02b3 87            	retf
2005                     ; 502 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
2005                     ; 503 {
2006                     	switch	.text
2007  02b4               f_ADC1_GetAWDChannelStatus:
2009  02b4 88            	push	a
2010  02b5 88            	push	a
2011       00000001      OFST:	set	1
2014                     ; 504   uint8_t status = 0;
2016                     ; 507   assert_param(IS_ADC1_CHANNEL_OK(Channel));
2018                     ; 509   if (Channel < (uint8_t)8)
2020  02b6 a108          	cp	a,#8
2021  02b8 2412          	jruge	L367
2022                     ; 511     status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2024  02ba 5f            	clrw	x
2025  02bb 97            	ld	xl,a
2026  02bc a601          	ld	a,#1
2027  02be 5d            	tnzw	x
2028  02bf 2704          	jreq	L601
2029  02c1               L011:
2030  02c1 48            	sll	a
2031  02c2 5a            	decw	x
2032  02c3 26fc          	jrne	L011
2033  02c5               L601:
2034  02c5 c4540d        	and	a,21517
2035  02c8 6b01          	ld	(OFST+0,sp),a
2038  02ca 2014          	jra	L567
2039  02cc               L367:
2040                     ; 515     status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2042  02cc 7b02          	ld	a,(OFST+1,sp)
2043  02ce a008          	sub	a,#8
2044  02d0 5f            	clrw	x
2045  02d1 97            	ld	xl,a
2046  02d2 a601          	ld	a,#1
2047  02d4 5d            	tnzw	x
2048  02d5 2704          	jreq	L211
2049  02d7               L411:
2050  02d7 48            	sll	a
2051  02d8 5a            	decw	x
2052  02d9 26fc          	jrne	L411
2053  02db               L211:
2054  02db c4540c        	and	a,21516
2055  02de 6b01          	ld	(OFST+0,sp),a
2057  02e0               L567:
2058                     ; 518   return ((FlagStatus)status);
2060  02e0 7b01          	ld	a,(OFST+0,sp)
2063  02e2 85            	popw	x
2064  02e3 87            	retf
2217                     ; 527 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2217                     ; 528 {
2218                     	switch	.text
2219  02e4               f_ADC1_GetFlagStatus:
2221  02e4 88            	push	a
2222  02e5 88            	push	a
2223       00000001      OFST:	set	1
2226                     ; 529   uint8_t flagstatus = 0;
2228                     ; 530   uint8_t temp = 0;
2230                     ; 533   assert_param(IS_ADC1_FLAG_OK(Flag));
2232                     ; 535   if ((Flag & 0x0F) == 0x01)
2234  02e6 a40f          	and	a,#15
2235  02e8 a101          	cp	a,#1
2236  02ea 2609          	jrne	L1501
2237                     ; 538     flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2239  02ec c65403        	ld	a,21507
2240  02ef a440          	and	a,#64
2241  02f1 6b01          	ld	(OFST+0,sp),a
2244  02f3 2045          	jra	L3501
2245  02f5               L1501:
2246                     ; 540   else if ((Flag & 0xF0) == 0x10)
2248  02f5 7b02          	ld	a,(OFST+1,sp)
2249  02f7 a4f0          	and	a,#240
2250  02f9 a110          	cp	a,#16
2251  02fb 2636          	jrne	L5501
2252                     ; 543     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2254  02fd 7b02          	ld	a,(OFST+1,sp)
2255  02ff a40f          	and	a,#15
2256  0301 6b01          	ld	(OFST+0,sp),a
2258                     ; 544     if (temp < 8)
2260  0303 7b01          	ld	a,(OFST+0,sp)
2261  0305 a108          	cp	a,#8
2262  0307 2414          	jruge	L7501
2263                     ; 546       flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2265  0309 7b01          	ld	a,(OFST+0,sp)
2266  030b 5f            	clrw	x
2267  030c 97            	ld	xl,a
2268  030d a601          	ld	a,#1
2269  030f 5d            	tnzw	x
2270  0310 2704          	jreq	L021
2271  0312               L221:
2272  0312 48            	sll	a
2273  0313 5a            	decw	x
2274  0314 26fc          	jrne	L221
2275  0316               L021:
2276  0316 c4540d        	and	a,21517
2277  0319 6b01          	ld	(OFST+0,sp),a
2280  031b 201d          	jra	L3501
2281  031d               L7501:
2282                     ; 550       flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2284  031d 7b01          	ld	a,(OFST+0,sp)
2285  031f a008          	sub	a,#8
2286  0321 5f            	clrw	x
2287  0322 97            	ld	xl,a
2288  0323 a601          	ld	a,#1
2289  0325 5d            	tnzw	x
2290  0326 2704          	jreq	L421
2291  0328               L621:
2292  0328 48            	sll	a
2293  0329 5a            	decw	x
2294  032a 26fc          	jrne	L621
2295  032c               L421:
2296  032c c4540c        	and	a,21516
2297  032f 6b01          	ld	(OFST+0,sp),a
2299  0331 2007          	jra	L3501
2300  0333               L5501:
2301                     ; 555     flagstatus = (uint8_t)(ADC1->CSR & Flag);
2303  0333 c65400        	ld	a,21504
2304  0336 1402          	and	a,(OFST+1,sp)
2305  0338 6b01          	ld	(OFST+0,sp),a
2307  033a               L3501:
2308                     ; 557   return ((FlagStatus)flagstatus);
2310  033a 7b01          	ld	a,(OFST+0,sp)
2313  033c 85            	popw	x
2314  033d 87            	retf
2355                     ; 567 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2355                     ; 568 {
2356                     	switch	.text
2357  033e               f_ADC1_ClearFlag:
2359  033e 88            	push	a
2360  033f 88            	push	a
2361       00000001      OFST:	set	1
2364                     ; 569   uint8_t temp = 0;
2366                     ; 572   assert_param(IS_ADC1_FLAG_OK(Flag));
2368                     ; 574   if ((Flag & 0x0F) == 0x01)
2370  0340 a40f          	and	a,#15
2371  0342 a101          	cp	a,#1
2372  0344 2606          	jrne	L5011
2373                     ; 577     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2375  0346 721d5403      	bres	21507,#6
2377  034a 204b          	jra	L7011
2378  034c               L5011:
2379                     ; 579   else if ((Flag & 0xF0) == 0x10)
2381  034c 7b02          	ld	a,(OFST+1,sp)
2382  034e a4f0          	and	a,#240
2383  0350 a110          	cp	a,#16
2384  0352 263a          	jrne	L1111
2385                     ; 582     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2387  0354 7b02          	ld	a,(OFST+1,sp)
2388  0356 a40f          	and	a,#15
2389  0358 6b01          	ld	(OFST+0,sp),a
2391                     ; 583     if (temp < 8)
2393  035a 7b01          	ld	a,(OFST+0,sp)
2394  035c a108          	cp	a,#8
2395  035e 2416          	jruge	L3111
2396                     ; 585       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2398  0360 7b01          	ld	a,(OFST+0,sp)
2399  0362 5f            	clrw	x
2400  0363 97            	ld	xl,a
2401  0364 a601          	ld	a,#1
2402  0366 5d            	tnzw	x
2403  0367 2704          	jreq	L231
2404  0369               L431:
2405  0369 48            	sll	a
2406  036a 5a            	decw	x
2407  036b 26fc          	jrne	L431
2408  036d               L231:
2409  036d 43            	cpl	a
2410  036e c4540d        	and	a,21517
2411  0371 c7540d        	ld	21517,a
2413  0374 2021          	jra	L7011
2414  0376               L3111:
2415                     ; 589       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2417  0376 7b01          	ld	a,(OFST+0,sp)
2418  0378 a008          	sub	a,#8
2419  037a 5f            	clrw	x
2420  037b 97            	ld	xl,a
2421  037c a601          	ld	a,#1
2422  037e 5d            	tnzw	x
2423  037f 2704          	jreq	L631
2424  0381               L041:
2425  0381 48            	sll	a
2426  0382 5a            	decw	x
2427  0383 26fc          	jrne	L041
2428  0385               L631:
2429  0385 43            	cpl	a
2430  0386 c4540c        	and	a,21516
2431  0389 c7540c        	ld	21516,a
2432  038c 2009          	jra	L7011
2433  038e               L1111:
2434                     ; 594     ADC1->CSR &= (uint8_t) (~Flag);
2436  038e 7b02          	ld	a,(OFST+1,sp)
2437  0390 43            	cpl	a
2438  0391 c45400        	and	a,21504
2439  0394 c75400        	ld	21504,a
2440  0397               L7011:
2441                     ; 596 }
2444  0397 85            	popw	x
2445  0398 87            	retf
2497                     ; 616 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2497                     ; 617 {
2498                     	switch	.text
2499  0399               f_ADC1_GetITStatus:
2501  0399 89            	pushw	x
2502  039a 88            	push	a
2503       00000001      OFST:	set	1
2506                     ; 618   ITStatus itstatus = RESET;
2508                     ; 619   uint8_t temp = 0;
2510                     ; 622   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2512                     ; 624   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2514  039b 01            	rrwa	x,a
2515  039c a4f0          	and	a,#240
2516  039e 5f            	clrw	x
2517  039f 02            	rlwa	x,a
2518  03a0 a30010        	cpw	x,#16
2519  03a3 2636          	jrne	L5411
2520                     ; 627     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2522  03a5 7b03          	ld	a,(OFST+2,sp)
2523  03a7 a40f          	and	a,#15
2524  03a9 6b01          	ld	(OFST+0,sp),a
2526                     ; 628     if (temp < 8)
2528  03ab 7b01          	ld	a,(OFST+0,sp)
2529  03ad a108          	cp	a,#8
2530  03af 2414          	jruge	L7411
2531                     ; 630       itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2533  03b1 7b01          	ld	a,(OFST+0,sp)
2534  03b3 5f            	clrw	x
2535  03b4 97            	ld	xl,a
2536  03b5 a601          	ld	a,#1
2537  03b7 5d            	tnzw	x
2538  03b8 2704          	jreq	L441
2539  03ba               L641:
2540  03ba 48            	sll	a
2541  03bb 5a            	decw	x
2542  03bc 26fc          	jrne	L641
2543  03be               L441:
2544  03be c4540d        	and	a,21517
2545  03c1 6b01          	ld	(OFST+0,sp),a
2548  03c3 201d          	jra	L3511
2549  03c5               L7411:
2550                     ; 634       itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2552  03c5 7b01          	ld	a,(OFST+0,sp)
2553  03c7 a008          	sub	a,#8
2554  03c9 5f            	clrw	x
2555  03ca 97            	ld	xl,a
2556  03cb a601          	ld	a,#1
2557  03cd 5d            	tnzw	x
2558  03ce 2704          	jreq	L051
2559  03d0               L251:
2560  03d0 48            	sll	a
2561  03d1 5a            	decw	x
2562  03d2 26fc          	jrne	L251
2563  03d4               L051:
2564  03d4 c4540c        	and	a,21516
2565  03d7 6b01          	ld	(OFST+0,sp),a
2567  03d9 2007          	jra	L3511
2568  03db               L5411:
2569                     ; 639     itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
2571  03db c65400        	ld	a,21504
2572  03de 1403          	and	a,(OFST+2,sp)
2573  03e0 6b01          	ld	(OFST+0,sp),a
2575  03e2               L3511:
2576                     ; 641   return ((ITStatus)itstatus);
2578  03e2 7b01          	ld	a,(OFST+0,sp)
2581  03e4 5b03          	addw	sp,#3
2582  03e6 87            	retf
2624                     ; 662 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2624                     ; 663 {
2625                     	switch	.text
2626  03e7               f_ADC1_ClearITPendingBit:
2628  03e7 89            	pushw	x
2629  03e8 88            	push	a
2630       00000001      OFST:	set	1
2633                     ; 664   uint8_t temp = 0;
2635                     ; 667   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2637                     ; 669   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2639  03e9 01            	rrwa	x,a
2640  03ea a4f0          	and	a,#240
2641  03ec 5f            	clrw	x
2642  03ed 02            	rlwa	x,a
2643  03ee a30010        	cpw	x,#16
2644  03f1 263a          	jrne	L5711
2645                     ; 672     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2647  03f3 7b03          	ld	a,(OFST+2,sp)
2648  03f5 a40f          	and	a,#15
2649  03f7 6b01          	ld	(OFST+0,sp),a
2651                     ; 673     if (temp < 8)
2653  03f9 7b01          	ld	a,(OFST+0,sp)
2654  03fb a108          	cp	a,#8
2655  03fd 2416          	jruge	L7711
2656                     ; 675       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2658  03ff 7b01          	ld	a,(OFST+0,sp)
2659  0401 5f            	clrw	x
2660  0402 97            	ld	xl,a
2661  0403 a601          	ld	a,#1
2662  0405 5d            	tnzw	x
2663  0406 2704          	jreq	L651
2664  0408               L061:
2665  0408 48            	sll	a
2666  0409 5a            	decw	x
2667  040a 26fc          	jrne	L061
2668  040c               L651:
2669  040c 43            	cpl	a
2670  040d c4540d        	and	a,21517
2671  0410 c7540d        	ld	21517,a
2673  0413 2021          	jra	L3021
2674  0415               L7711:
2675                     ; 679       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2677  0415 7b01          	ld	a,(OFST+0,sp)
2678  0417 a008          	sub	a,#8
2679  0419 5f            	clrw	x
2680  041a 97            	ld	xl,a
2681  041b a601          	ld	a,#1
2682  041d 5d            	tnzw	x
2683  041e 2704          	jreq	L261
2684  0420               L461:
2685  0420 48            	sll	a
2686  0421 5a            	decw	x
2687  0422 26fc          	jrne	L461
2688  0424               L261:
2689  0424 43            	cpl	a
2690  0425 c4540c        	and	a,21516
2691  0428 c7540c        	ld	21516,a
2692  042b 2009          	jra	L3021
2693  042d               L5711:
2694                     ; 684     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
2696  042d 7b03          	ld	a,(OFST+2,sp)
2697  042f 43            	cpl	a
2698  0430 c45400        	and	a,21504
2699  0433 c75400        	ld	21504,a
2700  0436               L3021:
2701                     ; 686 }
2704  0436 5b03          	addw	sp,#3
2705  0438 87            	retf
2717                     	xdef	f_ADC1_ClearITPendingBit
2718                     	xdef	f_ADC1_GetITStatus
2719                     	xdef	f_ADC1_ClearFlag
2720                     	xdef	f_ADC1_GetFlagStatus
2721                     	xdef	f_ADC1_GetAWDChannelStatus
2722                     	xdef	f_ADC1_GetBufferValue
2723                     	xdef	f_ADC1_SetLowThreshold
2724                     	xdef	f_ADC1_SetHighThreshold
2725                     	xdef	f_ADC1_GetConversionValue
2726                     	xdef	f_ADC1_StartConversion
2727                     	xdef	f_ADC1_AWDChannelConfig
2728                     	xdef	f_ADC1_ExternalTriggerConfig
2729                     	xdef	f_ADC1_ConversionConfig
2730                     	xdef	f_ADC1_SchmittTriggerConfig
2731                     	xdef	f_ADC1_PrescalerConfig
2732                     	xdef	f_ADC1_ITConfig
2733                     	xdef	f_ADC1_DataBufferCmd
2734                     	xdef	f_ADC1_ScanModeCmd
2735                     	xdef	f_ADC1_Cmd
2736                     	xdef	f_ADC1_Init
2737                     	xdef	f_ADC1_DeInit
2756                     	end
