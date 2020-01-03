; 
; T O N Y  D E E
; Lists definitions
; 
; 
; 
	include "exec/types.i"
	
	
	
	STRUCTURE TNODE,0
	APTR	tn_Next
	APTR	tn_Prev
	LABEL	TN_SIZE
	
	
	STRUCTURE TLIST,0
	APTR	tn_First
	APTR	tn_Last
	LABEL	TL_SIZE
	
	
	STRUCTURE NAPHEAD,0
	STRUCT	TL_SIZE,mh_Maps
	UWORD	mh_ItemSize
	UWORD	mh_GlobalItems
	UWORD	mh_UsedItems
	UWORD	mh_EachMapItems
	LABEL	MH_SIZE
	
	
	STRUCTURE LISTHEAD,0
	STRUCT	TL_SIZE,lh_List
	UWORD	tl_UsedItems
	LABEL	LH_SIZE
	
	
ADDNEXT	MACRO
	MOVE.L	\1,tn_Next(\2)
	ENDM
	
ADDPREV	MACRO
	MOVE.L	\1,tn_Prev(\2)
	END
	
ADDHEAD	MACRO			; to finish and check
	ADDPREV	\1,tl_First(\2)
	TST.L	\1
	BEQ.L
