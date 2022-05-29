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
 527                     	switch	.const
 528  01e0               L12_txt1:
 529  01e0 4d6963726f41  	dc.b	"MicroArena",0
 530  01eb               L32_txt2:
 531  01eb 535348414852  	dc.b	"SSHAHRYIAR",0
 625                     ; 12 void main(void)
 625                     ; 13 {
 626                     	switch	.text
 627  0000               f_main:
 629  0000 521e          	subw	sp,#30
 630       0000001e      OFST:	set	30
 633                     ; 14      unsigned char g = 0;
 635                     ; 15      const unsigned char txt1[11] = {"MicroArena"};
 637  0002 96            	ldw	x,sp
 638  0003 1c0001        	addw	x,#OFST-29
 639  0006 90ae01e0      	ldw	y,#L12_txt1
 640  000a a60b          	ld	a,#11
 641  000c 8d000000      	callf	d_xymvx
 643                     ; 16      const unsigned char txt2[11] = {"SSHAHRYIAR"};
 645  0010 96            	ldw	x,sp
 646  0011 1c000c        	addw	x,#OFST-18
 647  0014 90ae01eb      	ldw	y,#L32_txt2
 648  0018 a60b          	ld	a,#11
 649  001a 8d000000      	callf	d_xymvx
 651                     ; 18      signed char c = -9;
 653  001e a6f7          	ld	a,#247
 654  0020 6b17          	ld	(OFST-7,sp),a
 656                     ; 19      signed int i = -66;
 658  0022 aeffbe        	ldw	x,#65470
 659  0025 1f18          	ldw	(OFST-6,sp),x
 661                     ; 20      float f = -0.04;
 663  0027 ce020b        	ldw	x,L17+2
 664  002a 1f1c          	ldw	(OFST-2,sp),x
 665  002c ce0209        	ldw	x,L17
 666  002f 1f1a          	ldw	(OFST-4,sp),x
 668                     ; 22      setup_clock();
 670  0031 8daa02aa      	callf	f_setup_clock
 672                     ; 23 	 setup_GPIOs();
 674  0035 8d2e032e      	callf	f_setup_GPIOs
 676                     ; 24 	 PCD8544_init();
 678  0039 8d000000      	callf	f_PCD8544_init
 680                     ; 26      PCD8544_backlight_state(ON);
 682  003d a601          	ld	a,#1
 683  003f 8d000000      	callf	f_PCD8544_backlight_state
 685                     ; 27   	 delay_ms(1000);
 687  0043 ae03e8        	ldw	x,#1000
 688  0046 8d000000      	callf	f_delay_ms
 690                     ; 28      PCD8544_backlight_state(OFF);
 692  004a 4f            	clr	a
 693  004b 8d000000      	callf	f_PCD8544_backlight_state
 695                     ; 29      delay_ms(1000);
 697  004f ae03e8        	ldw	x,#1000
 698  0052 8d000000      	callf	f_delay_ms
 700                     ; 31      PCD8544_clear_screen(WHITE);
 702  0056 a601          	ld	a,#1
 703  0058 8d000000      	callf	f_PCD8544_clear_screen
 705                     ; 33      PCD8544_backlight_state(ON);
 707  005c a601          	ld	a,#1
 708  005e 8d000000      	callf	f_PCD8544_backlight_state
 710                     ; 34      Draw_Rectangle(2, 2, 81, 45, OFF, BLACK);
 712  0062 4b00          	push	#0
 713  0064 4b00          	push	#0
 714  0066 ae002d        	ldw	x,#45
 715  0069 89            	pushw	x
 716  006a ae0051        	ldw	x,#81
 717  006d 89            	pushw	x
 718  006e ae0002        	ldw	x,#2
 719  0071 89            	pushw	x
 720  0072 ae0002        	ldw	x,#2
 721  0075 8d000000      	callf	f_Draw_Rectangle
 723  0079 5b08          	addw	sp,#8
 724                     ; 35      delay_ms(200);
 726  007b ae00c8        	ldw	x,#200
 727  007e 8d000000      	callf	f_delay_ms
 729                     ; 37      Draw_Circle(6, 6, 2, ON, BLACK);
 731  0082 4b00          	push	#0
 732  0084 4b01          	push	#1
 733  0086 ae0002        	ldw	x,#2
 734  0089 89            	pushw	x
 735  008a ae0006        	ldw	x,#6
 736  008d 89            	pushw	x
 737  008e ae0006        	ldw	x,#6
 738  0091 8d000000      	callf	f_Draw_Circle
 740  0095 5b06          	addw	sp,#6
 741                     ; 38      delay_ms(200);
 743  0097 ae00c8        	ldw	x,#200
 744  009a 8d000000      	callf	f_delay_ms
 746                     ; 39      Draw_Circle(77, 6, 2, ON, BLACK);
 748  009e 4b00          	push	#0
 749  00a0 4b01          	push	#1
 750  00a2 ae0002        	ldw	x,#2
 751  00a5 89            	pushw	x
 752  00a6 ae0006        	ldw	x,#6
 753  00a9 89            	pushw	x
 754  00aa ae004d        	ldw	x,#77
 755  00ad 8d000000      	callf	f_Draw_Circle
 757  00b1 5b06          	addw	sp,#6
 758                     ; 40      delay_ms(200);
 760  00b3 ae00c8        	ldw	x,#200
 761  00b6 8d000000      	callf	f_delay_ms
 763                     ; 41      Draw_Circle(77, 41, 2, ON, BLACK);
 765  00ba 4b00          	push	#0
 766  00bc 4b01          	push	#1
 767  00be ae0002        	ldw	x,#2
 768  00c1 89            	pushw	x
 769  00c2 ae0029        	ldw	x,#41
 770  00c5 89            	pushw	x
 771  00c6 ae004d        	ldw	x,#77
 772  00c9 8d000000      	callf	f_Draw_Circle
 774  00cd 5b06          	addw	sp,#6
 775                     ; 42      delay_ms(200);
 777  00cf ae00c8        	ldw	x,#200
 778  00d2 8d000000      	callf	f_delay_ms
 780                     ; 43      Draw_Circle(6, 41, 2, ON, BLACK);
 782  00d6 4b00          	push	#0
 783  00d8 4b01          	push	#1
 784  00da ae0002        	ldw	x,#2
 785  00dd 89            	pushw	x
 786  00de ae0029        	ldw	x,#41
 787  00e1 89            	pushw	x
 788  00e2 ae0006        	ldw	x,#6
 789  00e5 8d000000      	callf	f_Draw_Circle
 791  00e9 5b06          	addw	sp,#6
 792                     ; 44      delay_ms(200);
 794  00eb ae00c8        	ldw	x,#200
 795  00ee 8d000000      	callf	f_delay_ms
 797                     ; 46      Draw_Line(2, 11, 10, 11, BLACK);
 799  00f2 4b00          	push	#0
 800  00f4 ae000b        	ldw	x,#11
 801  00f7 89            	pushw	x
 802  00f8 ae000a        	ldw	x,#10
 803  00fb 89            	pushw	x
 804  00fc ae000b        	ldw	x,#11
 805  00ff 89            	pushw	x
 806  0100 ae0002        	ldw	x,#2
 807  0103 8d000000      	callf	f_Draw_Line
 809  0107 5b07          	addw	sp,#7
 810                     ; 47      Draw_Line(73, 11, 81, 11, BLACK);
 812  0109 4b00          	push	#0
 813  010b ae000b        	ldw	x,#11
 814  010e 89            	pushw	x
 815  010f ae0051        	ldw	x,#81
 816  0112 89            	pushw	x
 817  0113 ae000b        	ldw	x,#11
 818  0116 89            	pushw	x
 819  0117 ae0049        	ldw	x,#73
 820  011a 8d000000      	callf	f_Draw_Line
 822  011e 5b07          	addw	sp,#7
 823                     ; 48      delay_ms(200);
 825  0120 ae00c8        	ldw	x,#200
 826  0123 8d000000      	callf	f_delay_ms
 828                     ; 49      Draw_Line(2, 36, 10, 36, BLACK);
 830  0127 4b00          	push	#0
 831  0129 ae0024        	ldw	x,#36
 832  012c 89            	pushw	x
 833  012d ae000a        	ldw	x,#10
 834  0130 89            	pushw	x
 835  0131 ae0024        	ldw	x,#36
 836  0134 89            	pushw	x
 837  0135 ae0002        	ldw	x,#2
 838  0138 8d000000      	callf	f_Draw_Line
 840  013c 5b07          	addw	sp,#7
 841                     ; 50      Draw_Line(73, 36, 81, 36, BLACK);
 843  013e 4b00          	push	#0
 844  0140 ae0024        	ldw	x,#36
 845  0143 89            	pushw	x
 846  0144 ae0051        	ldw	x,#81
 847  0147 89            	pushw	x
 848  0148 ae0024        	ldw	x,#36
 849  014b 89            	pushw	x
 850  014c ae0049        	ldw	x,#73
 851  014f 8d000000      	callf	f_Draw_Line
 853  0153 5b07          	addw	sp,#7
 854                     ; 51      delay_ms(200);
 856  0155 ae00c8        	ldw	x,#200
 857  0158 8d000000      	callf	f_delay_ms
 859                     ; 52      Draw_Line(11, 45, 11, 2, BLACK);
 861  015c 4b00          	push	#0
 862  015e ae0002        	ldw	x,#2
 863  0161 89            	pushw	x
 864  0162 ae000b        	ldw	x,#11
 865  0165 89            	pushw	x
 866  0166 ae002d        	ldw	x,#45
 867  0169 89            	pushw	x
 868  016a ae000b        	ldw	x,#11
 869  016d 8d000000      	callf	f_Draw_Line
 871  0171 5b07          	addw	sp,#7
 872                     ; 53      Draw_Line(72, 45, 72, 2, BLACK);
 874  0173 4b00          	push	#0
 875  0175 ae0002        	ldw	x,#2
 876  0178 89            	pushw	x
 877  0179 ae0048        	ldw	x,#72
 878  017c 89            	pushw	x
 879  017d ae002d        	ldw	x,#45
 880  0180 89            	pushw	x
 881  0181 ae0048        	ldw	x,#72
 882  0184 8d000000      	callf	f_Draw_Line
 884  0188 5b07          	addw	sp,#7
 885                     ; 54      delay_ms(200);
 887  018a ae00c8        	ldw	x,#200
 888  018d 8d000000      	callf	f_delay_ms
 890                     ; 56      PCD8544_backlight_state(OFF);
 892  0191 4f            	clr	a
 893  0192 8d000000      	callf	f_PCD8544_backlight_state
 895                     ; 57      delay_ms(400);
 897  0196 ae0190        	ldw	x,#400
 898  0199 8d000000      	callf	f_delay_ms
 900                     ; 59      PCD8544_backlight_state(ON);
 902  019d a601          	ld	a,#1
 903  019f 8d000000      	callf	f_PCD8544_backlight_state
 905                     ; 61      for(g = 0; g <= 9; g++)
 907  01a3 0f1e          	clr	(OFST+0,sp)
 909  01a5               L57:
 910                     ; 63          PCD8544_set_cursor((18 + (g * 5)), 2);
 912  01a5 7b1e          	ld	a,(OFST+0,sp)
 913  01a7 97            	ld	xl,a
 914  01a8 a605          	ld	a,#5
 915  01aa 42            	mul	x,a
 916  01ab 9f            	ld	a,xl
 917  01ac ab12          	add	a,#18
 918  01ae ae0002        	ldw	x,#2
 919  01b1 95            	ld	xh,a
 920  01b2 8d000000      	callf	f_PCD8544_set_cursor
 922                     ; 64          PCD8544_print_char(txt1[g], WHITE);
 924  01b6 96            	ldw	x,sp
 925  01b7 1c0001        	addw	x,#OFST-29
 926  01ba 9f            	ld	a,xl
 927  01bb 5e            	swapw	x
 928  01bc 1b1e          	add	a,(OFST+0,sp)
 929  01be 2401          	jrnc	L6
 930  01c0 5c            	incw	x
 931  01c1               L6:
 932  01c1 02            	rlwa	x,a
 933  01c2 f6            	ld	a,(x)
 934  01c3 ae0001        	ldw	x,#1
 935  01c6 95            	ld	xh,a
 936  01c7 8d000000      	callf	f_PCD8544_print_char
 938                     ; 65          delay_ms(90);
 940  01cb ae005a        	ldw	x,#90
 941  01ce 8d000000      	callf	f_delay_ms
 943                     ; 61      for(g = 0; g <= 9; g++)
 945  01d2 0c1e          	inc	(OFST+0,sp)
 949  01d4 7b1e          	ld	a,(OFST+0,sp)
 950  01d6 a10a          	cp	a,#10
 951  01d8 25cb          	jrult	L57
 952                     ; 68      for(g = 0; g <= 9; g++)
 954  01da 0f1e          	clr	(OFST+0,sp)
 956  01dc               L301:
 957                     ; 70          PCD8544_set_cursor((18 + (g * 5)), 3);
 959  01dc 7b1e          	ld	a,(OFST+0,sp)
 960  01de 97            	ld	xl,a
 961  01df a605          	ld	a,#5
 962  01e1 42            	mul	x,a
 963  01e2 9f            	ld	a,xl
 964  01e3 ab12          	add	a,#18
 965  01e5 ae0003        	ldw	x,#3
 966  01e8 95            	ld	xh,a
 967  01e9 8d000000      	callf	f_PCD8544_set_cursor
 969                     ; 71          PCD8544_print_char(txt2[g], WHITE);
 971  01ed 96            	ldw	x,sp
 972  01ee 1c000c        	addw	x,#OFST-18
 973  01f1 9f            	ld	a,xl
 974  01f2 5e            	swapw	x
 975  01f3 1b1e          	add	a,(OFST+0,sp)
 976  01f5 2401          	jrnc	L01
 977  01f7 5c            	incw	x
 978  01f8               L01:
 979  01f8 02            	rlwa	x,a
 980  01f9 f6            	ld	a,(x)
 981  01fa ae0001        	ldw	x,#1
 982  01fd 95            	ld	xh,a
 983  01fe 8d000000      	callf	f_PCD8544_print_char
 985                     ; 72          delay_ms(90);
 987  0202 ae005a        	ldw	x,#90
 988  0205 8d000000      	callf	f_delay_ms
 990                     ; 68      for(g = 0; g <= 9; g++)
 992  0209 0c1e          	inc	(OFST+0,sp)
 996  020b 7b1e          	ld	a,(OFST+0,sp)
 997  020d a10a          	cp	a,#10
 998  020f 25cb          	jrult	L301
 999                     ; 74      delay_ms(4000);
1001  0211 ae0fa0        	ldw	x,#4000
1002  0214 8d000000      	callf	f_delay_ms
1004                     ; 76      PCD8544_clear_screen(WHITE);
1006  0218 a601          	ld	a,#1
1007  021a 8d000000      	callf	f_PCD8544_clear_screen
1009                     ; 78      PCD8544_print_string(1, 2, "CHR:", WHITE);
1011  021e 4b01          	push	#1
1012  0220 ae0204        	ldw	x,#L111
1013  0223 89            	pushw	x
1014  0224 ae0102        	ldw	x,#258
1015  0227 8d000000      	callf	f_PCD8544_print_string
1017  022b 5b03          	addw	sp,#3
1018                     ; 79      PCD8544_print_string(1, 3, "INT:", WHITE);
1020  022d 4b01          	push	#1
1021  022f ae01ff        	ldw	x,#L311
1022  0232 89            	pushw	x
1023  0233 ae0103        	ldw	x,#259
1024  0236 8d000000      	callf	f_PCD8544_print_string
1026  023a 5b03          	addw	sp,#3
1027                     ; 80      PCD8544_print_string(1, 4, "FLT:", WHITE);
1029  023c 4b01          	push	#1
1030  023e ae01fa        	ldw	x,#L511
1031  0241 89            	pushw	x
1032  0242 ae0104        	ldw	x,#260
1033  0245 8d000000      	callf	f_PCD8544_print_string
1035  0249 5b03          	addw	sp,#3
1036  024b               L711:
1037                     ; 84          print_chr(26, 2, c, WHITE);
1039  024b 4b01          	push	#1
1040  024d 7b18          	ld	a,(OFST-6,sp)
1041  024f 5f            	clrw	x
1042  0250 4d            	tnz	a
1043  0251 2a01          	jrpl	L21
1044  0253 53            	cplw	x
1045  0254               L21:
1046  0254 97            	ld	xl,a
1047  0255 89            	pushw	x
1048  0256 ae1a02        	ldw	x,#6658
1049  0259 8d000000      	callf	f_print_chr
1051  025d 5b03          	addw	sp,#3
1052                     ; 85          print_int(26, 3, i, WHITE);
1054  025f 4b01          	push	#1
1055  0261 1e19          	ldw	x,(OFST-5,sp)
1056  0263 8d000000      	callf	d_itolx
1058  0267 be02          	ldw	x,c_lreg+2
1059  0269 89            	pushw	x
1060  026a be00          	ldw	x,c_lreg
1061  026c 89            	pushw	x
1062  026d ae1a03        	ldw	x,#6659
1063  0270 8d000000      	callf	f_print_int
1065  0274 5b05          	addw	sp,#5
1066                     ; 86          print_float(26, 4, f, 2, WHITE);
1068  0276 4b01          	push	#1
1069  0278 4b02          	push	#2
1070  027a 1e1e          	ldw	x,(OFST+0,sp)
1071  027c 89            	pushw	x
1072  027d 1e1e          	ldw	x,(OFST+0,sp)
1073  027f 89            	pushw	x
1074  0280 ae1a04        	ldw	x,#6660
1075  0283 8d000000      	callf	f_print_float
1077  0287 5b06          	addw	sp,#6
1078                     ; 87          c++;
1080  0289 0c17          	inc	(OFST-7,sp)
1082                     ; 88          i++;
1084  028b 1e18          	ldw	x,(OFST-6,sp)
1085  028d 1c0001        	addw	x,#1
1086  0290 1f18          	ldw	(OFST-6,sp),x
1088                     ; 89          f += 0.01;
1090  0292 ae01f6        	ldw	x,#L721
1091  0295 8d000000      	callf	d_ltor
1093  0299 96            	ldw	x,sp
1094  029a 1c001a        	addw	x,#OFST-4
1095  029d 8d000000      	callf	d_fgadd
1098                     ; 90          delay_ms(400);
1100  02a1 ae0190        	ldw	x,#400
1101  02a4 8d000000      	callf	f_delay_ms
1104  02a8 20a1          	jra	L711
1136                     ; 95 void setup_clock(void)
1136                     ; 96 {
1137                     	switch	.text
1138  02aa               f_setup_clock:
1142                     ; 97 	CLK_DeInit();
1144  02aa 8d000000      	callf	f_CLK_DeInit
1146                     ; 99 	CLK_HSECmd(ENABLE);
1148  02ae a601          	ld	a,#1
1149  02b0 8d000000      	callf	f_CLK_HSECmd
1152  02b4               L541:
1153                     ; 100 	while(CLK_GetFlagStatus(CLK_FLAG_HSERDY) == FALSE);
1155  02b4 ae0202        	ldw	x,#514
1156  02b7 8d000000      	callf	f_CLK_GetFlagStatus
1158  02bb 4d            	tnz	a
1159  02bc 27f6          	jreq	L541
1160                     ; 102 	CLK_LSICmd(DISABLE);
1162  02be 4f            	clr	a
1163  02bf 8d000000      	callf	f_CLK_LSICmd
1165                     ; 104 	CLK_HSICmd(ENABLE);
1167  02c3 a601          	ld	a,#1
1168  02c5 8d000000      	callf	f_CLK_HSICmd
1171  02c9               L351:
1172                     ; 105 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
1174  02c9 ae0102        	ldw	x,#258
1175  02cc 8d000000      	callf	f_CLK_GetFlagStatus
1177  02d0 4d            	tnz	a
1178  02d1 27f6          	jreq	L351
1179                     ; 107 	CLK_ClockSwitchCmd(ENABLE);
1181  02d3 a601          	ld	a,#1
1182  02d5 8d000000      	callf	f_CLK_ClockSwitchCmd
1184                     ; 108 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
1186  02d9 4f            	clr	a
1187  02da 8d000000      	callf	f_CLK_HSIPrescalerConfig
1189                     ; 109 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
1191  02de a680          	ld	a,#128
1192  02e0 8d000000      	callf	f_CLK_SYSCLKConfig
1194                     ; 111 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, 
1194                     ; 112 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
1196  02e4 4b01          	push	#1
1197  02e6 4b00          	push	#0
1198  02e8 ae01b4        	ldw	x,#436
1199  02eb 8d000000      	callf	f_CLK_ClockSwitchConfig
1201  02ef 85            	popw	x
1202                     ; 114 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
1204  02f0 ae0100        	ldw	x,#256
1205  02f3 8d000000      	callf	f_CLK_PeripheralClockConfig
1207                     ; 115 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
1209  02f7 5f            	clrw	x
1210  02f8 8d000000      	callf	f_CLK_PeripheralClockConfig
1212                     ; 116 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
1214  02fc ae1300        	ldw	x,#4864
1215  02ff 8d000000      	callf	f_CLK_PeripheralClockConfig
1217                     ; 117 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
1219  0303 ae1200        	ldw	x,#4608
1220  0306 8d000000      	callf	f_CLK_PeripheralClockConfig
1222                     ; 118 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART2, DISABLE);
1224  030a ae0300        	ldw	x,#768
1225  030d 8d000000      	callf	f_CLK_PeripheralClockConfig
1227                     ; 119 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
1229  0311 ae0700        	ldw	x,#1792
1230  0314 8d000000      	callf	f_CLK_PeripheralClockConfig
1232                     ; 120 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
1234  0318 ae0500        	ldw	x,#1280
1235  031b 8d000000      	callf	f_CLK_PeripheralClockConfig
1237                     ; 121 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, DISABLE);
1239  031f ae0600        	ldw	x,#1536
1240  0322 8d000000      	callf	f_CLK_PeripheralClockConfig
1242                     ; 122 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
1244  0326 ae0400        	ldw	x,#1024
1245  0329 8d000000      	callf	f_CLK_PeripheralClockConfig
1247                     ; 123 }
1250  032d 87            	retf
1273                     ; 126 void setup_GPIOs(void)
1273                     ; 127 {
1274                     	switch	.text
1275  032e               f_setup_GPIOs:
1279                     ; 128 	GPIO_DeInit(PCD8544_port_1);
1281  032e ae500a        	ldw	x,#20490
1282  0331 8d000000      	callf	f_GPIO_DeInit
1284                     ; 129 	GPIO_DeInit(PCD8544_port_2);
1286  0335 ae501e        	ldw	x,#20510
1287  0338 8d000000      	callf	f_GPIO_DeInit
1289                     ; 130 }
1292  033c 87            	retf
1317                     	xdef	f_main
1318                     	xdef	f_setup_GPIOs
1319                     	xdef	f_setup_clock
1320                     	switch	.bss
1321  0000               _PCD8544_buffer:
1322  0000 000000000000  	ds.b	504
1323                     	xdef	_PCD8544_buffer
1324                     	xref	f_Draw_Circle
1325                     	xref	f_Draw_Rectangle
1326                     	xref	f_Draw_Line
1327                     	xref	f_print_float
1328                     	xref	f_print_int
1329                     	xref	f_print_chr
1330                     	xref	f_PCD8544_print_string
1331                     	xref	f_PCD8544_clear_screen
1332                     	xref	f_PCD8544_print_char
1333                     	xref	f_PCD8544_set_cursor
1334                     	xref	f_PCD8544_backlight_state
1335                     	xref	f_PCD8544_init
1336                     	xref	f_delay_ms
1337                     	xref	f_GPIO_DeInit
1338                     	xref	f_CLK_GetFlagStatus
1339                     	xref	f_CLK_SYSCLKConfig
1340                     	xref	f_CLK_HSIPrescalerConfig
1341                     	xref	f_CLK_ClockSwitchConfig
1342                     	xref	f_CLK_PeripheralClockConfig
1343                     	xref	f_CLK_ClockSwitchCmd
1344                     	xref	f_CLK_LSICmd
1345                     	xref	f_CLK_HSICmd
1346                     	xref	f_CLK_HSECmd
1347                     	xref	f_CLK_DeInit
1348                     	switch	.const
1349  01f6               L721:
1350  01f6 3c23d70a      	dc.w	15395,-10486
1351  01fa               L511:
1352  01fa 464c543a00    	dc.b	"FLT:",0
1353  01ff               L311:
1354  01ff 494e543a00    	dc.b	"INT:",0
1355  0204               L111:
1356  0204 4348523a00    	dc.b	"CHR:",0
1357  0209               L17:
1358  0209 bd23d70a      	dc.w	-17117,-10486
1359                     	xref.b	c_lreg
1360                     	xref.b	c_x
1380                     	xref	d_fgadd
1381                     	xref	d_ltor
1382                     	xref	d_itolx
1383                     	xref	d_xymvx
1384                     	end
