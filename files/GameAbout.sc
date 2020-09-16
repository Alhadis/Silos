;;; Sierra Script 1.0 - (do not remove this comment)
;
;	GAMEABOUT.SC
;
;	Displays a message in response to a call to "theGame showAbout:".
;
;

(script# GAME_ABOUT)
(include game.sh) (include "9.shm")
(use Main)
(use System)

(public
	aboutCode 0
)

(local
	oldCur
)

(instance aboutCode of Code

	(method (doit)
		(= oldCur ((theIconBar curIcon?) cursor?))
		(theGame setCursor: normalCursor)
		(messager say: N_ABOUT NULL NULL NULL NULL GAME_ABOUT)
		(self dispose:)
	)
	
	(method (dispose)
		(theGame setCursor: oldCur)
		(DisposeScript DCICON)
		(DisposeScript GAME_ABOUT)
	)
)


