;;; Sierra Script 1.0 - (do not remove this comment)
;
;	GAMEEGO.SC
;
;	 GameEgo is a game-specific subclass of Ego. Here, you can put default answers for
;	 looking, talking and performing actions on yourself.
;
;

(script# GAME_EGO)
(include game.sh) (include "7.shm")
(use Main)
(use Grooper)
(use StopWalk)
(use Invent)
(use Ego)

(public
	GameEgo 0
)

(instance GameEgo of Ego
	(properties
		noun N_EGO
		modNum GAME_EGO
		view vEgo
		
	)
	
	(method (doVerb theVerb)
		;add interactivity with the player character here
		(switch theVerb
			(else 
				(super doVerb: theVerb &rest)
			)
		)
	)
	
	(method (normalize theView)
		;sets up ego's normal animation
		(= view (if argc theView else vEgo))
		(ego
			setLoop: -1
			looper: stopGroop
			setCel: -1
			setPri: -1
			setMotion: 0
			setCycle: StopWalk -1
			z: 0
			illegalBits: 0
			ignoreActors: FALSE
		)
	)

	(method (showInv &tmp oldCur)
		;bring up the inventory
		(if (inventory firstTrue: #ownedBy ego)
			(theIconBar hide:)
			(= oldCur theCursor)
			(inventory showSelf:)
			(if (not (theIconBar curInvIcon?))
				(theIconBar curIcon: (theIconBar at: ICON_WALK) disable: ICON_CURITEM)
				(if (& ((theIconBar curIcon?) signal?) DISABLED)
					(theIconBar advanceCurIcon:)
				)
				(theGame setCursor: ((theIconBar curIcon?) cursor?))
			)			
			(theGame setCursor: oldCur TRUE)
		else
		;if ego has no items, bring up the message saying so.
			(messager say: N_EGO NULL C_INVEMPTY 0 0 GAME_EGO)
		)
	)
)

(instance stopGroop of GradualLooper)