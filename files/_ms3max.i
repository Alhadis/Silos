; tony dee © 1992
; 
; basical macros for MS3 language
; F  U  T  U  R  E
; 
; 


GETNAME		MACRO
		JSR	_AS_getname
		MOVE.W	D0,D0
		$ BEQ	__noname
		ENDM
