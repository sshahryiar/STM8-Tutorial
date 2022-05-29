   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  14                     	switch	.data
  15  0000               __Id:
  16  0000 00000000      	dc.l	0
  17  0004               __IDE:
  18  0004 00            	dc.b	0
  19  0005               __RTR:
  20  0005 00            	dc.b	0
  21  0006               __DLC:
  22  0006 00            	dc.b	0
  23  0007               __Data:
  24  0007 00            	dc.b	0
  25  0008 000000000000  	ds.b	7
  26  000f               __FMI:
  27  000f 00            	dc.b	0
  57                     ; 62 void CAN_DeInit(void)
  57                     ; 63 {
  59                     	switch	.text
  60  0000               _CAN_DeInit:
  64                     ; 65   CAN->MCR = CAN_MCR_INRQ;
  66  0000 35015420      	mov	21536,#1
  67                     ; 66   CAN->PSR = CAN_Page_Config;
  69  0004 35065427      	mov	21543,#6
  70                     ; 67   CAN_OperatingModeRequest(CAN_OperatingMode_Initialization);
  72  0008 4f            	clr	a
  73  0009 cd088d        	call	_CAN_OperatingModeRequest
  75                     ; 68   CAN->Page.Config.ESR = CAN_ESR_RESET_VALUE;
  77  000c 725f5428      	clr	21544
  78                     ; 69   CAN->Page.Config.EIER = CAN_EIER_RESET_VALUE;
  80  0010 725f5429      	clr	21545
  81                     ; 70   CAN->Page.Config.BTR1 = CAN_BTR1_RESET_VALUE;
  83  0014 3540542c      	mov	21548,#64
  84                     ; 71   CAN->Page.Config.BTR2 = CAN_BTR2_RESET_VALUE;
  86  0018 3523542d      	mov	21549,#35
  87                     ; 72   CAN->Page.Config.FMR1 = CAN_FMR1_RESET_VALUE;
  89  001c 725f5430      	clr	21552
  90                     ; 73   CAN->Page.Config.FMR2 = CAN_FMR2_RESET_VALUE;
  92  0020 725f5431      	clr	21553
  93                     ; 74   CAN->Page.Config.FCR1 = CAN_FCR_RESET_VALUE;
  95  0024 725f5432      	clr	21554
  96                     ; 75   CAN->Page.Config.FCR2 = CAN_FCR_RESET_VALUE;
  98  0028 725f5433      	clr	21555
  99                     ; 76   CAN->Page.Config.FCR3 = CAN_FCR_RESET_VALUE;
 101  002c 725f5434      	clr	21556
 102                     ; 77   CAN_OperatingModeRequest(CAN_OperatingMode_Normal);
 104  0030 a601          	ld	a,#1
 105  0032 cd088d        	call	_CAN_OperatingModeRequest
 107                     ; 78   CAN->PSR = CAN_Page_RxFifo;
 109  0035 35075427      	mov	21543,#7
 110                     ; 79   CAN->Page.RxFIFO.MDLCR = CAN_MDLC_RESET_VALUE;
 112  0039 725f5429      	clr	21545
 113                     ; 80   CAN->PSR = CAN_Page_TxMailBox0;
 115  003d 725f5427      	clr	21543
 116                     ; 81   CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
 118  0041 725f5429      	clr	21545
 119                     ; 82   CAN->PSR = CAN_Page_TxMailBox1;
 121  0045 35015427      	mov	21543,#1
 122                     ; 83   CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
 124  0049 725f5429      	clr	21545
 125                     ; 84   CAN->PSR = CAN_Page_TxMailBox2;
 127  004d 35055427      	mov	21543,#5
 128                     ; 85   CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
 130  0051 725f5429      	clr	21545
 131                     ; 87   CAN->MCR = CAN_MCR_RESET_VALUE;
 133  0055 35025420      	mov	21536,#2
 134                     ; 88   CAN->MSR = (uint8_t)(~CAN_MSR_RESET_VALUE);/* rc_w1 */
 136  0059 35fd5421      	mov	21537,#253
 137                     ; 89   CAN->TSR = (uint8_t)(~CAN_TSR_RESET_VALUE);/* rc_w1 */
 139  005d 35ff5422      	mov	21538,#255
 140                     ; 90   CAN->RFR = (uint8_t)(~CAN_RFR_RESET_VALUE);/* rc_w1 */
 142  0061 35ff5424      	mov	21540,#255
 143                     ; 91   CAN->IER = CAN_IER_RESET_VALUE;
 145  0065 725f5425      	clr	21541
 146                     ; 92   CAN->DGR = CAN_DGR_RESET_VALUE;
 148  0069 350c5426      	mov	21542,#12
 149                     ; 93   CAN->PSR = CAN_PSR_RESET_VALUE;
 151  006d 725f5427      	clr	21543
 152                     ; 94 }
 155  0071 81            	ret
 701                     ; 106 CAN_InitStatus_TypeDef CAN_Init(CAN_MasterCtrl_TypeDef CAN_MasterCtrl,
 701                     ; 107                                 CAN_Mode_TypeDef CAN_Mode,
 701                     ; 108                                 CAN_SynJumpWidth_TypeDef CAN_SynJumpWidth,
 701                     ; 109                                 CAN_BitSeg1_TypeDef CAN_BitSeg1,
 701                     ; 110                                 CAN_BitSeg2_TypeDef CAN_BitSeg2,
 701                     ; 111                                 uint8_t CAN_Prescaler)
 701                     ; 112 {
 702                     	switch	.text
 703  0072               _CAN_Init:
 705  0072 89            	pushw	x
 706  0073 5204          	subw	sp,#4
 707       00000004      OFST:	set	4
 710                     ; 113   CAN_InitStatus_TypeDef InitStatus =  CAN_InitStatus_Failed;
 712                     ; 114   uint16_t timeout = CAN_ACKNOWLEDGE_TIMEOUT;
 714  0075 aeffff        	ldw	x,#65535
 715  0078 1f03          	ldw	(OFST-1,sp),x
 717                     ; 115   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
 719  007a cd0c47        	call	_CAN_GetSelectedPage
 721  007d 6b01          	ld	(OFST-3,sp),a
 723                     ; 119   assert_param(IS_CAN_MASTERCTRL_OK(CAN_MasterCtrl));
 725                     ; 120   assert_param(IS_CAN_MODE_OK(CAN_Mode));
 727                     ; 121   assert_param(IS_CAN_SYNJUMPWIDTH_OK(CAN_SynJumpWidth));
 729                     ; 122   assert_param(IS_CAN_BITSEG1_OK(CAN_BitSeg1));
 731                     ; 123   assert_param(IS_CAN_BITSEG2_OK(CAN_BitSeg2));
 733                     ; 124   assert_param(IS_CAN_PRESCALER_OK(CAN_Prescaler));
 735                     ; 127   CAN->MCR = CAN_MCR_INRQ;
 737  007f 35015420      	mov	21536,#1
 739  0083 2007          	jra	L103
 740  0085               L572:
 741                     ; 131     timeout--;
 743  0085 1e03          	ldw	x,(OFST-1,sp)
 744  0087 1d0001        	subw	x,#1
 745  008a 1f03          	ldw	(OFST-1,sp),x
 747  008c               L103:
 748                     ; 129   while (((uint8_t)(CAN->MSR & CAN_MSR_INAK) != 0x01) && ((uint16_t)timeout != 0))
 750  008c c65421        	ld	a,21537
 751  008f a401          	and	a,#1
 752  0091 a101          	cp	a,#1
 753  0093 2704          	jreq	L503
 755  0095 1e03          	ldw	x,(OFST-1,sp)
 756  0097 26ec          	jrne	L572
 757  0099               L503:
 758                     ; 135   if ((CAN->MSR & CAN_MSR_INAK) != CAN_MSR_INAK)
 760  0099 c65421        	ld	a,21537
 761  009c a401          	and	a,#1
 762  009e a101          	cp	a,#1
 763  00a0 270c          	jreq	L703
 764                     ; 138     InitStatus =  CAN_InitStatus_Failed;
 766  00a2 0f02          	clr	(OFST-2,sp)
 769  00a4               L113:
 770                     ; 172   CAN_SelectPage(can_page);
 772  00a4 7b01          	ld	a,(OFST-3,sp)
 773  00a6 cd0c4b        	call	_CAN_SelectPage
 775                     ; 175   return (CAN_InitStatus_TypeDef)InitStatus;
 777  00a9 7b02          	ld	a,(OFST-2,sp)
 780  00ab 5b06          	addw	sp,#6
 781  00ad 81            	ret
 782  00ae               L703:
 783                     ; 145     CAN->MCR |= (uint8_t)CAN_MasterCtrl;
 785  00ae c65420        	ld	a,21536
 786  00b1 1a05          	or	a,(OFST+1,sp)
 787  00b3 c75420        	ld	21536,a
 788                     ; 148     CAN->DGR |= (uint8_t)CAN_Mode ;
 790  00b6 c65426        	ld	a,21542
 791  00b9 1a06          	or	a,(OFST+2,sp)
 792  00bb c75426        	ld	21542,a
 793                     ; 149     CAN->PSR = CAN_Page_Config;
 795  00be 35065427      	mov	21543,#6
 796                     ; 150     CAN->Page.Config.BTR1 = (uint8_t)((uint8_t)(CAN_Prescaler - (uint8_t)1) | CAN_SynJumpWidth);
 798  00c2 7b0c          	ld	a,(OFST+8,sp)
 799  00c4 4a            	dec	a
 800  00c5 1a09          	or	a,(OFST+5,sp)
 801  00c7 c7542c        	ld	21548,a
 802                     ; 151     CAN->Page.Config.BTR2 = (uint8_t)(CAN_BitSeg1 | (uint8_t)CAN_BitSeg2);
 804  00ca 7b0a          	ld	a,(OFST+6,sp)
 805  00cc 1a0b          	or	a,(OFST+7,sp)
 806  00ce c7542d        	ld	21549,a
 807                     ; 154     CAN->MCR &= (uint8_t)(~CAN_MCR_INRQ);
 809  00d1 72115420      	bres	21536,#0
 810                     ; 156     timeout = 0xFFFF;
 812  00d5 aeffff        	ldw	x,#65535
 813  00d8 1f03          	ldw	(OFST-1,sp),x
 816  00da 2007          	jra	L713
 817  00dc               L313:
 818                     ; 159       timeout--;
 820  00dc 1e03          	ldw	x,(OFST-1,sp)
 821  00de 1d0001        	subw	x,#1
 822  00e1 1f03          	ldw	(OFST-1,sp),x
 824  00e3               L713:
 825                     ; 157     while ((((uint8_t)(CAN->MSR & CAN_MSR_INAK) == 0x01))&&(timeout != 0))
 825                     ; 158     {
 825                     ; 159       timeout--;
 827  00e3 c65421        	ld	a,21537
 828  00e6 a401          	and	a,#1
 829  00e8 a101          	cp	a,#1
 830  00ea 2604          	jrne	L323
 832  00ec 1e03          	ldw	x,(OFST-1,sp)
 833  00ee 26ec          	jrne	L313
 834  00f0               L323:
 835                     ; 162     if ((CAN->MSR & CAN_MSR_INAK) == CAN_MSR_INAK)
 837  00f0 c65421        	ld	a,21537
 838  00f3 a401          	and	a,#1
 839  00f5 a101          	cp	a,#1
 840  00f7 2604          	jrne	L523
 841                     ; 164       InitStatus = CAN_InitStatus_Failed;
 843  00f9 0f02          	clr	(OFST-2,sp)
 846  00fb 20a7          	jra	L113
 847  00fd               L523:
 848                     ; 168       InitStatus = CAN_InitStatus_Success;
 850  00fd a601          	ld	a,#1
 851  00ff 6b02          	ld	(OFST-2,sp),a
 853  0101 20a1          	jra	L113
1163                     ; 194 void CAN_FilterInit(CAN_FilterNumber_TypeDef CAN_FilterNumber,
1163                     ; 195                     FunctionalState CAN_FilterActivation,
1163                     ; 196                     CAN_FilterMode_TypeDef CAN_FilterMode,
1163                     ; 197                     CAN_FilterScale_TypeDef CAN_FilterScale,
1163                     ; 198                     uint8_t CAN_FilterID1,
1163                     ; 199                     uint8_t CAN_FilterID2,
1163                     ; 200                     uint8_t CAN_FilterID3,
1163                     ; 201                     uint8_t CAN_FilterID4,
1163                     ; 202                     uint8_t CAN_FilterIDMask1,
1163                     ; 203                     uint8_t CAN_FilterIDMask2,
1163                     ; 204                     uint8_t CAN_FilterIDMask3,
1163                     ; 205                     uint8_t CAN_FilterIDMask4)
1163                     ; 206 {
1164                     	switch	.text
1165  0103               _CAN_FilterInit:
1167  0103 89            	pushw	x
1168  0104 5205          	subw	sp,#5
1169       00000005      OFST:	set	5
1172                     ; 207   uint8_t fact = 0;
1174                     ; 208   uint8_t fsc  = 0;
1176                     ; 209   uint8_t fmhl = 0;
1178                     ; 211   CAN_Page_TypeDef can_page_filter = CAN_Page_Filter01;
1180                     ; 212   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
1182  0106 cd0c47        	call	_CAN_GetSelectedPage
1184  0109 6b01          	ld	(OFST-4,sp),a
1186                     ; 215   assert_param(IS_CAN_FILTER_NUMBER_OK(CAN_FilterNumber));
1188                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(CAN_FilterActivation));
1190                     ; 217   assert_param(IS_CAN_FILTER_MODE_OK(CAN_FilterMode));
1192                     ; 218   assert_param(IS_CAN_FILTER_SCALE_OK(CAN_FilterScale));
1194                     ; 221   if (CAN_FilterNumber == CAN_FilterNumber_0)
1196  010b 0d06          	tnz	(OFST+1,sp)
1197  010d 2610          	jrne	L105
1198                     ; 223     fact = 0x01;
1200  010f a601          	ld	a,#1
1201  0111 6b03          	ld	(OFST-2,sp),a
1203                     ; 224     fsc  = 0x00;
1205  0113 0f04          	clr	(OFST-1,sp)
1207                     ; 225     fmhl = 0x03;
1209  0115 a603          	ld	a,#3
1210  0117 6b05          	ld	(OFST+0,sp),a
1212                     ; 227     can_page_filter = CAN_Page_Filter01;
1214  0119 a602          	ld	a,#2
1215  011b 6b02          	ld	(OFST-3,sp),a
1218  011d 206c          	jra	L305
1219  011f               L105:
1220                     ; 229   else if (CAN_FilterNumber == CAN_FilterNumber_1)
1222  011f 7b06          	ld	a,(OFST+1,sp)
1223  0121 a101          	cp	a,#1
1224  0123 2612          	jrne	L505
1225                     ; 231     fact = 0x10;
1227  0125 a610          	ld	a,#16
1228  0127 6b03          	ld	(OFST-2,sp),a
1230                     ; 232     fsc  = 0x04;
1232  0129 a604          	ld	a,#4
1233  012b 6b04          	ld	(OFST-1,sp),a
1235                     ; 233     fmhl = 0x0C;
1237  012d a60c          	ld	a,#12
1238  012f 6b05          	ld	(OFST+0,sp),a
1240                     ; 235     can_page_filter = CAN_Page_Filter01;
1242  0131 a602          	ld	a,#2
1243  0133 6b02          	ld	(OFST-3,sp),a
1246  0135 2054          	jra	L305
1247  0137               L505:
1248                     ; 237   else if (CAN_FilterNumber == CAN_FilterNumber_2)
1250  0137 7b06          	ld	a,(OFST+1,sp)
1251  0139 a102          	cp	a,#2
1252  013b 2610          	jrne	L115
1253                     ; 239     fact = 0x01;
1255  013d a601          	ld	a,#1
1256  013f 6b03          	ld	(OFST-2,sp),a
1258                     ; 240     fsc  = 0x00;
1260  0141 0f04          	clr	(OFST-1,sp)
1262                     ; 241     fmhl = 0x30;
1264  0143 a630          	ld	a,#48
1265  0145 6b05          	ld	(OFST+0,sp),a
1267                     ; 243     can_page_filter = CAN_Page_Filter23;
1269  0147 a603          	ld	a,#3
1270  0149 6b02          	ld	(OFST-3,sp),a
1273  014b 203e          	jra	L305
1274  014d               L115:
1275                     ; 245   else if (CAN_FilterNumber == CAN_FilterNumber_3)
1277  014d 7b06          	ld	a,(OFST+1,sp)
1278  014f a103          	cp	a,#3
1279  0151 2612          	jrne	L515
1280                     ; 247     fact = 0x10;
1282  0153 a610          	ld	a,#16
1283  0155 6b03          	ld	(OFST-2,sp),a
1285                     ; 248     fsc  = 0x04;
1287  0157 a604          	ld	a,#4
1288  0159 6b04          	ld	(OFST-1,sp),a
1290                     ; 249     fmhl = 0xC0;
1292  015b a6c0          	ld	a,#192
1293  015d 6b05          	ld	(OFST+0,sp),a
1295                     ; 251     can_page_filter = CAN_Page_Filter23;
1297  015f a603          	ld	a,#3
1298  0161 6b02          	ld	(OFST-3,sp),a
1301  0163 2026          	jra	L305
1302  0165               L515:
1303                     ; 253   else if (CAN_FilterNumber == CAN_FilterNumber_4)
1305  0165 7b06          	ld	a,(OFST+1,sp)
1306  0167 a104          	cp	a,#4
1307  0169 2610          	jrne	L125
1308                     ; 255     fact = 0x01;
1310  016b a601          	ld	a,#1
1311  016d 6b03          	ld	(OFST-2,sp),a
1313                     ; 256     fsc  = 0x00;
1315  016f 0f04          	clr	(OFST-1,sp)
1317                     ; 257     fmhl = 0x03;
1319  0171 a603          	ld	a,#3
1320  0173 6b05          	ld	(OFST+0,sp),a
1322                     ; 259     can_page_filter = CAN_Page_Filter45;
1324  0175 a604          	ld	a,#4
1325  0177 6b02          	ld	(OFST-3,sp),a
1328  0179 2010          	jra	L305
1329  017b               L125:
1330                     ; 263     fact = 0x10;
1332  017b a610          	ld	a,#16
1333  017d 6b03          	ld	(OFST-2,sp),a
1335                     ; 264     fsc  = 0x04;
1337  017f a604          	ld	a,#4
1338  0181 6b04          	ld	(OFST-1,sp),a
1340                     ; 265     fmhl = 0x0C;
1342  0183 a60c          	ld	a,#12
1343  0185 6b05          	ld	(OFST+0,sp),a
1345                     ; 267     can_page_filter = CAN_Page_Filter45;
1347  0187 a604          	ld	a,#4
1348  0189 6b02          	ld	(OFST-3,sp),a
1350  018b               L305:
1351                     ; 271   CAN_OperatingModeRequest(CAN_OperatingMode_Initialization);
1353  018b 4f            	clr	a
1354  018c cd088d        	call	_CAN_OperatingModeRequest
1356                     ; 273   CAN->PSR = CAN_Page_Config;
1358  018f 35065427      	mov	21543,#6
1359                     ; 278   if (can_page_filter == CAN_Page_Filter01) /* FCR1 */
1361  0193 7b02          	ld	a,(OFST-3,sp)
1362  0195 a102          	cp	a,#2
1363  0197 262b          	jrne	L525
1364                     ; 281     CAN->Page.Config.FCR1 &= (uint8_t)(~(uint8_t)(fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00|CAN_FCR1_FSC01) << fsc )));
1366  0199 7b04          	ld	a,(OFST-1,sp)
1367  019b 5f            	clrw	x
1368  019c 97            	ld	xl,a
1369  019d a606          	ld	a,#6
1370  019f 5d            	tnzw	x
1371  01a0 2704          	jreq	L21
1372  01a2               L41:
1373  01a2 48            	sll	a
1374  01a3 5a            	decw	x
1375  01a4 26fc          	jrne	L41
1376  01a6               L21:
1377  01a6 1a03          	or	a,(OFST-2,sp)
1378  01a8 43            	cpl	a
1379  01a9 c45432        	and	a,21554
1380  01ac c75432        	ld	21554,a
1381                     ; 283     CAN->Page.Config.FCR1 |= (uint8_t)(CAN_FilterScale << fsc);
1383  01af 7b04          	ld	a,(OFST-1,sp)
1384  01b1 5f            	clrw	x
1385  01b2 97            	ld	xl,a
1386  01b3 7b0b          	ld	a,(OFST+6,sp)
1387  01b5 5d            	tnzw	x
1388  01b6 2704          	jreq	L61
1389  01b8               L02:
1390  01b8 48            	sll	a
1391  01b9 5a            	decw	x
1392  01ba 26fc          	jrne	L02
1393  01bc               L61:
1394  01bc ca5432        	or	a,21554
1395  01bf c75432        	ld	21554,a
1397  01c2 205a          	jra	L725
1398  01c4               L525:
1399                     ; 285   else if (can_page_filter == CAN_Page_Filter23) /* FCR2*/
1401  01c4 7b02          	ld	a,(OFST-3,sp)
1402  01c6 a103          	cp	a,#3
1403  01c8 262b          	jrne	L135
1404                     ; 288     CAN->Page.Config.FCR2 &= (uint8_t)~(uint8_t)( fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00|CAN_FCR1_FSC01) << fsc ));
1406  01ca 7b04          	ld	a,(OFST-1,sp)
1407  01cc 5f            	clrw	x
1408  01cd 97            	ld	xl,a
1409  01ce a606          	ld	a,#6
1410  01d0 5d            	tnzw	x
1411  01d1 2704          	jreq	L22
1412  01d3               L42:
1413  01d3 48            	sll	a
1414  01d4 5a            	decw	x
1415  01d5 26fc          	jrne	L42
1416  01d7               L22:
1417  01d7 1a03          	or	a,(OFST-2,sp)
1418  01d9 43            	cpl	a
1419  01da c45433        	and	a,21555
1420  01dd c75433        	ld	21555,a
1421                     ; 291     CAN->Page.Config.FCR2 |= (uint8_t)(CAN_FilterScale << fsc);
1423  01e0 7b04          	ld	a,(OFST-1,sp)
1424  01e2 5f            	clrw	x
1425  01e3 97            	ld	xl,a
1426  01e4 7b0b          	ld	a,(OFST+6,sp)
1427  01e6 5d            	tnzw	x
1428  01e7 2704          	jreq	L62
1429  01e9               L03:
1430  01e9 48            	sll	a
1431  01ea 5a            	decw	x
1432  01eb 26fc          	jrne	L03
1433  01ed               L62:
1434  01ed ca5433        	or	a,21555
1435  01f0 c75433        	ld	21555,a
1437  01f3 2029          	jra	L725
1438  01f5               L135:
1439                     ; 297     CAN->Page.Config.FCR3 &= (uint8_t)~(uint8_t)( fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00|CAN_FCR1_FSC01) << fsc ));
1441  01f5 7b04          	ld	a,(OFST-1,sp)
1442  01f7 5f            	clrw	x
1443  01f8 97            	ld	xl,a
1444  01f9 a606          	ld	a,#6
1445  01fb 5d            	tnzw	x
1446  01fc 2704          	jreq	L23
1447  01fe               L43:
1448  01fe 48            	sll	a
1449  01ff 5a            	decw	x
1450  0200 26fc          	jrne	L43
1451  0202               L23:
1452  0202 1a03          	or	a,(OFST-2,sp)
1453  0204 43            	cpl	a
1454  0205 c45434        	and	a,21556
1455  0208 c75434        	ld	21556,a
1456                     ; 300     CAN->Page.Config.FCR3 |= (uint8_t)(CAN_FilterScale << fsc);
1458  020b 7b04          	ld	a,(OFST-1,sp)
1459  020d 5f            	clrw	x
1460  020e 97            	ld	xl,a
1461  020f 7b0b          	ld	a,(OFST+6,sp)
1462  0211 5d            	tnzw	x
1463  0212 2704          	jreq	L63
1464  0214               L04:
1465  0214 48            	sll	a
1466  0215 5a            	decw	x
1467  0216 26fc          	jrne	L04
1468  0218               L63:
1469  0218 ca5434        	or	a,21556
1470  021b c75434        	ld	21556,a
1471  021e               L725:
1472                     ; 306   if (can_page_filter != CAN_Page_Filter45) /* FMR1*/
1474  021e 7b02          	ld	a,(OFST-3,sp)
1475  0220 a104          	cp	a,#4
1476  0222 273d          	jreq	L535
1477                     ; 309     if (CAN_FilterMode == CAN_FilterMode_IdMask)
1479  0224 0d0a          	tnz	(OFST+5,sp)
1480  0226 260b          	jrne	L735
1481                     ; 312       CAN->Page.Config.FMR1 &= (uint8_t)~(fmhl);
1483  0228 7b05          	ld	a,(OFST+0,sp)
1484  022a 43            	cpl	a
1485  022b c45430        	and	a,21552
1486  022e c75430        	ld	21552,a
1488  0231 2069          	jra	L355
1489  0233               L735:
1490                     ; 314     else if ( CAN_FilterMode == CAN_FilterMode_IdList)
1492  0233 7b0a          	ld	a,(OFST+5,sp)
1493  0235 a101          	cp	a,#1
1494  0237 260a          	jrne	L345
1495                     ; 317       CAN->Page.Config.FMR1 |= (uint8_t)(fmhl);
1497  0239 c65430        	ld	a,21552
1498  023c 1a05          	or	a,(OFST+0,sp)
1499  023e c75430        	ld	21552,a
1501  0241 2059          	jra	L355
1502  0243               L345:
1503                     ; 319     else if ( CAN_FilterMode == CAN_FilterMode_IdList_IdMask)
1505  0243 7b0a          	ld	a,(OFST+5,sp)
1506  0245 a111          	cp	a,#17
1507  0247 260c          	jrne	L745
1508                     ; 322       CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDLIST_IDMASK_MASK);
1510  0249 7b05          	ld	a,(OFST+0,sp)
1511  024b a455          	and	a,#85
1512  024d ca5430        	or	a,21552
1513  0250 c75430        	ld	21552,a
1515  0253 2047          	jra	L355
1516  0255               L745:
1517                     ; 327       CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDMASK_IDLIST_MASK);
1519  0255 7b05          	ld	a,(OFST+0,sp)
1520  0257 a4aa          	and	a,#170
1521  0259 ca5430        	or	a,21552
1522  025c c75430        	ld	21552,a
1523  025f 203b          	jra	L355
1524  0261               L535:
1525                     ; 336     if (CAN_FilterMode == CAN_FilterMode_IdMask)
1527  0261 0d0a          	tnz	(OFST+5,sp)
1528  0263 260b          	jrne	L555
1529                     ; 339       CAN->Page.Config.FMR2 &= (uint8_t)~(fmhl);
1531  0265 7b05          	ld	a,(OFST+0,sp)
1532  0267 43            	cpl	a
1533  0268 c45431        	and	a,21553
1534  026b c75431        	ld	21553,a
1536  026e 202c          	jra	L355
1537  0270               L555:
1538                     ; 341     else if ( CAN_FilterMode == CAN_FilterMode_IdList)
1540  0270 7b0a          	ld	a,(OFST+5,sp)
1541  0272 a101          	cp	a,#1
1542  0274 260a          	jrne	L165
1543                     ; 344       CAN->Page.Config.FMR2 |= (uint8_t)(fmhl);
1545  0276 c65431        	ld	a,21553
1546  0279 1a05          	or	a,(OFST+0,sp)
1547  027b c75431        	ld	21553,a
1549  027e 201c          	jra	L355
1550  0280               L165:
1551                     ; 346     else if ( CAN_FilterMode == CAN_FilterMode_IdList_IdMask)
1553  0280 7b0a          	ld	a,(OFST+5,sp)
1554  0282 a111          	cp	a,#17
1555  0284 260c          	jrne	L565
1556                     ; 349       CAN->Page.Config.FMR2 |= (uint8_t)(fmhl & CAN_IDLIST_IDMASK_MASK);
1558  0286 7b05          	ld	a,(OFST+0,sp)
1559  0288 a455          	and	a,#85
1560  028a ca5431        	or	a,21553
1561  028d c75431        	ld	21553,a
1563  0290 200a          	jra	L355
1564  0292               L565:
1565                     ; 354       CAN->Page.Config.FMR2 |= (uint8_t)(fmhl & CAN_IDMASK_IDLIST_MASK);
1567  0292 7b05          	ld	a,(OFST+0,sp)
1568  0294 a4aa          	and	a,#170
1569  0296 ca5431        	or	a,21553
1570  0299 c75431        	ld	21553,a
1571  029c               L355:
1572                     ; 360   CAN->PSR = (uint8_t)can_page_filter;
1574  029c 7b02          	ld	a,(OFST-3,sp)
1575  029e c75427        	ld	21543,a
1576                     ; 361   if (fsc != 0)
1578  02a1 0d04          	tnz	(OFST-1,sp)
1579  02a3 2603          	jrne	L24
1580  02a5 cc0371        	jp	L175
1581  02a8               L24:
1582                     ; 364     if (CAN_FilterScale == CAN_FilterScale_8Bit)
1584  02a8 0d0b          	tnz	(OFST+6,sp)
1585  02aa 262c          	jrne	L375
1586                     ; 366       CAN->Page.Filter.FR09 = CAN_FilterID1;
1588  02ac 7b0c          	ld	a,(OFST+7,sp)
1589  02ae c75430        	ld	21552,a
1590                     ; 367       CAN->Page.Filter.FR10 = CAN_FilterIDMask1;
1592  02b1 7b10          	ld	a,(OFST+11,sp)
1593  02b3 c75431        	ld	21553,a
1594                     ; 368       CAN->Page.Filter.FR11 = CAN_FilterID2;
1596  02b6 7b0d          	ld	a,(OFST+8,sp)
1597  02b8 c75432        	ld	21554,a
1598                     ; 369       CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
1600  02bb 7b11          	ld	a,(OFST+12,sp)
1601  02bd c75433        	ld	21555,a
1602                     ; 370       CAN->Page.Filter.FR13 = CAN_FilterID3;
1604  02c0 7b0e          	ld	a,(OFST+9,sp)
1605  02c2 c75434        	ld	21556,a
1606                     ; 371       CAN->Page.Filter.FR14 = CAN_FilterIDMask3;
1608  02c5 7b12          	ld	a,(OFST+13,sp)
1609  02c7 c75435        	ld	21557,a
1610                     ; 372       CAN->Page.Filter.FR15 = CAN_FilterID4;
1612  02ca 7b0f          	ld	a,(OFST+10,sp)
1613  02cc c75436        	ld	21558,a
1614                     ; 373       CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1616  02cf 7b13          	ld	a,(OFST+14,sp)
1617  02d1 c75437        	ld	21559,a
1619  02d4 ac2f042f      	jpf	L116
1620  02d8               L375:
1621                     ; 375     else if (CAN_FilterScale == CAN_FilterScale_16_8Bit)
1623  02d8 7b0b          	ld	a,(OFST+6,sp)
1624  02da a102          	cp	a,#2
1625  02dc 262c          	jrne	L775
1626                     ; 377       CAN->Page.Filter.FR09 = CAN_FilterID1;
1628  02de 7b0c          	ld	a,(OFST+7,sp)
1629  02e0 c75430        	ld	21552,a
1630                     ; 378       CAN->Page.Filter.FR10 = CAN_FilterID2;
1632  02e3 7b0d          	ld	a,(OFST+8,sp)
1633  02e5 c75431        	ld	21553,a
1634                     ; 379       CAN->Page.Filter.FR11 = CAN_FilterIDMask1;
1636  02e8 7b10          	ld	a,(OFST+11,sp)
1637  02ea c75432        	ld	21554,a
1638                     ; 380       CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
1640  02ed 7b11          	ld	a,(OFST+12,sp)
1641  02ef c75433        	ld	21555,a
1642                     ; 381       CAN->Page.Filter.FR13 = CAN_FilterID3;
1644  02f2 7b0e          	ld	a,(OFST+9,sp)
1645  02f4 c75434        	ld	21556,a
1646                     ; 382       CAN->Page.Filter.FR14 = CAN_FilterIDMask3;
1648  02f7 7b12          	ld	a,(OFST+13,sp)
1649  02f9 c75435        	ld	21557,a
1650                     ; 383       CAN->Page.Filter.FR15 = CAN_FilterID4;
1652  02fc 7b0f          	ld	a,(OFST+10,sp)
1653  02fe c75436        	ld	21558,a
1654                     ; 384       CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1656  0301 7b13          	ld	a,(OFST+14,sp)
1657  0303 c75437        	ld	21559,a
1659  0306 ac2f042f      	jpf	L116
1660  030a               L775:
1661                     ; 386     else if (CAN_FilterScale == CAN_FilterScale_16Bit)
1663  030a 7b0b          	ld	a,(OFST+6,sp)
1664  030c a104          	cp	a,#4
1665  030e 262c          	jrne	L306
1666                     ; 388       CAN->Page.Filter.FR09 = CAN_FilterID1;
1668  0310 7b0c          	ld	a,(OFST+7,sp)
1669  0312 c75430        	ld	21552,a
1670                     ; 389       CAN->Page.Filter.FR10 = CAN_FilterID2;
1672  0315 7b0d          	ld	a,(OFST+8,sp)
1673  0317 c75431        	ld	21553,a
1674                     ; 390       CAN->Page.Filter.FR11 = CAN_FilterIDMask1;
1676  031a 7b10          	ld	a,(OFST+11,sp)
1677  031c c75432        	ld	21554,a
1678                     ; 391       CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
1680  031f 7b11          	ld	a,(OFST+12,sp)
1681  0321 c75433        	ld	21555,a
1682                     ; 392       CAN->Page.Filter.FR13 = CAN_FilterID3;
1684  0324 7b0e          	ld	a,(OFST+9,sp)
1685  0326 c75434        	ld	21556,a
1686                     ; 393       CAN->Page.Filter.FR14 = CAN_FilterID4;
1688  0329 7b0f          	ld	a,(OFST+10,sp)
1689  032b c75435        	ld	21557,a
1690                     ; 394       CAN->Page.Filter.FR15 = CAN_FilterIDMask3;
1692  032e 7b12          	ld	a,(OFST+13,sp)
1693  0330 c75436        	ld	21558,a
1694                     ; 395       CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1696  0333 7b13          	ld	a,(OFST+14,sp)
1697  0335 c75437        	ld	21559,a
1699  0338 ac2f042f      	jpf	L116
1700  033c               L306:
1701                     ; 397     else if (CAN_FilterScale == CAN_FilterScale_32Bit)
1703  033c 7b0b          	ld	a,(OFST+6,sp)
1704  033e a106          	cp	a,#6
1705  0340 2703          	jreq	L44
1706  0342 cc042f        	jp	L116
1707  0345               L44:
1708                     ; 399       CAN->Page.Filter.FR09 = CAN_FilterID1;
1710  0345 7b0c          	ld	a,(OFST+7,sp)
1711  0347 c75430        	ld	21552,a
1712                     ; 400       CAN->Page.Filter.FR10 = CAN_FilterID2;
1714  034a 7b0d          	ld	a,(OFST+8,sp)
1715  034c c75431        	ld	21553,a
1716                     ; 401       CAN->Page.Filter.FR11 = CAN_FilterID3;
1718  034f 7b0e          	ld	a,(OFST+9,sp)
1719  0351 c75432        	ld	21554,a
1720                     ; 402       CAN->Page.Filter.FR12 = CAN_FilterID4;
1722  0354 7b0f          	ld	a,(OFST+10,sp)
1723  0356 c75433        	ld	21555,a
1724                     ; 403       CAN->Page.Filter.FR13 = CAN_FilterIDMask1;
1726  0359 7b10          	ld	a,(OFST+11,sp)
1727  035b c75434        	ld	21556,a
1728                     ; 404       CAN->Page.Filter.FR14 = CAN_FilterIDMask2;
1730  035e 7b11          	ld	a,(OFST+12,sp)
1731  0360 c75435        	ld	21557,a
1732                     ; 405       CAN->Page.Filter.FR15 = CAN_FilterIDMask3;
1734  0363 7b12          	ld	a,(OFST+13,sp)
1735  0365 c75436        	ld	21558,a
1736                     ; 406       CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1738  0368 7b13          	ld	a,(OFST+14,sp)
1739  036a c75437        	ld	21559,a
1740  036d ac2f042f      	jpf	L116
1741  0371               L175:
1742                     ; 412     if (CAN_FilterScale == CAN_FilterScale_8Bit)
1744  0371 0d0b          	tnz	(OFST+6,sp)
1745  0373 262c          	jrne	L316
1746                     ; 414       CAN->Page.Filter.FR01 = CAN_FilterID1;
1748  0375 7b0c          	ld	a,(OFST+7,sp)
1749  0377 c75428        	ld	21544,a
1750                     ; 415       CAN->Page.Filter.FR02 = CAN_FilterIDMask1;
1752  037a 7b10          	ld	a,(OFST+11,sp)
1753  037c c75429        	ld	21545,a
1754                     ; 416       CAN->Page.Filter.FR03 = CAN_FilterID2;
1756  037f 7b0d          	ld	a,(OFST+8,sp)
1757  0381 c7542a        	ld	21546,a
1758                     ; 417       CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
1760  0384 7b11          	ld	a,(OFST+12,sp)
1761  0386 c7542b        	ld	21547,a
1762                     ; 418       CAN->Page.Filter.FR05 = CAN_FilterID3;
1764  0389 7b0e          	ld	a,(OFST+9,sp)
1765  038b c7542c        	ld	21548,a
1766                     ; 419       CAN->Page.Filter.FR06 = CAN_FilterIDMask3;
1768  038e 7b12          	ld	a,(OFST+13,sp)
1769  0390 c7542d        	ld	21549,a
1770                     ; 420       CAN->Page.Filter.FR07 = CAN_FilterID4;
1772  0393 7b0f          	ld	a,(OFST+10,sp)
1773  0395 c7542e        	ld	21550,a
1774                     ; 421       CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
1776  0398 7b13          	ld	a,(OFST+14,sp)
1777  039a c7542f        	ld	21551,a
1779  039d ac2f042f      	jpf	L116
1780  03a1               L316:
1781                     ; 423     else if (CAN_FilterScale == CAN_FilterScale_16_8Bit)
1783  03a1 7b0b          	ld	a,(OFST+6,sp)
1784  03a3 a102          	cp	a,#2
1785  03a5 262a          	jrne	L716
1786                     ; 425       CAN->Page.Filter.FR01 = CAN_FilterID1;
1788  03a7 7b0c          	ld	a,(OFST+7,sp)
1789  03a9 c75428        	ld	21544,a
1790                     ; 426       CAN->Page.Filter.FR02 = CAN_FilterID2;
1792  03ac 7b0d          	ld	a,(OFST+8,sp)
1793  03ae c75429        	ld	21545,a
1794                     ; 427       CAN->Page.Filter.FR03 = CAN_FilterIDMask1;
1796  03b1 7b10          	ld	a,(OFST+11,sp)
1797  03b3 c7542a        	ld	21546,a
1798                     ; 428       CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
1800  03b6 7b11          	ld	a,(OFST+12,sp)
1801  03b8 c7542b        	ld	21547,a
1802                     ; 429       CAN->Page.Filter.FR05 = CAN_FilterID3;
1804  03bb 7b0e          	ld	a,(OFST+9,sp)
1805  03bd c7542c        	ld	21548,a
1806                     ; 430       CAN->Page.Filter.FR06 = CAN_FilterIDMask3;
1808  03c0 7b12          	ld	a,(OFST+13,sp)
1809  03c2 c7542d        	ld	21549,a
1810                     ; 431       CAN->Page.Filter.FR07 = CAN_FilterID4;
1812  03c5 7b0f          	ld	a,(OFST+10,sp)
1813  03c7 c7542e        	ld	21550,a
1814                     ; 432       CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
1816  03ca 7b13          	ld	a,(OFST+14,sp)
1817  03cc c7542f        	ld	21551,a
1819  03cf 205e          	jra	L116
1820  03d1               L716:
1821                     ; 434     else if (CAN_FilterScale == CAN_FilterScale_16Bit)
1823  03d1 7b0b          	ld	a,(OFST+6,sp)
1824  03d3 a104          	cp	a,#4
1825  03d5 262a          	jrne	L326
1826                     ; 436       CAN->Page.Filter.FR01 = CAN_FilterID1;
1828  03d7 7b0c          	ld	a,(OFST+7,sp)
1829  03d9 c75428        	ld	21544,a
1830                     ; 437       CAN->Page.Filter.FR02 = CAN_FilterID2;
1832  03dc 7b0d          	ld	a,(OFST+8,sp)
1833  03de c75429        	ld	21545,a
1834                     ; 438       CAN->Page.Filter.FR03 = CAN_FilterIDMask1;
1836  03e1 7b10          	ld	a,(OFST+11,sp)
1837  03e3 c7542a        	ld	21546,a
1838                     ; 439       CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
1840  03e6 7b11          	ld	a,(OFST+12,sp)
1841  03e8 c7542b        	ld	21547,a
1842                     ; 440       CAN->Page.Filter.FR05 = CAN_FilterID3;
1844  03eb 7b0e          	ld	a,(OFST+9,sp)
1845  03ed c7542c        	ld	21548,a
1846                     ; 441       CAN->Page.Filter.FR06 = CAN_FilterID4;
1848  03f0 7b0f          	ld	a,(OFST+10,sp)
1849  03f2 c7542d        	ld	21549,a
1850                     ; 442       CAN->Page.Filter.FR07 = CAN_FilterIDMask3;
1852  03f5 7b12          	ld	a,(OFST+13,sp)
1853  03f7 c7542e        	ld	21550,a
1854                     ; 443       CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
1856  03fa 7b13          	ld	a,(OFST+14,sp)
1857  03fc c7542f        	ld	21551,a
1859  03ff 202e          	jra	L116
1860  0401               L326:
1861                     ; 445     else if (CAN_FilterScale == CAN_FilterScale_32Bit)
1863  0401 7b0b          	ld	a,(OFST+6,sp)
1864  0403 a106          	cp	a,#6
1865  0405 2628          	jrne	L116
1866                     ; 447       CAN->Page.Filter.FR01 = CAN_FilterID1;
1868  0407 7b0c          	ld	a,(OFST+7,sp)
1869  0409 c75428        	ld	21544,a
1870                     ; 448       CAN->Page.Filter.FR02 = CAN_FilterID2;
1872  040c 7b0d          	ld	a,(OFST+8,sp)
1873  040e c75429        	ld	21545,a
1874                     ; 449       CAN->Page.Filter.FR03 = CAN_FilterID3;
1876  0411 7b0e          	ld	a,(OFST+9,sp)
1877  0413 c7542a        	ld	21546,a
1878                     ; 450       CAN->Page.Filter.FR04 = CAN_FilterID4;
1880  0416 7b0f          	ld	a,(OFST+10,sp)
1881  0418 c7542b        	ld	21547,a
1882                     ; 451       CAN->Page.Filter.FR05 = CAN_FilterIDMask1;
1884  041b 7b10          	ld	a,(OFST+11,sp)
1885  041d c7542c        	ld	21548,a
1886                     ; 452       CAN->Page.Filter.FR06 = CAN_FilterIDMask2;
1888  0420 7b11          	ld	a,(OFST+12,sp)
1889  0422 c7542d        	ld	21549,a
1890                     ; 453       CAN->Page.Filter.FR07 = CAN_FilterIDMask3;
1892  0425 7b12          	ld	a,(OFST+13,sp)
1893  0427 c7542e        	ld	21550,a
1894                     ; 454       CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
1896  042a 7b13          	ld	a,(OFST+14,sp)
1897  042c c7542f        	ld	21551,a
1898  042f               L116:
1899                     ; 463   CAN->PSR = CAN_Page_Config;
1901  042f 35065427      	mov	21543,#6
1902                     ; 464   if (CAN_FilterActivation != DISABLE)
1904  0433 0d07          	tnz	(OFST+2,sp)
1905  0435 272a          	jreq	L136
1906                     ; 466     if ((CAN_FilterNumber & 0x06) == 0x00) /* FCR1*/
1908  0437 7b06          	ld	a,(OFST+1,sp)
1909  0439 a506          	bcp	a,#6
1910  043b 260a          	jrne	L336
1911                     ; 467     {   CAN->Page.Config.FCR1 |= (uint8_t)fact;
1913  043d c65432        	ld	a,21554
1914  0440 1a03          	or	a,(OFST-2,sp)
1915  0442 c75432        	ld	21554,a
1917  0445 201a          	jra	L136
1918  0447               L336:
1919                     ; 469     else if ((CAN_FilterNumber & 0x06) == 0x02) /*FCR2*/
1921  0447 7b06          	ld	a,(OFST+1,sp)
1922  0449 a406          	and	a,#6
1923  044b a102          	cp	a,#2
1924  044d 260a          	jrne	L736
1925                     ; 470     { CAN->Page.Config.FCR2 |= (uint8_t)fact;
1927  044f c65433        	ld	a,21555
1928  0452 1a03          	or	a,(OFST-2,sp)
1929  0454 c75433        	ld	21555,a
1931  0457 2008          	jra	L136
1932  0459               L736:
1933                     ; 473     { CAN->Page.Config.FCR3 |= (uint8_t)fact;
1935  0459 c65434        	ld	a,21556
1936  045c 1a03          	or	a,(OFST-2,sp)
1937  045e c75434        	ld	21556,a
1938  0461               L136:
1939                     ; 476   CAN_OperatingModeRequest(CAN_OperatingMode_Normal);
1941  0461 a601          	ld	a,#1
1942  0463 cd088d        	call	_CAN_OperatingModeRequest
1944                     ; 478   CAN_SelectPage(can_page);
1946  0466 7b01          	ld	a,(OFST-4,sp)
1947  0468 cd0c4b        	call	_CAN_SelectPage
1949                     ; 479 }
1952  046b 5b07          	addw	sp,#7
1953  046d 81            	ret
2093                     ; 487 void CAN_ITConfig(CAN_IT_TypeDef CAN_IT, FunctionalState NewState)
2093                     ; 488 {
2094                     	switch	.text
2095  046e               _CAN_ITConfig:
2097  046e 89            	pushw	x
2098  046f 5203          	subw	sp,#3
2099       00000003      OFST:	set	3
2102                     ; 489   uint8_t tmperrorinterrupt = 0;
2104                     ; 490   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
2106  0471 cd0c47        	call	_CAN_GetSelectedPage
2108  0474 6b02          	ld	(OFST-1,sp),a
2110                     ; 494   assert_param(IS_CAN_IT_CONFIG_OK(CAN_IT));
2112                     ; 495   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2114                     ; 497   tmperrorinterrupt = (uint8_t)(((uint16_t)CAN_IT) >>7);
2116  0476 1e04          	ldw	x,(OFST+1,sp)
2117  0478 4f            	clr	a
2118  0479 01            	rrwa	x,a
2119  047a 48            	sll	a
2120  047b 59            	rlcw	x
2121  047c 9f            	ld	a,xl
2122  047d 6b03          	ld	(OFST+0,sp),a
2124                     ; 498   tmperrorinterrupt = (uint8_t)((uint8_t)((uint16_t)tmperrorinterrupt & 0xF0) | 
2124                     ; 499                                 (uint8_t)((uint8_t)((uint16_t)tmperrorinterrupt & 0x0F) >>1));
2126  047f 7b03          	ld	a,(OFST+0,sp)
2127  0481 a40f          	and	a,#15
2128  0483 44            	srl	a
2129  0484 6b01          	ld	(OFST-2,sp),a
2131  0486 7b03          	ld	a,(OFST+0,sp)
2132  0488 a4f0          	and	a,#240
2133  048a 1a01          	or	a,(OFST-2,sp)
2134  048c 6b03          	ld	(OFST+0,sp),a
2136                     ; 501   CAN->PSR = CAN_Page_Config;
2138  048e 35065427      	mov	21543,#6
2139                     ; 502   if (NewState != DISABLE)
2141  0492 0d08          	tnz	(OFST+5,sp)
2142  0494 2712          	jreq	L327
2143                     ; 505     CAN->IER |= (uint8_t)(CAN_IT);
2145  0496 c65425        	ld	a,21541
2146  0499 1a05          	or	a,(OFST+2,sp)
2147  049b c75425        	ld	21541,a
2148                     ; 506     CAN->Page.Config.EIER |= (uint8_t)(tmperrorinterrupt);
2150  049e c65429        	ld	a,21545
2151  04a1 1a03          	or	a,(OFST+0,sp)
2152  04a3 c75429        	ld	21545,a
2154  04a6 2012          	jra	L527
2155  04a8               L327:
2156                     ; 511     CAN->IER &= (uint8_t)~(uint8_t)((uint16_t)CAN_IT);
2158  04a8 7b05          	ld	a,(OFST+2,sp)
2159  04aa 43            	cpl	a
2160  04ab c45425        	and	a,21541
2161  04ae c75425        	ld	21541,a
2162                     ; 512     CAN->Page.Config.EIER &= (uint8_t)~(tmperrorinterrupt);
2164  04b1 7b03          	ld	a,(OFST+0,sp)
2165  04b3 43            	cpl	a
2166  04b4 c45429        	and	a,21545
2167  04b7 c75429        	ld	21545,a
2168  04ba               L527:
2169                     ; 515   CAN_SelectPage(can_page);
2171  04ba 7b02          	ld	a,(OFST-1,sp)
2172  04bc cd0c4b        	call	_CAN_SelectPage
2174                     ; 516 }
2177  04bf 5b05          	addw	sp,#5
2178  04c1 81            	ret
2237                     ; 525 void CAN_ST7CompatibilityCmd(CAN_ST7Compatibility_TypeDef CAN_ST7Compatibility)
2237                     ; 526 {
2238                     	switch	.text
2239  04c2               _CAN_ST7CompatibilityCmd:
2243                     ; 528   assert_param(IS_CAN_ST7_COMPATIBILITY_OK(CAN_ST7Compatibility));
2245                     ; 530   CAN->DGR &= (uint8_t)(~CAN_DGR_TXM2E);
2247  04c2 72195426      	bres	21542,#4
2248                     ; 533   CAN->DGR |= (uint8_t)CAN_ST7Compatibility;
2250  04c6 ca5426        	or	a,21542
2251  04c9 c75426        	ld	21542,a
2252                     ; 534 }
2255  04cc 81            	ret
2302                     ; 541 void CAN_TTComModeCmd(FunctionalState NewState)
2302                     ; 542 {
2303                     	switch	.text
2304  04cd               _CAN_TTComModeCmd:
2306  04cd 88            	push	a
2307  04ce 88            	push	a
2308       00000001      OFST:	set	1
2311                     ; 543   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
2313  04cf cd0c47        	call	_CAN_GetSelectedPage
2315  04d2 6b01          	ld	(OFST+0,sp),a
2317                     ; 545   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2319                     ; 546   if (NewState != DISABLE)
2321  04d4 0d02          	tnz	(OFST+1,sp)
2322  04d6 2726          	jreq	L777
2323                     ; 549     CAN->MCR |= CAN_MCR_TTCM;
2325  04d8 721e5420      	bset	21536,#7
2326                     ; 551     CAN->PSR = CAN_Page_TxMailBox0;
2328  04dc 725f5427      	clr	21543
2329                     ; 552     CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
2331  04e0 721e5429      	bset	21545,#7
2332                     ; 553     CAN->PSR = CAN_Page_TxMailBox1;
2334  04e4 35015427      	mov	21543,#1
2335                     ; 554     CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
2337  04e8 721e5429      	bset	21545,#7
2338                     ; 555     CAN->PSR = CAN_Page_TxMailBox2;
2340  04ec 35055427      	mov	21543,#5
2341                     ; 556     CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
2343  04f0 721e5429      	bset	21545,#7
2344                     ; 557     CAN->PSR = CAN_Page_RxFifo;
2346  04f4 35075427      	mov	21543,#7
2347                     ; 558     CAN->Page.RxFIFO.MDLCR |= CAN_MDLCR_TGT;
2349  04f8 721e5429      	bset	21545,#7
2351  04fc 2024          	jra	L1001
2352  04fe               L777:
2353                     ; 563     CAN->MCR &= ((uint8_t)~CAN_MCR_TTCM);
2355  04fe 721f5420      	bres	21536,#7
2356                     ; 565     CAN->PSR = CAN_Page_TxMailBox0;
2358  0502 725f5427      	clr	21543
2359                     ; 566     CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2361  0506 721f5429      	bres	21545,#7
2362                     ; 567     CAN->PSR = CAN_Page_TxMailBox1;
2364  050a 35015427      	mov	21543,#1
2365                     ; 568     CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2367  050e 721f5429      	bres	21545,#7
2368                     ; 569     CAN->PSR = CAN_Page_TxMailBox2;
2370  0512 35055427      	mov	21543,#5
2371                     ; 570     CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2373  0516 721f5429      	bres	21545,#7
2374                     ; 571     CAN->PSR = CAN_Page_RxFifo;
2376  051a 35075427      	mov	21543,#7
2377                     ; 572     CAN->Page.RxFIFO.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2379  051e 721f5429      	bres	21545,#7
2380  0522               L1001:
2381                     ; 575   CAN_SelectPage(can_page);
2383  0522 7b01          	ld	a,(OFST+0,sp)
2384  0524 cd0c4b        	call	_CAN_SelectPage
2386                     ; 576 }
2389  0527 85            	popw	x
2390  0528 81            	ret
2591                     ; 587 CAN_TxStatus_TypeDef CAN_Transmit(uint32_t CAN_Id,
2591                     ; 588                                   CAN_Id_TypeDef CAN_IDE,
2591                     ; 589                                   CAN_RTR_TypeDef CAN_RTR,
2591                     ; 590                                   uint8_t CAN_DLC,
2591                     ; 591                                   uint8_t *CAN_Data)
2591                     ; 592 {
2592                     	switch	.text
2593  0529               _CAN_Transmit:
2595  0529 5206          	subw	sp,#6
2596       00000006      OFST:	set	6
2599                     ; 593   CAN_TxStatus_TypeDef CAN_TxStatus = CAN_TxStatus_NoMailBox;
2601                     ; 594   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
2603  052b cd0c47        	call	_CAN_GetSelectedPage
2605  052e 6b05          	ld	(OFST-1,sp),a
2607                     ; 596   assert_param(IS_CAN_IDTYPE_OK(CAN_IDE));
2609                     ; 597   if (CAN_IDE != CAN_Id_Standard)
2611  0530 0d0d          	tnz	(OFST+7,sp)
2612  0532 2700          	jreq	L1111
2613                     ; 599     assert_param(IS_CAN_EXTID_OK(CAN_Id));
2616  0534               L1111:
2617                     ; 603     assert_param(IS_CAN_STDID_OK(CAN_Id));
2619                     ; 605   assert_param(IS_CAN_RTR_OK(CAN_RTR));
2621                     ; 606   assert_param(IS_CAN_DLC_OK(CAN_DLC));
2623                     ; 608   if ((CAN->TPR & CAN_TPR_TME0) == CAN_TPR_TME0)
2625  0534 c65423        	ld	a,21539
2626  0537 a404          	and	a,#4
2627  0539 a104          	cp	a,#4
2628  053b 2604          	jrne	L5111
2629                     ; 610     CAN_TxStatus = CAN_TxStatus_MailBox0Ok;
2631  053d 0f06          	clr	(OFST+0,sp)
2634  053f 2022          	jra	L7111
2635  0541               L5111:
2636                     ; 612   else if ((CAN->TPR & CAN_TPR_TME1) == CAN_TPR_TME1)
2638  0541 c65423        	ld	a,21539
2639  0544 a408          	and	a,#8
2640  0546 a108          	cp	a,#8
2641  0548 2606          	jrne	L1211
2642                     ; 614     CAN_TxStatus = CAN_TxStatus_MailBox1Ok;
2644  054a a601          	ld	a,#1
2645  054c 6b06          	ld	(OFST+0,sp),a
2648  054e 2013          	jra	L7111
2649  0550               L1211:
2650                     ; 616   else if ((CAN->TPR & CAN_TPR_TME2) == CAN_TPR_TME2)
2652  0550 c65423        	ld	a,21539
2653  0553 a410          	and	a,#16
2654  0555 a110          	cp	a,#16
2655  0557 2606          	jrne	L5211
2656                     ; 618     CAN_TxStatus = CAN_TxStatus_MailBox2Ok;
2658  0559 a605          	ld	a,#5
2659  055b 6b06          	ld	(OFST+0,sp),a
2662  055d 2004          	jra	L7111
2663  055f               L5211:
2664                     ; 622     CAN_TxStatus = CAN_TxStatus_NoMailBox;
2666  055f a6f4          	ld	a,#244
2667  0561 6b06          	ld	(OFST+0,sp),a
2669  0563               L7111:
2670                     ; 624   if (CAN_TxStatus != CAN_TxStatus_NoMailBox)
2672  0563 7b06          	ld	a,(OFST+0,sp)
2673  0565 a1f4          	cp	a,#244
2674  0567 2603          	jrne	L65
2675  0569 cc0635        	jp	L1311
2676  056c               L65:
2677                     ; 626     CAN->PSR = (uint8_t)CAN_TxStatus;
2679  056c 7b06          	ld	a,(OFST+0,sp)
2680  056e c75427        	ld	21543,a
2681                     ; 628     if (CAN_IDE != CAN_Id_Standard)
2683  0571 0d0d          	tnz	(OFST+7,sp)
2684  0573 273b          	jreq	L3311
2685                     ; 630       CAN_Id &= (uint32_t)CAN_EXTID_SIZE;
2687  0575 7b09          	ld	a,(OFST+3,sp)
2688  0577 a41f          	and	a,#31
2689  0579 6b09          	ld	(OFST+3,sp),a
2690                     ; 631       CAN->Page.TxMailbox.MIDR4 = (uint8_t)(CAN_Id);
2692  057b 7b0c          	ld	a,(OFST+6,sp)
2693  057d c7542d        	ld	21549,a
2694                     ; 632       CAN_Id = CAN_Id>>8;
2696  0580 96            	ldw	x,sp
2697  0581 1c0009        	addw	x,#OFST+3
2698  0584 a608          	ld	a,#8
2699  0586 cd0000        	call	c_lgursh
2701                     ; 633       CAN->Page.TxMailbox.MIDR3 = (uint8_t)(CAN_Id);
2703  0589 7b0c          	ld	a,(OFST+6,sp)
2704  058b c7542c        	ld	21548,a
2705                     ; 634       CAN_Id = CAN_Id>>8;
2707  058e 96            	ldw	x,sp
2708  058f 1c0009        	addw	x,#OFST+3
2709  0592 a608          	ld	a,#8
2710  0594 cd0000        	call	c_lgursh
2712                     ; 635       CAN->Page.TxMailbox.MIDR2 = (uint8_t)(CAN_Id);
2714  0597 7b0c          	ld	a,(OFST+6,sp)
2715  0599 c7542b        	ld	21547,a
2716                     ; 636       CAN_Id = CAN_Id>>8;
2718  059c 96            	ldw	x,sp
2719  059d 1c0009        	addw	x,#OFST+3
2720  05a0 a608          	ld	a,#8
2721  05a2 cd0000        	call	c_lgursh
2723                     ; 637       CAN->Page.TxMailbox.MIDR1 = (uint8_t)(CAN_Id |CAN_IDE | CAN_RTR);
2725  05a5 7b0c          	ld	a,(OFST+6,sp)
2726  05a7 1a0d          	or	a,(OFST+7,sp)
2727  05a9 1a0e          	or	a,(OFST+8,sp)
2728  05ab c7542a        	ld	21546,a
2730  05ae 203a          	jra	L5311
2731  05b0               L3311:
2732                     ; 641       CAN_Id &= (uint16_t)CAN_STDID_SIZE;
2734  05b0 7b0b          	ld	a,(OFST+5,sp)
2735  05b2 a407          	and	a,#7
2736  05b4 6b0b          	ld	(OFST+5,sp),a
2737  05b6 0f0a          	clr	(OFST+4,sp)
2738  05b8 0f09          	clr	(OFST+3,sp)
2739                     ; 642       CAN->Page.TxMailbox.MIDR1 = (uint8_t)((CAN_Id>>6) | (CAN_RTR)) ;
2741  05ba 7b0e          	ld	a,(OFST+8,sp)
2742  05bc b703          	ld	c_lreg+3,a
2743  05be 3f02          	clr	c_lreg+2
2744  05c0 3f01          	clr	c_lreg+1
2745  05c2 3f00          	clr	c_lreg
2746  05c4 96            	ldw	x,sp
2747  05c5 1c0001        	addw	x,#OFST-5
2748  05c8 cd0000        	call	c_rtol
2751  05cb 96            	ldw	x,sp
2752  05cc 1c0009        	addw	x,#OFST+3
2753  05cf cd0000        	call	c_ltor
2755  05d2 a606          	ld	a,#6
2756  05d4 cd0000        	call	c_lursh
2758  05d7 96            	ldw	x,sp
2759  05d8 1c0001        	addw	x,#OFST-5
2760  05db cd0000        	call	c_lor
2762  05de b603          	ld	a,c_lreg+3
2763  05e0 c7542a        	ld	21546,a
2764                     ; 643       CAN->Page.TxMailbox.MIDR2 = (uint8_t)(CAN_Id<<2);
2766  05e3 7b0c          	ld	a,(OFST+6,sp)
2767  05e5 48            	sll	a
2768  05e6 48            	sll	a
2769  05e7 c7542b        	ld	21547,a
2770  05ea               L5311:
2771                     ; 647     CAN->Page.TxMailbox.MDLCR &= (uint8_t)0xF0;
2773  05ea c65429        	ld	a,21545
2774  05ed a4f0          	and	a,#240
2775  05ef c75429        	ld	21545,a
2776                     ; 649     CAN->Page.TxMailbox.MDLCR |= CAN_DLC;
2778  05f2 c65429        	ld	a,21545
2779  05f5 1a0f          	or	a,(OFST+9,sp)
2780  05f7 c75429        	ld	21545,a
2781                     ; 651     CAN->Page.TxMailbox.MDAR1 = CAN_Data[0];
2783  05fa 1e10          	ldw	x,(OFST+10,sp)
2784  05fc f6            	ld	a,(x)
2785  05fd c7542e        	ld	21550,a
2786                     ; 652     CAN->Page.TxMailbox.MDAR2 = CAN_Data[1];
2788  0600 1e10          	ldw	x,(OFST+10,sp)
2789  0602 e601          	ld	a,(1,x)
2790  0604 c7542f        	ld	21551,a
2791                     ; 653     CAN->Page.TxMailbox.MDAR3 = CAN_Data[2];
2793  0607 1e10          	ldw	x,(OFST+10,sp)
2794  0609 e602          	ld	a,(2,x)
2795  060b c75430        	ld	21552,a
2796                     ; 654     CAN->Page.TxMailbox.MDAR4 = CAN_Data[3];
2798  060e 1e10          	ldw	x,(OFST+10,sp)
2799  0610 e603          	ld	a,(3,x)
2800  0612 c75431        	ld	21553,a
2801                     ; 655     CAN->Page.TxMailbox.MDAR5 = CAN_Data[4];
2803  0615 1e10          	ldw	x,(OFST+10,sp)
2804  0617 e604          	ld	a,(4,x)
2805  0619 c75432        	ld	21554,a
2806                     ; 656     CAN->Page.TxMailbox.MDAR6 = CAN_Data[5];
2808  061c 1e10          	ldw	x,(OFST+10,sp)
2809  061e e605          	ld	a,(5,x)
2810  0620 c75433        	ld	21555,a
2811                     ; 657     CAN->Page.TxMailbox.MDAR7 = CAN_Data[6];
2813  0623 1e10          	ldw	x,(OFST+10,sp)
2814  0625 e606          	ld	a,(6,x)
2815  0627 c75434        	ld	21556,a
2816                     ; 658     CAN->Page.TxMailbox.MDAR8 = CAN_Data[7];
2818  062a 1e10          	ldw	x,(OFST+10,sp)
2819  062c e607          	ld	a,(7,x)
2820  062e c75435        	ld	21557,a
2821                     ; 660     CAN->Page.TxMailbox.MCSR |= CAN_MCSR_TXRQ;
2823  0631 72105428      	bset	21544,#0
2824  0635               L1311:
2825                     ; 663   CAN_SelectPage(can_page);
2827  0635 7b05          	ld	a,(OFST-1,sp)
2828  0637 cd0c4b        	call	_CAN_SelectPage
2830                     ; 664   return (CAN_TxStatus_TypeDef)CAN_TxStatus;
2832  063a 7b06          	ld	a,(OFST+0,sp)
2835  063c 5b06          	addw	sp,#6
2836  063e 81            	ret
2920                     ; 672 CAN_TxStatus_TypeDef CAN_TransmitStatus(CAN_TransmitMailBox_TypeDef CAN_TransmitMailbox)
2920                     ; 673 {
2921                     	switch	.text
2922  063f               _CAN_TransmitStatus:
2924  063f 88            	push	a
2925       00000001      OFST:	set	1
2928                     ; 675   CAN_TxStatus_TypeDef tstate = CAN_TxStatus_Failed;
2930                     ; 676   uint8_t tmpstate=0;
2932  0640 0f01          	clr	(OFST+0,sp)
2934                     ; 679   assert_param(IS_CAN_TRANSMITMAILBOX_OK(CAN_TransmitMailbox));
2936                     ; 681   switch (CAN_TransmitMailbox)
2939                     ; 694     break;
2940  0642 4d            	tnz	a
2941  0643 2709          	jreq	L7311
2942  0645 4a            	dec	a
2943  0646 2718          	jreq	L1411
2944  0648 a004          	sub	a,#4
2945  064a 2728          	jreq	L3411
2946  064c               L5411:
2947                     ; 692   default:
2947                     ; 693     tstate = CAN_TxStatus_Failed;
2949                     ; 694     break;
2951  064c 203a          	jra	L1221
2952  064e               L7311:
2953                     ; 683   case (CAN_TransmitMailBox_0): tmpstate = (uint8_t)((CAN->TSR & (uint8_t)(CAN_TSR_RQCP0|CAN_TSR_TXOK0)));
2955  064e c65422        	ld	a,21538
2956  0651 a411          	and	a,#17
2957  0653 6b01          	ld	(OFST+0,sp),a
2959                     ; 684   tmpstate |= (uint8_t)((CAN->TPR & CAN_TPR_TME0));
2961  0655 c65423        	ld	a,21539
2962  0658 a404          	and	a,#4
2963  065a 1a01          	or	a,(OFST+0,sp)
2964  065c 6b01          	ld	(OFST+0,sp),a
2966                     ; 685   break;
2968  065e 2028          	jra	L1221
2969  0660               L1411:
2970                     ; 686   case (CAN_TransmitMailBox_1): tmpstate = (uint8_t)((uint8_t)(CAN->TSR & (uint8_t)(CAN_TSR_RQCP1|CAN_TSR_TXOK1))>>1);
2972  0660 c65422        	ld	a,21538
2973  0663 a422          	and	a,#34
2974  0665 44            	srl	a
2975  0666 6b01          	ld	(OFST+0,sp),a
2977                     ; 687   tmpstate |= (uint8_t)((uint8_t)(CAN->TPR & CAN_TPR_TME1) >> 1);
2979  0668 c65423        	ld	a,21539
2980  066b a408          	and	a,#8
2981  066d 44            	srl	a
2982  066e 1a01          	or	a,(OFST+0,sp)
2983  0670 6b01          	ld	(OFST+0,sp),a
2985                     ; 688   break;
2987  0672 2014          	jra	L1221
2988  0674               L3411:
2989                     ; 689   case (CAN_TransmitMailBox_2): tmpstate = (uint8_t)((uint8_t)(CAN->TSR & (uint8_t)(CAN_TSR_RQCP2|CAN_TSR_TXOK2))>>2);
2991  0674 c65422        	ld	a,21538
2992  0677 a444          	and	a,#68
2993  0679 44            	srl	a
2994  067a 44            	srl	a
2995  067b 6b01          	ld	(OFST+0,sp),a
2997                     ; 690   tmpstate |= (uint8_t)((uint8_t)(CAN->TPR & CAN_TPR_TME2) >> 2);
2999  067d c65423        	ld	a,21539
3000  0680 a410          	and	a,#16
3001  0682 44            	srl	a
3002  0683 44            	srl	a
3003  0684 1a01          	or	a,(OFST+0,sp)
3004  0686 6b01          	ld	(OFST+0,sp),a
3006                     ; 691   break;
3008  0688               L1221:
3009                     ; 697   switch (tmpstate)
3011  0688 7b01          	ld	a,(OFST+0,sp)
3013                     ; 713     break;
3014  068a 4d            	tnz	a
3015  068b 2711          	jreq	L7411
3016  068d a004          	sub	a,#4
3017  068f 271f          	jreq	L5511
3018  0691 4a            	dec	a
3019  0692 2710          	jreq	L1511
3020  0694 a010          	sub	a,#16
3021  0696 2712          	jreq	L3511
3022  0698               L7511:
3023                     ; 711   default:
3023                     ; 712     tstate = CAN_TxStatus_Failed;
3025  0698 a6f0          	ld	a,#240
3026  069a 6b01          	ld	(OFST+0,sp),a
3028                     ; 713     break;
3030  069c 2016          	jra	L5221
3031  069e               L7411:
3032                     ; 700   case (0x00): tstate = CAN_TxStatus_Pending;
3034  069e a6f2          	ld	a,#242
3035  06a0 6b01          	ld	(OFST+0,sp),a
3037                     ; 701   break;
3039  06a2 2010          	jra	L5221
3040  06a4               L1511:
3041                     ; 703   case (0x05): tstate = CAN_TxStatus_Failed;
3043  06a4 a6f0          	ld	a,#240
3044  06a6 6b01          	ld	(OFST+0,sp),a
3046                     ; 704   break;
3048  06a8 200a          	jra	L5221
3049  06aa               L3511:
3050                     ; 706   case (0x15): tstate = CAN_TxStatus_Ok;
3052  06aa a6f1          	ld	a,#241
3053  06ac 6b01          	ld	(OFST+0,sp),a
3055                     ; 707   break;
3057  06ae 2004          	jra	L5221
3058  06b0               L5511:
3059                     ; 709   case (0x04): tstate = CAN_TxStatus_MailBoxEmpty;
3061  06b0 a6f5          	ld	a,#245
3062  06b2 6b01          	ld	(OFST+0,sp),a
3064                     ; 710   break;
3066  06b4               L5221:
3067                     ; 716   return (CAN_TxStatus_TypeDef)tstate;
3069  06b4 7b01          	ld	a,(OFST+0,sp)
3072  06b6 5b01          	addw	sp,#1
3073  06b8 81            	ret
3121                     ; 724 void CAN_CancelTransmit(CAN_TransmitMailBox_TypeDef CAN_TransmitMailbox)
3121                     ; 725 {
3122                     	switch	.text
3123  06b9               _CAN_CancelTransmit:
3125  06b9 88            	push	a
3126  06ba 88            	push	a
3127       00000001      OFST:	set	1
3130                     ; 726   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
3132  06bb cd0c47        	call	_CAN_GetSelectedPage
3134  06be 6b01          	ld	(OFST+0,sp),a
3136                     ; 728   assert_param(IS_CAN_TRANSMITMAILBOX_OK(CAN_TransmitMailbox));
3138                     ; 730   CAN->PSR = (uint8_t)CAN_TransmitMailbox;
3140  06c0 7b02          	ld	a,(OFST+1,sp)
3141  06c2 c75427        	ld	21543,a
3142                     ; 732   CAN->Page.TxMailbox.MCSR |= CAN_MCSR_ABRQ;
3144  06c5 72125428      	bset	21544,#1
3145                     ; 734   CAN_SelectPage(can_page);
3147  06c9 7b01          	ld	a,(OFST+0,sp)
3148  06cb cd0c4b        	call	_CAN_SelectPage
3150                     ; 735 }
3153  06ce 85            	popw	x
3154  06cf 81            	ret
3177                     ; 742 void CAN_FIFORelease(void)
3177                     ; 743 {
3178                     	switch	.text
3179  06d0               _CAN_FIFORelease:
3183                     ; 745   CAN->RFR = CAN_RFR_RFOM; /*rc-w1*/
3185  06d0 35205424      	mov	21540,#32
3186                     ; 746 }
3189  06d4 81            	ret
3263                     ; 752 CAN_NbrPendingMessage_TypeDef CAN_MessagePending(void)
3263                     ; 753 {
3264                     	switch	.text
3265  06d5               _CAN_MessagePending:
3267  06d5 88            	push	a
3268       00000001      OFST:	set	1
3271                     ; 754   CAN_NbrPendingMessage_TypeDef msgpending = CAN_NbrPendingMessage_0;
3273                     ; 755   msgpending = (CAN_NbrPendingMessage_TypeDef)(CAN->RFR & CAN_RFR_FMP01);
3275  06d6 c65424        	ld	a,21540
3276  06d9 a403          	and	a,#3
3277  06db 6b01          	ld	(OFST+0,sp),a
3279                     ; 756   return (CAN_NbrPendingMessage_TypeDef)msgpending;
3281  06dd 7b01          	ld	a,(OFST+0,sp)
3284  06df 5b01          	addw	sp,#1
3285  06e1 81            	ret
3350                     ; 767 void CAN_Receive(void)
3350                     ; 768 {
3351                     	switch	.text
3352  06e2               _CAN_Receive:
3354  06e2 520d          	subw	sp,#13
3355       0000000d      OFST:	set	13
3358                     ; 769   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
3360  06e4 cd0c47        	call	_CAN_GetSelectedPage
3362  06e7 6b01          	ld	(OFST-12,sp),a
3364                     ; 770   uint32_t temp1 = 0, temp2 = 0, temp3 = 0;
3370                     ; 773   CAN->PSR = CAN_Page_RxFifo;
3372  06e9 35075427      	mov	21543,#7
3373                     ; 776   _IDE = (uint8_t)(CAN->Page.RxFIFO.MIDR1 & CAN_Id_Extended);
3375  06ed c6542a        	ld	a,21546
3376  06f0 a440          	and	a,#64
3377  06f2 c70004        	ld	__IDE,a
3378                     ; 777   if (_IDE != CAN_Id_Standard)
3380  06f5 725d0004      	tnz	__IDE
3381  06f9 2602          	jrne	L27
3382  06fb 207b          	jp	L7331
3383  06fd               L27:
3384                     ; 779     temp1 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR3) << 8);
3386  06fd c6542c        	ld	a,21548
3387  0700 5f            	clrw	x
3388  0701 97            	ld	xl,a
3389  0702 90ae0100      	ldw	y,#256
3390  0706 cd0000        	call	c_umul
3392  0709 96            	ldw	x,sp
3393  070a 1c0006        	addw	x,#OFST-7
3394  070d cd0000        	call	c_rtol
3397                     ; 780     temp2 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR2) << 16);  
3399  0710 c6542b        	ld	a,21547
3400  0713 b703          	ld	c_lreg+3,a
3401  0715 3f02          	clr	c_lreg+2
3402  0717 3f01          	clr	c_lreg+1
3403  0719 3f00          	clr	c_lreg
3404  071b a610          	ld	a,#16
3405  071d cd0000        	call	c_llsh
3407  0720 96            	ldw	x,sp
3408  0721 1c000a        	addw	x,#OFST-3
3409  0724 cd0000        	call	c_rtol
3412                     ; 781     temp3 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR1 & 0x1F) << 24);
3414  0727 c6542a        	ld	a,21546
3415  072a b703          	ld	c_lreg+3,a
3416  072c 3f02          	clr	c_lreg+2
3417  072e 3f01          	clr	c_lreg+1
3418  0730 3f00          	clr	c_lreg
3419  0732 b603          	ld	a,c_lreg+3
3420  0734 a41f          	and	a,#31
3421  0736 b703          	ld	c_lreg+3,a
3422  0738 3f02          	clr	c_lreg+2
3423  073a 3f01          	clr	c_lreg+1
3424  073c 3f00          	clr	c_lreg
3425  073e a618          	ld	a,#24
3426  0740 cd0000        	call	c_llsh
3428  0743 96            	ldw	x,sp
3429  0744 1c0002        	addw	x,#OFST-11
3430  0747 cd0000        	call	c_rtol
3433                     ; 783     _Id = (uint32_t)CAN_EXTID_SIZE & ((CAN->Page.RxFIFO.MIDR4) | temp1 | temp2 | temp3 );
3435  074a c6542d        	ld	a,21549
3436  074d b703          	ld	c_lreg+3,a
3437  074f 3f02          	clr	c_lreg+2
3438  0751 3f01          	clr	c_lreg+1
3439  0753 3f00          	clr	c_lreg
3440  0755 96            	ldw	x,sp
3441  0756 1c0006        	addw	x,#OFST-7
3442  0759 cd0000        	call	c_lor
3444  075c 96            	ldw	x,sp
3445  075d 1c000a        	addw	x,#OFST-3
3446  0760 cd0000        	call	c_lor
3448  0763 96            	ldw	x,sp
3449  0764 1c0002        	addw	x,#OFST-11
3450  0767 cd0000        	call	c_lor
3452  076a b600          	ld	a,c_lreg
3453  076c a41f          	and	a,#31
3454  076e b700          	ld	c_lreg,a
3455  0770 ae0000        	ldw	x,#__Id
3456  0773 cd0000        	call	c_rtol
3459  0776 204c          	jra	L1431
3460  0778               L7331:
3461                     ; 787     temp1 = (uint16_t)((uint16_t)((uint16_t)((uint16_t)CAN->Page.RxFIFO.MIDR1 & 0x1F) << 6));
3463  0778 c6542a        	ld	a,21546
3464  077b 5f            	clrw	x
3465  077c a41f          	and	a,#31
3466  077e 5f            	clrw	x
3467  077f 02            	rlwa	x,a
3468  0780 58            	sllw	x
3469  0781 58            	sllw	x
3470  0782 58            	sllw	x
3471  0783 58            	sllw	x
3472  0784 58            	sllw	x
3473  0785 58            	sllw	x
3474  0786 cd0000        	call	c_uitolx
3476  0789 96            	ldw	x,sp
3477  078a 1c0006        	addw	x,#OFST-7
3478  078d cd0000        	call	c_rtol
3481                     ; 788     temp2 = (uint16_t)((uint16_t)((uint16_t)CAN->Page.RxFIFO.MIDR2 >> 2)&0x3F);
3483  0790 c6542b        	ld	a,21547
3484  0793 5f            	clrw	x
3485  0794 97            	ld	xl,a
3486  0795 54            	srlw	x
3487  0796 54            	srlw	x
3488  0797 9f            	ld	a,xl
3489  0798 5f            	clrw	x
3490  0799 a43f          	and	a,#63
3491  079b 5f            	clrw	x
3492  079c cd0000        	call	c_uitol
3494  079f 96            	ldw	x,sp
3495  07a0 1c000a        	addw	x,#OFST-3
3496  07a3 cd0000        	call	c_rtol
3499                     ; 790     _Id = (uint16_t)CAN_STDID_SIZE & (temp1 | temp2 );
3501  07a6 96            	ldw	x,sp
3502  07a7 1c0006        	addw	x,#OFST-7
3503  07aa cd0000        	call	c_ltor
3505  07ad 96            	ldw	x,sp
3506  07ae 1c000a        	addw	x,#OFST-3
3507  07b1 cd0000        	call	c_lor
3509  07b4 b602          	ld	a,c_lreg+2
3510  07b6 a407          	and	a,#7
3511  07b8 b702          	ld	c_lreg+2,a
3512  07ba 3f01          	clr	c_lreg+1
3513  07bc 3f00          	clr	c_lreg
3514  07be ae0000        	ldw	x,#__Id
3515  07c1 cd0000        	call	c_rtol
3517  07c4               L1431:
3518                     ; 793   _RTR = (uint8_t)((uint8_t)0x20 & CAN->Page.RxFIFO.MIDR1);
3520  07c4 c6542a        	ld	a,21546
3521  07c7 a420          	and	a,#32
3522  07c9 c70005        	ld	__RTR,a
3523                     ; 796   _DLC = (uint8_t)(CAN->Page.RxFIFO.MDLCR & (uint8_t)0x0F);
3525  07cc c65429        	ld	a,21545
3526  07cf a40f          	and	a,#15
3527  07d1 c70006        	ld	__DLC,a
3528                     ; 799   _FMI = CAN->Page.RxFIFO.MFMI;
3530  07d4 555428000f    	mov	__FMI,21544
3531                     ; 802   _Data[0] = CAN->Page.RxFIFO.MDAR1;
3533  07d9 55542e0007    	mov	__Data,21550
3534                     ; 803   _Data[1] = CAN->Page.RxFIFO.MDAR2;
3536  07de 55542f0008    	mov	__Data+1,21551
3537                     ; 804   _Data[2] = CAN->Page.RxFIFO.MDAR3;
3539  07e3 5554300009    	mov	__Data+2,21552
3540                     ; 805   _Data[3] = CAN->Page.RxFIFO.MDAR4;
3542  07e8 555431000a    	mov	__Data+3,21553
3543                     ; 806   _Data[4] = CAN->Page.RxFIFO.MDAR5;
3545  07ed 555432000b    	mov	__Data+4,21554
3546                     ; 807   _Data[5] = CAN->Page.RxFIFO.MDAR6;
3548  07f2 555433000c    	mov	__Data+5,21555
3549                     ; 808   _Data[6] = CAN->Page.RxFIFO.MDAR7;
3551  07f7 555434000d    	mov	__Data+6,21556
3552                     ; 809   _Data[7] = CAN->Page.RxFIFO.MDAR8;
3554  07fc 555435000e    	mov	__Data+7,21557
3555                     ; 812   CAN_FIFORelease();
3557  0801 cd06d0        	call	_CAN_FIFORelease
3559                     ; 814   CAN_SelectPage(can_page);
3561  0804 7b01          	ld	a,(OFST-12,sp)
3562  0806 cd0c4b        	call	_CAN_SelectPage
3564                     ; 815 }
3567  0809 5b0d          	addw	sp,#13
3568  080b 81            	ret
3592                     ; 825 uint32_t CAN_GetReceivedId(void)
3592                     ; 826 {
3593                     	switch	.text
3594  080c               _CAN_GetReceivedId:
3598                     ; 827   return (_Id);
3600  080c ae0000        	ldw	x,#__Id
3601  080f cd0000        	call	c_ltor
3605  0812 81            	ret
3630                     ; 838 CAN_Id_TypeDef CAN_GetReceivedIDE(void)
3630                     ; 839 {
3631                     	switch	.text
3632  0813               _CAN_GetReceivedIDE:
3636                     ; 840   return (CAN_Id_TypeDef)(_IDE);
3638  0813 c60004        	ld	a,__IDE
3641  0816 81            	ret
3666                     ; 851 CAN_RTR_TypeDef CAN_GetReceivedRTR(void)
3666                     ; 852 {
3667                     	switch	.text
3668  0817               _CAN_GetReceivedRTR:
3672                     ; 853   return (CAN_RTR_TypeDef)(_RTR);
3674  0817 c60005        	ld	a,__RTR
3677  081a 81            	ret
3701                     ; 864 uint8_t CAN_GetReceivedDLC(void)
3701                     ; 865 {
3702                     	switch	.text
3703  081b               _CAN_GetReceivedDLC:
3707                     ; 866   return (_DLC);
3709  081b c60006        	ld	a,__DLC
3712  081e 81            	ret
3746                     ; 878 uint8_t CAN_GetReceivedData(uint8_t CAN_DataIndex)
3746                     ; 879 {
3747                     	switch	.text
3748  081f               _CAN_GetReceivedData:
3752                     ; 880   assert_param(IS_CAN_DLC_OK(CAN_DataIndex));
3754                     ; 881   return (_Data[CAN_DataIndex]);
3756  081f 5f            	clrw	x
3757  0820 97            	ld	xl,a
3758  0821 d60007        	ld	a,(__Data,x)
3761  0824 81            	ret
3785                     ; 892 uint8_t CAN_GetReceivedFMI(void)
3785                     ; 893 {
3786                     	switch	.text
3787  0825               _CAN_GetReceivedFMI:
3791                     ; 894   return (_FMI);
3793  0825 c6000f        	ld	a,__FMI
3796  0828 81            	ret
3841                     ; 902 uint16_t CAN_GetMessageTimeStamp(void)
3841                     ; 903 {
3842                     	switch	.text
3843  0829               _CAN_GetMessageTimeStamp:
3845  0829 5203          	subw	sp,#3
3846       00000003      OFST:	set	3
3849                     ; 904   uint16_t timestamp = 0;
3851                     ; 905   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
3853  082b cd0c47        	call	_CAN_GetSelectedPage
3855  082e 6b01          	ld	(OFST-2,sp),a
3857                     ; 908   CAN->PSR = CAN_Page_RxFifo;
3859  0830 35075427      	mov	21543,#7
3860                     ; 910   timestamp = CAN->Page.RxFIFO.MTSRL;
3862  0834 c65436        	ld	a,21558
3863  0837 5f            	clrw	x
3864  0838 97            	ld	xl,a
3865  0839 1f02          	ldw	(OFST-1,sp),x
3867                     ; 911   timestamp |= (uint16_t)(((uint16_t)CAN->Page.RxFIFO.MTSRH)<<8);
3869  083b c65437        	ld	a,21559
3870  083e 5f            	clrw	x
3871  083f 97            	ld	xl,a
3872  0840 4f            	clr	a
3873  0841 02            	rlwa	x,a
3874  0842 01            	rrwa	x,a
3875  0843 1a03          	or	a,(OFST+0,sp)
3876  0845 01            	rrwa	x,a
3877  0846 1a02          	or	a,(OFST-1,sp)
3878  0848 01            	rrwa	x,a
3879  0849 1f02          	ldw	(OFST-1,sp),x
3881                     ; 914   CAN_SelectPage(can_page);
3883  084b 7b01          	ld	a,(OFST-2,sp)
3884  084d cd0c4b        	call	_CAN_SelectPage
3886                     ; 916   return (uint16_t)(timestamp);
3888  0850 1e02          	ldw	x,(OFST-1,sp)
3891  0852 5b03          	addw	sp,#3
3892  0854 81            	ret
3948                     ; 924 CAN_Sleep_TypeDef CAN_Sleep(void)
3948                     ; 925 {
3949                     	switch	.text
3950  0855               _CAN_Sleep:
3952  0855 88            	push	a
3953       00000001      OFST:	set	1
3956                     ; 926   CAN_Sleep_TypeDef sleepstatus = CAN_Sleep_Failed;
3958  0856 0f01          	clr	(OFST+0,sp)
3960                     ; 929   CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_INRQ)) | CAN_MCR_SLEEP);
3962  0858 c65420        	ld	a,21536
3963  085b a4fe          	and	a,#254
3964  085d aa02          	or	a,#2
3965  085f c75420        	ld	21536,a
3966                     ; 932   if ((CAN->MSR & (CAN_MSR_SLAK|CAN_MSR_INAK)) == CAN_MSR_SLAK)
3968  0862 c65421        	ld	a,21537
3969  0865 a403          	and	a,#3
3970  0867 a102          	cp	a,#2
3971  0869 2604          	jrne	L5741
3972                     ; 935     sleepstatus =  CAN_Sleep_Ok;
3974  086b a601          	ld	a,#1
3975  086d 6b01          	ld	(OFST+0,sp),a
3977  086f               L5741:
3978                     ; 939   return (CAN_Sleep_TypeDef) sleepstatus;
3980  086f 7b01          	ld	a,(OFST+0,sp)
3983  0871 5b01          	addw	sp,#1
3984  0873 81            	ret
4040                     ; 947 CAN_WakeUp_TypeDef CAN_WakeUp(void)
4040                     ; 948 {
4041                     	switch	.text
4042  0874               _CAN_WakeUp:
4044  0874 88            	push	a
4045       00000001      OFST:	set	1
4048                     ; 949   CAN_WakeUp_TypeDef wakeupstatus = CAN_WakeUp_Failed;
4050  0875 0f01          	clr	(OFST+0,sp)
4052                     ; 952   CAN->MCR &= (uint8_t)(~CAN_MCR_SLEEP);
4054  0877 72135420      	bres	21536,#1
4055                     ; 955   if ((CAN->MSR & CAN_MSR_SLAK) != CAN_MSR_SLAK)
4057  087b c65421        	ld	a,21537
4058  087e a402          	and	a,#2
4059  0880 a102          	cp	a,#2
4060  0882 2704          	jreq	L5251
4061                     ; 958     wakeupstatus = CAN_WakeUp_Ok;
4063  0884 a601          	ld	a,#1
4064  0886 6b01          	ld	(OFST+0,sp),a
4066  0888               L5251:
4067                     ; 962   return (CAN_WakeUp_TypeDef)wakeupstatus;
4069  0888 7b01          	ld	a,(OFST+0,sp)
4072  088a 5b01          	addw	sp,#1
4073  088c 81            	ret
4176                     ; 974 CAN_ModeStatus_TypeDef CAN_OperatingModeRequest(CAN_OperatingMode_TypeDef CAN_OperatingMode)
4176                     ; 975 {
4177                     	switch	.text
4178  088d               _CAN_OperatingModeRequest:
4180  088d 88            	push	a
4181  088e 5203          	subw	sp,#3
4182       00000003      OFST:	set	3
4185                     ; 976   uint16_t timeout = CAN_ACKNOWLEDGE_TIMEOUT;
4187  0890 aeffff        	ldw	x,#65535
4188  0893 1f02          	ldw	(OFST-1,sp),x
4190                     ; 977   uint8_t modestatus = 0;
4192                     ; 979   assert_param(IS_CAN_OPERATINGMODE_OK(CAN_OperatingMode));
4194                     ; 981   if (CAN_OperatingMode == CAN_OperatingMode_Initialization)
4196  0895 4d            	tnz	a
4197  0896 2633          	jrne	L3751
4198                     ; 984     CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_SLEEP)) | CAN_MCR_INRQ);
4200  0898 c65420        	ld	a,21536
4201  089b a4fd          	and	a,#253
4202  089d aa01          	or	a,#1
4203  089f c75420        	ld	21536,a
4205  08a2 2007          	jra	L1061
4206  08a4               L5751:
4207                     ; 989       timeout--;
4209  08a4 1e02          	ldw	x,(OFST-1,sp)
4210  08a6 1d0001        	subw	x,#1
4211  08a9 1f02          	ldw	(OFST-1,sp),x
4213  08ab               L1061:
4214                     ; 987     while (((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_INAK) && (timeout != 0))
4216  08ab c65421        	ld	a,21537
4217  08ae a403          	and	a,#3
4218  08b0 a101          	cp	a,#1
4219  08b2 2704          	jreq	L5061
4221  08b4 1e02          	ldw	x,(OFST-1,sp)
4222  08b6 26ec          	jrne	L5751
4223  08b8               L5061:
4224                     ; 991     if ((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_INAK)
4226  08b8 c65421        	ld	a,21537
4227  08bb a403          	and	a,#3
4228  08bd a101          	cp	a,#1
4229  08bf 2704          	jreq	L7061
4230                     ; 993       modestatus = CAN_ModeStatus_Failed;
4232  08c1 0f01          	clr	(OFST-2,sp)
4235  08c3 2074          	jra	L3161
4236  08c5               L7061:
4237                     ; 997       modestatus = CAN_ModeStatus_Success;  
4239  08c5 a601          	ld	a,#1
4240  08c7 6b01          	ld	(OFST-2,sp),a
4242  08c9 206e          	jra	L3161
4243  08cb               L3751:
4244                     ; 1001   else  if (CAN_OperatingMode == CAN_OperatingMode_Normal)
4246  08cb 7b04          	ld	a,(OFST+1,sp)
4247  08cd a101          	cp	a,#1
4248  08cf 262d          	jrne	L5161
4249                     ; 1004     CAN->MCR &= (uint8_t)(~(CAN_MCR_SLEEP|CAN_MCR_INRQ));
4251  08d1 c65420        	ld	a,21536
4252  08d4 a4fc          	and	a,#252
4253  08d6 c75420        	ld	21536,a
4255  08d9 2007          	jra	L1261
4256  08db               L7161:
4257                     ; 1009       timeout--;
4259  08db 1e02          	ldw	x,(OFST-1,sp)
4260  08dd 1d0001        	subw	x,#1
4261  08e0 1f02          	ldw	(OFST-1,sp),x
4263  08e2               L1261:
4264                     ; 1007     while (((CAN->MSR & CAN_MODE_MASK) != 0) && (timeout!=0))
4266  08e2 c65421        	ld	a,21537
4267  08e5 a503          	bcp	a,#3
4268  08e7 2704          	jreq	L5261
4270  08e9 1e02          	ldw	x,(OFST-1,sp)
4271  08eb 26ee          	jrne	L7161
4272  08ed               L5261:
4273                     ; 1011     if ((CAN->MSR & CAN_MODE_MASK) != 0)
4275  08ed c65421        	ld	a,21537
4276  08f0 a503          	bcp	a,#3
4277  08f2 2704          	jreq	L7261
4278                     ; 1013       modestatus = CAN_ModeStatus_Failed;
4280  08f4 0f01          	clr	(OFST-2,sp)
4283  08f6 2041          	jra	L3161
4284  08f8               L7261:
4285                     ; 1017       modestatus = CAN_ModeStatus_Success;  
4287  08f8 a601          	ld	a,#1
4288  08fa 6b01          	ld	(OFST-2,sp),a
4290  08fc 203b          	jra	L3161
4291  08fe               L5161:
4292                     ; 1020   else  if (CAN_OperatingMode == CAN_OperatingMode_Sleep)
4294  08fe 7b04          	ld	a,(OFST+1,sp)
4295  0900 a102          	cp	a,#2
4296  0902 2633          	jrne	L5361
4297                     ; 1023     CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_INRQ)) | CAN_MCR_SLEEP);
4299  0904 c65420        	ld	a,21536
4300  0907 a4fe          	and	a,#254
4301  0909 aa02          	or	a,#2
4302  090b c75420        	ld	21536,a
4304  090e 2007          	jra	L3461
4305  0910               L7361:
4306                     ; 1028       timeout--;
4308  0910 1e02          	ldw	x,(OFST-1,sp)
4309  0912 1d0001        	subw	x,#1
4310  0915 1f02          	ldw	(OFST-1,sp),x
4312  0917               L3461:
4313                     ; 1026     while (((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK) && (timeout!=0))
4315  0917 c65421        	ld	a,21537
4316  091a a403          	and	a,#3
4317  091c a102          	cp	a,#2
4318  091e 2704          	jreq	L7461
4320  0920 1e02          	ldw	x,(OFST-1,sp)
4321  0922 26ec          	jrne	L7361
4322  0924               L7461:
4323                     ; 1030     if ((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK)
4325  0924 c65421        	ld	a,21537
4326  0927 a403          	and	a,#3
4327  0929 a102          	cp	a,#2
4328  092b 2704          	jreq	L1561
4329                     ; 1032       modestatus = CAN_ModeStatus_Failed;  
4331  092d 0f01          	clr	(OFST-2,sp)
4334  092f 2008          	jra	L3161
4335  0931               L1561:
4336                     ; 1036       modestatus = CAN_ModeStatus_Success;  
4338  0931 a601          	ld	a,#1
4339  0933 6b01          	ld	(OFST-2,sp),a
4341  0935 2002          	jra	L3161
4342  0937               L5361:
4343                     ; 1041     modestatus = CAN_ModeStatus_Failed;
4345  0937 0f01          	clr	(OFST-2,sp)
4347  0939               L3161:
4348                     ; 1043   return (CAN_ModeStatus_TypeDef)(modestatus);
4350  0939 7b01          	ld	a,(OFST-2,sp)
4353  093b 5b04          	addw	sp,#4
4354  093d 81            	ret
4473                     ; 1051 CAN_ErrorCode_TypeDef CAN_GetLastErrorCode(void)
4473                     ; 1052 {
4474                     	switch	.text
4475  093e               _CAN_GetLastErrorCode:
4477  093e 89            	pushw	x
4478       00000002      OFST:	set	2
4481                     ; 1053   CAN_ErrorCode_TypeDef errcode = CAN_ErrorCode_NoErr;
4483                     ; 1054   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
4485  093f cd0c47        	call	_CAN_GetSelectedPage
4487  0942 6b01          	ld	(OFST-1,sp),a
4489                     ; 1056   CAN->PSR = CAN_Page_Config;
4491  0944 35065427      	mov	21543,#6
4492                     ; 1057   errcode = (CAN_ErrorCode_TypeDef)((CAN->Page.Config.ESR) & (CAN_ESR_LEC));
4494  0948 c65428        	ld	a,21544
4495  094b a470          	and	a,#112
4496  094d 6b02          	ld	(OFST+0,sp),a
4498                     ; 1060   CAN_SelectPage(can_page);
4500  094f 7b01          	ld	a,(OFST-1,sp)
4501  0951 cd0c4b        	call	_CAN_SelectPage
4503                     ; 1062   return (CAN_ErrorCode_TypeDef)(errcode);
4505  0954 7b02          	ld	a,(OFST+0,sp)
4508  0956 85            	popw	x
4509  0957 81            	ret
4639                     ; 1077 void CAN_ClearFlag(CAN_FLAG_TypeDef CAN_Flag)
4639                     ; 1078 {
4640                     	switch	.text
4641  0958               _CAN_ClearFlag:
4643  0958 89            	pushw	x
4644  0959 88            	push	a
4645       00000001      OFST:	set	1
4648                     ; 1079   CAN_Page_TypeDef can_page = (CAN_Page_TypeDef)0;
4650                     ; 1081   assert_param(IS_CAN_FLAG_CLEAR_OK(CAN_Flag));
4652                     ; 1082   if (((uint16_t)CAN_Flag & 0x0700)!= RESET)
4654  095a 01            	rrwa	x,a
4655  095b 9f            	ld	a,xl
4656  095c a407          	and	a,#7
4657  095e 97            	ld	xl,a
4658  095f 4f            	clr	a
4659  0960 02            	rlwa	x,a
4660  0961 5d            	tnzw	x
4661  0962 2731          	jreq	L1002
4662                     ; 1084     if (((uint16_t)CAN_Flag & 0x020B)!= RESET)
4664  0964 1e02          	ldw	x,(OFST+1,sp)
4665  0966 01            	rrwa	x,a
4666  0967 a40b          	and	a,#11
4667  0969 01            	rrwa	x,a
4668  096a a402          	and	a,#2
4669  096c 01            	rrwa	x,a
4670  096d a30000        	cpw	x,#0
4671  0970 2707          	jreq	L3002
4672                     ; 1087       CAN->RFR = (uint8_t)(CAN_Flag);
4674  0972 7b03          	ld	a,(OFST+2,sp)
4675  0974 c75424        	ld	21540,a
4677  0977 202e          	jra	L3102
4678  0979               L3002:
4679                     ; 1089     else if (((uint16_t)CAN_Flag & 0x0403)!= RESET)
4681  0979 1e02          	ldw	x,(OFST+1,sp)
4682  097b 01            	rrwa	x,a
4683  097c a403          	and	a,#3
4684  097e 01            	rrwa	x,a
4685  097f a404          	and	a,#4
4686  0981 01            	rrwa	x,a
4687  0982 a30000        	cpw	x,#0
4688  0985 2707          	jreq	L7002
4689                     ; 1092       CAN->TSR = (uint8_t)(CAN_Flag);
4691  0987 7b03          	ld	a,(OFST+2,sp)
4692  0989 c75422        	ld	21538,a
4694  098c 2019          	jra	L3102
4695  098e               L7002:
4696                     ; 1097       CAN->MSR = (uint8_t)(CAN_Flag);
4698  098e 7b03          	ld	a,(OFST+2,sp)
4699  0990 c75421        	ld	21537,a
4700  0993 2012          	jra	L3102
4701  0995               L1002:
4702                     ; 1103     can_page = CAN_GetSelectedPage();
4704  0995 cd0c47        	call	_CAN_GetSelectedPage
4706  0998 6b01          	ld	(OFST+0,sp),a
4708                     ; 1106     CAN->PSR = CAN_Page_Config;
4710  099a 35065427      	mov	21543,#6
4711                     ; 1107     CAN->Page.Config.ESR = (uint8_t)RESET;
4713  099e 725f5428      	clr	21544
4714                     ; 1110     CAN_SelectPage(can_page);
4716  09a2 7b01          	ld	a,(OFST+0,sp)
4717  09a4 cd0c4b        	call	_CAN_SelectPage
4719  09a7               L3102:
4720                     ; 1112 }
4723  09a7 5b03          	addw	sp,#3
4724  09a9 81            	ret
4802                     ; 1119 FlagStatus CAN_GetFlagStatus(CAN_FLAG_TypeDef CAN_Flag)
4802                     ; 1120 {
4803                     	switch	.text
4804  09aa               _CAN_GetFlagStatus:
4806  09aa 89            	pushw	x
4807  09ab 89            	pushw	x
4808       00000002      OFST:	set	2
4811                     ; 1121   FlagStatus bitstatus = RESET;
4813                     ; 1122   CAN_Page_TypeDef can_page = (CAN_Page_TypeDef)0;
4815                     ; 1125   assert_param(IS_CAN_FLAG_STATUS_OK(CAN_Flag));
4817                     ; 1127   if (((uint16_t)CAN_Flag & 0x0700)!= RESET)
4819  09ac 01            	rrwa	x,a
4820  09ad 9f            	ld	a,xl
4821  09ae a407          	and	a,#7
4822  09b0 97            	ld	xl,a
4823  09b1 4f            	clr	a
4824  09b2 02            	rlwa	x,a
4825  09b3 5d            	tnzw	x
4826  09b4 276d          	jreq	L3502
4827                     ; 1129     if (((uint16_t)CAN_Flag & 0x020B)!= RESET)
4829  09b6 1e03          	ldw	x,(OFST+1,sp)
4830  09b8 01            	rrwa	x,a
4831  09b9 a40b          	and	a,#11
4832  09bb 01            	rrwa	x,a
4833  09bc a402          	and	a,#2
4834  09be 01            	rrwa	x,a
4835  09bf a30000        	cpw	x,#0
4836  09c2 271b          	jreq	L5502
4837                     ; 1132       if ((CAN->RFR & (uint16_t)CAN_Flag )!= RESET)
4839  09c4 c65424        	ld	a,21540
4840  09c7 5f            	clrw	x
4841  09c8 97            	ld	xl,a
4842  09c9 01            	rrwa	x,a
4843  09ca 1404          	and	a,(OFST+2,sp)
4844  09cc 01            	rrwa	x,a
4845  09cd 1403          	and	a,(OFST+1,sp)
4846  09cf 01            	rrwa	x,a
4847  09d0 a30000        	cpw	x,#0
4848  09d3 2706          	jreq	L7502
4849                     ; 1135         bitstatus = SET;
4851  09d5 a601          	ld	a,#1
4852  09d7 6b02          	ld	(OFST+0,sp),a
4855  09d9 206f          	jra	L1012
4856  09db               L7502:
4857                     ; 1140         bitstatus = RESET;
4859  09db 0f02          	clr	(OFST+0,sp)
4861  09dd 206b          	jra	L1012
4862  09df               L5502:
4863                     ; 1144     else if (((uint16_t)CAN_Flag & 0x0403)!= RESET)
4865  09df 1e03          	ldw	x,(OFST+1,sp)
4866  09e1 01            	rrwa	x,a
4867  09e2 a403          	and	a,#3
4868  09e4 01            	rrwa	x,a
4869  09e5 a404          	and	a,#4
4870  09e7 01            	rrwa	x,a
4871  09e8 a30000        	cpw	x,#0
4872  09eb 271b          	jreq	L5602
4873                     ; 1147       if ((CAN->TSR & (uint16_t)CAN_Flag )!= RESET)
4875  09ed c65422        	ld	a,21538
4876  09f0 5f            	clrw	x
4877  09f1 97            	ld	xl,a
4878  09f2 01            	rrwa	x,a
4879  09f3 1404          	and	a,(OFST+2,sp)
4880  09f5 01            	rrwa	x,a
4881  09f6 1403          	and	a,(OFST+1,sp)
4882  09f8 01            	rrwa	x,a
4883  09f9 a30000        	cpw	x,#0
4884  09fc 2706          	jreq	L7602
4885                     ; 1150         bitstatus = SET;
4887  09fe a601          	ld	a,#1
4888  0a00 6b02          	ld	(OFST+0,sp),a
4891  0a02 2046          	jra	L1012
4892  0a04               L7602:
4893                     ; 1155         bitstatus = RESET;
4895  0a04 0f02          	clr	(OFST+0,sp)
4897  0a06 2042          	jra	L1012
4898  0a08               L5602:
4899                     ; 1161       if ((CAN->MSR & (uint16_t)CAN_Flag )!= RESET)
4901  0a08 c65421        	ld	a,21537
4902  0a0b 5f            	clrw	x
4903  0a0c 97            	ld	xl,a
4904  0a0d 01            	rrwa	x,a
4905  0a0e 1404          	and	a,(OFST+2,sp)
4906  0a10 01            	rrwa	x,a
4907  0a11 1403          	and	a,(OFST+1,sp)
4908  0a13 01            	rrwa	x,a
4909  0a14 a30000        	cpw	x,#0
4910  0a17 2706          	jreq	L5702
4911                     ; 1164         bitstatus = SET;
4913  0a19 a601          	ld	a,#1
4914  0a1b 6b02          	ld	(OFST+0,sp),a
4917  0a1d 202b          	jra	L1012
4918  0a1f               L5702:
4919                     ; 1169         bitstatus = RESET;
4921  0a1f 0f02          	clr	(OFST+0,sp)
4923  0a21 2027          	jra	L1012
4924  0a23               L3502:
4925                     ; 1176     can_page = CAN_GetSelectedPage();
4927  0a23 cd0c47        	call	_CAN_GetSelectedPage
4929  0a26 6b01          	ld	(OFST-1,sp),a
4931                     ; 1178     CAN->PSR = CAN_Page_Config;
4933  0a28 35065427      	mov	21543,#6
4934                     ; 1179     if ((CAN->Page.Config.ESR & (uint16_t)CAN_Flag) != RESET)
4936  0a2c c65428        	ld	a,21544
4937  0a2f 5f            	clrw	x
4938  0a30 97            	ld	xl,a
4939  0a31 01            	rrwa	x,a
4940  0a32 1404          	and	a,(OFST+2,sp)
4941  0a34 01            	rrwa	x,a
4942  0a35 1403          	and	a,(OFST+1,sp)
4943  0a37 01            	rrwa	x,a
4944  0a38 a30000        	cpw	x,#0
4945  0a3b 2706          	jreq	L3012
4946                     ; 1182       bitstatus = SET;
4948  0a3d a601          	ld	a,#1
4949  0a3f 6b02          	ld	(OFST+0,sp),a
4952  0a41 2002          	jra	L5012
4953  0a43               L3012:
4954                     ; 1187       bitstatus = RESET;
4956  0a43 0f02          	clr	(OFST+0,sp)
4958  0a45               L5012:
4959                     ; 1190     CAN_SelectPage(can_page);
4961  0a45 7b01          	ld	a,(OFST-1,sp)
4962  0a47 cd0c4b        	call	_CAN_SelectPage
4964  0a4a               L1012:
4965                     ; 1195   return  (FlagStatus)bitstatus;
4967  0a4a 7b02          	ld	a,(OFST+0,sp)
4970  0a4c 5b04          	addw	sp,#4
4971  0a4e 81            	ret
5030                     ; 1203 ITStatus CAN_GetITStatus(CAN_IT_TypeDef CAN_IT)
5030                     ; 1204 {
5031                     	switch	.text
5032  0a4f               _CAN_GetITStatus:
5034  0a4f 89            	pushw	x
5035  0a50 89            	pushw	x
5036       00000002      OFST:	set	2
5039                     ; 1205   ITStatus pendingbitstatus = RESET;
5041                     ; 1206   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
5043  0a51 cd0c47        	call	_CAN_GetSelectedPage
5045  0a54 6b01          	ld	(OFST-1,sp),a
5047                     ; 1209   assert_param(IS_CAN_IT_STATUS_OK(CAN_IT));
5049                     ; 1212   switch (CAN_IT)
5051  0a56 1e03          	ldw	x,(OFST+1,sp)
5053                     ; 1325     break;
5054  0a58 5a            	decw	x
5055  0a59 2746          	jreq	L7012
5056  0a5b 5a            	decw	x
5057  0a5c 2760          	jreq	L1112
5058  0a5e 1d0002        	subw	x,#2
5059  0a61 2778          	jreq	L3112
5060  0a63 1d0004        	subw	x,#4
5061  0a66 2603          	jrne	L031
5062  0a68 cc0af8        	jp	L5112
5063  0a6b               L031:
5064  0a6b 1d0078        	subw	x,#120
5065  0a6e 2603          	jrne	L231
5066  0a70 cc0b15        	jp	L7112
5067  0a73               L231:
5068  0a73 1d0080        	subw	x,#128
5069  0a76 2603          	jrne	L431
5070  0a78 cc0b4f        	jp	L3212
5071  0a7b               L431:
5072  0a7b 1d0100        	subw	x,#256
5073  0a7e 2603          	jrne	L631
5074  0a80 cc0b6c        	jp	L5212
5075  0a83               L631:
5076  0a83 1d0200        	subw	x,#512
5077  0a86 2603          	jrne	L041
5078  0a88 cc0b89        	jp	L7212
5079  0a8b               L041:
5080  0a8b 1d0400        	subw	x,#1024
5081  0a8e 2603          	jrne	L241
5082  0a90 cc0ba6        	jp	L1312
5083  0a93               L241:
5084  0a93 1d3800        	subw	x,#14336
5085  0a96 2603          	jrne	L441
5086  0a98 cc0b32        	jp	L1212
5087  0a9b               L441:
5088  0a9b               L3312:
5089                     ; 1323   default :
5089                     ; 1324     pendingbitstatus = RESET;
5091  0a9b 0f02          	clr	(OFST+0,sp)
5093                     ; 1325     break;
5095  0a9d acc10bc1      	jpf	L5612
5096  0aa1               L7012:
5097                     ; 1214   case CAN_IT_TME:
5097                     ; 1215     if ((CAN->IER & CAN_IER_TMEIE) !=RESET)
5099  0aa1 c65425        	ld	a,21541
5100  0aa4 a501          	bcp	a,#1
5101  0aa6 2710          	jreq	L7612
5102                     ; 1217       pendingbitstatus = CheckITStatus(CAN->TSR, CAN_TSR_RQCP012);
5104  0aa8 c65422        	ld	a,21538
5105  0aab ae0007        	ldw	x,#7
5106  0aae 95            	ld	xh,a
5107  0aaf cd0c4f        	call	L3_CheckITStatus
5109  0ab2 6b02          	ld	(OFST+0,sp),a
5112  0ab4 acc10bc1      	jpf	L5612
5113  0ab8               L7612:
5114                     ; 1221       pendingbitstatus = RESET;
5116  0ab8 0f02          	clr	(OFST+0,sp)
5118  0aba acc10bc1      	jpf	L5612
5119  0abe               L1112:
5120                     ; 1225   case CAN_IT_FMP:
5120                     ; 1226     if ((CAN->IER & CAN_IER_FMPIE) !=RESET)
5122  0abe c65425        	ld	a,21541
5123  0ac1 a502          	bcp	a,#2
5124  0ac3 2710          	jreq	L3712
5125                     ; 1228       pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FMP01);
5127  0ac5 c65424        	ld	a,21540
5128  0ac8 ae0003        	ldw	x,#3
5129  0acb 95            	ld	xh,a
5130  0acc cd0c4f        	call	L3_CheckITStatus
5132  0acf 6b02          	ld	(OFST+0,sp),a
5135  0ad1 acc10bc1      	jpf	L5612
5136  0ad5               L3712:
5137                     ; 1232       pendingbitstatus = RESET;
5139  0ad5 0f02          	clr	(OFST+0,sp)
5141  0ad7 acc10bc1      	jpf	L5612
5142  0adb               L3112:
5143                     ; 1235   case CAN_IT_FF:
5143                     ; 1236     if ((CAN->IER & CAN_IER_FFIE) !=RESET)
5145  0adb c65425        	ld	a,21541
5146  0ade a504          	bcp	a,#4
5147  0ae0 2710          	jreq	L7712
5148                     ; 1238       pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FULL);
5150  0ae2 c65424        	ld	a,21540
5151  0ae5 ae0008        	ldw	x,#8
5152  0ae8 95            	ld	xh,a
5153  0ae9 cd0c4f        	call	L3_CheckITStatus
5155  0aec 6b02          	ld	(OFST+0,sp),a
5158  0aee acc10bc1      	jpf	L5612
5159  0af2               L7712:
5160                     ; 1242       pendingbitstatus = RESET;
5162  0af2 0f02          	clr	(OFST+0,sp)
5164  0af4 acc10bc1      	jpf	L5612
5165  0af8               L5112:
5166                     ; 1245   case CAN_IT_FOV:
5166                     ; 1246     if ((CAN->IER & CAN_IER_FOVIE) !=RESET)
5168  0af8 c65425        	ld	a,21541
5169  0afb a508          	bcp	a,#8
5170  0afd 2710          	jreq	L3022
5171                     ; 1248       pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FOVR);
5173  0aff c65424        	ld	a,21540
5174  0b02 ae0010        	ldw	x,#16
5175  0b05 95            	ld	xh,a
5176  0b06 cd0c4f        	call	L3_CheckITStatus
5178  0b09 6b02          	ld	(OFST+0,sp),a
5181  0b0b acc10bc1      	jpf	L5612
5182  0b0f               L3022:
5183                     ; 1252       pendingbitstatus = RESET;
5185  0b0f 0f02          	clr	(OFST+0,sp)
5187  0b11 acc10bc1      	jpf	L5612
5188  0b15               L7112:
5189                     ; 1255   case CAN_IT_WKU:
5189                     ; 1256     if ((CAN->IER & CAN_IER_WKUIE) !=RESET)
5191  0b15 c65425        	ld	a,21541
5192  0b18 a580          	bcp	a,#128
5193  0b1a 2710          	jreq	L7022
5194                     ; 1258       pendingbitstatus = CheckITStatus(CAN->MSR, CAN_MSR_WKUI);
5196  0b1c c65421        	ld	a,21537
5197  0b1f ae0008        	ldw	x,#8
5198  0b22 95            	ld	xh,a
5199  0b23 cd0c4f        	call	L3_CheckITStatus
5201  0b26 6b02          	ld	(OFST+0,sp),a
5204  0b28 acc10bc1      	jpf	L5612
5205  0b2c               L7022:
5206                     ; 1262       pendingbitstatus = RESET;
5208  0b2c 0f02          	clr	(OFST+0,sp)
5210  0b2e acc10bc1      	jpf	L5612
5211  0b32               L1212:
5212                     ; 1266   case CAN_IT_ERR:
5212                     ; 1267     CAN->PSR = CAN_Page_Config;
5214  0b32 35065427      	mov	21543,#6
5215                     ; 1268     if ((CAN->Page.Config.EIER & CAN_EIER_ERRIE) !=RESET)
5217  0b36 c65429        	ld	a,21545
5218  0b39 a580          	bcp	a,#128
5219  0b3b 270e          	jreq	L3122
5220                     ; 1270       pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EWGF|CAN_ESR_EPVF|CAN_ESR_BOFF|CAN_ESR_LEC);
5222  0b3d c65428        	ld	a,21544
5223  0b40 ae0077        	ldw	x,#119
5224  0b43 95            	ld	xh,a
5225  0b44 cd0c4f        	call	L3_CheckITStatus
5227  0b47 6b02          	ld	(OFST+0,sp),a
5230  0b49 2076          	jra	L5612
5231  0b4b               L3122:
5232                     ; 1274       pendingbitstatus = RESET;
5234  0b4b 0f02          	clr	(OFST+0,sp)
5236  0b4d 2072          	jra	L5612
5237  0b4f               L3212:
5238                     ; 1278   case CAN_IT_EWG:
5238                     ; 1279     CAN->PSR = CAN_Page_Config;
5240  0b4f 35065427      	mov	21543,#6
5241                     ; 1280     if ((CAN->Page.Config.EIER & CAN_EIER_EWGIE) !=RESET)
5243  0b53 c65429        	ld	a,21545
5244  0b56 a501          	bcp	a,#1
5245  0b58 270e          	jreq	L7122
5246                     ; 1282       pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EWGF);
5248  0b5a c65428        	ld	a,21544
5249  0b5d ae0001        	ldw	x,#1
5250  0b60 95            	ld	xh,a
5251  0b61 cd0c4f        	call	L3_CheckITStatus
5253  0b64 6b02          	ld	(OFST+0,sp),a
5256  0b66 2059          	jra	L5612
5257  0b68               L7122:
5258                     ; 1286       pendingbitstatus = RESET;
5260  0b68 0f02          	clr	(OFST+0,sp)
5262  0b6a 2055          	jra	L5612
5263  0b6c               L5212:
5264                     ; 1290   case CAN_IT_EPV:
5264                     ; 1291     CAN->PSR = CAN_Page_Config;
5266  0b6c 35065427      	mov	21543,#6
5267                     ; 1292     if ((CAN->Page.Config.EIER & CAN_EIER_EPVIE) !=RESET)
5269  0b70 c65429        	ld	a,21545
5270  0b73 a502          	bcp	a,#2
5271  0b75 270e          	jreq	L3222
5272                     ; 1294       pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EPVF);
5274  0b77 c65428        	ld	a,21544
5275  0b7a ae0002        	ldw	x,#2
5276  0b7d 95            	ld	xh,a
5277  0b7e cd0c4f        	call	L3_CheckITStatus
5279  0b81 6b02          	ld	(OFST+0,sp),a
5282  0b83 203c          	jra	L5612
5283  0b85               L3222:
5284                     ; 1298       pendingbitstatus = RESET;
5286  0b85 0f02          	clr	(OFST+0,sp)
5288  0b87 2038          	jra	L5612
5289  0b89               L7212:
5290                     ; 1301   case CAN_IT_BOF:
5290                     ; 1302     CAN->PSR = CAN_Page_Config;
5292  0b89 35065427      	mov	21543,#6
5293                     ; 1303     if ((CAN->Page.Config.EIER & CAN_EIER_BOFIE) !=RESET)
5295  0b8d c65429        	ld	a,21545
5296  0b90 a504          	bcp	a,#4
5297  0b92 270e          	jreq	L7222
5298                     ; 1305       pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_BOFF);
5300  0b94 c65428        	ld	a,21544
5301  0b97 ae0004        	ldw	x,#4
5302  0b9a 95            	ld	xh,a
5303  0b9b cd0c4f        	call	L3_CheckITStatus
5305  0b9e 6b02          	ld	(OFST+0,sp),a
5308  0ba0 201f          	jra	L5612
5309  0ba2               L7222:
5310                     ; 1309       pendingbitstatus = RESET;
5312  0ba2 0f02          	clr	(OFST+0,sp)
5314  0ba4 201b          	jra	L5612
5315  0ba6               L1312:
5316                     ; 1312   case CAN_IT_LEC:
5316                     ; 1313     CAN->PSR = CAN_Page_Config;
5318  0ba6 35065427      	mov	21543,#6
5319                     ; 1314     if ((CAN->Page.Config.EIER & CAN_EIER_LECIE) !=RESET)
5321  0baa c65429        	ld	a,21545
5322  0bad a510          	bcp	a,#16
5323  0baf 270e          	jreq	L3322
5324                     ; 1316       pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_LEC);
5326  0bb1 c65428        	ld	a,21544
5327  0bb4 ae0070        	ldw	x,#112
5328  0bb7 95            	ld	xh,a
5329  0bb8 cd0c4f        	call	L3_CheckITStatus
5331  0bbb 6b02          	ld	(OFST+0,sp),a
5334  0bbd 2002          	jra	L5612
5335  0bbf               L3322:
5336                     ; 1320       pendingbitstatus = RESET;
5338  0bbf 0f02          	clr	(OFST+0,sp)
5340  0bc1               L5612:
5341                     ; 1328   CAN_SelectPage(can_page);
5343  0bc1 7b01          	ld	a,(OFST-1,sp)
5344  0bc3 cd0c4b        	call	_CAN_SelectPage
5346                     ; 1330   return  (ITStatus)pendingbitstatus;
5348  0bc6 7b02          	ld	a,(OFST+0,sp)
5351  0bc8 5b04          	addw	sp,#4
5352  0bca 81            	ret
5400                     ; 1348 void CAN_ClearITPendingBit(CAN_IT_TypeDef CAN_IT)
5400                     ; 1349 {
5401                     	switch	.text
5402  0bcb               _CAN_ClearITPendingBit:
5404  0bcb 89            	pushw	x
5405  0bcc 88            	push	a
5406       00000001      OFST:	set	1
5409                     ; 1350   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
5411  0bcd ad78          	call	_CAN_GetSelectedPage
5413  0bcf 6b01          	ld	(OFST+0,sp),a
5415                     ; 1352   assert_param(IS_CAN_IT_PENDING_BIT_OK(CAN_IT));
5417                     ; 1354   switch (CAN_IT)
5419  0bd1 1e02          	ldw	x,(OFST+1,sp)
5421                     ; 1395   default :
5421                     ; 1396     break;
5422  0bd3 5a            	decw	x
5423  0bd4 272a          	jreq	L7322
5424  0bd6 1d0003        	subw	x,#3
5425  0bd9 272b          	jreq	L1422
5426  0bdb 1d0004        	subw	x,#4
5427  0bde 272c          	jreq	L3422
5428  0be0 1d0078        	subw	x,#120
5429  0be3 272d          	jreq	L5422
5430  0be5 1d0080        	subw	x,#128
5431  0be8 273c          	jreq	L1522
5432  0bea 1d0100        	subw	x,#256
5433  0bed 273d          	jreq	L3522
5434  0bef 1d0200        	subw	x,#512
5435  0bf2 273e          	jreq	L5522
5436  0bf4 1d0400        	subw	x,#1024
5437  0bf7 273f          	jreq	L7522
5438  0bf9 1d3800        	subw	x,#14336
5439  0bfc 271a          	jreq	L7422
5440  0bfe 2040          	jra	L7032
5441  0c00               L7322:
5442                     ; 1356   case CAN_IT_TME:
5442                     ; 1357     CAN->TSR = CAN_TSR_RQCP012;/* rc_w1*/
5444  0c00 35075422      	mov	21538,#7
5445                     ; 1358     break;
5447  0c04 203a          	jra	L7032
5448  0c06               L1422:
5449                     ; 1360   case CAN_IT_FF:
5449                     ; 1361     CAN->RFR = CAN_RFR_FULL; /* rc_w1*/
5451  0c06 35085424      	mov	21540,#8
5452                     ; 1362     break;
5454  0c0a 2034          	jra	L7032
5455  0c0c               L3422:
5456                     ; 1364   case CAN_IT_FOV:
5456                     ; 1365     CAN->RFR = CAN_RFR_FOVR; /* rc_w1*/
5458  0c0c 35105424      	mov	21540,#16
5459                     ; 1366     break;
5461  0c10 202e          	jra	L7032
5462  0c12               L5422:
5463                     ; 1368   case CAN_IT_WKU:
5463                     ; 1369     CAN->MSR = CAN_MSR_WKUI;  /* rc_w1*/
5465  0c12 35085421      	mov	21537,#8
5466                     ; 1370     break;
5468  0c16 2028          	jra	L7032
5469  0c18               L7422:
5470                     ; 1372   case CAN_IT_ERR:
5470                     ; 1373     CAN->PSR = CAN_Page_Config;
5472  0c18 35065427      	mov	21543,#6
5473                     ; 1374     CAN->Page.Config.ESR = (uint8_t)CAN_ESR_RESET_VALUE;
5475  0c1c 725f5428      	clr	21544
5476                     ; 1375     CAN->MSR = CAN_MSR_ERRI;
5478  0c20 35045421      	mov	21537,#4
5479                     ; 1376     break;
5481  0c24 201a          	jra	L7032
5482  0c26               L1522:
5483                     ; 1378   case CAN_IT_EWG:
5483                     ; 1379     CAN->MSR = CAN_MSR_ERRI;
5485  0c26 35045421      	mov	21537,#4
5486                     ; 1380     break;
5488  0c2a 2014          	jra	L7032
5489  0c2c               L3522:
5490                     ; 1382   case CAN_IT_EPV:
5490                     ; 1383     CAN->MSR = CAN_MSR_ERRI;
5492  0c2c 35045421      	mov	21537,#4
5493                     ; 1384     break;
5495  0c30 200e          	jra	L7032
5496  0c32               L5522:
5497                     ; 1386   case CAN_IT_BOF:
5497                     ; 1387     CAN->MSR = CAN_MSR_ERRI;
5499  0c32 35045421      	mov	21537,#4
5500                     ; 1388     break;
5502  0c36 2008          	jra	L7032
5503  0c38               L7522:
5504                     ; 1390   case CAN_IT_LEC:
5504                     ; 1391     CAN->PSR = CAN_Page_Config;
5506  0c38 35065427      	mov	21543,#6
5507                     ; 1392     CAN->Page.Config.ESR = (uint8_t)CAN_ESR_RESET_VALUE;
5509  0c3c 725f5428      	clr	21544
5510                     ; 1393     break;
5512  0c40               L1622:
5513                     ; 1395   default :
5513                     ; 1396     break;
5515  0c40               L7032:
5516                     ; 1399   CAN_SelectPage(can_page);
5518  0c40 7b01          	ld	a,(OFST+0,sp)
5519  0c42 ad07          	call	_CAN_SelectPage
5521                     ; 1400 }
5524  0c44 5b03          	addw	sp,#3
5525  0c46 81            	ret
5550                     ; 1407 CAN_Page_TypeDef CAN_GetSelectedPage(void)
5550                     ; 1408 {
5551                     	switch	.text
5552  0c47               _CAN_GetSelectedPage:
5556                     ; 1409   return (CAN_Page_TypeDef)(CAN->PSR);
5558  0c47 c65427        	ld	a,21543
5561  0c4a 81            	ret
5596                     ; 1417 void CAN_SelectPage(CAN_Page_TypeDef CAN_Page)
5596                     ; 1418 {
5597                     	switch	.text
5598  0c4b               _CAN_SelectPage:
5602                     ; 1419   CAN->PSR = (uint8_t)CAN_Page;
5604  0c4b c75427        	ld	21543,a
5605                     ; 1420 }
5608  0c4e 81            	ret
5658                     ; 1428 static ITStatus CheckITStatus(uint8_t CAN_Reg, uint8_t It_Bit)
5658                     ; 1429 {
5659                     	switch	.text
5660  0c4f               L3_CheckITStatus:
5662  0c4f 89            	pushw	x
5663  0c50 88            	push	a
5664       00000001      OFST:	set	1
5667                     ; 1430   ITStatus pendingbitstatus = RESET;
5669                     ; 1431   if ((CAN_Reg & It_Bit) != (uint8_t)RESET)
5671  0c51 9f            	ld	a,xl
5672  0c52 1402          	and	a,(OFST+1,sp)
5673  0c54 2706          	jreq	L1632
5674                     ; 1434     pendingbitstatus = SET;
5676  0c56 a601          	ld	a,#1
5677  0c58 6b01          	ld	(OFST+0,sp),a
5680  0c5a 2002          	jra	L3632
5681  0c5c               L1632:
5682                     ; 1439     pendingbitstatus = RESET;
5684  0c5c 0f01          	clr	(OFST+0,sp)
5686  0c5e               L3632:
5687                     ; 1441   return (ITStatus)pendingbitstatus;
5689  0c5e 7b01          	ld	a,(OFST+0,sp)
5692  0c60 5b03          	addw	sp,#3
5693  0c62 81            	ret
5763                     	xdef	__FMI
5764                     	xdef	__Data
5765                     	xdef	__DLC
5766                     	xdef	__RTR
5767                     	xdef	__IDE
5768                     	xdef	__Id
5769                     	xdef	_CAN_ClearITPendingBit
5770                     	xdef	_CAN_GetITStatus
5771                     	xdef	_CAN_ClearFlag
5772                     	xdef	_CAN_GetFlagStatus
5773                     	xdef	_CAN_SelectPage
5774                     	xdef	_CAN_GetSelectedPage
5775                     	xdef	_CAN_GetLastErrorCode
5776                     	xdef	_CAN_OperatingModeRequest
5777                     	xdef	_CAN_WakeUp
5778                     	xdef	_CAN_Sleep
5779                     	xdef	_CAN_GetMessageTimeStamp
5780                     	xdef	_CAN_GetReceivedFMI
5781                     	xdef	_CAN_GetReceivedData
5782                     	xdef	_CAN_GetReceivedDLC
5783                     	xdef	_CAN_GetReceivedRTR
5784                     	xdef	_CAN_GetReceivedIDE
5785                     	xdef	_CAN_GetReceivedId
5786                     	xdef	_CAN_Receive
5787                     	xdef	_CAN_MessagePending
5788                     	xdef	_CAN_FIFORelease
5789                     	xdef	_CAN_CancelTransmit
5790                     	xdef	_CAN_TransmitStatus
5791                     	xdef	_CAN_TTComModeCmd
5792                     	xdef	_CAN_Transmit
5793                     	xdef	_CAN_ST7CompatibilityCmd
5794                     	xdef	_CAN_ITConfig
5795                     	xdef	_CAN_FilterInit
5796                     	xdef	_CAN_Init
5797                     	xdef	_CAN_DeInit
5798                     	xref.b	c_lreg
5799                     	xref.b	c_x
5800                     	xref.b	c_y
5819                     	xref	c_uitol
5820                     	xref	c_uitolx
5821                     	xref	c_llsh
5822                     	xref	c_umul
5823                     	xref	c_lor
5824                     	xref	c_rtol
5825                     	xref	c_lursh
5826                     	xref	c_ltor
5827                     	xref	c_lgursh
5828                     	end
