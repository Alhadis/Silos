;Line drawing includes

	xdef _main
	xdef BresenhamLine
	xdef BresenhamSteepCheck
	xdef BresenhamAbs1
	xdef BresenhamAbs2
	xdef BresenhamError
	xdef BresenhamYStep
	xdef BresenhamLoop
	xdef B_DrawNotSteep
	xdef B_DrawSteep
	xdef B_CheckError
	xdef B_ErrorIsNegative
	xdef CheckIfBresenhamDone
	xdef BresenhamDone
	xdef PlotHiResPixel
	xdef B_PrepareLoop
	xdef B_CheckSwap
	xdef DrawVerticalLine
	xdef B_IsSteep
	xdef B_CalcDeltas
	xdef DrawHorizontalLine

	xdef Draw256HorizontalPixels
	xdef Draw32HorizontalPixels
	xdef Draw16HorizontalPixels
	xdef Draw8HorizontalPixels
	xdef Draw1HorizontalPixel

	xdef Plot256HiResPixels
	xdef Plot32HiResPixels
	xdef Plot16HiResPixels
	xdef Plot8HiResPixels
	xdef PlotHiResPixel

	xdef GetPixelGroupCount
	xdef Bitfield

M_SwapWords	MACRO
			move.w	\1, d0
			move.w	\2, d1
			move.w	d0, \2
			move.w	d1, \1
			ENDM

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
	PUSHREG	d0-d7

.drawLoop:
	;Short-circuit the fast draw routine.
	JSR		PlotHiResPixel
	add		#1, d0
	cmp.w	d0, d7
	bne		.drawLoop

.done:
	POPREG	d0-d7
	rts

Draw256HorizontalPixels:
;how many groups of 256 pixels do we need to plot?
	move.l	#256,d3
	jsr	GetPixelGroupCount
	cmp	#$FFFF,d2
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
	cmp	#$FFFF,d2
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
	cmp	#$FFFF,d2
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
	cmp	#$FFFF,d2
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
	POPREG	d0-d1,d7
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
	PUSHREG d0-d4/a4

	;horizontal plotting
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

	POPREG	d0-d4/a4
	rts

BitIndex:
	move.w	d0,d4
	move.b	#%10000000,d3
	lsr.l	d2,d3
	RTS		

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DrawVerticalLine:
	;d0 = y0
	;d7 = y1
	;d1 = x coord
	PUSHREG	d0-d7

	move.l	GFX_BASE, a4

	move.w	vertical_line_x, d0
	move.w	vertical_line_y1, d1
	move.w	vertical_line_y2, d2

.loop:
	JSR		PlotHiResPixel
	add.w	#1, d1
	cmp.w	d1, d2
	bne		.loop

	POPREG	d0-d7
	RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
BresenhamLine:
	;d0,d2 = (x1,x2)
	;d1,d3 = (y1,y2)

	;68000 port of my C routine
	;move.w	d0, line_x1
	;move.w	d2, line_x2
	;move.w	d1, line_y1
	;move.w	d3, line_y2

	;Let's do some checks. Is this a vertical line?
.verticalCheck:
	move.w	bresenham_line_x1, d0
	move.w	bresenham_line_x2, d1
	cmp.w	d0, d1
	bne		.horizontalCheck

	;This is a vertical line.
	move.w	bresenham_line_x1, vertical_line_x
	move.w	bresenham_line_y1, vertical_line_y1
	move.w	bresenham_line_y2, vertical_line_y2
	jsr		DrawVerticalLine
	rts
	
.horizontalCheck:
	move.w	bresenham_line_y1, d0
	move.w	bresenham_line_y2, d1
	cmp.w	d0, d1
	bne		.doBresenham

	;This is a horizontal line.
	;d0 = x0
	;d7 = x1
	;d1 = y coord
	clr.l	d0
	clr.l	d1
	clr.l	d7
	move.w	bresenham_line_x1, d0
	move.w	bresenham_line_x2, d7
	move.w	bresenham_line_y1, d1
	jsr		DrawHorizontalLine
	rts

.doBresenham:
	clr.l	d0
	clr.l	d1
	clr.l	d2
	clr.l	d3
	
	;const bool steep = (abs(y2-y1) > abs(x2-x1))

	;abs(y2-y1)
BresenhamAbs1:
	move.w	bresenham_line_y2, d0
	sub.w	bresenham_line_y1, d0
	bpl.b	.abs1_skipneg
	neg.w	d0

.abs1_skipneg:
	move.w	d0, absY

	;abs(x2-x1)
BresenhamAbs2:
	move.w	bresenham_line_x2, d1
	sub.w	bresenham_line_x1, d1
	bpl.b	.abs2_skipneg
	neg.w	d1

.abs2_skipneg:
	move.w	d1, absX

BresenhamSteepCheck:
	move.w	absY, d0
	move.w	absX, d1
	cmp.w	d1, d0
	bhi		B_IsSteep

.isNotSteep:
	move.b	#0, steep
	jmp 	B_CheckSwap

B_IsSteep:
	move.b	#1, steep
	;do some swapping

	;if(steep)
    ;{
    ;    swap(x1, y1);
    ;    swap(x2, y2);
    ;}
	M_SwapWords bresenham_line_x1, bresenham_line_y1
	M_SwapWords bresenham_line_x2, bresenham_line_y2

	jmp		B_CheckSwap

B_CheckSwap:
	;if(x1 > x2){
    ;    swap(x1, x2);
    ;    swap(y1, y2);
    ;}
	move.w	bresenham_line_x1, d0
	move.w	bresenham_line_x2, d1
	cmp.w	d1, d0
	bhi		.doSwap
	jmp		B_CalcDeltas

.doSwap:
	M_SwapWords	bresenham_line_x1, bresenham_line_x2
	M_SwapWords	bresenham_line_y1, bresenham_line_y2
	jmp		B_CalcDeltas

B_CalcDeltas:
    ;const float dx = x2 - x1;
	move.w	bresenham_line_x1, d0
	move.w	bresenham_line_x2, d1
	sub.w	d0, d1
	move.w	d1, deltaX

	;const float dy = fabs(y2 - y1);
	;recalculate absY
BresenhamAbs1_Again:
	move.w	bresenham_line_y2, d0
	sub.w	bresenham_line_y1, d0
	bpl.b	.abs1_skipneg_again
	neg.w	d0

.abs1_skipneg_again:
	move.w	d0, absY
	
	move.w	absY, deltaY

BresenhamError:
	clr.l	d7
	move.w	deltaY, d7
	mulu.w	#2, d7
	sub.w	deltaX, d7
	move.w	d7, b_error

	clr.l	d7
	move.w	deltaY, d7
	mulu.w	#2, d7
	move.w	d7, b_error_dL
	clr.l	d6
	move.w	deltaX, d7
	mulu.w	#2, d6
	sub.w	d6, d7
	move.w	d7, b_error_dU

BresenhamYStep:
	;const int ystep = (y1 < y2) ? 1 : -1;
	move.w	bresenham_line_y1, d0
	move.w	bresenham_line_y2, d1
	cmp.w	d0, d1
	bhi		.ystepPositive
.ystepNegative:
	move.w	#-1, y_step
	jmp		B_PrepareLoop

.ystepPositive:
	move.w	#1, y_step
	jmp		B_PrepareLoop

B_PrepareLoop:
    ;int y = (int)y1;
    ;const int maxX = (int)x2;
	clr.l	d6
	clr.l	d7

	;int x 	will be d4
	;maxX  	will be d5
	;y 		will be d6
	move.w	bresenham_line_y1, d6
	move.w	bresenham_line_y2, d7

	move.w	bresenham_line_x1, d4
	move.w	bresenham_line_x2, d5

BresenhamLoop:
	;for(int x=(int)x1; x<maxX; x++)
	
	cmp.b	#1, steep
	beq		B_DrawSteep

B_DrawNotSteep:
	;d0 = horizontal coordinate
	;d1 = vertical coordinate
	;a4 = GFX_BASE
	;setPixel(pixels, x, y)
	move.w	d4, d0
	move.w	d6, d1
	move.l	GFX_BASE, a4
	jsr		PlotHiResPixel
	jmp		B_CheckError

B_DrawSteep:
	;setPixel(pixels, y, x)
	move.w	d4, d1
	move.w	d6, d0
	move.l	GFX_BASE, a4
	jsr		PlotHiResPixel
	jmp		B_CheckError

B_CheckError:
	move.w	deltaY, d0
	sub.w	d0, b_error
	bmi		B_ErrorIsNegative
	jmp		CheckIfBresenhamDone

B_ErrorIsNegative:
	add		y_step, d6
	move.w	deltaX, d0
	add		d0, b_error

CheckIfBresenhamDone:
	cmp.w	d5, d4
	bcc		BresenhamDone ;true if x >= maxX, meaning we're done iterating
	addi	#1, d4
	jmp		BresenhamLoop

BresenhamDone:
	RTS

	SECTION DATA
	xdef bresenham_line_x1	;ds.w 1
	xdef bresenham_line_x2	;ds.w 1
	xdef bresenham_line_y1	;ds.w 1
	xdef bresenham_line_y2	;ds.w 1
	xdef absX 	;ds.w 1
	xdef absY 	;ds.w 1
	xdef deltaX	;ds.w 1
	xdef deltaY  ;ds.w 1
	xdef b_error ;ds.w 1
	xdef steep 	;ds.b 1

;Vertical line variables
vertical_line_x		ds.w 1
vertical_line_y1	ds.w 1
vertical_line_y2	ds.w 1

;Bresenham variables
bresenham_line_x1 	ds.w 1
bresenham_line_x2	ds.w 1
bresenham_line_y1	ds.w 1
bresenham_line_y2	ds.w 1
absX 	ds.w 1
absY 	ds.w 1
deltaX	ds.w 1
deltaY  ds.w 1
b_error	ds.w 1
b_error_dU	ds.w 1
b_error_dL	ds.w 1
y_step	ds.w 1
steep 	ds.b 1
