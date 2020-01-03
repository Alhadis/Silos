* _________________________________________________________________ / / /_
*                                                                  / / /
* Flashtro.com                                              ____  / / /
* cracktro source                                           \   \/ / /
* ________________________________________ powered by AMIGA _\ \ \/ /_____
*                                                             \_\_\/
* no system Startup
* 


* ----------------------------------- offset execlib
OpenLib	equ	-552
CloseLib	equ	-414	
Forbid	equ	-132
Permit	equ	-138
Supervisor	equ	-30
AllocMem	equ	-$c6
AllocAbs	equ	-$cc
FreeMem	equ	-$d2
CacheControl	equ	-648
AttnFlags	=	296
CACR_CopyBack	=	%10000000000000000000000000000000
CACR_EnableE	=	%1000000000000000000000000000000
CACR_DBE	=	%1000000000000
CACR_ClearD	=	%100000000000
CACR_EnableD	=	%1000000000
CACR_FreezeD	=	%100000000
CACR_IBE	=	%10000
CACR_ClearI	=	%1000
CACR_FreezeI	=	%10
CACR_EnableI	=	%1

* ----------------------------------- offset gfxlib
MrgCop		equ	-210
MakeVPort	equ	-216
LoadView	equ	-222
WaitBlit	equ	-228
WaitTOF		equ	-270
OwnBlit		equ	-456
DisownBlit	equ	-462
ActiView	=	$22
syscop1		=	$26
syscop2		=	$32

* ----------------------------------- offset customs
BLTCON0=$40		
BLTCON1=$42
BLTAFWM=$44
BLTALWM=$46
BLTCPTH=$48
BLTCPTL=$4A
BLTBPTH=$4C
BLTBPTL=$4E
BLTAPTH=$50
BLTAPTL=$52
BLTDPTH=$54
BLTDPTL=$56
BLTSIZE=$58
BLTCMOD=$60
BLTBMOD=$62
BLTAMOD=$64
BLTDMOD=$66
BLTCDAT=$70
BLTBDAT=$72
BLTADAT=$74
DMACONR=$2

* ------------------------------------ offset intena/dmacon
I_setclr=$8000
I_inten=$4000
I_ciab=$2000
I_aud=$3c0
I_Blit=$40
I_Vbl=$20
I_Cop=$10
I_Kb=8
I_Soft=4
I_Disk=2
I_SET=I_setclr!I_inten!I_Vbl

D_init=$8200
D_priB=$400
D_Btpl=$100
D_Copp=$80
D_Blit=$40
D_sprt=$20
D_disk=$10
D_CON=D_init!D_copp!D_Btpl!D_Blit

* ------------------------------------- macro
sync	macro
.vbl\@	move.l	$dff004,d0
	and.l	#$1ff00,d0
	cmp.l	#\1<<8,d0
	bne.b	.vbl\@
	endm
* -------------------------------------

	rsreset
sDma	rs.w	1
intena	rs.w	1
adkcon	rs.w	1
intvbl	rs.l	1
intcia	rs.l	1
GfxBase	rs.l	1
OldView	rs.l	1
OldCop1	rs.l	1
OldCop2	rs.l	1
sVBR	rs.l	1
cachebits_old	rs.l	1
Aga	rs.b	2
* ------
Timer	rs.l	1
flagVbl	rs.w	1
* ------ system fader
sav4vp	rs.l	1
numcol	rs.w	1
syspal	rs.w	32
VARSIZE	rs.w	0

* --------------------------------------------------------
* - STARTUP
* --------------------------------------------------------
Start:	movem.l	d0-d7/a0-a6,-(sp)
	
	lea	VarSys(pc),a5	
	movea.l	a5,a6
	move.w	#Varsize-1,d7
.clear	clr.b	(a6)+
	dbf	d7,.clear

	movea.l	4.w,a6
	lea	GfxName(pc),a1
	moveq	#0,d0
	jsr	OpenLib(a6)
	tst.l	d0
	beq	NoGfx
	
	move.l	d0,GfxBase(a5)
	move.l	d0,a6
	bsr	FadeOutSystem
	move.l	ActiView(a6),OldView(a5)
	
	suba.l	a1,a1
	jsr	LoadView(a6)
	jsr	WaitTOF(a6)
	jsr	WaitTOF(a6)
	jsr	WaitBlit(a6)
	
	move.l	syscop1(a6),OldCop1(a5)
	move.l	syscop2(a6),OldCop2(a5)

	bsr	GetVBR
; save custom reg
	lea	VarSys(pc),a5
	lea	$dff000,a6

	move.w	$10(a6),d0		;adkcon
	ori.w	#$8000,d0
	move.w	d0,adkcon(a5)
	move.w	2(a6),d0		;dma
	ori.w	#$8000,d0
	move.w	d0,sDma(a5)
	move.w	$1c(a6),d0		;intena
	ori.w	#$8000,d0
	move.w	d0,intena(a5)
	
	bsr	waitraster
	move.w	#$7fff,d0
	move.w	d0,$9a(a6)	; disable interrupts
	move.w	d0,$96(a6)	; stop dma channels
	move.w	d0,$9c(a6)	; stop int requests
	
	movea.l	sVBR(a5),a1
	move.l	$6c(a1),intvbl(a5)
	lea	interrupt(pc),a0
	move.l	a0,$6c(a1)

	move.w	#I_SET,$9a(a6)
	move.w	#D_CON,$96(a6)

	bsr	MAIN

* restore --------
	lea	VarSys(pc),a5
	lea	$dff000,a6

	bsr	waitraster
	move.w	#$7fff,d0
	move.w	d0,$96(a6)
	move.w	d0,$9a(a6)
	move.w	d0,$9c(a6)
		
	movea.l	sVBR(a5),a1
	move.l	intvbl(a5),$6c(a1)
	move.w	intena(a5),$9a(a6)
	move.w	sDma(a5),$96(a6)
	move.w	adkcon(a5),$9e(a6)
	
	move.l	OldCop1(a5),$80(a6)
	move.l	OldCop2(a5),$84(a6)
	move.w	$dff088,d0
	movea.l	GfxBase(a5),a6
	movea.l	OldView(a5),a1
	jsr	LoadView(a6)

	bsr	FadeInSystem

	movea.l	a6,a1
	movea.l	4.w,a6
	jsr	CloseLib(a6)

	ifd	NOCACHE
	move.w	AttnFlags(a6),d0
	beq.b	.nocache		; 68010-040 0-3 ...
	cmpi.w	#36,$14(a6)
	bcs.s	.nocache	; else bug on a500 with 680x0
	move.l	cachebits_old(a5),d0
	move.l	#CACR_CopyBack|CACR_EnableE|CACR_DBE|CACR_ClearD|CACR_EnableD|CACR_FreezeD|CACR_IBE|CACR_ClearI|CACR_FreezeI|CACR_EnableI,d1
	jsr	CacheControl(a6)
.nocache
	endc

NoGfx	movem.l	(sp)+,d0-d7/a0-a6
	moveq	#0,d0
	rts
* --------------------------------------------
GetVBR:	movea.l	4.w,a6
	btst	#0,$129(a6)	; 68010+ ?
	beq.s	.68k
	
	lea	SuperCode(pc),a5
	jsr	Supervisor(a6)
	
	lea	VarSys(pc),a5
	move.l	d0,sVBR(a5)

	ifd	NOCACHE
	; Disable caches
	; -------------
	cmpi.w	#36,$14(a6)
	bcs.s	.68k	; else bug on a500 with 680x0
	moveq	#0,d0
	move.l	#CACR_CopyBack|CACR_EnableE|CACR_DBE|CACR_ClearD|CACR_EnableD|CACR_FreezeD|CACR_IBE|CACR_ClearI|CACR_FreezeI|CACR_EnableI,d1
	jsr	CacheControl(a6)
	move.l	d0,cachebits_old(a5)
	endc

.68k	rts
	CNOP	0,4
SuperCode:	
	dc.l	$4e7a0801	
	;movec Vbr,d0		; 680x0
	rte
* --------------------------------------------
interrupt:	
	movem.l	a0-a6/d0-d7,-(sp)

	lea	$dff000,a6	
	andi.w	#$20,$1e(a6)	; interruption vbl
	beq.s	.noInt

	lea	VarSys(pc),a5
	st	flagVbl(a5)
	
	move.l	VBLpt(pc),d0
	beq.s	.okVbl
	move.l	d0,a0
	jsr	(a0)

.okVbl	move.w	#$0020,$dff09c	; twice
	move.w	#$0020,$dff09c
.noInt	movem.l	(sp)+,a0-a6/d0-d7	
	rte
* --------------------------------------------
Inst_plans:		
	move.w	d0,6(a0)
	swap	d0			
	move.w 	d0,2(a0)
	swap	d0
	tst.w	d1
	beq.s	.fin
	add.l	d2,d0
	addq.l	#8,a0
	subq.w	#1,d1
	bra.s	inst_plans
.fin	rts
* --------------------------------------------
waitblitter	
	btst	#6,$dff002
.wait	btst	#6,$dff002
	bne.s	.wait
	rts
* --------------------------------------------
waitraster
	movem.l	d0,-(sp)
.loop	move.l	$dff004,d0
	and.l	#$1ff00,d0
	cmp.l	#WRASTER<<8,d0
	bne.b	.loop
	movem.l	(sp)+,d0
	rts

waitvbl	moveq	#0,d7
	lea	VarSys(pc),a0
.loop	sf	flagVbl(a0)
.wait:	tst.b	flagVbl(a0)
	beq.s	.wait
	dbf	d7,.loop
	rts
* --------------------------------------------------------
* - Fader System
* - a5=Vars
* - a6=GfxBase
* --------------------------------------------------------
FadeOutSystem:
	movea.l	ActiView(a6),a3
	movea.l	(a3),a3		; viewport
	movea.l	4(a3),a2
	move.l	a2,sav4vp(a5)
	move.w	2(a2),d7	; number of colors
	cmp.w	#31,d7
	blt.s	.inf
	moveq	#32,d7
.inf:
	subq.w	#1,d7
	move.w	d7,numcol(a5)	; number of colors
	lea	syspal(a5),a0
	movea.l	4(a2),a1	; palette
.copy	move.w	(a1)+,(a0)+	; save system palette
	dbf	d7,.copy

	moveq	#16-1,d7
.loopfade:
	move.w	numcol(a5),d6
	movea.l	4(a2),a1
.loopcol:
	move.w	(a1),d0
	move.w	d0,d1
	andi.w	#$F00,d1
	tst.w	d1
	beq.s	.green
	subi.w	#$100,d0
.green:
	move.b	d0,d1
	andi.b	#$F0,d1
	tst.b	d1
	beq.s	.blue
	subi.b	#$10,d0
.blue:
	move.b	d0,d1
	andi.b	#$F,d1
	tst.b	d1
	beq.s	.next
	subq.b	#1,d0
.next:
	move.w	d0,(a1)+
	dbf	d6,.loopcol

	jsr	WaitTOF(a6)
	movea.l ActiView(a6),a0
	movea.l	a3,a1
	jsr	MakeVPort(a6)	; a0=view / a1=viewport
	movea.l	ActiView(a6),a1
	jsr	MrgCop(a6)	; a1=view
	movea.l	ActiView(a6),a1
	jsr	LoadView(a6)

	dbf	d7,.loopfade
	rts
* ------------------- Fade In
FadeInSystem:
	movea.l	ActiView(a6),a3
	movea.l	(a3),a3		; viewport
	movea.l	sav4vp(a5),a2

	moveq	#16-1,d7
.loopfade:
	move.w	numcol(a5),d6
	lea	syspal(a5),a0	; original palette
	movea.l	4(a2),a1
.loopcol:
	move.w	(a0)+,d0
	move.w	(a1),d2
	sub.w	d2,d0
	move.w	d0,d1
	andi.w	#$F00,d1
	tst.w	d1
	beq.s	.green
	addi.w	#$100,d2
.green:
	move.b	d0,d1
	andi.b	#$F0,d1
	tst.b	d1
	beq.s	.blue
	addi.b	#$10,d2
.blue:
	move.b	d0,d1
	andi.b	#$F,d1
	tst.b	d1
	beq.s	.next
	addq.b	#1,d2
.next:
	move.w	d2,(a1)+
	dbf	d6,.loopcol

	jsr	WaitTOF(a6)
	movea.l	ActiView(a6),a0
	movea.l	a3,a1
	jsr	MakeVPort(a6)
	movea.l	ActiView(a6),a1
	jsr	MrgCop(a6)
	movea.l	ActiView(a6),a1
	jsr	LoadView(a6)
	dbf	d7,.loopfade
	rts
* --------------------------------------------------------
InitMusic:
	lea	$dff000,a6

	ifd	PT
	 lea	Module,a0
	 bsr	mt_init
	endc
	ifd	HIP
	 lea	Module,a0
	 jsr	h_initsmpl
	 moveq	#1,d0
	 jsr	h_control
	endc
	ifd	HIPC
	 lea	Module,a0
	 move.l	a0,c_modadr
	 jsr	c_initsmpl
	 moveq	#nr,d0
	 jsr	c_control
	endc
	ifd	HIPC2
	 lea	Module,a0
	 move.l	a0,c_modadr
	 jsr	c_initvocs2
	 moveq	#nr,d0
	 jsr	c_initsubsong
	endc
	ifd	FRED
	 lea	Module,a0
	 moveq	#0,d0
	 jsr	(a0)
	 bset	#1,$bfe001
	endc
	ifd	SID
	 jsr	Module		; initmuzak
	 bset	#1,$bfe001
	endc
	ifd	SID2
	 bsr	INITMUZAK
	endc
	ifd	SA
	 jsr	Module		; Init Pointers
	 moveq	#0,d0		; start song 0
	 jsr	Module+12
	endc
	ifd	FC
	 lea	Module,a0
	 jsr	init
	endc
	ifd	FC14
	 bsr	fc_init
	endc
	ifd	MA
	 moveq	#0,d0
	 jsr	Module
	endc
	ifd	DM
	 moveq	#1,d0			; INIT MUSIC
	 jsr	Module			; CALL THE PLAYER
	endc
	ifd	DMU
	 moveq	#0,d0
	 jsr	muzaxon
	endc
	ifd	BP
	 jsr	bpinit
	endc
	ifd	P61
	 lea	Module,a0
	 suba.l	a1,a1		; samples extern
	 suba.l	a2,a2		; packbuffer
	 moveq	#0,d0		; cia auto/pal/ntsc
	 jsr	P61_Init(pc)	; in a0=module / out a6=$dff000 - d0=ok
	endc
	rts
* ---
StopMusic:
	lea	$dff000,a6

	ifd	PT
	 bsr	mt_end
	endc
	ifd	HIP
	 jsr	h_stop
	 move.w	#0,$DFF0A8
	 move.w	#0,$DFF0B8
	 move.w	#0,$DFF0C8
	 move.w	#0,$DFF0D8
	 bclr	#1,$BFE001
	endc
	ifd	HIPC
	 moveq	#0,d0
	 jsr	c_stop
	 move.w	#0,$DFF0A8
	 move.w	#0,$DFF0B8
	 move.w	#0,$DFF0C8
	 move.w	#0,$DFF0D8
	endc
	ifd	HIPC2
	 moveq	#0,d0
	 jsr	c_stop
	 move.w	#0,$DFF0A8
	 move.w	#0,$DFF0B8
	 move.w	#0,$DFF0C8
	 move.w	#0,$DFF0D8
	endc
	ifd	FRED
	 moveq	#0,d1
	 lea	Module,a0
	 jsr	8(a0)
	 bclr	#1,$bfe001
	 move.w	#$f,$dff096
	 move.w	#0,$DFF0A8
	 move.w	#0,$DFF0B8
	 move.w	#0,$DFF0C8
	 move.w	#0,$DFF0D8
	endc
	ifd	FC
	 jsr	stop
	endc
	ifd	FC14
	 bsr	fc_stop
	endc
	ifd	SID
	 jsr	Module+$120	; stopmuzak
	 move.w	#$f,$dff096
	 move.w	#0,$DFF0A8
	 move.w	#0,$DFF0B8
	 move.w	#0,$DFF0C8
	 move.w	#0,$DFF0D8
	endc
	ifd	SID2
	 bsr	STOPMUZAK	
	endc
	ifd	SA
	 jsr	Module+16
	endc
	ifd	MA
	 move.w	#$f,$dff096
	 clr.w	$DFF0A8
	 clr.w	$DFF0B8
	 clr.w	$DFF0C8
	 clr.w	$DFF0D8
	endc
	ifd	DM
	 move.w	#$f,$dff096
	 move.w	#0,$DFF0A8
	 move.w	#0,$DFF0B8
	 move.w	#0,$DFF0C8
	 move.w	#0,$DFF0D8
	endc
	ifd	DMU
	 jsr	muzaxoff
	endc
	ifd	BP
	 move.w	#$f,$dff096
	 move.w	#0,$DFF0A8
	 move.w	#0,$DFF0B8
	 move.w	#0,$DFF0C8
	 move.w	#0,$DFF0D8
	endc
	ifd	P61
	 jsr	P61_End(pc)	; in a6=$dff000 - already permit
	endc
	rts
* ---
PlayMusic:
	lea	$dff000,a6
	ifd	PT
	 bsr	mt_music
	endc
	ifd	HIP
	 jsr	h_replay
	endc
	ifd	HIPC
	 jsr	c_replay
	endc
	ifd	HIPC2
	 jsr	l_00000320
	endc
	ifd	FRED
	 lea	Module,a0
	 jsr	4(a0)
	endc
	ifd	FC
	 jsr	play
	endc
	ifd	FC14
	 bsr	fc_play
	endc
	ifd	SID
	 jsr	Module+$13e		; playmuzak
	endc
	ifd	SID2
	 bsr	PLAYMUZAK	
	endc
	ifd	SA
	 jsr	Module+24
	endc
	ifd	MA
	 jsr	Module+$C
	endc
	ifd	DM
	 moveq	#0,d0			; SET REPLAY MODE
	 jsr	Module			; CALL THE PLAYER
	endc
	ifd	DMU
	 jsr	player
	endc
	ifd	BP
	 jsr	bpmusic
	endc
	ifd	P61
	;jsr	P61_Music	; nothing if CIA-Timing
	endc
	rts
* --------------------------------------------
GfxName	dc.b	'graphics.library',0
	even
* ---------------------------------------------------------
VarSys	ds.b	VARSIZE
	even
VBLpt	dc.l	0
