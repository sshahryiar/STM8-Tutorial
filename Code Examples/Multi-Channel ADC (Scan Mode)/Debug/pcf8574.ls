   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  43                     ; 4 void I2C_GPIO_setup(void)
  43                     ; 5 {   
  45                     	switch	.text
  46  0000               _I2C_GPIO_setup:
  50                     ; 6     GPIO_Init(I2C_PORT, 
  50                     ; 7               ((GPIO_Pin_TypeDef)(SCL_pin | SDA_pin)), 
  50                     ; 8               GPIO_MODE_OUT_PP_HIGH_FAST);
  52  0000 4bf0          	push	#240
  53  0002 4b30          	push	#48
  54  0004 ae5005        	ldw	x,#20485
  55  0007 cd0000        	call	_GPIO_Init
  57  000a 85            	popw	x
  58                     ; 9 }
  61  000b 81            	ret
  88                     .const:	section	.text
  89  0000               L01:
  90  0000 000f4240      	dc.l	1000000
  91                     ; 12 void I2C_setup(void)
  91                     ; 13 {
  92                     	switch	.text
  93  000c               _I2C_setup:
  97                     ; 14     I2C_DeInit();
  99  000c cd0000        	call	_I2C_DeInit
 101                     ; 15     I2C_Init(100000, 
 101                     ; 16                   PCF8574_address, 
 101                     ; 17                   I2C_DUTYCYCLE_2, 
 101                     ; 18                   I2C_ACK_CURR, 
 101                     ; 19                   I2C_ADDMODE_7BIT, 
 101                     ; 20                   (CLK_GetClockFreq() / 1000000));
 103  000f cd0000        	call	_CLK_GetClockFreq
 105  0012 ae0000        	ldw	x,#L01
 106  0015 cd0000        	call	c_ludv
 108  0018 b603          	ld	a,c_lreg+3
 109  001a 88            	push	a
 110  001b 4b00          	push	#0
 111  001d 4b01          	push	#1
 112  001f 4b00          	push	#0
 113  0021 ae004e        	ldw	x,#78
 114  0024 89            	pushw	x
 115  0025 ae86a0        	ldw	x,#34464
 116  0028 89            	pushw	x
 117  0029 ae0001        	ldw	x,#1
 118  002c 89            	pushw	x
 119  002d cd0000        	call	_I2C_Init
 121  0030 5b0a          	addw	sp,#10
 122                     ; 21     I2C_Cmd(ENABLE);
 124  0032 a601          	ld	a,#1
 125  0034 cd0000        	call	_I2C_Cmd
 127                     ; 22 }
 130  0037 81            	ret
 155                     ; 25 void PCF8574_init(void)
 155                     ; 26 {
 156                     	switch	.text
 157  0038               _PCF8574_init:
 161                     ; 27     I2C_GPIO_setup();
 163  0038 adc6          	call	_I2C_GPIO_setup
 165                     ; 28     I2C_setup();
 167  003a add0          	call	_I2C_setup
 169                     ; 29 }
 172  003c 81            	ret
 222                     ; 32 unsigned char PCF8574_read(void)
 222                     ; 33 {
 223                     	switch	.text
 224  003d               _PCF8574_read:
 226  003d 89            	pushw	x
 227       00000002      OFST:	set	2
 230                     ; 34    unsigned char port_byte = 0x00;
 232  003e 0f01          	clr	(OFST-1,sp)
 234                     ; 35    unsigned char num_of_bytes = 0x01; 
 236  0040 a601          	ld	a,#1
 237  0042 6b02          	ld	(OFST+0,sp),a
 240  0044               L76:
 241                     ; 37    while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY));
 243  0044 ae0302        	ldw	x,#770
 244  0047 cd0000        	call	_I2C_GetFlagStatus
 246  004a 4d            	tnz	a
 247  004b 26f7          	jrne	L76
 248                     ; 39    I2C_GenerateSTART(ENABLE);
 250  004d a601          	ld	a,#1
 251  004f cd0000        	call	_I2C_GenerateSTART
 254  0052               L57:
 255                     ; 40    while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
 257  0052 ae0301        	ldw	x,#769
 258  0055 cd0000        	call	_I2C_CheckEvent
 260  0058 4d            	tnz	a
 261  0059 27f7          	jreq	L57
 262                     ; 42    I2C_Send7bitAddress(PCF8574_address, I2C_DIRECTION_RX);
 264  005b ae4e01        	ldw	x,#19969
 265  005e cd0000        	call	_I2C_Send7bitAddress
 268  0061               L301:
 269                     ; 43    while(!I2C_CheckEvent(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));
 271  0061 ae0302        	ldw	x,#770
 272  0064 cd0000        	call	_I2C_CheckEvent
 274  0067 4d            	tnz	a
 275  0068 27f7          	jreq	L301
 277  006a 201d          	jra	L111
 278  006c               L701:
 279                     ; 47         if(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_RECEIVED))
 281  006c ae0340        	ldw	x,#832
 282  006f cd0000        	call	_I2C_CheckEvent
 284  0072 4d            	tnz	a
 285  0073 2714          	jreq	L111
 286                     ; 49             if(num_of_bytes == 0)
 288  0075 0d02          	tnz	(OFST+0,sp)
 289  0077 2609          	jrne	L711
 290                     ; 51                 I2C_AcknowledgeConfig(I2C_ACK_NONE);
 292  0079 4f            	clr	a
 293  007a cd0000        	call	_I2C_AcknowledgeConfig
 295                     ; 52                 I2C_GenerateSTOP(ENABLE);   
 297  007d a601          	ld	a,#1
 298  007f cd0000        	call	_I2C_GenerateSTOP
 300  0082               L711:
 301                     ; 55             port_byte = I2C_ReceiveData();
 303  0082 cd0000        	call	_I2C_ReceiveData
 305  0085 6b01          	ld	(OFST-1,sp),a
 307                     ; 57             num_of_bytes--;
 309  0087 0a02          	dec	(OFST+0,sp)
 311  0089               L111:
 312                     ; 45    while(num_of_bytes)
 314  0089 0d02          	tnz	(OFST+0,sp)
 315  008b 26df          	jrne	L701
 316                     ; 61    return port_byte;
 319  008d 7b01          	ld	a,(OFST-1,sp)
 322  008f 85            	popw	x
 323  0090 81            	ret
 362                     ; 65 void PCF8574_write(unsigned char data_byte)
 362                     ; 66 {
 363                     	switch	.text
 364  0091               _PCF8574_write:
 366  0091 88            	push	a
 367       00000000      OFST:	set	0
 370                     ; 67    I2C_GenerateSTART(ENABLE);
 372  0092 a601          	ld	a,#1
 373  0094 cd0000        	call	_I2C_GenerateSTART
 376  0097               L141:
 377                     ; 68    while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
 379  0097 ae0301        	ldw	x,#769
 380  009a cd0000        	call	_I2C_CheckEvent
 382  009d 4d            	tnz	a
 383  009e 27f7          	jreq	L141
 384                     ; 70    I2C_Send7bitAddress(PCF8574_address, I2C_DIRECTION_TX); 
 386  00a0 ae4e00        	ldw	x,#19968
 387  00a3 cd0000        	call	_I2C_Send7bitAddress
 390  00a6               L741:
 391                     ; 71    while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
 393  00a6 ae0782        	ldw	x,#1922
 394  00a9 cd0000        	call	_I2C_CheckEvent
 396  00ac 4d            	tnz	a
 397  00ad 27f7          	jreq	L741
 398                     ; 73    I2C_SendData(data_byte);
 400  00af 7b01          	ld	a,(OFST+1,sp)
 401  00b1 cd0000        	call	_I2C_SendData
 404  00b4               L551:
 405                     ; 74    while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
 407  00b4 ae0784        	ldw	x,#1924
 408  00b7 cd0000        	call	_I2C_CheckEvent
 410  00ba 4d            	tnz	a
 411  00bb 27f7          	jreq	L551
 412                     ; 76    I2C_GenerateSTOP(ENABLE);   
 414  00bd a601          	ld	a,#1
 415  00bf cd0000        	call	_I2C_GenerateSTOP
 417                     ; 77 }
 420  00c2 84            	pop	a
 421  00c3 81            	ret
 434                     	xdef	_PCF8574_write
 435                     	xdef	_PCF8574_read
 436                     	xdef	_PCF8574_init
 437                     	xdef	_I2C_setup
 438                     	xdef	_I2C_GPIO_setup
 439                     	xref	_I2C_GetFlagStatus
 440                     	xref	_I2C_CheckEvent
 441                     	xref	_I2C_SendData
 442                     	xref	_I2C_Send7bitAddress
 443                     	xref	_I2C_ReceiveData
 444                     	xref	_I2C_AcknowledgeConfig
 445                     	xref	_I2C_GenerateSTOP
 446                     	xref	_I2C_GenerateSTART
 447                     	xref	_I2C_Cmd
 448                     	xref	_I2C_Init
 449                     	xref	_I2C_DeInit
 450                     	xref	_GPIO_Init
 451                     	xref	_CLK_GetClockFreq
 452                     	xref.b	c_lreg
 453                     	xref.b	c_x
 472                     	xref	c_ludv
 473                     	end
