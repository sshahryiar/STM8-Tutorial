   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  46                     ; 4 void MAX72xx_init(void)
  46                     ; 5 {
  48                     	switch	.text
  49  0000               _MAX72xx_init:
  53                     ; 6     GPIO_Init(CS_port, CS_pin, GPIO_MODE_OUT_PP_HIGH_FAST);
  55  0000 4bf0          	push	#240
  56  0002 4b10          	push	#16
  57  0004 ae500a        	ldw	x,#20490
  58  0007 cd0000        	call	_GPIO_Init
  60  000a 85            	popw	x
  61                     ; 8     MAX72xx_write(shutdown_reg, run_cmd);                 
  63  000b ae0c01        	ldw	x,#3073
  64  000e ad20          	call	_MAX72xx_write
  66                     ; 9     MAX72xx_write(decode_mode_reg, 0x00);
  68  0010 ae0900        	ldw	x,#2304
  69  0013 ad1b          	call	_MAX72xx_write
  71                     ; 10     MAX72xx_write(scan_limit_reg, 0x07);
  73  0015 ae0b07        	ldw	x,#2823
  74  0018 ad16          	call	_MAX72xx_write
  76                     ; 11     MAX72xx_write(intensity_reg, 0x04);
  78  001a ae0a04        	ldw	x,#2564
  79  001d ad11          	call	_MAX72xx_write
  81                     ; 12     MAX72xx_write(display_test_reg, test_cmd);
  83  001f ae0f01        	ldw	x,#3841
  84  0022 ad0c          	call	_MAX72xx_write
  86                     ; 13     delay_ms(10);     
  88  0024 ae000a        	ldw	x,#10
  89  0027 cd0000        	call	_delay_ms
  91                     ; 14     MAX72xx_write(display_test_reg, no_test_cmd);  
  93  002a ae0f00        	ldw	x,#3840
  94  002d ad01          	call	_MAX72xx_write
  96                     ; 15 }
  99  002f 81            	ret
 146                     ; 18 void MAX72xx_write(unsigned char address, unsigned char value)
 146                     ; 19 {
 147                     	switch	.text
 148  0030               _MAX72xx_write:
 150  0030 89            	pushw	x
 151       00000000      OFST:	set	0
 154  0031               L54:
 155                     ; 20     while(SPI_GetFlagStatus(SPI_FLAG_BSY));
 157  0031 a680          	ld	a,#128
 158  0033 cd0000        	call	_SPI_GetFlagStatus
 160  0036 4d            	tnz	a
 161  0037 26f8          	jrne	L54
 162                     ; 21 	GPIO_WriteLow(CS_port, CS_pin);
 164  0039 4b10          	push	#16
 165  003b ae500a        	ldw	x,#20490
 166  003e cd0000        	call	_GPIO_WriteLow
 168  0041 84            	pop	a
 169                     ; 23 	SPI_SendData(address);
 171  0042 7b01          	ld	a,(OFST+1,sp)
 172  0044 cd0000        	call	_SPI_SendData
 175  0047               L35:
 176                     ; 24 	while(!SPI_GetFlagStatus(SPI_FLAG_TXE));
 178  0047 a602          	ld	a,#2
 179  0049 cd0000        	call	_SPI_GetFlagStatus
 181  004c 4d            	tnz	a
 182  004d 27f8          	jreq	L35
 183                     ; 26 	SPI_SendData(value);
 185  004f 7b02          	ld	a,(OFST+2,sp)
 186  0051 cd0000        	call	_SPI_SendData
 189  0054               L16:
 190                     ; 27 	while(!SPI_GetFlagStatus(SPI_FLAG_TXE));
 192  0054 a602          	ld	a,#2
 193  0056 cd0000        	call	_SPI_GetFlagStatus
 195  0059 4d            	tnz	a
 196  005a 27f8          	jreq	L16
 197                     ; 29 	GPIO_WriteHigh(CS_port, CS_pin);
 199  005c 4b10          	push	#16
 200  005e ae500a        	ldw	x,#20490
 201  0061 cd0000        	call	_GPIO_WriteHigh
 203  0064 84            	pop	a
 204                     ; 30 }
 207  0065 85            	popw	x
 208  0066 81            	ret
 221                     	xdef	_MAX72xx_write
 222                     	xdef	_MAX72xx_init
 223                     	xref	_SPI_GetFlagStatus
 224                     	xref	_SPI_SendData
 225                     	xref	_GPIO_WriteLow
 226                     	xref	_GPIO_WriteHigh
 227                     	xref	_GPIO_Init
 228                     	xref	_delay_ms
 247                     	end
