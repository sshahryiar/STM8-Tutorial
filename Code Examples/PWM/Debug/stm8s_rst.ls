   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
 117                     ; 54 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 117                     ; 55 {
 119                     	switch	.text
 120  0000               _RST_GetFlagStatus:
 124                     ; 57   assert_param(IS_RST_FLAG_OK(RST_Flag));
 126                     ; 60   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 128  0000 c450b3        	and	a,20659
 129  0003 2603          	jrne	L6
 130  0005 4f            	clr	a
 131  0006 2002          	jra	L01
 132  0008               L6:
 133  0008 a601          	ld	a,#1
 134  000a               L01:
 137  000a 81            	ret
 172                     ; 69 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 172                     ; 70 {
 173                     	switch	.text
 174  000b               _RST_ClearFlag:
 178                     ; 72   assert_param(IS_RST_FLAG_OK(RST_Flag));
 180                     ; 74   RST->SR = (uint8_t)RST_Flag;
 182  000b c750b3        	ld	20659,a
 183                     ; 75 }
 186  000e 81            	ret
 199                     	xdef	_RST_ClearFlag
 200                     	xdef	_RST_GetFlagStatus
 219                     	end
