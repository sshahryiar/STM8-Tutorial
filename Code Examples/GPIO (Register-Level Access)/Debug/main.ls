   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  44                     ; 7 void main (void)
  44                     ; 8 {
  46                     	switch	.text
  47  0000               _main:
  51                     ; 9 	GPIOD->DDR |= 0x01;  
  53  0000 72105011      	bset	20497,#0
  54                     ; 10 	GPIOD->CR1 |= 0x01;  
  56  0004 72105012      	bset	20498,#0
  57  0008               L12:
  58                     ; 15 		bit_tgl(GPIOD->ODR, 0);
  60  0008 9010500f      	bcpl	20495,#0
  61                     ; 16 		delay_ms(90);
  63  000c ae005a        	ldw	x,#90
  64  000f cd0000        	call	_delay_ms
  67  0012 20f4          	jra	L12
  80                     	xdef	_main
  81                     	xref	_delay_ms
 100                     	end
