   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
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
 120                     ; 11 float DS18B20_get_temperature(void)
 120                     ; 12 {                                               
 121                     	switch	.text
 122  000a               _DS18B20_get_temperature:
 124  000a 5206          	subw	sp,#6
 125       00000006      OFST:	set	6
 128                     ; 13 	unsigned char msb = 0x00;
 130                     ; 14 	unsigned char lsb = 0x00;
 132                     ; 15 	register float temp = 0.0;  
 134                     ; 17 	onewire_reset();     
 136  000c cd0000        	call	_onewire_reset
 138                     ; 18 	onewire_write(skip_ROM);        
 140  000f a6cc          	ld	a,#204
 141  0011 cd0000        	call	_onewire_write
 143                     ; 19 	onewire_write(convert_T); 
 145  0014 a644          	ld	a,#68
 146  0016 cd0000        	call	_onewire_write
 148                     ; 21 	switch(resolution)   
 150  0019               L12:
 151                     ; 25 			delay_ms(750);
 153  0019 ae02ee        	ldw	x,#750
 154  001c cd0000        	call	_delay_ms
 156                     ; 26 			break;
 157                     ; 45 	onewire_reset(); 
 159  001f cd0000        	call	_onewire_reset
 161                     ; 47 	onewire_write(skip_ROM);                 
 163  0022 a6cc          	ld	a,#204
 164  0024 cd0000        	call	_onewire_write
 166                     ; 48 	onewire_write(read_scratchpad);
 168  0027 a6be          	ld	a,#190
 169  0029 cd0000        	call	_onewire_write
 171                     ; 50 	lsb = onewire_read();
 173  002c cd0000        	call	_onewire_read
 175  002f 6b02          	ld	(OFST-4,sp),a
 177                     ; 51 	msb = onewire_read();
 179  0031 cd0000        	call	_onewire_read
 181  0034 6b01          	ld	(OFST-5,sp),a
 183                     ; 53 	temp = msb;                           
 185  0036 7b01          	ld	a,(OFST-5,sp)
 186  0038 5f            	clrw	x
 187  0039 97            	ld	xl,a
 188  003a cd0000        	call	c_itof
 190  003d 96            	ldw	x,sp
 191  003e 1c0003        	addw	x,#OFST-3
 192  0041 cd0000        	call	c_rtol
 195                     ; 54 	temp *= 256.0;
 197  0044 ae0004        	ldw	x,#L501
 198  0047 cd0000        	call	c_ltor
 200  004a 96            	ldw	x,sp
 201  004b 1c0003        	addw	x,#OFST-3
 202  004e cd0000        	call	c_fgmul
 205                     ; 55 	temp += lsb;
 207  0051 7b02          	ld	a,(OFST-4,sp)
 208  0053 5f            	clrw	x
 209  0054 97            	ld	xl,a
 210  0055 cd0000        	call	c_itof
 212  0058 96            	ldw	x,sp
 213  0059 1c0003        	addw	x,#OFST-3
 214  005c cd0000        	call	c_fgadd
 217                     ; 58 	switch(resolution)   
 219  005f               L13:
 220                     ; 62 			temp *= 0.0625;                 
 222  005f ae0000        	ldw	x,#L711
 223  0062 cd0000        	call	c_ltor
 225  0065 96            	ldw	x,sp
 226  0066 1c0003        	addw	x,#OFST-3
 227  0069 cd0000        	call	c_fgmul
 230                     ; 63 			break;                            
 231                     ; 82 	delay_ms(40);   	
 233  006c ae0028        	ldw	x,#40
 234  006f cd0000        	call	_delay_ms
 236                     ; 84 	return (temp);       
 238  0072 96            	ldw	x,sp
 239  0073 1c0003        	addw	x,#OFST-3
 240  0076 cd0000        	call	c_ltor
 244  0079 5b06          	addw	sp,#6
 245  007b 81            	ret
 258                     	xdef	_DS18B20_get_temperature
 259                     	xdef	_DS18B20_init
 260                     	xref	_onewire_read
 261                     	xref	_onewire_write
 262                     	xref	_onewire_reset
 263                     	xref	_delay_ms
 264                     .const:	section	.text
 265  0000               L711:
 266  0000 3d800000      	dc.w	15744,0
 267  0004               L501:
 268  0004 43800000      	dc.w	17280,0
 269  0008               L37:
 270  0008 00000000      	dc.w	0,0
 271                     	xref.b	c_x
 291                     	xref	c_fgadd
 292                     	xref	c_fgmul
 293                     	xref	c_ltor
 294                     	xref	c_rtol
 295                     	xref	c_itof
 296                     	end
