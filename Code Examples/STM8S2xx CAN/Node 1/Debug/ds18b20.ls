   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  44                     ; 4 void DS18B20_init(void)                             
  44                     ; 5 {                                       
  46                     	switch	.text
  47  0000               _DS18B20_init:
  51                     ; 6 	onewire_reset();
  53  0000 cd0000        	call	_onewire_reset
  55                     ; 7 	delay_ms(100);
  57  0003 ae0064        	ldw	x,#100
  58  0006 cd0000        	call	_delay_ms
  60                     ; 8 }              
  63  0009 81            	ret
 114                     ; 11 float DS18B20_get_temperature(void)
 114                     ; 12 {                                               
 115                     	switch	.text
 116  000a               _DS18B20_get_temperature:
 118  000a 5206          	subw	sp,#6
 119       00000006      OFST:	set	6
 122                     ; 13 	unsigned char msb = 0x00;
 124                     ; 14 	unsigned char lsb = 0x00;
 126                     ; 15 	register float temp = 0.0;  
 128                     ; 17 	onewire_reset();     
 130  000c cd0000        	call	_onewire_reset
 132                     ; 18 	onewire_write(skip_ROM);        
 134  000f a6cc          	ld	a,#204
 135  0011 cd0000        	call	_onewire_write
 137                     ; 19 	onewire_write(convert_T); 
 139  0014 a644          	ld	a,#68
 140  0016 cd0000        	call	_onewire_write
 142                     ; 21 	switch(resolution)   
 144  0019               L12:
 145                     ; 25 			delay_ms(750);
 147  0019 ae02ee        	ldw	x,#750
 148  001c cd0000        	call	_delay_ms
 150                     ; 26 			break;
 151                     ; 45 	onewire_reset(); 
 153  001f cd0000        	call	_onewire_reset
 155                     ; 47 	onewire_write(skip_ROM);                 
 157  0022 a6cc          	ld	a,#204
 158  0024 cd0000        	call	_onewire_write
 160                     ; 48 	onewire_write(read_scratchpad);
 162  0027 a6be          	ld	a,#190
 163  0029 cd0000        	call	_onewire_write
 165                     ; 50 	lsb = onewire_read();
 167  002c cd0000        	call	_onewire_read
 169  002f 6b02          	ld	(OFST-4,sp),a
 171                     ; 51 	msb = onewire_read();
 173  0031 cd0000        	call	_onewire_read
 175  0034 6b01          	ld	(OFST-5,sp),a
 177                     ; 53 	temp = msb;                           
 179  0036 7b01          	ld	a,(OFST-5,sp)
 180  0038 5f            	clrw	x
 181  0039 97            	ld	xl,a
 182  003a cd0000        	call	c_itof
 184  003d 96            	ldw	x,sp
 185  003e 1c0003        	addw	x,#OFST-3
 186  0041 cd0000        	call	c_rtol
 189                     ; 54 	temp *= 256.0;
 191  0044 ae0004        	ldw	x,#L77
 192  0047 cd0000        	call	c_ltor
 194  004a 96            	ldw	x,sp
 195  004b 1c0003        	addw	x,#OFST-3
 196  004e cd0000        	call	c_fgmul
 199                     ; 55 	temp += lsb;
 201  0051 7b02          	ld	a,(OFST-4,sp)
 202  0053 5f            	clrw	x
 203  0054 97            	ld	xl,a
 204  0055 cd0000        	call	c_itof
 206  0058 96            	ldw	x,sp
 207  0059 1c0003        	addw	x,#OFST-3
 208  005c cd0000        	call	c_fgadd
 211                     ; 58 	switch(resolution)   
 213  005f               L13:
 214                     ; 62 			temp *= 0.0625;                 
 216  005f ae0000        	ldw	x,#L111
 217  0062 cd0000        	call	c_ltor
 219  0065 96            	ldw	x,sp
 220  0066 1c0003        	addw	x,#OFST-3
 221  0069 cd0000        	call	c_fgmul
 224                     ; 63 			break;                            
 225                     ; 82 	delay_ms(40);   	
 227  006c ae0028        	ldw	x,#40
 228  006f cd0000        	call	_delay_ms
 230                     ; 84 	return (temp);       
 232  0072 96            	ldw	x,sp
 233  0073 1c0003        	addw	x,#OFST-3
 234  0076 cd0000        	call	c_ltor
 238  0079 5b06          	addw	sp,#6
 239  007b 81            	ret
 252                     	xdef	_DS18B20_get_temperature
 253                     	xdef	_DS18B20_init
 254                     	xref	_onewire_read
 255                     	xref	_onewire_write
 256                     	xref	_onewire_reset
 257                     	xref	_delay_ms
 258                     .const:	section	.text
 259  0000               L111:
 260  0000 3d800000      	dc.w	15744,0
 261  0004               L77:
 262  0004 43800000      	dc.w	17280,0
 263  0008               L56:
 264  0008 00000000      	dc.w	0,0
 265                     	xref.b	c_x
 285                     	xref	c_fgadd
 286                     	xref	c_fgmul
 287                     	xref	c_ltor
 288                     	xref	c_rtol
 289                     	xref	c_itof
 290                     	end
