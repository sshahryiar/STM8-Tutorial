   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  74                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  74                     ; 88 {
  76                     	switch	.text
  77  0000               _FLASH_Unlock:
  81                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  83                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
  85  0000 a1fd          	cp	a,#253
  86  0002 260a          	jrne	L73
  87                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
  89  0004 35565062      	mov	20578,#86
  90                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
  92  0008 35ae5062      	mov	20578,#174
  94  000c 2008          	jra	L14
  95  000e               L73:
  96                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
  98  000e 35ae5064      	mov	20580,#174
  99                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
 101  0012 35565064      	mov	20580,#86
 102  0016               L14:
 103                     ; 104 }
 106  0016 81            	ret
 141                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 141                     ; 113 {
 142                     	switch	.text
 143  0017               _FLASH_Lock:
 147                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 149                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 151  0017 c4505f        	and	a,20575
 152  001a c7505f        	ld	20575,a
 153                     ; 119 }
 156  001d 81            	ret
 179                     ; 126 void FLASH_DeInit(void)
 179                     ; 127 {
 180                     	switch	.text
 181  001e               _FLASH_DeInit:
 185                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 187  001e 725f505a      	clr	20570
 188                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 190  0022 725f505b      	clr	20571
 191                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 193  0026 35ff505c      	mov	20572,#255
 194                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 196  002a 7217505f      	bres	20575,#3
 197                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 199  002e 7213505f      	bres	20575,#1
 200                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 202  0032 c6505f        	ld	a,20575
 203                     ; 134 }
 206  0035 81            	ret
 261                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 261                     ; 143 {
 262                     	switch	.text
 263  0036               _FLASH_ITConfig:
 267                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 269                     ; 147   if(NewState != DISABLE)
 271  0036 4d            	tnz	a
 272  0037 2706          	jreq	L711
 273                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 275  0039 7212505a      	bset	20570,#1
 277  003d 2004          	jra	L121
 278  003f               L711:
 279                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 281  003f 7213505a      	bres	20570,#1
 282  0043               L121:
 283                     ; 155 }
 286  0043 81            	ret
 320                     ; 164 void FLASH_EraseByte(uint32_t Address)
 320                     ; 165 {
 321                     	switch	.text
 322  0044               _FLASH_EraseByte:
 324       00000000      OFST:	set	0
 327                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 329                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 331  0044 1e05          	ldw	x,(OFST+5,sp)
 332  0046 7f            	clr	(x)
 333                     ; 171 }
 336  0047 81            	ret
 379                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 379                     ; 182 {
 380                     	switch	.text
 381  0048               _FLASH_ProgramByte:
 383       00000000      OFST:	set	0
 386                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 388                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 390  0048 7b07          	ld	a,(OFST+7,sp)
 391  004a 1e05          	ldw	x,(OFST+5,sp)
 392  004c f7            	ld	(x),a
 393                     ; 186 }
 396  004d 81            	ret
 430                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 430                     ; 196 {
 431                     	switch	.text
 432  004e               _FLASH_ReadByte:
 434       00000000      OFST:	set	0
 437                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 439                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 441  004e 1e05          	ldw	x,(OFST+5,sp)
 442  0050 f6            	ld	a,(x)
 445  0051 81            	ret
 488                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 488                     ; 213 {
 489                     	switch	.text
 490  0052               _FLASH_ProgramWord:
 492       00000000      OFST:	set	0
 495                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 497                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 499  0052 721c505b      	bset	20571,#6
 500                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 502  0056 721d505c      	bres	20572,#6
 503                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 505  005a 7b07          	ld	a,(OFST+7,sp)
 506  005c 1e05          	ldw	x,(OFST+5,sp)
 507  005e f7            	ld	(x),a
 508                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 510  005f 7b08          	ld	a,(OFST+8,sp)
 511  0061 1e05          	ldw	x,(OFST+5,sp)
 512  0063 e701          	ld	(1,x),a
 513                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 515  0065 7b09          	ld	a,(OFST+9,sp)
 516  0067 1e05          	ldw	x,(OFST+5,sp)
 517  0069 e702          	ld	(2,x),a
 518                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 520  006b 7b0a          	ld	a,(OFST+10,sp)
 521  006d 1e05          	ldw	x,(OFST+5,sp)
 522  006f e703          	ld	(3,x),a
 523                     ; 229 }
 526  0071 81            	ret
 571                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 571                     ; 238 {
 572                     	switch	.text
 573  0072               _FLASH_ProgramOptionByte:
 575  0072 89            	pushw	x
 576       00000000      OFST:	set	0
 579                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 581                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 583  0073 721e505b      	bset	20571,#7
 584                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 586  0077 721f505c      	bres	20572,#7
 587                     ; 247   if(Address == 0x4800)
 589  007b a34800        	cpw	x,#18432
 590  007e 2607          	jrne	L542
 591                     ; 250     *((NEAR uint8_t*)Address) = Data;
 593  0080 7b05          	ld	a,(OFST+5,sp)
 594  0082 1e01          	ldw	x,(OFST+1,sp)
 595  0084 f7            	ld	(x),a
 597  0085 200c          	jra	L742
 598  0087               L542:
 599                     ; 255     *((NEAR uint8_t*)Address) = Data;
 601  0087 7b05          	ld	a,(OFST+5,sp)
 602  0089 1e01          	ldw	x,(OFST+1,sp)
 603  008b f7            	ld	(x),a
 604                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 606  008c 7b05          	ld	a,(OFST+5,sp)
 607  008e 43            	cpl	a
 608  008f 1e01          	ldw	x,(OFST+1,sp)
 609  0091 e701          	ld	(1,x),a
 610  0093               L742:
 611                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 613  0093 a6fd          	ld	a,#253
 614  0095 cd017d        	call	_FLASH_WaitForLastOperation
 616                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 618  0098 721f505b      	bres	20571,#7
 619                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 621  009c 721e505c      	bset	20572,#7
 622                     ; 263 }
 625  00a0 85            	popw	x
 626  00a1 81            	ret
 662                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 662                     ; 271 {
 663                     	switch	.text
 664  00a2               _FLASH_EraseOptionByte:
 666  00a2 89            	pushw	x
 667       00000000      OFST:	set	0
 670                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 672                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 674  00a3 721e505b      	bset	20571,#7
 675                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 677  00a7 721f505c      	bres	20572,#7
 678                     ; 280   if(Address == 0x4800)
 680  00ab a34800        	cpw	x,#18432
 681  00ae 2603          	jrne	L762
 682                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 684  00b0 7f            	clr	(x)
 686  00b1 2009          	jra	L172
 687  00b3               L762:
 688                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 690  00b3 1e01          	ldw	x,(OFST+1,sp)
 691  00b5 7f            	clr	(x)
 692                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 694  00b6 1e01          	ldw	x,(OFST+1,sp)
 695  00b8 a6ff          	ld	a,#255
 696  00ba e701          	ld	(1,x),a
 697  00bc               L172:
 698                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 700  00bc a6fd          	ld	a,#253
 701  00be cd017d        	call	_FLASH_WaitForLastOperation
 703                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 705  00c1 721f505b      	bres	20571,#7
 706                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 708  00c5 721e505c      	bset	20572,#7
 709                     ; 296 }
 712  00c9 85            	popw	x
 713  00ca 81            	ret
 776                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
 776                     ; 304 {
 777                     	switch	.text
 778  00cb               _FLASH_ReadOptionByte:
 780  00cb 5204          	subw	sp,#4
 781       00000004      OFST:	set	4
 784                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
 786                     ; 306   uint16_t res_value = 0;
 788                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 790                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
 792  00cd f6            	ld	a,(x)
 793  00ce 6b01          	ld	(OFST-3,sp),a
 795                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
 797  00d0 e601          	ld	a,(1,x)
 798  00d2 6b02          	ld	(OFST-2,sp),a
 800                     ; 315   if(Address == 0x4800)	 
 802  00d4 a34800        	cpw	x,#18432
 803  00d7 2608          	jrne	L523
 804                     ; 317     res_value =	 value_optbyte;
 806  00d9 7b01          	ld	a,(OFST-3,sp)
 807  00db 5f            	clrw	x
 808  00dc 97            	ld	xl,a
 809  00dd 1f03          	ldw	(OFST-1,sp),x
 812  00df 2023          	jra	L723
 813  00e1               L523:
 814                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
 816  00e1 7b02          	ld	a,(OFST-2,sp)
 817  00e3 43            	cpl	a
 818  00e4 1101          	cp	a,(OFST-3,sp)
 819  00e6 2617          	jrne	L133
 820                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
 822  00e8 7b01          	ld	a,(OFST-3,sp)
 823  00ea 5f            	clrw	x
 824  00eb 97            	ld	xl,a
 825  00ec 4f            	clr	a
 826  00ed 02            	rlwa	x,a
 827  00ee 1f03          	ldw	(OFST-1,sp),x
 829                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
 831  00f0 7b02          	ld	a,(OFST-2,sp)
 832  00f2 5f            	clrw	x
 833  00f3 97            	ld	xl,a
 834  00f4 01            	rrwa	x,a
 835  00f5 1a04          	or	a,(OFST+0,sp)
 836  00f7 01            	rrwa	x,a
 837  00f8 1a03          	or	a,(OFST-1,sp)
 838  00fa 01            	rrwa	x,a
 839  00fb 1f03          	ldw	(OFST-1,sp),x
 842  00fd 2005          	jra	L723
 843  00ff               L133:
 844                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
 846  00ff ae5555        	ldw	x,#21845
 847  0102 1f03          	ldw	(OFST-1,sp),x
 849  0104               L723:
 850                     ; 331   return(res_value);
 852  0104 1e03          	ldw	x,(OFST-1,sp)
 855  0106 5b04          	addw	sp,#4
 856  0108 81            	ret
 930                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
 930                     ; 341 {
 931                     	switch	.text
 932  0109               _FLASH_SetLowPowerMode:
 934  0109 88            	push	a
 935       00000000      OFST:	set	0
 938                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
 940                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
 942  010a c6505a        	ld	a,20570
 943  010d a4f3          	and	a,#243
 944  010f c7505a        	ld	20570,a
 945                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
 947  0112 c6505a        	ld	a,20570
 948  0115 1a01          	or	a,(OFST+1,sp)
 949  0117 c7505a        	ld	20570,a
 950                     ; 350 }
 953  011a 84            	pop	a
 954  011b 81            	ret
1012                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1012                     ; 359 {
1013                     	switch	.text
1014  011c               _FLASH_SetProgrammingTime:
1018                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1020                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1022  011c 7211505a      	bres	20570,#0
1023                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1025  0120 ca505a        	or	a,20570
1026  0123 c7505a        	ld	20570,a
1027                     ; 365 }
1030  0126 81            	ret
1055                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1055                     ; 373 {
1056                     	switch	.text
1057  0127               _FLASH_GetLowPowerMode:
1061                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1063  0127 c6505a        	ld	a,20570
1064  012a a40c          	and	a,#12
1067  012c 81            	ret
1092                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1092                     ; 383 {
1093                     	switch	.text
1094  012d               _FLASH_GetProgrammingTime:
1098                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1100  012d c6505a        	ld	a,20570
1101  0130 a401          	and	a,#1
1104  0132 81            	ret
1138                     ; 392 uint32_t FLASH_GetBootSize(void)
1138                     ; 393 {
1139                     	switch	.text
1140  0133               _FLASH_GetBootSize:
1142  0133 5204          	subw	sp,#4
1143       00000004      OFST:	set	4
1146                     ; 394   uint32_t temp = 0;
1148                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1150  0135 c6505d        	ld	a,20573
1151  0138 5f            	clrw	x
1152  0139 97            	ld	xl,a
1153  013a 90ae0200      	ldw	y,#512
1154  013e cd0000        	call	c_umul
1156  0141 96            	ldw	x,sp
1157  0142 1c0001        	addw	x,#OFST-3
1158  0145 cd0000        	call	c_rtol
1161                     ; 400   if(FLASH->FPR == 0xFF)
1163  0148 c6505d        	ld	a,20573
1164  014b a1ff          	cp	a,#255
1165  014d 2611          	jrne	L354
1166                     ; 402     temp += 512;
1168  014f ae0200        	ldw	x,#512
1169  0152 bf02          	ldw	c_lreg+2,x
1170  0154 ae0000        	ldw	x,#0
1171  0157 bf00          	ldw	c_lreg,x
1172  0159 96            	ldw	x,sp
1173  015a 1c0001        	addw	x,#OFST-3
1174  015d cd0000        	call	c_lgadd
1177  0160               L354:
1178                     ; 406   return(temp);
1180  0160 96            	ldw	x,sp
1181  0161 1c0001        	addw	x,#OFST-3
1182  0164 cd0000        	call	c_ltor
1186  0167 5b04          	addw	sp,#4
1187  0169 81            	ret
1296                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1296                     ; 418 {
1297                     	switch	.text
1298  016a               _FLASH_GetFlagStatus:
1300  016a 88            	push	a
1301       00000001      OFST:	set	1
1304                     ; 419   FlagStatus status = RESET;
1306                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1308                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1310  016b c4505f        	and	a,20575
1311  016e 2706          	jreq	L525
1312                     ; 426     status = SET; /* FLASH_FLAG is set */
1314  0170 a601          	ld	a,#1
1315  0172 6b01          	ld	(OFST+0,sp),a
1318  0174 2002          	jra	L725
1319  0176               L525:
1320                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1322  0176 0f01          	clr	(OFST+0,sp)
1324  0178               L725:
1325                     ; 434   return status;
1327  0178 7b01          	ld	a,(OFST+0,sp)
1330  017a 5b01          	addw	sp,#1
1331  017c 81            	ret
1424                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1424                     ; 550 {
1425                     	switch	.text
1426  017d               _FLASH_WaitForLastOperation:
1428  017d 5203          	subw	sp,#3
1429       00000003      OFST:	set	3
1432                     ; 551   uint8_t flagstatus = 0x00;
1434  017f 0f03          	clr	(OFST+0,sp)
1436                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1438  0181 aeffff        	ldw	x,#65535
1439  0184 1f01          	ldw	(OFST-2,sp),x
1441                     ; 557     if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1443  0186 a1fd          	cp	a,#253
1444  0188 2628          	jrne	L116
1446  018a 200e          	jra	L775
1447  018c               L575:
1448                     ; 561         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1448                     ; 562                                                         FLASH_IAPSR_WR_PG_DIS));
1450  018c c6505f        	ld	a,20575
1451  018f a405          	and	a,#5
1452  0191 6b03          	ld	(OFST+0,sp),a
1454                     ; 563         timeout--;
1456  0193 1e01          	ldw	x,(OFST-2,sp)
1457  0195 1d0001        	subw	x,#1
1458  0198 1f01          	ldw	(OFST-2,sp),x
1460  019a               L775:
1461                     ; 559       while((flagstatus == 0x00) && (timeout != 0x00))
1463  019a 0d03          	tnz	(OFST+0,sp)
1464  019c 261c          	jrne	L506
1466  019e 1e01          	ldw	x,(OFST-2,sp)
1467  01a0 26ea          	jrne	L575
1468  01a2 2016          	jra	L506
1469  01a4               L706:
1470                     ; 570         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1470                     ; 571                                                         FLASH_IAPSR_WR_PG_DIS));
1472  01a4 c6505f        	ld	a,20575
1473  01a7 a441          	and	a,#65
1474  01a9 6b03          	ld	(OFST+0,sp),a
1476                     ; 572         timeout--;
1478  01ab 1e01          	ldw	x,(OFST-2,sp)
1479  01ad 1d0001        	subw	x,#1
1480  01b0 1f01          	ldw	(OFST-2,sp),x
1482  01b2               L116:
1483                     ; 568       while((flagstatus == 0x00) && (timeout != 0x00))
1485  01b2 0d03          	tnz	(OFST+0,sp)
1486  01b4 2604          	jrne	L506
1488  01b6 1e01          	ldw	x,(OFST-2,sp)
1489  01b8 26ea          	jrne	L706
1490  01ba               L506:
1491                     ; 583   if(timeout == 0x00 )
1493  01ba 1e01          	ldw	x,(OFST-2,sp)
1494  01bc 2604          	jrne	L716
1495                     ; 585     flagstatus = FLASH_STATUS_TIMEOUT;
1497  01be a602          	ld	a,#2
1498  01c0 6b03          	ld	(OFST+0,sp),a
1500  01c2               L716:
1501                     ; 588   return((FLASH_Status_TypeDef)flagstatus);
1503  01c2 7b03          	ld	a,(OFST+0,sp)
1506  01c4 5b03          	addw	sp,#3
1507  01c6 81            	ret
1570                     ; 598 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1570                     ; 599 {
1571                     	switch	.text
1572  01c7               _FLASH_EraseBlock:
1574  01c7 89            	pushw	x
1575  01c8 5206          	subw	sp,#6
1576       00000006      OFST:	set	6
1579                     ; 600   uint32_t startaddress = 0;
1581                     ; 610   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1583                     ; 611   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1585  01ca 7b0b          	ld	a,(OFST+5,sp)
1586  01cc a1fd          	cp	a,#253
1587  01ce 260c          	jrne	L356
1588                     ; 613     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1590                     ; 614     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1592  01d0 ae8000        	ldw	x,#32768
1593  01d3 1f05          	ldw	(OFST-1,sp),x
1594  01d5 ae0000        	ldw	x,#0
1595  01d8 1f03          	ldw	(OFST-3,sp),x
1598  01da 200a          	jra	L556
1599  01dc               L356:
1600                     ; 618     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1602                     ; 619     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1604  01dc ae4000        	ldw	x,#16384
1605  01df 1f05          	ldw	(OFST-1,sp),x
1606  01e1 ae0000        	ldw	x,#0
1607  01e4 1f03          	ldw	(OFST-3,sp),x
1609  01e6               L556:
1610                     ; 627     pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1612  01e6 1e07          	ldw	x,(OFST+1,sp)
1613  01e8 a680          	ld	a,#128
1614  01ea cd0000        	call	c_cmulx
1616  01ed 96            	ldw	x,sp
1617  01ee 1c0003        	addw	x,#OFST-3
1618  01f1 cd0000        	call	c_ladd
1620  01f4 be02          	ldw	x,c_lreg+2
1621  01f6 1f01          	ldw	(OFST-5,sp),x
1623                     ; 631   FLASH->CR2 |= FLASH_CR2_ERASE;
1625  01f8 721a505b      	bset	20571,#5
1626                     ; 632   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1628  01fc 721b505c      	bres	20572,#5
1629                     ; 636     *pwFlash = (uint32_t)0;
1631  0200 1e01          	ldw	x,(OFST-5,sp)
1632  0202 a600          	ld	a,#0
1633  0204 e703          	ld	(3,x),a
1634  0206 a600          	ld	a,#0
1635  0208 e702          	ld	(2,x),a
1636  020a a600          	ld	a,#0
1637  020c e701          	ld	(1,x),a
1638  020e a600          	ld	a,#0
1639  0210 f7            	ld	(x),a
1640                     ; 644 }
1643  0211 5b08          	addw	sp,#8
1644  0213 81            	ret
1748                     ; 655 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
1748                     ; 656                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1748                     ; 657 {
1749                     	switch	.text
1750  0214               _FLASH_ProgramBlock:
1752  0214 89            	pushw	x
1753  0215 5206          	subw	sp,#6
1754       00000006      OFST:	set	6
1757                     ; 658   uint16_t Count = 0;
1759                     ; 659   uint32_t startaddress = 0;
1761                     ; 662   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1763                     ; 663   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
1765                     ; 664   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1767  0217 7b0b          	ld	a,(OFST+5,sp)
1768  0219 a1fd          	cp	a,#253
1769  021b 260c          	jrne	L137
1770                     ; 666     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1772                     ; 667     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1774  021d ae8000        	ldw	x,#32768
1775  0220 1f03          	ldw	(OFST-3,sp),x
1776  0222 ae0000        	ldw	x,#0
1777  0225 1f01          	ldw	(OFST-5,sp),x
1780  0227 200a          	jra	L337
1781  0229               L137:
1782                     ; 671     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1784                     ; 672     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1786  0229 ae4000        	ldw	x,#16384
1787  022c 1f03          	ldw	(OFST-3,sp),x
1788  022e ae0000        	ldw	x,#0
1789  0231 1f01          	ldw	(OFST-5,sp),x
1791  0233               L337:
1792                     ; 676   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1794  0233 1e07          	ldw	x,(OFST+1,sp)
1795  0235 a680          	ld	a,#128
1796  0237 cd0000        	call	c_cmulx
1798  023a 96            	ldw	x,sp
1799  023b 1c0001        	addw	x,#OFST-5
1800  023e cd0000        	call	c_lgadd
1803                     ; 679   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
1805  0241 0d0c          	tnz	(OFST+6,sp)
1806  0243 260a          	jrne	L537
1807                     ; 682     FLASH->CR2 |= FLASH_CR2_PRG;
1809  0245 7210505b      	bset	20571,#0
1810                     ; 683     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
1812  0249 7211505c      	bres	20572,#0
1814  024d 2008          	jra	L737
1815  024f               L537:
1816                     ; 688     FLASH->CR2 |= FLASH_CR2_FPRG;
1818  024f 7218505b      	bset	20571,#4
1819                     ; 689     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
1821  0253 7219505c      	bres	20572,#4
1822  0257               L737:
1823                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1825  0257 5f            	clrw	x
1826  0258 1f05          	ldw	(OFST-1,sp),x
1828  025a               L147:
1829                     ; 695     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1831  025a 1e0d          	ldw	x,(OFST+7,sp)
1832  025c 72fb05        	addw	x,(OFST-1,sp)
1833  025f f6            	ld	a,(x)
1834  0260 1e03          	ldw	x,(OFST-3,sp)
1835  0262 72fb05        	addw	x,(OFST-1,sp)
1836  0265 f7            	ld	(x),a
1837                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1839  0266 1e05          	ldw	x,(OFST-1,sp)
1840  0268 1c0001        	addw	x,#1
1841  026b 1f05          	ldw	(OFST-1,sp),x
1845  026d 1e05          	ldw	x,(OFST-1,sp)
1846  026f a30080        	cpw	x,#128
1847  0272 25e6          	jrult	L147
1848                     ; 697 }
1851  0274 5b08          	addw	sp,#8
1852  0276 81            	ret
1865                     	xdef	_FLASH_WaitForLastOperation
1866                     	xdef	_FLASH_ProgramBlock
1867                     	xdef	_FLASH_EraseBlock
1868                     	xdef	_FLASH_GetFlagStatus
1869                     	xdef	_FLASH_GetBootSize
1870                     	xdef	_FLASH_GetProgrammingTime
1871                     	xdef	_FLASH_GetLowPowerMode
1872                     	xdef	_FLASH_SetProgrammingTime
1873                     	xdef	_FLASH_SetLowPowerMode
1874                     	xdef	_FLASH_EraseOptionByte
1875                     	xdef	_FLASH_ProgramOptionByte
1876                     	xdef	_FLASH_ReadOptionByte
1877                     	xdef	_FLASH_ProgramWord
1878                     	xdef	_FLASH_ReadByte
1879                     	xdef	_FLASH_ProgramByte
1880                     	xdef	_FLASH_EraseByte
1881                     	xdef	_FLASH_ITConfig
1882                     	xdef	_FLASH_DeInit
1883                     	xdef	_FLASH_Lock
1884                     	xdef	_FLASH_Unlock
1885                     	xref.b	c_lreg
1886                     	xref.b	c_x
1887                     	xref.b	c_y
1906                     	xref	c_ladd
1907                     	xref	c_cmulx
1908                     	xref	c_ltor
1909                     	xref	c_lgadd
1910                     	xref	c_rtol
1911                     	xref	c_umul
1912                     	end
