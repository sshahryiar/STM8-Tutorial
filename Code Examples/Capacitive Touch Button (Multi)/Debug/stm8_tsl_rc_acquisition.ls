   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  48                     .const:	section	.text
  49  0000               _Table_SCKEY_BITS:
  50  0000 40            	dc.b	64
  51  0001 20            	dc.b	32
  52  0002 10            	dc.b	16
  83                     ; 244 void TSL_IO_SW_Burst_TestSyncShift(void)
  83                     ; 245 {
  85                     	switch	.text
  86  0000               _TSL_IO_SW_Burst_TestSyncShift:
  90                     ; 249   ld a, _SamplingShifter
  93  0000 b602          ld a, _SamplingShifter
  95                     ; 251 ShiftLoopVih:
  98  0002               ShiftLoopVih:
 100                     ; 252   dec a       // 1 cycle
 103  0002 4a            dec a       // 1 cycle
 105                     ; 253   jrne ShiftLoopVih
 108  0003 26fd          jrne ShiftLoopVih
 110                     ; 270 }
 113  0005 81            	ret
 137                     ; 281 void TSL_IO_SW_Burst_Wait_Vil(void)
 137                     ; 282 {
 138                     	switch	.text
 139  0006               _TSL_IO_SW_Burst_Wait_Vil:
 143                     ; 286   ld a, _AcquisitionBitMask
 146  0006 b601          ld a, _AcquisitionBitMask
 148                     ; 287   ldw x, _sTouchIO   // Input data register ...
 151  0008 be09          ldw x, _sTouchIO   // Input data register ...
 153                     ; 288   incw x
 156  000a 5c            incw x
 158                     ; 290 WaitForVil:
 161  000b               WaitForVil:
 163                     ; 294   bcp a, (x)  // 1 cycles
 166  000b f5            bcp a, (x)  // 1 cycles
 168                     ; 295   jreq EndWaitForVil
 171  000c 270a          jreq EndWaitForVil
 173                     ; 296   ldw y, _TIMACQ_CNTR // 2 cycles; hw counter also used for timeout ...
 176  000e 90ce5328      ldw y, _TIMACQ_CNTR // 2 cycles; hw counter also used for timeout ...
 178                     ; 297   cpw y, #0x0E00    // 2 cycles; Timeout compare
 181  0012 90a30e00      cpw y, #0x0E00    // 2 cycles; Timeout compare
 183                     ; 298   jrult WaitForVil
 186  0016 25f3          jrult WaitForVil
 188                     ; 299 EndWaitForVil:
 191  0018               EndWaitForVil:
 193                     ; 335 }
 196  0018 81            	ret
 220                     ; 346 void TSL_IO_SW_Burst_Wait_Vih(void)
 220                     ; 347 {
 221                     	switch	.text
 222  0019               _TSL_IO_SW_Burst_Wait_Vih:
 226                     ; 350   ld a, _AcquisitionBitMask
 229  0019 b601          ld a, _AcquisitionBitMask
 231                     ; 351   ldw x, _sTouchIO   // Input data register ...
 234  001b be09          ldw x, _sTouchIO   // Input data register ...
 236                     ; 352   incw x
 239  001d 5c            incw x
 241                     ; 354 WaitForVih:
 244  001e               WaitForVih:
 246                     ; 358   bcp a, (x)  // 1 cycles
 249  001e f5            bcp a, (x)  // 1 cycles
 251                     ; 359   jrne EndWaitForVih
 254  001f 260a          jrne EndWaitForVih
 256                     ; 360   ldw y, _TIMACQ_CNTR // 2 cycles; hw counter also used for timeout ...
 259  0021 90ce5328      ldw y, _TIMACQ_CNTR // 2 cycles; hw counter also used for timeout ...
 261                     ; 361   cpw y, #0x0E00    // 2 cycles; Timeout compare
 264  0025 90a30e00      cpw y, #0x0E00    // 2 cycles; Timeout compare
 266                     ; 362   jrult WaitForVih
 269  0029 25f3          jrult WaitForVih
 271                     ; 363 EndWaitForVih:
 274  002b               EndWaitForVih:
 276                     ; 400 }
 279  002b 81            	ret
 315                     ; 420 void TSL_IO_SW_Spread_Spectrum(void)
 315                     ; 421 {
 316                     	switch	.text
 317  002c               _TSL_IO_SW_Spread_Spectrum:
 319  002c 88            	push	a
 320       00000001      OFST:	set	1
 323                     ; 424   SpreadCounter++;
 325  002d 3c00          	inc	L71_SpreadCounter
 326                     ; 426   if (SpreadCounter == SPREAD_COUNTER_MAX)
 328  002f b600          	ld	a,L71_SpreadCounter
 329  0031 a114          	cp	a,#20
 330  0033 2604          	jrne	L57
 331                     ; 428     SpreadCounter = SPREAD_COUNTER_MIN;
 333  0035 35010000      	mov	L71_SpreadCounter,#1
 334  0039               L57:
 335                     ; 431   for (i = SpreadCounter; i; i--) {}}
 337  0039 b600          	ld	a,L71_SpreadCounter
 338  003b 6b01          	ld	(OFST+0,sp),a
 341  003d 2002          	jra	L301
 342  003f               L77:
 345  003f 0a01          	dec	(OFST+0,sp)
 347  0041               L301:
 350  0041 0d01          	tnz	(OFST+0,sp)
 351  0043 26fa          	jrne	L77
 355  0045 84            	pop	a
 356  0046 81            	ret
 380                     ; 447 void TSL_IO_Init(void)
 380                     ; 448 {
 381                     	switch	.text
 382  0047               _TSL_IO_Init:
 386                     ; 451   ((GPIO_TypeDef *)(LOADREF_PORT_ADDR))->CR1 |= LOADREF_BIT;
 388  0047 721c5003      	bset	20483,#6
 389                     ; 452   ((GPIO_TypeDef *)(LOADREF_PORT_ADDR))->DDR |= LOADREF_BIT;
 391  004b 721c5002      	bset	20482,#6
 392                     ; 453   ((GPIO_TypeDef *)(LOADREF_PORT_ADDR))->ODR &= (u8)(~LOADREF_BIT);
 394  004f 721d5000      	bres	20480,#6
 395                     ; 460   ((GPIO_TypeDef *)(GPIOB_BaseAddress))->CR1 |= GPIOB_ELECTRODES_MASK;
 397  0053 c65008        	ld	a,20488
 398  0056 aaf0          	or	a,#240
 399  0058 c75008        	ld	20488,a
 400                     ; 484   TSL_IO_Clamp();
 402  005b ad09          	call	_TSL_IO_Clamp
 404                     ; 487   TIMACQ->PSCR = 0;
 406  005d 725f532a      	clr	21290
 407                     ; 488   TIMACQ->CR1 = 0x01;
 409  0061 35015320      	mov	21280,#1
 410                     ; 490 }
 413  0065 81            	ret
 436                     ; 503 void TSL_IO_Clamp(void)
 436                     ; 504 {
 437                     	switch	.text
 438  0066               _TSL_IO_Clamp:
 442                     ; 507   ((GPIO_TypeDef *)(LOADREF_PORT_ADDR))->ODR &= (u8)(~LOADREF_BIT);
 444  0066 721d5000      	bres	20480,#6
 445                     ; 515   ((GPIO_TypeDef *)(GPIOB_BaseAddress))->ODR &= (u8)(~GPIOB_ELECTRODES_MASK);
 447  006a c65005        	ld	a,20485
 448  006d a40f          	and	a,#15
 449  006f c75005        	ld	20485,a
 450                     ; 516   ((GPIO_TypeDef *)(GPIOB_BaseAddress))->DDR |= GPIOB_ELECTRODES_MASK;
 452  0072 c65007        	ld	a,20487
 453  0075 aaf0          	or	a,#240
 454  0077 c75007        	ld	20487,a
 455                     ; 547 }
 458  007a 81            	ret
 482                     ; 560 void TSL_IO_SW_Burst_Start_Timer(void)
 482                     ; 561 {
 483                     	switch	.text
 484  007b               _TSL_IO_SW_Burst_Start_Timer:
 488                     ; 563   TIMACQ->EGR |= 0x01;
 490  007b 72105324      	bset	21284,#0
 491                     ; 565 }
 494  007f 81            	ret
 518                     ; 578 void TSL_IO_SW_Burst_Stop_Timer(void)
 518                     ; 579 {
 519                     	switch	.text
 520  0080               _TSL_IO_SW_Burst_Stop_Timer:
 524                     ; 582   ld a, _TIMACQ_CNTR
 527  0080 c65328        ld a, _TIMACQ_CNTR
 529                     ; 583   ld _CounterStop, a
 532  0083 b703          ld _CounterStop, a
 534                     ; 584   ld a, _TIMACQ_CNTR + 1
 537  0085 c65329        ld a, _TIMACQ_CNTR + 1
 539                     ; 585   ld _CounterStop + 1, a
 542  0088 b704          ld _CounterStop + 1, a
 544                     ; 602 }
 547  008a 81            	ret
 683                     ; 615 void TSL_IO_Acquisition(u8 AcqNumber, u8 AdjustmentLevel)
 683                     ; 616 {
 684                     	switch	.text
 685  008b               _TSL_IO_Acquisition:
 687  008b 89            	pushw	x
 688  008c 520f          	subw	sp,#15
 689       0000000f      OFST:	set	15
 692                     ; 623   AcquisitionBitMask = sTouchIO.AcqMask;
 694  008e 450b01        	mov	_AcquisitionBitMask,_sTouchIO+2
 695                     ; 625   MinMeasurement = 0;
 697  0091 5f            	clrw	x
 698  0092 1f04          	ldw	(OFST-11,sp),x
 700                     ; 626   MaxMeasurement = 0;
 702  0094 5f            	clrw	x
 703  0095 1f02          	ldw	(OFST-13,sp),x
 705                     ; 627   FinalMeasurementValue = 0;
 707  0097 ae0000        	ldw	x,#0
 708  009a bf07          	ldw	_FinalMeasurementValue+2,x
 709  009c ae0000        	ldw	x,#0
 710  009f bf05          	ldw	_FinalMeasurementValue,x
 711                     ; 628   RejectionCounter = 0;
 713  00a1 0f08          	clr	(OFST-7,sp)
 715                     ; 633   if (IT_Sync_Flags.one_acquisition_sync_enable)
 717  00a3 b600          	ld	a,_IT_Sync_Flags
 718  00a5 a501          	bcp	a,#1
 719  00a7 270a          	jreq	L132
 720                     ; 635     IT_Sync_Flags.start = 0;
 722  00a9 72170000      	bres	_IT_Sync_Flags,#3
 724  00ad               L732:
 725                     ; 636     while (IT_Sync_Flags.start == 0);
 727  00ad b600          	ld	a,_IT_Sync_Flags
 728  00af a508          	bcp	a,#8
 729  00b1 27fa          	jreq	L732
 730  00b3               L132:
 731                     ; 641   for (AcqLoopIndex = 0; AcqLoopIndex < AcqNumber; AcqLoopIndex++)
 733  00b3 0f01          	clr	(OFST-14,sp)
 736  00b5 acee01ee      	jpf	L742
 737  00b9               L342:
 738                     ; 646     if (IT_Sync_Flags.one_measure_sync_enable)
 740  00b9 b600          	ld	a,_IT_Sync_Flags
 741  00bb a502          	bcp	a,#2
 742  00bd 270a          	jreq	L562
 743                     ; 648       IT_Sync_Flags.start = 0;
 745  00bf 72170000      	bres	_IT_Sync_Flags,#3
 747  00c3               L162:
 748                     ; 649       while (IT_Sync_Flags.start == 0);
 750  00c3 b600          	ld	a,_IT_Sync_Flags
 751  00c5 a508          	bcp	a,#8
 752  00c7 27fa          	jreq	L162
 753  00c9               L562:
 754                     ; 656       MeasRejected = 0;
 756  00c9 0f09          	clr	(OFST-6,sp)
 758                     ; 657       CumulatedMeasurement = 0;
 760  00cb 5f            	clrw	x
 761  00cc 1f06          	ldw	(OFST-9,sp),x
 763                     ; 659       for (SamplingShifter = SAMPLING_SHIFTER_LOOP_START;
 765  00ce 35010002      	mov	_SamplingShifter,#1
 766  00d2               L372:
 767                     ; 664         disableInterrupts();
 770  00d2 9b            sim
 772                     ; 665         sTouchIO.PORT_ADDR->ODR &= (u8)(~sTouchIO.DriveMask);
 775  00d3 b60c          	ld	a,_sTouchIO+3
 776  00d5 43            	cpl	a
 777  00d6 92c409        	and	a,[_sTouchIO.w]
 778  00d9 92c709        	ld	[_sTouchIO.w],a
 779                     ; 666         sTouchIO.PORT_ADDR->DDR |= sTouchIO.DriveMask;
 781  00dc be09          	ldw	x,_sTouchIO
 782  00de e602          	ld	a,(2,x)
 783  00e0 ba0c          	or	a,_sTouchIO+3
 784  00e2 e702          	ld	(2,x),a
 785                     ; 667         sTouchIO.PORT_ADDR->CR1 &= (u8)(~sTouchIO.DriveMask);
 787  00e4 be09          	ldw	x,_sTouchIO
 788  00e6 b60c          	ld	a,_sTouchIO+3
 789  00e8 43            	cpl	a
 790  00e9 e403          	and	a,(3,x)
 791  00eb e703          	ld	(3,x),a
 792                     ; 668         ((GPIO_TypeDef *)(LOADREF_PORT_ADDR))->ODR |= LOADREF_BIT;
 794  00ed 721c5000      	bset	20480,#6
 795                     ; 669         enableInterrupts();
 798  00f1 9a            rim
 800                     ; 674         if (IT_Sync_Flags.one_charge_sync_enable)
 803  00f2 b600          	ld	a,_IT_Sync_Flags
 804  00f4 a504          	bcp	a,#4
 805  00f6 270a          	jreq	L103
 806                     ; 676           IT_Sync_Flags.start = 0;
 808  00f8 72170000      	bres	_IT_Sync_Flags,#3
 810  00fc               L703:
 811                     ; 677           while (IT_Sync_Flags.start == 0);
 813  00fc b600          	ld	a,_IT_Sync_Flags
 814  00fe a508          	bcp	a,#8
 815  0100 27fa          	jreq	L703
 816  0102               L103:
 817                     ; 682         TSL_IO_SW_Spread_Spectrum();
 819  0102 cd002c        	call	_TSL_IO_SW_Spread_Spectrum
 821                     ; 685         disableInterrupts();
 824  0105 9b            sim
 826                     ; 686         TSL_IO_SW_Burst_Start_Timer();
 829  0106 cd007b        	call	_TSL_IO_SW_Burst_Start_Timer
 831                     ; 687         sTouchIO.PORT_ADDR->DDR &= (u8)(~sTouchIO.DriveMask);
 833  0109 be09          	ldw	x,_sTouchIO
 834  010b b60c          	ld	a,_sTouchIO+3
 835  010d 43            	cpl	a
 836  010e e402          	and	a,(2,x)
 837  0110 e702          	ld	(2,x),a
 838                     ; 688         TSL_IO_SW_Burst_TestSyncShift();
 840  0112 cd0000        	call	_TSL_IO_SW_Burst_TestSyncShift
 842                     ; 689         TSL_IO_SW_Burst_Wait_Vih();
 844  0115 cd0019        	call	_TSL_IO_SW_Burst_Wait_Vih
 846                     ; 690         TSL_IO_SW_Burst_Stop_Timer();
 848  0118 cd0080        	call	_TSL_IO_SW_Burst_Stop_Timer
 850                     ; 692         Measurement = CounterStop;
 852  011b be03          	ldw	x,_CounterStop
 853  011d 1f0e          	ldw	(OFST-1,sp),x
 855                     ; 695         sTouchIO.PORT_ADDR->ODR |= sTouchIO.DriveMask;
 857  011f 92c609        	ld	a,[_sTouchIO.w]
 858  0122 ba0c          	or	a,_sTouchIO+3
 859  0124 92c709        	ld	[_sTouchIO.w],a
 860                     ; 696         sTouchIO.PORT_ADDR->DDR |= sTouchIO.DriveMask;
 862  0127 be09          	ldw	x,_sTouchIO
 863  0129 e602          	ld	a,(2,x)
 864  012b ba0c          	or	a,_sTouchIO+3
 865  012d e702          	ld	(2,x),a
 866                     ; 697         sTouchIO.PORT_ADDR->CR1 |= sTouchIO.DriveMask;
 868  012f be09          	ldw	x,_sTouchIO
 869  0131 e603          	ld	a,(3,x)
 870  0133 ba0c          	or	a,_sTouchIO+3
 871  0135 e703          	ld	(3,x),a
 872                     ; 698         ((GPIO_TypeDef *)(LOADREF_PORT_ADDR))->ODR &= (u8)(~LOADREF_BIT);
 874  0137 721d5000      	bres	20480,#6
 875                     ; 699         enableInterrupts();
 878  013b 9a            rim
 880                     ; 704         if (IT_Sync_Flags.one_charge_sync_enable)
 883  013c b600          	ld	a,_IT_Sync_Flags
 884  013e a504          	bcp	a,#4
 885  0140 270a          	jreq	L313
 886                     ; 706           IT_Sync_Flags.start = 0;
 888  0142 72170000      	bres	_IT_Sync_Flags,#3
 890  0146               L123:
 891                     ; 707           while (IT_Sync_Flags.start == 0);
 893  0146 b600          	ld	a,_IT_Sync_Flags
 894  0148 a508          	bcp	a,#8
 895  014a 27fa          	jreq	L123
 896  014c               L313:
 897                     ; 712         TSL_IO_SW_Spread_Spectrum();
 899  014c cd002c        	call	_TSL_IO_SW_Spread_Spectrum
 901                     ; 715         disableInterrupts();
 904  014f 9b            sim
 906                     ; 716         TSL_IO_SW_Burst_Start_Timer();
 909  0150 cd007b        	call	_TSL_IO_SW_Burst_Start_Timer
 911                     ; 717         sTouchIO.PORT_ADDR->CR1 &= (u8)(~sTouchIO.DriveMask);
 913  0153 be09          	ldw	x,_sTouchIO
 914  0155 b60c          	ld	a,_sTouchIO+3
 915  0157 43            	cpl	a
 916  0158 e403          	and	a,(3,x)
 917  015a e703          	ld	(3,x),a
 918                     ; 718         sTouchIO.PORT_ADDR->DDR &= (u8)(~sTouchIO.DriveMask);
 920  015c be09          	ldw	x,_sTouchIO
 921  015e b60c          	ld	a,_sTouchIO+3
 922  0160 43            	cpl	a
 923  0161 e402          	and	a,(2,x)
 924  0163 e702          	ld	(2,x),a
 925                     ; 719         TSL_IO_SW_Burst_TestSyncShift();
 927  0165 cd0000        	call	_TSL_IO_SW_Burst_TestSyncShift
 929                     ; 720         TSL_IO_SW_Burst_Wait_Vil();
 931  0168 cd0006        	call	_TSL_IO_SW_Burst_Wait_Vil
 933                     ; 721         TSL_IO_SW_Burst_Stop_Timer();
 935  016b cd0080        	call	_TSL_IO_SW_Burst_Stop_Timer
 937                     ; 723         Measurement += CounterStop;
 939  016e 1e0e          	ldw	x,(OFST-1,sp)
 940  0170 72bb0003      	addw	x,_CounterStop
 941  0174 1f0e          	ldw	(OFST-1,sp),x
 943                     ; 725         CumulatedMeasurement += Measurement;
 945  0176 1e06          	ldw	x,(OFST-9,sp)
 946  0178 72fb0e        	addw	x,(OFST-1,sp)
 947  017b 1f06          	ldw	(OFST-9,sp),x
 949                     ; 728         if (SamplingShifter == SAMPLING_SHIFTER_LOOP_START)
 951  017d b602          	ld	a,_SamplingShifter
 952  017f a101          	cp	a,#1
 953  0181 262e          	jrne	L523
 954                     ; 730           tmpval = (u32)((u32)Measurement * MAX_MEAS_COEFF);
 956  0183 1e0e          	ldw	x,(OFST-1,sp)
 957  0185 90ae011a      	ldw	y,#282
 958  0189 cd0000        	call	c_umul
 960  018c 96            	ldw	x,sp
 961  018d 1c000a        	addw	x,#OFST-5
 962  0190 cd0000        	call	c_rtol
 965                     ; 731           MaxMeasurement = (u16)((u16)(tmpval >> 8) + NB_CYCLES_VIHVIL_LOOP);
 967  0193 1e0b          	ldw	x,(OFST-4,sp)
 968  0195 1c0008        	addw	x,#8
 969  0198 1f02          	ldw	(OFST-13,sp),x
 971                     ; 732           tmpval = (u32)((u32)Measurement * MIN_MEAS_COEFF);
 973  019a 1e0e          	ldw	x,(OFST-1,sp)
 974  019c a6e6          	ld	a,#230
 975  019e cd0000        	call	c_cmulx
 977  01a1 96            	ldw	x,sp
 978  01a2 1c000a        	addw	x,#OFST-5
 979  01a5 cd0000        	call	c_rtol
 982                     ; 733           MinMeasurement = (u16)((u16)(tmpval >> 8) - NB_CYCLES_VIHVIL_LOOP);
 984  01a8 1e0b          	ldw	x,(OFST-4,sp)
 985  01aa 1d0008        	subw	x,#8
 986  01ad 1f04          	ldw	(OFST-11,sp),x
 989  01af 201f          	jra	L723
 990  01b1               L523:
 991                     ; 737           if ((Measurement < MinMeasurement) || (Measurement > MaxMeasurement))
 993  01b1 1e0e          	ldw	x,(OFST-1,sp)
 994  01b3 1304          	cpw	x,(OFST-11,sp)
 995  01b5 2506          	jrult	L333
 997  01b7 1e0e          	ldw	x,(OFST-1,sp)
 998  01b9 1302          	cpw	x,(OFST-13,sp)
 999  01bb 2313          	jrule	L723
1000  01bd               L333:
1001                     ; 739             MeasRejected++;
1003  01bd 0c09          	inc	(OFST-6,sp)
1005                     ; 740             RejectionCounter++;
1007  01bf 0c08          	inc	(OFST-7,sp)
1009                     ; 741             break; // Out from 'for SamplingShifter' loop !!!
1010  01c1               L762:
1011                     ; 748     while (MeasRejected && (RejectionCounter <= MAX_REJECTED_MEASUREMENTS));
1013  01c1 0d09          	tnz	(OFST-6,sp)
1014  01c3 2718          	jreq	L533
1016  01c5 7b08          	ld	a,(OFST-7,sp)
1017  01c7 a115          	cp	a,#21
1018  01c9 2403          	jruge	L62
1019  01cb cc00c9        	jp	L562
1020  01ce               L62:
1021  01ce 200d          	jra	L533
1022  01d0               L723:
1023                     ; 660            SamplingShifter < (SAMPLING_SHIFTER_NB_LOOPS + SAMPLING_SHIFTER_LOOP_START);
1023                     ; 661            SamplingShifter++)
1025  01d0 3c02          	inc	_SamplingShifter
1026                     ; 659       for (SamplingShifter = SAMPLING_SHIFTER_LOOP_START;
1026                     ; 660            SamplingShifter < (SAMPLING_SHIFTER_NB_LOOPS + SAMPLING_SHIFTER_LOOP_START);
1028  01d2 b602          	ld	a,_SamplingShifter
1029  01d4 a109          	cp	a,#9
1030  01d6 2403          	jruge	L03
1031  01d8 cc00d2        	jp	L372
1032  01db               L03:
1033  01db 20e4          	jra	L762
1034  01dd               L533:
1035                     ; 750     if (MeasRejected == 0)
1037  01dd 0d09          	tnz	(OFST-6,sp)
1038  01df 2616          	jrne	L152
1039                     ; 752       FinalMeasurementValue += CumulatedMeasurement;
1041  01e1 1e06          	ldw	x,(OFST-9,sp)
1042  01e3 cd0000        	call	c_uitolx
1044  01e6 ae0005        	ldw	x,#_FinalMeasurementValue
1045  01e9 cd0000        	call	c_lgadd
1048                     ; 641   for (AcqLoopIndex = 0; AcqLoopIndex < AcqNumber; AcqLoopIndex++)
1050  01ec 0c01          	inc	(OFST-14,sp)
1052  01ee               L742:
1055  01ee 7b01          	ld	a,(OFST-14,sp)
1056  01f0 1110          	cp	a,(OFST+1,sp)
1057  01f2 2403          	jruge	L23
1058  01f4 cc00b9        	jp	L342
1059  01f7               L23:
1060  01f7               L152:
1061                     ; 761   TSL_IO_Clamp(); // To avoid consumption
1063  01f7 cd0066        	call	_TSL_IO_Clamp
1065                     ; 762   enableInterrupts();
1068  01fa 9a            rim
1070                     ; 764   *sTouchIO.RejectedNb = RejectionCounter;
1073  01fb 7b08          	ld	a,(OFST-7,sp)
1074  01fd 92c70f        	ld	[_sTouchIO+6.w],a
1075                     ; 766   if (RejectionCounter <= MAX_REJECTED_MEASUREMENTS)
1077  0200 7b08          	ld	a,(OFST-7,sp)
1078  0202 a115          	cp	a,#21
1079  0204 2420          	jruge	L343
1080                     ; 768     FinalMeasurementValue = (u32)(FinalMeasurementValue >> 3); /* Division by SAMPLING_SHIFTER_NB_LOOPS */
1082  0206 ae0005        	ldw	x,#_FinalMeasurementValue
1083  0209 a603          	ld	a,#3
1084  020b cd0000        	call	c_lgursh
1087  020e 2008          	jra	L743
1088  0210               L543:
1089                     ; 771       FinalMeasurementValue = (u32)(FinalMeasurementValue >> 1);
1091  0210 3405          	srl	_FinalMeasurementValue
1092  0212 3606          	rrc	_FinalMeasurementValue+1
1093  0214 3607          	rrc	_FinalMeasurementValue+2
1094  0216 3608          	rrc	_FinalMeasurementValue+3
1095  0218               L743:
1096                     ; 769     while (AdjustmentLevel--)
1098  0218 7b11          	ld	a,(OFST+2,sp)
1099  021a 0a11          	dec	(OFST+2,sp)
1100  021c 4d            	tnz	a
1101  021d 26f1          	jrne	L543
1102                     ; 773     *sTouchIO.Measurement = (u16)FinalMeasurementValue;
1104  021f be07          	ldw	x,_FinalMeasurementValue+2
1105  0221 92cf0d        	ldw	[_sTouchIO+4.w],x
1107  0224 2008          	jra	L353
1108  0226               L343:
1109                     ; 781       pKeyStruct->Setting.b.NOISE = 1; /* Warning: Application layer must reset this flag */
1111  0226 be00          	ldw	x,_pKeyStruct
1112  0228 e602          	ld	a,(2,x)
1113  022a aa40          	or	a,#64
1114  022c e702          	ld	(2,x),a
1115  022e               L353:
1116                     ; 791 }
1119  022e 5b11          	addw	sp,#17
1120  0230 81            	ret
1336                     	switch	.ubsct
1337  0000               L71_SpreadCounter:
1338  0000 00            	ds.b	1
1339  0001               _AcquisitionBitMask:
1340  0001 00            	ds.b	1
1341                     	xdef	_AcquisitionBitMask
1342  0002               _SamplingShifter:
1343  0002 00            	ds.b	1
1344                     	xdef	_SamplingShifter
1345  0003               _CounterStop:
1346  0003 0000          	ds.b	2
1347                     	xdef	_CounterStop
1348  0005               _FinalMeasurementValue:
1349  0005 00000000      	ds.b	4
1350                     	xdef	_FinalMeasurementValue
1351                     	xref.b	_IT_Sync_Flags
1352                     	xref.b	_pKeyStruct
1353                     	xdef	_TSL_IO_SW_Spread_Spectrum
1354                     	xdef	_TSL_IO_SW_Burst_Stop_Timer
1355                     	xdef	_TSL_IO_SW_Burst_Start_Timer
1356                     	xdef	_TSL_IO_SW_Burst_Wait_Vih
1357                     	xdef	_TSL_IO_SW_Burst_Wait_Vil
1358                     	xdef	_TSL_IO_SW_Burst_TestSyncShift
1359                     	xdef	_TSL_IO_Acquisition
1360                     	xdef	_TSL_IO_Clamp
1361                     	xdef	_TSL_IO_Init
1362                     	xdef	_Table_SCKEY_BITS
1363  0009               _sTouchIO:
1364  0009 000000000000  	ds.b	9
1365                     	xdef	_sTouchIO
1366                     	xref.b	c_x
1367                     	xref.b	c_y
1387                     	xref	c_lgursh
1388                     	xref	c_lgadd
1389                     	xref	c_uitolx
1390                     	xref	c_cmulx
1391                     	xref	c_rtol
1392                     	xref	c_umul
1393                     	end
