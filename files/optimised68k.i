;//****************************************************************************//
;//**                                                                        **//
;//** File:         libsrc/plat/amigaos3_68k/systemlib/optimised68K.asm      **//
;//** Description:  Useful performance optimisations for 68K assembler       **//
;//** Comment(s):                                                            **//
;//** Library:      systemlib                                                **//
;//** Created:      2003-02-09                                               **//
;//** Updated:      2003-02-09                                               **//
;//** Author(s):    Karl Churchill                                           **//
;//** Note(s):      Asm definitions for 68K Mem class functions              **//
;//** Copyright:    (C)1996-2003, eXtropia Studios                           **//
;//**               Karl Churchill                                           **//
;//**               All Rights Reserved.                                     **//
;//**                                                                        **//
;//****************************************************************************//


;// Quick unsigned multiplication routines

; QMULU.(w|l) N d(target) d(scratch)

	MACRO QMULU
; QMULU.l long operation
	IFC	"\0","l"
; 1x
	IFC "\1","1"
	ENDC
; 2x
	IFC "\1","2"
	add.l \2,\2
	ENDC
; 3x
	IFC "\1", "3"
	move.l \2, \3
	add.l \2, \2
	add.l \3, \2
	ENDC
; 4x
	IFC "\1", "4"
	lsl.l #2, \2
	ENDC
; 5x
	IFC "\1", "5"
	move.l \2, \3
	lsl.l #2, \2
	add.l \3, \2
	ENDC
; 6x
	IFC "\1", "6"
	add.l \2, \2
	move.l \2, \3
	add.l \2, \2
	add.l \3, \2
	ENDC
; 7x
	IFC "\1", "7"
	move.l \2, \3
	lsl.l #3, \2
	sub.l \3, \2
	ENDC
; 8x
	IFC "\1", "8"
	lsl.l #3, \2
	ENDC
; 9x
	IFC "\1", "9"
	move.l \2, \3
	lsl.l #3, \2
	add.l	\3,\2
	ENDC
; 10x
	IFC "\1", "10"
	add.l	\2,\2
	move.l \2, \3
	lsl.l #2, \2
	add.l	\3,\2
	ENDC
; long
	ENDC

; QMULU.w word operation
	IFC "\0","w"
; 1x
	IFC "\1","1"
	ENDC
; 2x
	IFC "\1","2"
	add.l \2,\2
	ENDC
; 3x
	IFC "\1", "3"
	move.l \2, \3
	add.l \2, \2
	add.l \3, \2
	ENDC
; 4x
	IFC "\1", "4"
	lsl.l #2, \2
	ENDC
; 5x
	IFC "\1", "5"
	move.l \2, \3
	lsl.l #2, \2
	add.l \3, \2
	ENDC
; 6x
	IFC "\1", "6"
	add.l \2, \2
	move.l \2, \3
	add.l \2, \2
	add.l \3, \2
	ENDC
; 7x
	IFC "\1", "7"
	move.l \2, \3
	lsl.l #3, \2
	sub.l \3, \2
	ENDC
; 8x
	IFC "\1", "8"
	lsl.l #3, \2
	ENDC
; 9x
	IFC "\1", "9"
	move.l \2, \3
	lsl.l #3, \2
	add.l	\3,\2
	ENDC
; 10x
	IFC "\1", "10"
	add.l	\2,\2
	move.l \2, \3
	lsl.l #2, \2
	add.l	\3,\2
	ENDC
; // QMULU
	ENDC


	MACRO QMULS

; long operation
	IFC	"\0","l"

; 2x
	IFC "\1","2"
	add.l \2,\2
	ENDC
; 3x
	IFC "\1", "3"
	move.l \2, \3
	add.l \2, \2
	add.l \3, \2
	ENDC
; 4x
	IFC "\1", "4"
	lsl.l #2, \2
	ENDC
; 5x
	IFC "\1", "5"
	move.l \2, \3
	asl.l #2, \2
	add.l \3, \2
	ENDC
; 6x
	IFC "\1", "6"
	add.l \2, \2
	move.l \2, \3
	add.l \2, \2
	add.l \3, \2
	ENDC
; 7x
	IFC "\1", "7"
	move.l \2, \3
	asl.l #3, \2
	sub.l \3, \2
	ENDC
; 8x
	IFC "\1", "8"
	lsl.l #3, \2
	ENDC
; 9x
	IFC "\1", "9"
	move.l \2, \3
	asl.l #3, \2
	add.l	\3,\2
	ENDC
; 10x
	IFC "\1", "10"
	add.l	\2,\2
	move.l \2, \3
	asl.l #2, \2
	add.l	\3,\2
	ENDC

	ENDC

; word operation
	IFC "\0","w"

	ENDC