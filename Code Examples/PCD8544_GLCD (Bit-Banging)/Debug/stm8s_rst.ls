   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
 116                     ; 54 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 116                     ; 55 {
 117                     	switch	.text
 118  0000               f_RST_GetFlagStatus:
 122                     ; 57   assert_param(IS_RST_FLAG_OK(RST_Flag));
 124                     ; 60   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 126  0000 c450b3        	and	a,20659
 127  0003 2603          	jrne	L6
 128  0005 4f            	clr	a
 129  0006 2002          	jra	L01
 130  0008               L6:
 131  0008 a601          	ld	a,#1
 132  000a               L01:
 135  000a 87            	retf
 169                     ; 69 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 169                     ; 70 {
 170                     	switch	.text
 171  000b               f_RST_ClearFlag:
 175                     ; 72   assert_param(IS_RST_FLAG_OK(RST_Flag));
 177                     ; 74   RST->SR = (uint8_t)RST_Flag;
 179  000b c750b3        	ld	20659,a
 180                     ; 75 }
 183  000e 87            	retf
 195                     	xdef	f_RST_ClearFlag
 196                     	xdef	f_RST_GetFlagStatus
 215                     	end
