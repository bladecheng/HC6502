;
; File generated by cc65 v 2.17 - Git 180bb082
;
	.fopt		compiler,"cc65 v 2.17 - Git 180bb082"
	.setcpu		"6502"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	off
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.import		_vsnprintf
	.import		_gpio_init
	.import		_gpio_write
	.import		_gpio_read
	.import		_mdelay
	.export		_vga_printf
	.export		_vga_ctrl
	.export		_vga_init
	.export		_vi
	.export		_vga_write
	.export		_vga_putc
	.export		_vga_puts

.segment	"DATA"

_vi:
	.dword	$7F2000B2
	.dword	$7F2000B3
	.dword	$7F4000A0
	.dword	$7F4000A1
	.dword	$7F4000A2
	.dword	$7F4000A3
	.dword	$7F4000A4
	.dword	$7F4000A5
	.dword	$7F4000A6
	.dword	$7F4000A7

; ---------------------------------------------------------------
; int __near__ vga_printf (__near__ const unsigned char *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_vga_printf: near

.segment	"DATA"

L00CD:
	.byte	$00
	.res	127,$00

.segment	"CODE"

	jsr     enter
	jsr     decsp6
	ldy     #$06
	lda     (sp),y
	jsr     leaa0sp
	jsr     incax5
	jsr     stax0sp
	lda     #<(L00CD)
	ldx     #>(L00CD)
	jsr     pushax
	lda     #$80
	jsr     pusha0
	ldy     #$0A
	lda     (sp),y
	jsr     leaa0sp
	dey
	jsr     incaxy
	jsr     pushw
	ldy     #$07
	jsr     ldaxysp
	jsr     _vsnprintf
	jsr     axlong
	ldy     #$02
	jsr     steaxysp
	lda     #<(L00CD)
	ldx     #>(L00CD)
	jsr     pushax
	jsr     _vga_puts
	ldy     #$03
	jsr     ldaxysp
	ldy     #$06
	jmp     leavey

.endproc

; ---------------------------------------------------------------
; long __near__ vga_ctrl (unsigned long)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_vga_ctrl: near

.segment	"CODE"

	jsr     enter
	ldy     #$0B
	jsr     subysp
	ldy     #$0B
	lda     (sp),y
	jsr     leaa0sp
	jsr     incax8
	jsr     stax0sp
	ldy     #$0B
	lda     (sp),y
	jsr     leaa0sp
	jsr     incax8
	jsr     ldeaxi
	ldy     sreg+1
	cpy     #$00
	jne     L006B
	ldy     sreg
	cpy     #$00
	jne     L006B
	cpx     #$00
	jne     L006B
	cmp     #$80
	beq     L006E
	cmp     #$81
	beq     L00F3
	cmp     #$82
	beq     L0087
	cmp     #$83
	beq     L006E
	cmp     #$84
	jne     L00F4
L006E:	ldy     #$0B
	lda     (sp),y
	jsr     leaa0sp
	jsr     incax8
	sta     ptr1
	stx     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	jmp     L00F6
L00F3:	lda     #$02
	jsr     subeq0sp
	sta     ptr1
	stx     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	ldy     #$02
	sta     (sp),y
	ldy     #$0B
	lda     (sp),y
	jsr     leaa0sp
	jsr     incax8
	sta     ptr1
	stx     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	jmp     L00FA
L0087:	ldy     #$0B
	lda     (sp),y
	jsr     leaa0sp
	jsr     incax8
	sta     ptr1
	stx     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	jsr     pusha
	jsr     _vga_write
	ldx     #$00
	lda     #$04
	jsr     subeq0sp
	jsr     ldeaxi
	ldy     #$07
	jsr     steaxysp
	ldx     #$00
	lda     #$04
	jsr     subeq0sp
	jsr     ldeaxi
	ldy     #$03
	jsr     steaxysp
	ldx     #$00
	lda     #$02
	jsr     subeq0sp
	sta     ptr1
	stx     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	ldy     #$02
	sta     (sp),y
	ldy     #$07
	lda     (sp),y
	jsr     pusha
	jsr     _vga_write
	ldy     #$03
	lda     (sp),y
L00FA:	jsr     pusha
	jsr     _vga_write
	ldy     #$02
	lda     (sp),y
L00F6:	jsr     pusha
	jsr     _vga_write
L006B:	ldx     #$00
L00F4:	stx     sreg
	stx     sreg+1
	txa
	ldy     #$0B
	jmp     leavey

.endproc

; ---------------------------------------------------------------
; void __near__ vga_init (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_vga_init: near

.segment	"CODE"

	jsr     decsp1
	lda     _vi+3
	sta     sreg+1
	lda     _vi+2
	sta     sreg
	ldx     _vi+1
	lda     _vi
	jsr     pusheax
	lda     #$01
	jsr     pusha
	jsr     _gpio_init
	lda     _vi+4+3
	sta     sreg+1
	lda     _vi+4+2
	sta     sreg
	ldx     _vi+4+1
	lda     _vi+4
	jsr     pusheax
	lda     #$00
	jsr     pusha
	jsr     _gpio_init
	lda     #$00
	tay
L00FD:	sta     (sp),y
	cmp     #$08
	bcs     L00E5
	ldx     #$00
	lda     (sp),y
	jsr     aslax2
	clc
	adc     #<(_vi+8)
	tay
	txa
	adc     #>(_vi+8)
	tax
	tya
	jsr     ldeaxi
	jsr     pusheax
	lda     #$01
	jsr     pusha
	jsr     _gpio_init
	ldy     #$00
	lda     (sp),y
	clc
	adc     #$01
	jmp     L00FD
L00E5:	lda     _vi+3
	sta     sreg+1
	lda     _vi+2
	sta     sreg
	ldx     _vi+1
	lda     _vi
	jsr     pusheax
	lda     #$00
	jsr     pusha
	jsr     _gpio_write
	jmp     incsp1

.endproc

; ---------------------------------------------------------------
; unsigned char __near__ vga_write (unsigned char)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_vga_write: near

.segment	"CODE"

	jsr     decsp1
	lda     _vi+3
	sta     sreg+1
	lda     _vi+2
	sta     sreg
	ldx     _vi+1
	lda     _vi
	jsr     pusheax
	lda     #$00
	jsr     pusha
	jsr     _gpio_write
	lda     #$64
	jsr     pusha0
	jsr     _mdelay
L003B:	lda     _vi+4+3
	sta     sreg+1
	lda     _vi+4+2
	sta     sreg
	ldx     _vi+4+1
	lda     _vi+4
	jsr     pusheax
	jsr     _gpio_read
	cmp     #$01
	bne     L003B
	lda     #$00
	tay
L0102:	sta     (sp),y
	cmp     #$08
	bcs     L0043
	lda     (sp),y
	tay
	lda     #$01
	ldx     #$00
	jsr     aslaxy
	ldy     #$01
	and     (sp),y
	pha
	pla
	beq     L004A
	ldx     #$00
	lda     (sp,x)
	jsr     aslax2
	clc
	adc     #<(_vi+8)
	tay
	txa
	adc     #>(_vi+8)
	tax
	tya
	jsr     ldeaxi
	jsr     pusheax
	lda     #$01
	jmp     L0101
L004A:	tax
	lda     (sp,x)
	jsr     aslax2
	clc
	adc     #<(_vi+8)
	tay
	txa
	adc     #>(_vi+8)
	tax
	tya
	jsr     ldeaxi
	jsr     pusheax
	lda     #$00
L0101:	jsr     pusha
	jsr     _gpio_write
	ldy     #$00
	lda     (sp),y
	clc
	adc     #$01
	jmp     L0102
L0043:	lda     _vi+3
	sta     sreg+1
	lda     _vi+2
	sta     sreg
	ldx     _vi+1
	lda     _vi
	jsr     pusheax
	lda     #$01
	jsr     pusha
	jsr     _gpio_write
L0059:	lda     _vi+4+3
	sta     sreg+1
	lda     _vi+4+2
	sta     sreg
	ldx     _vi+4+1
	lda     _vi+4
	jsr     pusheax
	jsr     _gpio_read
	cmp     #$01
	bne     L0059
	lda     _vi+3
	sta     sreg+1
	lda     _vi+2
	sta     sreg
	ldx     _vi+1
	lda     _vi
	jsr     pusheax
	lda     #$00
	jsr     pusha
	jsr     _gpio_write
	ldy     #$01
	ldx     #$00
	lda     (sp),y
	jmp     incsp2

.endproc

; ---------------------------------------------------------------
; void __near__ vga_putc (unsigned char)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_vga_putc: near

.segment	"DATA"

L00A8:
	.dword	$00000000
L00AA:
	.dword	$00000000

.segment	"CODE"

	ldy     #$00
	lda     (sp),y
	cmp     #$0D
	bne     L0104
	tya
	sta     L00A8
	sta     L00A8+1
	sta     L00A8+2
	sta     L00A8+3
	lda     L00AA+3
	sta     sreg+1
	lda     L00AA+2
	sta     sreg
	ldx     L00AA+1
	lda     L00AA
	jsr     saveeax
	ldy     #$01
	jsr     inceaxy
	sta     L00AA
	stx     L00AA+1
	ldy     sreg
	sty     L00AA+2
	ldy     sreg+1
	sty     L00AA+3
	jsr     resteax
	lda     L00AA+3
	sta     sreg+1
	lda     L00AA+2
	sta     sreg
	ldx     L00AA+1
	lda     L00AA
	jsr     pusheax
	ldx     #$00
	stx     sreg
	stx     sreg+1
	lda     #$14
	jsr     toseqeax
	beq     L00A7
	lda     #$00
	sta     L00AA
	sta     L00AA+1
	sta     L00AA+2
	sta     L00AA+3
	jmp     incsp1
L0104:	lda     (sp),y
	cmp     #$0A
	beq     L00A7
	ldx     #$00
	lda     #$82
	jsr     push0ax
	lda     L00A8+3
	sta     sreg+1
	lda     L00A8+2
	sta     sreg
	ldx     L00A8+1
	lda     L00A8
	jsr     pusheax
	lda     L00AA+3
	sta     sreg+1
	lda     L00AA+2
	sta     sreg
	ldx     L00AA+1
	lda     L00AA
	jsr     pusheax
	ldy     #$0C
	lda     (sp),y
	jsr     pusha0
	ldy     #$0E
	jsr     _vga_ctrl
	lda     L00A8+3
	sta     sreg+1
	lda     L00A8+2
	sta     sreg
	ldx     L00A8+1
	lda     L00A8
	jsr     saveeax
	ldy     #$01
	jsr     inceaxy
	sta     L00A8
	stx     L00A8+1
	ldy     sreg
	sty     L00A8+2
	ldy     sreg+1
	sty     L00A8+3
	jsr     resteax
L00A7:	jmp     incsp1

.endproc

; ---------------------------------------------------------------
; void __near__ vga_puts (__near__ unsigned char *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_vga_puts: near

.segment	"CODE"

	jsr     decsp2
	ldx     #$00
	txa
L0106:	jsr     stax0sp
	clc
	ldy     #$02
	adc     (sp),y
	sta     ptr1
	txa
	iny
	adc     (sp),y
	sta     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	beq     L00C0
	jsr     ldax0sp
	clc
	ldy     #$02
	adc     (sp),y
	sta     ptr1
	txa
	iny
	adc     (sp),y
	sta     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	jsr     pusha
	jsr     _vga_putc
	jsr     ldax0sp
	jsr     incax1
	jmp     L0106
L00C0:	jmp     incsp4

.endproc

