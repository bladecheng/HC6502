;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module stm8s_uart1
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _CLK_GetClockFreq
	.globl _UART1_DeInit
	.globl _UART1_Init
	.globl _UART1_Cmd
	.globl _UART1_ITConfig
	.globl _UART1_HalfDuplexCmd
	.globl _UART1_IrDAConfig
	.globl _UART1_IrDACmd
	.globl _UART1_LINBreakDetectionConfig
	.globl _UART1_LINCmd
	.globl _UART1_SmartCardCmd
	.globl _UART1_SmartCardNACKCmd
	.globl _UART1_WakeUpConfig
	.globl _UART1_ReceiverWakeUpCmd
	.globl _UART1_ReceiveData8
	.globl _UART1_ReceiveData9
	.globl _UART1_SendData8
	.globl _UART1_SendData9
	.globl _UART1_SendBreak
	.globl _UART1_SetAddress
	.globl _UART1_SetGuardTime
	.globl _UART1_SetPrescaler
	.globl _UART1_GetFlagStatus
	.globl _UART1_ClearFlag
	.globl _UART1_GetITStatus
	.globl _UART1_ClearITPendingBit
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	../src/stm8s_uart1.c: 53: void UART1_DeInit(void)
;	-----------------------------------------
;	 function UART1_DeInit
;	-----------------------------------------
_UART1_DeInit:
;	../src/stm8s_uart1.c: 57: (void)UART1->SR;
	ld	a, 0x5230
;	../src/stm8s_uart1.c: 58: (void)UART1->DR;
	ld	a, 0x5231
;	../src/stm8s_uart1.c: 60: UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
	mov	0x5233+0, #0x00
;	../src/stm8s_uart1.c: 61: UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
	mov	0x5232+0, #0x00
;	../src/stm8s_uart1.c: 63: UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
	mov	0x5234+0, #0x00
;	../src/stm8s_uart1.c: 64: UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
	mov	0x5235+0, #0x00
;	../src/stm8s_uart1.c: 65: UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
	mov	0x5236+0, #0x00
;	../src/stm8s_uart1.c: 66: UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
	mov	0x5237+0, #0x00
;	../src/stm8s_uart1.c: 67: UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
	mov	0x5238+0, #0x00
;	../src/stm8s_uart1.c: 69: UART1->GTR = UART1_GTR_RESET_VALUE;
	mov	0x5239+0, #0x00
;	../src/stm8s_uart1.c: 70: UART1->PSCR = UART1_PSCR_RESET_VALUE;
	mov	0x523a+0, #0x00
;	../src/stm8s_uart1.c: 71: }
	ret
;	../src/stm8s_uart1.c: 90: void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
;	-----------------------------------------
;	 function UART1_Init
;	-----------------------------------------
_UART1_Init:
	sub	sp, #29
;	../src/stm8s_uart1.c: 97: assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
	ldw	x, #0x8968
	cpw	x, (0x22, sp)
	ld	a, #0x09
	sbc	a, (0x21, sp)
	clr	a
	sbc	a, (0x20, sp)
	jrnc	00113$
	push	#0x61
	clrw	x
	pushw	x
	push	#0x00
	push	#<___str_0
	push	#(___str_0 >> 8)
	call	_assert_failed
	addw	sp, #6
00113$:
;	../src/stm8s_uart1.c: 98: assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
	tnz	(0x24, sp)
	jreq	00115$
	ld	a, (0x24, sp)
	cp	a, #0x10
	jreq	00115$
	push	#0x62
	clrw	x
	pushw	x
	push	#0x00
	push	#<___str_0
	push	#(___str_0 >> 8)
	call	_assert_failed
	addw	sp, #6
00115$:
;	../src/stm8s_uart1.c: 99: assert_param(IS_UART1_STOPBITS_OK(StopBits));
	tnz	(0x25, sp)
	jreq	00120$
	ld	a, (0x25, sp)
	cp	a, #0x10
	jreq	00120$
	ld	a, (0x25, sp)
	cp	a, #0x20
	jreq	00120$
	ld	a, (0x25, sp)
	cp	a, #0x30
	jreq	00120$
	push	#0x63
	clrw	x
	pushw	x
	push	#0x00
	push	#<___str_0
	push	#(___str_0 >> 8)
	call	_assert_failed
	addw	sp, #6
00120$:
;	../src/stm8s_uart1.c: 100: assert_param(IS_UART1_PARITY_OK(Parity));
	tnz	(0x26, sp)
	jreq	00131$
	ld	a, (0x26, sp)
	cp	a, #0x04
	jreq	00131$
	ld	a, (0x26, sp)
	cp	a, #0x06
	jreq	00131$
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	push	#<___str_0
	push	#(___str_0 >> 8)
	call	_assert_failed
	addw	sp, #6
00131$:
;	../src/stm8s_uart1.c: 101: assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
	ld	a, (0x28, sp)
	cp	a, #0x08
	jreq	00139$
	ld	a, (0x28, sp)
	cp	a, #0x40
	jreq	00139$
	ld	a, (0x28, sp)
	cp	a, #0x04
	jreq	00139$
	ld	a, (0x28, sp)
	cp	a, #0x80
	jreq	00139$
	ld	a, (0x28, sp)
	sub	a, #0x0c
	jrne	00339$
	inc	a
	.byte 0x21
00339$:
	clr	a
00340$:
	tnz	a
	jrne	00139$
	tnz	a
	jrne	00139$
	ld	a, (0x28, sp)
	cp	a, #0x44
	jreq	00139$
	ld	a, (0x28, sp)
	cp	a, #0xc0
	jreq	00139$
	ld	a, (0x28, sp)
	cp	a, #0x88
	jreq	00139$
	push	#0x65
	clrw	x
	pushw	x
	push	#0x00
	push	#<___str_0
	push	#(___str_0 >> 8)
	call	_assert_failed
	addw	sp, #6
00139$:
;	../src/stm8s_uart1.c: 102: assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
	ld	a, (0x27, sp)
	and	a, #0x88
	cp	a, #0x88
	jreq	00167$
	ld	a, (0x27, sp)
	and	a, #0x44
	cp	a, #0x44
	jreq	00167$
	ld	a, (0x27, sp)
	and	a, #0x22
	cp	a, #0x22
	jreq	00167$
	ld	a, (0x27, sp)
	and	a, #0x11
	cp	a, #0x11
	jrne	00165$
00167$:
	push	#0x66
	clrw	x
	pushw	x
	push	#0x00
	push	#<___str_0
	push	#(___str_0 >> 8)
	call	_assert_failed
	addw	sp, #6
00165$:
;	../src/stm8s_uart1.c: 105: UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
	bres	21044, #4
;	../src/stm8s_uart1.c: 108: UART1->CR1 |= (uint8_t)WordLength;
	ld	a, 0x5234
	or	a, (0x24, sp)
	ld	0x5234, a
;	../src/stm8s_uart1.c: 111: UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
	ld	a, 0x5236
	and	a, #0xcf
	ld	0x5236, a
;	../src/stm8s_uart1.c: 113: UART1->CR3 |= (uint8_t)StopBits;  
	ld	a, 0x5236
	or	a, (0x25, sp)
	ld	0x5236, a
;	../src/stm8s_uart1.c: 116: UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
	ld	a, 0x5234
	and	a, #0xf9
	ld	0x5234, a
;	../src/stm8s_uart1.c: 118: UART1->CR1 |= (uint8_t)Parity;  
	ld	a, 0x5234
	or	a, (0x26, sp)
	ld	0x5234, a
;	../src/stm8s_uart1.c: 121: UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
	ld	a, 0x5232
	mov	0x5232+0, #0x00
;	../src/stm8s_uart1.c: 123: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
	ld	a, 0x5233
	and	a, #0x0f
	ld	0x5233, a
;	../src/stm8s_uart1.c: 125: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
	ld	a, 0x5233
	and	a, #0xf0
	ld	0x5233, a
;	../src/stm8s_uart1.c: 128: BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
	call	_CLK_GetClockFreq
	ldw	(0x05, sp), x
	ldw	x, (0x20, sp)
	ldw	(0x08, sp), x
	ldw	x, (0x22, sp)
	ld	a, #0x04
00364$:
	sllw	x
	rlc	(0x09, sp)
	rlc	(0x08, sp)
	dec	a
	jrne	00364$
	ldw	(0x0a, sp), x
	pushw	x
	ldw	x, (0x0a, sp)
	pushw	x
	ldw	x, (0x09, sp)
	pushw	x
	pushw	y
	call	__divulong
	addw	sp, #8
	ldw	(0x1c, sp), x
	ldw	(0x1a, sp), y
;	../src/stm8s_uart1.c: 129: BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
	call	_CLK_GetClockFreq
	pushw	x
	pushw	y
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x14, sp), x
	ldw	x, (0x0a, sp)
	pushw	x
	ldw	x, (0x0a, sp)
	pushw	x
	ldw	x, (0x18, sp)
	pushw	x
	pushw	y
	call	__divulong
	addw	sp, #8
	ld	a, yh
	ldw	(0x18, sp), x
	ld	(0x16, sp), a
	ld	a, yl
;	../src/stm8s_uart1.c: 131: UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
	ldw	x, #0x5233
	push	a
	ld	a, (x)
	ld	(0x08, sp), a
	ldw	x, (0x1d, sp)
	pushw	x
	ldw	x, (0x1d, sp)
	pushw	x
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x11, sp), x
	ldw	(0x0f, sp), y
	pop	a
	ldw	y, (0x18, sp)
	subw	y, (0x10, sp)
	sbc	a, (0x0f, sp)
	ld	xl, a
	ld	a, (0x16, sp)
	sbc	a, (0x0e, sp)
	ld	xh, a
	ld	a, #0x04
00366$:
	sllw	y
	rlcw	x
	dec	a
	jrne	00366$
	push	#0x64
	push	#0x00
	push	#0x00
	push	#0x00
	pushw	y
	pushw	x
	call	__divulong
	addw	sp, #8
	ld	a, xl
	and	a, #0x0f
	or	a, (0x07, sp)
	ld	0x5233, a
;	../src/stm8s_uart1.c: 133: UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
	ld	a, 0x5233
	ld	(0x01, sp), a
	ldw	x, (0x1c, sp)
	ld	a, #0x10
	div	x, a
	ld	a, xl
	and	a, #0xf0
	or	a, (0x01, sp)
	ld	0x5233, a
;	../src/stm8s_uart1.c: 135: UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
	ld	a, 0x5232
	ld	(0x02, sp), a
	ld	a, (0x1d, sp)
	or	a, (0x02, sp)
	ld	0x5232, a
;	../src/stm8s_uart1.c: 138: UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
	ld	a, 0x5235
	and	a, #0xf3
	ld	0x5235, a
;	../src/stm8s_uart1.c: 140: UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
	ld	a, 0x5236
	and	a, #0xf8
	ld	0x5236, a
;	../src/stm8s_uart1.c: 142: UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
	ld	a, 0x5236
	ld	(0x0c, sp), a
	ld	a, (0x27, sp)
	and	a, #0x07
	or	a, (0x0c, sp)
	ld	0x5236, a
;	../src/stm8s_uart1.c: 138: UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
	ld	a, 0x5235
;	../src/stm8s_uart1.c: 145: if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
	push	a
	ld	a, (0x29, sp)
	bcp	a, #0x04
	pop	a
	jreq	00102$
;	../src/stm8s_uart1.c: 148: UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
	or	a, #0x08
	ld	0x5235, a
	jra	00103$
00102$:
;	../src/stm8s_uart1.c: 153: UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
	and	a, #0xf7
	ld	0x5235, a
00103$:
;	../src/stm8s_uart1.c: 138: UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
	ld	a, 0x5235
;	../src/stm8s_uart1.c: 155: if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
	push	a
	ld	a, (0x29, sp)
	bcp	a, #0x08
	pop	a
	jreq	00105$
;	../src/stm8s_uart1.c: 158: UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
	or	a, #0x04
	ld	0x5235, a
	jra	00106$
00105$:
;	../src/stm8s_uart1.c: 163: UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
	and	a, #0xfb
	ld	0x5235, a
00106$:
;	../src/stm8s_uart1.c: 111: UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
	ld	a, 0x5236
;	../src/stm8s_uart1.c: 167: if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
	tnz	(0x27, sp)
	jrpl	00108$
;	../src/stm8s_uart1.c: 170: UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
	and	a, #0xf7
	ld	0x5236, a
	jra	00110$
00108$:
;	../src/stm8s_uart1.c: 174: UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
	push	a
	ld	a, (0x28, sp)
	and	a, #0x08
	ld	(0x0e, sp), a
	pop	a
	or	a, (0x0d, sp)
	ld	0x5236, a
00110$:
;	../src/stm8s_uart1.c: 176: }
	addw	sp, #29
	ret
;	../src/stm8s_uart1.c: 184: void UART1_Cmd(FunctionalState NewState)
;	-----------------------------------------
;	 function UART1_Cmd
;	-----------------------------------------
_UART1_Cmd:
;	../src/stm8s_uart1.c: 189: UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
	ld	a, 0x5234
;	../src/stm8s_uart1.c: 186: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	../src/stm8s_uart1.c: 189: UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
	and	a, #0xdf
	ld	0x5234, a
	ret
00102$:
;	../src/stm8s_uart1.c: 194: UART1->CR1 |= UART1_CR1_UARTD;  
	or	a, #0x20
	ld	0x5234, a
;	../src/stm8s_uart1.c: 196: }
	ret
;	../src/stm8s_uart1.c: 211: void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
;	-----------------------------------------
;	 function UART1_ITConfig
;	-----------------------------------------
_UART1_ITConfig:
;	../src/stm8s_uart1.c: 259: }
	ret
;	../src/stm8s_uart1.c: 267: void UART1_HalfDuplexCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function UART1_HalfDuplexCmd
;	-----------------------------------------
_UART1_HalfDuplexCmd:
;	../src/stm8s_uart1.c: 281: }
	ret
;	../src/stm8s_uart1.c: 289: void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
;	-----------------------------------------
;	 function UART1_IrDAConfig
;	-----------------------------------------
_UART1_IrDAConfig:
;	../src/stm8s_uart1.c: 303: }
	ret
;	../src/stm8s_uart1.c: 311: void UART1_IrDACmd(FunctionalState NewState)
;	-----------------------------------------
;	 function UART1_IrDACmd
;	-----------------------------------------
_UART1_IrDACmd:
;	../src/stm8s_uart1.c: 328: }
	ret
;	../src/stm8s_uart1.c: 337: void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
;	-----------------------------------------
;	 function UART1_LINBreakDetectionConfig
;	-----------------------------------------
_UART1_LINBreakDetectionConfig:
;	../src/stm8s_uart1.c: 351: }
	ret
;	../src/stm8s_uart1.c: 359: void UART1_LINCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function UART1_LINCmd
;	-----------------------------------------
_UART1_LINCmd:
;	../src/stm8s_uart1.c: 375: }
	ret
;	../src/stm8s_uart1.c: 383: void UART1_SmartCardCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function UART1_SmartCardCmd
;	-----------------------------------------
_UART1_SmartCardCmd:
;	../src/stm8s_uart1.c: 399: }
	ret
;	../src/stm8s_uart1.c: 408: void UART1_SmartCardNACKCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function UART1_SmartCardNACKCmd
;	-----------------------------------------
_UART1_SmartCardNACKCmd:
;	../src/stm8s_uart1.c: 424: }
	ret
;	../src/stm8s_uart1.c: 432: void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
;	-----------------------------------------
;	 function UART1_WakeUpConfig
;	-----------------------------------------
_UART1_WakeUpConfig:
;	../src/stm8s_uart1.c: 440: }
	ret
;	../src/stm8s_uart1.c: 448: void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function UART1_ReceiverWakeUpCmd
;	-----------------------------------------
_UART1_ReceiverWakeUpCmd:
;	../src/stm8s_uart1.c: 464: }
	ret
;	../src/stm8s_uart1.c: 471: uint8_t UART1_ReceiveData8(void)
;	-----------------------------------------
;	 function UART1_ReceiveData8
;	-----------------------------------------
_UART1_ReceiveData8:
;	../src/stm8s_uart1.c: 473: return ((uint8_t)UART1->DR);
	ld	a, 0x5231
;	../src/stm8s_uart1.c: 474: }
	ret
;	../src/stm8s_uart1.c: 481: uint16_t UART1_ReceiveData9(void)
;	-----------------------------------------
;	 function UART1_ReceiveData9
;	-----------------------------------------
_UART1_ReceiveData9:
;	../src/stm8s_uart1.c: 489: }
	ret
;	../src/stm8s_uart1.c: 496: void UART1_SendData8(uint8_t Data)
;	-----------------------------------------
;	 function UART1_SendData8
;	-----------------------------------------
_UART1_SendData8:
;	../src/stm8s_uart1.c: 499: UART1->DR = Data;
	ldw	x, #0x5231
	ld	a, (0x03, sp)
	ld	(x), a
;	../src/stm8s_uart1.c: 500: }
	ret
;	../src/stm8s_uart1.c: 508: void UART1_SendData9(uint16_t Data)
;	-----------------------------------------
;	 function UART1_SendData9
;	-----------------------------------------
_UART1_SendData9:
;	../src/stm8s_uart1.c: 518: }
	ret
;	../src/stm8s_uart1.c: 525: void UART1_SendBreak(void)
;	-----------------------------------------
;	 function UART1_SendBreak
;	-----------------------------------------
_UART1_SendBreak:
;	../src/stm8s_uart1.c: 530: }
	ret
;	../src/stm8s_uart1.c: 537: void UART1_SetAddress(uint8_t UART1_Address)
;	-----------------------------------------
;	 function UART1_SetAddress
;	-----------------------------------------
_UART1_SetAddress:
;	../src/stm8s_uart1.c: 548: }
	ret
;	../src/stm8s_uart1.c: 556: void UART1_SetGuardTime(uint8_t UART1_GuardTime)
;	-----------------------------------------
;	 function UART1_SetGuardTime
;	-----------------------------------------
_UART1_SetGuardTime:
;	../src/stm8s_uart1.c: 562: }
	ret
;	../src/stm8s_uart1.c: 586: void UART1_SetPrescaler(uint8_t UART1_Prescaler)
;	-----------------------------------------
;	 function UART1_SetPrescaler
;	-----------------------------------------
_UART1_SetPrescaler:
;	../src/stm8s_uart1.c: 592: }
	ret
;	../src/stm8s_uart1.c: 600: FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
;	-----------------------------------------
;	 function UART1_GetFlagStatus
;	-----------------------------------------
_UART1_GetFlagStatus:
	pushw	x
;	../src/stm8s_uart1.c: 605: assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
	ldw	x, (0x05, sp)
	cpw	x, #0x0101
	jrne	00223$
	ld	a, #0x01
	ld	(0x01, sp), a
	.byte 0xc1
00223$:
	clr	(0x01, sp)
00224$:
	ldw	x, (0x05, sp)
	cpw	x, #0x0210
	jrne	00226$
	ld	a, #0x01
	.byte 0x21
00226$:
	clr	a
00227$:
	ldw	x, (0x05, sp)
	cpw	x, #0x0080
	jreq	00119$
	ldw	x, (0x05, sp)
	cpw	x, #0x0040
	jreq	00119$
	ldw	x, (0x05, sp)
	cpw	x, #0x0020
	jreq	00119$
	ldw	x, (0x05, sp)
	cpw	x, #0x0010
	jreq	00119$
	ldw	x, (0x05, sp)
	cpw	x, #0x0008
	jreq	00119$
	ldw	x, (0x05, sp)
	cpw	x, #0x0004
	jreq	00119$
	ldw	x, (0x05, sp)
	cpw	x, #0x0002
	jreq	00119$
	ldw	x, (0x05, sp)
	decw	x
	jreq	00119$
	tnz	(0x01, sp)
	jrne	00119$
	tnz	a
	jrne	00119$
	push	a
	push	#0x5d
	push	#0x02
	clrw	x
	pushw	x
	push	#<___str_0
	push	#(___str_0 >> 8)
	call	_assert_failed
	addw	sp, #6
	pop	a
00119$:
;	../src/stm8s_uart1.c: 611: if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
	push	a
	ld	a, (0x07, sp)
	ld	(0x03, sp), a
	pop	a
;	../src/stm8s_uart1.c: 609: if (UART1_FLAG == UART1_FLAG_LBDF)
	tnz	a
	jreq	00114$
;	../src/stm8s_uart1.c: 611: if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
	ld	a, 0x5237
	and	a, (0x02, sp)
	jreq	00102$
;	../src/stm8s_uart1.c: 614: status = SET;
	ld	a, #0x01
	jra	00115$
00102$:
;	../src/stm8s_uart1.c: 619: status = RESET;
	clr	a
	jra	00115$
00114$:
;	../src/stm8s_uart1.c: 622: else if (UART1_FLAG == UART1_FLAG_SBK)
	tnz	(0x01, sp)
	jreq	00111$
;	../src/stm8s_uart1.c: 624: if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
	ld	a, 0x5235
	and	a, (0x02, sp)
	jreq	00105$
;	../src/stm8s_uart1.c: 627: status = SET;
	ld	a, #0x01
	jra	00115$
00105$:
;	../src/stm8s_uart1.c: 632: status = RESET;
	clr	a
	jra	00115$
00111$:
;	../src/stm8s_uart1.c: 637: if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
	ld	a, 0x5230
	and	a, (0x02, sp)
	jreq	00108$
;	../src/stm8s_uart1.c: 640: status = SET;
	ld	a, #0x01
;	../src/stm8s_uart1.c: 645: status = RESET;
	.byte 0x21
00108$:
	clr	a
00115$:
;	../src/stm8s_uart1.c: 649: return status;
;	../src/stm8s_uart1.c: 650: }
	popw	x
	ret
;	../src/stm8s_uart1.c: 678: void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
;	-----------------------------------------
;	 function UART1_ClearFlag
;	-----------------------------------------
_UART1_ClearFlag:
;	../src/stm8s_uart1.c: 694: }
	ret
;	../src/stm8s_uart1.c: 709: ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
;	-----------------------------------------
;	 function UART1_GetITStatus
;	-----------------------------------------
_UART1_GetITStatus:
;	../src/stm8s_uart1.c: 784: return 0;
	clr	a
;	../src/stm8s_uart1.c: 785: }
	ret
;	../src/stm8s_uart1.c: 812: void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
;	-----------------------------------------
;	 function UART1_ClearITPendingBit
;	-----------------------------------------
_UART1_ClearITPendingBit:
;	../src/stm8s_uart1.c: 828: }
	ret
	.area CODE
	.area CONST
___str_0:
	.ascii "../src/stm8s_uart1.c"
	.db 0x00
	.area INITIALIZER
	.area CABS (ABS)
