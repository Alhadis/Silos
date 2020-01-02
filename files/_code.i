; tony dee (c) 1992
; 
; 

	include "exec/types.i"
	include "tonylists.i"
	
	
CPIECE		EQU		2
	
	
	
	STRUCTURE GROUP,0
	APTR	gr_ghandle
	APTR	gr_pmap
	APTR	gr_sna
	APTR	gr_name
	APTR	gr_file
	APTR	gr_curitem
	STRUCT	gr_couple,CP_SIZE
	APTR	gr_taskdata
	LABEL	GR_SIZE	
	
	
	STRUCTURE MAKEVAR,0
	STRUCT	mv_ArcNode,TNODE
	APTR	nv_Definition
	STRUCT	nv_CodeLoc,CODEVAR
	UWORD	nv_Header
	WORD	nv_Mode
	WORD	nv_Dims
	BOOL	nv_Name
	WPTR	nv_NameValue
	WPTR	nv_Lives
	WPTR	nv_Dies
	UWORD	nv_Times
	LABEL	MV_SIZE
	
	
	
	STRUCTURE HUNK,0
	APTR	h_NextHunk
	UWORD	h_Model
	UWORD	h_AllocatedWords
	UWORD	h_LastUsedWord
	UWORD	h_FirstEmpty
	UWORD	h_LastEmpty
	APTR	h_CurrentWord
	UWORD	h_References
	LABEL	HUNKSIZE
	
HID_HEADER	EQU	$03F3
HID_DATA	EQU	$03EA
HID_CODE	EQU	$03EB
HID_RELOC	EQU	$03EC
HID_CLOSEFILE	EQU	$03F2
HID_CLOSEHUNK	EQU	$03F2
;HID_		EQU	$03
;HID_		EQU	$03
	
	
	STRUCTURE HC,0
	STRUCT	hc_Hunks,TLIST
	ULONG	hc_TotCode
	ULONG	hc_TotAlloc
	LABEL	HCSIZE
	
MPUSH		EQU	$48E0
MPOP		EQU	$4CD8
SHIFTER		EQU	$E000
RETURN		EQU	$4E75
TEST		EQU	$4A00
COMPARE		EQU	$B000
	
	STRUCTURE BUNCH,0
	UBYTE	bc_cnum
	STRUCT	bc_code * 5
	LABEL	BUNCHSIZE
	
	
	STRUCTURE GBUNCH,0
	UWORD	gb_bunches
	UWORD	gb_used
	LABEL	GBSIZE
	
	STRUCTURE REG,0
	UBYTE	reg_Status
	APTR	reg_Description
	LABEL	REGSIZE
	
RS_FREE		EQU	$00
RS_VAR		EQU	$01
RS_POINTERTOVAR	EQU	$02
RS_LIBRARY	EQU	$03
RS_STACK	EQU	$04
RS_LOCALSAREA	EQU	$05
RS_ACTION	EQU	$06
RS_OBJECT	EQU	$07
RS_STARTUPSTACK	EQU	$08
RS_INITIALSTACK	EQU	$09
RS_LIBNAME	EQU	$0A
;RS_		EQU	$0
;RS_		EQU	$0	-- may be used in the future...
RS_UNUSED	EQU	$ff

	
	STRUCTURE VREGP,0
	APTR	var
	LABEL	VRPSIZE
	
	STRUCTURE REGMAP,0
	UWORD	rm_regcount
	STRUCT	rm_regs,REGSIZE*14
	STRUCT	rm_vars,VRPSIZE*14
	LABEL	RMSIZE
	
	STRUCTURE TASKDATA,0
	APTR	td_DOSBase
	LABEL	TDSIZE
	
; coding conventions
; 
; D7 --> stack pointer (AT A SAFE PLACE...)
; A3 --> current var data pointer
; D3 --> last var
; D2 --> last var (OPTIONALLY, FOR CALCULATING)
; A4 --> pointer to GROUP
; A5 --> regs
; A6 --> current library
; 
; 
; 
; 

GETVAR	MACRO
	MOVE.L	(A3)+,D3
	MEND
	
_GETVAR	MACRO
	MOVE.L	(A3)+,D2
	MEND
	
EXTV	MACRO
	MOVE.L	D3,D2
	MEND
	
EXEC	MACRO
	MOVEA.L	4,A6
	MEND
	
GETDOS	MACRO
	MOVEA.L	gr_taskdata(A4),A0
	MOVEA.L	td_DOSBase(A0),A6
	MEND
	
NIB	MACRO
	ANDI.W	%1111000000000000,D2
	ASR.W	#6,D2			; shift it to the right
	ASR.W	#6,D2			; (nearly...)
	MEND
	
; offsetting....
	
BASE	MACRO
___OFFBASE	SET	\1
	MEND
	
_OFF	MACRO
	public	OFF_\1
	
	DC.W	\1-___OFFBASE
	MEND
	
DONIB	MACRO
	NIB
	LEA	_offsets,A1
	LEA	_jumps,A0
	MOVE.W	(A1,D2),D0
	JMP	(A0,D0)
	MEND
	
VARLEN	MACRO
	ASR.W	#8,D2
	MEND
		
NEXTVAR	MACRO
	ASR.W	#8,D2
	ADDA.L	D2,A3
	MEND
	
