   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  79                     ; 7 void main (void)
  79                     ; 8 {
  81                     	switch	.text
  82  0000               _main:
  84  0000 88            	push	a
  85       00000001      OFST:	set	1
  88                     ; 9 		bool i = FALSE;
  90  0001 0f01          	clr	(OFST+0,sp)
  92                     ; 11 		GPIO_setup();
  94  0003 ad41          	call	_GPIO_setup
  96  0005               L34:
  97                     ; 15 			if(GPIO_ReadInputPin(GPIOB, GPIO_PIN_7) == FALSE)
  99  0005 4b80          	push	#128
 100  0007 ae5005        	ldw	x,#20485
 101  000a cd0000        	call	_GPIO_ReadInputPin
 103  000d 5b01          	addw	sp,#1
 104  000f 4d            	tnz	a
 105  0010 2613          	jrne	L74
 107  0012               L35:
 108                     ; 17 				while(GPIO_ReadInputPin(GPIOB, GPIO_PIN_7) == FALSE);
 110  0012 4b80          	push	#128
 111  0014 ae5005        	ldw	x,#20485
 112  0017 cd0000        	call	_GPIO_ReadInputPin
 114  001a 5b01          	addw	sp,#1
 115  001c 4d            	tnz	a
 116  001d 27f3          	jreq	L35
 117                     ; 18 				i ^= 1;
 119  001f 7b01          	ld	a,(OFST+0,sp)
 120  0021 a801          	xor	a,	#1
 121  0023 6b01          	ld	(OFST+0,sp),a
 123  0025               L74:
 124                     ; 21 			switch(i)
 126  0025 7b01          	ld	a,(OFST+0,sp)
 128                     ; 31 						break;
 129  0027 4d            	tnz	a
 130  0028 270b          	jreq	L5
 131  002a 4a            	dec	a
 132  002b 260e          	jrne	L16
 133                     ; 25 						delay_ms(1000);
 135  002d ae03e8        	ldw	x,#1000
 136  0030 cd0000        	call	_delay_ms
 138                     ; 26 						break;
 140  0033 2006          	jra	L16
 141  0035               L5:
 142                     ; 30 						delay_ms(100);
 144  0035 ae0064        	ldw	x,#100
 145  0038 cd0000        	call	_delay_ms
 147                     ; 31 						break;
 149  003b               L16:
 150                     ; 35 			GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
 152  003b 4b01          	push	#1
 153  003d ae500f        	ldw	x,#20495
 154  0040 cd0000        	call	_GPIO_WriteReverse
 156  0043 84            	pop	a
 158  0044 20bf          	jra	L34
 183                     ; 40 void GPIO_setup(void)
 183                     ; 41 {
 184                     	switch	.text
 185  0046               _GPIO_setup:
 189                     ; 43 	GPIO_DeInit(GPIOB);
 191  0046 ae5005        	ldw	x,#20485
 192  0049 cd0000        	call	_GPIO_DeInit
 194                     ; 44 	GPIO_Init(GPIOB, GPIO_PIN_7, GPIO_MODE_IN_FL_NO_IT);
 196  004c 4b00          	push	#0
 197  004e 4b80          	push	#128
 198  0050 ae5005        	ldw	x,#20485
 199  0053 cd0000        	call	_GPIO_Init
 201  0056 85            	popw	x
 202                     ; 46 	GPIO_DeInit(GPIOD);
 204  0057 ae500f        	ldw	x,#20495
 205  005a cd0000        	call	_GPIO_DeInit
 207                     ; 47 	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST);
 209  005d 4be0          	push	#224
 210  005f 4b01          	push	#1
 211  0061 ae500f        	ldw	x,#20495
 212  0064 cd0000        	call	_GPIO_Init
 214  0067 85            	popw	x
 215                     ; 48 }
 218  0068 81            	ret
 231                     	xdef	_main
 232                     	xdef	_GPIO_setup
 233                     	xref	_GPIO_ReadInputPin
 234                     	xref	_GPIO_WriteReverse
 235                     	xref	_GPIO_Init
 236                     	xref	_GPIO_DeInit
 237                     	xref	_delay_ms
 256                     	end
