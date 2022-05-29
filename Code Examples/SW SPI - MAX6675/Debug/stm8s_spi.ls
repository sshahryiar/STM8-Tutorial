   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  42                     ; 50 void SPI_DeInit(void)
  42                     ; 51 {
  44                     	switch	.text
  45  0000               _SPI_DeInit:
  49                     ; 52   SPI->CR1    = SPI_CR1_RESET_VALUE;
  51  0000 725f5200      	clr	20992
  52                     ; 53   SPI->CR2    = SPI_CR2_RESET_VALUE;
  54  0004 725f5201      	clr	20993
  55                     ; 54   SPI->ICR    = SPI_ICR_RESET_VALUE;
  57  0008 725f5202      	clr	20994
  58                     ; 55   SPI->SR     = SPI_SR_RESET_VALUE;
  60  000c 35025203      	mov	20995,#2
  61                     ; 56   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  63  0010 35075205      	mov	20997,#7
  64                     ; 57 }
  67  0014 81            	ret
 383                     ; 78 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 383                     ; 79 {
 384                     	switch	.text
 385  0015               _SPI_Init:
 387  0015 89            	pushw	x
 388  0016 88            	push	a
 389       00000001      OFST:	set	1
 392                     ; 81   assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 394                     ; 82   assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 396                     ; 83   assert_param(IS_SPI_MODE_OK(Mode));
 398                     ; 84   assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 400                     ; 85   assert_param(IS_SPI_PHASE_OK(ClockPhase));
 402                     ; 86   assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 404                     ; 87   assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 406                     ; 88   assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 408                     ; 91   SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 408                     ; 92                        (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 410  0017 7b07          	ld	a,(OFST+6,sp)
 411  0019 1a08          	or	a,(OFST+7,sp)
 412  001b 6b01          	ld	(OFST+0,sp),a
 414  001d 9f            	ld	a,xl
 415  001e 1a02          	or	a,(OFST+1,sp)
 416  0020 1a01          	or	a,(OFST+0,sp)
 417  0022 c75200        	ld	20992,a
 418                     ; 95   SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 420  0025 7b09          	ld	a,(OFST+8,sp)
 421  0027 1a0a          	or	a,(OFST+9,sp)
 422  0029 c75201        	ld	20993,a
 423                     ; 97   if (Mode == SPI_MODE_MASTER)
 425  002c 7b06          	ld	a,(OFST+5,sp)
 426  002e a104          	cp	a,#4
 427  0030 2606          	jrne	L302
 428                     ; 99     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 430  0032 72105201      	bset	20993,#0
 432  0036 2004          	jra	L502
 433  0038               L302:
 434                     ; 103     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 436  0038 72115201      	bres	20993,#0
 437  003c               L502:
 438                     ; 107   SPI->CR1 |= (uint8_t)(Mode);
 440  003c c65200        	ld	a,20992
 441  003f 1a06          	or	a,(OFST+5,sp)
 442  0041 c75200        	ld	20992,a
 443                     ; 110   SPI->CRCPR = (uint8_t)CRCPolynomial;
 445  0044 7b0b          	ld	a,(OFST+10,sp)
 446  0046 c75205        	ld	20997,a
 447                     ; 111 }
 450  0049 5b03          	addw	sp,#3
 451  004b 81            	ret
 506                     ; 119 void SPI_Cmd(FunctionalState NewState)
 506                     ; 120 {
 507                     	switch	.text
 508  004c               _SPI_Cmd:
 512                     ; 122   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 514                     ; 124   if (NewState != DISABLE)
 516  004c 4d            	tnz	a
 517  004d 2706          	jreq	L532
 518                     ; 126     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 520  004f 721c5200      	bset	20992,#6
 522  0053 2004          	jra	L732
 523  0055               L532:
 524                     ; 130     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 526  0055 721d5200      	bres	20992,#6
 527  0059               L732:
 528                     ; 132 }
 531  0059 81            	ret
 640                     ; 141 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 640                     ; 142 {
 641                     	switch	.text
 642  005a               _SPI_ITConfig:
 644  005a 89            	pushw	x
 645  005b 88            	push	a
 646       00000001      OFST:	set	1
 649                     ; 143   uint8_t itpos = 0;
 651                     ; 145   assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 653                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 655                     ; 149   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 657  005c 9e            	ld	a,xh
 658  005d a40f          	and	a,#15
 659  005f 5f            	clrw	x
 660  0060 97            	ld	xl,a
 661  0061 a601          	ld	a,#1
 662  0063 5d            	tnzw	x
 663  0064 2704          	jreq	L41
 664  0066               L61:
 665  0066 48            	sll	a
 666  0067 5a            	decw	x
 667  0068 26fc          	jrne	L61
 668  006a               L41:
 669  006a 6b01          	ld	(OFST+0,sp),a
 671                     ; 151   if (NewState != DISABLE)
 673  006c 0d03          	tnz	(OFST+2,sp)
 674  006e 270a          	jreq	L113
 675                     ; 153     SPI->ICR |= itpos; /* Enable interrupt*/
 677  0070 c65202        	ld	a,20994
 678  0073 1a01          	or	a,(OFST+0,sp)
 679  0075 c75202        	ld	20994,a
 681  0078 2009          	jra	L313
 682  007a               L113:
 683                     ; 157     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 685  007a 7b01          	ld	a,(OFST+0,sp)
 686  007c 43            	cpl	a
 687  007d c45202        	and	a,20994
 688  0080 c75202        	ld	20994,a
 689  0083               L313:
 690                     ; 159 }
 693  0083 5b03          	addw	sp,#3
 694  0085 81            	ret
 728                     ; 166 void SPI_SendData(uint8_t Data)
 728                     ; 167 {
 729                     	switch	.text
 730  0086               _SPI_SendData:
 734                     ; 168   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 736  0086 c75204        	ld	20996,a
 737                     ; 169 }
 740  0089 81            	ret
 763                     ; 176 uint8_t SPI_ReceiveData(void)
 763                     ; 177 {
 764                     	switch	.text
 765  008a               _SPI_ReceiveData:
 769                     ; 178   return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 771  008a c65204        	ld	a,20996
 774  008d 81            	ret
 810                     ; 187 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 810                     ; 188 {
 811                     	switch	.text
 812  008e               _SPI_NSSInternalSoftwareCmd:
 816                     ; 190   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 818                     ; 192   if (NewState != DISABLE)
 820  008e 4d            	tnz	a
 821  008f 2706          	jreq	L163
 822                     ; 194     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 824  0091 72105201      	bset	20993,#0
 826  0095 2004          	jra	L363
 827  0097               L163:
 828                     ; 198     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 830  0097 72115201      	bres	20993,#0
 831  009b               L363:
 832                     ; 200 }
 835  009b 81            	ret
 858                     ; 207 void SPI_TransmitCRC(void)
 858                     ; 208 {
 859                     	switch	.text
 860  009c               _SPI_TransmitCRC:
 864                     ; 209   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 866  009c 72185201      	bset	20993,#4
 867                     ; 210 }
 870  00a0 81            	ret
 906                     ; 218 void SPI_CalculateCRCCmd(FunctionalState NewState)
 906                     ; 219 {
 907                     	switch	.text
 908  00a1               _SPI_CalculateCRCCmd:
 912                     ; 221   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 914                     ; 223   if (NewState != DISABLE)
 916  00a1 4d            	tnz	a
 917  00a2 2706          	jreq	L314
 918                     ; 225     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
 920  00a4 721a5201      	bset	20993,#5
 922  00a8 2004          	jra	L514
 923  00aa               L314:
 924                     ; 229     SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
 926  00aa 721b5201      	bres	20993,#5
 927  00ae               L514:
 928                     ; 231 }
 931  00ae 81            	ret
 995                     ; 238 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
 995                     ; 239 {
 996                     	switch	.text
 997  00af               _SPI_GetCRC:
 999  00af 88            	push	a
1000       00000001      OFST:	set	1
1003                     ; 240   uint8_t crcreg = 0;
1005                     ; 243   assert_param(IS_SPI_CRC_OK(SPI_CRC));
1007                     ; 245   if (SPI_CRC != SPI_CRC_RX)
1009  00b0 4d            	tnz	a
1010  00b1 2707          	jreq	L154
1011                     ; 247     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1013  00b3 c65207        	ld	a,20999
1014  00b6 6b01          	ld	(OFST+0,sp),a
1017  00b8 2005          	jra	L354
1018  00ba               L154:
1019                     ; 251     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1021  00ba c65206        	ld	a,20998
1022  00bd 6b01          	ld	(OFST+0,sp),a
1024  00bf               L354:
1025                     ; 255   return crcreg;
1027  00bf 7b01          	ld	a,(OFST+0,sp)
1030  00c1 5b01          	addw	sp,#1
1031  00c3 81            	ret
1056                     ; 263 void SPI_ResetCRC(void)
1056                     ; 264 {
1057                     	switch	.text
1058  00c4               _SPI_ResetCRC:
1062                     ; 267   SPI_CalculateCRCCmd(ENABLE);
1064  00c4 a601          	ld	a,#1
1065  00c6 add9          	call	_SPI_CalculateCRCCmd
1067                     ; 270   SPI_Cmd(ENABLE);
1069  00c8 a601          	ld	a,#1
1070  00ca ad80          	call	_SPI_Cmd
1072                     ; 271 }
1075  00cc 81            	ret
1099                     ; 278 uint8_t SPI_GetCRCPolynomial(void)
1099                     ; 279 {
1100                     	switch	.text
1101  00cd               _SPI_GetCRCPolynomial:
1105                     ; 280   return SPI->CRCPR; /* Return the CRC polynomial register */
1107  00cd c65205        	ld	a,20997
1110  00d0 81            	ret
1166                     ; 288 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1166                     ; 289 {
1167                     	switch	.text
1168  00d1               _SPI_BiDirectionalLineConfig:
1172                     ; 291   assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1174                     ; 293   if (SPI_Direction != SPI_DIRECTION_RX)
1176  00d1 4d            	tnz	a
1177  00d2 2706          	jreq	L325
1178                     ; 295     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1180  00d4 721c5201      	bset	20993,#6
1182  00d8 2004          	jra	L525
1183  00da               L325:
1184                     ; 299     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1186  00da 721d5201      	bres	20993,#6
1187  00de               L525:
1188                     ; 301 }
1191  00de 81            	ret
1312                     ; 311 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1312                     ; 312 {
1313                     	switch	.text
1314  00df               _SPI_GetFlagStatus:
1316  00df 88            	push	a
1317       00000001      OFST:	set	1
1320                     ; 313   FlagStatus status = RESET;
1322                     ; 315   assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1324                     ; 318   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1326  00e0 c45203        	and	a,20995
1327  00e3 2706          	jreq	L306
1328                     ; 320     status = SET; /* SPI_FLAG is set */
1330  00e5 a601          	ld	a,#1
1331  00e7 6b01          	ld	(OFST+0,sp),a
1334  00e9 2002          	jra	L506
1335  00eb               L306:
1336                     ; 324     status = RESET; /* SPI_FLAG is reset*/
1338  00eb 0f01          	clr	(OFST+0,sp)
1340  00ed               L506:
1341                     ; 328   return status;
1343  00ed 7b01          	ld	a,(OFST+0,sp)
1346  00ef 5b01          	addw	sp,#1
1347  00f1 81            	ret
1382                     ; 346 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1382                     ; 347 {
1383                     	switch	.text
1384  00f2               _SPI_ClearFlag:
1388                     ; 348   assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1390                     ; 350   SPI->SR = (uint8_t)(~SPI_FLAG);
1392  00f2 43            	cpl	a
1393  00f3 c75203        	ld	20995,a
1394                     ; 351 }
1397  00f6 81            	ret
1479                     ; 366 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1479                     ; 367 {
1480                     	switch	.text
1481  00f7               _SPI_GetITStatus:
1483  00f7 88            	push	a
1484  00f8 89            	pushw	x
1485       00000002      OFST:	set	2
1488                     ; 368   ITStatus pendingbitstatus = RESET;
1490                     ; 369   uint8_t itpos = 0;
1492                     ; 370   uint8_t itmask1 = 0;
1494                     ; 371   uint8_t itmask2 = 0;
1496                     ; 372   uint8_t enablestatus = 0;
1498                     ; 373   assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1500                     ; 375   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1502  00f9 a40f          	and	a,#15
1503  00fb 5f            	clrw	x
1504  00fc 97            	ld	xl,a
1505  00fd a601          	ld	a,#1
1506  00ff 5d            	tnzw	x
1507  0100 2704          	jreq	L05
1508  0102               L25:
1509  0102 48            	sll	a
1510  0103 5a            	decw	x
1511  0104 26fc          	jrne	L25
1512  0106               L05:
1513  0106 6b01          	ld	(OFST-1,sp),a
1515                     ; 378   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1517  0108 7b03          	ld	a,(OFST+1,sp)
1518  010a 4e            	swap	a
1519  010b a40f          	and	a,#15
1520  010d 6b02          	ld	(OFST+0,sp),a
1522                     ; 380   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1524  010f 7b02          	ld	a,(OFST+0,sp)
1525  0111 5f            	clrw	x
1526  0112 97            	ld	xl,a
1527  0113 a601          	ld	a,#1
1528  0115 5d            	tnzw	x
1529  0116 2704          	jreq	L45
1530  0118               L65:
1531  0118 48            	sll	a
1532  0119 5a            	decw	x
1533  011a 26fc          	jrne	L65
1534  011c               L45:
1535  011c 6b02          	ld	(OFST+0,sp),a
1537                     ; 382   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1539  011e c65203        	ld	a,20995
1540  0121 1402          	and	a,(OFST+0,sp)
1541  0123 6b02          	ld	(OFST+0,sp),a
1543                     ; 384   if (((SPI->ICR & itpos) != RESET) && enablestatus)
1545  0125 c65202        	ld	a,20994
1546  0128 1501          	bcp	a,(OFST-1,sp)
1547  012a 270a          	jreq	L766
1549  012c 0d02          	tnz	(OFST+0,sp)
1550  012e 2706          	jreq	L766
1551                     ; 387     pendingbitstatus = SET;
1553  0130 a601          	ld	a,#1
1554  0132 6b02          	ld	(OFST+0,sp),a
1557  0134 2002          	jra	L176
1558  0136               L766:
1559                     ; 392     pendingbitstatus = RESET;
1561  0136 0f02          	clr	(OFST+0,sp)
1563  0138               L176:
1564                     ; 395   return  pendingbitstatus;
1566  0138 7b02          	ld	a,(OFST+0,sp)
1569  013a 5b03          	addw	sp,#3
1570  013c 81            	ret
1615                     ; 412 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1615                     ; 413 {
1616                     	switch	.text
1617  013d               _SPI_ClearITPendingBit:
1619  013d 88            	push	a
1620       00000001      OFST:	set	1
1623                     ; 414   uint8_t itpos = 0;
1625                     ; 415   assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
1627                     ; 420   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
1629  013e a4f0          	and	a,#240
1630  0140 4e            	swap	a
1631  0141 a40f          	and	a,#15
1632  0143 5f            	clrw	x
1633  0144 97            	ld	xl,a
1634  0145 a601          	ld	a,#1
1635  0147 5d            	tnzw	x
1636  0148 2704          	jreq	L26
1637  014a               L46:
1638  014a 48            	sll	a
1639  014b 5a            	decw	x
1640  014c 26fc          	jrne	L46
1641  014e               L26:
1642  014e 6b01          	ld	(OFST+0,sp),a
1644                     ; 422   SPI->SR = (uint8_t)(~itpos);
1646  0150 7b01          	ld	a,(OFST+0,sp)
1647  0152 43            	cpl	a
1648  0153 c75203        	ld	20995,a
1649                     ; 424 }
1652  0156 84            	pop	a
1653  0157 81            	ret
1666                     	xdef	_SPI_ClearITPendingBit
1667                     	xdef	_SPI_GetITStatus
1668                     	xdef	_SPI_ClearFlag
1669                     	xdef	_SPI_GetFlagStatus
1670                     	xdef	_SPI_BiDirectionalLineConfig
1671                     	xdef	_SPI_GetCRCPolynomial
1672                     	xdef	_SPI_ResetCRC
1673                     	xdef	_SPI_GetCRC
1674                     	xdef	_SPI_CalculateCRCCmd
1675                     	xdef	_SPI_TransmitCRC
1676                     	xdef	_SPI_NSSInternalSoftwareCmd
1677                     	xdef	_SPI_ReceiveData
1678                     	xdef	_SPI_SendData
1679                     	xdef	_SPI_ITConfig
1680                     	xdef	_SPI_Cmd
1681                     	xdef	_SPI_Init
1682                     	xdef	_SPI_DeInit
1701                     	end
