   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  80                     ; 59 void TSL_SetStructPointer(void)
  80                     ; 60 {
  82                     	switch	.text
  83  0000               _TSL_SetStructPointer:
  87                     ; 61   pKeyStruct = &sSCKeyInfo[KeyIndex];
  89  0000 b600          	ld	a,_KeyIndex
  90  0002 97            	ld	xl,a
  91  0003 a60f          	ld	a,#15
  92  0005 42            	mul	x,a
  93  0006 01            	rrwa	x,a
  94  0007 ab00          	add	a,#_sSCKeyInfo
  95  0009 2401          	jrnc	L6
  96  000b 5c            	incw	x
  97  000c               L6:
  98  000c 5f            	clrw	x
  99  000d 97            	ld	xl,a
 100  000e bf00          	ldw	_pKeyStruct,x
 101                     ; 62 }
 104  0010 81            	ret
 130                     ; 75 void TSL_DeltaCalculation(void)
 130                     ; 76 {
 131                     	switch	.text
 132  0011               _TSL_DeltaCalculation:
 136                     ; 77   Delta = (s16)(pKeyStruct->Channel.LastMeas - pKeyStruct->Channel.Reference);
 138  0011 be00          	ldw	x,_pKeyStruct
 139  0013 ee05          	ldw	x,(5,x)
 140  0015 90be00        	ldw	y,_pKeyStruct
 141  0018 01            	rrwa	x,a
 142  0019 90e009        	sub	a,(9,y)
 143  001c 01            	rrwa	x,a
 144  001d 90e208        	sbc	a,(8,y)
 145  0020 01            	rrwa	x,a
 146  0021 bf00          	ldw	_Delta,x
 147                     ; 78 }
 150  0023 81            	ret
 176                     ; 92 void TSL_SCKey_SetIdleState(void)
 176                     ; 93 {
 177                     	switch	.text
 178  0024               _TSL_SCKey_SetIdleState:
 182                     ; 94   pKeyStruct->Setting.b.CHANGED = 1;
 184  0024 be00          	ldw	x,_pKeyStruct
 185  0026 e602          	ld	a,(2,x)
 186  0028 aa08          	or	a,#8
 187  002a e702          	ld	(2,x),a
 188                     ; 95   TSL_SCKey_BackToIdleState();
 190  002c ad01          	call	_TSL_SCKey_BackToIdleState
 192                     ; 96 }
 195  002e 81            	ret
 220                     ; 110 void TSL_SCKey_BackToIdleState(void)
 220                     ; 111 {
 221                     	switch	.text
 222  002f               _TSL_SCKey_BackToIdleState:
 226                     ; 112   pKeyStruct->State.whole = IDLE_STATE;
 228  002f a602          	ld	a,#2
 229  0031 92c700        	ld	[_pKeyStruct.w],a
 230                     ; 113   pKeyStruct->Setting.b.DETECTED = 0;
 232  0034 be00          	ldw	x,_pKeyStruct
 233  0036 e602          	ld	a,(2,x)
 234  0038 a4fb          	and	a,#251
 235  003a e702          	ld	(2,x),a
 236                     ; 114   pKeyStruct->Setting.b.LOCKED = 0;
 238  003c be00          	ldw	x,_pKeyStruct
 239  003e e602          	ld	a,(2,x)
 240  0040 a47f          	and	a,#127
 241  0042 e702          	ld	(2,x),a
 242                     ; 115   pKeyStruct->Setting.b.ERROR = 0;
 244  0044 be00          	ldw	x,_pKeyStruct
 245  0046 e602          	ld	a,(2,x)
 246  0048 a4df          	and	a,#223
 247  004a e702          	ld	(2,x),a
 248                     ; 116 }
 251  004c 81            	ret
 277                     ; 130 void TSL_SCKey_SetPreDetectState(void)
 277                     ; 131 {
 278                     	switch	.text
 279  004d               _TSL_SCKey_SetPreDetectState:
 283                     ; 132   pKeyStruct->State.whole = PRE_DETECTED_STATE;
 285  004d a614          	ld	a,#20
 286  004f 92c700        	ld	[_pKeyStruct.w],a
 287                     ; 133   pKeyStruct->Channel.IntegratorCounter = DetectionIntegrator;
 289  0052 be00          	ldw	x,_pKeyStruct
 290  0054 b600          	ld	a,_DetectionIntegrator
 291  0056 e70a          	ld	(10,x),a
 292                     ; 134 }
 295  0058 81            	ret
 321                     ; 148 void TSL_SCKey_SetDetectedState(void)
 321                     ; 149 {
 322                     	switch	.text
 323  0059               _TSL_SCKey_SetDetectedState:
 327                     ; 150   pKeyStruct->State.whole = DETECTED_STATE;
 329  0059 a604          	ld	a,#4
 330  005b 92c700        	ld	[_pKeyStruct.w],a
 331                     ; 151   pKeyStruct->Setting.b.DETECTED = 1;
 333  005e be00          	ldw	x,_pKeyStruct
 334  0060 e602          	ld	a,(2,x)
 335  0062 aa04          	or	a,#4
 336  0064 e702          	ld	(2,x),a
 337                     ; 152   pKeyStruct->Setting.b.CHANGED = 1;
 339  0066 be00          	ldw	x,_pKeyStruct
 340  0068 e602          	ld	a,(2,x)
 341  006a aa08          	or	a,#8
 342  006c e702          	ld	(2,x),a
 343                     ; 153   pKeyStruct->Counter = DetectionTimeout;
 345  006e be00          	ldw	x,_pKeyStruct
 346  0070 b600          	ld	a,_DetectionTimeout
 347  0072 e703          	ld	(3,x),a
 348                     ; 154 }
 351  0074 81            	ret
 377                     ; 168 void TSL_SCKey_SetPostDetectState(void)
 377                     ; 169 {
 378                     	switch	.text
 379  0075               _TSL_SCKey_SetPostDetectState:
 383                     ; 170   pKeyStruct->State.whole = POST_DETECTED_STATE;
 385  0075 a624          	ld	a,#36
 386  0077 92c700        	ld	[_pKeyStruct.w],a
 387                     ; 171   pKeyStruct->Channel.IntegratorCounter = EndDetectionIntegrator;
 389  007a be00          	ldw	x,_pKeyStruct
 390  007c b600          	ld	a,_EndDetectionIntegrator
 391  007e e70a          	ld	(10,x),a
 392                     ; 172 }
 395  0080 81            	ret
 420                     ; 186 void TSL_SCKey_BackToDetectedState(void)
 420                     ; 187 {
 421                     	switch	.text
 422  0081               _TSL_SCKey_BackToDetectedState:
 426                     ; 188   pKeyStruct->State.whole = DETECTED_STATE;
 428  0081 a604          	ld	a,#4
 429  0083 92c700        	ld	[_pKeyStruct.w],a
 430                     ; 189 }
 433  0086 81            	ret
 459                     ; 203 void TSL_SCKey_SetPreRecalibrationState(void)
 459                     ; 204 {
 460                     	switch	.text
 461  0087               _TSL_SCKey_SetPreRecalibrationState:
 465                     ; 205   pKeyStruct->State.whole = PRE_CALIBRATION_STATE;
 467  0087 a611          	ld	a,#17
 468  0089 92c700        	ld	[_pKeyStruct.w],a
 469                     ; 206   pKeyStruct->Channel.IntegratorCounter = RecalibrationIntegrator;
 471  008c be00          	ldw	x,_pKeyStruct
 472  008e b600          	ld	a,_RecalibrationIntegrator
 473  0090 e70a          	ld	(10,x),a
 474                     ; 207 }
 477  0092 81            	ret
 502                     ; 221 void TSL_SCKey_SetCalibrationState(void)
 502                     ; 222 {
 503                     	switch	.text
 504  0093               _TSL_SCKey_SetCalibrationState:
 508                     ; 223   pKeyStruct->State.whole = CALIBRATION_STATE;
 510  0093 a601          	ld	a,#1
 511  0095 92c700        	ld	[_pKeyStruct.w],a
 512                     ; 224   pKeyStruct->Setting.b.DETECTED = 0;
 514  0098 be00          	ldw	x,_pKeyStruct
 515  009a e602          	ld	a,(2,x)
 516  009c a4fb          	and	a,#251
 517  009e e702          	ld	(2,x),a
 518                     ; 225   pKeyStruct->Setting.b.CHANGED = 1;
 520  00a0 be00          	ldw	x,_pKeyStruct
 521  00a2 e602          	ld	a,(2,x)
 522  00a4 aa08          	or	a,#8
 523  00a6 e702          	ld	(2,x),a
 524                     ; 226   pKeyStruct->Setting.b.LOCKED = 0;
 526  00a8 be00          	ldw	x,_pKeyStruct
 527  00aa e602          	ld	a,(2,x)
 528  00ac a47f          	and	a,#127
 529  00ae e702          	ld	(2,x),a
 530                     ; 227   pKeyStruct->Setting.b.ERROR = 0;
 532  00b0 be00          	ldw	x,_pKeyStruct
 533  00b2 e602          	ld	a,(2,x)
 534  00b4 a4df          	and	a,#223
 535  00b6 e702          	ld	(2,x),a
 536                     ; 228   pKeyStruct->Counter = SCKEY_CALIBRATION_COUNT_DEFAULT;
 538  00b8 be00          	ldw	x,_pKeyStruct
 539  00ba a608          	ld	a,#8
 540  00bc e703          	ld	(3,x),a
 541                     ; 229   pKeyStruct->Channel.Reference = 0;
 543  00be be00          	ldw	x,_pKeyStruct
 544  00c0 905f          	clrw	y
 545  00c2 ef08          	ldw	(8,x),y
 546                     ; 230 }
 549  00c4 81            	ret
 574                     ; 244 void TSL_SCKey_SetErrorState(void)
 574                     ; 245 {
 575                     	switch	.text
 576  00c5               _TSL_SCKey_SetErrorState:
 580                     ; 246   pKeyStruct->State.whole = ERROR_STATE;
 582  00c5 a608          	ld	a,#8
 583  00c7 92c700        	ld	[_pKeyStruct.w],a
 584                     ; 247   pKeyStruct->Setting.b.DETECTED = 0;
 586  00ca be00          	ldw	x,_pKeyStruct
 587  00cc e602          	ld	a,(2,x)
 588  00ce a4fb          	and	a,#251
 589  00d0 e702          	ld	(2,x),a
 590                     ; 248   pKeyStruct->Setting.b.CHANGED = 1;
 592  00d2 be00          	ldw	x,_pKeyStruct
 593  00d4 e602          	ld	a,(2,x)
 594  00d6 aa08          	or	a,#8
 595  00d8 e702          	ld	(2,x),a
 596                     ; 249   pKeyStruct->Setting.b.LOCKED = 0;
 598  00da be00          	ldw	x,_pKeyStruct
 599  00dc e602          	ld	a,(2,x)
 600  00de a47f          	and	a,#127
 601  00e0 e702          	ld	(2,x),a
 602                     ; 250   pKeyStruct->Setting.b.ERROR = 1;
 604  00e2 be00          	ldw	x,_pKeyStruct
 605  00e4 e602          	ld	a,(2,x)
 606  00e6 aa20          	or	a,#32
 607  00e8 e702          	ld	(2,x),a
 608                     ; 251 }
 611  00ea 81            	ret
 636                     ; 265 void TSL_SCKey_SetDisabledState(void)
 636                     ; 266 {
 637                     	switch	.text
 638  00eb               _TSL_SCKey_SetDisabledState:
 642                     ; 267   pKeyStruct->State.whole = DISABLED_STATE;
 644  00eb a680          	ld	a,#128
 645  00ed 92c700        	ld	[_pKeyStruct.w],a
 646                     ; 268   pKeyStruct->Setting.b.DETECTED = 0;
 648  00f0 be00          	ldw	x,_pKeyStruct
 649  00f2 e602          	ld	a,(2,x)
 650  00f4 a4fb          	and	a,#251
 651  00f6 e702          	ld	(2,x),a
 652                     ; 269   pKeyStruct->Setting.b.CHANGED = 1;
 654  00f8 be00          	ldw	x,_pKeyStruct
 655  00fa e602          	ld	a,(2,x)
 656  00fc aa08          	or	a,#8
 657  00fe e702          	ld	(2,x),a
 658                     ; 270   pKeyStruct->Setting.b.LOCKED = 0;
 660  0100 be00          	ldw	x,_pKeyStruct
 661  0102 e602          	ld	a,(2,x)
 662  0104 a47f          	and	a,#127
 663  0106 e702          	ld	(2,x),a
 664                     ; 271   pKeyStruct->Setting.b.ERROR = 0;
 666  0108 be00          	ldw	x,_pKeyStruct
 667  010a e602          	ld	a,(2,x)
 668  010c a4df          	and	a,#223
 669  010e e702          	ld	(2,x),a
 670                     ; 272 }
 673  0110 81            	ret
 760                     ; 288 void TSL_ECS(void)
 760                     ; 289 {
 761                     	switch	.text
 762  0111               _TSL_ECS:
 764  0111 520b          	subw	sp,#11
 765       0000000b      OFST:	set	11
 768                     ; 295   disableInterrupts();
 771  0113 9b            sim
 773                     ; 296   Local_TickECS10ms = TSL_TickCount_ECS_10ms;
 776  0114 450000        	mov	_Local_TickECS10ms,_TSL_TickCount_ECS_10ms
 777                     ; 297   TSL_TickCount_ECS_10ms = 0;
 779  0117 3f00          	clr	_TSL_TickCount_ECS_10ms
 780                     ; 298   enableInterrupts();
 783  0119 9a            rim
 787  011a ac380238      	jpf	L522
 788  011e               L322:
 789                     ; 302     if (ECSTimeStepCounter)
 791  011e 3d00          	tnz	_ECSTimeStepCounter
 792  0120 2702          	jreq	L132
 793                     ; 304       ECSTimeStepCounter--;
 795  0122 3a00          	dec	_ECSTimeStepCounter
 796  0124               L132:
 797                     ; 306     ECSTempoPrescaler--;
 799  0124 3a00          	dec	_ECSTempoPrescaler
 800                     ; 307     if (!ECSTempoPrescaler)
 802  0126 3d00          	tnz	_ECSTempoPrescaler
 803  0128 260a          	jrne	L332
 804                     ; 309       ECSTempoPrescaler = 10;
 806  012a 350a0000      	mov	_ECSTempoPrescaler,#10
 807                     ; 310       if (ECSTempoCounter)
 809  012e 3d00          	tnz	_ECSTempoCounter
 810  0130 2702          	jreq	L332
 811                     ; 312         ECSTempoCounter--;
 813  0132 3a00          	dec	_ECSTempoCounter
 814  0134               L332:
 815                     ; 316     K_Filter = ECS_K_Slow;   // Default case !
 817  0134 b600          	ld	a,_ECS_K_Slow
 818  0136 6b05          	ld	(OFST-6,sp),a
 820                     ; 317     ECS_Fast_Enable = 1;
 822  0138 a601          	ld	a,#1
 823  013a 6b07          	ld	(OFST-4,sp),a
 825                     ; 318     ECS_Fast_Direction = 0;
 827  013c 0f06          	clr	(OFST-5,sp)
 829                     ; 320     for (KeyIndex = 0; KeyIndex < NUMBER_OF_SINGLE_CHANNEL_KEYS; KeyIndex++)
 831  013e 3f00          	clr	_KeyIndex
 832  0140               L732:
 833                     ; 322       TSL_SetStructPointer();
 835  0140 cd0000        	call	_TSL_SetStructPointer
 837                     ; 324       if ((pKeyStruct->State.whole == PRE_DETECTED_STATE) || (pKeyStruct->State.whole == DETECTED_STATE) || (pKeyStruct->State.whole == POST_DETECTED_STATE))
 839  0143 92c600        	ld	a,[_pKeyStruct.w]
 840  0146 a114          	cp	a,#20
 841  0148 270e          	jreq	L742
 843  014a 92c600        	ld	a,[_pKeyStruct.w]
 844  014d a104          	cp	a,#4
 845  014f 2707          	jreq	L742
 847  0151 92c600        	ld	a,[_pKeyStruct.w]
 848  0154 a124          	cp	a,#36
 849  0156 261e          	jrne	L542
 850  0158               L742:
 851                     ; 326         ECSTempoCounter = ECSTemporization;    // Restart temporization counter ...
 853  0158 450000        	mov	_ECSTempoCounter,_ECSTemporization
 854                     ; 327         break;           // Out from the for loop
 855  015b               L342:
 856                     ; 399     if (!ECSTimeStepCounter && !ECSTempoCounter)
 858  015b 3d00          	tnz	_ECSTimeStepCounter
 859  015d 2703          	jreq	L04
 860  015f cc0238        	jp	L522
 861  0162               L04:
 863  0162 3d00          	tnz	_ECSTempoCounter
 864  0164 2703          	jreq	L24
 865  0166 cc0238        	jp	L522
 866  0169               L24:
 867                     ; 401       ECSTimeStepCounter = ECSTimeStep;
 869  0169 450000        	mov	_ECSTimeStepCounter,_ECSTimeStep
 870                     ; 403       if (ECS_Fast_Enable)
 872  016c 0d07          	tnz	(OFST-4,sp)
 873  016e 2747          	jreq	L772
 874                     ; 405         K_Filter = ECS_K_Fast;
 876  0170 b600          	ld	a,_ECS_K_Fast
 877  0172 6b05          	ld	(OFST-6,sp),a
 879  0174 2041          	jra	L772
 880  0176               L542:
 881                     ; 329       if (pKeyStruct->State.whole == IDLE_STATE)
 883  0176 92c600        	ld	a,[_pKeyStruct.w]
 884  0179 a102          	cp	a,#2
 885  017b 2630          	jrne	L352
 886                     ; 331         TSL_DeltaCalculation();
 888  017d cd0011        	call	_TSL_DeltaCalculation
 890                     ; 332         if (Delta == 0)    // No Fast ECS !
 892  0180 be00          	ldw	x,_Delta
 893  0182 2604          	jrne	L552
 894                     ; 333           ECS_Fast_Enable = 0;
 896  0184 0f07          	clr	(OFST-4,sp)
 899  0186 2025          	jra	L352
 900  0188               L552:
 901                     ; 336           if (Delta < 0)
 903  0188 9c            	rvf
 904  0189 be00          	ldw	x,_Delta
 905  018b 2e11          	jrsge	L162
 906                     ; 338             if (ECS_Fast_Direction > 0)    // No Fast ECS !
 908  018d 9c            	rvf
 909  018e 7b06          	ld	a,(OFST-5,sp)
 910  0190 a100          	cp	a,#0
 911  0192 2d04          	jrsle	L362
 912                     ; 339               ECS_Fast_Enable = 0;
 914  0194 0f07          	clr	(OFST-4,sp)
 917  0196 2015          	jra	L352
 918  0198               L362:
 919                     ; 341               ECS_Fast_Direction = -1;
 921  0198 a6ff          	ld	a,#255
 922  019a 6b06          	ld	(OFST-5,sp),a
 924  019c 200f          	jra	L352
 925  019e               L162:
 926                     ; 345             if (ECS_Fast_Direction < 0)    // No Fast ECS !
 928  019e 9c            	rvf
 929  019f 7b06          	ld	a,(OFST-5,sp)
 930  01a1 a100          	cp	a,#0
 931  01a3 2e04          	jrsge	L172
 932                     ; 346               ECS_Fast_Enable = 0;
 934  01a5 0f07          	clr	(OFST-4,sp)
 937  01a7 2004          	jra	L352
 938  01a9               L172:
 939                     ; 348               ECS_Fast_Direction = + 1;
 941  01a9 a601          	ld	a,#1
 942  01ab 6b06          	ld	(OFST-5,sp),a
 944  01ad               L352:
 945                     ; 320     for (KeyIndex = 0; KeyIndex < NUMBER_OF_SINGLE_CHANNEL_KEYS; KeyIndex++)
 947  01ad 3c00          	inc	_KeyIndex
 950  01af b600          	ld	a,_KeyIndex
 951  01b1 a103          	cp	a,#3
 952  01b3 258b          	jrult	L732
 953  01b5 20a4          	jra	L342
 954  01b7               L772:
 955                     ; 408       K_Filter_Complement = (u8)((0xFF ^ K_Filter) + 1);
 957  01b7 7b05          	ld	a,(OFST-6,sp)
 958  01b9 a8ff          	xor	a,#255
 959  01bb 4c            	inc	a
 960  01bc 6b07          	ld	(OFST-4,sp),a
 962                     ; 410       if (K_Filter)
 964  01be 0d05          	tnz	(OFST-6,sp)
 965  01c0 2602          	jrne	L44
 966  01c2 2074          	jp	L522
 967  01c4               L44:
 968                     ; 414         for (KeyIndex = 0; KeyIndex < NUMBER_OF_SINGLE_CHANNEL_KEYS; KeyIndex++)
 970  01c4 3f00          	clr	_KeyIndex
 971  01c6               L303:
 972                     ; 416           TSL_SetStructPointer();
 974  01c6 cd0000        	call	_TSL_SetStructPointer
 976                     ; 417           if (pKeyStruct->State.whole == IDLE_STATE)
 978  01c9 92c600        	ld	a,[_pKeyStruct.w]
 979  01cc a102          	cp	a,#2
 980  01ce 2660          	jrne	L113
 981                     ; 419             IIR_Result = ((u32)(pKeyStruct->Channel.Reference) << 8) + pKeyStruct->Channel.ECSRefRest;
 983  01d0 be00          	ldw	x,_pKeyStruct
 984  01d2 ee08          	ldw	x,(8,x)
 985  01d4 90ae0100      	ldw	y,#256
 986  01d8 cd0000        	call	c_umul
 988  01db be00          	ldw	x,_pKeyStruct
 989  01dd e60b          	ld	a,(11,x)
 990  01df cd0000        	call	c_ladc
 992  01e2 96            	ldw	x,sp
 993  01e3 1c0008        	addw	x,#OFST-3
 994  01e6 cd0000        	call	c_rtol
 997                     ; 420             IIR_Result = K_Filter_Complement * IIR_Result;
 999  01e9 7b07          	ld	a,(OFST-4,sp)
1000  01eb b703          	ld	c_lreg+3,a
1001  01ed 3f02          	clr	c_lreg+2
1002  01ef 3f01          	clr	c_lreg+1
1003  01f1 3f00          	clr	c_lreg
1004  01f3 96            	ldw	x,sp
1005  01f4 1c0008        	addw	x,#OFST-3
1006  01f7 cd0000        	call	c_lgmul
1009                     ; 421             IIR_Result += K_Filter * ((u32)(pKeyStruct->Channel.LastMeas) << 8);
1011  01fa 7b05          	ld	a,(OFST-6,sp)
1012  01fc b703          	ld	c_lreg+3,a
1013  01fe 3f02          	clr	c_lreg+2
1014  0200 3f01          	clr	c_lreg+1
1015  0202 3f00          	clr	c_lreg
1016  0204 96            	ldw	x,sp
1017  0205 1c0001        	addw	x,#OFST-10
1018  0208 cd0000        	call	c_rtol
1021  020b be00          	ldw	x,_pKeyStruct
1022  020d ee05          	ldw	x,(5,x)
1023  020f 90ae0100      	ldw	y,#256
1024  0213 cd0000        	call	c_umul
1026  0216 96            	ldw	x,sp
1027  0217 1c0001        	addw	x,#OFST-10
1028  021a cd0000        	call	c_lmul
1030  021d 96            	ldw	x,sp
1031  021e 1c0008        	addw	x,#OFST-3
1032  0221 cd0000        	call	c_lgadd
1035                     ; 422             pKeyStruct->Channel.Reference = (u16)(IIR_Result >> 16);
1037  0224 be00          	ldw	x,_pKeyStruct
1038  0226 1608          	ldw	y,(OFST-3,sp)
1039  0228 ef08          	ldw	(8,x),y
1040                     ; 423             pKeyStruct->Channel.ECSRefRest = (u8)(IIR_Result >> 8);
1042  022a 7b0a          	ld	a,(OFST-1,sp)
1043  022c be00          	ldw	x,_pKeyStruct
1044  022e e70b          	ld	(11,x),a
1045  0230               L113:
1046                     ; 414         for (KeyIndex = 0; KeyIndex < NUMBER_OF_SINGLE_CHANNEL_KEYS; KeyIndex++)
1048  0230 3c00          	inc	_KeyIndex
1051  0232 b600          	ld	a,_KeyIndex
1052  0234 a103          	cp	a,#3
1053  0236 258e          	jrult	L303
1054  0238               L522:
1055                     ; 300   while (Local_TickECS10ms--)
1057  0238 b600          	ld	a,_Local_TickECS10ms
1058  023a 3a00          	dec	_Local_TickECS10ms
1059  023c 4d            	tnz	a
1060  023d 2703          	jreq	L64
1061  023f cc011e        	jp	L322
1062  0242               L64:
1063                     ; 447 }
1066  0242 5b0b          	addw	sp,#11
1067  0244 81            	ret
1113                     ; 462 void TSL_SCKey_DxS(void)
1113                     ; 463 {
1114                     	switch	.text
1115  0245               _TSL_SCKey_DxS:
1117  0245 89            	pushw	x
1118       00000002      OFST:	set	2
1121                     ; 466   if (pKeyStruct->Setting.b.LOCKED)
1123  0246 be00          	ldw	x,_pKeyStruct
1124  0248 e602          	ld	a,(2,x)
1125  024a a580          	bcp	a,#128
1126  024c 262a          	jrne	L25
1127                     ; 467     return;
1129                     ; 469   DxSGroupMask = pKeyStruct->DxSGroup;
1131  024e be00          	ldw	x,_pKeyStruct
1132  0250 e604          	ld	a,(4,x)
1133  0252 6b01          	ld	(OFST-1,sp),a
1135                     ; 471   for (KeyToCheck = 0; KeyToCheck < NUMBER_OF_SINGLE_CHANNEL_KEYS; KeyToCheck++)
1137  0254 0f02          	clr	(OFST+0,sp)
1139  0256               L143:
1140                     ; 473     if (KeyToCheck != KeyIndex)
1142  0256 7b02          	ld	a,(OFST+0,sp)
1143  0258 b100          	cp	a,_KeyIndex
1144  025a 271e          	jreq	L743
1145                     ; 476       if (sSCKeyInfo[KeyToCheck].DxSGroup & DxSGroupMask)
1147  025c 7b02          	ld	a,(OFST+0,sp)
1148  025e 97            	ld	xl,a
1149  025f a60f          	ld	a,#15
1150  0261 42            	mul	x,a
1151  0262 e604          	ld	a,(_sSCKeyInfo+4,x)
1152  0264 1501          	bcp	a,(OFST-1,sp)
1153  0266 2712          	jreq	L743
1154                     ; 478         if (sSCKeyInfo[KeyToCheck].Setting.b.LOCKED)
1156  0268 7b02          	ld	a,(OFST+0,sp)
1157  026a 97            	ld	xl,a
1158  026b a60f          	ld	a,#15
1159  026d 42            	mul	x,a
1160  026e e602          	ld	a,(_sSCKeyInfo+2,x)
1161  0270 a580          	bcp	a,#128
1162  0272 2706          	jreq	L743
1163                     ; 480           goto ExitToIdle;
1164                     ; 503 ExitToIdle:   // The DxS is verified at PRE DETECT state only !
1164                     ; 504   pKeyStruct->Channel.IntegratorCounter++;  // Increment integrator to never allow DETECT state
1166  0274 be00          	ldw	x,_pKeyStruct
1167  0276 6c0a          	inc	(10,x)
1168                     ; 505   return;
1169  0278               L25:
1172  0278 85            	popw	x
1173  0279 81            	ret
1174  027a               L743:
1175                     ; 471   for (KeyToCheck = 0; KeyToCheck < NUMBER_OF_SINGLE_CHANNEL_KEYS; KeyToCheck++)
1177  027a 0c02          	inc	(OFST+0,sp)
1181  027c 7b02          	ld	a,(OFST+0,sp)
1182  027e a103          	cp	a,#3
1183  0280 25d4          	jrult	L143
1184                     ; 500   pKeyStruct->Setting.b.LOCKED = 1;
1186  0282 be00          	ldw	x,_pKeyStruct
1187  0284 e602          	ld	a,(2,x)
1188  0286 aa80          	or	a,#128
1189  0288 e702          	ld	(2,x),a
1190                     ; 501   return;
1192  028a 20ec          	jra	L25
1220                     ; 519 void TSL_SCKey_DetectionTimeout(void)
1220                     ; 520 {
1221                     	switch	.text
1222  028c               _TSL_SCKey_DetectionTimeout:
1226                     ; 521   if (Local_TickFlag.b.DTO_1sec)
1228  028c b600          	ld	a,_Local_TickFlag
1229  028e a501          	bcp	a,#1
1230  0290 2711          	jreq	L563
1231                     ; 523     if (DetectionTimeout)
1233  0292 3d00          	tnz	_DetectionTimeout
1234  0294 270d          	jreq	L563
1235                     ; 525       pKeyStruct->Counter--;
1237  0296 be00          	ldw	x,_pKeyStruct
1238  0298 6a03          	dec	(3,x)
1239                     ; 526       if (!pKeyStruct->Counter)
1241  029a be00          	ldw	x,_pKeyStruct
1242  029c 6d03          	tnz	(3,x)
1243  029e 2603          	jrne	L563
1244                     ; 528         TSL_SCKey_SetCalibrationState();
1246  02a0 cd0093        	call	_TSL_SCKey_SetCalibrationState
1248  02a3               L563:
1249                     ; 532 }
1252  02a3 81            	ret
1265                     	xdef	_TSL_SCKey_DetectionTimeout
1266                     	xdef	_TSL_SCKey_DxS
1267                     	xdef	_TSL_ECS
1268                     	xdef	_TSL_SCKey_SetDisabledState
1269                     	xdef	_TSL_SCKey_SetErrorState
1270                     	xdef	_TSL_SCKey_SetCalibrationState
1271                     	xdef	_TSL_SCKey_SetPreRecalibrationState
1272                     	xdef	_TSL_SCKey_BackToDetectedState
1273                     	xdef	_TSL_SCKey_SetPostDetectState
1274                     	xdef	_TSL_SCKey_SetDetectedState
1275                     	xdef	_TSL_SCKey_SetPreDetectState
1276                     	xdef	_TSL_SCKey_BackToIdleState
1277                     	xdef	_TSL_SCKey_SetIdleState
1278                     	xdef	_TSL_DeltaCalculation
1279                     	xdef	_TSL_SetStructPointer
1280                     	xref.b	_ECSTempoPrescaler
1281                     	xref.b	_ECSTempoCounter
1282                     	xref.b	_ECSTimeStepCounter
1283                     	xref.b	_Local_TickFlag
1284                     	xref.b	_Local_TickECS10ms
1285                     	xref.b	_Delta
1286                     	xref.b	_KeyIndex
1287                     	xref.b	_ECS_K_Slow
1288                     	xref.b	_ECS_K_Fast
1289                     	xref.b	_ECSTemporization
1290                     	xref.b	_ECSTimeStep
1291                     	xref.b	_RecalibrationIntegrator
1292                     	xref.b	_EndDetectionIntegrator
1293                     	xref.b	_DetectionIntegrator
1294                     	xref.b	_DetectionTimeout
1295                     	xref.b	_sSCKeyInfo
1296                     	xref.b	_pKeyStruct
1297                     	xref.b	_TSL_TickCount_ECS_10ms
1298                     	xref.b	c_lreg
1299                     	xref.b	c_x
1300                     	xref.b	c_y
1319                     	xref	c_lgadd
1320                     	xref	c_lmul
1321                     	xref	c_lgmul
1322                     	xref	c_rtol
1323                     	xref	c_ladc
1324                     	xref	c_umul
1325                     	end
