   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  14                     	switch	.data
  15  0000               _ID:
  16  0000 00000000      	dc.l	0
  17  0004               _tx_buffer:
  18  0004 00            	dc.b	0
  19  0005 00            	dc.b	0
  20  0006               _rx_buffer:
  21  0006 00            	dc.b	0
  22  0007 00            	dc.b	0
  23  0008 00            	dc.b	0
  24  0009 00            	dc.b	0
  25  000a 00            	dc.b	0
  26  000b 00            	dc.b	0
  27  000c 00            	dc.b	0
  28  000d 00            	dc.b	0
 102                     ; 22 void main(void)
 102                     ; 23 {
 104                     	switch	.text
 105  0000               _main:
 107  0000 88            	push	a
 108       00000001      OFST:	set	1
 111                     ; 24 	bool toggle = FALSE;
 113  0001 0f01          	clr	(OFST+0,sp)
 115                     ; 26 	setup();
 117  0003 cd013e        	call	_setup
 119                     ; 28 	OLED_print_string(0, 0, "CAN Node 1");
 121  0006 ae0057        	ldw	x,#L34
 122  0009 89            	pushw	x
 123  000a 5f            	clrw	x
 124  000b cd0000        	call	_OLED_print_string
 126  000e 85            	popw	x
 127                     ; 29 	OLED_print_string(0, 1, "Node 1 ID       1174");
 129  000f ae0042        	ldw	x,#L54
 130  0012 89            	pushw	x
 131  0013 ae0001        	ldw	x,#1
 132  0016 cd0000        	call	_OLED_print_string
 134  0019 85            	popw	x
 135                     ; 30 	OLED_print_string(0, 2, "DS18B20 T/ 'C: ");
 137  001a ae0032        	ldw	x,#L74
 138  001d 89            	pushw	x
 139  001e ae0002        	ldw	x,#2
 140  0021 cd0000        	call	_OLED_print_string
 142  0024 85            	popw	x
 143                     ; 31 	OLED_print_string(0, 3, "DHT11  RH/% :");
 145  0025 ae0024        	ldw	x,#L15
 146  0028 89            	pushw	x
 147  0029 ae0003        	ldw	x,#3
 148  002c cd0000        	call	_OLED_print_string
 150  002f 85            	popw	x
 151                     ; 32 	OLED_print_string(0, 4, "DHT11     T/'C :");
 153  0030 ae0013        	ldw	x,#L35
 154  0033 89            	pushw	x
 155  0034 ae0004        	ldw	x,#4
 156  0037 cd0000        	call	_OLED_print_string
 158  003a 85            	popw	x
 159                     ; 33 	OLED_print_string(0, 5, "RX Node ID");
 161  003b ae0008        	ldw	x,#L55
 162  003e 89            	pushw	x
 163  003f ae0005        	ldw	x,#5
 164  0042 cd0000        	call	_OLED_print_string
 166  0045 85            	popw	x
 167                     ; 34 	OLED_print_string(0, 6, "RX Data");
 169  0046 ae0000        	ldw	x,#L75
 170  0049 89            	pushw	x
 171  004a ae0006        	ldw	x,#6
 172  004d cd0000        	call	_OLED_print_string
 174  0050 85            	popw	x
 175  0051               L16:
 176                     ; 38 		tx_buffer[0] = DS18B20_get_temperature();
 178  0051 cd0000        	call	_DS18B20_get_temperature
 180  0054 cd0000        	call	c_ftol
 182  0057 b603          	ld	a,c_lreg+3
 183  0059 c70004        	ld	_tx_buffer,a
 184                     ; 40 		switch(toggle)
 186  005c 7b01          	ld	a,(OFST+0,sp)
 188                     ; 50 				break;
 189  005e 4d            	tnz	a
 190  005f 2709          	jreq	L5
 191  0061 4a            	dec	a
 192  0062 260a          	jrne	L76
 193                     ; 44 				tx_buffer[1] = 0xAA;
 195  0064 35aa0005      	mov	_tx_buffer+1,#170
 196                     ; 45 				break;
 198  0068 2004          	jra	L76
 199  006a               L5:
 200                     ; 49 				tx_buffer[1] = 0x55;
 202  006a 35550005      	mov	_tx_buffer+1,#85
 203                     ; 50 				break;
 205  006e               L76:
 206                     ; 54 		send_data_to_CAN_bus();
 208  006e cd0222        	call	_send_data_to_CAN_bus
 210                     ; 55         receive_data_from_CAN_bus();
 212  0071 cd0252        	call	_receive_data_from_CAN_bus
 214                     ; 57 		if(rx_buffer[2] == 0x99)
 216  0074 c60008        	ld	a,_rx_buffer+2
 217  0077 a199          	cp	a,#153
 218  0079 260b          	jrne	L17
 219                     ; 59 			GPIO_WriteHigh(GPIOE, GPIO_PIN_0);
 221  007b 4b01          	push	#1
 222  007d ae5014        	ldw	x,#20500
 223  0080 cd0000        	call	_GPIO_WriteHigh
 225  0083 84            	pop	a
 227  0084 2009          	jra	L37
 228  0086               L17:
 229                     ; 63 			GPIO_WriteLow(GPIOE, GPIO_PIN_0);
 231  0086 4b01          	push	#1
 232  0088 ae5014        	ldw	x,#20500
 233  008b cd0000        	call	_GPIO_WriteLow
 235  008e 84            	pop	a
 236  008f               L37:
 237                     ; 66 		OLED_print_chr(103, 2, tx_buffer[0] );
 239  008f c60004        	ld	a,_tx_buffer
 240  0092 5f            	clrw	x
 241  0093 97            	ld	xl,a
 242  0094 89            	pushw	x
 243  0095 ae6702        	ldw	x,#26370
 244  0098 cd0000        	call	_OLED_print_chr
 246  009b 85            	popw	x
 247                     ; 67 		OLED_print_chr(103, 3, rx_buffer[0]);
 249  009c c60006        	ld	a,_rx_buffer
 250  009f 5f            	clrw	x
 251  00a0 97            	ld	xl,a
 252  00a1 89            	pushw	x
 253  00a2 ae6703        	ldw	x,#26371
 254  00a5 cd0000        	call	_OLED_print_chr
 256  00a8 85            	popw	x
 257                     ; 68 		OLED_print_chr(103, 4, rx_buffer[1]);
 259  00a9 c60007        	ld	a,_rx_buffer+1
 260  00ac 5f            	clrw	x
 261  00ad 97            	ld	xl,a
 262  00ae 89            	pushw	x
 263  00af ae6704        	ldw	x,#26372
 264  00b2 cd0000        	call	_OLED_print_chr
 266  00b5 85            	popw	x
 267                     ; 69 		OLED_print_int(85, 5, ID);
 269  00b6 ce0002        	ldw	x,_ID+2
 270  00b9 89            	pushw	x
 271  00ba ce0000        	ldw	x,_ID
 272  00bd 89            	pushw	x
 273  00be ae5505        	ldw	x,#21765
 274  00c1 cd0000        	call	_OLED_print_int
 276  00c4 5b04          	addw	sp,#4
 277                     ; 71 		OLED_print_chr(53, 6, rx_buffer[0]);
 279  00c6 c60006        	ld	a,_rx_buffer
 280  00c9 5f            	clrw	x
 281  00ca 97            	ld	xl,a
 282  00cb 89            	pushw	x
 283  00cc ae3506        	ldw	x,#13574
 284  00cf cd0000        	call	_OLED_print_chr
 286  00d2 85            	popw	x
 287                     ; 72 		OLED_print_chr(77, 6, rx_buffer[1]);
 289  00d3 c60007        	ld	a,_rx_buffer+1
 290  00d6 5f            	clrw	x
 291  00d7 97            	ld	xl,a
 292  00d8 89            	pushw	x
 293  00d9 ae4d06        	ldw	x,#19718
 294  00dc cd0000        	call	_OLED_print_chr
 296  00df 85            	popw	x
 297                     ; 73 		OLED_print_chr(101, 6, rx_buffer[2]);
 299  00e0 c60008        	ld	a,_rx_buffer+2
 300  00e3 5f            	clrw	x
 301  00e4 97            	ld	xl,a
 302  00e5 89            	pushw	x
 303  00e6 ae6506        	ldw	x,#25862
 304  00e9 cd0000        	call	_OLED_print_chr
 306  00ec 85            	popw	x
 307                     ; 74 		OLED_print_chr(0, 7, rx_buffer[3]);
 309  00ed c60009        	ld	a,_rx_buffer+3
 310  00f0 5f            	clrw	x
 311  00f1 97            	ld	xl,a
 312  00f2 89            	pushw	x
 313  00f3 ae0007        	ldw	x,#7
 314  00f6 cd0000        	call	_OLED_print_chr
 316  00f9 85            	popw	x
 317                     ; 75 		OLED_print_chr(25, 7, rx_buffer[4]);
 319  00fa c6000a        	ld	a,_rx_buffer+4
 320  00fd 5f            	clrw	x
 321  00fe 97            	ld	xl,a
 322  00ff 89            	pushw	x
 323  0100 ae1907        	ldw	x,#6407
 324  0103 cd0000        	call	_OLED_print_chr
 326  0106 85            	popw	x
 327                     ; 76 		OLED_print_chr(49, 7, rx_buffer[5]);
 329  0107 c6000b        	ld	a,_rx_buffer+5
 330  010a 5f            	clrw	x
 331  010b 97            	ld	xl,a
 332  010c 89            	pushw	x
 333  010d ae3107        	ldw	x,#12551
 334  0110 cd0000        	call	_OLED_print_chr
 336  0113 85            	popw	x
 337                     ; 77 		OLED_print_chr(73, 7, rx_buffer[6]);
 339  0114 c6000c        	ld	a,_rx_buffer+6
 340  0117 5f            	clrw	x
 341  0118 97            	ld	xl,a
 342  0119 89            	pushw	x
 343  011a ae4907        	ldw	x,#18695
 344  011d cd0000        	call	_OLED_print_chr
 346  0120 85            	popw	x
 347                     ; 78 		OLED_print_chr(97, 7, rx_buffer[7]);
 349  0121 c6000d        	ld	a,_rx_buffer+7
 350  0124 5f            	clrw	x
 351  0125 97            	ld	xl,a
 352  0126 89            	pushw	x
 353  0127 ae6107        	ldw	x,#24839
 354  012a cd0000        	call	_OLED_print_chr
 356  012d 85            	popw	x
 357                     ; 80 		toggle ^= 1;
 359  012e 7b01          	ld	a,(OFST+0,sp)
 360  0130 a801          	xor	a,	#1
 361  0132 6b01          	ld	(OFST+0,sp),a
 363                     ; 81 		delay_ms(900);		
 365  0134 ae0384        	ldw	x,#900
 366  0137 cd0000        	call	_delay_ms
 369  013a ac510051      	jpf	L16
 397                     ; 86 void setup(void)
 397                     ; 87 {
 398                     	switch	.text
 399  013e               _setup:
 403                     ; 88 	setup_clock();
 405  013e ad0d          	call	_setup_clock
 407                     ; 89 	setup_GPIO();
 409  0140 cd01c2        	call	_setup_GPIO
 411                     ; 90 	setup_CAN();
 413  0143 cd01eb        	call	_setup_CAN
 415                     ; 91 	OLED_init();
 417  0146 cd0000        	call	_OLED_init
 419                     ; 92 	DS18B20_init();
 421  0149 cd0000        	call	_DS18B20_init
 423                     ; 93 }
 426  014c 81            	ret
 459                     ; 96 void setup_clock(void)
 459                     ; 97 {
 460                     	switch	.text
 461  014d               _setup_clock:
 465                     ; 98 	CLK_DeInit();
 467  014d cd0000        	call	_CLK_DeInit
 469                     ; 100 	CLK_HSECmd(DISABLE);
 471  0150 4f            	clr	a
 472  0151 cd0000        	call	_CLK_HSECmd
 474                     ; 101 	CLK_LSICmd(DISABLE);
 476  0154 4f            	clr	a
 477  0155 cd0000        	call	_CLK_LSICmd
 479                     ; 102 	CLK_HSICmd(ENABLE);
 481  0158 a601          	ld	a,#1
 482  015a cd0000        	call	_CLK_HSICmd
 485  015d               L711:
 486                     ; 103 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 488  015d ae0102        	ldw	x,#258
 489  0160 cd0000        	call	_CLK_GetFlagStatus
 491  0163 4d            	tnz	a
 492  0164 27f7          	jreq	L711
 493                     ; 105 	CLK_ClockSwitchCmd(ENABLE);
 495  0166 a601          	ld	a,#1
 496  0168 cd0000        	call	_CLK_ClockSwitchCmd
 498                     ; 106 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 500  016b 4f            	clr	a
 501  016c cd0000        	call	_CLK_HSIPrescalerConfig
 503                     ; 107 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 505  016f a680          	ld	a,#128
 506  0171 cd0000        	call	_CLK_SYSCLKConfig
 508                     ; 109 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, 
 508                     ; 110 											 CLK_SOURCE_HSI, 
 508                     ; 111 											 DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 510  0174 4b01          	push	#1
 511  0176 4b00          	push	#0
 512  0178 ae01e1        	ldw	x,#481
 513  017b cd0000        	call	_CLK_ClockSwitchConfig
 515  017e 85            	popw	x
 516                     ; 113 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_CAN, ENABLE);
 518  017f ae1701        	ldw	x,#5889
 519  0182 cd0000        	call	_CLK_PeripheralClockConfig
 521                     ; 114 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
 523  0185 ae0001        	ldw	x,#1
 524  0188 cd0000        	call	_CLK_PeripheralClockConfig
 526                     ; 115 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 528  018b ae0100        	ldw	x,#256
 529  018e cd0000        	call	_CLK_PeripheralClockConfig
 531                     ; 116 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 533  0191 ae1300        	ldw	x,#4864
 534  0194 cd0000        	call	_CLK_PeripheralClockConfig
 536                     ; 117 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 538  0197 ae1200        	ldw	x,#4608
 539  019a cd0000        	call	_CLK_PeripheralClockConfig
 541                     ; 118 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 543  019d ae0200        	ldw	x,#512
 544  01a0 cd0000        	call	_CLK_PeripheralClockConfig
 546                     ; 119 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART3, DISABLE);
 548  01a3 ae0300        	ldw	x,#768
 549  01a6 cd0000        	call	_CLK_PeripheralClockConfig
 551                     ; 120 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 553  01a9 ae0700        	ldw	x,#1792
 554  01ac cd0000        	call	_CLK_PeripheralClockConfig
 556                     ; 121 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 558  01af ae0500        	ldw	x,#1280
 559  01b2 cd0000        	call	_CLK_PeripheralClockConfig
 561                     ; 122 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, DISABLE);
 563  01b5 ae0600        	ldw	x,#1536
 564  01b8 cd0000        	call	_CLK_PeripheralClockConfig
 566                     ; 123 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 568  01bb ae0400        	ldw	x,#1024
 569  01be cd0000        	call	_CLK_PeripheralClockConfig
 571                     ; 124 }
 574  01c1 81            	ret
 599                     ; 127 void setup_GPIO(void)
 599                     ; 128 {
 600                     	switch	.text
 601  01c2               _setup_GPIO:
 605                     ; 129 	GPIO_DeInit(GPIOA);
 607  01c2 ae5000        	ldw	x,#20480
 608  01c5 cd0000        	call	_GPIO_DeInit
 610                     ; 130 	GPIO_Init(GPIOA, ((GPIO_Pin_TypeDef)(GPIO_PIN_3 | GPIO_PIN_6)), GPIO_MODE_OUT_PP_LOW_FAST);
 612  01c8 4be0          	push	#224
 613  01ca 4b48          	push	#72
 614  01cc ae5000        	ldw	x,#20480
 615  01cf cd0000        	call	_GPIO_Init
 617  01d2 85            	popw	x
 618                     ; 132 	GPIO_DeInit(DS18B20_port);
 620  01d3 ae500f        	ldw	x,#20495
 621  01d6 cd0000        	call	_GPIO_DeInit
 623                     ; 134 	GPIO_DeInit(GPIOE);
 625  01d9 ae5014        	ldw	x,#20500
 626  01dc cd0000        	call	_GPIO_DeInit
 628                     ; 135 	GPIO_Init(GPIOE, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST);
 630  01df 4be0          	push	#224
 631  01e1 4b01          	push	#1
 632  01e3 ae5014        	ldw	x,#20500
 633  01e6 cd0000        	call	_GPIO_Init
 635  01e9 85            	popw	x
 636                     ; 136 }
 639  01ea 81            	ret
 666                     ; 139 void setup_CAN(void)
 666                     ; 140 {
 667                     	switch	.text
 668  01eb               _setup_CAN:
 672                     ; 141 	CAN_DeInit();
 674  01eb cd0000        	call	_CAN_DeInit
 676                     ; 143 	 CAN_Init(CAN_MasterCtrl_AllDisabled,
 676                     ; 144 					  CAN_Mode_Normal,
 676                     ; 145                       CAN_SynJumpWidth_1TimeQuantum,
 676                     ; 146                       CAN_BitSeg1_14TimeQuantum,
 676                     ; 147                       CAN_BitSeg2_6TimeQuantum,
 676                     ; 148                       1);
 678  01ee 4b01          	push	#1
 679  01f0 4b50          	push	#80
 680  01f2 4b0d          	push	#13
 681  01f4 4b00          	push	#0
 682  01f6 5f            	clrw	x
 683  01f7 cd0000        	call	_CAN_Init
 685  01fa 5b04          	addw	sp,#4
 686                     ; 150 	CAN_FilterInit(CAN_FilterNumber_0,
 686                     ; 151 							 ENABLE,
 686                     ; 152 							 CAN_FilterMode_IdList,
 686                     ; 153 							 CAN_FilterScale_32Bit,
 686                     ; 154 					     	 0x00,  
 686                     ; 155 							 0x08,
 686                     ; 156 							 0x24,
 686                     ; 157 							 0x68,
 686                     ; 158 							 0x00,
 686                     ; 159 							 0x08,
 686                     ; 160 							 0x24,
 686                     ; 161 							 0x68);			//Check messages from ID: 0x1234  // Check Filter Register Table
 688  01fc 4b68          	push	#104
 689  01fe 4b24          	push	#36
 690  0200 4b08          	push	#8
 691  0202 4b00          	push	#0
 692  0204 4b68          	push	#104
 693  0206 4b24          	push	#36
 694  0208 4b08          	push	#8
 695  020a 4b00          	push	#0
 696  020c 4b06          	push	#6
 697  020e 4b01          	push	#1
 698  0210 ae0001        	ldw	x,#1
 699  0213 cd0000        	call	_CAN_FilterInit
 701  0216 5b0a          	addw	sp,#10
 702                     ; 163 	CAN_ITConfig(CAN_IT_FMP,ENABLE);
 704  0218 4b01          	push	#1
 705  021a ae0002        	ldw	x,#2
 706  021d cd0000        	call	_CAN_ITConfig
 708  0220 84            	pop	a
 709                     ; 164 }
 712  0221 81            	ret
 741                     ; 167 void send_data_to_CAN_bus(void)
 741                     ; 168 {
 742                     	switch	.text
 743  0222               _send_data_to_CAN_bus:
 747                     ; 169 	GPIO_WriteLow(GPIOA, GPIO_PIN_3);
 749  0222 4b08          	push	#8
 750  0224 ae5000        	ldw	x,#20480
 751  0227 cd0000        	call	_GPIO_WriteLow
 753  022a 84            	pop	a
 754                     ; 170     CAN_Transmit(0x0496,  CAN_Id_Extended, CAN_RTR_Data, 2, tx_buffer);
 756  022b ae0004        	ldw	x,#_tx_buffer
 757  022e 89            	pushw	x
 758  022f 4b02          	push	#2
 759  0231 4b00          	push	#0
 760  0233 4b40          	push	#64
 761  0235 ae0496        	ldw	x,#1174
 762  0238 89            	pushw	x
 763  0239 ae0000        	ldw	x,#0
 764  023c 89            	pushw	x
 765  023d cd0000        	call	_CAN_Transmit
 767  0240 5b09          	addw	sp,#9
 768                     ; 171 	GPIO_WriteHigh(GPIOA, GPIO_PIN_3);
 770  0242 4b08          	push	#8
 771  0244 ae5000        	ldw	x,#20480
 772  0247 cd0000        	call	_GPIO_WriteHigh
 774  024a 84            	pop	a
 775                     ; 172     delay_ms(600);
 777  024b ae0258        	ldw	x,#600
 778  024e cd0000        	call	_delay_ms
 780                     ; 173 }
 783  0251 81            	ret
 894                     ; 176 void receive_data_from_CAN_bus(void)
 894                     ; 177 {
 895                     	switch	.text
 896  0252               _receive_data_from_CAN_bus:
 898  0252 5204          	subw	sp,#4
 899       00000004      OFST:	set	4
 902                     ; 181 	unsigned char i = 0x00;
 904                     ; 182 	unsigned char DLC = 0x00;
 906                     ; 184 	CAN_Receive();
 908  0254 cd0000        	call	_CAN_Receive
 910                     ; 186     ID = CAN_GetReceivedId();
 912  0257 cd0000        	call	_CAN_GetReceivedId
 914  025a ae0000        	ldw	x,#_ID
 915  025d cd0000        	call	c_rtol
 917                     ; 187     IDE = CAN_GetReceivedIDE();
 919  0260 cd0000        	call	_CAN_GetReceivedIDE
 921  0263 6b01          	ld	(OFST-3,sp),a
 923                     ; 188     RTR = CAN_GetReceivedRTR();
 925  0265 cd0000        	call	_CAN_GetReceivedRTR
 927  0268 6b02          	ld	(OFST-2,sp),a
 929                     ; 189     DLC = CAN_GetReceivedDLC();
 931  026a cd0000        	call	_CAN_GetReceivedDLC
 933  026d 6b03          	ld	(OFST-1,sp),a
 935                     ; 191     for(i = 0x00; i < DLC; i++)
 937  026f 0f04          	clr	(OFST+0,sp)
 940  0271 2010          	jra	L522
 941  0273               L122:
 942                     ; 193         rx_buffer[i] = CAN_GetReceivedData(i);
 944  0273 7b04          	ld	a,(OFST+0,sp)
 945  0275 5f            	clrw	x
 946  0276 97            	ld	xl,a
 947  0277 89            	pushw	x
 948  0278 7b06          	ld	a,(OFST+2,sp)
 949  027a cd0000        	call	_CAN_GetReceivedData
 951  027d 85            	popw	x
 952  027e d70006        	ld	(_rx_buffer,x),a
 953                     ; 191     for(i = 0x00; i < DLC; i++)
 955  0281 0c04          	inc	(OFST+0,sp)
 957  0283               L522:
 960  0283 7b04          	ld	a,(OFST+0,sp)
 961  0285 1103          	cp	a,(OFST-1,sp)
 962  0287 25ea          	jrult	L122
 963                     ; 196     if((IDE == CAN_Id_Extended) && (RTR ==CAN_RTR_Data))
 965  0289 7b01          	ld	a,(OFST-3,sp)
 966  028b a140          	cp	a,#64
 967  028d 261c          	jrne	L132
 969  028f 0d02          	tnz	(OFST-2,sp)
 970  0291 2618          	jrne	L132
 971                     ; 198 		GPIO_WriteLow(GPIOA, GPIO_PIN_6);
 973  0293 4b40          	push	#64
 974  0295 ae5000        	ldw	x,#20480
 975  0298 cd0000        	call	_GPIO_WriteLow
 977  029b 84            	pop	a
 978                     ; 199 		GPIO_WriteHigh(GPIOA, GPIO_PIN_6);
 980  029c 4b40          	push	#64
 981  029e ae5000        	ldw	x,#20480
 982  02a1 cd0000        	call	_GPIO_WriteHigh
 984  02a4 84            	pop	a
 985                     ; 200 		delay_ms(600);
 987  02a5 ae0258        	ldw	x,#600
 988  02a8 cd0000        	call	_delay_ms
 990  02ab               L132:
 991                     ; 203     if((IDE == CAN_Id_Extended) && (RTR == CAN_RTR_Remote))
 993  02ab 7b01          	ld	a,(OFST-3,sp)
 994  02ad a140          	cp	a,#64
 995  02af 261e          	jrne	L332
 997  02b1 7b02          	ld	a,(OFST-2,sp)
 998  02b3 a120          	cp	a,#32
 999  02b5 2618          	jrne	L332
1000                     ; 205 		GPIO_WriteLow(GPIOA, GPIO_PIN_6);
1002  02b7 4b40          	push	#64
1003  02b9 ae5000        	ldw	x,#20480
1004  02bc cd0000        	call	_GPIO_WriteLow
1006  02bf 84            	pop	a
1007                     ; 206 		GPIO_WriteHigh(GPIOA, GPIO_PIN_6);
1009  02c0 4b40          	push	#64
1010  02c2 ae5000        	ldw	x,#20480
1011  02c5 cd0000        	call	_GPIO_WriteHigh
1013  02c8 84            	pop	a
1014                     ; 207 		delay_ms(1600);
1016  02c9 ae0640        	ldw	x,#1600
1017  02cc cd0000        	call	_delay_ms
1019  02cf               L332:
1020                     ; 209 }
1023  02cf 5b04          	addw	sp,#4
1024  02d1 81            	ret
1076                     	xdef	_main
1077                     	xdef	_receive_data_from_CAN_bus
1078                     	xdef	_send_data_to_CAN_bus
1079                     	xdef	_setup_CAN
1080                     	xdef	_setup_GPIO
1081                     	xdef	_setup_clock
1082                     	xdef	_setup
1083                     	xdef	_rx_buffer
1084                     	xdef	_tx_buffer
1085                     	xdef	_ID
1086                     	xref	_DS18B20_get_temperature
1087                     	xref	_DS18B20_init
1088                     	xref	_OLED_print_int
1089                     	xref	_OLED_print_chr
1090                     	xref	_OLED_print_string
1091                     	xref	_OLED_init
1092                     	switch	.bss
1093  0000               _buffer:
1094  0000 000000000000  	ds.b	1024
1095                     	xdef	_buffer
1096                     	xref	_delay_ms
1097                     	xref	_GPIO_WriteLow
1098                     	xref	_GPIO_WriteHigh
1099                     	xref	_GPIO_Init
1100                     	xref	_GPIO_DeInit
1101                     	xref	_CLK_GetFlagStatus
1102                     	xref	_CLK_SYSCLKConfig
1103                     	xref	_CLK_HSIPrescalerConfig
1104                     	xref	_CLK_ClockSwitchConfig
1105                     	xref	_CLK_PeripheralClockConfig
1106                     	xref	_CLK_ClockSwitchCmd
1107                     	xref	_CLK_LSICmd
1108                     	xref	_CLK_HSICmd
1109                     	xref	_CLK_HSECmd
1110                     	xref	_CLK_DeInit
1111                     	xref	_CAN_GetReceivedData
1112                     	xref	_CAN_GetReceivedDLC
1113                     	xref	_CAN_GetReceivedRTR
1114                     	xref	_CAN_GetReceivedIDE
1115                     	xref	_CAN_GetReceivedId
1116                     	xref	_CAN_Receive
1117                     	xref	_CAN_Transmit
1118                     	xref	_CAN_ITConfig
1119                     	xref	_CAN_FilterInit
1120                     	xref	_CAN_Init
1121                     	xref	_CAN_DeInit
1122                     .const:	section	.text
1123  0000               L75:
1124  0000 525820446174  	dc.b	"RX Data",0
1125  0008               L55:
1126  0008 5258204e6f64  	dc.b	"RX Node ID",0
1127  0013               L35:
1128  0013 444854313120  	dc.b	"DHT11     T/'C :",0
1129  0024               L15:
1130  0024 444854313120  	dc.b	"DHT11  RH/% :",0
1131  0032               L74:
1132  0032 445331384232  	dc.b	"DS18B20 T/ 'C: ",0
1133  0042               L54:
1134  0042 4e6f64652031  	dc.b	"Node 1 ID       11"
1135  0054 373400        	dc.b	"74",0
1136  0057               L34:
1137  0057 43414e204e6f  	dc.b	"CAN Node 1",0
1138                     	xref.b	c_lreg
1158                     	xref	c_rtol
1159                     	xref	c_ftol
1160                     	end
