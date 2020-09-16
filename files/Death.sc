;;; Sierra Script 1.0 - (do not remove this comment)
;
;	DEATH.SC
;
;	This script handles death scenes, and is triggered by calling
;	the EgoDead procedure with a parameter corresponding to a death message..
;
;

(script# DEATH)
(include game.sh) (include "10.shm")
(use Main)
(use Print)
(use LoadMany)
(use Dialog)
(use DCIcon)
(use Sound)
(use Window)
(use Motion)
(use Game)
(use System)

(public
	deathRoom 0
)

(enum
	waitABit
	setItUp
	showMessage
)

(local
	msgX
	msgY
	height
	[msgLen 4]
	[titleLen 4]
	deadView
	deadLoop
	deadCel
)

(instance deathRoom of Room
	(properties
		picture pSpeedTest
		style FADEOUT
	)
	
	(method (init)
		(theMusic fade:)
		(globalSound fade:)
		(theIconBar disable:)
		(theGame setCursor: normalCursor TRUE)
		(super init:)
		(curRoom setScript: deathScript)
	)
)

(instance deathScript of Script
	
	(method (changeState newState &tmp case)
		(= state newState)
		(switch state
			(waitABit
				(ego hide:)
				(= cycles 2)
			)
			(setItUp
				;set the message and title based on the reason for death
				(= case
					(switch deathReason
						(deathGENERIC C_GENERIC)
						(else C_GENERIC)
					)
				)
				(= deadView
					(switch deathReason
						(deathGENERIC vDeathSkull)
						(else vDeathSkull)
					)
				)	
				;adjust the text box's size based on the title, message, and icon
				(= msgX (+ (CelWide deadView) 10))
				(TextSize @titleLen N_DEATH NULL case 2)
				(TextSize @msgLen N_DEATH NULL case 1 userFont (- 240 msgX))		
				(= msgY (+ (- [titleLen 2] [titleLen 0]) 10))
				(= height
					(+
						(Max
							(+ (- [msgLen 2] [msgLen 0]) 10)					
							(CelHigh deadView)
						)
						msgY
						10
					)
				)
				(deathMusic number: sDeath play:)
				(= cycles 2)
			)
			(showMessage
				(repeat
					(switch
						(Print
							;print the title
							font: SYSFONT
							addText: N_DEATH NULL case 2
							;show the icon
							addIcon: deadView deadLoop deadCel 0 msgY
							;print the message
							font: smallFont
							addText: N_DEATH NULL case 1 msgX msgY
							addButton: 1 N_DEATH 0 C_RESTORE 1 0 height
							addButton: 2 N_DEATH 0 C_RESTART 1 100 height
							addButton: 3 N_DEATH 0 C_QUIT 1 200 height
							init:
						)
						(1
							(theGame restore:)
						)
						(2
							(theGame restart: TRUE)
						)
						(3
							(= quit TRUE)
							(break)
						)
					)
				)
			)
		)
	)
)

(instance deathMusic of Sound
	(properties
		flags mNOPAUSE
	)
)