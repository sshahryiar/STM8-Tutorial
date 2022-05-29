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
 331  0044 7b04          	ld	a,(OFST+4,sp)
 332  0046 b700          	ld	c_x,a
 333  0048 1e05          	ldw	x,(OFST+5,sp)
 334  004a bf01          	ldw	c_x+1,x
 335  004c 4f            	clr	a
 336  004d 92bd0000      	ldf	[c_x.e],a
 337                     ; 171 }
 340  0051 81            	ret
 383                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 383                     ; 182 {
 384                     	switch	.text
 385  0052               _FLASH_ProgramByte:
 387       00000000      OFST:	set	0
 390                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 392                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 394  0052 7b07          	ld	a,(OFST+7,sp)
 395  0054 88            	push	a
 396  0055 7b05          	ld	a,(OFST+5,sp)
 397  0057 b700          	ld	c_x,a
 398  0059 1e06          	ldw	x,(OFST+6,sp)
 399  005b 84            	pop	a
 400  005c bf01          	ldw	c_x+1,x
 401  005e 92bd0000      	ldf	[c_x.e],a
 402                     ; 186 }
 405  0062 81            	ret
 439                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 439                     ; 196 {
 440                     	switch	.text
 441  0063               _FLASH_ReadByte:
 443       00000000      OFST:	set	0
 446                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 448                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 450  0063 7b04          	ld	a,(OFST+4,sp)
 451  0065 b700          	ld	c_x,a
 452  0067 1e05          	ldw	x,(OFST+5,sp)
 453  0069 bf01          	ldw	c_x+1,x
 454  006b 92bc0000      	ldf	a,[c_x.e]
 457  006f 81            	ret
 500                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 500                     ; 213 {
 501                     	switch	.text
 502  0070               _FLASH_ProgramWord:
 504       00000000      OFST:	set	0
 507                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 509                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 511  0070 721c505b      	bset	20571,#6
 512                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 514  0074 721d505c      	bres	20572,#6
 515                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 517  0078 7b07          	ld	a,(OFST+7,sp)
 518  007a 88            	push	a
 519  007b 7b05          	ld	a,(OFST+5,sp)
 520  007d b700          	ld	c_x,a
 521  007f 1e06          	ldw	x,(OFST+6,sp)
 522  0081 84            	pop	a
 523  0082 bf01          	ldw	c_x+1,x
 524  0084 92bd0000      	ldf	[c_x.e],a
 525                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 527  0088 7b08          	ld	a,(OFST+8,sp)
 528  008a 88            	push	a
 529  008b 7b05          	ld	a,(OFST+5,sp)
 530  008d b700          	ld	c_x,a
 531  008f 1e06          	ldw	x,(OFST+6,sp)
 532  0091 84            	pop	a
 533  0092 90ae0001      	ldw	y,#1
 534  0096 bf01          	ldw	c_x+1,x
 535  0098 93            	ldw	x,y
 536  0099 92a70000      	ldf	([c_x.e],x),a
 537                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 539  009d 7b09          	ld	a,(OFST+9,sp)
 540  009f 88            	push	a
 541  00a0 7b05          	ld	a,(OFST+5,sp)
 542  00a2 b700          	ld	c_x,a
 543  00a4 1e06          	ldw	x,(OFST+6,sp)
 544  00a6 84            	pop	a
 545  00a7 90ae0002      	ldw	y,#2
 546  00ab bf01          	ldw	c_x+1,x
 547  00ad 93            	ldw	x,y
 548  00ae 92a70000      	ldf	([c_x.e],x),a
 549                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 551  00b2 7b0a          	ld	a,(OFST+10,sp)
 552  00b4 88            	push	a
 553  00b5 7b05          	ld	a,(OFST+5,sp)
 554  00b7 b700          	ld	c_x,a
 555  00b9 1e06          	ldw	x,(OFST+6,sp)
 556  00bb 84            	pop	a
 557  00bc 90ae0003      	ldw	y,#3
 558  00c0 bf01          	ldw	c_x+1,x
 559  00c2 93            	ldw	x,y
 560  00c3 92a70000      	ldf	([c_x.e],x),a
 561                     ; 229 }
 564  00c7 81            	ret
 609                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 609                     ; 238 {
 610                     	switch	.text
 611  00c8               _FLASH_ProgramOptionByte:
 613  00c8 89            	pushw	x
 614       00000000      OFST:	set	0
 617                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 619                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 621  00c9 721e505b      	bset	20571,#7
 622                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 624  00cd 721f505c      	bres	20572,#7
 625                     ; 247   if(Address == 0x4800)
 627  00d1 a34800        	cpw	x,#18432
 628  00d4 2607          	jrne	L542
 629                     ; 250     *((NEAR uint8_t*)Address) = Data;
 631  00d6 7b05          	ld	a,(OFST+5,sp)
 632  00d8 1e01          	ldw	x,(OFST+1,sp)
 633  00da f7            	ld	(x),a
 635  00db 200c          	jra	L742
 636  00dd               L542:
 637                     ; 255     *((NEAR uint8_t*)Address) = Data;
 639  00dd 7b05          	ld	a,(OFST+5,sp)
 640  00df 1e01          	ldw	x,(OFST+1,sp)
 641  00e1 f7            	ld	(x),a
 642                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 644  00e2 7b05          	ld	a,(OFST+5,sp)
 645  00e4 43            	cpl	a
 646  00e5 1e01          	ldw	x,(OFST+1,sp)
 647  00e7 e701          	ld	(1,x),a
 648  00e9               L742:
 649                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 651  00e9 a6fd          	ld	a,#253
 652  00eb cd01d3        	call	_FLASH_WaitForLastOperation
 654                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 656  00ee 721f505b      	bres	20571,#7
 657                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 659  00f2 721e505c      	bset	20572,#7
 660                     ; 263 }
 663  00f6 85            	popw	x
 664  00f7 81            	ret
 700                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 700                     ; 271 {
 701                     	switch	.text
 702  00f8               _FLASH_EraseOptionByte:
 704  00f8 89            	pushw	x
 705       00000000      OFST:	set	0
 708                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 710                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 712  00f9 721e505b      	bset	20571,#7
 713                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 715  00fd 721f505c      	bres	20572,#7
 716                     ; 280   if(Address == 0x4800)
 718  0101 a34800        	cpw	x,#18432
 719  0104 2603          	jrne	L762
 720                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 722  0106 7f            	clr	(x)
 724  0107 2009          	jra	L172
 725  0109               L762:
 726                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 728  0109 1e01          	ldw	x,(OFST+1,sp)
 729  010b 7f            	clr	(x)
 730                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 732  010c 1e01          	ldw	x,(OFST+1,sp)
 733  010e a6ff          	ld	a,#255
 734  0110 e701          	ld	(1,x),a
 735  0112               L172:
 736                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 738  0112 a6fd          	ld	a,#253
 739  0114 cd01d3        	call	_FLASH_WaitForLastOperation
 741                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 743  0117 721f505b      	bres	20571,#7
 744                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 746  011b 721e505c      	bset	20572,#7
 747                     ; 296 }
 750  011f 85            	popw	x
 751  0120 81            	ret
 814                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
 814                     ; 304 {
 815                     	switch	.text
 816  0121               _FLASH_ReadOptionByte:
 818  0121 5204          	subw	sp,#4
 819       00000004      OFST:	set	4
 822                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
 824                     ; 306   uint16_t res_value = 0;
 826                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 828                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
 830  0123 f6            	ld	a,(x)
 831  0124 6b01          	ld	(OFST-3,sp),a
 833                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
 835  0126 e601          	ld	a,(1,x)
 836  0128 6b02          	ld	(OFST-2,sp),a
 838                     ; 315   if(Address == 0x4800)	 
 840  012a a34800        	cpw	x,#18432
 841  012d 2608          	jrne	L523
 842                     ; 317     res_value =	 value_optbyte;
 844  012f 7b01          	ld	a,(OFST-3,sp)
 845  0131 5f            	clrw	x
 846  0132 97            	ld	xl,a
 847  0133 1f03          	ldw	(OFST-1,sp),x
 850  0135 2023          	jra	L723
 851  0137               L523:
 852                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
 854  0137 7b02          	ld	a,(OFST-2,sp)
 855  0139 43            	cpl	a
 856  013a 1101          	cp	a,(OFST-3,sp)
 857  013c 2617          	jrne	L133
 858                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
 860  013e 7b01          	ld	a,(OFST-3,sp)
 861  0140 5f            	clrw	x
 862  0141 97            	ld	xl,a
 863  0142 4f            	clr	a
 864  0143 02            	rlwa	x,a
 865  0144 1f03          	ldw	(OFST-1,sp),x
 867                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
 869  0146 7b02          	ld	a,(OFST-2,sp)
 870  0148 5f            	clrw	x
 871  0149 97            	ld	xl,a
 872  014a 01            	rrwa	x,a
 873  014b 1a04          	or	a,(OFST+0,sp)
 874  014d 01            	rrwa	x,a
 875  014e 1a03          	or	a,(OFST-1,sp)
 876  0150 01            	rrwa	x,a
 877  0151 1f03          	ldw	(OFST-1,sp),x
 880  0153 2005          	jra	L723
 881  0155               L133:
 882                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
 884  0155 ae5555        	ldw	x,#21845
 885  0158 1f03          	ldw	(OFST-1,sp),x
 887  015a               L723:
 888                     ; 331   return(res_value);
 890  015a 1e03          	ldw	x,(OFST-1,sp)
 893  015c 5b04          	addw	sp,#4
 894  015e 81            	ret
 968                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
 968                     ; 341 {
 969                     	switch	.text
 970  015f               _FLASH_SetLowPowerMode:
 972  015f 88            	push	a
 973       00000000      OFST:	set	0
 976                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
 978                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
 980  0160 c6505a        	ld	a,20570
 981  0163 a4f3          	and	a,#243
 982  0165 c7505a        	ld	20570,a
 983                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
 985  0168 c6505a        	ld	a,20570
 986  016b 1a01          	or	a,(OFST+1,sp)
 987  016d c7505a        	ld	20570,a
 988                     ; 350 }
 991  0170 84            	pop	a
 992  0171 81            	ret
1050                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1050                     ; 359 {
1051                     	switch	.text
1052  0172               _FLASH_SetProgrammingTime:
1056                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1058                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1060  0172 7211505a      	bres	20570,#0
1061                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1063  0176 ca505a        	or	a,20570
1064  0179 c7505a        	ld	20570,a
1065                     ; 365 }
1068  017c 81            	ret
1093                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1093                     ; 373 {
1094                     	switch	.text
1095  017d               _FLASH_GetLowPowerMode:
1099                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1101  017d c6505a        	ld	a,20570
1102  0180 a40c          	and	a,#12
1105  0182 81            	ret
1130                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1130                     ; 383 {
1131                     	switch	.text
1132  0183               _FLASH_GetProgrammingTime:
1136                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1138  0183 c6505a        	ld	a,20570
1139  0186 a401          	and	a,#1
1142  0188 81            	ret
1176                     ; 392 uint32_t FLASH_GetBootSize(void)
1176                     ; 393 {
1177                     	switch	.text
1178  0189               _FLASH_GetBootSize:
1180  0189 5204          	subw	sp,#4
1181       00000004      OFST:	set	4
1184                     ; 394   uint32_t temp = 0;
1186                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1188  018b c6505d        	ld	a,20573
1189  018e 5f            	clrw	x
1190  018f 97            	ld	xl,a
1191  0190 90ae0200      	ldw	y,#512
1192  0194 cd0000        	call	c_umul
1194  0197 96            	ldw	x,sp
1195  0198 1c0001        	addw	x,#OFST-3
1196  019b cd0000        	call	c_rtol
1199                     ; 400   if(FLASH->FPR == 0xFF)
1201  019e c6505d        	ld	a,20573
1202  01a1 a1ff          	cp	a,#255
1203  01a3 2611          	jrne	L354
1204                     ; 402     temp += 512;
1206  01a5 ae0200        	ldw	x,#512
1207  01a8 bf02          	ldw	c_lreg+2,x
1208  01aa ae0000        	ldw	x,#0
1209  01ad bf00          	ldw	c_lreg,x
1210  01af 96            	ldw	x,sp
1211  01b0 1c0001        	addw	x,#OFST-3
1212  01b3 cd0000        	call	c_lgadd
1215  01b6               L354:
1216                     ; 406   return(temp);
1218  01b6 96            	ldw	x,sp
1219  01b7 1c0001        	addw	x,#OFST-3
1220  01ba cd0000        	call	c_ltor
1224  01bd 5b04          	addw	sp,#4
1225  01bf 81            	ret
1334                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1334                     ; 418 {
1335                     	switch	.text
1336  01c0               _FLASH_GetFlagStatus:
1338  01c0 88            	push	a
1339       00000001      OFST:	set	1
1342                     ; 419   FlagStatus status = RESET;
1344                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1346                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1348  01c1 c4505f        	and	a,20575
1349  01c4 2706          	jreq	L525
1350                     ; 426     status = SET; /* FLASH_FLAG is set */
1352  01c6 a601          	ld	a,#1
1353  01c8 6b01          	ld	(OFST+0,sp),a
1356  01ca 2002          	jra	L725
1357  01cc               L525:
1358                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1360  01cc 0f01          	clr	(OFST+0,sp)
1362  01ce               L725:
1363                     ; 434   return status;
1365  01ce 7b01          	ld	a,(OFST+0,sp)
1368  01d0 5b01          	addw	sp,#1
1369  01d2 81            	ret
1462                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1462                     ; 550 {
1463                     	switch	.text
1464  01d3               _FLASH_WaitForLastOperation:
1466  01d3 5203          	subw	sp,#3
1467       00000003      OFST:	set	3
1470                     ; 551   uint8_t flagstatus = 0x00;
1472  01d5 0f03          	clr	(OFST+0,sp)
1474                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1476  01d7 aeffff        	ldw	x,#65535
1477  01da 1f01          	ldw	(OFST-2,sp),x
1479                     ; 557     if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1481  01dc a1fd          	cp	a,#253
1482  01de 2628          	jrne	L116
1484  01e0 200e          	jra	L775
1485  01e2               L575:
1486                     ; 561         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1486                     ; 562                                                         FLASH_IAPSR_WR_PG_DIS));
1488  01e2 c6505f        	ld	a,20575
1489  01e5 a405          	and	a,#5
1490  01e7 6b03          	ld	(OFST+0,sp),a
1492                     ; 563         timeout--;
1494  01e9 1e01          	ldw	x,(OFST-2,sp)
1495  01eb 1d0001        	subw	x,#1
1496  01ee 1f01          	ldw	(OFST-2,sp),x
1498  01f0               L775:
1499                     ; 559       while((flagstatus == 0x00) && (timeout != 0x00))
1501  01f0 0d03          	tnz	(OFST+0,sp)
1502  01f2 261c          	jrne	L506
1504  01f4 1e01          	ldw	x,(OFST-2,sp)
1505  01f6 26ea          	jrne	L575
1506  01f8 2016          	jra	L506
1507  01fa               L706:
1508                     ; 570         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1508                     ; 571                                                         FLASH_IAPSR_WR_PG_DIS));
1510  01fa c6505f        	ld	a,20575
1511  01fd a441          	and	a,#65
1512  01ff 6b03          	ld	(OFST+0,sp),a
1514                     ; 572         timeout--;
1516  0201 1e01          	ldw	x,(OFST-2,sp)
1517  0203 1d0001        	subw	x,#1
1518  0206 1f01          	ldw	(OFST-2,sp),x
1520  0208               L116:
1521                     ; 568       while((flagstatus == 0x00) && (timeout != 0x00))
1523  0208 0d03          	tnz	(OFST+0,sp)
1524  020a 2604          	jrne	L506
1526  020c 1e01          	ldw	x,(OFST-2,sp)
1527  020e 26ea          	jrne	L706
1528  0210               L506:
1529                     ; 583   if(timeout == 0x00 )
1531  0210 1e01          	ldw	x,(OFST-2,sp)
1532  0212 2604          	jrne	L716
1533                     ; 585     flagstatus = FLASH_STATUS_TIMEOUT;
1535  0214 a602          	ld	a,#2
1536  0216 6b03          	ld	(OFST+0,sp),a
1538  0218               L716:
1539                     ; 588   return((FLASH_Status_TypeDef)flagstatus);
1541  0218 7b03          	ld	a,(OFST+0,sp)
1544  021a 5b03          	addw	sp,#3
1545  021c 81            	ret
1608                     ; 598 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1608                     ; 599 {
1609                     	switch	.text
1610  021d               _FLASH_EraseBlock:
1612  021d 89            	pushw	x
1613  021e 5207          	subw	sp,#7
1614       00000007      OFST:	set	7
1617                     ; 600   uint32_t startaddress = 0;
1619                     ; 610   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1621                     ; 611   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1623  0220 7b0c          	ld	a,(OFST+5,sp)
1624  0222 a1fd          	cp	a,#253
1625  0224 260c          	jrne	L356
1626                     ; 613     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1628                     ; 614     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1630  0226 ae8000        	ldw	x,#32768
1631  0229 1f03          	ldw	(OFST-4,sp),x
1632  022b ae0000        	ldw	x,#0
1633  022e 1f01          	ldw	(OFST-6,sp),x
1636  0230 200a          	jra	L556
1637  0232               L356:
1638                     ; 618     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1640                     ; 619     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1642  0232 ae4000        	ldw	x,#16384
1643  0235 1f03          	ldw	(OFST-4,sp),x
1644  0237 ae0000        	ldw	x,#0
1645  023a 1f01          	ldw	(OFST-6,sp),x
1647  023c               L556:
1648                     ; 624   pwFlash = (PointerAttr uint8_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1650  023c 1e08          	ldw	x,(OFST+1,sp)
1651  023e a680          	ld	a,#128
1652  0240 cd0000        	call	c_cmulx
1654  0243 96            	ldw	x,sp
1655  0244 1c0001        	addw	x,#OFST-6
1656  0247 cd0000        	call	c_ladd
1658  024a 450100        	mov	c_x,c_lreg+1
1659  024d be02          	ldw	x,c_lreg+2
1660  024f b600          	ld	a,c_x
1661  0251 6b05          	ld	(OFST-2,sp),a
1662  0253 1f06          	ldw	(OFST-1,sp),x
1664                     ; 631   FLASH->CR2 |= FLASH_CR2_ERASE;
1666  0255 721a505b      	bset	20571,#5
1667                     ; 632   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1669  0259 721b505c      	bres	20572,#5
1670                     ; 639     *pwFlash = (uint8_t)0;
1672  025d 7b05          	ld	a,(OFST-2,sp)
1673  025f b700          	ld	c_x,a
1674  0261 1e06          	ldw	x,(OFST-1,sp)
1675  0263 bf01          	ldw	c_x+1,x
1676  0265 4f            	clr	a
1677  0266 92bd0000      	ldf	[c_x.e],a
1678                     ; 640   *(pwFlash + 1) = (uint8_t)0;
1680  026a 7b05          	ld	a,(OFST-2,sp)
1681  026c b700          	ld	c_x,a
1682  026e 1e06          	ldw	x,(OFST-1,sp)
1683  0270 90ae0001      	ldw	y,#1
1684  0274 bf01          	ldw	c_x+1,x
1685  0276 93            	ldw	x,y
1686  0277 4f            	clr	a
1687  0278 92a70000      	ldf	([c_x.e],x),a
1688                     ; 641   *(pwFlash + 2) = (uint8_t)0;
1690  027c 7b05          	ld	a,(OFST-2,sp)
1691  027e b700          	ld	c_x,a
1692  0280 1e06          	ldw	x,(OFST-1,sp)
1693  0282 90ae0002      	ldw	y,#2
1694  0286 bf01          	ldw	c_x+1,x
1695  0288 93            	ldw	x,y
1696  0289 4f            	clr	a
1697  028a 92a70000      	ldf	([c_x.e],x),a
1698                     ; 642   *(pwFlash + 3) = (uint8_t)0;    
1700  028e 7b05          	ld	a,(OFST-2,sp)
1701  0290 b700          	ld	c_x,a
1702  0292 1e06          	ldw	x,(OFST-1,sp)
1703  0294 90ae0003      	ldw	y,#3
1704  0298 bf01          	ldw	c_x+1,x
1705  029a 93            	ldw	x,y
1706  029b 4f            	clr	a
1707  029c 92a70000      	ldf	([c_x.e],x),a
1708                     ; 644 }
1711  02a0 5b09          	addw	sp,#9
1712  02a2 81            	ret
1816                     ; 655 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
1816                     ; 656                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1816                     ; 657 {
1817                     	switch	.text
1818  02a3               _FLASH_ProgramBlock:
1820  02a3 89            	pushw	x
1821  02a4 5206          	subw	sp,#6
1822       00000006      OFST:	set	6
1825                     ; 658   uint16_t Count = 0;
1827                     ; 659   uint32_t startaddress = 0;
1829                     ; 662   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1831                     ; 663   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
1833                     ; 664   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1835  02a6 7b0b          	ld	a,(OFST+5,sp)
1836  02a8 a1fd          	cp	a,#253
1837  02aa 260c          	jrne	L137
1838                     ; 666     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1840                     ; 667     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1842  02ac ae8000        	ldw	x,#32768
1843  02af 1f03          	ldw	(OFST-3,sp),x
1844  02b1 ae0000        	ldw	x,#0
1845  02b4 1f01          	ldw	(OFST-5,sp),x
1848  02b6 200a          	jra	L337
1849  02b8               L137:
1850                     ; 671     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1852                     ; 672     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1854  02b8 ae4000        	ldw	x,#16384
1855  02bb 1f03          	ldw	(OFST-3,sp),x
1856  02bd ae0000        	ldw	x,#0
1857  02c0 1f01          	ldw	(OFST-5,sp),x
1859  02c2               L337:
1860                     ; 676   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1862  02c2 1e07          	ldw	x,(OFST+1,sp)
1863  02c4 a680          	ld	a,#128
1864  02c6 cd0000        	call	c_cmulx
1866  02c9 96            	ldw	x,sp
1867  02ca 1c0001        	addw	x,#OFST-5
1868  02cd cd0000        	call	c_lgadd
1871                     ; 679   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
1873  02d0 0d0c          	tnz	(OFST+6,sp)
1874  02d2 260a          	jrne	L537
1875                     ; 682     FLASH->CR2 |= FLASH_CR2_PRG;
1877  02d4 7210505b      	bset	20571,#0
1878                     ; 683     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
1880  02d8 7211505c      	bres	20572,#0
1882  02dc 2008          	jra	L737
1883  02de               L537:
1884                     ; 688     FLASH->CR2 |= FLASH_CR2_FPRG;
1886  02de 7218505b      	bset	20571,#4
1887                     ; 689     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
1889  02e2 7219505c      	bres	20572,#4
1890  02e6               L737:
1891                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1893  02e6 5f            	clrw	x
1894  02e7 1f05          	ldw	(OFST-1,sp),x
1896  02e9               L147:
1897                     ; 695     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1899  02e9 1e0d          	ldw	x,(OFST+7,sp)
1900  02eb 72fb05        	addw	x,(OFST-1,sp)
1901  02ee f6            	ld	a,(x)
1902  02ef 88            	push	a
1903  02f0 7b03          	ld	a,(OFST-3,sp)
1904  02f2 b700          	ld	c_x,a
1905  02f4 1e04          	ldw	x,(OFST-2,sp)
1906  02f6 84            	pop	a
1907  02f7 1605          	ldw	y,(OFST-1,sp)
1908  02f9 bf01          	ldw	c_x+1,x
1909  02fb 93            	ldw	x,y
1910  02fc 92a70000      	ldf	([c_x.e],x),a
1911                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1913  0300 1e05          	ldw	x,(OFST-1,sp)
1914  0302 1c0001        	addw	x,#1
1915  0305 1f05          	ldw	(OFST-1,sp),x
1919  0307 1e05          	ldw	x,(OFST-1,sp)
1920  0309 a30080        	cpw	x,#128
1921  030c 25db          	jrult	L147
1922                     ; 697 }
1925  030e 5b08          	addw	sp,#8
1926  0310 81            	ret
1939                     	xdef	_FLASH_WaitForLastOperation
1940                     	xdef	_FLASH_ProgramBlock
1941                     	xdef	_FLASH_EraseBlock
1942                     	xdef	_FLASH_GetFlagStatus
1943                     	xdef	_FLASH_GetBootSize
1944                     	xdef	_FLASH_GetProgrammingTime
1945                     	xdef	_FLASH_GetLowPowerMode
1946                     	xdef	_FLASH_SetProgrammingTime
1947                     	xdef	_FLASH_SetLowPowerMode
1948                     	xdef	_FLASH_EraseOptionByte
1949                     	xdef	_FLASH_ProgramOptionByte
1950                     	xdef	_FLASH_ReadOptionByte
1951                     	xdef	_FLASH_ProgramWord
1952                     	xdef	_FLASH_ReadByte
1953                     	xdef	_FLASH_ProgramByte
1954                     	xdef	_FLASH_EraseByte
1955                     	xdef	_FLASH_ITConfig
1956                     	xdef	_FLASH_DeInit
1957                     	xdef	_FLASH_Lock
1958                     	xdef	_FLASH_Unlock
1959                     	xref.b	c_lreg
1960                     	xref.b	c_x
1961                     	xref.b	c_y
1980                     	xref	c_ladd
1981                     	xref	c_cmulx
1982                     	xref	c_ltor
1983                     	xref	c_lgadd
1984                     	xref	c_rtol
1985                     	xref	c_umul
1986                     	end
