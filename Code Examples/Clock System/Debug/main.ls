   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  45                     ; 13 void main(void)
  45                     ; 14 {
  47                     	switch	.text
  48  0000               _main:
  52                     ; 15 	setup();
  54  0000 ad0b          	call	_setup
  56                     ; 16 	GPIO_WriteLow(LED_port, LED_pin);
  58  0002 4b01          	push	#1
  59  0004 ae500f        	ldw	x,#20495
  60  0007 cd0000        	call	_GPIO_WriteLow
  62  000a 84            	pop	a
  63  000b               L12:
  65  000b 20fe          	jra	L12
  90                     ; 24 void setup(void)
  90                     ; 25 {
  91                     	switch	.text
  92  000d               _setup:
  96                     ; 26 		clock_setup();
  98  000d ad03          	call	_clock_setup
 100                     ; 27 		GPIO_setup();
 102  000f ad76          	call	_GPIO_setup
 104                     ; 28 }
 107  0011 81            	ret
 142                     ; 31 void clock_setup(void)
 142                     ; 32 {
 143                     	switch	.text
 144  0012               _clock_setup:
 148                     ; 33 	CLK_DeInit();
 150  0012 cd0000        	call	_CLK_DeInit
 152                     ; 35 	CLK_HSECmd(DISABLE);
 154  0015 4f            	clr	a
 155  0016 cd0000        	call	_CLK_HSECmd
 157                     ; 36 	CLK_LSICmd(DISABLE);
 159  0019 4f            	clr	a
 160  001a cd0000        	call	_CLK_LSICmd
 162                     ; 37 	CLK_HSICmd(ENABLE);
 164  001d a601          	ld	a,#1
 165  001f cd0000        	call	_CLK_HSICmd
 168  0022               L74:
 169                     ; 38 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 171  0022 ae0102        	ldw	x,#258
 172  0025 cd0000        	call	_CLK_GetFlagStatus
 174  0028 4d            	tnz	a
 175  0029 27f7          	jreq	L74
 176                     ; 40 	CLK_ClockSwitchCmd(ENABLE);
 178  002b a601          	ld	a,#1
 179  002d cd0000        	call	_CLK_ClockSwitchCmd
 181                     ; 41 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
 183  0030 a618          	ld	a,#24
 184  0032 cd0000        	call	_CLK_HSIPrescalerConfig
 186                     ; 42 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV4);
 188  0035 a682          	ld	a,#130
 189  0037 cd0000        	call	_CLK_SYSCLKConfig
 191                     ; 44 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 191                     ; 45 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 193  003a 4b01          	push	#1
 194  003c 4b00          	push	#0
 195  003e ae01e1        	ldw	x,#481
 196  0041 cd0000        	call	_CLK_ClockSwitchConfig
 198  0044 85            	popw	x
 199                     ; 47 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 201  0045 5f            	clrw	x
 202  0046 cd0000        	call	_CLK_PeripheralClockConfig
 204                     ; 48 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 206  0049 ae0100        	ldw	x,#256
 207  004c cd0000        	call	_CLK_PeripheralClockConfig
 209                     ; 49 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 211  004f ae0300        	ldw	x,#768
 212  0052 cd0000        	call	_CLK_PeripheralClockConfig
 214                     ; 50 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 216  0055 ae1200        	ldw	x,#4608
 217  0058 cd0000        	call	_CLK_PeripheralClockConfig
 219                     ; 51 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 221  005b ae1300        	ldw	x,#4864
 222  005e cd0000        	call	_CLK_PeripheralClockConfig
 224                     ; 52 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 226  0061 ae0700        	ldw	x,#1792
 227  0064 cd0000        	call	_CLK_PeripheralClockConfig
 229                     ; 53 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 231  0067 ae0500        	ldw	x,#1280
 232  006a cd0000        	call	_CLK_PeripheralClockConfig
 234                     ; 54 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 236  006d ae0400        	ldw	x,#1024
 237  0070 cd0000        	call	_CLK_PeripheralClockConfig
 239                     ; 56 	CLK_CCOConfig(CLK_OUTPUT_CPU);
 241  0073 a608          	ld	a,#8
 242  0075 cd0000        	call	_CLK_CCOConfig
 244                     ; 57 	CLK_CCOCmd(ENABLE);
 246  0078 a601          	ld	a,#1
 247  007a cd0000        	call	_CLK_CCOCmd
 250  007d               L55:
 251                     ; 58 	while(CLK_GetFlagStatus(CLK_FLAG_CCORDY) == FALSE);
 253  007d ae0502        	ldw	x,#1282
 254  0080 cd0000        	call	_CLK_GetFlagStatus
 256  0083 4d            	tnz	a
 257  0084 27f7          	jreq	L55
 258                     ; 59 }
 261  0086 81            	ret
 286                     ; 62 void GPIO_setup(void)
 286                     ; 63 {		
 287                     	switch	.text
 288  0087               _GPIO_setup:
 292                     ; 64 	GPIO_DeInit(LED_port);
 294  0087 ae500f        	ldw	x,#20495
 295  008a cd0000        	call	_GPIO_DeInit
 297                     ; 65 	GPIO_Init(LED_port, LED_pin, GPIO_MODE_OUT_OD_HIZ_FAST);
 299  008d 4bb0          	push	#176
 300  008f 4b01          	push	#1
 301  0091 ae500f        	ldw	x,#20495
 302  0094 cd0000        	call	_GPIO_Init
 304  0097 85            	popw	x
 305                     ; 66 }
 308  0098 81            	ret
 321                     	xdef	_main
 322                     	xdef	_GPIO_setup
 323                     	xdef	_clock_setup
 324                     	xdef	_setup
 325                     	xref	_GPIO_WriteLow
 326                     	xref	_GPIO_Init
 327                     	xref	_GPIO_DeInit
 328                     	xref	_CLK_GetFlagStatus
 329                     	xref	_CLK_SYSCLKConfig
 330                     	xref	_CLK_CCOConfig
 331                     	xref	_CLK_HSIPrescalerConfig
 332                     	xref	_CLK_ClockSwitchConfig
 333                     	xref	_CLK_PeripheralClockConfig
 334                     	xref	_CLK_ClockSwitchCmd
 335                     	xref	_CLK_CCOCmd
 336                     	xref	_CLK_LSICmd
 337                     	xref	_CLK_HSICmd
 338                     	xref	_CLK_HSECmd
 339                     	xref	_CLK_DeInit
 358                     	end
