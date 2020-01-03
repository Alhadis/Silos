PUSHL	MACRO
	movem.l	\1,-(sp)
	ENDM
		
POPL	MACRO
	movem.l	(sp)+,\1
	ENDM

M_OpenLibrary	MACRO
	clr.l	d0
	move.l	\1,a1
	CALLEXEC OldOpenLibrary
	move.l	d0,\2
	ENDM

M_CloseLibrary	MACRO
	clr.l	d0
	move.l	\1,a1
	CALLEXEC CloseLibrary
	ENDM

M_GetFileSize	MACRO	;\1 = file handle, \2 = ptr to file info block
	move.l	\1,d1
	move.l	\2,d2
	CALLDOS	ExamineFH
	ENDM	

M_AllocMem	MACRO
	move.l	\1,d0	;ULONG byteSize
	move.l	\2,d1	;ULONG attributes
	CALLEXEC AllocMem
	ENDM

M_FreeMem	MACRO
	move.l	\1,a0	;void* memoryBlock
	move.l	\2,d1	;ULONG byteSize
	CALLEXEC FreeMem
	ENDM

	;IFF handling
TYPE_ILBM	equ		"ILBM"
CHNK_BMHD	equ		"BMHD"
CHNK_CMAP	equ		"CMAP"
CHNK_BODY	equ		"BODY"
	
M_DeclarePropChunk	MACRO
	move.l	\2,d0 	;type, e.g. "ILBM"
	move.l	\3,d1	;chunk name, e.g. "BMHD"
	move.l	\1,a0	;pointer to IFF handle
	CALLIFF	PropChunk
	ENDM
	
M_DeclareStopChunk	MACRO
	move.l	\2,d0	;type
	move.l	\3,d1	;chunk name
	move.l	\1,a0	;pointer to IFF handle
	CALLIFF	StopChunk
	ENDM
	
M_ReadChunkBytes	MACRO
	move.l	\1,d0	;bytes to read
	move.l	\2,a0	;IFF handle ptr
	move.l	\3,a1	;destination ptr
	CALLIFF	ReadChunkBytes
	ENDM
	
M_ParseIFF	MACRO
	move.l	\1,a0
	move.l	\2,d0
	CALLIFF	ParseIFF
	ENDM
	
M_OpenFrame	MACRO
	move.l	\4,d1	;ptr to filename
	move	#MODE_OLDFILE,d2
	CALLDOS	Open
	move.l	d0,\2

	CALLIFF	AllocIFF
	move.l	d0,\1	;skullIFFHandlePtr

	move.l	\1,a0
	CALLIFF	InitIFFasDOS	

	move.l	\2,iff_Stream(a0) ;skullFileHandle

	move.l	\1,a0
	move.l	IFFF_READ,d0
	CALLIFF	OpenIFF

	move.l	\3,a1 ;skullFrame(N)Ptr
	JSR	ProcessIFF

	;Close and deallocate the IFF
	move.l	\1,a0
	CALLIFF	CloseIFF
	move.l	\1,a0
	CALLIFF	FreeIFF

	;Close the file handle
	move.l	\2,d1
	CALLDOS	Close
	
	ENDM