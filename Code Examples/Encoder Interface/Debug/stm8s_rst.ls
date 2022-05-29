   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
 116                     ; 54 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 116                     ; 55 {
 118                     	switch	.text
 119  0000               _RST_GetFlagStatus:
 123                     ; 57   assert_param(IS_RST_FLAG_OK(RST_Flag));
 125                     ; 60   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 127  0000 c450b3        	and	a,20659
 128  0003 2603          	jrne	L6
 129  0005 4f            	clr	a
 130  0006 2002          	jra	L01
 131  0008               L6:
 132  0008 a601          	ld	a,#1
 133  000a               L01:
 136  000a 81            	ret
 171                     ; 69 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 171                     ; 70 {
 172                     	switch	.text
 173  000b               _RST_ClearFlag:
 177                     ; 72   assert_param(IS_RST_FLAG_OK(RST_Flag));
 179                     ; 74   RST->SR = (uint8_t)RST_Flag;
 181  000b c750b3        	ld	20659,a
 182                     ; 75 }
 185  000e 81            	ret
 198                     	xdef	_RST_ClearFlag
 199                     	xdef	_RST_GetFlagStatus
 218                     	end
