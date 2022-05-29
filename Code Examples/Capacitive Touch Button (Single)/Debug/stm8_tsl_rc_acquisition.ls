   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  48                     .const:	section	.text
  49  0000               _Table_SCKEY_BITS:
  50  0000 02            	dc.b	2
  81                     ; 244 void TSL_IO_SW_Burst_TestSyncShift(void)
  81                     ; 245 {
  83                     	switch	.text
  84  0000               _TSL_IO_SW_Burst_TestSyncShift:
  88                     ; 249   ld a, _SamplingShifter
  91  0000 b602          ld a, _SamplingShifter
  93                     ; 251 ShiftLoopVih:
  96  0002               ShiftLoopVih:
  98                     ; 252   dec a       // 1 cycle
 101  0002 4a            dec a       // 1 cycle
 103                     ; 253   jrne ShiftLoopVih
 106  0003 26fd          jrne ShiftLoopVih
 108                     ; 270 }
 111  0005 81            	ret
 135                     ; 281 void TSL_IO_SW_Burst_Wait_Vil(void)
 135                     ; 282 {
 136                     	switch	.text
 137  0006               _TSL_IO_SW_Burst_Wait_Vil:
 141                     ; 286   ld a, _AcquisitionBitMask
 144  0006 b601          ld a, _AcquisitionBitMask
 146                     ; 287   ldw x, _sTouchIO   // Input data register ...
 149  0008 be09          ldw x, _sTouchIO   // Input data register ...
 151                     ; 288   incw x
 154  000a 5c            incw x
 156                     ; 290 WaitForVil:
 159  000b               WaitForVil:
 161                     ; 294   bcp a, (x)  // 1 cycles
 164  000b f5            bcp a, (x)  // 1 cycles
 166                     ; 295   jreq EndWaitForVil
 169  000c 270a          jreq EndWaitForVil
 171                     ; 296   ldw y, _TIMACQ_CNTR // 2 cycles; hw counter also used for timeout ...
 174  000e 90ce5328      ldw y, _TIMACQ_CNTR // 2 cycles; hw counter also used for timeout ...
 176                     ; 297   cpw y, #0x0E00    // 2 cycles; Timeout compare
 179  0012 90a30e00      cpw y, #0x0E00    // 2 cycles; Timeout compare
 181                     ; 298   jrult WaitForVil
 184  0016 25f3          jrult WaitForVil
 186                     ; 299 EndWaitForVil:
 189  0018               EndWaitForVil:
 191                     ; 335 }
 194  0018 81            	ret
 218                     ; 346 void TSL_IO_SW_Burst_Wait_Vih(void)
 218                     ; 347 {
 219                     	switch	.text
 220  0019               _TSL_IO_SW_Burst_Wait_Vih:
 224                     ; 350   ld a, _AcquisitionBitMask
 227  0019 b601          ld a, _AcquisitionBitMask
 229                     ; 351   ldw x, _sTouchIO   // Input data register ...
 232  001b be09          ldw x, _sTouchIO   // Input data register ...
 234                     ; 352   incw x
 237  001d 5c            incw x
 239                     ; 354 WaitForVih:
 242  001e               WaitForVih:
 244                     ; 358   bcp a, (x)  // 1 cycles
 247  001e f5            bcp a, (x)  // 1 cycles
 249                     ; 359   jrne EndWaitForVih
 252  001f 260a          jrne EndWaitForVih
 254                     ; 360   ldw y, _TIMACQ_CNTR // 2 cycles; hw counter also used for timeout ...
 257  0021 90ce5328      ldw y, _TIMACQ_CNTR // 2 cycles; hw counter also used for timeout ...
 259                     ; 361   cpw y, #0x0E00    // 2 cycles; Timeout compare
 262  0025 90a30e00      cpw y, #0x0E00    // 2 cycles; Timeout compare
 264                     ; 362   jrult WaitForVih
 267  0029 25f3          jrult WaitForVih
 269                     ; 363 EndWaitForVih:
 272  002b               EndWaitForVih:
 274                     ; 400 }
 277  002b 81            	ret
 313                     ; 420 void TSL_IO_SW_Spread_Spectrum(void)
 313                     ; 421 {
 314                     	switch	.text
 315  002c               _TSL_IO_SW_Spread_Spectrum:
 317  002c 88            	push	a
 318       00000001      OFST:	set	1
 321                     ; 424   SpreadCounter++;
 323  002d 3c00          	inc	L71_SpreadCounter
 324                     ; 426   if (SpreadCounter == SPREAD_COUNTER_MAX)
 326  002f b600          	ld	a,L71_SpreadCounter
 327  0031 a114          	cp	a,#20
 328  0033 2604          	jrne	L57
 329                     ; 428     SpreadCounter = SPREAD_COUNTER_MIN;
 331  0035 35010000      	mov	L71_SpreadCounter,#1
 332  0039               L57:
 333                     ; 431   for (i = SpreadCounter; i; i--) {}}
 335  0039 b600          	ld	a,L71_SpreadCounter
 336  003b 6b01          	ld	(OFST+0,sp),a
 339  003d 2002          	jra	L301
 340  003f               L77:
 343  003f 0a01          	dec	(OFST+0,sp)
 345  0041               L301:
 348  0041 0d01          	tnz	(OFST+0,sp)
 349  0043 26fa          	jrne	L77
 353  0045 84            	pop	a
 354  0046 81            	ret
 378                     ; 447 void TSL_IO_Init(void)
 378                     ; 448 {
 379                     	switch	.text
 380  0047               _TSL_IO_Init:
 384                     ; 451   ((GPIO_TypeDef *)(LOADREF_PORT_ADDR))->CR1 |= LOADREF_BIT;
 386  0047 7214500d      	bset	20493,#2
 387                     ; 452   ((GPIO_TypeDef *)(LOADREF_PORT_ADDR))->DDR |= LOADREF_BIT;
 389  004b 7214500c      	bset	20492,#2
 390                     ; 453   ((GPIO_TypeDef *)(LOADREF_PORT_ADDR))->ODR &= (u8)(~LOADREF_BIT);
 392  004f 7215500a      	bres	20490,#2
 393                     ; 463   ((GPIO_TypeDef *)(GPIOC_BaseAddress))->CR1 |= GPIOC_ELECTRODES_MASK;
 395  0053 c6500d        	ld	a,20493
 396  0056 aa0a          	or	a,#10
 397  0058 c7500d        	ld	20493,a
 398                     ; 484   TSL_IO_Clamp();
 400  005b ad09          	call	_TSL_IO_Clamp
 402                     ; 487   TIMACQ->PSCR = 0;
 404  005d 725f532a      	clr	21290
 405                     ; 488   TIMACQ->CR1 = 0x01;
 407  0061 35015320      	mov	21280,#1
 408                     ; 490 }
 411  0065 81            	ret
 434                     ; 503 void TSL_IO_Clamp(void)
 434                     ; 504 {
 435                     	switch	.text
 436  0066               _TSL_IO_Clamp:
 440                     ; 507   ((GPIO_TypeDef *)(LOADREF_PORT_ADDR))->ODR &= (u8)(~LOADREF_BIT);
 442  0066 7215500a      	bres	20490,#2
 443                     ; 519   ((GPIO_TypeDef *)(GPIOC_BaseAddress))->ODR &= (u8)(~GPIOC_ELECTRODES_MASK);
 445  006a c6500a        	ld	a,20490
 446  006d a4f5          	and	a,#245
 447  006f c7500a        	ld	20490,a
 448                     ; 520   ((GPIO_TypeDef *)(GPIOC_BaseAddress))->DDR |= GPIOC_ELECTRODES_MASK;
 450  0072 c6500c        	ld	a,20492
 451  0075 aa0a          	or	a,#10
 452  0077 c7500c        	ld	20492,a
 453                     ; 547 }
 456  007a 81            	ret
 480                     ; 560 void TSL_IO_SW_Burst_Start_Timer(void)
 480                     ; 561 {
 481                     	switch	.text
 482  007b               _TSL_IO_SW_Burst_Start_Timer:
 486                     ; 563   TIMACQ->EGR |= 0x01;
 488  007b 72105324      	bset	21284,#0
 489                     ; 565 }
 492  007f 81            	ret
 516                     ; 578 void TSL_IO_SW_Burst_Stop_Timer(void)
 516                     ; 579 {
 517                     	switch	.text
 518  0080               _TSL_IO_SW_Burst_Stop_Timer:
 522                     ; 582   ld a, _TIMACQ_CNTR
 525  0080 c65328        ld a, _TIMACQ_CNTR
 527                     ; 583   ld _CounterStop, a
 530  0083 b703          ld _CounterStop, a
 532                     ; 584   ld a, _TIMACQ_CNTR + 1
 535  0085 c65329        ld a, _TIMACQ_CNTR + 1
 537                     ; 585   ld _CounterStop + 1, a
 540  0088 b704          ld _CounterStop + 1, a
 542                     ; 602 }
 545  008a 81            	ret
 681                     ; 615 void TSL_IO_Acquisition(u8 AcqNumber, u8 AdjustmentLevel)
 681                     ; 616 {
 682                     	switch	.text
 683  008b               _TSL_IO_Acquisition:
 685  008b 89            	pushw	x
 686  008c 520f          	subw	sp,#15
 687       0000000f      OFST:	set	15
 690                     ; 623   AcquisitionBitMask = sTouchIO.AcqMask;
 692  008e 450b01        	mov	_AcquisitionBitMask,_sTouchIO+2
 693                     ; 625   MinMeasurement = 0;
 695  0091 5f            	clrw	x
 696  0092 1f04          	ldw	(OFST-11,sp),x
 698                     ; 626   MaxMeasurement = 0;
 700  0094 5f            	clrw	x
 701  0095 1f02          	ldw	(OFST-13,sp),x
 703                     ; 627   FinalMeasurementValue = 0;
 705  0097 ae0000        	ldw	x,#0
 706  009a bf07          	ldw	_FinalMeasurementValue+2,x
 707  009c ae0000        	ldw	x,#0
 708  009f bf05          	ldw	_FinalMeasurementValue,x
 709                     ; 628   RejectionCounter = 0;
 711  00a1 0f08          	clr	(OFST-7,sp)
 713                     ; 633   if (IT_Sync_Flags.one_acquisition_sync_enable)
 715  00a3 b600          	ld	a,_IT_Sync_Flags
 716  00a5 a501          	bcp	a,#1
 717  00a7 270a          	jreq	L132
 718                     ; 635     IT_Sync_Flags.start = 0;
 720  00a9 72170000      	bres	_IT_Sync_Flags,#3
 722  00ad               L732:
 723                     ; 636     while (IT_Sync_Flags.start == 0);
 725  00ad b600          	ld	a,_IT_Sync_Flags
 726  00af a508          	bcp	a,#8
 727  00b1 27fa          	jreq	L732
 728  00b3               L132:
 729                     ; 641   for (AcqLoopIndex = 0; AcqLoopIndex < AcqNumber; AcqLoopIndex++)
 731  00b3 0f01          	clr	(OFST-14,sp)
 734  00b5 acee01ee      	jpf	L742
 735  00b9               L342:
 736                     ; 646     if (IT_Sync_Flags.one_measure_sync_enable)
 738  00b9 b600          	ld	a,_IT_Sync_Flags
 739  00bb a502          	bcp	a,#2
 740  00bd 270a          	jreq	L562
 741                     ; 648       IT_Sync_Flags.start = 0;
 743  00bf 72170000      	bres	_IT_Sync_Flags,#3
 745  00c3               L162:
 746                     ; 649       while (IT_Sync_Flags.start == 0);
 748  00c3 b600          	ld	a,_IT_Sync_Flags
 749  00c5 a508          	bcp	a,#8
 750  00c7 27fa          	jreq	L162
 751  00c9               L562:
 752                     ; 656       MeasRejected = 0;
 754  00c9 0f09          	clr	(OFST-6,sp)
 756                     ; 657       CumulatedMeasurement = 0;
 758  00cb 5f            	clrw	x
 759  00cc 1f06          	ldw	(OFST-9,sp),x
 761                     ; 659       for (SamplingShifter = SAMPLING_SHIFTER_LOOP_START;
 763  00ce 35010002      	mov	_SamplingShifter,#1
 764  00d2               L372:
 765                     ; 664         disableInterrupts();
 768  00d2 9b            sim
 770                     ; 665         sTouchIO.PORT_ADDR->ODR &= (u8)(~sTouchIO.DriveMask);
 773  00d3 b60c          	ld	a,_sTouchIO+3
 774  00d5 43            	cpl	a
 775  00d6 92c409        	and	a,[_sTouchIO.w]
 776  00d9 92c709        	ld	[_sTouchIO.w],a
 777                     ; 666         sTouchIO.PORT_ADDR->DDR |= sTouchIO.DriveMask;
 779  00dc be09          	ldw	x,_sTouchIO
 780  00de e602          	ld	a,(2,x)
 781  00e0 ba0c          	or	a,_sTouchIO+3
 782  00e2 e702          	ld	(2,x),a
 783                     ; 667         sTouchIO.PORT_ADDR->CR1 &= (u8)(~sTouchIO.DriveMask);
 785  00e4 be09          	ldw	x,_sTouchIO
 786  00e6 b60c          	ld	a,_sTouchIO+3
 787  00e8 43            	cpl	a
 788  00e9 e403          	and	a,(3,x)
 789  00eb e703          	ld	(3,x),a
 790                     ; 668         ((GPIO_TypeDef *)(LOADREF_PORT_ADDR))->ODR |= LOADREF_BIT;
 792  00ed 7214500a      	bset	20490,#2
 793                     ; 669         enableInterrupts();
 796  00f1 9a            rim
 798                     ; 674         if (IT_Sync_Flags.one_charge_sync_enable)
 801  00f2 b600          	ld	a,_IT_Sync_Flags
 802  00f4 a504          	bcp	a,#4
 803  00f6 270a          	jreq	L103
 804                     ; 676           IT_Sync_Flags.start = 0;
 806  00f8 72170000      	bres	_IT_Sync_Flags,#3
 808  00fc               L703:
 809                     ; 677           while (IT_Sync_Flags.start == 0);
 811  00fc b600          	ld	a,_IT_Sync_Flags
 812  00fe a508          	bcp	a,#8
 813  0100 27fa          	jreq	L703
 814  0102               L103:
 815                     ; 682         TSL_IO_SW_Spread_Spectrum();
 817  0102 cd002c        	call	_TSL_IO_SW_Spread_Spectrum
 819                     ; 685         disableInterrupts();
 822  0105 9b            sim
 824                     ; 686         TSL_IO_SW_Burst_Start_Timer();
 827  0106 cd007b        	call	_TSL_IO_SW_Burst_Start_Timer
 829                     ; 687         sTouchIO.PORT_ADDR->DDR &= (u8)(~sTouchIO.DriveMask);
 831  0109 be09          	ldw	x,_sTouchIO
 832  010b b60c          	ld	a,_sTouchIO+3
 833  010d 43            	cpl	a
 834  010e e402          	and	a,(2,x)
 835  0110 e702          	ld	(2,x),a
 836                     ; 688         TSL_IO_SW_Burst_TestSyncShift();
 838  0112 cd0000        	call	_TSL_IO_SW_Burst_TestSyncShift
 840                     ; 689         TSL_IO_SW_Burst_Wait_Vih();
 842  0115 cd0019        	call	_TSL_IO_SW_Burst_Wait_Vih
 844                     ; 690         TSL_IO_SW_Burst_Stop_Timer();
 846  0118 cd0080        	call	_TSL_IO_SW_Burst_Stop_Timer
 848                     ; 692         Measurement = CounterStop;
 850  011b be03          	ldw	x,_CounterStop
 851  011d 1f0e          	ldw	(OFST-1,sp),x
 853                     ; 695         sTouchIO.PORT_ADDR->ODR |= sTouchIO.DriveMask;
 855  011f 92c609        	ld	a,[_sTouchIO.w]
 856  0122 ba0c          	or	a,_sTouchIO+3
 857  0124 92c709        	ld	[_sTouchIO.w],a
 858                     ; 696         sTouchIO.PORT_ADDR->DDR |= sTouchIO.DriveMask;
 860  0127 be09          	ldw	x,_sTouchIO
 861  0129 e602          	ld	a,(2,x)
 862  012b ba0c          	or	a,_sTouchIO+3
 863  012d e702          	ld	(2,x),a
 864                     ; 697         sTouchIO.PORT_ADDR->CR1 |= sTouchIO.DriveMask;
 866  012f be09          	ldw	x,_sTouchIO
 867  0131 e603          	ld	a,(3,x)
 868  0133 ba0c          	or	a,_sTouchIO+3
 869  0135 e703          	ld	(3,x),a
 870                     ; 698         ((GPIO_TypeDef *)(LOADREF_PORT_ADDR))->ODR &= (u8)(~LOADREF_BIT);
 872  0137 7215500a      	bres	20490,#2
 873                     ; 699         enableInterrupts();
 876  013b 9a            rim
 878                     ; 704         if (IT_Sync_Flags.one_charge_sync_enable)
 881  013c b600          	ld	a,_IT_Sync_Flags
 882  013e a504          	bcp	a,#4
 883  0140 270a          	jreq	L313
 884                     ; 706           IT_Sync_Flags.start = 0;
 886  0142 72170000      	bres	_IT_Sync_Flags,#3
 888  0146               L123:
 889                     ; 707           while (IT_Sync_Flags.start == 0);
 891  0146 b600          	ld	a,_IT_Sync_Flags
 892  0148 a508          	bcp	a,#8
 893  014a 27fa          	jreq	L123
 894  014c               L313:
 895                     ; 712         TSL_IO_SW_Spread_Spectrum();
 897  014c cd002c        	call	_TSL_IO_SW_Spread_Spectrum
 899                     ; 715         disableInterrupts();
 902  014f 9b            sim
 904                     ; 716         TSL_IO_SW_Burst_Start_Timer();
 907  0150 cd007b        	call	_TSL_IO_SW_Burst_Start_Timer
 909                     ; 717         sTouchIO.PORT_ADDR->CR1 &= (u8)(~sTouchIO.DriveMask);
 911  0153 be09          	ldw	x,_sTouchIO
 912  0155 b60c          	ld	a,_sTouchIO+3
 913  0157 43            	cpl	a
 914  0158 e403          	and	a,(3,x)
 915  015a e703          	ld	(3,x),a
 916                     ; 718         sTouchIO.PORT_ADDR->DDR &= (u8)(~sTouchIO.DriveMask);
 918  015c be09          	ldw	x,_sTouchIO
 919  015e b60c          	ld	a,_sTouchIO+3
 920  0160 43            	cpl	a
 921  0161 e402          	and	a,(2,x)
 922  0163 e702          	ld	(2,x),a
 923                     ; 719         TSL_IO_SW_Burst_TestSyncShift();
 925  0165 cd0000        	call	_TSL_IO_SW_Burst_TestSyncShift
 927                     ; 720         TSL_IO_SW_Burst_Wait_Vil();
 929  0168 cd0006        	call	_TSL_IO_SW_Burst_Wait_Vil
 931                     ; 721         TSL_IO_SW_Burst_Stop_Timer();
 933  016b cd0080        	call	_TSL_IO_SW_Burst_Stop_Timer
 935                     ; 723         Measurement += CounterStop;
 937  016e 1e0e          	ldw	x,(OFST-1,sp)
 938  0170 72bb0003      	addw	x,_CounterStop
 939  0174 1f0e          	ldw	(OFST-1,sp),x
 941                     ; 725         CumulatedMeasurement += Measurement;
 943  0176 1e06          	ldw	x,(OFST-9,sp)
 944  0178 72fb0e        	addw	x,(OFST-1,sp)
 945  017b 1f06          	ldw	(OFST-9,sp),x
 947                     ; 728         if (SamplingShifter == SAMPLING_SHIFTER_LOOP_START)
 949  017d b602          	ld	a,_SamplingShifter
 950  017f a101          	cp	a,#1
 951  0181 262e          	jrne	L523
 952                     ; 730           tmpval = (u32)((u32)Measurement * MAX_MEAS_COEFF);
 954  0183 1e0e          	ldw	x,(OFST-1,sp)
 955  0185 90ae011a      	ldw	y,#282
 956  0189 cd0000        	call	c_umul
 958  018c 96            	ldw	x,sp
 959  018d 1c000a        	addw	x,#OFST-5
 960  0190 cd0000        	call	c_rtol
 963                     ; 731           MaxMeasurement = (u16)((u16)(tmpval >> 8) + NB_CYCLES_VIHVIL_LOOP);
 965  0193 1e0b          	ldw	x,(OFST-4,sp)
 966  0195 1c0008        	addw	x,#8
 967  0198 1f02          	ldw	(OFST-13,sp),x
 969                     ; 732           tmpval = (u32)((u32)Measurement * MIN_MEAS_COEFF);
 971  019a 1e0e          	ldw	x,(OFST-1,sp)
 972  019c a6e6          	ld	a,#230
 973  019e cd0000        	call	c_cmulx
 975  01a1 96            	ldw	x,sp
 976  01a2 1c000a        	addw	x,#OFST-5
 977  01a5 cd0000        	call	c_rtol
 980                     ; 733           MinMeasurement = (u16)((u16)(tmpval >> 8) - NB_CYCLES_VIHVIL_LOOP);
 982  01a8 1e0b          	ldw	x,(OFST-4,sp)
 983  01aa 1d0008        	subw	x,#8
 984  01ad 1f04          	ldw	(OFST-11,sp),x
 987  01af 201f          	jra	L723
 988  01b1               L523:
 989                     ; 737           if ((Measurement < MinMeasurement) || (Measurement > MaxMeasurement))
 991  01b1 1e0e          	ldw	x,(OFST-1,sp)
 992  01b3 1304          	cpw	x,(OFST-11,sp)
 993  01b5 2506          	jrult	L333
 995  01b7 1e0e          	ldw	x,(OFST-1,sp)
 996  01b9 1302          	cpw	x,(OFST-13,sp)
 997  01bb 2313          	jrule	L723
 998  01bd               L333:
 999                     ; 739             MeasRejected++;
1001  01bd 0c09          	inc	(OFST-6,sp)
1003                     ; 740             RejectionCounter++;
1005  01bf 0c08          	inc	(OFST-7,sp)
1007                     ; 741             break; // Out from 'for SamplingShifter' loop !!!
1008  01c1               L762:
1009                     ; 748     while (MeasRejected && (RejectionCounter <= MAX_REJECTED_MEASUREMENTS));
1011  01c1 0d09          	tnz	(OFST-6,sp)
1012  01c3 2718          	jreq	L533
1014  01c5 7b08          	ld	a,(OFST-7,sp)
1015  01c7 a106          	cp	a,#6
1016  01c9 2403          	jruge	L62
1017  01cb cc00c9        	jp	L562
1018  01ce               L62:
1019  01ce 200d          	jra	L533
1020  01d0               L723:
1021                     ; 660            SamplingShifter < (SAMPLING_SHIFTER_NB_LOOPS + SAMPLING_SHIFTER_LOOP_START);
1021                     ; 661            SamplingShifter++)
1023  01d0 3c02          	inc	_SamplingShifter
1024                     ; 659       for (SamplingShifter = SAMPLING_SHIFTER_LOOP_START;
1024                     ; 660            SamplingShifter < (SAMPLING_SHIFTER_NB_LOOPS + SAMPLING_SHIFTER_LOOP_START);
1026  01d2 b602          	ld	a,_SamplingShifter
1027  01d4 a109          	cp	a,#9
1028  01d6 2403          	jruge	L03
1029  01d8 cc00d2        	jp	L372
1030  01db               L03:
1031  01db 20e4          	jra	L762
1032  01dd               L533:
1033                     ; 750     if (MeasRejected == 0)
1035  01dd 0d09          	tnz	(OFST-6,sp)
1036  01df 2616          	jrne	L152
1037                     ; 752       FinalMeasurementValue += CumulatedMeasurement;
1039  01e1 1e06          	ldw	x,(OFST-9,sp)
1040  01e3 cd0000        	call	c_uitolx
1042  01e6 ae0005        	ldw	x,#_FinalMeasurementValue
1043  01e9 cd0000        	call	c_lgadd
1046                     ; 641   for (AcqLoopIndex = 0; AcqLoopIndex < AcqNumber; AcqLoopIndex++)
1048  01ec 0c01          	inc	(OFST-14,sp)
1050  01ee               L742:
1053  01ee 7b01          	ld	a,(OFST-14,sp)
1054  01f0 1110          	cp	a,(OFST+1,sp)
1055  01f2 2403          	jruge	L23
1056  01f4 cc00b9        	jp	L342
1057  01f7               L23:
1058  01f7               L152:
1059                     ; 761   TSL_IO_Clamp(); // To avoid consumption
1061  01f7 cd0066        	call	_TSL_IO_Clamp
1063                     ; 762   enableInterrupts();
1066  01fa 9a            rim
1068                     ; 764   *sTouchIO.RejectedNb = RejectionCounter;
1071  01fb 7b08          	ld	a,(OFST-7,sp)
1072  01fd 92c70f        	ld	[_sTouchIO+6.w],a
1073                     ; 766   if (RejectionCounter <= MAX_REJECTED_MEASUREMENTS)
1075  0200 7b08          	ld	a,(OFST-7,sp)
1076  0202 a106          	cp	a,#6
1077  0204 2420          	jruge	L343
1078                     ; 768     FinalMeasurementValue = (u32)(FinalMeasurementValue >> 3); /* Division by SAMPLING_SHIFTER_NB_LOOPS */
1080  0206 ae0005        	ldw	x,#_FinalMeasurementValue
1081  0209 a603          	ld	a,#3
1082  020b cd0000        	call	c_lgursh
1085  020e 2008          	jra	L743
1086  0210               L543:
1087                     ; 771       FinalMeasurementValue = (u32)(FinalMeasurementValue >> 1);
1089  0210 3405          	srl	_FinalMeasurementValue
1090  0212 3606          	rrc	_FinalMeasurementValue+1
1091  0214 3607          	rrc	_FinalMeasurementValue+2
1092  0216 3608          	rrc	_FinalMeasurementValue+3
1093  0218               L743:
1094                     ; 769     while (AdjustmentLevel--)
1096  0218 7b11          	ld	a,(OFST+2,sp)
1097  021a 0a11          	dec	(OFST+2,sp)
1098  021c 4d            	tnz	a
1099  021d 26f1          	jrne	L543
1100                     ; 773     *sTouchIO.Measurement = (u16)FinalMeasurementValue;
1102  021f be07          	ldw	x,_FinalMeasurementValue+2
1103  0221 92cf0d        	ldw	[_sTouchIO+4.w],x
1105  0224 2008          	jra	L353
1106  0226               L343:
1107                     ; 781       pKeyStruct->Setting.b.NOISE = 1; /* Warning: Application layer must reset this flag */
1109  0226 be00          	ldw	x,_pKeyStruct
1110  0228 e602          	ld	a,(2,x)
1111  022a aa40          	or	a,#64
1112  022c e702          	ld	(2,x),a
1113  022e               L353:
1114                     ; 791 }
1117  022e 5b11          	addw	sp,#17
1118  0230 81            	ret
1334                     	switch	.ubsct
1335  0000               L71_SpreadCounter:
1336  0000 00            	ds.b	1
1337  0001               _AcquisitionBitMask:
1338  0001 00            	ds.b	1
1339                     	xdef	_AcquisitionBitMask
1340  0002               _SamplingShifter:
1341  0002 00            	ds.b	1
1342                     	xdef	_SamplingShifter
1343  0003               _CounterStop:
1344  0003 0000          	ds.b	2
1345                     	xdef	_CounterStop
1346  0005               _FinalMeasurementValue:
1347  0005 00000000      	ds.b	4
1348                     	xdef	_FinalMeasurementValue
1349                     	xref.b	_IT_Sync_Flags
1350                     	xref.b	_pKeyStruct
1351                     	xdef	_TSL_IO_SW_Spread_Spectrum
1352                     	xdef	_TSL_IO_SW_Burst_Stop_Timer
1353                     	xdef	_TSL_IO_SW_Burst_Start_Timer
1354                     	xdef	_TSL_IO_SW_Burst_Wait_Vih
1355                     	xdef	_TSL_IO_SW_Burst_Wait_Vil
1356                     	xdef	_TSL_IO_SW_Burst_TestSyncShift
1357                     	xdef	_TSL_IO_Acquisition
1358                     	xdef	_TSL_IO_Clamp
1359                     	xdef	_TSL_IO_Init
1360                     	xdef	_Table_SCKEY_BITS
1361  0009               _sTouchIO:
1362  0009 000000000000  	ds.b	9
1363                     	xdef	_sTouchIO
1364                     	xref.b	c_x
1365                     	xref.b	c_y
1385                     	xref	c_lgursh
1386                     	xref	c_lgadd
1387                     	xref	c_uitolx
1388                     	xref	c_cmulx
1389                     	xref	c_rtol
1390                     	xref	c_umul
1391                     	end
