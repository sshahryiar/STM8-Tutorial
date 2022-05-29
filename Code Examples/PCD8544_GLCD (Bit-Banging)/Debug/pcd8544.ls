   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  14                     .const:	section	.text
  15  0000               L3_font:
  16  0000 00            	dc.b	0
  17  0001 00            	dc.b	0
  18  0002 00            	dc.b	0
  19  0003 00            	dc.b	0
  20  0004 00            	dc.b	0
  21  0005 00            	dc.b	0
  22  0006 00            	dc.b	0
  23  0007 5f            	dc.b	95
  24  0008 00            	dc.b	0
  25  0009 00            	dc.b	0
  26  000a 00            	dc.b	0
  27  000b 07            	dc.b	7
  28  000c 00            	dc.b	0
  29  000d 07            	dc.b	7
  30  000e 00            	dc.b	0
  31  000f 14            	dc.b	20
  32  0010 7f            	dc.b	127
  33  0011 14            	dc.b	20
  34  0012 7f            	dc.b	127
  35  0013 14            	dc.b	20
  36  0014 24            	dc.b	36
  37  0015 2a            	dc.b	42
  38  0016 7f            	dc.b	127
  39  0017 2a            	dc.b	42
  40  0018 12            	dc.b	18
  41  0019 23            	dc.b	35
  42  001a 13            	dc.b	19
  43  001b 08            	dc.b	8
  44  001c 64            	dc.b	100
  45  001d 62            	dc.b	98
  46  001e 36            	dc.b	54
  47  001f 49            	dc.b	73
  48  0020 55            	dc.b	85
  49  0021 22            	dc.b	34
  50  0022 50            	dc.b	80
  51  0023 00            	dc.b	0
  52  0024 05            	dc.b	5
  53  0025 03            	dc.b	3
  54  0026 00            	dc.b	0
  55  0027 00            	dc.b	0
  56  0028 00            	dc.b	0
  57  0029 1c            	dc.b	28
  58  002a 22            	dc.b	34
  59  002b 41            	dc.b	65
  60  002c 00            	dc.b	0
  61  002d 00            	dc.b	0
  62  002e 41            	dc.b	65
  63  002f 22            	dc.b	34
  64  0030 1c            	dc.b	28
  65  0031 00            	dc.b	0
  66  0032 14            	dc.b	20
  67  0033 08            	dc.b	8
  68  0034 3e            	dc.b	62
  69  0035 08            	dc.b	8
  70  0036 14            	dc.b	20
  71  0037 08            	dc.b	8
  72  0038 08            	dc.b	8
  73  0039 3e            	dc.b	62
  74  003a 08            	dc.b	8
  75  003b 08            	dc.b	8
  76  003c 00            	dc.b	0
  77  003d 50            	dc.b	80
  78  003e 30            	dc.b	48
  79  003f 00            	dc.b	0
  80  0040 00            	dc.b	0
  81  0041 08            	dc.b	8
  82  0042 08            	dc.b	8
  83  0043 08            	dc.b	8
  84  0044 08            	dc.b	8
  85  0045 08            	dc.b	8
  86  0046 00            	dc.b	0
  87  0047 60            	dc.b	96
  88  0048 60            	dc.b	96
  89  0049 00            	dc.b	0
  90  004a 00            	dc.b	0
  91  004b 20            	dc.b	32
  92  004c 10            	dc.b	16
  93  004d 08            	dc.b	8
  94  004e 04            	dc.b	4
  95  004f 02            	dc.b	2
  96  0050 3e            	dc.b	62
  97  0051 51            	dc.b	81
  98  0052 49            	dc.b	73
  99  0053 45            	dc.b	69
 100  0054 3e            	dc.b	62
 101  0055 00            	dc.b	0
 102  0056 42            	dc.b	66
 103  0057 7f            	dc.b	127
 104  0058 40            	dc.b	64
 105  0059 00            	dc.b	0
 106  005a 42            	dc.b	66
 107  005b 61            	dc.b	97
 108  005c 51            	dc.b	81
 109  005d 49            	dc.b	73
 110  005e 46            	dc.b	70
 111  005f 21            	dc.b	33
 112  0060 41            	dc.b	65
 113  0061 45            	dc.b	69
 114  0062 4b            	dc.b	75
 115  0063 31            	dc.b	49
 116  0064 18            	dc.b	24
 117  0065 14            	dc.b	20
 118  0066 12            	dc.b	18
 119  0067 7f            	dc.b	127
 120  0068 10            	dc.b	16
 121  0069 27            	dc.b	39
 122  006a 45            	dc.b	69
 123  006b 45            	dc.b	69
 124  006c 45            	dc.b	69
 125  006d 39            	dc.b	57
 126  006e 3c            	dc.b	60
 127  006f 4a            	dc.b	74
 128  0070 49            	dc.b	73
 129  0071 49            	dc.b	73
 130  0072 30            	dc.b	48
 131  0073 01            	dc.b	1
 132  0074 71            	dc.b	113
 133  0075 09            	dc.b	9
 134  0076 05            	dc.b	5
 135  0077 03            	dc.b	3
 136  0078 36            	dc.b	54
 137  0079 49            	dc.b	73
 138  007a 49            	dc.b	73
 139  007b 49            	dc.b	73
 140  007c 36            	dc.b	54
 141  007d 06            	dc.b	6
 142  007e 49            	dc.b	73
 143  007f 49            	dc.b	73
 144  0080 29            	dc.b	41
 145  0081 1e            	dc.b	30
 146  0082 00            	dc.b	0
 147  0083 36            	dc.b	54
 148  0084 36            	dc.b	54
 149  0085 00            	dc.b	0
 150  0086 00            	dc.b	0
 151  0087 00            	dc.b	0
 152  0088 56            	dc.b	86
 153  0089 36            	dc.b	54
 154  008a 00            	dc.b	0
 155  008b 00            	dc.b	0
 156  008c 08            	dc.b	8
 157  008d 14            	dc.b	20
 158  008e 22            	dc.b	34
 159  008f 41            	dc.b	65
 160  0090 00            	dc.b	0
 161  0091 14            	dc.b	20
 162  0092 14            	dc.b	20
 163  0093 14            	dc.b	20
 164  0094 14            	dc.b	20
 165  0095 14            	dc.b	20
 166  0096 00            	dc.b	0
 167  0097 41            	dc.b	65
 168  0098 22            	dc.b	34
 169  0099 14            	dc.b	20
 170  009a 08            	dc.b	8
 171  009b 02            	dc.b	2
 172  009c 01            	dc.b	1
 173  009d 51            	dc.b	81
 174  009e 09            	dc.b	9
 175  009f 06            	dc.b	6
 176  00a0 32            	dc.b	50
 177  00a1 49            	dc.b	73
 178  00a2 79            	dc.b	121
 179  00a3 41            	dc.b	65
 180  00a4 3e            	dc.b	62
 181  00a5 7e            	dc.b	126
 182  00a6 11            	dc.b	17
 183  00a7 11            	dc.b	17
 184  00a8 11            	dc.b	17
 185  00a9 7e            	dc.b	126
 186  00aa 7f            	dc.b	127
 187  00ab 49            	dc.b	73
 188  00ac 49            	dc.b	73
 189  00ad 49            	dc.b	73
 190  00ae 36            	dc.b	54
 191  00af 3e            	dc.b	62
 192  00b0 41            	dc.b	65
 193  00b1 41            	dc.b	65
 194  00b2 41            	dc.b	65
 195  00b3 22            	dc.b	34
 196  00b4 7f            	dc.b	127
 197  00b5 41            	dc.b	65
 198  00b6 41            	dc.b	65
 199  00b7 22            	dc.b	34
 200  00b8 1c            	dc.b	28
 201  00b9 7f            	dc.b	127
 202  00ba 49            	dc.b	73
 203  00bb 49            	dc.b	73
 204  00bc 49            	dc.b	73
 205  00bd 41            	dc.b	65
 206  00be 7f            	dc.b	127
 207  00bf 09            	dc.b	9
 208  00c0 09            	dc.b	9
 209  00c1 09            	dc.b	9
 210  00c2 01            	dc.b	1
 211  00c3 3e            	dc.b	62
 212  00c4 41            	dc.b	65
 213  00c5 49            	dc.b	73
 214  00c6 49            	dc.b	73
 215  00c7 7a            	dc.b	122
 216  00c8 7f            	dc.b	127
 217  00c9 08            	dc.b	8
 218  00ca 08            	dc.b	8
 219  00cb 08            	dc.b	8
 220  00cc 7f            	dc.b	127
 221  00cd 00            	dc.b	0
 222  00ce 41            	dc.b	65
 223  00cf 7f            	dc.b	127
 224  00d0 41            	dc.b	65
 225  00d1 00            	dc.b	0
 226  00d2 20            	dc.b	32
 227  00d3 40            	dc.b	64
 228  00d4 41            	dc.b	65
 229  00d5 3f            	dc.b	63
 230  00d6 01            	dc.b	1
 231  00d7 7f            	dc.b	127
 232  00d8 08            	dc.b	8
 233  00d9 14            	dc.b	20
 234  00da 22            	dc.b	34
 235  00db 41            	dc.b	65
 236  00dc 7f            	dc.b	127
 237  00dd 40            	dc.b	64
 238  00de 40            	dc.b	64
 239  00df 40            	dc.b	64
 240  00e0 40            	dc.b	64
 241  00e1 7f            	dc.b	127
 242  00e2 02            	dc.b	2
 243  00e3 0c            	dc.b	12
 244  00e4 02            	dc.b	2
 245  00e5 7f            	dc.b	127
 246  00e6 7f            	dc.b	127
 247  00e7 04            	dc.b	4
 248  00e8 08            	dc.b	8
 249  00e9 10            	dc.b	16
 250  00ea 7f            	dc.b	127
 251  00eb 3e            	dc.b	62
 252  00ec 41            	dc.b	65
 253  00ed 41            	dc.b	65
 254  00ee 41            	dc.b	65
 255  00ef 3e            	dc.b	62
 256  00f0 7f            	dc.b	127
 257  00f1 09            	dc.b	9
 258  00f2 09            	dc.b	9
 259  00f3 09            	dc.b	9
 260  00f4 06            	dc.b	6
 261  00f5 3e            	dc.b	62
 262  00f6 41            	dc.b	65
 263  00f7 51            	dc.b	81
 264  00f8 21            	dc.b	33
 265  00f9 5e            	dc.b	94
 266  00fa 7f            	dc.b	127
 267  00fb 09            	dc.b	9
 268  00fc 19            	dc.b	25
 269  00fd 29            	dc.b	41
 270  00fe 46            	dc.b	70
 271  00ff 46            	dc.b	70
 272  0100 49            	dc.b	73
 273  0101 49            	dc.b	73
 274  0102 49            	dc.b	73
 275  0103 31            	dc.b	49
 276  0104 01            	dc.b	1
 277  0105 01            	dc.b	1
 278  0106 7f            	dc.b	127
 279  0107 01            	dc.b	1
 280  0108 01            	dc.b	1
 281  0109 3f            	dc.b	63
 282  010a 40            	dc.b	64
 283  010b 40            	dc.b	64
 284  010c 40            	dc.b	64
 285  010d 3f            	dc.b	63
 286  010e 1f            	dc.b	31
 287  010f 20            	dc.b	32
 288  0110 40            	dc.b	64
 289  0111 20            	dc.b	32
 290  0112 1f            	dc.b	31
 291  0113 3f            	dc.b	63
 292  0114 40            	dc.b	64
 293  0115 38            	dc.b	56
 294  0116 40            	dc.b	64
 295  0117 3f            	dc.b	63
 296  0118 63            	dc.b	99
 297  0119 14            	dc.b	20
 298  011a 08            	dc.b	8
 299  011b 14            	dc.b	20
 300  011c 63            	dc.b	99
 301  011d 07            	dc.b	7
 302  011e 08            	dc.b	8
 303  011f 70            	dc.b	112
 304  0120 08            	dc.b	8
 305  0121 07            	dc.b	7
 306  0122 61            	dc.b	97
 307  0123 51            	dc.b	81
 308  0124 49            	dc.b	73
 309  0125 45            	dc.b	69
 310  0126 43            	dc.b	67
 311  0127 00            	dc.b	0
 312  0128 7f            	dc.b	127
 313  0129 41            	dc.b	65
 314  012a 41            	dc.b	65
 315  012b 00            	dc.b	0
 316  012c 02            	dc.b	2
 317  012d 04            	dc.b	4
 318  012e 08            	dc.b	8
 319  012f 10            	dc.b	16
 320  0130 20            	dc.b	32
 321  0131 00            	dc.b	0
 322  0132 41            	dc.b	65
 323  0133 41            	dc.b	65
 324  0134 7f            	dc.b	127
 325  0135 00            	dc.b	0
 326  0136 04            	dc.b	4
 327  0137 02            	dc.b	2
 328  0138 01            	dc.b	1
 329  0139 02            	dc.b	2
 330  013a 04            	dc.b	4
 331  013b 40            	dc.b	64
 332  013c 40            	dc.b	64
 333  013d 40            	dc.b	64
 334  013e 40            	dc.b	64
 335  013f 40            	dc.b	64
 336  0140 00            	dc.b	0
 337  0141 01            	dc.b	1
 338  0142 02            	dc.b	2
 339  0143 04            	dc.b	4
 340  0144 00            	dc.b	0
 341  0145 20            	dc.b	32
 342  0146 54            	dc.b	84
 343  0147 54            	dc.b	84
 344  0148 54            	dc.b	84
 345  0149 78            	dc.b	120
 346  014a 7f            	dc.b	127
 347  014b 48            	dc.b	72
 348  014c 44            	dc.b	68
 349  014d 44            	dc.b	68
 350  014e 38            	dc.b	56
 351  014f 38            	dc.b	56
 352  0150 44            	dc.b	68
 353  0151 44            	dc.b	68
 354  0152 44            	dc.b	68
 355  0153 20            	dc.b	32
 356  0154 38            	dc.b	56
 357  0155 44            	dc.b	68
 358  0156 44            	dc.b	68
 359  0157 48            	dc.b	72
 360  0158 7f            	dc.b	127
 361  0159 38            	dc.b	56
 362  015a 54            	dc.b	84
 363  015b 54            	dc.b	84
 364  015c 54            	dc.b	84
 365  015d 18            	dc.b	24
 366  015e 08            	dc.b	8
 367  015f 7e            	dc.b	126
 368  0160 09            	dc.b	9
 369  0161 01            	dc.b	1
 370  0162 02            	dc.b	2
 371  0163 0c            	dc.b	12
 372  0164 52            	dc.b	82
 373  0165 52            	dc.b	82
 374  0166 52            	dc.b	82
 375  0167 3e            	dc.b	62
 376  0168 7f            	dc.b	127
 377  0169 08            	dc.b	8
 378  016a 04            	dc.b	4
 379  016b 04            	dc.b	4
 380  016c 78            	dc.b	120
 381  016d 00            	dc.b	0
 382  016e 44            	dc.b	68
 383  016f 7d            	dc.b	125
 384  0170 40            	dc.b	64
 385  0171 00            	dc.b	0
 386  0172 20            	dc.b	32
 387  0173 40            	dc.b	64
 388  0174 44            	dc.b	68
 389  0175 3d            	dc.b	61
 390  0176 00            	dc.b	0
 391  0177 7f            	dc.b	127
 392  0178 10            	dc.b	16
 393  0179 28            	dc.b	40
 394  017a 44            	dc.b	68
 395  017b 00            	dc.b	0
 396  017c 00            	dc.b	0
 397  017d 41            	dc.b	65
 398  017e 7f            	dc.b	127
 399  017f 40            	dc.b	64
 400  0180 00            	dc.b	0
 401  0181 7c            	dc.b	124
 402  0182 04            	dc.b	4
 403  0183 18            	dc.b	24
 404  0184 04            	dc.b	4
 405  0185 78            	dc.b	120
 406  0186 7c            	dc.b	124
 407  0187 08            	dc.b	8
 408  0188 04            	dc.b	4
 409  0189 04            	dc.b	4
 410  018a 78            	dc.b	120
 411  018b 38            	dc.b	56
 412  018c 44            	dc.b	68
 413  018d 44            	dc.b	68
 414  018e 44            	dc.b	68
 415  018f 38            	dc.b	56
 416  0190 7c            	dc.b	124
 417  0191 14            	dc.b	20
 418  0192 14            	dc.b	20
 419  0193 14            	dc.b	20
 420  0194 08            	dc.b	8
 421  0195 08            	dc.b	8
 422  0196 14            	dc.b	20
 423  0197 14            	dc.b	20
 424  0198 18            	dc.b	24
 425  0199 7c            	dc.b	124
 426  019a 7c            	dc.b	124
 427  019b 08            	dc.b	8
 428  019c 04            	dc.b	4
 429  019d 04            	dc.b	4
 430  019e 08            	dc.b	8
 431  019f 48            	dc.b	72
 432  01a0 54            	dc.b	84
 433  01a1 54            	dc.b	84
 434  01a2 54            	dc.b	84
 435  01a3 20            	dc.b	32
 436  01a4 04            	dc.b	4
 437  01a5 3f            	dc.b	63
 438  01a6 44            	dc.b	68
 439  01a7 40            	dc.b	64
 440  01a8 20            	dc.b	32
 441  01a9 3c            	dc.b	60
 442  01aa 40            	dc.b	64
 443  01ab 40            	dc.b	64
 444  01ac 20            	dc.b	32
 445  01ad 7c            	dc.b	124
 446  01ae 1c            	dc.b	28
 447  01af 20            	dc.b	32
 448  01b0 40            	dc.b	64
 449  01b1 20            	dc.b	32
 450  01b2 1c            	dc.b	28
 451  01b3 3c            	dc.b	60
 452  01b4 40            	dc.b	64
 453  01b5 30            	dc.b	48
 454  01b6 40            	dc.b	64
 455  01b7 3c            	dc.b	60
 456  01b8 44            	dc.b	68
 457  01b9 28            	dc.b	40
 458  01ba 10            	dc.b	16
 459  01bb 28            	dc.b	40
 460  01bc 44            	dc.b	68
 461  01bd 0c            	dc.b	12
 462  01be 50            	dc.b	80
 463  01bf 50            	dc.b	80
 464  01c0 50            	dc.b	80
 465  01c1 3c            	dc.b	60
 466  01c2 44            	dc.b	68
 467  01c3 64            	dc.b	100
 468  01c4 54            	dc.b	84
 469  01c5 4c            	dc.b	76
 470  01c6 44            	dc.b	68
 471  01c7 00            	dc.b	0
 472  01c8 08            	dc.b	8
 473  01c9 36            	dc.b	54
 474  01ca 41            	dc.b	65
 475  01cb 00            	dc.b	0
 476  01cc 00            	dc.b	0
 477  01cd 00            	dc.b	0
 478  01ce 7f            	dc.b	127
 479  01cf 00            	dc.b	0
 480  01d0 00            	dc.b	0
 481  01d1 00            	dc.b	0
 482  01d2 41            	dc.b	65
 483  01d3 36            	dc.b	54
 484  01d4 08            	dc.b	8
 485  01d5 00            	dc.b	0
 486  01d6 10            	dc.b	16
 487  01d7 08            	dc.b	8
 488  01d8 08            	dc.b	8
 489  01d9 10            	dc.b	16
 490  01da 08            	dc.b	8
 491  01db 78            	dc.b	120
 492  01dc 46            	dc.b	70
 493  01dd 41            	dc.b	65
 494  01de 46            	dc.b	70
 495  01df 78            	dc.b	120
 556                     ; 7 void setup_GLCD_GPIOs(void)
 556                     ; 8 {
 557                     	switch	.text
 558  0000               f_setup_GLCD_GPIOs:
 562                     ; 9      GPIO_Init(PCD8544_port_1, 
 562                     ; 10                ((GPIO_Pin_TypeDef)(BL_pin | RST_pin | MOSI_pin | SCK_pin)), 
 562                     ; 11                 GPIO_MODE_OUT_PP_HIGH_FAST);
 564  0000 4bf0          	push	#240
 565  0002 4bf0          	push	#240
 566  0004 ae500a        	ldw	x,#20490
 567  0007 8d000000      	callf	f_GPIO_Init
 569  000b 85            	popw	x
 570                     ; 13      GPIO_Init(PCD8544_port_2, 
 570                     ; 14                ((GPIO_Pin_TypeDef)(DC_pin | CE_pin)), 
 570                     ; 15                 GPIO_MODE_OUT_PP_HIGH_FAST);
 572  000c 4bf0          	push	#240
 573  000e 4b03          	push	#3
 574  0010 ae501e        	ldw	x,#20510
 575  0013 8d000000      	callf	f_GPIO_Init
 577  0017 85            	popw	x
 578                     ; 17      delay_ms(10);
 580  0018 ae000a        	ldw	x,#10
 581  001b 8d000000      	callf	f_delay_ms
 583                     ; 18 }
 586  001f 87            	retf
 656                     ; 21 void PCD8544_write(bool mode, unsigned char value)
 656                     ; 22 {
 657                     	switch	.text
 658  0020               f_PCD8544_write:
 660  0020 89            	pushw	x
 661  0021 88            	push	a
 662       00000001      OFST:	set	1
 665                     ; 23     unsigned char s = 0x08;
 667  0022 a608          	ld	a,#8
 668  0024 6b01          	ld	(OFST+0,sp),a
 670                     ; 25     switch(mode)
 672  0026 9e            	ld	a,xh
 673  0027 a101          	cp	a,#1
 674  0029 260c          	jrne	L14
 677  002b               L73:
 678                     ; 29             DC_OUT_HIGH();
 680  002b 4b02          	push	#2
 681  002d ae501e        	ldw	x,#20510
 682  0030 8d000000      	callf	f_GPIO_WriteHigh
 684  0034 84            	pop	a
 685                     ; 30             break;
 687  0035 200a          	jra	L77
 688  0037               L14:
 689                     ; 35             DC_OUT_LOW();
 691  0037 4b02          	push	#2
 692  0039 ae501e        	ldw	x,#20510
 693  003c 8d000000      	callf	f_GPIO_WriteLow
 695  0040 84            	pop	a
 696                     ; 36             break;
 697  0041               L77:
 698                     ; 40     CE_OUT_LOW();
 700  0041 4b01          	push	#1
 701  0043 ae501e        	ldw	x,#20510
 702  0046 8d000000      	callf	f_GPIO_WriteLow
 704  004a 84            	pop	a
 706  004b 2034          	jra	L501
 707  004d               L301:
 708                     ; 44         SCK_OUT_LOW();
 710  004d 4b20          	push	#32
 711  004f ae500a        	ldw	x,#20490
 712  0052 8d000000      	callf	f_GPIO_WriteLow
 714  0056 84            	pop	a
 715                     ; 46         if((value & 0x80) == 0)
 717  0057 7b03          	ld	a,(OFST+2,sp)
 718  0059 a580          	bcp	a,#128
 719  005b 260c          	jrne	L111
 720                     ; 48              MOSI_OUT_LOW();
 722  005d 4b40          	push	#64
 723  005f ae500a        	ldw	x,#20490
 724  0062 8d000000      	callf	f_GPIO_WriteLow
 726  0066 84            	pop	a
 728  0067 200a          	jra	L311
 729  0069               L111:
 730                     ; 52             MOSI_OUT_HIGH();
 732  0069 4b40          	push	#64
 733  006b ae500a        	ldw	x,#20490
 734  006e 8d000000      	callf	f_GPIO_WriteHigh
 736  0072 84            	pop	a
 737  0073               L311:
 738                     ; 55         value <<= 1;
 740  0073 0803          	sll	(OFST+2,sp)
 741                     ; 56         SCK_OUT_HIGH();
 743  0075 4b20          	push	#32
 744  0077 ae500a        	ldw	x,#20490
 745  007a 8d000000      	callf	f_GPIO_WriteHigh
 747  007e 84            	pop	a
 748                     ; 57         s--;
 750  007f 0a01          	dec	(OFST+0,sp)
 752  0081               L501:
 753                     ; 42     while(s > 0)
 755  0081 0d01          	tnz	(OFST+0,sp)
 756  0083 26c8          	jrne	L301
 757                     ; 60     CE_OUT_HIGH();
 760  0085 4b01          	push	#1
 761  0087 ae501e        	ldw	x,#20510
 762  008a 8d000000      	callf	f_GPIO_WriteHigh
 764  008e 84            	pop	a
 765                     ; 61 }
 768  008f 5b03          	addw	sp,#3
 769  0091 87            	retf
 794                     ; 64 void PCD8544_reset(void)
 794                     ; 65 {
 795                     	switch	.text
 796  0092               f_PCD8544_reset:
 800                     ; 66     RST_OUT_LOW();
 802  0092 4b80          	push	#128
 803  0094 ae500a        	ldw	x,#20490
 804  0097 8d000000      	callf	f_GPIO_WriteLow
 806  009b 84            	pop	a
 807                     ; 67     delay_us(100);
 809  009c ae0064        	ldw	x,#100
 810  009f 8d000000      	callf	f_delay_us
 812                     ; 68     RST_OUT_HIGH();
 814  00a3 4b80          	push	#128
 815  00a5 ae500a        	ldw	x,#20490
 816  00a8 8d000000      	callf	f_GPIO_WriteHigh
 818  00ac 84            	pop	a
 819                     ; 69 }
 822  00ad 87            	retf
 849                     ; 72 void PCD8544_init(void)
 849                     ; 73 {
 850                     	switch	.text
 851  00ae               f_PCD8544_init:
 855                     ; 74     setup_GLCD_GPIOs();
 857  00ae 8d000000      	callf	f_setup_GLCD_GPIOs
 859                     ; 75     PCD8544_reset();
 861  00b2 8d920092      	callf	f_PCD8544_reset
 863                     ; 76     PCD8544_write(CMD, (PCD8544_extended_instruction | PCD8544_function_set));
 865  00b6 ae0021        	ldw	x,#33
 866  00b9 8d200020      	callf	f_PCD8544_write
 868                     ; 77     PCD8544_write(CMD, (PCD8544_set_bias | 0x02));
 870  00bd ae0012        	ldw	x,#18
 871  00c0 8d200020      	callf	f_PCD8544_write
 873                     ; 78     PCD8544_set_contrast(0x39);
 875  00c4 a639          	ld	a,#57
 876  00c6 8d0e010e      	callf	f_PCD8544_set_contrast
 878                     ; 79     PCD8544_write(CMD, PCD8544_set_temp);
 880  00ca ae0004        	ldw	x,#4
 881  00cd 8d200020      	callf	f_PCD8544_write
 883                     ; 80     PCD8544_write(CMD, (PCD8544_display_normal | PCD8544_display_control));
 885  00d1 ae000c        	ldw	x,#12
 886  00d4 8d200020      	callf	f_PCD8544_write
 888                     ; 81     PCD8544_write(CMD, PCD8544_function_set);
 890  00d8 ae0020        	ldw	x,#32
 891  00db 8d200020      	callf	f_PCD8544_write
 893                     ; 82     PCD8544_write(CMD, PCD8544_display_all_on);
 895  00df ae0001        	ldw	x,#1
 896  00e2 8d200020      	callf	f_PCD8544_write
 898                     ; 83     PCD8544_write(CMD, PCD8544_display_normal);
 900  00e6 ae0004        	ldw	x,#4
 901  00e9 8d200020      	callf	f_PCD8544_write
 903                     ; 84     PCD8544_clear_buffer(OFF);
 905  00ed 4f            	clr	a
 906  00ee 8dbc01bc      	callf	f_PCD8544_clear_buffer
 908                     ; 85 }
 911  00f2 87            	retf
 948                     ; 88 void PCD8544_backlight_state(bool mode)
 948                     ; 89 {
 949                     	switch	.text
 950  00f3               f_PCD8544_backlight_state:
 954                     ; 90     switch(mode)
 956  00f3 a101          	cp	a,#1
 957  00f5 260c          	jrne	L731
 960  00f7               L531:
 961                     ; 94             BL_OUT_LOW();
 963  00f7 4b10          	push	#16
 964  00f9 ae500a        	ldw	x,#20490
 965  00fc 8d000000      	callf	f_GPIO_WriteLow
 967  0100 84            	pop	a
 968                     ; 95             break;
 970  0101 200a          	jra	L161
 971  0103               L731:
 972                     ; 100             BL_OUT_HIGH();
 974  0103 4b10          	push	#16
 975  0105 ae500a        	ldw	x,#20490
 976  0108 8d000000      	callf	f_GPIO_WriteHigh
 978  010c 84            	pop	a
 979                     ; 101             break;
 980  010d               L161:
 981                     ; 104 }
 984  010d 87            	retf
1017                     ; 107 void PCD8544_set_contrast(unsigned char value) 
1017                     ; 108 {
1018                     	switch	.text
1019  010e               f_PCD8544_set_contrast:
1021  010e 88            	push	a
1022       00000000      OFST:	set	0
1025                     ; 109     PCD8544_write(CMD, (PCD8544_extended_instruction | PCD8544_function_set));
1027  010f ae0021        	ldw	x,#33
1028  0112 8d200020      	callf	f_PCD8544_write
1030                     ; 110     PCD8544_write(CMD, (PCD8544_set_VOP | (value & 0x7F)));
1032  0116 7b01          	ld	a,(OFST+1,sp)
1033  0118 a47f          	and	a,#127
1034  011a aa80          	or	a,#128
1035  011c 5f            	clrw	x
1036  011d 97            	ld	xl,a
1037  011e 8d200020      	callf	f_PCD8544_write
1039                     ; 111     PCD8544_write(CMD, PCD8544_function_set);
1041  0122 ae0020        	ldw	x,#32
1042  0125 8d200020      	callf	f_PCD8544_write
1044                     ; 112 }
1047  0129 84            	pop	a
1048  012a 87            	retf
1087                     ; 115 void PCD8544_set_cursor(unsigned char x_pos, unsigned char y_pos)
1087                     ; 116 {
1088                     	switch	.text
1089  012b               f_PCD8544_set_cursor:
1091  012b 89            	pushw	x
1092       00000000      OFST:	set	0
1095                     ; 117     PCD8544_write(CMD, (PCD8544_set_X_addr | x_pos));
1097  012c 9e            	ld	a,xh
1098  012d aa80          	or	a,#128
1099  012f 5f            	clrw	x
1100  0130 97            	ld	xl,a
1101  0131 8d200020      	callf	f_PCD8544_write
1103                     ; 118     PCD8544_write(CMD, (PCD8544_set_Y_addr | y_pos));
1105  0135 7b02          	ld	a,(OFST+2,sp)
1106  0137 aa40          	or	a,#64
1107  0139 5f            	clrw	x
1108  013a 97            	ld	xl,a
1109  013b 8d200020      	callf	f_PCD8544_write
1111                     ; 119 }
1114  013f 85            	popw	x
1115  0140 87            	retf
1169                     ; 122 void PCD8544_print_char(unsigned char ch, unsigned char colour)
1169                     ; 123 {
1170                     	switch	.text
1171  0141               f_PCD8544_print_char:
1173  0141 89            	pushw	x
1174  0142 89            	pushw	x
1175       00000002      OFST:	set	2
1178                     ; 124     unsigned char s = 0;
1180                     ; 125     unsigned char chr = 0;
1182                     ; 127     for(s = 0; s <= 4; s++)
1184  0143 0f01          	clr	(OFST-1,sp)
1186  0145               L142:
1187                     ; 129        chr = font[(ch - 0x20)][s];
1189  0145 7b03          	ld	a,(OFST+1,sp)
1190  0147 97            	ld	xl,a
1191  0148 a605          	ld	a,#5
1192  014a 42            	mul	x,a
1193  014b 1d00a0        	subw	x,#160
1194  014e 01            	rrwa	x,a
1195  014f 1b01          	add	a,(OFST-1,sp)
1196  0151 2401          	jrnc	L42
1197  0153 5c            	incw	x
1198  0154               L42:
1199  0154 02            	rlwa	x,a
1200  0155 d60000        	ld	a,(L3_font,x)
1201  0158 6b02          	ld	(OFST+0,sp),a
1203                     ; 130        if(colour == BLACK)
1205  015a 0d04          	tnz	(OFST+2,sp)
1206  015c 2602          	jrne	L742
1207                     ; 132            chr = ~chr;
1209  015e 0302          	cpl	(OFST+0,sp)
1211  0160               L742:
1212                     ; 134        PCD8544_write(DAT, chr);
1214  0160 7b02          	ld	a,(OFST+0,sp)
1215  0162 ae0100        	ldw	x,#256
1216  0165 97            	ld	xl,a
1217  0166 8d200020      	callf	f_PCD8544_write
1219                     ; 127     for(s = 0; s <= 4; s++)
1221  016a 0c01          	inc	(OFST-1,sp)
1225  016c 7b01          	ld	a,(OFST-1,sp)
1226  016e a105          	cp	a,#5
1227  0170 25d3          	jrult	L142
1228                     ; 136 }
1231  0172 5b04          	addw	sp,#4
1232  0174 87            	retf
1275                     ; 139 void PCD8544_print_custom_char(unsigned char *map)
1275                     ; 140 {
1276                     	switch	.text
1277  0175               f_PCD8544_print_custom_char:
1279  0175 89            	pushw	x
1280  0176 88            	push	a
1281       00000001      OFST:	set	1
1284                     ; 141     unsigned char s = 0;
1286                     ; 143     for(s = 0; s <= 4; s++)
1288  0177 0f01          	clr	(OFST+0,sp)
1290  0179               L172:
1291                     ; 145         PCD8544_write(DAT, *map++);
1293  0179 1e02          	ldw	x,(OFST+1,sp)
1294  017b 1c0001        	addw	x,#1
1295  017e 1f02          	ldw	(OFST+1,sp),x
1296  0180 1d0001        	subw	x,#1
1297  0183 f6            	ld	a,(x)
1298  0184 ae0100        	ldw	x,#256
1299  0187 97            	ld	xl,a
1300  0188 8d200020      	callf	f_PCD8544_write
1302                     ; 143     for(s = 0; s <= 4; s++)
1304  018c 0c01          	inc	(OFST+0,sp)
1308  018e 7b01          	ld	a,(OFST+0,sp)
1309  0190 a105          	cp	a,#5
1310  0192 25e5          	jrult	L172
1311                     ; 147 }
1314  0194 5b03          	addw	sp,#3
1315  0196 87            	retf
1355                     ; 150 void PCD8544_fill(unsigned char bufr)
1355                     ; 151 {
1356                     	switch	.text
1357  0197               f_PCD8544_fill:
1359  0197 88            	push	a
1360  0198 89            	pushw	x
1361       00000002      OFST:	set	2
1364                     ; 152     unsigned int s = 0;
1366                     ; 154     PCD8544_set_cursor(0, 0);
1368  0199 5f            	clrw	x
1369  019a 8d2b012b      	callf	f_PCD8544_set_cursor
1371                     ; 156     for(s = 0; s < buffer_size; s++)
1373  019e 5f            	clrw	x
1374  019f 1f01          	ldw	(OFST-1,sp),x
1376  01a1               L513:
1377                     ; 158         PCD8544_write(DAT, bufr);
1379  01a1 7b03          	ld	a,(OFST+1,sp)
1380  01a3 ae0100        	ldw	x,#256
1381  01a6 97            	ld	xl,a
1382  01a7 8d200020      	callf	f_PCD8544_write
1384                     ; 156     for(s = 0; s < buffer_size; s++)
1386  01ab 1e01          	ldw	x,(OFST-1,sp)
1387  01ad 1c0001        	addw	x,#1
1388  01b0 1f01          	ldw	(OFST-1,sp),x
1392  01b2 1e01          	ldw	x,(OFST-1,sp)
1393  01b4 a301f8        	cpw	x,#504
1394  01b7 25e8          	jrult	L513
1395                     ; 160 }
1398  01b9 5b03          	addw	sp,#3
1399  01bb 87            	retf
1446                     ; 163 void PCD8544_clear_buffer(unsigned char colour)
1446                     ; 164 {
1447                     	switch	.text
1448  01bc               f_PCD8544_clear_buffer:
1450  01bc 88            	push	a
1451  01bd 89            	pushw	x
1452       00000002      OFST:	set	2
1455                     ; 165     unsigned char x_pos = 0;
1457  01be 0f01          	clr	(OFST-1,sp)
1459                     ; 166     unsigned char y_pos = 0;
1461  01c0 0f02          	clr	(OFST+0,sp)
1463                     ; 168     for(x_pos; x_pos < X_max; x_pos++)
1466  01c2 201e          	jra	L743
1467  01c4               L343:
1468                     ; 170         for(y_pos; y_pos < Rows; y_pos++)
1471  01c4 2014          	jra	L753
1472  01c6               L353:
1473                     ; 172             PCD8544_buffer[x_pos][y_pos] = colour;
1475  01c6 7b01          	ld	a,(OFST-1,sp)
1476  01c8 97            	ld	xl,a
1477  01c9 a606          	ld	a,#6
1478  01cb 42            	mul	x,a
1479  01cc 01            	rrwa	x,a
1480  01cd 1b02          	add	a,(OFST+0,sp)
1481  01cf 2401          	jrnc	L43
1482  01d1 5c            	incw	x
1483  01d2               L43:
1484  01d2 02            	rlwa	x,a
1485  01d3 7b03          	ld	a,(OFST+1,sp)
1486  01d5 d70000        	ld	(_PCD8544_buffer,x),a
1487                     ; 170         for(y_pos; y_pos < Rows; y_pos++)
1489  01d8 0c02          	inc	(OFST+0,sp)
1491  01da               L753:
1494  01da 7b02          	ld	a,(OFST+0,sp)
1495  01dc a106          	cp	a,#6
1496  01de 25e6          	jrult	L353
1497                     ; 168     for(x_pos; x_pos < X_max; x_pos++)
1499  01e0 0c01          	inc	(OFST-1,sp)
1501  01e2               L743:
1504  01e2 7b01          	ld	a,(OFST-1,sp)
1505  01e4 a154          	cp	a,#84
1506  01e6 25dc          	jrult	L343
1507                     ; 175 }
1510  01e8 5b03          	addw	sp,#3
1511  01ea 87            	retf
1558                     ; 178 void PCD8544_clear_screen(unsigned char colour)
1558                     ; 179 {
1559                     	switch	.text
1560  01eb               f_PCD8544_clear_screen:
1562  01eb 88            	push	a
1563  01ec 89            	pushw	x
1564       00000002      OFST:	set	2
1567                     ; 180     unsigned char x_pos = 0;
1569                     ; 181     unsigned char y_pos = 0;
1571                     ; 183     for(y_pos = 0; y_pos < Rows; y_pos++)
1573  01ed 0f01          	clr	(OFST-1,sp)
1575  01ef               L304:
1576                     ; 185         for(x_pos = 0; x_pos < X_max; x_pos++)
1578  01ef 0f02          	clr	(OFST+0,sp)
1580  01f1               L114:
1581                     ; 187             PCD8544_print_string(x_pos, y_pos, " ", colour);
1583  01f1 7b03          	ld	a,(OFST+1,sp)
1584  01f3 88            	push	a
1585  01f4 ae01f4        	ldw	x,#L714
1586  01f7 89            	pushw	x
1587  01f8 7b04          	ld	a,(OFST+2,sp)
1588  01fa 97            	ld	xl,a
1589  01fb 7b05          	ld	a,(OFST+3,sp)
1590  01fd 95            	ld	xh,a
1591  01fe 8d400240      	callf	f_PCD8544_print_string
1593  0202 5b03          	addw	sp,#3
1594                     ; 185         for(x_pos = 0; x_pos < X_max; x_pos++)
1596  0204 0c02          	inc	(OFST+0,sp)
1600  0206 7b02          	ld	a,(OFST+0,sp)
1601  0208 a154          	cp	a,#84
1602  020a 25e5          	jrult	L114
1603                     ; 183     for(y_pos = 0; y_pos < Rows; y_pos++)
1605  020c 0c01          	inc	(OFST-1,sp)
1609  020e 7b01          	ld	a,(OFST-1,sp)
1610  0210 a106          	cp	a,#6
1611  0212 25db          	jrult	L304
1612                     ; 190 }
1615  0214 5b03          	addw	sp,#3
1616  0216 87            	retf
1660                     ; 193 void PCD8544_print_image(const unsigned char *bmp)
1660                     ; 194 {
1661                     	switch	.text
1662  0217               f_PCD8544_print_image:
1664  0217 89            	pushw	x
1665  0218 89            	pushw	x
1666       00000002      OFST:	set	2
1669                     ; 195     unsigned int s = 0;
1671                     ; 197     PCD8544_set_cursor(0, 0);
1673  0219 5f            	clrw	x
1674  021a 8d2b012b      	callf	f_PCD8544_set_cursor
1676                     ; 199     for(s = 0; s < buffer_size; s++)
1678  021e 5f            	clrw	x
1679  021f 1f01          	ldw	(OFST-1,sp),x
1681  0221               L144:
1682                     ; 201         PCD8544_write(DAT, bmp[s]);
1684  0221 1e03          	ldw	x,(OFST+1,sp)
1685  0223 72fb01        	addw	x,(OFST-1,sp)
1686  0226 f6            	ld	a,(x)
1687  0227 ae0100        	ldw	x,#256
1688  022a 97            	ld	xl,a
1689  022b 8d200020      	callf	f_PCD8544_write
1691                     ; 199     for(s = 0; s < buffer_size; s++)
1693  022f 1e01          	ldw	x,(OFST-1,sp)
1694  0231 1c0001        	addw	x,#1
1695  0234 1f01          	ldw	(OFST-1,sp),x
1699  0236 1e01          	ldw	x,(OFST-1,sp)
1700  0238 a301f8        	cpw	x,#504
1701  023b 25e4          	jrult	L144
1702                     ; 203 }
1705  023d 5b04          	addw	sp,#4
1706  023f 87            	retf
1764                     ; 206 void PCD8544_print_string(unsigned char x_pos, unsigned char y_pos, unsigned char *ch, unsigned char colour)
1764                     ; 207 {
1765                     	switch	.text
1766  0240               f_PCD8544_print_string:
1768  0240 89            	pushw	x
1769       00000000      OFST:	set	0
1772                     ; 208     PCD8544_set_cursor(x_pos, y_pos);
1774  0241 9f            	ld	a,xl
1775  0242 97            	ld	xl,a
1776  0243 7b01          	ld	a,(OFST+1,sp)
1777  0245 95            	ld	xh,a
1778  0246 8d2b012b      	callf	f_PCD8544_set_cursor
1780  024a               L374:
1781                     ; 212        PCD8544_print_char(*ch++, colour);
1783  024a 7b08          	ld	a,(OFST+8,sp)
1784  024c 97            	ld	xl,a
1785  024d 1606          	ldw	y,(OFST+6,sp)
1786  024f 72a90001      	addw	y,#1
1787  0253 1706          	ldw	(OFST+6,sp),y
1788  0255 72a20001      	subw	y,#1
1789  0259 90f6          	ld	a,(y)
1790  025b 95            	ld	xh,a
1791  025c 8d410141      	callf	f_PCD8544_print_char
1793                     ; 213     }while((*ch >= 0x20) && (*ch <= 0x7F) && (*ch != '\0'));
1795  0260 1e06          	ldw	x,(OFST+6,sp)
1796  0262 f6            	ld	a,(x)
1797  0263 a120          	cp	a,#32
1798  0265 250c          	jrult	L105
1800  0267 1e06          	ldw	x,(OFST+6,sp)
1801  0269 f6            	ld	a,(x)
1802  026a a180          	cp	a,#128
1803  026c 2405          	jruge	L105
1805  026e 1e06          	ldw	x,(OFST+6,sp)
1806  0270 7d            	tnz	(x)
1807  0271 26d7          	jrne	L374
1808  0273               L105:
1809                     ; 214 }
1812  0273 85            	popw	x
1813  0274 87            	retf
1874                     ; 217 void print_chr(unsigned char x_pos, unsigned char y_pos, signed int value, unsigned char colour)
1874                     ; 218 {
1875                     	switch	.text
1876  0275               f_print_chr:
1878  0275 89            	pushw	x
1879  0276 88            	push	a
1880       00000001      OFST:	set	1
1883                     ; 219     unsigned char ch = 0x00;
1885                     ; 221     if(value < 0)
1887  0277 9c            	rvf
1888  0278 1e07          	ldw	x,(OFST+6,sp)
1889  027a 2e1b          	jrsge	L135
1890                     ; 223         PCD8544_set_cursor(x_pos, y_pos);
1892  027c 7b03          	ld	a,(OFST+2,sp)
1893  027e 97            	ld	xl,a
1894  027f 7b02          	ld	a,(OFST+1,sp)
1895  0281 95            	ld	xh,a
1896  0282 8d2b012b      	callf	f_PCD8544_set_cursor
1898                     ; 224         PCD8544_print_char(0x2D, colour);
1900  0286 7b09          	ld	a,(OFST+8,sp)
1901  0288 ae2d00        	ldw	x,#11520
1902  028b 97            	ld	xl,a
1903  028c 8d410141      	callf	f_PCD8544_print_char
1905                     ; 225         value = -value;
1907  0290 1e07          	ldw	x,(OFST+6,sp)
1908  0292 50            	negw	x
1909  0293 1f07          	ldw	(OFST+6,sp),x
1911  0295 2014          	jra	L335
1912  0297               L135:
1913                     ; 229         PCD8544_set_cursor(x_pos, y_pos);
1915  0297 7b03          	ld	a,(OFST+2,sp)
1916  0299 97            	ld	xl,a
1917  029a 7b02          	ld	a,(OFST+1,sp)
1918  029c 95            	ld	xh,a
1919  029d 8d2b012b      	callf	f_PCD8544_set_cursor
1921                     ; 230         PCD8544_print_char(0x20, colour);
1923  02a1 7b09          	ld	a,(OFST+8,sp)
1924  02a3 ae2000        	ldw	x,#8192
1925  02a6 97            	ld	xl,a
1926  02a7 8d410141      	callf	f_PCD8544_print_char
1928  02ab               L335:
1929                     ; 233      if((value > 99) && (value <= 999))
1931  02ab 9c            	rvf
1932  02ac 1e07          	ldw	x,(OFST+6,sp)
1933  02ae a30064        	cpw	x,#100
1934  02b1 2e04          	jrsge	L64
1935  02b3 ac350335      	jpf	L535
1936  02b7               L64:
1938  02b7 9c            	rvf
1939  02b8 1e07          	ldw	x,(OFST+6,sp)
1940  02ba a303e8        	cpw	x,#1000
1941  02bd 2e76          	jrsge	L535
1942                     ; 235          ch = (value / 100);
1944  02bf 1e07          	ldw	x,(OFST+6,sp)
1945  02c1 a664          	ld	a,#100
1946  02c3 8d000000      	callf	d_sdivx
1948  02c7 01            	rrwa	x,a
1949  02c8 6b01          	ld	(OFST+0,sp),a
1950  02ca 02            	rlwa	x,a
1952                     ; 236          PCD8544_set_cursor((x_pos + 6), y_pos);
1954  02cb 7b03          	ld	a,(OFST+2,sp)
1955  02cd 97            	ld	xl,a
1956  02ce 7b02          	ld	a,(OFST+1,sp)
1957  02d0 ab06          	add	a,#6
1958  02d2 95            	ld	xh,a
1959  02d3 8d2b012b      	callf	f_PCD8544_set_cursor
1961                     ; 237          PCD8544_print_char((48 + ch), colour);
1963  02d7 7b09          	ld	a,(OFST+8,sp)
1964  02d9 97            	ld	xl,a
1965  02da 7b01          	ld	a,(OFST+0,sp)
1966  02dc ab30          	add	a,#48
1967  02de 95            	ld	xh,a
1968  02df 8d410141      	callf	f_PCD8544_print_char
1970                     ; 239          ch = ((value % 100) / 10);
1972  02e3 1e07          	ldw	x,(OFST+6,sp)
1973  02e5 a664          	ld	a,#100
1974  02e7 8d000000      	callf	d_smodx
1976  02eb a60a          	ld	a,#10
1977  02ed 8d000000      	callf	d_sdivx
1979  02f1 01            	rrwa	x,a
1980  02f2 6b01          	ld	(OFST+0,sp),a
1981  02f4 02            	rlwa	x,a
1983                     ; 240          PCD8544_set_cursor((x_pos + 12), y_pos);
1985  02f5 7b03          	ld	a,(OFST+2,sp)
1986  02f7 97            	ld	xl,a
1987  02f8 7b02          	ld	a,(OFST+1,sp)
1988  02fa ab0c          	add	a,#12
1989  02fc 95            	ld	xh,a
1990  02fd 8d2b012b      	callf	f_PCD8544_set_cursor
1992                     ; 241          PCD8544_print_char((48 + ch), colour);
1994  0301 7b09          	ld	a,(OFST+8,sp)
1995  0303 97            	ld	xl,a
1996  0304 7b01          	ld	a,(OFST+0,sp)
1997  0306 ab30          	add	a,#48
1998  0308 95            	ld	xh,a
1999  0309 8d410141      	callf	f_PCD8544_print_char
2001                     ; 243          ch = (value % 10);
2003  030d 1e07          	ldw	x,(OFST+6,sp)
2004  030f a60a          	ld	a,#10
2005  0311 8d000000      	callf	d_smodx
2007  0315 01            	rrwa	x,a
2008  0316 6b01          	ld	(OFST+0,sp),a
2009  0318 02            	rlwa	x,a
2011                     ; 244          PCD8544_set_cursor((x_pos + 18), y_pos);
2013  0319 7b03          	ld	a,(OFST+2,sp)
2014  031b 97            	ld	xl,a
2015  031c 7b02          	ld	a,(OFST+1,sp)
2016  031e ab12          	add	a,#18
2017  0320 95            	ld	xh,a
2018  0321 8d2b012b      	callf	f_PCD8544_set_cursor
2020                     ; 245          PCD8544_print_char((48 + ch), colour);
2022  0325 7b09          	ld	a,(OFST+8,sp)
2023  0327 97            	ld	xl,a
2024  0328 7b01          	ld	a,(OFST+0,sp)
2025  032a ab30          	add	a,#48
2026  032c 95            	ld	xh,a
2027  032d 8d410141      	callf	f_PCD8544_print_char
2030  0331 ac080408      	jpf	L735
2031  0335               L535:
2032                     ; 247      else if((value > 9) && (value <= 99))
2034  0335 9c            	rvf
2035  0336 1e07          	ldw	x,(OFST+6,sp)
2036  0338 a3000a        	cpw	x,#10
2037  033b 2f6e          	jrslt	L145
2039  033d 9c            	rvf
2040  033e 1e07          	ldw	x,(OFST+6,sp)
2041  0340 a30064        	cpw	x,#100
2042  0343 2e66          	jrsge	L145
2043                     ; 249          ch = ((value % 100) / 10);
2045  0345 1e07          	ldw	x,(OFST+6,sp)
2046  0347 a664          	ld	a,#100
2047  0349 8d000000      	callf	d_smodx
2049  034d a60a          	ld	a,#10
2050  034f 8d000000      	callf	d_sdivx
2052  0353 01            	rrwa	x,a
2053  0354 6b01          	ld	(OFST+0,sp),a
2054  0356 02            	rlwa	x,a
2056                     ; 250          PCD8544_set_cursor((x_pos + 6), y_pos);
2058  0357 7b03          	ld	a,(OFST+2,sp)
2059  0359 97            	ld	xl,a
2060  035a 7b02          	ld	a,(OFST+1,sp)
2061  035c ab06          	add	a,#6
2062  035e 95            	ld	xh,a
2063  035f 8d2b012b      	callf	f_PCD8544_set_cursor
2065                     ; 251          PCD8544_print_char((48 + ch), colour);
2067  0363 7b09          	ld	a,(OFST+8,sp)
2068  0365 97            	ld	xl,a
2069  0366 7b01          	ld	a,(OFST+0,sp)
2070  0368 ab30          	add	a,#48
2071  036a 95            	ld	xh,a
2072  036b 8d410141      	callf	f_PCD8544_print_char
2074                     ; 253          ch = (value % 10);
2076  036f 1e07          	ldw	x,(OFST+6,sp)
2077  0371 a60a          	ld	a,#10
2078  0373 8d000000      	callf	d_smodx
2080  0377 01            	rrwa	x,a
2081  0378 6b01          	ld	(OFST+0,sp),a
2082  037a 02            	rlwa	x,a
2084                     ; 254          PCD8544_set_cursor((x_pos + 12), y_pos);
2086  037b 7b03          	ld	a,(OFST+2,sp)
2087  037d 97            	ld	xl,a
2088  037e 7b02          	ld	a,(OFST+1,sp)
2089  0380 ab0c          	add	a,#12
2090  0382 95            	ld	xh,a
2091  0383 8d2b012b      	callf	f_PCD8544_set_cursor
2093                     ; 255          PCD8544_print_char((48 + ch), colour);
2095  0387 7b09          	ld	a,(OFST+8,sp)
2096  0389 97            	ld	xl,a
2097  038a 7b01          	ld	a,(OFST+0,sp)
2098  038c ab30          	add	a,#48
2099  038e 95            	ld	xh,a
2100  038f 8d410141      	callf	f_PCD8544_print_char
2102                     ; 257          PCD8544_set_cursor((x_pos + 18), y_pos);
2104  0393 7b03          	ld	a,(OFST+2,sp)
2105  0395 97            	ld	xl,a
2106  0396 7b02          	ld	a,(OFST+1,sp)
2107  0398 ab12          	add	a,#18
2108  039a 95            	ld	xh,a
2109  039b 8d2b012b      	callf	f_PCD8544_set_cursor
2111                     ; 258          PCD8544_print_char(0x20, colour);
2113  039f 7b09          	ld	a,(OFST+8,sp)
2114  03a1 ae2000        	ldw	x,#8192
2115  03a4 97            	ld	xl,a
2116  03a5 8d410141      	callf	f_PCD8544_print_char
2119  03a9 205d          	jra	L735
2120  03ab               L145:
2121                     ; 260      else if((value >= 0) && (value <= 9))
2123  03ab 9c            	rvf
2124  03ac 1e07          	ldw	x,(OFST+6,sp)
2125  03ae 2f58          	jrslt	L735
2127  03b0 9c            	rvf
2128  03b1 1e07          	ldw	x,(OFST+6,sp)
2129  03b3 a3000a        	cpw	x,#10
2130  03b6 2e50          	jrsge	L735
2131                     ; 262          ch = (value % 10);
2133  03b8 1e07          	ldw	x,(OFST+6,sp)
2134  03ba a60a          	ld	a,#10
2135  03bc 8d000000      	callf	d_smodx
2137  03c0 01            	rrwa	x,a
2138  03c1 6b01          	ld	(OFST+0,sp),a
2139  03c3 02            	rlwa	x,a
2141                     ; 263          PCD8544_set_cursor((x_pos + 6), y_pos);
2143  03c4 7b03          	ld	a,(OFST+2,sp)
2144  03c6 97            	ld	xl,a
2145  03c7 7b02          	ld	a,(OFST+1,sp)
2146  03c9 ab06          	add	a,#6
2147  03cb 95            	ld	xh,a
2148  03cc 8d2b012b      	callf	f_PCD8544_set_cursor
2150                     ; 264          PCD8544_print_char((48 + ch), colour);
2152  03d0 7b09          	ld	a,(OFST+8,sp)
2153  03d2 97            	ld	xl,a
2154  03d3 7b01          	ld	a,(OFST+0,sp)
2155  03d5 ab30          	add	a,#48
2156  03d7 95            	ld	xh,a
2157  03d8 8d410141      	callf	f_PCD8544_print_char
2159                     ; 266          PCD8544_set_cursor((x_pos + 12), y_pos);
2161  03dc 7b03          	ld	a,(OFST+2,sp)
2162  03de 97            	ld	xl,a
2163  03df 7b02          	ld	a,(OFST+1,sp)
2164  03e1 ab0c          	add	a,#12
2165  03e3 95            	ld	xh,a
2166  03e4 8d2b012b      	callf	f_PCD8544_set_cursor
2168                     ; 267          PCD8544_print_char(0x20, colour);
2170  03e8 7b09          	ld	a,(OFST+8,sp)
2171  03ea ae2000        	ldw	x,#8192
2172  03ed 97            	ld	xl,a
2173  03ee 8d410141      	callf	f_PCD8544_print_char
2175                     ; 269          PCD8544_set_cursor((x_pos + 18), y_pos);
2177  03f2 7b03          	ld	a,(OFST+2,sp)
2178  03f4 97            	ld	xl,a
2179  03f5 7b02          	ld	a,(OFST+1,sp)
2180  03f7 ab12          	add	a,#18
2181  03f9 95            	ld	xh,a
2182  03fa 8d2b012b      	callf	f_PCD8544_set_cursor
2184                     ; 270          PCD8544_print_char(0x20, colour);
2186  03fe 7b09          	ld	a,(OFST+8,sp)
2187  0400 ae2000        	ldw	x,#8192
2188  0403 97            	ld	xl,a
2189  0404 8d410141      	callf	f_PCD8544_print_char
2191  0408               L735:
2192                     ; 272 }
2195  0408 5b03          	addw	sp,#3
2196  040a 87            	retf
2257                     	switch	.const
2258  01e0               L25:
2259  01e0 00002710      	dc.l	10000
2260  01e4               L45:
2261  01e4 000003e8      	dc.l	1000
2262  01e8               L65:
2263  01e8 00000064      	dc.l	100
2264  01ec               L06:
2265  01ec 0000000a      	dc.l	10
2266                     ; 275 void print_int(unsigned char x_pos, unsigned char y_pos, signed long value, unsigned char colour)
2266                     ; 276 {
2267                     	switch	.text
2268  040b               f_print_int:
2270  040b 89            	pushw	x
2271  040c 88            	push	a
2272       00000001      OFST:	set	1
2275                     ; 277     unsigned char ch = 0x00;
2277                     ; 279     if(value < 0)
2279  040d 9c            	rvf
2280  040e 9c            	rvf
2281  040f 0d07          	tnz	(OFST+6,sp)
2282  0411 2e1d          	jrsge	L375
2283                     ; 281         PCD8544_set_cursor(x_pos, y_pos);
2285  0413 9f            	ld	a,xl
2286  0414 97            	ld	xl,a
2287  0415 7b02          	ld	a,(OFST+1,sp)
2288  0417 95            	ld	xh,a
2289  0418 8d2b012b      	callf	f_PCD8544_set_cursor
2291                     ; 282         PCD8544_print_char(0x2D, colour);
2293  041c 7b0b          	ld	a,(OFST+10,sp)
2294  041e ae2d00        	ldw	x,#11520
2295  0421 97            	ld	xl,a
2296  0422 8d410141      	callf	f_PCD8544_print_char
2298                     ; 283         value = -value;
2300  0426 96            	ldw	x,sp
2301  0427 1c0007        	addw	x,#OFST+6
2302  042a 8d000000      	callf	d_lgneg
2305  042e 2014          	jra	L575
2306  0430               L375:
2307                     ; 287         PCD8544_set_cursor(x_pos, y_pos);
2309  0430 7b03          	ld	a,(OFST+2,sp)
2310  0432 97            	ld	xl,a
2311  0433 7b02          	ld	a,(OFST+1,sp)
2312  0435 95            	ld	xh,a
2313  0436 8d2b012b      	callf	f_PCD8544_set_cursor
2315                     ; 288         PCD8544_print_char(0x20, colour);
2317  043a 7b0b          	ld	a,(OFST+10,sp)
2318  043c ae2000        	ldw	x,#8192
2319  043f 97            	ld	xl,a
2320  0440 8d410141      	callf	f_PCD8544_print_char
2322  0444               L575:
2323                     ; 291     if(value > 9999)
2325  0444 9c            	rvf
2326  0445 96            	ldw	x,sp
2327  0446 1c0007        	addw	x,#OFST+6
2328  0449 8d000000      	callf	d_ltor
2330  044d ae01e0        	ldw	x,#L25
2331  0450 8d000000      	callf	d_lcmp
2333  0454 2e04          	jrsge	L26
2334  0456 ac4a054a      	jpf	L775
2335  045a               L26:
2336                     ; 293         ch = (value / 10000);
2338  045a 96            	ldw	x,sp
2339  045b 1c0007        	addw	x,#OFST+6
2340  045e 8d000000      	callf	d_ltor
2342  0462 ae01e0        	ldw	x,#L25
2343  0465 8d000000      	callf	d_ldiv
2345  0469 b603          	ld	a,c_lreg+3
2346  046b 6b01          	ld	(OFST+0,sp),a
2348                     ; 294         PCD8544_set_cursor((x_pos + 6), y_pos);
2350  046d 7b03          	ld	a,(OFST+2,sp)
2351  046f 97            	ld	xl,a
2352  0470 7b02          	ld	a,(OFST+1,sp)
2353  0472 ab06          	add	a,#6
2354  0474 95            	ld	xh,a
2355  0475 8d2b012b      	callf	f_PCD8544_set_cursor
2357                     ; 295         PCD8544_print_char((48 + ch), colour);
2359  0479 7b0b          	ld	a,(OFST+10,sp)
2360  047b 97            	ld	xl,a
2361  047c 7b01          	ld	a,(OFST+0,sp)
2362  047e ab30          	add	a,#48
2363  0480 95            	ld	xh,a
2364  0481 8d410141      	callf	f_PCD8544_print_char
2366                     ; 297         ch = ((value % 10000)/ 1000);
2368  0485 96            	ldw	x,sp
2369  0486 1c0007        	addw	x,#OFST+6
2370  0489 8d000000      	callf	d_ltor
2372  048d ae01e0        	ldw	x,#L25
2373  0490 8d000000      	callf	d_lmod
2375  0494 ae01e4        	ldw	x,#L45
2376  0497 8d000000      	callf	d_ldiv
2378  049b b603          	ld	a,c_lreg+3
2379  049d 6b01          	ld	(OFST+0,sp),a
2381                     ; 298         PCD8544_set_cursor((x_pos + 12), y_pos);
2383  049f 7b03          	ld	a,(OFST+2,sp)
2384  04a1 97            	ld	xl,a
2385  04a2 7b02          	ld	a,(OFST+1,sp)
2386  04a4 ab0c          	add	a,#12
2387  04a6 95            	ld	xh,a
2388  04a7 8d2b012b      	callf	f_PCD8544_set_cursor
2390                     ; 299         PCD8544_print_char((48 + ch), colour);
2392  04ab 7b0b          	ld	a,(OFST+10,sp)
2393  04ad 97            	ld	xl,a
2394  04ae 7b01          	ld	a,(OFST+0,sp)
2395  04b0 ab30          	add	a,#48
2396  04b2 95            	ld	xh,a
2397  04b3 8d410141      	callf	f_PCD8544_print_char
2399                     ; 301         ch = ((value % 1000) / 100);
2401  04b7 96            	ldw	x,sp
2402  04b8 1c0007        	addw	x,#OFST+6
2403  04bb 8d000000      	callf	d_ltor
2405  04bf ae01e4        	ldw	x,#L45
2406  04c2 8d000000      	callf	d_lmod
2408  04c6 ae01e8        	ldw	x,#L65
2409  04c9 8d000000      	callf	d_ldiv
2411  04cd b603          	ld	a,c_lreg+3
2412  04cf 6b01          	ld	(OFST+0,sp),a
2414                     ; 302         PCD8544_set_cursor((x_pos + 18), y_pos);
2416  04d1 7b03          	ld	a,(OFST+2,sp)
2417  04d3 97            	ld	xl,a
2418  04d4 7b02          	ld	a,(OFST+1,sp)
2419  04d6 ab12          	add	a,#18
2420  04d8 95            	ld	xh,a
2421  04d9 8d2b012b      	callf	f_PCD8544_set_cursor
2423                     ; 303         PCD8544_print_char((48 + ch), colour);
2425  04dd 7b0b          	ld	a,(OFST+10,sp)
2426  04df 97            	ld	xl,a
2427  04e0 7b01          	ld	a,(OFST+0,sp)
2428  04e2 ab30          	add	a,#48
2429  04e4 95            	ld	xh,a
2430  04e5 8d410141      	callf	f_PCD8544_print_char
2432                     ; 305         ch = ((value % 100) / 10);
2434  04e9 96            	ldw	x,sp
2435  04ea 1c0007        	addw	x,#OFST+6
2436  04ed 8d000000      	callf	d_ltor
2438  04f1 ae01e8        	ldw	x,#L65
2439  04f4 8d000000      	callf	d_lmod
2441  04f8 ae01ec        	ldw	x,#L06
2442  04fb 8d000000      	callf	d_ldiv
2444  04ff b603          	ld	a,c_lreg+3
2445  0501 6b01          	ld	(OFST+0,sp),a
2447                     ; 306         PCD8544_set_cursor((x_pos + 24), y_pos);
2449  0503 7b03          	ld	a,(OFST+2,sp)
2450  0505 97            	ld	xl,a
2451  0506 7b02          	ld	a,(OFST+1,sp)
2452  0508 ab18          	add	a,#24
2453  050a 95            	ld	xh,a
2454  050b 8d2b012b      	callf	f_PCD8544_set_cursor
2456                     ; 307         PCD8544_print_char((48 + ch), colour);
2458  050f 7b0b          	ld	a,(OFST+10,sp)
2459  0511 97            	ld	xl,a
2460  0512 7b01          	ld	a,(OFST+0,sp)
2461  0514 ab30          	add	a,#48
2462  0516 95            	ld	xh,a
2463  0517 8d410141      	callf	f_PCD8544_print_char
2465                     ; 309         ch = (value % 10);
2467  051b 96            	ldw	x,sp
2468  051c 1c0007        	addw	x,#OFST+6
2469  051f 8d000000      	callf	d_ltor
2471  0523 ae01ec        	ldw	x,#L06
2472  0526 8d000000      	callf	d_lmod
2474  052a b603          	ld	a,c_lreg+3
2475  052c 6b01          	ld	(OFST+0,sp),a
2477                     ; 310         PCD8544_set_cursor((x_pos + 30), y_pos);
2479  052e 7b03          	ld	a,(OFST+2,sp)
2480  0530 97            	ld	xl,a
2481  0531 7b02          	ld	a,(OFST+1,sp)
2482  0533 ab1e          	add	a,#30
2483  0535 95            	ld	xh,a
2484  0536 8d2b012b      	callf	f_PCD8544_set_cursor
2486                     ; 311         PCD8544_print_char((48 + ch), colour);
2488  053a 7b0b          	ld	a,(OFST+10,sp)
2489  053c 97            	ld	xl,a
2490  053d 7b01          	ld	a,(OFST+0,sp)
2491  053f ab30          	add	a,#48
2492  0541 95            	ld	xh,a
2493  0542 8d410141      	callf	f_PCD8544_print_char
2496  0546 ac8e088e      	jpf	L106
2497  054a               L775:
2498                     ; 314     else if((value > 999) && (value <= 9999))
2500  054a 9c            	rvf
2501  054b 96            	ldw	x,sp
2502  054c 1c0007        	addw	x,#OFST+6
2503  054f 8d000000      	callf	d_ltor
2505  0553 ae01e4        	ldw	x,#L45
2506  0556 8d000000      	callf	d_lcmp
2508  055a 2e04          	jrsge	L46
2509  055c ac510651      	jpf	L306
2510  0560               L46:
2512  0560 9c            	rvf
2513  0561 96            	ldw	x,sp
2514  0562 1c0007        	addw	x,#OFST+6
2515  0565 8d000000      	callf	d_ltor
2517  0569 ae01e0        	ldw	x,#L25
2518  056c 8d000000      	callf	d_lcmp
2520  0570 2f04          	jrslt	L66
2521  0572 ac510651      	jpf	L306
2522  0576               L66:
2523                     ; 316         ch = ((value % 10000)/ 1000);
2525  0576 96            	ldw	x,sp
2526  0577 1c0007        	addw	x,#OFST+6
2527  057a 8d000000      	callf	d_ltor
2529  057e ae01e0        	ldw	x,#L25
2530  0581 8d000000      	callf	d_lmod
2532  0585 ae01e4        	ldw	x,#L45
2533  0588 8d000000      	callf	d_ldiv
2535  058c b603          	ld	a,c_lreg+3
2536  058e 6b01          	ld	(OFST+0,sp),a
2538                     ; 317         PCD8544_set_cursor((x_pos + 6), y_pos);
2540  0590 7b03          	ld	a,(OFST+2,sp)
2541  0592 97            	ld	xl,a
2542  0593 7b02          	ld	a,(OFST+1,sp)
2543  0595 ab06          	add	a,#6
2544  0597 95            	ld	xh,a
2545  0598 8d2b012b      	callf	f_PCD8544_set_cursor
2547                     ; 318         PCD8544_print_char((48 + ch), colour);
2549  059c 7b0b          	ld	a,(OFST+10,sp)
2550  059e 97            	ld	xl,a
2551  059f 7b01          	ld	a,(OFST+0,sp)
2552  05a1 ab30          	add	a,#48
2553  05a3 95            	ld	xh,a
2554  05a4 8d410141      	callf	f_PCD8544_print_char
2556                     ; 320         ch = ((value % 1000) / 100);
2558  05a8 96            	ldw	x,sp
2559  05a9 1c0007        	addw	x,#OFST+6
2560  05ac 8d000000      	callf	d_ltor
2562  05b0 ae01e4        	ldw	x,#L45
2563  05b3 8d000000      	callf	d_lmod
2565  05b7 ae01e8        	ldw	x,#L65
2566  05ba 8d000000      	callf	d_ldiv
2568  05be b603          	ld	a,c_lreg+3
2569  05c0 6b01          	ld	(OFST+0,sp),a
2571                     ; 321         PCD8544_set_cursor((x_pos + 12), y_pos);
2573  05c2 7b03          	ld	a,(OFST+2,sp)
2574  05c4 97            	ld	xl,a
2575  05c5 7b02          	ld	a,(OFST+1,sp)
2576  05c7 ab0c          	add	a,#12
2577  05c9 95            	ld	xh,a
2578  05ca 8d2b012b      	callf	f_PCD8544_set_cursor
2580                     ; 322         PCD8544_print_char((48 + ch), colour);
2582  05ce 7b0b          	ld	a,(OFST+10,sp)
2583  05d0 97            	ld	xl,a
2584  05d1 7b01          	ld	a,(OFST+0,sp)
2585  05d3 ab30          	add	a,#48
2586  05d5 95            	ld	xh,a
2587  05d6 8d410141      	callf	f_PCD8544_print_char
2589                     ; 324         ch = ((value % 100) / 10);
2591  05da 96            	ldw	x,sp
2592  05db 1c0007        	addw	x,#OFST+6
2593  05de 8d000000      	callf	d_ltor
2595  05e2 ae01e8        	ldw	x,#L65
2596  05e5 8d000000      	callf	d_lmod
2598  05e9 ae01ec        	ldw	x,#L06
2599  05ec 8d000000      	callf	d_ldiv
2601  05f0 b603          	ld	a,c_lreg+3
2602  05f2 6b01          	ld	(OFST+0,sp),a
2604                     ; 325         PCD8544_set_cursor((x_pos + 18), y_pos);
2606  05f4 7b03          	ld	a,(OFST+2,sp)
2607  05f6 97            	ld	xl,a
2608  05f7 7b02          	ld	a,(OFST+1,sp)
2609  05f9 ab12          	add	a,#18
2610  05fb 95            	ld	xh,a
2611  05fc 8d2b012b      	callf	f_PCD8544_set_cursor
2613                     ; 326         PCD8544_print_char((48 + ch), colour);
2615  0600 7b0b          	ld	a,(OFST+10,sp)
2616  0602 97            	ld	xl,a
2617  0603 7b01          	ld	a,(OFST+0,sp)
2618  0605 ab30          	add	a,#48
2619  0607 95            	ld	xh,a
2620  0608 8d410141      	callf	f_PCD8544_print_char
2622                     ; 328         ch = (value % 10);
2624  060c 96            	ldw	x,sp
2625  060d 1c0007        	addw	x,#OFST+6
2626  0610 8d000000      	callf	d_ltor
2628  0614 ae01ec        	ldw	x,#L06
2629  0617 8d000000      	callf	d_lmod
2631  061b b603          	ld	a,c_lreg+3
2632  061d 6b01          	ld	(OFST+0,sp),a
2634                     ; 329         PCD8544_set_cursor((x_pos + 24), y_pos);
2636  061f 7b03          	ld	a,(OFST+2,sp)
2637  0621 97            	ld	xl,a
2638  0622 7b02          	ld	a,(OFST+1,sp)
2639  0624 ab18          	add	a,#24
2640  0626 95            	ld	xh,a
2641  0627 8d2b012b      	callf	f_PCD8544_set_cursor
2643                     ; 330         PCD8544_print_char((48 + ch), colour);
2645  062b 7b0b          	ld	a,(OFST+10,sp)
2646  062d 97            	ld	xl,a
2647  062e 7b01          	ld	a,(OFST+0,sp)
2648  0630 ab30          	add	a,#48
2649  0632 95            	ld	xh,a
2650  0633 8d410141      	callf	f_PCD8544_print_char
2652                     ; 332         PCD8544_set_cursor((x_pos + 30), y_pos);
2654  0637 7b03          	ld	a,(OFST+2,sp)
2655  0639 97            	ld	xl,a
2656  063a 7b02          	ld	a,(OFST+1,sp)
2657  063c ab1e          	add	a,#30
2658  063e 95            	ld	xh,a
2659  063f 8d2b012b      	callf	f_PCD8544_set_cursor
2661                     ; 333         PCD8544_print_char(0x20, colour);
2663  0643 7b0b          	ld	a,(OFST+10,sp)
2664  0645 ae2000        	ldw	x,#8192
2665  0648 97            	ld	xl,a
2666  0649 8d410141      	callf	f_PCD8544_print_char
2669  064d ac8e088e      	jpf	L106
2670  0651               L306:
2671                     ; 335     else if((value > 99) && (value <= 999))
2673  0651 9c            	rvf
2674  0652 96            	ldw	x,sp
2675  0653 1c0007        	addw	x,#OFST+6
2676  0656 8d000000      	callf	d_ltor
2678  065a ae01e8        	ldw	x,#L65
2679  065d 8d000000      	callf	d_lcmp
2681  0661 2e04          	jrsge	L07
2682  0663 ac3c073c      	jpf	L706
2683  0667               L07:
2685  0667 9c            	rvf
2686  0668 96            	ldw	x,sp
2687  0669 1c0007        	addw	x,#OFST+6
2688  066c 8d000000      	callf	d_ltor
2690  0670 ae01e4        	ldw	x,#L45
2691  0673 8d000000      	callf	d_lcmp
2693  0677 2f04          	jrslt	L27
2694  0679 ac3c073c      	jpf	L706
2695  067d               L27:
2696                     ; 337         ch = ((value % 1000) / 100);
2698  067d 96            	ldw	x,sp
2699  067e 1c0007        	addw	x,#OFST+6
2700  0681 8d000000      	callf	d_ltor
2702  0685 ae01e4        	ldw	x,#L45
2703  0688 8d000000      	callf	d_lmod
2705  068c ae01e8        	ldw	x,#L65
2706  068f 8d000000      	callf	d_ldiv
2708  0693 b603          	ld	a,c_lreg+3
2709  0695 6b01          	ld	(OFST+0,sp),a
2711                     ; 338         PCD8544_set_cursor((x_pos + 6), y_pos);
2713  0697 7b03          	ld	a,(OFST+2,sp)
2714  0699 97            	ld	xl,a
2715  069a 7b02          	ld	a,(OFST+1,sp)
2716  069c ab06          	add	a,#6
2717  069e 95            	ld	xh,a
2718  069f 8d2b012b      	callf	f_PCD8544_set_cursor
2720                     ; 339         PCD8544_print_char((48 + ch), colour);
2722  06a3 7b0b          	ld	a,(OFST+10,sp)
2723  06a5 97            	ld	xl,a
2724  06a6 7b01          	ld	a,(OFST+0,sp)
2725  06a8 ab30          	add	a,#48
2726  06aa 95            	ld	xh,a
2727  06ab 8d410141      	callf	f_PCD8544_print_char
2729                     ; 341         ch = ((value % 100) / 10);
2731  06af 96            	ldw	x,sp
2732  06b0 1c0007        	addw	x,#OFST+6
2733  06b3 8d000000      	callf	d_ltor
2735  06b7 ae01e8        	ldw	x,#L65
2736  06ba 8d000000      	callf	d_lmod
2738  06be ae01ec        	ldw	x,#L06
2739  06c1 8d000000      	callf	d_ldiv
2741  06c5 b603          	ld	a,c_lreg+3
2742  06c7 6b01          	ld	(OFST+0,sp),a
2744                     ; 342         PCD8544_set_cursor((x_pos + 12), y_pos);
2746  06c9 7b03          	ld	a,(OFST+2,sp)
2747  06cb 97            	ld	xl,a
2748  06cc 7b02          	ld	a,(OFST+1,sp)
2749  06ce ab0c          	add	a,#12
2750  06d0 95            	ld	xh,a
2751  06d1 8d2b012b      	callf	f_PCD8544_set_cursor
2753                     ; 343         PCD8544_print_char((48 + ch), colour);
2755  06d5 7b0b          	ld	a,(OFST+10,sp)
2756  06d7 97            	ld	xl,a
2757  06d8 7b01          	ld	a,(OFST+0,sp)
2758  06da ab30          	add	a,#48
2759  06dc 95            	ld	xh,a
2760  06dd 8d410141      	callf	f_PCD8544_print_char
2762                     ; 345         ch = (value % 10);
2764  06e1 96            	ldw	x,sp
2765  06e2 1c0007        	addw	x,#OFST+6
2766  06e5 8d000000      	callf	d_ltor
2768  06e9 ae01ec        	ldw	x,#L06
2769  06ec 8d000000      	callf	d_lmod
2771  06f0 b603          	ld	a,c_lreg+3
2772  06f2 6b01          	ld	(OFST+0,sp),a
2774                     ; 346         PCD8544_set_cursor((x_pos + 18), y_pos);
2776  06f4 7b03          	ld	a,(OFST+2,sp)
2777  06f6 97            	ld	xl,a
2778  06f7 7b02          	ld	a,(OFST+1,sp)
2779  06f9 ab12          	add	a,#18
2780  06fb 95            	ld	xh,a
2781  06fc 8d2b012b      	callf	f_PCD8544_set_cursor
2783                     ; 347         PCD8544_print_char((48 + ch), colour);
2785  0700 7b0b          	ld	a,(OFST+10,sp)
2786  0702 97            	ld	xl,a
2787  0703 7b01          	ld	a,(OFST+0,sp)
2788  0705 ab30          	add	a,#48
2789  0707 95            	ld	xh,a
2790  0708 8d410141      	callf	f_PCD8544_print_char
2792                     ; 349         PCD8544_set_cursor((x_pos + 24), y_pos);
2794  070c 7b03          	ld	a,(OFST+2,sp)
2795  070e 97            	ld	xl,a
2796  070f 7b02          	ld	a,(OFST+1,sp)
2797  0711 ab18          	add	a,#24
2798  0713 95            	ld	xh,a
2799  0714 8d2b012b      	callf	f_PCD8544_set_cursor
2801                     ; 350         PCD8544_print_char(0x20, colour);
2803  0718 7b0b          	ld	a,(OFST+10,sp)
2804  071a ae2000        	ldw	x,#8192
2805  071d 97            	ld	xl,a
2806  071e 8d410141      	callf	f_PCD8544_print_char
2808                     ; 352         PCD8544_set_cursor((x_pos + 30), y_pos);
2810  0722 7b03          	ld	a,(OFST+2,sp)
2811  0724 97            	ld	xl,a
2812  0725 7b02          	ld	a,(OFST+1,sp)
2813  0727 ab1e          	add	a,#30
2814  0729 95            	ld	xh,a
2815  072a 8d2b012b      	callf	f_PCD8544_set_cursor
2817                     ; 353         PCD8544_print_char(0x20, colour);
2819  072e 7b0b          	ld	a,(OFST+10,sp)
2820  0730 ae2000        	ldw	x,#8192
2821  0733 97            	ld	xl,a
2822  0734 8d410141      	callf	f_PCD8544_print_char
2825  0738 ac8e088e      	jpf	L106
2826  073c               L706:
2827                     ; 355     else if((value > 9) && (value <= 99))
2829  073c 9c            	rvf
2830  073d 96            	ldw	x,sp
2831  073e 1c0007        	addw	x,#OFST+6
2832  0741 8d000000      	callf	d_ltor
2834  0745 ae01ec        	ldw	x,#L06
2835  0748 8d000000      	callf	d_lcmp
2837  074c 2e04          	jrsge	L47
2838  074e ac0b080b      	jpf	L316
2839  0752               L47:
2841  0752 9c            	rvf
2842  0753 96            	ldw	x,sp
2843  0754 1c0007        	addw	x,#OFST+6
2844  0757 8d000000      	callf	d_ltor
2846  075b ae01e8        	ldw	x,#L65
2847  075e 8d000000      	callf	d_lcmp
2849  0762 2f04          	jrslt	L67
2850  0764 ac0b080b      	jpf	L316
2851  0768               L67:
2852                     ; 357         ch = ((value % 100) / 10);
2854  0768 96            	ldw	x,sp
2855  0769 1c0007        	addw	x,#OFST+6
2856  076c 8d000000      	callf	d_ltor
2858  0770 ae01e8        	ldw	x,#L65
2859  0773 8d000000      	callf	d_lmod
2861  0777 ae01ec        	ldw	x,#L06
2862  077a 8d000000      	callf	d_ldiv
2864  077e b603          	ld	a,c_lreg+3
2865  0780 6b01          	ld	(OFST+0,sp),a
2867                     ; 358         PCD8544_set_cursor((x_pos + 6), y_pos);
2869  0782 7b03          	ld	a,(OFST+2,sp)
2870  0784 97            	ld	xl,a
2871  0785 7b02          	ld	a,(OFST+1,sp)
2872  0787 ab06          	add	a,#6
2873  0789 95            	ld	xh,a
2874  078a 8d2b012b      	callf	f_PCD8544_set_cursor
2876                     ; 359         PCD8544_print_char((48 + ch), colour);
2878  078e 7b0b          	ld	a,(OFST+10,sp)
2879  0790 97            	ld	xl,a
2880  0791 7b01          	ld	a,(OFST+0,sp)
2881  0793 ab30          	add	a,#48
2882  0795 95            	ld	xh,a
2883  0796 8d410141      	callf	f_PCD8544_print_char
2885                     ; 361         ch = (value % 10);
2887  079a 96            	ldw	x,sp
2888  079b 1c0007        	addw	x,#OFST+6
2889  079e 8d000000      	callf	d_ltor
2891  07a2 ae01ec        	ldw	x,#L06
2892  07a5 8d000000      	callf	d_lmod
2894  07a9 b603          	ld	a,c_lreg+3
2895  07ab 6b01          	ld	(OFST+0,sp),a
2897                     ; 362         PCD8544_set_cursor((x_pos + 12), y_pos);
2899  07ad 7b03          	ld	a,(OFST+2,sp)
2900  07af 97            	ld	xl,a
2901  07b0 7b02          	ld	a,(OFST+1,sp)
2902  07b2 ab0c          	add	a,#12
2903  07b4 95            	ld	xh,a
2904  07b5 8d2b012b      	callf	f_PCD8544_set_cursor
2906                     ; 363         PCD8544_print_char((48 + ch), colour);
2908  07b9 7b0b          	ld	a,(OFST+10,sp)
2909  07bb 97            	ld	xl,a
2910  07bc 7b01          	ld	a,(OFST+0,sp)
2911  07be ab30          	add	a,#48
2912  07c0 95            	ld	xh,a
2913  07c1 8d410141      	callf	f_PCD8544_print_char
2915                     ; 365         PCD8544_set_cursor((x_pos + 18), y_pos);
2917  07c5 7b03          	ld	a,(OFST+2,sp)
2918  07c7 97            	ld	xl,a
2919  07c8 7b02          	ld	a,(OFST+1,sp)
2920  07ca ab12          	add	a,#18
2921  07cc 95            	ld	xh,a
2922  07cd 8d2b012b      	callf	f_PCD8544_set_cursor
2924                     ; 366         PCD8544_print_char(0x20, colour);
2926  07d1 7b0b          	ld	a,(OFST+10,sp)
2927  07d3 ae2000        	ldw	x,#8192
2928  07d6 97            	ld	xl,a
2929  07d7 8d410141      	callf	f_PCD8544_print_char
2931                     ; 368         PCD8544_set_cursor((x_pos + 24), y_pos);
2933  07db 7b03          	ld	a,(OFST+2,sp)
2934  07dd 97            	ld	xl,a
2935  07de 7b02          	ld	a,(OFST+1,sp)
2936  07e0 ab18          	add	a,#24
2937  07e2 95            	ld	xh,a
2938  07e3 8d2b012b      	callf	f_PCD8544_set_cursor
2940                     ; 369         PCD8544_print_char(0x20, colour);
2942  07e7 7b0b          	ld	a,(OFST+10,sp)
2943  07e9 ae2000        	ldw	x,#8192
2944  07ec 97            	ld	xl,a
2945  07ed 8d410141      	callf	f_PCD8544_print_char
2947                     ; 371         PCD8544_set_cursor((x_pos + 30), y_pos);
2949  07f1 7b03          	ld	a,(OFST+2,sp)
2950  07f3 97            	ld	xl,a
2951  07f4 7b02          	ld	a,(OFST+1,sp)
2952  07f6 ab1e          	add	a,#30
2953  07f8 95            	ld	xh,a
2954  07f9 8d2b012b      	callf	f_PCD8544_set_cursor
2956                     ; 372         PCD8544_print_char(0x20, colour);
2958  07fd 7b0b          	ld	a,(OFST+10,sp)
2959  07ff ae2000        	ldw	x,#8192
2960  0802 97            	ld	xl,a
2961  0803 8d410141      	callf	f_PCD8544_print_char
2964  0807 ac8e088e      	jpf	L106
2965  080b               L316:
2966                     ; 376         ch = (value % 10);
2968  080b 96            	ldw	x,sp
2969  080c 1c0007        	addw	x,#OFST+6
2970  080f 8d000000      	callf	d_ltor
2972  0813 ae01ec        	ldw	x,#L06
2973  0816 8d000000      	callf	d_lmod
2975  081a b603          	ld	a,c_lreg+3
2976  081c 6b01          	ld	(OFST+0,sp),a
2978                     ; 377         PCD8544_set_cursor((x_pos + 6), y_pos);
2980  081e 7b03          	ld	a,(OFST+2,sp)
2981  0820 97            	ld	xl,a
2982  0821 7b02          	ld	a,(OFST+1,sp)
2983  0823 ab06          	add	a,#6
2984  0825 95            	ld	xh,a
2985  0826 8d2b012b      	callf	f_PCD8544_set_cursor
2987                     ; 378         PCD8544_print_char((48 + ch), colour);
2989  082a 7b0b          	ld	a,(OFST+10,sp)
2990  082c 97            	ld	xl,a
2991  082d 7b01          	ld	a,(OFST+0,sp)
2992  082f ab30          	add	a,#48
2993  0831 95            	ld	xh,a
2994  0832 8d410141      	callf	f_PCD8544_print_char
2996                     ; 380         PCD8544_set_cursor((x_pos + 12), y_pos);
2998  0836 7b03          	ld	a,(OFST+2,sp)
2999  0838 97            	ld	xl,a
3000  0839 7b02          	ld	a,(OFST+1,sp)
3001  083b ab0c          	add	a,#12
3002  083d 95            	ld	xh,a
3003  083e 8d2b012b      	callf	f_PCD8544_set_cursor
3005                     ; 381         PCD8544_print_char(0x20, colour);
3007  0842 7b0b          	ld	a,(OFST+10,sp)
3008  0844 ae2000        	ldw	x,#8192
3009  0847 97            	ld	xl,a
3010  0848 8d410141      	callf	f_PCD8544_print_char
3012                     ; 383         PCD8544_set_cursor((x_pos + 18), y_pos);
3014  084c 7b03          	ld	a,(OFST+2,sp)
3015  084e 97            	ld	xl,a
3016  084f 7b02          	ld	a,(OFST+1,sp)
3017  0851 ab12          	add	a,#18
3018  0853 95            	ld	xh,a
3019  0854 8d2b012b      	callf	f_PCD8544_set_cursor
3021                     ; 384         PCD8544_print_char(0x20, colour);
3023  0858 7b0b          	ld	a,(OFST+10,sp)
3024  085a ae2000        	ldw	x,#8192
3025  085d 97            	ld	xl,a
3026  085e 8d410141      	callf	f_PCD8544_print_char
3028                     ; 386         PCD8544_set_cursor((x_pos + 24), y_pos);
3030  0862 7b03          	ld	a,(OFST+2,sp)
3031  0864 97            	ld	xl,a
3032  0865 7b02          	ld	a,(OFST+1,sp)
3033  0867 ab18          	add	a,#24
3034  0869 95            	ld	xh,a
3035  086a 8d2b012b      	callf	f_PCD8544_set_cursor
3037                     ; 387         PCD8544_print_char(0x20, colour);
3039  086e 7b0b          	ld	a,(OFST+10,sp)
3040  0870 ae2000        	ldw	x,#8192
3041  0873 97            	ld	xl,a
3042  0874 8d410141      	callf	f_PCD8544_print_char
3044                     ; 389         PCD8544_set_cursor((x_pos + 30), y_pos);
3046  0878 7b03          	ld	a,(OFST+2,sp)
3047  087a 97            	ld	xl,a
3048  087b 7b02          	ld	a,(OFST+1,sp)
3049  087d ab1e          	add	a,#30
3050  087f 95            	ld	xh,a
3051  0880 8d2b012b      	callf	f_PCD8544_set_cursor
3053                     ; 390         PCD8544_print_char(0x20, colour);
3055  0884 7b0b          	ld	a,(OFST+10,sp)
3056  0886 ae2000        	ldw	x,#8192
3057  0889 97            	ld	xl,a
3058  088a 8d410141      	callf	f_PCD8544_print_char
3060  088e               L106:
3061                     ; 392 }
3064  088e 5b03          	addw	sp,#3
3065  0890 87            	retf
3133                     ; 395 void print_decimal(unsigned char x_pos, unsigned char y_pos, unsigned int value, unsigned char points, unsigned char colour)
3133                     ; 396 {
3134                     	switch	.text
3135  0891               f_print_decimal:
3137  0891 89            	pushw	x
3138  0892 88            	push	a
3139       00000001      OFST:	set	1
3142                     ; 397     unsigned char ch = 0x00;
3144                     ; 399     PCD8544_set_cursor(x_pos, y_pos);
3146  0893 9f            	ld	a,xl
3147  0894 97            	ld	xl,a
3148  0895 7b02          	ld	a,(OFST+1,sp)
3149  0897 95            	ld	xh,a
3150  0898 8d2b012b      	callf	f_PCD8544_set_cursor
3152                     ; 400     PCD8544_print_char(0x2E, colour);
3154  089c 7b0a          	ld	a,(OFST+9,sp)
3155  089e ae2e00        	ldw	x,#11776
3156  08a1 97            	ld	xl,a
3157  08a2 8d410141      	callf	f_PCD8544_print_char
3159                     ; 402     ch = (value / 1000);
3161  08a6 1e07          	ldw	x,(OFST+6,sp)
3162  08a8 90ae03e8      	ldw	y,#1000
3163  08ac 65            	divw	x,y
3164  08ad 01            	rrwa	x,a
3165  08ae 6b01          	ld	(OFST+0,sp),a
3166  08b0 02            	rlwa	x,a
3168                     ; 403     PCD8544_set_cursor((x_pos + 6), y_pos);
3170  08b1 7b03          	ld	a,(OFST+2,sp)
3171  08b3 97            	ld	xl,a
3172  08b4 7b02          	ld	a,(OFST+1,sp)
3173  08b6 ab06          	add	a,#6
3174  08b8 95            	ld	xh,a
3175  08b9 8d2b012b      	callf	f_PCD8544_set_cursor
3177                     ; 404     PCD8544_print_char((48 + ch), colour);
3179  08bd 7b0a          	ld	a,(OFST+9,sp)
3180  08bf 97            	ld	xl,a
3181  08c0 7b01          	ld	a,(OFST+0,sp)
3182  08c2 ab30          	add	a,#48
3183  08c4 95            	ld	xh,a
3184  08c5 8d410141      	callf	f_PCD8544_print_char
3186                     ; 406     if(points > 1)
3188  08c9 7b09          	ld	a,(OFST+8,sp)
3189  08cb a102          	cp	a,#2
3190  08cd 2404ac4f094f  	jrult	L546
3191                     ; 408         ch = ((value % 1000) / 100);
3193  08d3 1e07          	ldw	x,(OFST+6,sp)
3194  08d5 90ae03e8      	ldw	y,#1000
3195  08d9 65            	divw	x,y
3196  08da 51            	exgw	x,y
3197  08db a664          	ld	a,#100
3198  08dd 62            	div	x,a
3199  08de 01            	rrwa	x,a
3200  08df 6b01          	ld	(OFST+0,sp),a
3201  08e1 02            	rlwa	x,a
3203                     ; 409         PCD8544_set_cursor((x_pos + 12), y_pos);
3205  08e2 7b03          	ld	a,(OFST+2,sp)
3206  08e4 97            	ld	xl,a
3207  08e5 7b02          	ld	a,(OFST+1,sp)
3208  08e7 ab0c          	add	a,#12
3209  08e9 95            	ld	xh,a
3210  08ea 8d2b012b      	callf	f_PCD8544_set_cursor
3212                     ; 410         PCD8544_print_char((48 + ch), colour);
3214  08ee 7b0a          	ld	a,(OFST+9,sp)
3215  08f0 97            	ld	xl,a
3216  08f1 7b01          	ld	a,(OFST+0,sp)
3217  08f3 ab30          	add	a,#48
3218  08f5 95            	ld	xh,a
3219  08f6 8d410141      	callf	f_PCD8544_print_char
3221                     ; 413         if(points > 2)
3223  08fa 7b09          	ld	a,(OFST+8,sp)
3224  08fc a103          	cp	a,#3
3225  08fe 254f          	jrult	L546
3226                     ; 415             ch = ((value % 100) / 10);
3228  0900 1e07          	ldw	x,(OFST+6,sp)
3229  0902 a664          	ld	a,#100
3230  0904 62            	div	x,a
3231  0905 5f            	clrw	x
3232  0906 97            	ld	xl,a
3233  0907 a60a          	ld	a,#10
3234  0909 62            	div	x,a
3235  090a 01            	rrwa	x,a
3236  090b 6b01          	ld	(OFST+0,sp),a
3237  090d 02            	rlwa	x,a
3239                     ; 416             PCD8544_set_cursor((x_pos + 18), y_pos);
3241  090e 7b03          	ld	a,(OFST+2,sp)
3242  0910 97            	ld	xl,a
3243  0911 7b02          	ld	a,(OFST+1,sp)
3244  0913 ab12          	add	a,#18
3245  0915 95            	ld	xh,a
3246  0916 8d2b012b      	callf	f_PCD8544_set_cursor
3248                     ; 417             PCD8544_print_char((48 + ch), colour);
3250  091a 7b0a          	ld	a,(OFST+9,sp)
3251  091c 97            	ld	xl,a
3252  091d 7b01          	ld	a,(OFST+0,sp)
3253  091f ab30          	add	a,#48
3254  0921 95            	ld	xh,a
3255  0922 8d410141      	callf	f_PCD8544_print_char
3257                     ; 419             if(points > 3)
3259  0926 7b09          	ld	a,(OFST+8,sp)
3260  0928 a104          	cp	a,#4
3261  092a 2523          	jrult	L546
3262                     ; 421                 ch = (value % 10);
3264  092c 1e07          	ldw	x,(OFST+6,sp)
3265  092e a60a          	ld	a,#10
3266  0930 62            	div	x,a
3267  0931 5f            	clrw	x
3268  0932 97            	ld	xl,a
3269  0933 01            	rrwa	x,a
3270  0934 6b01          	ld	(OFST+0,sp),a
3271  0936 02            	rlwa	x,a
3273                     ; 422                 PCD8544_set_cursor((x_pos + 24), y_pos);
3275  0937 7b03          	ld	a,(OFST+2,sp)
3276  0939 97            	ld	xl,a
3277  093a 7b02          	ld	a,(OFST+1,sp)
3278  093c ab18          	add	a,#24
3279  093e 95            	ld	xh,a
3280  093f 8d2b012b      	callf	f_PCD8544_set_cursor
3282                     ; 423                 PCD8544_print_char((48 + ch), colour);;
3284  0943 7b0a          	ld	a,(OFST+9,sp)
3285  0945 97            	ld	xl,a
3286  0946 7b01          	ld	a,(OFST+0,sp)
3287  0948 ab30          	add	a,#48
3288  094a 95            	ld	xh,a
3289  094b 8d410141      	callf	f_PCD8544_print_char
3292  094f               L546:
3293                     ; 427 }
3296  094f 5b03          	addw	sp,#3
3297  0951 87            	retf
3367                     ; 430 void print_float(unsigned char x_pos, unsigned char y_pos, float value, unsigned char points, unsigned char colour)
3367                     ; 431 {
3368                     	switch	.text
3369  0952               f_print_float:
3371  0952 89            	pushw	x
3372  0953 5208          	subw	sp,#8
3373       00000008      OFST:	set	8
3376                     ; 432     signed long tmp = 0x00;
3378                     ; 434     tmp = ((signed long)value);
3380  0955 96            	ldw	x,sp
3381  0956 1c000e        	addw	x,#OFST+6
3382  0959 8d000000      	callf	d_ltor
3384  095d 8d000000      	callf	d_ftol
3386  0961 96            	ldw	x,sp
3387  0962 1c0005        	addw	x,#OFST-3
3388  0965 8d000000      	callf	d_rtol
3391                     ; 435     print_int(x_pos, y_pos, tmp, colour);
3393  0969 7b13          	ld	a,(OFST+11,sp)
3394  096b 88            	push	a
3395  096c 1e08          	ldw	x,(OFST+0,sp)
3396  096e 89            	pushw	x
3397  096f 1e08          	ldw	x,(OFST+0,sp)
3398  0971 89            	pushw	x
3399  0972 7b0f          	ld	a,(OFST+7,sp)
3400  0974 97            	ld	xl,a
3401  0975 7b0e          	ld	a,(OFST+6,sp)
3402  0977 95            	ld	xh,a
3403  0978 8d0b040b      	callf	f_print_int
3405  097c 5b05          	addw	sp,#5
3406                     ; 436     tmp = ((value - tmp) * 10000);
3408  097e 96            	ldw	x,sp
3409  097f 1c0005        	addw	x,#OFST-3
3410  0982 8d000000      	callf	d_ltor
3412  0986 8d000000      	callf	d_ltof
3414  098a 96            	ldw	x,sp
3415  098b 1c0001        	addw	x,#OFST-7
3416  098e 8d000000      	callf	d_rtol
3419  0992 96            	ldw	x,sp
3420  0993 1c000e        	addw	x,#OFST+6
3421  0996 8d000000      	callf	d_ltor
3423  099a 96            	ldw	x,sp
3424  099b 1c0001        	addw	x,#OFST-7
3425  099e 8d000000      	callf	d_fsub
3427  09a2 ae01f0        	ldw	x,#L507
3428  09a5 8d000000      	callf	d_fmul
3430  09a9 8d000000      	callf	d_ftol
3432  09ad 96            	ldw	x,sp
3433  09ae 1c0005        	addw	x,#OFST-3
3434  09b1 8d000000      	callf	d_rtol
3437                     ; 438     if(tmp < 0)
3439  09b5 9c            	rvf
3440  09b6 9c            	rvf
3441  09b7 0d05          	tnz	(OFST-3,sp)
3442  09b9 2e08          	jrsge	L117
3443                     ; 440        tmp = -tmp;
3445  09bb 96            	ldw	x,sp
3446  09bc 1c0005        	addw	x,#OFST-3
3447  09bf 8d000000      	callf	d_lgneg
3450  09c3               L117:
3451                     ; 443     if((value >= 10000) && (value < 100000))
3453  09c3 9c            	rvf
3454  09c4 ae2710        	ldw	x,#10000
3455  09c7 8d000000      	callf	d_itof
3457  09cb 96            	ldw	x,sp
3458  09cc 1c0001        	addw	x,#OFST-7
3459  09cf 8d000000      	callf	d_rtol
3462  09d3 96            	ldw	x,sp
3463  09d4 1c000e        	addw	x,#OFST+6
3464  09d7 8d000000      	callf	d_ltor
3466  09db 96            	ldw	x,sp
3467  09dc 1c0001        	addw	x,#OFST-7
3468  09df 8d000000      	callf	d_fcmp
3470  09e3 2f44          	jrslt	L317
3472  09e5 9c            	rvf
3473  09e6 ae86a0        	ldw	x,#34464
3474  09e9 bf02          	ldw	c_lreg+2,x
3475  09eb ae0001        	ldw	x,#1
3476  09ee bf00          	ldw	c_lreg,x
3477  09f0 8d000000      	callf	d_ltof
3479  09f4 96            	ldw	x,sp
3480  09f5 1c0001        	addw	x,#OFST-7
3481  09f8 8d000000      	callf	d_rtol
3484  09fc 96            	ldw	x,sp
3485  09fd 1c000e        	addw	x,#OFST+6
3486  0a00 8d000000      	callf	d_ltor
3488  0a04 96            	ldw	x,sp
3489  0a05 1c0001        	addw	x,#OFST-7
3490  0a08 8d000000      	callf	d_fcmp
3492  0a0c 2e1b          	jrsge	L317
3493                     ; 445         print_decimal((x_pos + 36), y_pos, tmp, points, colour);
3495  0a0e 7b13          	ld	a,(OFST+11,sp)
3496  0a10 88            	push	a
3497  0a11 7b13          	ld	a,(OFST+11,sp)
3498  0a13 88            	push	a
3499  0a14 1e09          	ldw	x,(OFST+1,sp)
3500  0a16 89            	pushw	x
3501  0a17 7b0e          	ld	a,(OFST+6,sp)
3502  0a19 97            	ld	xl,a
3503  0a1a 7b0d          	ld	a,(OFST+5,sp)
3504  0a1c ab24          	add	a,#36
3505  0a1e 95            	ld	xh,a
3506  0a1f 8d910891      	callf	f_print_decimal
3508  0a23 5b04          	addw	sp,#4
3510  0a25 aca90ba9      	jpf	L517
3511  0a29               L317:
3512                     ; 447     else if((value >= 1000) && (value < 10000))
3514  0a29 9c            	rvf
3515  0a2a ae03e8        	ldw	x,#1000
3516  0a2d 8d000000      	callf	d_itof
3518  0a31 96            	ldw	x,sp
3519  0a32 1c0001        	addw	x,#OFST-7
3520  0a35 8d000000      	callf	d_rtol
3523  0a39 96            	ldw	x,sp
3524  0a3a 1c000e        	addw	x,#OFST+6
3525  0a3d 8d000000      	callf	d_ltor
3527  0a41 96            	ldw	x,sp
3528  0a42 1c0001        	addw	x,#OFST-7
3529  0a45 8d000000      	callf	d_fcmp
3531  0a49 2f3d          	jrslt	L717
3533  0a4b 9c            	rvf
3534  0a4c ae2710        	ldw	x,#10000
3535  0a4f 8d000000      	callf	d_itof
3537  0a53 96            	ldw	x,sp
3538  0a54 1c0001        	addw	x,#OFST-7
3539  0a57 8d000000      	callf	d_rtol
3542  0a5b 96            	ldw	x,sp
3543  0a5c 1c000e        	addw	x,#OFST+6
3544  0a5f 8d000000      	callf	d_ltor
3546  0a63 96            	ldw	x,sp
3547  0a64 1c0001        	addw	x,#OFST-7
3548  0a67 8d000000      	callf	d_fcmp
3550  0a6b 2e1b          	jrsge	L717
3551                     ; 449         print_decimal((x_pos + 30), y_pos, tmp, points, colour);
3553  0a6d 7b13          	ld	a,(OFST+11,sp)
3554  0a6f 88            	push	a
3555  0a70 7b13          	ld	a,(OFST+11,sp)
3556  0a72 88            	push	a
3557  0a73 1e09          	ldw	x,(OFST+1,sp)
3558  0a75 89            	pushw	x
3559  0a76 7b0e          	ld	a,(OFST+6,sp)
3560  0a78 97            	ld	xl,a
3561  0a79 7b0d          	ld	a,(OFST+5,sp)
3562  0a7b ab1e          	add	a,#30
3563  0a7d 95            	ld	xh,a
3564  0a7e 8d910891      	callf	f_print_decimal
3566  0a82 5b04          	addw	sp,#4
3568  0a84 aca90ba9      	jpf	L517
3569  0a88               L717:
3570                     ; 451     else if((value >= 100) && (value < 1000))
3572  0a88 9c            	rvf
3573  0a89 a664          	ld	a,#100
3574  0a8b 8d000000      	callf	d_ctof
3576  0a8f 96            	ldw	x,sp
3577  0a90 1c0001        	addw	x,#OFST-7
3578  0a93 8d000000      	callf	d_rtol
3581  0a97 96            	ldw	x,sp
3582  0a98 1c000e        	addw	x,#OFST+6
3583  0a9b 8d000000      	callf	d_ltor
3585  0a9f 96            	ldw	x,sp
3586  0aa0 1c0001        	addw	x,#OFST-7
3587  0aa3 8d000000      	callf	d_fcmp
3589  0aa7 2f3d          	jrslt	L327
3591  0aa9 9c            	rvf
3592  0aaa ae03e8        	ldw	x,#1000
3593  0aad 8d000000      	callf	d_itof
3595  0ab1 96            	ldw	x,sp
3596  0ab2 1c0001        	addw	x,#OFST-7
3597  0ab5 8d000000      	callf	d_rtol
3600  0ab9 96            	ldw	x,sp
3601  0aba 1c000e        	addw	x,#OFST+6
3602  0abd 8d000000      	callf	d_ltor
3604  0ac1 96            	ldw	x,sp
3605  0ac2 1c0001        	addw	x,#OFST-7
3606  0ac5 8d000000      	callf	d_fcmp
3608  0ac9 2e1b          	jrsge	L327
3609                     ; 453         print_decimal((x_pos + 24), y_pos, tmp, points, colour);
3611  0acb 7b13          	ld	a,(OFST+11,sp)
3612  0acd 88            	push	a
3613  0ace 7b13          	ld	a,(OFST+11,sp)
3614  0ad0 88            	push	a
3615  0ad1 1e09          	ldw	x,(OFST+1,sp)
3616  0ad3 89            	pushw	x
3617  0ad4 7b0e          	ld	a,(OFST+6,sp)
3618  0ad6 97            	ld	xl,a
3619  0ad7 7b0d          	ld	a,(OFST+5,sp)
3620  0ad9 ab18          	add	a,#24
3621  0adb 95            	ld	xh,a
3622  0adc 8d910891      	callf	f_print_decimal
3624  0ae0 5b04          	addw	sp,#4
3626  0ae2 aca90ba9      	jpf	L517
3627  0ae6               L327:
3628                     ; 455     else if((value >= 10) && (value < 100))
3630  0ae6 9c            	rvf
3631  0ae7 a60a          	ld	a,#10
3632  0ae9 8d000000      	callf	d_ctof
3634  0aed 96            	ldw	x,sp
3635  0aee 1c0001        	addw	x,#OFST-7
3636  0af1 8d000000      	callf	d_rtol
3639  0af5 96            	ldw	x,sp
3640  0af6 1c000e        	addw	x,#OFST+6
3641  0af9 8d000000      	callf	d_ltor
3643  0afd 96            	ldw	x,sp
3644  0afe 1c0001        	addw	x,#OFST-7
3645  0b01 8d000000      	callf	d_fcmp
3647  0b05 2f3a          	jrslt	L727
3649  0b07 9c            	rvf
3650  0b08 a664          	ld	a,#100
3651  0b0a 8d000000      	callf	d_ctof
3653  0b0e 96            	ldw	x,sp
3654  0b0f 1c0001        	addw	x,#OFST-7
3655  0b12 8d000000      	callf	d_rtol
3658  0b16 96            	ldw	x,sp
3659  0b17 1c000e        	addw	x,#OFST+6
3660  0b1a 8d000000      	callf	d_ltor
3662  0b1e 96            	ldw	x,sp
3663  0b1f 1c0001        	addw	x,#OFST-7
3664  0b22 8d000000      	callf	d_fcmp
3666  0b26 2e19          	jrsge	L727
3667                     ; 457         print_decimal((x_pos + 18), y_pos, tmp, points, colour);
3669  0b28 7b13          	ld	a,(OFST+11,sp)
3670  0b2a 88            	push	a
3671  0b2b 7b13          	ld	a,(OFST+11,sp)
3672  0b2d 88            	push	a
3673  0b2e 1e09          	ldw	x,(OFST+1,sp)
3674  0b30 89            	pushw	x
3675  0b31 7b0e          	ld	a,(OFST+6,sp)
3676  0b33 97            	ld	xl,a
3677  0b34 7b0d          	ld	a,(OFST+5,sp)
3678  0b36 ab12          	add	a,#18
3679  0b38 95            	ld	xh,a
3680  0b39 8d910891      	callf	f_print_decimal
3682  0b3d 5b04          	addw	sp,#4
3684  0b3f 2068          	jra	L517
3685  0b41               L727:
3686                     ; 459     else if(value < 10)
3688  0b41 9c            	rvf
3689  0b42 a60a          	ld	a,#10
3690  0b44 8d000000      	callf	d_ctof
3692  0b48 96            	ldw	x,sp
3693  0b49 1c0001        	addw	x,#OFST-7
3694  0b4c 8d000000      	callf	d_rtol
3697  0b50 96            	ldw	x,sp
3698  0b51 1c000e        	addw	x,#OFST+6
3699  0b54 8d000000      	callf	d_ltor
3701  0b58 96            	ldw	x,sp
3702  0b59 1c0001        	addw	x,#OFST-7
3703  0b5c 8d000000      	callf	d_fcmp
3705  0b60 2e47          	jrsge	L517
3706                     ; 461         print_decimal((x_pos + 12), y_pos, tmp, points, colour);
3708  0b62 7b13          	ld	a,(OFST+11,sp)
3709  0b64 88            	push	a
3710  0b65 7b13          	ld	a,(OFST+11,sp)
3711  0b67 88            	push	a
3712  0b68 1e09          	ldw	x,(OFST+1,sp)
3713  0b6a 89            	pushw	x
3714  0b6b 7b0e          	ld	a,(OFST+6,sp)
3715  0b6d 97            	ld	xl,a
3716  0b6e 7b0d          	ld	a,(OFST+5,sp)
3717  0b70 ab0c          	add	a,#12
3718  0b72 95            	ld	xh,a
3719  0b73 8d910891      	callf	f_print_decimal
3721  0b77 5b04          	addw	sp,#4
3722                     ; 462         if(value < 0)
3724  0b79 9c            	rvf
3725  0b7a 9c            	rvf
3726  0b7b 0d0e          	tnz	(OFST+6,sp)
3727  0b7d 2e16          	jrsge	L537
3728                     ; 464             PCD8544_set_cursor(x_pos, y_pos);
3730  0b7f 7b0a          	ld	a,(OFST+2,sp)
3731  0b81 97            	ld	xl,a
3732  0b82 7b09          	ld	a,(OFST+1,sp)
3733  0b84 95            	ld	xh,a
3734  0b85 8d2b012b      	callf	f_PCD8544_set_cursor
3736                     ; 465             PCD8544_print_char(0x2D, colour);
3738  0b89 7b13          	ld	a,(OFST+11,sp)
3739  0b8b ae2d00        	ldw	x,#11520
3740  0b8e 97            	ld	xl,a
3741  0b8f 8d410141      	callf	f_PCD8544_print_char
3744  0b93 2014          	jra	L517
3745  0b95               L537:
3746                     ; 469             PCD8544_set_cursor(x_pos, y_pos);
3748  0b95 7b0a          	ld	a,(OFST+2,sp)
3749  0b97 97            	ld	xl,a
3750  0b98 7b09          	ld	a,(OFST+1,sp)
3751  0b9a 95            	ld	xh,a
3752  0b9b 8d2b012b      	callf	f_PCD8544_set_cursor
3754                     ; 470             PCD8544_print_char(0x20, colour);
3756  0b9f 7b13          	ld	a,(OFST+11,sp)
3757  0ba1 ae2000        	ldw	x,#8192
3758  0ba4 97            	ld	xl,a
3759  0ba5 8d410141      	callf	f_PCD8544_print_char
3761  0ba9               L517:
3762                     ; 473 }
3765  0ba9 5b0a          	addw	sp,#10
3766  0bab 87            	retf
3828                     ; 476 void Draw_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned char colour)
3828                     ; 477 {
3829                     	switch	.text
3830  0bac               f_Draw_Pixel:
3832  0bac 89            	pushw	x
3833  0bad 89            	pushw	x
3834       00000002      OFST:	set	2
3837                     ; 478     unsigned char row = 0;
3839                     ; 479     unsigned char value = 0;
3841                     ; 481     if((x_pos < 0) || (x_pos >= X_max) || (y_pos < 0) || (y_pos >= Y_max))
3843  0bae 9e            	ld	a,xh
3844  0baf a154          	cp	a,#84
3845  0bb1 2405          	jruge	L767
3847  0bb3 9f            	ld	a,xl
3848  0bb4 a130          	cp	a,#48
3849  0bb6 2504          	jrult	L567
3850  0bb8               L767:
3851                     ; 483         return;
3853  0bb8 ac490c49      	jpf	L621
3854  0bbc               L567:
3855                     ; 486     row = (y_pos >> 3);
3857  0bbc 7b04          	ld	a,(OFST+2,sp)
3858  0bbe 44            	srl	a
3859  0bbf 44            	srl	a
3860  0bc0 44            	srl	a
3861  0bc1 6b01          	ld	(OFST-1,sp),a
3863                     ; 488     value = PCD8544_buffer[x_pos][row];
3865  0bc3 7b03          	ld	a,(OFST+1,sp)
3866  0bc5 97            	ld	xl,a
3867  0bc6 a606          	ld	a,#6
3868  0bc8 42            	mul	x,a
3869  0bc9 01            	rrwa	x,a
3870  0bca 1b01          	add	a,(OFST-1,sp)
3871  0bcc 2401          	jrnc	L601
3872  0bce 5c            	incw	x
3873  0bcf               L601:
3874  0bcf 02            	rlwa	x,a
3875  0bd0 d60000        	ld	a,(_PCD8544_buffer,x)
3876  0bd3 6b02          	ld	(OFST+0,sp),a
3878                     ; 490     if(colour == BLACK)
3880  0bd5 0d08          	tnz	(OFST+6,sp)
3881  0bd7 2615          	jrne	L177
3882                     ; 492         value |= (1 << (y_pos % 8));
3884  0bd9 7b04          	ld	a,(OFST+2,sp)
3885  0bdb a407          	and	a,#7
3886  0bdd 5f            	clrw	x
3887  0bde 97            	ld	xl,a
3888  0bdf a601          	ld	a,#1
3889  0be1 5d            	tnzw	x
3890  0be2 2704          	jreq	L011
3891  0be4               L211:
3892  0be4 48            	sll	a
3893  0be5 5a            	decw	x
3894  0be6 26fc          	jrne	L211
3895  0be8               L011:
3896  0be8 1a02          	or	a,(OFST+0,sp)
3897  0bea 6b02          	ld	(OFST+0,sp),a
3900  0bec 2035          	jra	L377
3901  0bee               L177:
3902                     ; 494     else if(colour == WHITE)
3904  0bee 7b08          	ld	a,(OFST+6,sp)
3905  0bf0 a101          	cp	a,#1
3906  0bf2 2616          	jrne	L577
3907                     ; 496         value &= (~(1 << (y_pos % 8)));
3909  0bf4 7b04          	ld	a,(OFST+2,sp)
3910  0bf6 a407          	and	a,#7
3911  0bf8 5f            	clrw	x
3912  0bf9 97            	ld	xl,a
3913  0bfa a601          	ld	a,#1
3914  0bfc 5d            	tnzw	x
3915  0bfd 2704          	jreq	L411
3916  0bff               L611:
3917  0bff 48            	sll	a
3918  0c00 5a            	decw	x
3919  0c01 26fc          	jrne	L611
3920  0c03               L411:
3921  0c03 43            	cpl	a
3922  0c04 1402          	and	a,(OFST+0,sp)
3923  0c06 6b02          	ld	(OFST+0,sp),a
3926  0c08 2019          	jra	L377
3927  0c0a               L577:
3928                     ; 498     else if(colour == PIXEL_XOR)
3930  0c0a 7b08          	ld	a,(OFST+6,sp)
3931  0c0c a102          	cp	a,#2
3932  0c0e 2613          	jrne	L377
3933                     ; 500         value ^= (1 << (y_pos % 8));
3935  0c10 7b04          	ld	a,(OFST+2,sp)
3936  0c12 a407          	and	a,#7
3937  0c14 5f            	clrw	x
3938  0c15 97            	ld	xl,a
3939  0c16 a601          	ld	a,#1
3940  0c18 5d            	tnzw	x
3941  0c19 2704          	jreq	L021
3942  0c1b               L221:
3943  0c1b 48            	sll	a
3944  0c1c 5a            	decw	x
3945  0c1d 26fc          	jrne	L221
3946  0c1f               L021:
3947  0c1f 1802          	xor	a,(OFST+0,sp)
3948  0c21 6b02          	ld	(OFST+0,sp),a
3950  0c23               L377:
3951                     ; 503     PCD8544_buffer[x_pos][row] = value;
3953  0c23 7b03          	ld	a,(OFST+1,sp)
3954  0c25 97            	ld	xl,a
3955  0c26 a606          	ld	a,#6
3956  0c28 42            	mul	x,a
3957  0c29 01            	rrwa	x,a
3958  0c2a 1b01          	add	a,(OFST-1,sp)
3959  0c2c 2401          	jrnc	L421
3960  0c2e 5c            	incw	x
3961  0c2f               L421:
3962  0c2f 02            	rlwa	x,a
3963  0c30 7b02          	ld	a,(OFST+0,sp)
3964  0c32 d70000        	ld	(_PCD8544_buffer,x),a
3965                     ; 505     PCD8544_set_cursor(x_pos, row);
3967  0c35 7b01          	ld	a,(OFST-1,sp)
3968  0c37 97            	ld	xl,a
3969  0c38 7b03          	ld	a,(OFST+1,sp)
3970  0c3a 95            	ld	xh,a
3971  0c3b 8d2b012b      	callf	f_PCD8544_set_cursor
3973                     ; 506     PCD8544_write(DAT, value);
3975  0c3f 7b02          	ld	a,(OFST+0,sp)
3976  0c41 ae0100        	ldw	x,#256
3977  0c44 97            	ld	xl,a
3978  0c45 8d200020      	callf	f_PCD8544_write
3980                     ; 507 }
3981  0c49               L621:
3984  0c49 5b04          	addw	sp,#4
3985  0c4b 87            	retf
4080                     ; 510 void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char colour)
4080                     ; 511 {
4081                     	switch	.text
4082  0c4c               f_Draw_Line:
4084  0c4c 89            	pushw	x
4085  0c4d 520c          	subw	sp,#12
4086       0000000c      OFST:	set	12
4089                     ; 512     signed int dx = 0x0000;
4091                     ; 513     signed int dy = 0x0000;
4093                     ; 514     signed int stepx = 0x0000;
4095                     ; 515     signed int stepy = 0x0000;
4097                     ; 516     signed int fraction = 0x0000;
4099                     ; 518     dy = (y2 - y1);
4101  0c4f 1e16          	ldw	x,(OFST+10,sp)
4102  0c51 72f012        	subw	x,(OFST+6,sp)
4103  0c54 1f09          	ldw	(OFST-3,sp),x
4105                     ; 519     dx = (x2 - x1);
4107  0c56 1e14          	ldw	x,(OFST+8,sp)
4108  0c58 72f00d        	subw	x,(OFST+1,sp)
4109  0c5b 1f07          	ldw	(OFST-5,sp),x
4111                     ; 521     if (dy < 0)
4113  0c5d 9c            	rvf
4114  0c5e 1e09          	ldw	x,(OFST-3,sp)
4115  0c60 2e0c          	jrsge	L1401
4116                     ; 523         dy = -dy;
4118  0c62 1e09          	ldw	x,(OFST-3,sp)
4119  0c64 50            	negw	x
4120  0c65 1f09          	ldw	(OFST-3,sp),x
4122                     ; 524         stepy = -1;
4124  0c67 aeffff        	ldw	x,#65535
4125  0c6a 1f05          	ldw	(OFST-7,sp),x
4128  0c6c 2005          	jra	L3401
4129  0c6e               L1401:
4130                     ; 528         stepy = 1;
4132  0c6e ae0001        	ldw	x,#1
4133  0c71 1f05          	ldw	(OFST-7,sp),x
4135  0c73               L3401:
4136                     ; 531     if (dx < 0)
4138  0c73 9c            	rvf
4139  0c74 1e07          	ldw	x,(OFST-5,sp)
4140  0c76 2e0c          	jrsge	L5401
4141                     ; 533         dx = -dx;
4143  0c78 1e07          	ldw	x,(OFST-5,sp)
4144  0c7a 50            	negw	x
4145  0c7b 1f07          	ldw	(OFST-5,sp),x
4147                     ; 534         stepx = -1;
4149  0c7d aeffff        	ldw	x,#65535
4150  0c80 1f03          	ldw	(OFST-9,sp),x
4153  0c82 2005          	jra	L7401
4154  0c84               L5401:
4155                     ; 538         stepx = 1;
4157  0c84 ae0001        	ldw	x,#1
4158  0c87 1f03          	ldw	(OFST-9,sp),x
4160  0c89               L7401:
4161                     ; 541     dx <<= 0x01;
4163  0c89 0808          	sll	(OFST-4,sp)
4164  0c8b 0907          	rlc	(OFST-5,sp)
4166                     ; 542     dy <<= 0x01;
4168  0c8d 080a          	sll	(OFST-2,sp)
4169  0c8f 0909          	rlc	(OFST-3,sp)
4171                     ; 544     Draw_Pixel(x1, y1, colour);
4173  0c91 7b18          	ld	a,(OFST+12,sp)
4174  0c93 88            	push	a
4175  0c94 7b14          	ld	a,(OFST+8,sp)
4176  0c96 97            	ld	xl,a
4177  0c97 7b0f          	ld	a,(OFST+3,sp)
4178  0c99 95            	ld	xh,a
4179  0c9a 8dac0bac      	callf	f_Draw_Pixel
4181  0c9e 84            	pop	a
4182                     ; 546     if (dx > dy)
4184  0c9f 9c            	rvf
4185  0ca0 1e07          	ldw	x,(OFST-5,sp)
4186  0ca2 1309          	cpw	x,(OFST-3,sp)
4187  0ca4 2d46          	jrsle	L1501
4188                     ; 548         fraction = (dy - (dx >> 1));
4190  0ca6 1e07          	ldw	x,(OFST-5,sp)
4191  0ca8 57            	sraw	x
4192  0ca9 1f01          	ldw	(OFST-11,sp),x
4194  0cab 1e09          	ldw	x,(OFST-3,sp)
4195  0cad 72f001        	subw	x,(OFST-11,sp)
4196  0cb0 1f0b          	ldw	(OFST-1,sp),x
4199  0cb2 202f          	jra	L7501
4200  0cb4               L3501:
4201                     ; 551             if (fraction >= 0)
4203  0cb4 9c            	rvf
4204  0cb5 1e0b          	ldw	x,(OFST-1,sp)
4205  0cb7 2f0e          	jrslt	L3601
4206                     ; 553                 y1 += stepy;
4208  0cb9 1e12          	ldw	x,(OFST+6,sp)
4209  0cbb 72fb05        	addw	x,(OFST-7,sp)
4210  0cbe 1f12          	ldw	(OFST+6,sp),x
4211                     ; 554                 fraction -= dx;
4213  0cc0 1e0b          	ldw	x,(OFST-1,sp)
4214  0cc2 72f007        	subw	x,(OFST-5,sp)
4215  0cc5 1f0b          	ldw	(OFST-1,sp),x
4217  0cc7               L3601:
4218                     ; 556             x1 += stepx;
4220  0cc7 1e0d          	ldw	x,(OFST+1,sp)
4221  0cc9 72fb03        	addw	x,(OFST-9,sp)
4222  0ccc 1f0d          	ldw	(OFST+1,sp),x
4223                     ; 557             fraction += dy;
4225  0cce 1e0b          	ldw	x,(OFST-1,sp)
4226  0cd0 72fb09        	addw	x,(OFST-3,sp)
4227  0cd3 1f0b          	ldw	(OFST-1,sp),x
4229                     ; 559             Draw_Pixel(x1, y1, colour);
4231  0cd5 7b18          	ld	a,(OFST+12,sp)
4232  0cd7 88            	push	a
4233  0cd8 7b14          	ld	a,(OFST+8,sp)
4234  0cda 97            	ld	xl,a
4235  0cdb 7b0f          	ld	a,(OFST+3,sp)
4236  0cdd 95            	ld	xh,a
4237  0cde 8dac0bac      	callf	f_Draw_Pixel
4239  0ce2 84            	pop	a
4240  0ce3               L7501:
4241                     ; 549         while (x1 != x2)
4243  0ce3 1e0d          	ldw	x,(OFST+1,sp)
4244  0ce5 1314          	cpw	x,(OFST+8,sp)
4245  0ce7 26cb          	jrne	L3501
4247  0ce9               L5601:
4248                     ; 578 }
4251  0ce9 5b0e          	addw	sp,#14
4252  0ceb 87            	retf
4253  0cec               L1501:
4254                     ; 564         fraction = (dx - (dy >> 1));
4256  0cec 1e09          	ldw	x,(OFST-3,sp)
4257  0cee 57            	sraw	x
4258  0cef 1f01          	ldw	(OFST-11,sp),x
4260  0cf1 1e07          	ldw	x,(OFST-5,sp)
4261  0cf3 72f001        	subw	x,(OFST-11,sp)
4262  0cf6 1f0b          	ldw	(OFST-1,sp),x
4265  0cf8 202f          	jra	L3701
4266  0cfa               L7601:
4267                     ; 568             if (fraction >= 0)
4269  0cfa 9c            	rvf
4270  0cfb 1e0b          	ldw	x,(OFST-1,sp)
4271  0cfd 2f0e          	jrslt	L7701
4272                     ; 570                 x1 += stepx;
4274  0cff 1e0d          	ldw	x,(OFST+1,sp)
4275  0d01 72fb03        	addw	x,(OFST-9,sp)
4276  0d04 1f0d          	ldw	(OFST+1,sp),x
4277                     ; 571                 fraction -= dy;
4279  0d06 1e0b          	ldw	x,(OFST-1,sp)
4280  0d08 72f009        	subw	x,(OFST-3,sp)
4281  0d0b 1f0b          	ldw	(OFST-1,sp),x
4283  0d0d               L7701:
4284                     ; 573             y1 += stepy;
4286  0d0d 1e12          	ldw	x,(OFST+6,sp)
4287  0d0f 72fb05        	addw	x,(OFST-7,sp)
4288  0d12 1f12          	ldw	(OFST+6,sp),x
4289                     ; 574             fraction += dx;
4291  0d14 1e0b          	ldw	x,(OFST-1,sp)
4292  0d16 72fb07        	addw	x,(OFST-5,sp)
4293  0d19 1f0b          	ldw	(OFST-1,sp),x
4295                     ; 575             Draw_Pixel(x1, y1, colour);
4297  0d1b 7b18          	ld	a,(OFST+12,sp)
4298  0d1d 88            	push	a
4299  0d1e 7b14          	ld	a,(OFST+8,sp)
4300  0d20 97            	ld	xl,a
4301  0d21 7b0f          	ld	a,(OFST+3,sp)
4302  0d23 95            	ld	xh,a
4303  0d24 8dac0bac      	callf	f_Draw_Pixel
4305  0d28 84            	pop	a
4306  0d29               L3701:
4307                     ; 566         while (y1 != y2)
4309  0d29 1e12          	ldw	x,(OFST+6,sp)
4310  0d2b 1316          	cpw	x,(OFST+10,sp)
4311  0d2d 26cb          	jrne	L7601
4312  0d2f 20b8          	jra	L5601
4415                     ; 581 void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char colour)
4415                     ; 582 {
4416                     	switch	.text
4417  0d31               f_Draw_Rectangle:
4419  0d31 89            	pushw	x
4420  0d32 5205          	subw	sp,#5
4421       00000005      OFST:	set	5
4424                     ; 583      unsigned char i = 0x00;
4426                     ; 584      unsigned char xmin = 0x00;
4428                     ; 585      unsigned char xmax = 0x00;
4430                     ; 586      unsigned char ymin = 0x00;
4432                     ; 587      unsigned char ymax = 0x00;
4434                     ; 589      if(fill != NO)
4436  0d34 0d11          	tnz	(OFST+12,sp)
4437  0d36 2757          	jreq	L1411
4438                     ; 591         if(x1 < x2)
4440  0d38 9c            	rvf
4441  0d39 130d          	cpw	x,(OFST+8,sp)
4442  0d3b 2e09          	jrsge	L3411
4443                     ; 593            xmin = x1;
4445  0d3d 9f            	ld	a,xl
4446  0d3e 6b04          	ld	(OFST-1,sp),a
4448                     ; 594            xmax = x2;
4450  0d40 7b0e          	ld	a,(OFST+9,sp)
4451  0d42 6b01          	ld	(OFST-4,sp),a
4454  0d44 2008          	jra	L5411
4455  0d46               L3411:
4456                     ; 598            xmin = x2;
4458  0d46 7b0e          	ld	a,(OFST+9,sp)
4459  0d48 6b04          	ld	(OFST-1,sp),a
4461                     ; 599            xmax = x1;
4463  0d4a 7b07          	ld	a,(OFST+2,sp)
4464  0d4c 6b01          	ld	(OFST-4,sp),a
4466  0d4e               L5411:
4467                     ; 602         if(y1 < y2)
4469  0d4e 9c            	rvf
4470  0d4f 1e0b          	ldw	x,(OFST+6,sp)
4471  0d51 130f          	cpw	x,(OFST+10,sp)
4472  0d53 2e0a          	jrsge	L7411
4473                     ; 604            ymin = y1;
4475  0d55 7b0c          	ld	a,(OFST+7,sp)
4476  0d57 6b02          	ld	(OFST-3,sp),a
4478                     ; 605            ymax = y2;
4480  0d59 7b10          	ld	a,(OFST+11,sp)
4481  0d5b 6b03          	ld	(OFST-2,sp),a
4484  0d5d 2028          	jra	L7511
4485  0d5f               L7411:
4486                     ; 609            ymin = y2;
4488  0d5f 7b10          	ld	a,(OFST+11,sp)
4489  0d61 6b02          	ld	(OFST-3,sp),a
4491                     ; 610            ymax = y1;
4493  0d63 7b0c          	ld	a,(OFST+7,sp)
4494  0d65 6b03          	ld	(OFST-2,sp),a
4496  0d67 201e          	jra	L7511
4497  0d69               L3511:
4498                     ; 615              for(i = ymin; i <= ymax; ++i)
4500  0d69 7b02          	ld	a,(OFST-3,sp)
4501  0d6b 6b05          	ld	(OFST+0,sp),a
4504  0d6d 2010          	jra	L7611
4505  0d6f               L3611:
4506                     ; 617                  Draw_Pixel(xmin, i, colour);
4508  0d6f 7b12          	ld	a,(OFST+13,sp)
4509  0d71 88            	push	a
4510  0d72 7b06          	ld	a,(OFST+1,sp)
4511  0d74 97            	ld	xl,a
4512  0d75 7b05          	ld	a,(OFST+0,sp)
4513  0d77 95            	ld	xh,a
4514  0d78 8dac0bac      	callf	f_Draw_Pixel
4516  0d7c 84            	pop	a
4517                     ; 615              for(i = ymin; i <= ymax; ++i)
4519  0d7d 0c05          	inc	(OFST+0,sp)
4521  0d7f               L7611:
4524  0d7f 7b05          	ld	a,(OFST+0,sp)
4525  0d81 1103          	cp	a,(OFST-2,sp)
4526  0d83 23ea          	jrule	L3611
4527                     ; 613         for(; xmin <= xmax; ++xmin)
4529  0d85 0c04          	inc	(OFST-1,sp)
4531  0d87               L7511:
4534  0d87 7b04          	ld	a,(OFST-1,sp)
4535  0d89 1101          	cp	a,(OFST-4,sp)
4536  0d8b 23dc          	jrule	L3511
4538  0d8d 2050          	jra	L3711
4539  0d8f               L1411:
4540                     ; 624         Draw_Line(x1, y1, x2, y1, colour);
4542  0d8f 7b12          	ld	a,(OFST+13,sp)
4543  0d91 88            	push	a
4544  0d92 1e0c          	ldw	x,(OFST+7,sp)
4545  0d94 89            	pushw	x
4546  0d95 1e10          	ldw	x,(OFST+11,sp)
4547  0d97 89            	pushw	x
4548  0d98 1e10          	ldw	x,(OFST+11,sp)
4549  0d9a 89            	pushw	x
4550  0d9b 1e0d          	ldw	x,(OFST+8,sp)
4551  0d9d 8d4c0c4c      	callf	f_Draw_Line
4553  0da1 5b07          	addw	sp,#7
4554                     ; 625         Draw_Line(x1, y2, x2, y2, colour);
4556  0da3 7b12          	ld	a,(OFST+13,sp)
4557  0da5 88            	push	a
4558  0da6 1e10          	ldw	x,(OFST+11,sp)
4559  0da8 89            	pushw	x
4560  0da9 1e10          	ldw	x,(OFST+11,sp)
4561  0dab 89            	pushw	x
4562  0dac 1e14          	ldw	x,(OFST+15,sp)
4563  0dae 89            	pushw	x
4564  0daf 1e0d          	ldw	x,(OFST+8,sp)
4565  0db1 8d4c0c4c      	callf	f_Draw_Line
4567  0db5 5b07          	addw	sp,#7
4568                     ; 626         Draw_Line(x1, y1, x1, y2, colour);
4570  0db7 7b12          	ld	a,(OFST+13,sp)
4571  0db9 88            	push	a
4572  0dba 1e10          	ldw	x,(OFST+11,sp)
4573  0dbc 89            	pushw	x
4574  0dbd 1e09          	ldw	x,(OFST+4,sp)
4575  0dbf 89            	pushw	x
4576  0dc0 1e10          	ldw	x,(OFST+11,sp)
4577  0dc2 89            	pushw	x
4578  0dc3 1e0d          	ldw	x,(OFST+8,sp)
4579  0dc5 8d4c0c4c      	callf	f_Draw_Line
4581  0dc9 5b07          	addw	sp,#7
4582                     ; 627         Draw_Line(x2, y1, x2, y2, colour);
4584  0dcb 7b12          	ld	a,(OFST+13,sp)
4585  0dcd 88            	push	a
4586  0dce 1e10          	ldw	x,(OFST+11,sp)
4587  0dd0 89            	pushw	x
4588  0dd1 1e10          	ldw	x,(OFST+11,sp)
4589  0dd3 89            	pushw	x
4590  0dd4 1e10          	ldw	x,(OFST+11,sp)
4591  0dd6 89            	pushw	x
4592  0dd7 1e14          	ldw	x,(OFST+15,sp)
4593  0dd9 8d4c0c4c      	callf	f_Draw_Line
4595  0ddd 5b07          	addw	sp,#7
4596  0ddf               L3711:
4597                     ; 629 }
4600  0ddf 5b07          	addw	sp,#7
4601  0de1 87            	retf
4683                     ; 632 void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned char colour)
4683                     ; 633 {
4684                     	switch	.text
4685  0de2               f_Draw_Circle:
4687  0de2 89            	pushw	x
4688  0de3 5208          	subw	sp,#8
4689       00000008      OFST:	set	8
4692                     ; 634     signed int a = 0x0000;
4694  0de5 5f            	clrw	x
4695  0de6 1f07          	ldw	(OFST-1,sp),x
4697                     ; 635     signed int b = 0x0000;
4699                     ; 636     signed int p = 0x0000;
4701                     ; 638     b = radius;
4703  0de8 1e10          	ldw	x,(OFST+8,sp)
4704  0dea 1f05          	ldw	(OFST-3,sp),x
4706                     ; 639     p = (1 - b);
4708  0dec ae0001        	ldw	x,#1
4709  0def 72f005        	subw	x,(OFST-3,sp)
4710  0df2 1f03          	ldw	(OFST-5,sp),x
4712  0df4               L7221:
4713                     ; 643         if(fill != NO)
4715  0df4 0d12          	tnz	(OFST+10,sp)
4716  0df6 2604ac800e80  	jreq	L5321
4717                     ; 645             Draw_Line((xc - a), (yc + b), (xc + a), (yc + b), colour);
4719  0dfc 7b13          	ld	a,(OFST+11,sp)
4720  0dfe 88            	push	a
4721  0dff 1e0f          	ldw	x,(OFST+7,sp)
4722  0e01 72fb06        	addw	x,(OFST-2,sp)
4723  0e04 89            	pushw	x
4724  0e05 1e0c          	ldw	x,(OFST+4,sp)
4725  0e07 72fb0a        	addw	x,(OFST+2,sp)
4726  0e0a 89            	pushw	x
4727  0e0b 1e13          	ldw	x,(OFST+11,sp)
4728  0e0d 72fb0a        	addw	x,(OFST+2,sp)
4729  0e10 89            	pushw	x
4730  0e11 1e10          	ldw	x,(OFST+8,sp)
4731  0e13 72f00e        	subw	x,(OFST+6,sp)
4732  0e16 8d4c0c4c      	callf	f_Draw_Line
4734  0e1a 5b07          	addw	sp,#7
4735                     ; 646             Draw_Line((xc - a), (yc - b), (xc + a), (yc - b), colour);
4737  0e1c 7b13          	ld	a,(OFST+11,sp)
4738  0e1e 88            	push	a
4739  0e1f 1e0f          	ldw	x,(OFST+7,sp)
4740  0e21 72f006        	subw	x,(OFST-2,sp)
4741  0e24 89            	pushw	x
4742  0e25 1e0c          	ldw	x,(OFST+4,sp)
4743  0e27 72fb0a        	addw	x,(OFST+2,sp)
4744  0e2a 89            	pushw	x
4745  0e2b 1e13          	ldw	x,(OFST+11,sp)
4746  0e2d 72f00a        	subw	x,(OFST+2,sp)
4747  0e30 89            	pushw	x
4748  0e31 1e10          	ldw	x,(OFST+8,sp)
4749  0e33 72f00e        	subw	x,(OFST+6,sp)
4750  0e36 8d4c0c4c      	callf	f_Draw_Line
4752  0e3a 5b07          	addw	sp,#7
4753                     ; 647             Draw_Line((xc - b), (yc + a), (xc + b), (yc + a), colour);
4755  0e3c 7b13          	ld	a,(OFST+11,sp)
4756  0e3e 88            	push	a
4757  0e3f 1e0f          	ldw	x,(OFST+7,sp)
4758  0e41 72fb08        	addw	x,(OFST+0,sp)
4759  0e44 89            	pushw	x
4760  0e45 1e0c          	ldw	x,(OFST+4,sp)
4761  0e47 72fb08        	addw	x,(OFST+0,sp)
4762  0e4a 89            	pushw	x
4763  0e4b 1e13          	ldw	x,(OFST+11,sp)
4764  0e4d 72fb0c        	addw	x,(OFST+4,sp)
4765  0e50 89            	pushw	x
4766  0e51 1e10          	ldw	x,(OFST+8,sp)
4767  0e53 72f00c        	subw	x,(OFST+4,sp)
4768  0e56 8d4c0c4c      	callf	f_Draw_Line
4770  0e5a 5b07          	addw	sp,#7
4771                     ; 648             Draw_Line((xc - b), (yc - a), (xc + b), (yc - a), colour);
4773  0e5c 7b13          	ld	a,(OFST+11,sp)
4774  0e5e 88            	push	a
4775  0e5f 1e0f          	ldw	x,(OFST+7,sp)
4776  0e61 72f008        	subw	x,(OFST+0,sp)
4777  0e64 89            	pushw	x
4778  0e65 1e0c          	ldw	x,(OFST+4,sp)
4779  0e67 72fb08        	addw	x,(OFST+0,sp)
4780  0e6a 89            	pushw	x
4781  0e6b 1e13          	ldw	x,(OFST+11,sp)
4782  0e6d 72f00c        	subw	x,(OFST+4,sp)
4783  0e70 89            	pushw	x
4784  0e71 1e10          	ldw	x,(OFST+8,sp)
4785  0e73 72f00c        	subw	x,(OFST+4,sp)
4786  0e76 8d4c0c4c      	callf	f_Draw_Line
4788  0e7a 5b07          	addw	sp,#7
4790  0e7c ac100f10      	jpf	L7321
4791  0e80               L5321:
4792                     ; 652             Draw_Pixel((xc + a), (yc + b), colour);
4794  0e80 7b13          	ld	a,(OFST+11,sp)
4795  0e82 88            	push	a
4796  0e83 7b07          	ld	a,(OFST-1,sp)
4797  0e85 1b10          	add	a,(OFST+8,sp)
4798  0e87 97            	ld	xl,a
4799  0e88 7b09          	ld	a,(OFST+1,sp)
4800  0e8a 1b0b          	add	a,(OFST+3,sp)
4801  0e8c 95            	ld	xh,a
4802  0e8d 8dac0bac      	callf	f_Draw_Pixel
4804  0e91 84            	pop	a
4805                     ; 653             Draw_Pixel((xc + b), (yc + a), colour);
4807  0e92 7b13          	ld	a,(OFST+11,sp)
4808  0e94 88            	push	a
4809  0e95 7b09          	ld	a,(OFST+1,sp)
4810  0e97 1b10          	add	a,(OFST+8,sp)
4811  0e99 97            	ld	xl,a
4812  0e9a 7b07          	ld	a,(OFST-1,sp)
4813  0e9c 1b0b          	add	a,(OFST+3,sp)
4814  0e9e 95            	ld	xh,a
4815  0e9f 8dac0bac      	callf	f_Draw_Pixel
4817  0ea3 84            	pop	a
4818                     ; 654             Draw_Pixel((xc - a), (yc + b), colour);
4820  0ea4 7b13          	ld	a,(OFST+11,sp)
4821  0ea6 88            	push	a
4822  0ea7 7b07          	ld	a,(OFST-1,sp)
4823  0ea9 1b10          	add	a,(OFST+8,sp)
4824  0eab 97            	ld	xl,a
4825  0eac 7b0b          	ld	a,(OFST+3,sp)
4826  0eae 1009          	sub	a,(OFST+1,sp)
4827  0eb0 95            	ld	xh,a
4828  0eb1 8dac0bac      	callf	f_Draw_Pixel
4830  0eb5 84            	pop	a
4831                     ; 655             Draw_Pixel((xc - b), (yc + a), colour);
4833  0eb6 7b13          	ld	a,(OFST+11,sp)
4834  0eb8 88            	push	a
4835  0eb9 7b09          	ld	a,(OFST+1,sp)
4836  0ebb 1b10          	add	a,(OFST+8,sp)
4837  0ebd 97            	ld	xl,a
4838  0ebe 7b0b          	ld	a,(OFST+3,sp)
4839  0ec0 1007          	sub	a,(OFST-1,sp)
4840  0ec2 95            	ld	xh,a
4841  0ec3 8dac0bac      	callf	f_Draw_Pixel
4843  0ec7 84            	pop	a
4844                     ; 656             Draw_Pixel((xc + b), (yc - a), colour);
4846  0ec8 7b13          	ld	a,(OFST+11,sp)
4847  0eca 88            	push	a
4848  0ecb 7b10          	ld	a,(OFST+8,sp)
4849  0ecd 1009          	sub	a,(OFST+1,sp)
4850  0ecf 97            	ld	xl,a
4851  0ed0 7b07          	ld	a,(OFST-1,sp)
4852  0ed2 1b0b          	add	a,(OFST+3,sp)
4853  0ed4 95            	ld	xh,a
4854  0ed5 8dac0bac      	callf	f_Draw_Pixel
4856  0ed9 84            	pop	a
4857                     ; 657             Draw_Pixel((xc + a), (yc - b), colour);
4859  0eda 7b13          	ld	a,(OFST+11,sp)
4860  0edc 88            	push	a
4861  0edd 7b10          	ld	a,(OFST+8,sp)
4862  0edf 1007          	sub	a,(OFST-1,sp)
4863  0ee1 97            	ld	xl,a
4864  0ee2 7b09          	ld	a,(OFST+1,sp)
4865  0ee4 1b0b          	add	a,(OFST+3,sp)
4866  0ee6 95            	ld	xh,a
4867  0ee7 8dac0bac      	callf	f_Draw_Pixel
4869  0eeb 84            	pop	a
4870                     ; 658             Draw_Pixel((xc - a), (yc - b), colour);
4872  0eec 7b13          	ld	a,(OFST+11,sp)
4873  0eee 88            	push	a
4874  0eef 7b10          	ld	a,(OFST+8,sp)
4875  0ef1 1007          	sub	a,(OFST-1,sp)
4876  0ef3 97            	ld	xl,a
4877  0ef4 7b0b          	ld	a,(OFST+3,sp)
4878  0ef6 1009          	sub	a,(OFST+1,sp)
4879  0ef8 95            	ld	xh,a
4880  0ef9 8dac0bac      	callf	f_Draw_Pixel
4882  0efd 84            	pop	a
4883                     ; 659             Draw_Pixel((xc - b), (yc - a), colour);
4885  0efe 7b13          	ld	a,(OFST+11,sp)
4886  0f00 88            	push	a
4887  0f01 7b10          	ld	a,(OFST+8,sp)
4888  0f03 1009          	sub	a,(OFST+1,sp)
4889  0f05 97            	ld	xl,a
4890  0f06 7b0b          	ld	a,(OFST+3,sp)
4891  0f08 1007          	sub	a,(OFST-1,sp)
4892  0f0a 95            	ld	xh,a
4893  0f0b 8dac0bac      	callf	f_Draw_Pixel
4895  0f0f 84            	pop	a
4896  0f10               L7321:
4897                     ; 662         if(p < 0)
4899  0f10 9c            	rvf
4900  0f11 1e03          	ldw	x,(OFST-5,sp)
4901  0f13 2e15          	jrsge	L1421
4902                     ; 664             p += (0x03 + (0x02 * a++));
4904  0f15 1e07          	ldw	x,(OFST-1,sp)
4905  0f17 1c0001        	addw	x,#1
4906  0f1a 1f07          	ldw	(OFST-1,sp),x
4907  0f1c 1d0001        	subw	x,#1
4909  0f1f 58            	sllw	x
4910  0f20 1c0003        	addw	x,#3
4911  0f23 72fb03        	addw	x,(OFST-5,sp)
4912  0f26 1f03          	ldw	(OFST-5,sp),x
4915  0f28 2022          	jra	L1321
4916  0f2a               L1421:
4917                     ; 668             p += (0x05 + (0x02 * ((a++) - (b--))));
4919  0f2a 1e05          	ldw	x,(OFST-3,sp)
4920  0f2c 1d0001        	subw	x,#1
4921  0f2f 1f05          	ldw	(OFST-3,sp),x
4922  0f31 1c0001        	addw	x,#1
4924  0f34 1f01          	ldw	(OFST-7,sp),x
4926  0f36 1e07          	ldw	x,(OFST-1,sp)
4927  0f38 1c0001        	addw	x,#1
4928  0f3b 1f07          	ldw	(OFST-1,sp),x
4929  0f3d 1d0001        	subw	x,#1
4931  0f40 72f001        	subw	x,(OFST-7,sp)
4932  0f43 58            	sllw	x
4933  0f44 1c0005        	addw	x,#5
4934  0f47 72fb03        	addw	x,(OFST-5,sp)
4935  0f4a 1f03          	ldw	(OFST-5,sp),x
4937  0f4c               L1321:
4938                     ; 670     }while(a <= b);
4940  0f4c 9c            	rvf
4941  0f4d 1e07          	ldw	x,(OFST-1,sp)
4942  0f4f 1305          	cpw	x,(OFST-3,sp)
4943  0f51 2c04          	jrsgt	L631
4944  0f53 acf40df4      	jpf	L7221
4945  0f57               L631:
4946                     ; 671 }
4949  0f57 5b0a          	addw	sp,#10
4950  0f59 87            	retf
4962                     	xref	_PCD8544_buffer
4963                     	xdef	f_Draw_Circle
4964                     	xdef	f_Draw_Rectangle
4965                     	xdef	f_Draw_Line
4966                     	xdef	f_Draw_Pixel
4967                     	xdef	f_print_float
4968                     	xdef	f_print_decimal
4969                     	xdef	f_print_int
4970                     	xdef	f_print_chr
4971                     	xdef	f_PCD8544_print_string
4972                     	xdef	f_PCD8544_print_image
4973                     	xdef	f_PCD8544_clear_screen
4974                     	xdef	f_PCD8544_clear_buffer
4975                     	xdef	f_PCD8544_fill
4976                     	xdef	f_PCD8544_print_custom_char
4977                     	xdef	f_PCD8544_print_char
4978                     	xdef	f_PCD8544_set_cursor
4979                     	xdef	f_PCD8544_set_contrast
4980                     	xdef	f_PCD8544_backlight_state
4981                     	xdef	f_PCD8544_init
4982                     	xdef	f_PCD8544_reset
4983                     	xdef	f_PCD8544_write
4984                     	xdef	f_setup_GLCD_GPIOs
4985                     	xref	f_delay_ms
4986                     	xref	f_delay_us
4987                     	xref	f_GPIO_WriteLow
4988                     	xref	f_GPIO_WriteHigh
4989                     	xref	f_GPIO_Init
4990                     	switch	.const
4991  01f0               L507:
4992  01f0 461c4000      	dc.w	17948,16384
4993  01f4               L714:
4994  01f4 2000          	dc.b	" ",0
4995                     	xref.b	c_lreg
4996                     	xref.b	c_x
5016                     	xref	d_ctof
5017                     	xref	d_fcmp
5018                     	xref	d_itof
5019                     	xref	d_fmul
5020                     	xref	d_fsub
5021                     	xref	d_ltof
5022                     	xref	d_rtol
5023                     	xref	d_ftol
5024                     	xref	d_lmod
5025                     	xref	d_ldiv
5026                     	xref	d_lcmp
5027                     	xref	d_ltor
5028                     	xref	d_lgneg
5029                     	xref	d_smodx
5030                     	xref	d_sdivx
5031                     	end
