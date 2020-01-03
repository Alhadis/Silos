;Line drawing includes

GetPixelGroupCount:
	;returns number of [d3 pixel] groups between d0 and d7
	move.l	d7,d2
	sub.l	d0,d2
	divu	d3,d2
	swap	d2
	clr.w	d2
	swap	d2
	;d2 now = number of pixel groups...
	subq	#1,d2 ;...minus 1 for DBRA to work properly
	rts

DrawHorizontalLine:
	;d0 = x0
	;d7 = x1
	;d1 = y coord
	PUSHREG	d0

Draw256HorizontalPixels:
;how many groups of 256 pixels do we need to plot?
	move.l	#256,d3
	jsr	GetPixelGroupCount
	cmp	#$FFFF,d3
	jmp	Draw8HorizontalPixels ;fall through to 32 pixels

	lea	.256pxloopreturn,a6
.256pxloop:
	jmp	Plot256HiResPixels
.256pxloopreturn:
	add.l	#256,d0
	dbra	d2,.256pxloop
	;Fall through to 32 pixels

Draw32HorizontalPixels:
	move.l	#32,d3 ;32 pixel group
	JSR	GetPixelGroupCount
	cmp	#$FFFF,d3
	beq	Draw8HorizontalPixels
	
	lea	.32pxloopreturn,a6
.32pxloop:
	jmp	Plot32HiResPixels
.32pxloopreturn:
	add.l	#32,d0
	dbra	d2,.32pxloop
	;Fall through to 16 pixels

Draw16HorizontalPixels:
	move.l	#16,d3 ;16 pixel group
	JSR	GetPixelGroupCount
	cmp	#$FFFF,d3
	beq	Draw16HorizontalPixels
	
	lea	.16pxloopreturn,a6
.16pxloop:
	jmp	Plot16HiResPixels
.16pxloopreturn:
	add.l	#16,d0
	dbra	d2,.16pxloop
	;Fall through to 8 pixels

;Draw a horizontal line.
;Inputs: d0 = x0, d1 = x1, d7 = y
M_HorizLine			MACRO
					move.l	\1,d0
					move.l	\2,d7
					move.l	\3,d1
					JSR	DrawHorizontalLine
					ENDM

Draw8HorizontalPixels:
;how many groups of 8 pixels do we need to plot?
	move.l	#8,d3
	jsr	GetPixelGroupCount
	cmp	#$FFFF,d3
	beq	Draw1HorizontalPixel ;fall through to 1 pixel
	
	;Fast subroutine call:
	;Put the return label in a6
	;then JMP to the subroutine instead of JSR
	;to return, use JMP (a6) at the end of the subroutine
	lea	.8pxloopreturn,a6
.8pxloop:
	jmp	Plot8HiResPixels
.8pxloopreturn:
	addq.l	#8,d0
	dbra	d2,.8pxloop
	;Fall through to 1px groups

Draw1HorizontalPixel:
	cmp	d0,d7
	beq	.done
	jsr	PlotHiResPixel
	addq.l	#1,d0
	jmp	Draw1HorizontalPixel

.done:
	POPREG	d0
	rts

Plot256HiResPixels:
	PUSHREG	d0-d7/a4
	
	lsr	d0
	lsr	d0
	lsr	d0
	add.w	d0,a4 ;a4 = GFX_BASE + x

	mulu	#80,d1
	add.l	d1,a4 ;a4 = GFX_BASE + x + (scanline * 80 bytes)

	move.l	#$FFFFFFFF,d0
	move.l	d0,d1
	move.l	d0,d2
	move.l	d0,d3
	move.l	d0,d4
	move.l	d0,d5
	move.l	d0,d6
	move.l	d0,d7
	movem.l	d0-d7,(a4)

	POPREG	d0-d7/a4
	JMP	(a6)
Plot32HiResPixels:
	;d0 = horizontal coordinate
	;d1 = vertical coordinate
	PUSHREG	d0-d1/a4

	;Get the memory byte by dividing
	;the X coordinate by 8
	lsr	d0
	lsr	d0
	lsr	d0
	add.w	d0,a4 ;a4 = GFX_BASE + x

	mulu	#80,d1 ;get vertical pixel offset, 480/8 = 80
	add.l	d1,a4 ;a4 = GFX_BASE + x + (scanline * 80 bytes)

	move.l	#$FFFFFFFF,(a4) ;plot 8 pixels

	POPREG	d0-d1/a4
	JMP	(a6)
	;rts

Plot16HiResPixels:
	;d0 = horizontal coordinate
	;d1 = vertical coordinate
	PUSHREG	d0-d1/a4

	;Get the memory byte by dividing
	;the X coordinate by 8
	lsr	d0
	lsr	d0
	lsr	d0
	add.w	d0,a4 ;a4 = GFX_BASE + x

	mulu	#80,d1 ;get vertical pixel offset, 480/8 = 80
	add.l	d1,a4 ;a4 = GFX_BASE + x + (scanline * 80 bytes)

	move.w	#$FFFF,(a4) ;plot 8 pixels

	POPREG	d0-d1/a4
	JMP	(a6)
	;rts

Plot8HiResPixels:
	;d0 = horizontal coordinate
	;d1 = vertical coordinate
	PUSHREG	d0-d1/a4

	;Get the memory byte by dividing
	;the X coordinate by 8
	lsr	d0
	lsr	d0
	lsr	d0
	add.w	d0,a4 ;a4 = GFX_BASE + x

	mulu	#80,d1 ;get vertical pixel offset, 480/8 = 80
	add.l	d1,a4 ;a4 = GFX_BASE + x + (scanline * 80 bytes)

	move.b	#$FF,(a4) ;plot 8 pixels

	POPREG	d0-d1/a4
	JMP	(a6)
	;rts

PlotHiResPixel:
	;d0 = horizontal coordinate
	;d1 = vertical coordinate
	;a4 = GFX_BASE
	PUSHREG d0-d2/a4

	;horizontal plotting
	;move.l	#400,d0 ;pixel number to plot
	divu	#8,d0 ;divide pixel number by 8 to get mem byte
	move.l	d0,d2 ;move it to a buffer
	clr.w	d2 ;clear the word
	swap	d2 ;swap the remainder into d2.w
	jsr	BitIndex ;d3 = the bit pattern to plot
	add.w	d0,a4

	;vertical plotting
	mulu	#80,d1 ;640px wide / 8 = 80
	add.l	d1,a4

	;plot the pixel and return
	or.b	d3,(a4)

	POPREG	d0-d2/a4
	rts

BitIndex:
	move.w	d0,d4
	move.b	#%10000000,d3
	lsr.l	d2,d3
	RTS		
