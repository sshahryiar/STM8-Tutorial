   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  14                     	switch	.data
  15  0000               _ID:
  16  0000 00000000      	dc.l	0
  17  0004               _tx_buffer:
  18  0004 00            	dc.b	0
  19  0005 00            	dc.b	0
  20  0006 00            	dc.b	0
  21  0007               _rx_buffer:
  22  0007 00            	dc.b	0
  23  0008 00            	dc.b	0
  24  0009 00            	dc.b	0
  25  000a 00            	dc.b	0
  26  000b 00            	dc.b	0
  27  000c 00            	dc.b	0
  28  000d 00            	dc.b	0
  29  000e 00            	dc.b	0
 105                     ; 23 void main(void)
 105                     ; 24 {
 107                     	switch	.text
 108  0000               _main:
 110  0000 88            	push	a
 111       00000001      OFST:	set	1
 114                     ; 25 	bool toggle = FALSE;
 116  0001 0f01          	clr	(OFST+0,sp)
 118                     ; 27 	setup();
 120  0003 cd0152        	call	_setup
 122                     ; 29 	OLED_print_string(0, 0, "CAN Node 2");
 124  0006 ae0057        	ldw	x,#L34
 125  0009 89            	pushw	x
 126  000a 5f            	clrw	x
 127  000b cd0000        	call	_OLED_print_string
 129  000e 85            	popw	x
 130                     ; 30 	OLED_print_string(0, 1, "Node 2 ID       4660");
 132  000f ae0042        	ldw	x,#L54
 133  0012 89            	pushw	x
 134  0013 ae0001        	ldw	x,#1
 135  0016 cd0000        	call	_OLED_print_string
 137  0019 85            	popw	x
 138                     ; 31 	OLED_print_string(0, 2, "DS18B20 T/ 'C: ");
 140  001a ae0032        	ldw	x,#L74
 141  001d 89            	pushw	x
 142  001e ae0002        	ldw	x,#2
 143  0021 cd0000        	call	_OLED_print_string
 145  0024 85            	popw	x
 146                     ; 32 	OLED_print_string(0, 3, "DHT11     T/'C :");
 148  0025 ae0021        	ldw	x,#L15
 149  0028 89            	pushw	x
 150  0029 ae0003        	ldw	x,#3
 151  002c cd0000        	call	_OLED_print_string
 153  002f 85            	popw	x
 154                     ; 33 	OLED_print_string(0, 4, "DHT11  RH/% :");
 156  0030 ae0013        	ldw	x,#L35
 157  0033 89            	pushw	x
 158  0034 ae0004        	ldw	x,#4
 159  0037 cd0000        	call	_OLED_print_string
 161  003a 85            	popw	x
 162                     ; 34 	OLED_print_string(0, 5, "RX Node ID");
 164  003b ae0008        	ldw	x,#L55
 165  003e 89            	pushw	x
 166  003f ae0005        	ldw	x,#5
 167  0042 cd0000        	call	_OLED_print_string
 169  0045 85            	popw	x
 170                     ; 35 	OLED_print_string(0, 6, "RX Data");
 172  0046 ae0000        	ldw	x,#L75
 173  0049 89            	pushw	x
 174  004a ae0006        	ldw	x,#6
 175  004d cd0000        	call	_OLED_print_string
 177  0050 85            	popw	x
 178  0051               L16:
 179                     ; 39 		get_data();
 181  0051 cd0000        	call	_get_data
 183                     ; 41 		tx_buffer[0] = values[0];	
 185  0054 5500000004    	mov	_tx_buffer,_values
 186                     ; 42 		tx_buffer[1] = values[2];	
 188  0059 5500020005    	mov	_tx_buffer+1,_values+2
 189                     ; 44 		switch(toggle)
 191  005e 7b01          	ld	a,(OFST+0,sp)
 193                     ; 54 				break;
 194  0060 4d            	tnz	a
 195  0061 2709          	jreq	L5
 196  0063 4a            	dec	a
 197  0064 260a          	jrne	L76
 198                     ; 48 				tx_buffer[2] = 0x66;
 200  0066 35660006      	mov	_tx_buffer+2,#102
 201                     ; 49 				break;
 203  006a 2004          	jra	L76
 204  006c               L5:
 205                     ; 53 				tx_buffer[2] = 0x99;
 207  006c 35990006      	mov	_tx_buffer+2,#153
 208                     ; 54 				break;
 210  0070               L76:
 211                     ; 58 		if(rx_buffer[1] == 0x55)
 213  0070 c60008        	ld	a,_rx_buffer+1
 214  0073 a155          	cp	a,#85
 215  0075 260b          	jrne	L17
 216                     ; 60 			GPIO_WriteHigh(GPIOE, GPIO_PIN_0);
 218  0077 4b01          	push	#1
 219  0079 ae5014        	ldw	x,#20500
 220  007c cd0000        	call	_GPIO_WriteHigh
 222  007f 84            	pop	a
 224  0080 2021          	jra	L37
 225  0082               L17:
 226                     ; 62 		else if(rx_buffer[1] == 0xAA)
 228  0082 c60008        	ld	a,_rx_buffer+1
 229  0085 a1aa          	cp	a,#170
 230  0087 260b          	jrne	L57
 231                     ; 64 			GPIO_WriteLow(GPIOE, GPIO_PIN_0);
 233  0089 4b01          	push	#1
 234  008b ae5014        	ldw	x,#20500
 235  008e cd0000        	call	_GPIO_WriteLow
 237  0091 84            	pop	a
 239  0092 200f          	jra	L37
 240  0094               L57:
 241                     ; 68 			GPIO_WriteReverse(GPIOE, GPIO_PIN_0);
 243  0094 4b01          	push	#1
 244  0096 ae5014        	ldw	x,#20500
 245  0099 cd0000        	call	_GPIO_WriteReverse
 247  009c 84            	pop	a
 248                     ; 69 			delay_ms(100);
 250  009d ae0064        	ldw	x,#100
 251  00a0 cd0000        	call	_delay_ms
 253  00a3               L37:
 254                     ; 72 		send_data_to_CAN_bus();
 256  00a3 cd022d        	call	_send_data_to_CAN_bus
 258                     ; 73 		receive_data_from_CAN_bus();
 260  00a6 cd028c        	call	_receive_data_from_CAN_bus
 262                     ; 75 		OLED_print_chr(103, 2, rx_buffer[0]);
 264  00a9 c60007        	ld	a,_rx_buffer
 265  00ac 5f            	clrw	x
 266  00ad 97            	ld	xl,a
 267  00ae 89            	pushw	x
 268  00af ae6702        	ldw	x,#26370
 269  00b2 cd0000        	call	_OLED_print_chr
 271  00b5 85            	popw	x
 272                     ; 76 		OLED_print_chr(103, 3, tx_buffer[1]);
 274  00b6 c60005        	ld	a,_tx_buffer+1
 275  00b9 5f            	clrw	x
 276  00ba 97            	ld	xl,a
 277  00bb 89            	pushw	x
 278  00bc ae6703        	ldw	x,#26371
 279  00bf cd0000        	call	_OLED_print_chr
 281  00c2 85            	popw	x
 282                     ; 77 		OLED_print_chr(103, 4, tx_buffer[0]);
 284  00c3 c60004        	ld	a,_tx_buffer
 285  00c6 5f            	clrw	x
 286  00c7 97            	ld	xl,a
 287  00c8 89            	pushw	x
 288  00c9 ae6704        	ldw	x,#26372
 289  00cc cd0000        	call	_OLED_print_chr
 291  00cf 85            	popw	x
 292                     ; 78 		OLED_print_int(85, 5, ID);
 294  00d0 ce0002        	ldw	x,_ID+2
 295  00d3 89            	pushw	x
 296  00d4 ce0000        	ldw	x,_ID
 297  00d7 89            	pushw	x
 298  00d8 ae5505        	ldw	x,#21765
 299  00db cd0000        	call	_OLED_print_int
 301  00de 5b04          	addw	sp,#4
 302                     ; 80 		OLED_print_chr(53, 6, rx_buffer[0]);
 304  00e0 c60007        	ld	a,_rx_buffer
 305  00e3 5f            	clrw	x
 306  00e4 97            	ld	xl,a
 307  00e5 89            	pushw	x
 308  00e6 ae3506        	ldw	x,#13574
 309  00e9 cd0000        	call	_OLED_print_chr
 311  00ec 85            	popw	x
 312                     ; 81 		OLED_print_chr(77, 6, rx_buffer[1]);
 314  00ed c60008        	ld	a,_rx_buffer+1
 315  00f0 5f            	clrw	x
 316  00f1 97            	ld	xl,a
 317  00f2 89            	pushw	x
 318  00f3 ae4d06        	ldw	x,#19718
 319  00f6 cd0000        	call	_OLED_print_chr
 321  00f9 85            	popw	x
 322                     ; 82 		OLED_print_chr(101, 6, rx_buffer[2]);
 324  00fa c60009        	ld	a,_rx_buffer+2
 325  00fd 5f            	clrw	x
 326  00fe 97            	ld	xl,a
 327  00ff 89            	pushw	x
 328  0100 ae6506        	ldw	x,#25862
 329  0103 cd0000        	call	_OLED_print_chr
 331  0106 85            	popw	x
 332                     ; 83 		OLED_print_chr(0, 7, rx_buffer[3]);
 334  0107 c6000a        	ld	a,_rx_buffer+3
 335  010a 5f            	clrw	x
 336  010b 97            	ld	xl,a
 337  010c 89            	pushw	x
 338  010d ae0007        	ldw	x,#7
 339  0110 cd0000        	call	_OLED_print_chr
 341  0113 85            	popw	x
 342                     ; 84 		OLED_print_chr(25, 7, rx_buffer[4]);
 344  0114 c6000b        	ld	a,_rx_buffer+4
 345  0117 5f            	clrw	x
 346  0118 97            	ld	xl,a
 347  0119 89            	pushw	x
 348  011a ae1907        	ldw	x,#6407
 349  011d cd0000        	call	_OLED_print_chr
 351  0120 85            	popw	x
 352                     ; 85 		OLED_print_chr(49, 7, rx_buffer[5]);
 354  0121 c6000c        	ld	a,_rx_buffer+5
 355  0124 5f            	clrw	x
 356  0125 97            	ld	xl,a
 357  0126 89            	pushw	x
 358  0127 ae3107        	ldw	x,#12551
 359  012a cd0000        	call	_OLED_print_chr
 361  012d 85            	popw	x
 362                     ; 86 		OLED_print_chr(73, 7, rx_buffer[6]);
 364  012e c6000d        	ld	a,_rx_buffer+6
 365  0131 5f            	clrw	x
 366  0132 97            	ld	xl,a
 367  0133 89            	pushw	x
 368  0134 ae4907        	ldw	x,#18695
 369  0137 cd0000        	call	_OLED_print_chr
 371  013a 85            	popw	x
 372                     ; 87 		OLED_print_chr(97, 7, rx_buffer[7]);
 374  013b c6000e        	ld	a,_rx_buffer+7
 375  013e 5f            	clrw	x
 376  013f 97            	ld	xl,a
 377  0140 89            	pushw	x
 378  0141 ae6107        	ldw	x,#24839
 379  0144 cd0000        	call	_OLED_print_chr
 381  0147 85            	popw	x
 382                     ; 89 		toggle ^= 1;
 384  0148 7b01          	ld	a,(OFST+0,sp)
 385  014a a801          	xor	a,	#1
 386  014c 6b01          	ld	(OFST+0,sp),a
 389  014e ac510051      	jpf	L16
 417                     ; 94 void setup(void)
 417                     ; 95 {
 418                     	switch	.text
 419  0152               _setup:
 423                     ; 96 	setup_clock();
 425  0152 ad0c          	call	_setup_clock
 427                     ; 97 	setup_GPIO();
 429  0154 ad7d          	call	_setup_GPIO
 431                     ; 98 	setup_CAN();
 433  0156 cd01f6        	call	_setup_CAN
 435                     ; 99 	DHT11_init();
 437  0159 cd0000        	call	_DHT11_init
 439                     ; 100 	OLED_init();
 441  015c cd0000        	call	_OLED_init
 443                     ; 101 }
 446  015f 81            	ret
 479                     ; 104 void setup_clock(void)
 479                     ; 105 {
 480                     	switch	.text
 481  0160               _setup_clock:
 485                     ; 106 	CLK_DeInit();
 487  0160 cd0000        	call	_CLK_DeInit
 489                     ; 108 	CLK_HSECmd(DISABLE);
 491  0163 4f            	clr	a
 492  0164 cd0000        	call	_CLK_HSECmd
 494                     ; 109 	CLK_LSICmd(DISABLE);
 496  0167 4f            	clr	a
 497  0168 cd0000        	call	_CLK_LSICmd
 499                     ; 110 	CLK_HSICmd(ENABLE);
 501  016b a601          	ld	a,#1
 502  016d cd0000        	call	_CLK_HSICmd
 505  0170               L321:
 506                     ; 111 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 508  0170 ae0102        	ldw	x,#258
 509  0173 cd0000        	call	_CLK_GetFlagStatus
 511  0176 4d            	tnz	a
 512  0177 27f7          	jreq	L321
 513                     ; 113 	CLK_ClockSwitchCmd(ENABLE);
 515  0179 a601          	ld	a,#1
 516  017b cd0000        	call	_CLK_ClockSwitchCmd
 518                     ; 114 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 520  017e 4f            	clr	a
 521  017f cd0000        	call	_CLK_HSIPrescalerConfig
 523                     ; 115 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 525  0182 a680          	ld	a,#128
 526  0184 cd0000        	call	_CLK_SYSCLKConfig
 528                     ; 117 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, 
 528                     ; 118 											 CLK_SOURCE_HSI, 
 528                     ; 119 											 DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 530  0187 4b01          	push	#1
 531  0189 4b00          	push	#0
 532  018b ae01e1        	ldw	x,#481
 533  018e cd0000        	call	_CLK_ClockSwitchConfig
 535  0191 85            	popw	x
 536                     ; 121 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_CAN, ENABLE);
 538  0192 ae1701        	ldw	x,#5889
 539  0195 cd0000        	call	_CLK_PeripheralClockConfig
 541                     ; 122 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 543  0198 5f            	clrw	x
 544  0199 cd0000        	call	_CLK_PeripheralClockConfig
 546                     ; 123 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 548  019c ae0100        	ldw	x,#256
 549  019f cd0000        	call	_CLK_PeripheralClockConfig
 551                     ; 124 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 553  01a2 ae1300        	ldw	x,#4864
 554  01a5 cd0000        	call	_CLK_PeripheralClockConfig
 556                     ; 125 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 558  01a8 ae1200        	ldw	x,#4608
 559  01ab cd0000        	call	_CLK_PeripheralClockConfig
 561                     ; 126 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 563  01ae ae0200        	ldw	x,#512
 564  01b1 cd0000        	call	_CLK_PeripheralClockConfig
 566                     ; 127 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART3, DISABLE);
 568  01b4 ae0300        	ldw	x,#768
 569  01b7 cd0000        	call	_CLK_PeripheralClockConfig
 571                     ; 128 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 573  01ba ae0700        	ldw	x,#1792
 574  01bd cd0000        	call	_CLK_PeripheralClockConfig
 576                     ; 129 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 578  01c0 ae0500        	ldw	x,#1280
 579  01c3 cd0000        	call	_CLK_PeripheralClockConfig
 581                     ; 130 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, DISABLE);
 583  01c6 ae0600        	ldw	x,#1536
 584  01c9 cd0000        	call	_CLK_PeripheralClockConfig
 586                     ; 131 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 588  01cc ae0400        	ldw	x,#1024
 589  01cf cd0000        	call	_CLK_PeripheralClockConfig
 591                     ; 132 }
 594  01d2 81            	ret
 619                     ; 135 void setup_GPIO(void)
 619                     ; 136 {
 620                     	switch	.text
 621  01d3               _setup_GPIO:
 625                     ; 137 	GPIO_DeInit(GPIOA);
 627  01d3 ae5000        	ldw	x,#20480
 628  01d6 cd0000        	call	_GPIO_DeInit
 630                     ; 138 	GPIO_Init(GPIOA, ((GPIO_Pin_TypeDef)(GPIO_PIN_3 | GPIO_PIN_6)), GPIO_MODE_OUT_PP_LOW_FAST);
 632  01d9 4be0          	push	#224
 633  01db 4b48          	push	#72
 634  01dd ae5000        	ldw	x,#20480
 635  01e0 cd0000        	call	_GPIO_Init
 637  01e3 85            	popw	x
 638                     ; 140 	GPIO_DeInit(GPIOE);
 640  01e4 ae5014        	ldw	x,#20500
 641  01e7 cd0000        	call	_GPIO_DeInit
 643                     ; 141 	GPIO_Init(GPIOE, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST);
 645  01ea 4be0          	push	#224
 646  01ec 4b01          	push	#1
 647  01ee ae5014        	ldw	x,#20500
 648  01f1 cd0000        	call	_GPIO_Init
 650  01f4 85            	popw	x
 651                     ; 142 }
 654  01f5 81            	ret
 681                     ; 145 void setup_CAN(void)
 681                     ; 146 {
 682                     	switch	.text
 683  01f6               _setup_CAN:
 687                     ; 147 	CAN_DeInit();
 689  01f6 cd0000        	call	_CAN_DeInit
 691                     ; 149 	 CAN_Init(CAN_MasterCtrl_AllDisabled,
 691                     ; 150 					  CAN_Mode_Normal,
 691                     ; 151                       CAN_SynJumpWidth_1TimeQuantum,
 691                     ; 152                       CAN_BitSeg1_14TimeQuantum,
 691                     ; 153                       CAN_BitSeg2_6TimeQuantum,
 691                     ; 154                       1);
 693  01f9 4b01          	push	#1
 694  01fb 4b50          	push	#80
 695  01fd 4b0d          	push	#13
 696  01ff 4b00          	push	#0
 697  0201 5f            	clrw	x
 698  0202 cd0000        	call	_CAN_Init
 700  0205 5b04          	addw	sp,#4
 701                     ; 156 	CAN_FilterInit(CAN_FilterNumber_0,
 701                     ; 157 							 ENABLE,
 701                     ; 158 							 CAN_FilterMode_IdList,
 701                     ; 159 							 CAN_FilterScale_32Bit,
 701                     ; 160 					     	 0x00,  
 701                     ; 161 							 0x08,
 701                     ; 162 							 0x09,
 701                     ; 163 							 0x2C,
 701                     ; 164 							 0x00,
 701                     ; 165 							 0x08,
 701                     ; 166 							 0x09,
 701                     ; 167 							 0x2C);			//Check messages from ID: 0x1234  // Check Filter Register Table
 703  0207 4b2c          	push	#44
 704  0209 4b09          	push	#9
 705  020b 4b08          	push	#8
 706  020d 4b00          	push	#0
 707  020f 4b2c          	push	#44
 708  0211 4b09          	push	#9
 709  0213 4b08          	push	#8
 710  0215 4b00          	push	#0
 711  0217 4b06          	push	#6
 712  0219 4b01          	push	#1
 713  021b ae0001        	ldw	x,#1
 714  021e cd0000        	call	_CAN_FilterInit
 716  0221 5b0a          	addw	sp,#10
 717                     ; 169 	CAN_ITConfig(CAN_IT_FMP,ENABLE);
 719  0223 4b01          	push	#1
 720  0225 ae0002        	ldw	x,#2
 721  0228 cd0000        	call	_CAN_ITConfig
 723  022b 84            	pop	a
 724                     ; 170 }
 727  022c 81            	ret
 756                     ; 173 void send_data_to_CAN_bus(void)
 756                     ; 174 {
 757                     	switch	.text
 758  022d               _send_data_to_CAN_bus:
 762                     ; 175 	GPIO_WriteLow(GPIOA, GPIO_PIN_3);
 764  022d 4b08          	push	#8
 765  022f ae5000        	ldw	x,#20480
 766  0232 cd0000        	call	_GPIO_WriteLow
 768  0235 84            	pop	a
 769                     ; 176     CAN_Transmit(0x1234,  CAN_Id_Extended, CAN_RTR_Data, 3, tx_buffer);
 771  0236 ae0004        	ldw	x,#_tx_buffer
 772  0239 89            	pushw	x
 773  023a 4b03          	push	#3
 774  023c 4b00          	push	#0
 775  023e 4b40          	push	#64
 776  0240 ae1234        	ldw	x,#4660
 777  0243 89            	pushw	x
 778  0244 ae0000        	ldw	x,#0
 779  0247 89            	pushw	x
 780  0248 cd0000        	call	_CAN_Transmit
 782  024b 5b09          	addw	sp,#9
 783                     ; 177 	GPIO_WriteHigh(GPIOA, GPIO_PIN_3);
 785  024d 4b08          	push	#8
 786  024f ae5000        	ldw	x,#20480
 787  0252 cd0000        	call	_GPIO_WriteHigh
 789  0255 84            	pop	a
 790                     ; 178     delay_ms(600);
 792  0256 ae0258        	ldw	x,#600
 793  0259 cd0000        	call	_delay_ms
 795                     ; 180 	GPIO_WriteLow(GPIOA, GPIO_PIN_3);
 797  025c 4b08          	push	#8
 798  025e ae5000        	ldw	x,#20480
 799  0261 cd0000        	call	_GPIO_WriteLow
 801  0264 84            	pop	a
 802                     ; 181     CAN_Transmit(0x1234, CAN_Id_Extended, CAN_RTR_Remote, 0, tx_buffer);
 804  0265 ae0004        	ldw	x,#_tx_buffer
 805  0268 89            	pushw	x
 806  0269 4b00          	push	#0
 807  026b 4b20          	push	#32
 808  026d 4b40          	push	#64
 809  026f ae1234        	ldw	x,#4660
 810  0272 89            	pushw	x
 811  0273 ae0000        	ldw	x,#0
 812  0276 89            	pushw	x
 813  0277 cd0000        	call	_CAN_Transmit
 815  027a 5b09          	addw	sp,#9
 816                     ; 182 	GPIO_WriteHigh(GPIOA, GPIO_PIN_3);
 818  027c 4b08          	push	#8
 819  027e ae5000        	ldw	x,#20480
 820  0281 cd0000        	call	_GPIO_WriteHigh
 822  0284 84            	pop	a
 823                     ; 183     delay_ms(1600);
 825  0285 ae0640        	ldw	x,#1600
 826  0288 cd0000        	call	_delay_ms
 828                     ; 184 }
 831  028b 81            	ret
 942                     ; 187 void receive_data_from_CAN_bus(void)
 942                     ; 188 {
 943                     	switch	.text
 944  028c               _receive_data_from_CAN_bus:
 946  028c 5204          	subw	sp,#4
 947       00000004      OFST:	set	4
 950                     ; 192 	unsigned char i = 0x00;
 952                     ; 193 	unsigned char DLC = 0x00;
 954                     ; 195 	CAN_Receive();
 956  028e cd0000        	call	_CAN_Receive
 958                     ; 197     ID = CAN_GetReceivedId();
 960  0291 cd0000        	call	_CAN_GetReceivedId
 962  0294 ae0000        	ldw	x,#_ID
 963  0297 cd0000        	call	c_rtol
 965                     ; 198     IDE = CAN_GetReceivedIDE();
 967  029a cd0000        	call	_CAN_GetReceivedIDE
 969  029d 6b01          	ld	(OFST-3,sp),a
 971                     ; 199     RTR = CAN_GetReceivedRTR();
 973  029f cd0000        	call	_CAN_GetReceivedRTR
 975  02a2 6b02          	ld	(OFST-2,sp),a
 977                     ; 200 	DLC = CAN_GetReceivedDLC();
 979  02a4 cd0000        	call	_CAN_GetReceivedDLC
 981  02a7 6b03          	ld	(OFST-1,sp),a
 983                     ; 202     for(i = 0x00; i < DLC; i++)
 985  02a9 0f04          	clr	(OFST+0,sp)
 988  02ab 2010          	jra	L132
 989  02ad               L522:
 990                     ; 204         rx_buffer[i] = CAN_GetReceivedData(i);
 992  02ad 7b04          	ld	a,(OFST+0,sp)
 993  02af 5f            	clrw	x
 994  02b0 97            	ld	xl,a
 995  02b1 89            	pushw	x
 996  02b2 7b06          	ld	a,(OFST+2,sp)
 997  02b4 cd0000        	call	_CAN_GetReceivedData
 999  02b7 85            	popw	x
1000  02b8 d70007        	ld	(_rx_buffer,x),a
1001                     ; 202     for(i = 0x00; i < DLC; i++)
1003  02bb 0c04          	inc	(OFST+0,sp)
1005  02bd               L132:
1008  02bd 7b04          	ld	a,(OFST+0,sp)
1009  02bf 1103          	cp	a,(OFST-1,sp)
1010  02c1 25ea          	jrult	L522
1011                     ; 207     if((IDE == CAN_Id_Extended) && (RTR ==CAN_RTR_Data))
1013  02c3 7b01          	ld	a,(OFST-3,sp)
1014  02c5 a140          	cp	a,#64
1015  02c7 261c          	jrne	L532
1017  02c9 0d02          	tnz	(OFST-2,sp)
1018  02cb 2618          	jrne	L532
1019                     ; 209 		GPIO_WriteLow(GPIOA, GPIO_PIN_6);
1021  02cd 4b40          	push	#64
1022  02cf ae5000        	ldw	x,#20480
1023  02d2 cd0000        	call	_GPIO_WriteLow
1025  02d5 84            	pop	a
1026                     ; 210 		GPIO_WriteHigh(GPIOA, GPIO_PIN_6);
1028  02d6 4b40          	push	#64
1029  02d8 ae5000        	ldw	x,#20480
1030  02db cd0000        	call	_GPIO_WriteHigh
1032  02de 84            	pop	a
1033                     ; 211 		delay_ms(600);
1035  02df ae0258        	ldw	x,#600
1036  02e2 cd0000        	call	_delay_ms
1038  02e5               L532:
1039                     ; 214     if((IDE == CAN_Id_Extended) && (RTR == CAN_RTR_Remote))
1041  02e5 7b01          	ld	a,(OFST-3,sp)
1042  02e7 a140          	cp	a,#64
1043  02e9 261e          	jrne	L732
1045  02eb 7b02          	ld	a,(OFST-2,sp)
1046  02ed a120          	cp	a,#32
1047  02ef 2618          	jrne	L732
1048                     ; 216 		GPIO_WriteLow(GPIOA, GPIO_PIN_6);
1050  02f1 4b40          	push	#64
1051  02f3 ae5000        	ldw	x,#20480
1052  02f6 cd0000        	call	_GPIO_WriteLow
1054  02f9 84            	pop	a
1055                     ; 217 		GPIO_WriteHigh(GPIOA, GPIO_PIN_6);
1057  02fa 4b40          	push	#64
1058  02fc ae5000        	ldw	x,#20480
1059  02ff cd0000        	call	_GPIO_WriteHigh
1061  0302 84            	pop	a
1062                     ; 218 		delay_ms(1600);
1064  0303 ae0640        	ldw	x,#1600
1065  0306 cd0000        	call	_delay_ms
1067  0309               L732:
1068                     ; 220 }
1071  0309 5b04          	addw	sp,#4
1072  030b 81            	ret
1134                     	xdef	_main
1135                     	xdef	_receive_data_from_CAN_bus
1136                     	xdef	_send_data_to_CAN_bus
1137                     	xdef	_setup_CAN
1138                     	xdef	_setup_GPIO
1139                     	xdef	_setup_clock
1140                     	xdef	_setup
1141                     	xdef	_rx_buffer
1142                     	xdef	_tx_buffer
1143                     	xdef	_ID
1144                     	xref	_get_data
1145                     	xref	_DHT11_init
1146                     	switch	.bss
1147  0000               _values:
1148  0000 0000000000    	ds.b	5
1149                     	xdef	_values
1150                     	xref	_OLED_print_int
1151                     	xref	_OLED_print_chr
1152                     	xref	_OLED_print_string
1153                     	xref	_OLED_init
1154  0005               _buffer:
1155  0005 000000000000  	ds.b	1024
1156                     	xdef	_buffer
1157                     	xref	_delay_ms
1158                     	xref	_GPIO_WriteReverse
1159                     	xref	_GPIO_WriteLow
1160                     	xref	_GPIO_WriteHigh
1161                     	xref	_GPIO_Init
1162                     	xref	_GPIO_DeInit
1163                     	xref	_CLK_GetFlagStatus
1164                     	xref	_CLK_SYSCLKConfig
1165                     	xref	_CLK_HSIPrescalerConfig
1166                     	xref	_CLK_ClockSwitchConfig
1167                     	xref	_CLK_PeripheralClockConfig
1168                     	xref	_CLK_ClockSwitchCmd
1169                     	xref	_CLK_LSICmd
1170                     	xref	_CLK_HSICmd
1171                     	xref	_CLK_HSECmd
1172                     	xref	_CLK_DeInit
1173                     	xref	_CAN_GetReceivedData
1174                     	xref	_CAN_GetReceivedDLC
1175                     	xref	_CAN_GetReceivedRTR
1176                     	xref	_CAN_GetReceivedIDE
1177                     	xref	_CAN_GetReceivedId
1178                     	xref	_CAN_Receive
1179                     	xref	_CAN_Transmit
1180                     	xref	_CAN_ITConfig
1181                     	xref	_CAN_FilterInit
1182                     	xref	_CAN_Init
1183                     	xref	_CAN_DeInit
1184                     .const:	section	.text
1185  0000               L75:
1186  0000 525820446174  	dc.b	"RX Data",0
1187  0008               L55:
1188  0008 5258204e6f64  	dc.b	"RX Node ID",0
1189  0013               L35:
1190  0013 444854313120  	dc.b	"DHT11  RH/% :",0
1191  0021               L15:
1192  0021 444854313120  	dc.b	"DHT11     T/'C :",0
1193  0032               L74:
1194  0032 445331384232  	dc.b	"DS18B20 T/ 'C: ",0
1195  0042               L54:
1196  0042 4e6f64652032  	dc.b	"Node 2 ID       46"
1197  0054 363000        	dc.b	"60",0
1198  0057               L34:
1199  0057 43414e204e6f  	dc.b	"CAN Node 2",0
1219                     	xref	c_rtol
1220                     	end
