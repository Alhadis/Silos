;;; Sierra Script 1.0 - (do not remove this comment)
;	DISPOSECODE>SC
;
;	 A place to put script numbers that are rarely used and should be unloaded
;	 on each room change to free up heap space. If you add a new script with a motion class, or a cycler,
;	 you should probably add your script number here.
;
;
(script# DISPOSE_CODE)
(include game.sh)
(use Main)
(use LoadMany)
(use System)

(public
	disposeCode 0
)

(instance disposeCode of Code
	
	(method (doit)
		(LoadMany FALSE
			;insert talker scripts here
			DOOR INSET FILE PAVOID PCHASE PFOLLOW SCALER DPATH CONV DLGEDIT POLYEDIT
			OSC SCALETO MOVEFWD FORCOUNT MOVECYC REVERSE RANDCYC RANGEOSC WRITEFTR
			SYNC
		)
		(DisposeScript DISPOSE_CODE)
	)
)
