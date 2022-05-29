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
1289                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1289                     ; 418 {
1290                     	switch	.text
1291  016a               _FLASH_GetFlagStatus:
1293  016a 88            	push	a
1294       00000001      OFST:	set	1
1297                     ; 419   FlagStatus status = RESET;
1299                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1301                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1303  016b c4505f        	and	a,20575
1304  016e 2706          	jreq	L325
1305                     ; 426     status = SET; /* FLASH_FLAG is set */
1307  0170 a601          	ld	a,#1
1308  0172 6b01          	ld	(OFST+0,sp),a
1311  0174 2002          	jra	L525
1312  0176               L325:
1313                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1315  0176 0f01          	clr	(OFST+0,sp)
1317  0178               L525:
1318                     ; 434   return status;
1320  0178 7b01          	ld	a,(OFST+0,sp)
1323  017a 5b01          	addw	sp,#1
1324  017c 81            	ret
1409                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1409                     ; 550 {
1410                     	switch	.text
1411  017d               _FLASH_WaitForLastOperation:
1413  017d 5203          	subw	sp,#3
1414       00000003      OFST:	set	3
1417                     ; 551   uint8_t flagstatus = 0x00;
1419  017f 0f03          	clr	(OFST+0,sp)
1421                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1423  0181 aeffff        	ldw	x,#65535
1424  0184 1f01          	ldw	(OFST-2,sp),x
1427  0186 200e          	jra	L375
1428  0188               L765:
1429                     ; 578     flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1431  0188 c6505f        	ld	a,20575
1432  018b a405          	and	a,#5
1433  018d 6b03          	ld	(OFST+0,sp),a
1435                     ; 579     timeout--;
1437  018f 1e01          	ldw	x,(OFST-2,sp)
1438  0191 1d0001        	subw	x,#1
1439  0194 1f01          	ldw	(OFST-2,sp),x
1441  0196               L375:
1442                     ; 576   while((flagstatus == 0x00) && (timeout != 0x00))
1444  0196 0d03          	tnz	(OFST+0,sp)
1445  0198 2604          	jrne	L775
1447  019a 1e01          	ldw	x,(OFST-2,sp)
1448  019c 26ea          	jrne	L765
1449  019e               L775:
1450                     ; 583   if(timeout == 0x00 )
1452  019e 1e01          	ldw	x,(OFST-2,sp)
1453  01a0 2604          	jrne	L106
1454                     ; 585     flagstatus = FLASH_STATUS_TIMEOUT;
1456  01a2 a602          	ld	a,#2
1457  01a4 6b03          	ld	(OFST+0,sp),a
1459  01a6               L106:
1460                     ; 588   return((FLASH_Status_TypeDef)flagstatus);
1462  01a6 7b03          	ld	a,(OFST+0,sp)
1465  01a8 5b03          	addw	sp,#3
1466  01aa 81            	ret
1529                     ; 598 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1529                     ; 599 {
1530                     	switch	.text
1531  01ab               _FLASH_EraseBlock:
1533  01ab 89            	pushw	x
1534  01ac 5206          	subw	sp,#6
1535       00000006      OFST:	set	6
1538                     ; 600   uint32_t startaddress = 0;
1540                     ; 610   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1542                     ; 611   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1544  01ae 7b0b          	ld	a,(OFST+5,sp)
1545  01b0 a1fd          	cp	a,#253
1546  01b2 260c          	jrne	L536
1547                     ; 613     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1549                     ; 614     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1551  01b4 ae8000        	ldw	x,#32768
1552  01b7 1f05          	ldw	(OFST-1,sp),x
1553  01b9 ae0000        	ldw	x,#0
1554  01bc 1f03          	ldw	(OFST-3,sp),x
1557  01be 200a          	jra	L736
1558  01c0               L536:
1559                     ; 618     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1561                     ; 619     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1563  01c0 ae4000        	ldw	x,#16384
1564  01c3 1f05          	ldw	(OFST-1,sp),x
1565  01c5 ae0000        	ldw	x,#0
1566  01c8 1f03          	ldw	(OFST-3,sp),x
1568  01ca               L736:
1569                     ; 627     pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1571  01ca 1e07          	ldw	x,(OFST+1,sp)
1572  01cc a640          	ld	a,#64
1573  01ce cd0000        	call	c_cmulx
1575  01d1 96            	ldw	x,sp
1576  01d2 1c0003        	addw	x,#OFST-3
1577  01d5 cd0000        	call	c_ladd
1579  01d8 be02          	ldw	x,c_lreg+2
1580  01da 1f01          	ldw	(OFST-5,sp),x
1582                     ; 631   FLASH->CR2 |= FLASH_CR2_ERASE;
1584  01dc 721a505b      	bset	20571,#5
1585                     ; 632   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1587  01e0 721b505c      	bres	20572,#5
1588                     ; 636     *pwFlash = (uint32_t)0;
1590  01e4 1e01          	ldw	x,(OFST-5,sp)
1591  01e6 a600          	ld	a,#0
1592  01e8 e703          	ld	(3,x),a
1593  01ea a600          	ld	a,#0
1594  01ec e702          	ld	(2,x),a
1595  01ee a600          	ld	a,#0
1596  01f0 e701          	ld	(1,x),a
1597  01f2 a600          	ld	a,#0
1598  01f4 f7            	ld	(x),a
1599                     ; 644 }
1602  01f5 5b08          	addw	sp,#8
1603  01f7 81            	ret
1707                     ; 655 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
1707                     ; 656                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1707                     ; 657 {
1708                     	switch	.text
1709  01f8               _FLASH_ProgramBlock:
1711  01f8 89            	pushw	x
1712  01f9 5206          	subw	sp,#6
1713       00000006      OFST:	set	6
1716                     ; 658   uint16_t Count = 0;
1718                     ; 659   uint32_t startaddress = 0;
1720                     ; 662   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1722                     ; 663   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
1724                     ; 664   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1726  01fb 7b0b          	ld	a,(OFST+5,sp)
1727  01fd a1fd          	cp	a,#253
1728  01ff 260c          	jrne	L317
1729                     ; 666     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1731                     ; 667     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1733  0201 ae8000        	ldw	x,#32768
1734  0204 1f03          	ldw	(OFST-3,sp),x
1735  0206 ae0000        	ldw	x,#0
1736  0209 1f01          	ldw	(OFST-5,sp),x
1739  020b 200a          	jra	L517
1740  020d               L317:
1741                     ; 671     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1743                     ; 672     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1745  020d ae4000        	ldw	x,#16384
1746  0210 1f03          	ldw	(OFST-3,sp),x
1747  0212 ae0000        	ldw	x,#0
1748  0215 1f01          	ldw	(OFST-5,sp),x
1750  0217               L517:
1751                     ; 676   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1753  0217 1e07          	ldw	x,(OFST+1,sp)
1754  0219 a640          	ld	a,#64
1755  021b cd0000        	call	c_cmulx
1757  021e 96            	ldw	x,sp
1758  021f 1c0001        	addw	x,#OFST-5
1759  0222 cd0000        	call	c_lgadd
1762                     ; 679   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
1764  0225 0d0c          	tnz	(OFST+6,sp)
1765  0227 260a          	jrne	L717
1766                     ; 682     FLASH->CR2 |= FLASH_CR2_PRG;
1768  0229 7210505b      	bset	20571,#0
1769                     ; 683     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
1771  022d 7211505c      	bres	20572,#0
1773  0231 2008          	jra	L127
1774  0233               L717:
1775                     ; 688     FLASH->CR2 |= FLASH_CR2_FPRG;
1777  0233 7218505b      	bset	20571,#4
1778                     ; 689     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
1780  0237 7219505c      	bres	20572,#4
1781  023b               L127:
1782                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1784  023b 5f            	clrw	x
1785  023c 1f05          	ldw	(OFST-1,sp),x
1787  023e               L327:
1788                     ; 695     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1790  023e 1e0d          	ldw	x,(OFST+7,sp)
1791  0240 72fb05        	addw	x,(OFST-1,sp)
1792  0243 f6            	ld	a,(x)
1793  0244 1e03          	ldw	x,(OFST-3,sp)
1794  0246 72fb05        	addw	x,(OFST-1,sp)
1795  0249 f7            	ld	(x),a
1796                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1798  024a 1e05          	ldw	x,(OFST-1,sp)
1799  024c 1c0001        	addw	x,#1
1800  024f 1f05          	ldw	(OFST-1,sp),x
1804  0251 1e05          	ldw	x,(OFST-1,sp)
1805  0253 a30040        	cpw	x,#64
1806  0256 25e6          	jrult	L327
1807                     ; 697 }
1810  0258 5b08          	addw	sp,#8
1811  025a 81            	ret
1824                     	xdef	_FLASH_WaitForLastOperation
1825                     	xdef	_FLASH_ProgramBlock
1826                     	xdef	_FLASH_EraseBlock
1827                     	xdef	_FLASH_GetFlagStatus
1828                     	xdef	_FLASH_GetBootSize
1829                     	xdef	_FLASH_GetProgrammingTime
1830                     	xdef	_FLASH_GetLowPowerMode
1831                     	xdef	_FLASH_SetProgrammingTime
1832                     	xdef	_FLASH_SetLowPowerMode
1833                     	xdef	_FLASH_EraseOptionByte
1834                     	xdef	_FLASH_ProgramOptionByte
1835                     	xdef	_FLASH_ReadOptionByte
1836                     	xdef	_FLASH_ProgramWord
1837                     	xdef	_FLASH_ReadByte
1838                     	xdef	_FLASH_ProgramByte
1839                     	xdef	_FLASH_EraseByte
1840                     	xdef	_FLASH_ITConfig
1841                     	xdef	_FLASH_DeInit
1842                     	xdef	_FLASH_Lock
1843                     	xdef	_FLASH_Unlock
1844                     	xref.b	c_lreg
1845                     	xref.b	c_x
1846                     	xref.b	c_y
1865                     	xref	c_ladd
1866                     	xref	c_cmulx
1867                     	xref	c_ltor
1868                     	xref	c_lgadd
1869                     	xref	c_rtol
1870                     	xref	c_umul
1871                     	end
