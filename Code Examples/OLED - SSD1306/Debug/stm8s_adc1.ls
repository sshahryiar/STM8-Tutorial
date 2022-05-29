   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  47                     ; 52 void ADC1_DeInit(void)
  47                     ; 53 {
  49                     	switch	.text
  50  0000               _ADC1_DeInit:
  54                     ; 54   ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  56  0000 725f5400      	clr	21504
  57                     ; 55   ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  59  0004 725f5401      	clr	21505
  60                     ; 56   ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  62  0008 725f5402      	clr	21506
  63                     ; 57   ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  65  000c 725f5403      	clr	21507
  66                     ; 58   ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  68  0010 725f5406      	clr	21510
  69                     ; 59   ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  71  0014 725f5407      	clr	21511
  72                     ; 60   ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  74  0018 35ff5408      	mov	21512,#255
  75                     ; 61   ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  77  001c 35035409      	mov	21513,#3
  78                     ; 62   ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  80  0020 725f540a      	clr	21514
  81                     ; 63   ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  83  0024 725f540b      	clr	21515
  84                     ; 64   ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  86  0028 725f540e      	clr	21518
  87                     ; 65   ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  89  002c 725f540f      	clr	21519
  90                     ; 66 }
  93  0030 81            	ret	
 544                     ; 88 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 544                     ; 89 {
 545                     	switch	.text
 546  0031               _ADC1_Init:
 548  0031 89            	pushw	x
 549       00000000      OFST:	set	0
 552                     ; 91   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 554                     ; 92   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 556                     ; 93   assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 558                     ; 94   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 560                     ; 95   assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 562                     ; 96   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 564                     ; 97   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 566                     ; 98   assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 568                     ; 103   ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 570  0032 7b08          	ld	a,(OFST+8,sp)
 571  0034 88            	push	a
 572  0035 7b02          	ld	a,(OFST+2,sp)
 573  0037 95            	ld	xh,a
 574  0038 cd011b        	call	_ADC1_ConversionConfig
 576  003b 84            	pop	a
 577                     ; 105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 579  003c 7b05          	ld	a,(OFST+5,sp)
 580  003e ad54          	call	_ADC1_PrescalerConfig
 582                     ; 110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 584  0040 7b07          	ld	a,(OFST+7,sp)
 585  0042 97            	ld	xl,a
 586  0043 7b06          	ld	a,(OFST+6,sp)
 587  0045 95            	ld	xh,a
 588  0046 cd0148        	call	_ADC1_ExternalTriggerConfig
 590                     ; 115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 592  0049 7b0a          	ld	a,(OFST+10,sp)
 593  004b 97            	ld	xl,a
 594  004c 7b09          	ld	a,(OFST+9,sp)
 595  004e 95            	ld	xh,a
 596  004f ad56          	call	_ADC1_SchmittTriggerConfig
 598                     ; 118   ADC1->CR1 |= ADC1_CR1_ADON;
 600  0051 72105401      	bset	21505,#0
 601                     ; 119 }
 604  0055 85            	popw	x
 605  0056 81            	ret	
 640                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 640                     ; 127 {
 641                     	switch	.text
 642  0057               _ADC1_Cmd:
 646                     ; 129   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 648                     ; 131   if (NewState != DISABLE)
 650  0057 4d            	tnz	a
 651  0058 2705          	jreq	L362
 652                     ; 133     ADC1->CR1 |= ADC1_CR1_ADON;
 654  005a 72105401      	bset	21505,#0
 657  005e 81            	ret	
 658  005f               L362:
 659                     ; 137     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 661  005f 72115401      	bres	21505,#0
 662                     ; 139 }
 665  0063 81            	ret	
 700                     ; 146 void ADC1_ScanModeCmd(FunctionalState NewState)
 700                     ; 147 {
 701                     	switch	.text
 702  0064               _ADC1_ScanModeCmd:
 706                     ; 149   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 708                     ; 151   if (NewState != DISABLE)
 710  0064 4d            	tnz	a
 711  0065 2705          	jreq	L503
 712                     ; 153     ADC1->CR2 |= ADC1_CR2_SCAN;
 714  0067 72125402      	bset	21506,#1
 717  006b 81            	ret	
 718  006c               L503:
 719                     ; 157     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 721  006c 72135402      	bres	21506,#1
 722                     ; 159 }
 725  0070 81            	ret	
 760                     ; 166 void ADC1_DataBufferCmd(FunctionalState NewState)
 760                     ; 167 {
 761                     	switch	.text
 762  0071               _ADC1_DataBufferCmd:
 766                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 768                     ; 171   if (NewState != DISABLE)
 770  0071 4d            	tnz	a
 771  0072 2705          	jreq	L723
 772                     ; 173     ADC1->CR3 |= ADC1_CR3_DBUF;
 774  0074 721e5403      	bset	21507,#7
 777  0078 81            	ret	
 778  0079               L723:
 779                     ; 177     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 781  0079 721f5403      	bres	21507,#7
 782                     ; 179 }
 785  007d 81            	ret	
 941                     ; 190 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 941                     ; 191 {
 942                     	switch	.text
 943  007e               _ADC1_ITConfig:
 945  007e 89            	pushw	x
 946       00000000      OFST:	set	0
 949                     ; 193   assert_param(IS_ADC1_IT_OK(ADC1_IT));
 951                     ; 194   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 953                     ; 196   if (NewState != DISABLE)
 955  007f 7b05          	ld	a,(OFST+5,sp)
 956  0081 2706          	jreq	L714
 957                     ; 199     ADC1->CSR |= (uint8_t)ADC1_IT;
 959  0083 9f            	ld	a,xl
 960  0084 ca5400        	or	a,21504
 962  0087 2006          	jra	L124
 963  0089               L714:
 964                     ; 204     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
 966  0089 7b02          	ld	a,(OFST+2,sp)
 967  008b 43            	cpl	a
 968  008c c45400        	and	a,21504
 969  008f               L124:
 970  008f c75400        	ld	21504,a
 971                     ; 206 }
 974  0092 85            	popw	x
 975  0093 81            	ret	
1011                     ; 214 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1011                     ; 215 {
1012                     	switch	.text
1013  0094               _ADC1_PrescalerConfig:
1015  0094 88            	push	a
1016       00000000      OFST:	set	0
1019                     ; 217   assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1021                     ; 220   ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1023  0095 c65401        	ld	a,21505
1024  0098 a48f          	and	a,#143
1025  009a c75401        	ld	21505,a
1026                     ; 222   ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1028  009d c65401        	ld	a,21505
1029  00a0 1a01          	or	a,(OFST+1,sp)
1030  00a2 c75401        	ld	21505,a
1031                     ; 223 }
1034  00a5 84            	pop	a
1035  00a6 81            	ret	
1082                     ; 233 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1082                     ; 234 {
1083                     	switch	.text
1084  00a7               _ADC1_SchmittTriggerConfig:
1086  00a7 89            	pushw	x
1087       00000000      OFST:	set	0
1090                     ; 236   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1092                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1094                     ; 239   if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1096  00a8 9e            	ld	a,xh
1097  00a9 4c            	inc	a
1098  00aa 261d          	jrne	L364
1099                     ; 241     if (NewState != DISABLE)
1101  00ac 9f            	ld	a,xl
1102  00ad 4d            	tnz	a
1103  00ae 270a          	jreq	L564
1104                     ; 243       ADC1->TDRL &= (uint8_t)0x0;
1106  00b0 725f5407      	clr	21511
1107                     ; 244       ADC1->TDRH &= (uint8_t)0x0;
1109  00b4 725f5406      	clr	21510
1111  00b8 2059          	jra	L174
1112  00ba               L564:
1113                     ; 248       ADC1->TDRL |= (uint8_t)0xFF;
1115  00ba c65407        	ld	a,21511
1116  00bd aaff          	or	a,#255
1117  00bf c75407        	ld	21511,a
1118                     ; 249       ADC1->TDRH |= (uint8_t)0xFF;
1120  00c2 c65406        	ld	a,21510
1121  00c5 aaff          	or	a,#255
1122  00c7 2047          	jp	LC001
1123  00c9               L364:
1124                     ; 252   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1126  00c9 7b01          	ld	a,(OFST+1,sp)
1127  00cb a108          	cp	a,#8
1128  00cd 0d02          	tnz	(OFST+2,sp)
1129  00cf 2420          	jruge	L374
1130                     ; 254     if (NewState != DISABLE)
1132  00d1 2711          	jreq	L574
1133                     ; 256       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1135  00d3 ad40          	call	LC003
1136  00d5 2704          	jreq	L43
1137  00d7               L63:
1138  00d7 48            	sll	a
1139  00d8 5a            	decw	x
1140  00d9 26fc          	jrne	L63
1141  00db               L43:
1142  00db 43            	cpl	a
1143  00dc c45407        	and	a,21511
1144  00df               LC002:
1145  00df c75407        	ld	21511,a
1147  00e2 202f          	jra	L174
1148  00e4               L574:
1149                     ; 260       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1151  00e4 ad2f          	call	LC003
1152  00e6 2704          	jreq	L04
1153  00e8               L24:
1154  00e8 48            	sll	a
1155  00e9 5a            	decw	x
1156  00ea 26fc          	jrne	L24
1157  00ec               L04:
1158  00ec ca5407        	or	a,21511
1159  00ef 20ee          	jp	LC002
1160  00f1               L374:
1161                     ; 265     if (NewState != DISABLE)
1163  00f1 2710          	jreq	L305
1164                     ; 267       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1166  00f3 a008          	sub	a,#8
1167  00f5 ad1e          	call	LC003
1168  00f7 2704          	jreq	L44
1169  00f9               L64:
1170  00f9 48            	sll	a
1171  00fa 5a            	decw	x
1172  00fb 26fc          	jrne	L64
1173  00fd               L44:
1174  00fd 43            	cpl	a
1175  00fe c45406        	and	a,21510
1177  0101 200d          	jp	LC001
1178  0103               L305:
1179                     ; 271       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1181  0103 a008          	sub	a,#8
1182  0105 ad0e          	call	LC003
1183  0107 2704          	jreq	L05
1184  0109               L25:
1185  0109 48            	sll	a
1186  010a 5a            	decw	x
1187  010b 26fc          	jrne	L25
1188  010d               L05:
1189  010d ca5406        	or	a,21510
1190  0110               LC001:
1191  0110 c75406        	ld	21510,a
1192  0113               L174:
1193                     ; 274 }
1196  0113 85            	popw	x
1197  0114 81            	ret	
1198  0115               LC003:
1199  0115 5f            	clrw	x
1200  0116 97            	ld	xl,a
1201  0117 a601          	ld	a,#1
1202  0119 5d            	tnzw	x
1203  011a 81            	ret	
1260                     ; 286 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1260                     ; 287 {
1261                     	switch	.text
1262  011b               _ADC1_ConversionConfig:
1264  011b 89            	pushw	x
1265       00000000      OFST:	set	0
1268                     ; 289   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1270                     ; 290   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1272                     ; 291   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1274                     ; 294   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1276  011c 72175402      	bres	21506,#3
1277                     ; 296   ADC1->CR2 |= (uint8_t)(ADC1_Align);
1279  0120 c65402        	ld	a,21506
1280  0123 1a05          	or	a,(OFST+5,sp)
1281  0125 c75402        	ld	21506,a
1282                     ; 298   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1284  0128 9e            	ld	a,xh
1285  0129 4a            	dec	a
1286  012a 2606          	jrne	L535
1287                     ; 301     ADC1->CR1 |= ADC1_CR1_CONT;
1289  012c 72125401      	bset	21505,#1
1291  0130 2004          	jra	L735
1292  0132               L535:
1293                     ; 306     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1295  0132 72135401      	bres	21505,#1
1296  0136               L735:
1297                     ; 310   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1299  0136 c65400        	ld	a,21504
1300  0139 a4f0          	and	a,#240
1301  013b c75400        	ld	21504,a
1302                     ; 312   ADC1->CSR |= (uint8_t)(ADC1_Channel);
1304  013e c65400        	ld	a,21504
1305  0141 1a02          	or	a,(OFST+2,sp)
1306  0143 c75400        	ld	21504,a
1307                     ; 313 }
1310  0146 85            	popw	x
1311  0147 81            	ret	
1357                     ; 325 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1357                     ; 326 {
1358                     	switch	.text
1359  0148               _ADC1_ExternalTriggerConfig:
1361  0148 89            	pushw	x
1362       00000000      OFST:	set	0
1365                     ; 328   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1367                     ; 329   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1369                     ; 332   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1371  0149 c65402        	ld	a,21506
1372  014c a4cf          	and	a,#207
1373  014e c75402        	ld	21506,a
1374                     ; 334   if (NewState != DISABLE)
1376  0151 9f            	ld	a,xl
1377  0152 4d            	tnz	a
1378  0153 2706          	jreq	L365
1379                     ; 337     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1381  0155 721c5402      	bset	21506,#6
1383  0159 2004          	jra	L565
1384  015b               L365:
1385                     ; 342     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1387  015b 721d5402      	bres	21506,#6
1388  015f               L565:
1389                     ; 346   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1391  015f c65402        	ld	a,21506
1392  0162 1a01          	or	a,(OFST+1,sp)
1393  0164 c75402        	ld	21506,a
1394                     ; 347 }
1397  0167 85            	popw	x
1398  0168 81            	ret	
1422                     ; 358 void ADC1_StartConversion(void)
1422                     ; 359 {
1423                     	switch	.text
1424  0169               _ADC1_StartConversion:
1428                     ; 360   ADC1->CR1 |= ADC1_CR1_ADON;
1430  0169 72105401      	bset	21505,#0
1431                     ; 361 }
1434  016d 81            	ret	
1474                     ; 370 uint16_t ADC1_GetConversionValue(void)
1474                     ; 371 {
1475                     	switch	.text
1476  016e               _ADC1_GetConversionValue:
1478  016e 5205          	subw	sp,#5
1479       00000005      OFST:	set	5
1482                     ; 372   uint16_t temph = 0;
1484                     ; 373   uint8_t templ = 0;
1486                     ; 375   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1488  0170 720754020e    	btjf	21506,#3,L516
1489                     ; 378     templ = ADC1->DRL;
1491  0175 c65405        	ld	a,21509
1492  0178 6b03          	ld	(OFST-2,sp),a
1494                     ; 380     temph = ADC1->DRH;
1496  017a c65404        	ld	a,21508
1497  017d 97            	ld	xl,a
1499                     ; 382     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1501  017e 7b03          	ld	a,(OFST-2,sp)
1502  0180 02            	rlwa	x,a
1505  0181 201a          	jra	L716
1506  0183               L516:
1507                     ; 387     temph = ADC1->DRH;
1509  0183 c65404        	ld	a,21508
1510  0186 97            	ld	xl,a
1512                     ; 389     templ = ADC1->DRL;
1514  0187 c65405        	ld	a,21509
1515  018a 6b03          	ld	(OFST-2,sp),a
1517                     ; 391     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1519  018c 4f            	clr	a
1520  018d 02            	rlwa	x,a
1521  018e 1f01          	ldw	(OFST-4,sp),x
1523  0190 7b03          	ld	a,(OFST-2,sp)
1524  0192 97            	ld	xl,a
1525  0193 a640          	ld	a,#64
1526  0195 42            	mul	x,a
1527  0196 01            	rrwa	x,a
1528  0197 1a02          	or	a,(OFST-3,sp)
1529  0199 01            	rrwa	x,a
1530  019a 1a01          	or	a,(OFST-4,sp)
1531  019c 01            	rrwa	x,a
1533  019d               L716:
1534                     ; 394   return ((uint16_t)temph);
1538  019d 5b05          	addw	sp,#5
1539  019f 81            	ret	
1585                     ; 405 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1585                     ; 406 {
1586                     	switch	.text
1587  01a0               _ADC1_AWDChannelConfig:
1589  01a0 89            	pushw	x
1590       00000000      OFST:	set	0
1593                     ; 408   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1595                     ; 409   assert_param(IS_ADC1_CHANNEL_OK(Channel));
1597                     ; 411   if (Channel < (uint8_t)8)
1599  01a1 9e            	ld	a,xh
1600  01a2 a108          	cp	a,#8
1601  01a4 2425          	jruge	L346
1602                     ; 413     if (NewState != DISABLE)
1604  01a6 9f            	ld	a,xl
1605  01a7 4d            	tnz	a
1606  01a8 270e          	jreq	L546
1607                     ; 415       ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1609  01aa 9e            	ld	a,xh
1610  01ab ad48          	call	LC006
1611  01ad 2704          	jreq	L66
1612  01af               L07:
1613  01af 48            	sll	a
1614  01b0 5a            	decw	x
1615  01b1 26fc          	jrne	L07
1616  01b3               L66:
1617  01b3 ca540f        	or	a,21519
1619  01b6 200e          	jp	LC005
1620  01b8               L546:
1621                     ; 419       ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1623  01b8 7b01          	ld	a,(OFST+1,sp)
1624  01ba ad39          	call	LC006
1625  01bc 2704          	jreq	L27
1626  01be               L47:
1627  01be 48            	sll	a
1628  01bf 5a            	decw	x
1629  01c0 26fc          	jrne	L47
1630  01c2               L27:
1631  01c2 43            	cpl	a
1632  01c3 c4540f        	and	a,21519
1633  01c6               LC005:
1634  01c6 c7540f        	ld	21519,a
1635  01c9 2028          	jra	L156
1636  01cb               L346:
1637                     ; 424     if (NewState != DISABLE)
1639  01cb 7b02          	ld	a,(OFST+2,sp)
1640  01cd 2711          	jreq	L356
1641                     ; 426       ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1643  01cf 7b01          	ld	a,(OFST+1,sp)
1644  01d1 a008          	sub	a,#8
1645  01d3 ad20          	call	LC006
1646  01d5 2704          	jreq	L67
1647  01d7               L001:
1648  01d7 48            	sll	a
1649  01d8 5a            	decw	x
1650  01d9 26fc          	jrne	L001
1651  01db               L67:
1652  01db ca540e        	or	a,21518
1654  01de 2010          	jp	LC004
1655  01e0               L356:
1656                     ; 430       ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1658  01e0 7b01          	ld	a,(OFST+1,sp)
1659  01e2 a008          	sub	a,#8
1660  01e4 ad0f          	call	LC006
1661  01e6 2704          	jreq	L201
1662  01e8               L401:
1663  01e8 48            	sll	a
1664  01e9 5a            	decw	x
1665  01ea 26fc          	jrne	L401
1666  01ec               L201:
1667  01ec 43            	cpl	a
1668  01ed c4540e        	and	a,21518
1669  01f0               LC004:
1670  01f0 c7540e        	ld	21518,a
1671  01f3               L156:
1672                     ; 433 }
1675  01f3 85            	popw	x
1676  01f4 81            	ret	
1677  01f5               LC006:
1678  01f5 5f            	clrw	x
1679  01f6 97            	ld	xl,a
1680  01f7 a601          	ld	a,#1
1681  01f9 5d            	tnzw	x
1682  01fa 81            	ret	
1715                     ; 441 void ADC1_SetHighThreshold(uint16_t Threshold)
1715                     ; 442 {
1716                     	switch	.text
1717  01fb               _ADC1_SetHighThreshold:
1719  01fb 89            	pushw	x
1720       00000000      OFST:	set	0
1723                     ; 443   ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
1725  01fc 54            	srlw	x
1726  01fd 54            	srlw	x
1727  01fe 9f            	ld	a,xl
1728  01ff c75408        	ld	21512,a
1729                     ; 444   ADC1->HTRL = (uint8_t)Threshold;
1731  0202 7b02          	ld	a,(OFST+2,sp)
1732  0204 c75409        	ld	21513,a
1733                     ; 445 }
1736  0207 85            	popw	x
1737  0208 81            	ret	
1770                     ; 453 void ADC1_SetLowThreshold(uint16_t Threshold)
1770                     ; 454 {
1771                     	switch	.text
1772  0209               _ADC1_SetLowThreshold:
1776                     ; 455   ADC1->LTRL = (uint8_t)Threshold;
1778  0209 9f            	ld	a,xl
1779  020a c7540b        	ld	21515,a
1780                     ; 456   ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
1782  020d 54            	srlw	x
1783  020e 54            	srlw	x
1784  020f 9f            	ld	a,xl
1785  0210 c7540a        	ld	21514,a
1786                     ; 457 }
1789  0213 81            	ret	
1836                     ; 466 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
1836                     ; 467 {
1837                     	switch	.text
1838  0214               _ADC1_GetBufferValue:
1840  0214 88            	push	a
1841  0215 5205          	subw	sp,#5
1842       00000005      OFST:	set	5
1845                     ; 468   uint16_t temph = 0;
1847                     ; 469   uint8_t templ = 0;
1849                     ; 472   assert_param(IS_ADC1_BUFFER_OK(Buffer));
1851                     ; 474   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1853  0217 48            	sll	a
1854  0218 5f            	clrw	x
1855  0219 97            	ld	xl,a
1856  021a 7207540213    	btjf	21506,#3,L727
1857                     ; 477     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1859  021f d653e1        	ld	a,(21473,x)
1860  0222 6b03          	ld	(OFST-2,sp),a
1862                     ; 479     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1864  0224 7b06          	ld	a,(OFST+1,sp)
1865  0226 48            	sll	a
1866  0227 5f            	clrw	x
1867  0228 97            	ld	xl,a
1868  0229 d653e0        	ld	a,(21472,x)
1869  022c 97            	ld	xl,a
1871                     ; 481     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1873  022d 7b03          	ld	a,(OFST-2,sp)
1874  022f 02            	rlwa	x,a
1877  0230 2024          	jra	L137
1878  0232               L727:
1879                     ; 486     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1881  0232 d653e0        	ld	a,(21472,x)
1882  0235 5f            	clrw	x
1883  0236 97            	ld	xl,a
1884  0237 1f04          	ldw	(OFST-1,sp),x
1886                     ; 488     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1888  0239 7b06          	ld	a,(OFST+1,sp)
1889  023b 48            	sll	a
1890  023c 5f            	clrw	x
1891  023d 97            	ld	xl,a
1892  023e d653e1        	ld	a,(21473,x)
1893  0241 6b03          	ld	(OFST-2,sp),a
1895                     ; 490     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
1897  0243 4f            	clr	a
1898  0244 1e04          	ldw	x,(OFST-1,sp)
1899  0246 02            	rlwa	x,a
1900  0247 1f01          	ldw	(OFST-4,sp),x
1902  0249 7b03          	ld	a,(OFST-2,sp)
1903  024b 97            	ld	xl,a
1904  024c a640          	ld	a,#64
1905  024e 42            	mul	x,a
1906  024f 01            	rrwa	x,a
1907  0250 1a02          	or	a,(OFST-3,sp)
1908  0252 01            	rrwa	x,a
1909  0253 1a01          	or	a,(OFST-4,sp)
1910  0255 01            	rrwa	x,a
1912  0256               L137:
1913                     ; 493   return ((uint16_t)temph);
1917  0256 5b06          	addw	sp,#6
1918  0258 81            	ret	
1982                     ; 502 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
1982                     ; 503 {
1983                     	switch	.text
1984  0259               _ADC1_GetAWDChannelStatus:
1986       00000001      OFST:	set	1
1989                     ; 504   uint8_t status = 0;
1991                     ; 507   assert_param(IS_ADC1_CHANNEL_OK(Channel));
1993                     ; 509   if (Channel < (uint8_t)8)
1995  0259 a108          	cp	a,#8
1996  025b 240f          	jruge	L367
1997                     ; 511     status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
1999  025d 5f            	clrw	x
2000  025e 97            	ld	xl,a
2001  025f a601          	ld	a,#1
2002  0261 5d            	tnzw	x
2003  0262 2704          	jreq	L611
2004  0264               L021:
2005  0264 48            	sll	a
2006  0265 5a            	decw	x
2007  0266 26fc          	jrne	L021
2008  0268               L611:
2009  0268 c4540d        	and	a,21517
2013  026b 81            	ret	
2014  026c               L367:
2015                     ; 515     status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2017  026c a008          	sub	a,#8
2018  026e 5f            	clrw	x
2019  026f 97            	ld	xl,a
2020  0270 a601          	ld	a,#1
2021  0272 5d            	tnzw	x
2022  0273 2704          	jreq	L221
2023  0275               L421:
2024  0275 48            	sll	a
2025  0276 5a            	decw	x
2026  0277 26fc          	jrne	L421
2027  0279               L221:
2028  0279 c4540c        	and	a,21516
2030                     ; 518   return ((FlagStatus)status);
2034  027c 81            	ret	
2188                     ; 527 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2188                     ; 528 {
2189                     	switch	.text
2190  027d               _ADC1_GetFlagStatus:
2192  027d 88            	push	a
2193  027e 88            	push	a
2194       00000001      OFST:	set	1
2197                     ; 529   uint8_t flagstatus = 0;
2199                     ; 530   uint8_t temp = 0;
2201                     ; 533   assert_param(IS_ADC1_FLAG_OK(Flag));
2203                     ; 535   if ((Flag & 0x0F) == 0x01)
2205  027f a40f          	and	a,#15
2206  0281 4a            	dec	a
2207  0282 2607          	jrne	L1501
2208                     ; 538     flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2210  0284 c65403        	ld	a,21507
2211  0287 a440          	and	a,#64
2214  0289 2039          	jra	L3501
2215  028b               L1501:
2216                     ; 540   else if ((Flag & 0xF0) == 0x10)
2218  028b 7b02          	ld	a,(OFST+1,sp)
2219  028d a4f0          	and	a,#240
2220  028f a110          	cp	a,#16
2221  0291 262c          	jrne	L5501
2222                     ; 543     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2224  0293 7b02          	ld	a,(OFST+1,sp)
2225  0295 a40f          	and	a,#15
2226  0297 6b01          	ld	(OFST+0,sp),a
2228                     ; 544     if (temp < 8)
2230  0299 a108          	cp	a,#8
2231  029b 2410          	jruge	L7501
2232                     ; 546       flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2234  029d 5f            	clrw	x
2235  029e 97            	ld	xl,a
2236  029f a601          	ld	a,#1
2237  02a1 5d            	tnzw	x
2238  02a2 2704          	jreq	L031
2239  02a4               L231:
2240  02a4 48            	sll	a
2241  02a5 5a            	decw	x
2242  02a6 26fc          	jrne	L231
2243  02a8               L031:
2244  02a8 c4540d        	and	a,21517
2247  02ab 2017          	jra	L3501
2248  02ad               L7501:
2249                     ; 550       flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2251  02ad a008          	sub	a,#8
2252  02af 5f            	clrw	x
2253  02b0 97            	ld	xl,a
2254  02b1 a601          	ld	a,#1
2255  02b3 5d            	tnzw	x
2256  02b4 2704          	jreq	L431
2257  02b6               L631:
2258  02b6 48            	sll	a
2259  02b7 5a            	decw	x
2260  02b8 26fc          	jrne	L631
2261  02ba               L431:
2262  02ba c4540c        	and	a,21516
2264  02bd 2005          	jra	L3501
2265  02bf               L5501:
2266                     ; 555     flagstatus = (uint8_t)(ADC1->CSR & Flag);
2268  02bf c65400        	ld	a,21504
2269  02c2 1402          	and	a,(OFST+1,sp)
2271  02c4               L3501:
2272                     ; 557   return ((FlagStatus)flagstatus);
2276  02c4 85            	popw	x
2277  02c5 81            	ret	
2319                     ; 567 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2319                     ; 568 {
2320                     	switch	.text
2321  02c6               _ADC1_ClearFlag:
2323  02c6 88            	push	a
2324  02c7 88            	push	a
2325       00000001      OFST:	set	1
2328                     ; 569   uint8_t temp = 0;
2330                     ; 572   assert_param(IS_ADC1_FLAG_OK(Flag));
2332                     ; 574   if ((Flag & 0x0F) == 0x01)
2334  02c8 a40f          	and	a,#15
2335  02ca 4a            	dec	a
2336  02cb 2606          	jrne	L5011
2337                     ; 577     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2339  02cd 721d5403      	bres	21507,#6
2341  02d1 2045          	jra	L7011
2342  02d3               L5011:
2343                     ; 579   else if ((Flag & 0xF0) == 0x10)
2345  02d3 7b02          	ld	a,(OFST+1,sp)
2346  02d5 a4f0          	and	a,#240
2347  02d7 a110          	cp	a,#16
2348  02d9 2634          	jrne	L1111
2349                     ; 582     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2351  02db 7b02          	ld	a,(OFST+1,sp)
2352  02dd a40f          	and	a,#15
2353  02df 6b01          	ld	(OFST+0,sp),a
2355                     ; 583     if (temp < 8)
2357  02e1 a108          	cp	a,#8
2358  02e3 2414          	jruge	L3111
2359                     ; 585       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2361  02e5 5f            	clrw	x
2362  02e6 97            	ld	xl,a
2363  02e7 a601          	ld	a,#1
2364  02e9 5d            	tnzw	x
2365  02ea 2704          	jreq	L241
2366  02ec               L441:
2367  02ec 48            	sll	a
2368  02ed 5a            	decw	x
2369  02ee 26fc          	jrne	L441
2370  02f0               L241:
2371  02f0 43            	cpl	a
2372  02f1 c4540d        	and	a,21517
2373  02f4 c7540d        	ld	21517,a
2375  02f7 201f          	jra	L7011
2376  02f9               L3111:
2377                     ; 589       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2379  02f9 a008          	sub	a,#8
2380  02fb 5f            	clrw	x
2381  02fc 97            	ld	xl,a
2382  02fd a601          	ld	a,#1
2383  02ff 5d            	tnzw	x
2384  0300 2704          	jreq	L641
2385  0302               L051:
2386  0302 48            	sll	a
2387  0303 5a            	decw	x
2388  0304 26fc          	jrne	L051
2389  0306               L641:
2390  0306 43            	cpl	a
2391  0307 c4540c        	and	a,21516
2392  030a c7540c        	ld	21516,a
2393  030d 2009          	jra	L7011
2394  030f               L1111:
2395                     ; 594     ADC1->CSR &= (uint8_t) (~Flag);
2397  030f 7b02          	ld	a,(OFST+1,sp)
2398  0311 43            	cpl	a
2399  0312 c45400        	and	a,21504
2400  0315 c75400        	ld	21504,a
2401  0318               L7011:
2402                     ; 596 }
2405  0318 85            	popw	x
2406  0319 81            	ret	
2459                     ; 616 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2459                     ; 617 {
2460                     	switch	.text
2461  031a               _ADC1_GetITStatus:
2463  031a 89            	pushw	x
2464  031b 88            	push	a
2465       00000001      OFST:	set	1
2468                     ; 618   ITStatus itstatus = RESET;
2470                     ; 619   uint8_t temp = 0;
2472                     ; 622   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2474                     ; 624   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2476  031c 01            	rrwa	x,a
2477  031d a4f0          	and	a,#240
2478  031f 5f            	clrw	x
2479  0320 02            	rlwa	x,a
2480  0321 a30010        	cpw	x,#16
2481  0324 262c          	jrne	L5411
2482                     ; 627     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2484  0326 7b03          	ld	a,(OFST+2,sp)
2485  0328 a40f          	and	a,#15
2486  032a 6b01          	ld	(OFST+0,sp),a
2488                     ; 628     if (temp < 8)
2490  032c a108          	cp	a,#8
2491  032e 2410          	jruge	L7411
2492                     ; 630       itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2494  0330 5f            	clrw	x
2495  0331 97            	ld	xl,a
2496  0332 a601          	ld	a,#1
2497  0334 5d            	tnzw	x
2498  0335 2704          	jreq	L451
2499  0337               L651:
2500  0337 48            	sll	a
2501  0338 5a            	decw	x
2502  0339 26fc          	jrne	L651
2503  033b               L451:
2504  033b c4540d        	and	a,21517
2507  033e 2017          	jra	L3511
2508  0340               L7411:
2509                     ; 634       itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2511  0340 a008          	sub	a,#8
2512  0342 5f            	clrw	x
2513  0343 97            	ld	xl,a
2514  0344 a601          	ld	a,#1
2515  0346 5d            	tnzw	x
2516  0347 2704          	jreq	L061
2517  0349               L261:
2518  0349 48            	sll	a
2519  034a 5a            	decw	x
2520  034b 26fc          	jrne	L261
2521  034d               L061:
2522  034d c4540c        	and	a,21516
2524  0350 2005          	jra	L3511
2525  0352               L5411:
2526                     ; 639     itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
2528  0352 c65400        	ld	a,21504
2529  0355 1403          	and	a,(OFST+2,sp)
2531  0357               L3511:
2532                     ; 641   return ((ITStatus)itstatus);
2536  0357 5b03          	addw	sp,#3
2537  0359 81            	ret	
2580                     ; 662 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2580                     ; 663 {
2581                     	switch	.text
2582  035a               _ADC1_ClearITPendingBit:
2584  035a 89            	pushw	x
2585  035b 88            	push	a
2586       00000001      OFST:	set	1
2589                     ; 664   uint8_t temp = 0;
2591                     ; 667   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2593                     ; 669   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2595  035c 01            	rrwa	x,a
2596  035d a4f0          	and	a,#240
2597  035f 5f            	clrw	x
2598  0360 02            	rlwa	x,a
2599  0361 a30010        	cpw	x,#16
2600  0364 2634          	jrne	L5711
2601                     ; 672     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2603  0366 7b03          	ld	a,(OFST+2,sp)
2604  0368 a40f          	and	a,#15
2605  036a 6b01          	ld	(OFST+0,sp),a
2607                     ; 673     if (temp < 8)
2609  036c a108          	cp	a,#8
2610  036e 2414          	jruge	L7711
2611                     ; 675       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2613  0370 5f            	clrw	x
2614  0371 97            	ld	xl,a
2615  0372 a601          	ld	a,#1
2616  0374 5d            	tnzw	x
2617  0375 2704          	jreq	L661
2618  0377               L071:
2619  0377 48            	sll	a
2620  0378 5a            	decw	x
2621  0379 26fc          	jrne	L071
2622  037b               L661:
2623  037b 43            	cpl	a
2624  037c c4540d        	and	a,21517
2625  037f c7540d        	ld	21517,a
2627  0382 201f          	jra	L3021
2628  0384               L7711:
2629                     ; 679       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2631  0384 a008          	sub	a,#8
2632  0386 5f            	clrw	x
2633  0387 97            	ld	xl,a
2634  0388 a601          	ld	a,#1
2635  038a 5d            	tnzw	x
2636  038b 2704          	jreq	L271
2637  038d               L471:
2638  038d 48            	sll	a
2639  038e 5a            	decw	x
2640  038f 26fc          	jrne	L471
2641  0391               L271:
2642  0391 43            	cpl	a
2643  0392 c4540c        	and	a,21516
2644  0395 c7540c        	ld	21516,a
2645  0398 2009          	jra	L3021
2646  039a               L5711:
2647                     ; 684     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
2649  039a 7b03          	ld	a,(OFST+2,sp)
2650  039c 43            	cpl	a
2651  039d c45400        	and	a,21504
2652  03a0 c75400        	ld	21504,a
2653  03a3               L3021:
2654                     ; 686 }
2657  03a3 5b03          	addw	sp,#3
2658  03a5 81            	ret	
2671                     	xdef	_ADC1_ClearITPendingBit
2672                     	xdef	_ADC1_GetITStatus
2673                     	xdef	_ADC1_ClearFlag
2674                     	xdef	_ADC1_GetFlagStatus
2675                     	xdef	_ADC1_GetAWDChannelStatus
2676                     	xdef	_ADC1_GetBufferValue
2677                     	xdef	_ADC1_SetLowThreshold
2678                     	xdef	_ADC1_SetHighThreshold
2679                     	xdef	_ADC1_GetConversionValue
2680                     	xdef	_ADC1_StartConversion
2681                     	xdef	_ADC1_AWDChannelConfig
2682                     	xdef	_ADC1_ExternalTriggerConfig
2683                     	xdef	_ADC1_ConversionConfig
2684                     	xdef	_ADC1_SchmittTriggerConfig
2685                     	xdef	_ADC1_PrescalerConfig
2686                     	xdef	_ADC1_ITConfig
2687                     	xdef	_ADC1_DataBufferCmd
2688                     	xdef	_ADC1_ScanModeCmd
2689                     	xdef	_ADC1_Cmd
2690                     	xdef	_ADC1_Init
2691                     	xdef	_ADC1_DeInit
2710                     	end
