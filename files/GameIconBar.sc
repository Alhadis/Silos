;;; Sierra Script 1.0 - (do not remove this comment)
;
;	GAMEICONBAR.SC
;
;	The game's icon bar is initialized here. It could have been in the game's Main script, but
;	doing it this way makes everything better organized. In fact, this was done more often for SCI32 games.
;
;

(script# GAME_ICONBAR)
(include game.sh) (include "11.shm")
(use Main)
(use IconBar)
(use System)

(public
	iconCode 0
)

(instance iconCode of Code
	
	(method (init)
		(= theIconBar IconBar)
		(theIconBar
			add:
			;These correspond to ICON_*** in game.sh
				iconWalk iconLook iconDo iconTalk iconCustom
				iconUseIt iconInventory iconControlPanel iconHelp
			eachElementDo: #init
			eachElementDo: #lowlightColor 5
			eachElementDo: #modNum GAME_ICONBAR
			curIcon: iconWalk
			useIconItem: iconUseIt
			helpIconItem: iconHelp
			walkIconItem: iconWalk
			state: (| OPENIFONME NOCLICKHELP)
		)
	)
)

(instance iconWalk of IconItem
	(properties
		view vIconBar
		loop lWalkIcon
		cel 0
		type (| userEvent walkEvent)
		message V_WALK
		signal (| HIDEBAR RELVERIFY)
		maskView vIconBar
		maskLoop lDisabledIcon
		noun N_WALK
		helpVerb V_HELP
	)
	
	(method (init)
		(= cursor walkCursor)
		(super init:)
	)
	
	(method (select)
		(return
			(if (super select: &rest)
				(theIconBar hide:)
				(return TRUE)
			else
				(return FALSE)
			)
		)
	)
)

(instance iconLook of IconItem
	(properties
		view vIconBar
		loop lLookIcon
		cel 0
		message V_LOOK
		signal (| HIDEBAR RELVERIFY)
		maskView vIconBar
		maskLoop lDisabledIcon
		noun N_LOOK
		helpVerb V_HELP
	)
	
	(method (init)
		(= cursor lookCursor)
		(super init:)
	)
)

(instance iconDo of IconItem
	(properties
		view vIconBar
		loop lDoIcon
		cel 0
		message V_DO
		signal (| HIDEBAR RELVERIFY)
		maskView vIconBar
		maskLoop lDisabledIcon
		noun N_DO
		helpVerb V_HELP
	)
	
	(method (init)
		(= cursor doCursor)
		(super init:)
	)
)

(instance iconTalk of IconItem
	(properties
		view vIconBar
		loop lTalkIcon
		cel 0
		message V_TALK
		signal (| HIDEBAR RELVERIFY)
		maskView vIconBar
		maskLoop lDisabledIcon
		noun N_TALK
		helpVerb V_HELP
	)
	
	(method (init)
		(= cursor talkCursor)
		(super init:)
	)
)

(instance iconCustom of IconItem
	(properties
		view vIconBar
		loop lCustomIcon
		cel 0
		cursor ARROW_CURSOR
		message 0
		signal (| HIDEBAR RELVERIFY DISABLED)
		maskView vIconBar
		maskLoop lDisabledIcon
		noun N_CUSTOM
		helpVerb V_HELP
	)
	
	(method (select)
		(return FALSE)
	)
)

;;;(instance iconScore of IconItem
;;;	(properties
;;;		view vIconBar
;;;		loop lScoreIcon
;;;		cel 0
;;;		cursor ARROW_CURSOR
;;;		signal (| HIDEBAR RELVERIFY IMMEDIATE)
;;;		maskView vIconBar
;;;		maskLoop lScoreIcon
;;;		noun N_SCORE
;;;		helpVerb V_HELP
;;;	)
;;;	
;;;	(method (show &tmp [str 7] [temp7 4])
;;;		(super show: &rest)
;;;		(Format @str "%d/%d" score possibleScore)
;;;		(TextSize @temp7 @str scoreFont 0)
;;;		(Display @str p_color 255
;;;			p_font scoreFont
;;;			p_at (+ (- nsLeft 8) (/ (- 50 [temp7 3]) 2)) (+ nsTop 13)
;;;		)
;;;	)
;;;)

(instance iconUseIt of IconItem
	(properties
		view vIconBar
		loop lItemIcon
		cel 0
		cursor ARROW_CURSOR
		message 0
		signal (| HIDEBAR RELVERIFY)
		maskView vIconBar
		maskLoop lDisabledIcon
		maskCel 4
		noun N_CURITEM
		helpVerb V_HELP
	)
)

(instance iconInventory of IconItem
	(properties
		view vIconBar
		loop lInvIcon
		cel 0
		cursor ARROW_CURSOR
		type $0000
		message 0
		signal (| HIDEBAR RELVERIFY IMMEDIATE)
		maskView vIconBar
		maskLoop lDisabledIcon
		noun N_INVENTORY
		helpVerb V_HELP
	)
	
	(method (select)
		(return
			(if (super select: &rest)
				(ego showInv:)
				(return TRUE)
			else
				(return FALSE)
			)
		)
	)
)

(instance iconControlPanel of IconItem
	(properties
		view vIconBar
		loop lControlIcon
		cel 0
		cursor ARROW_CURSOR
		message V_CONTROL
		signal (| HIDEBAR RELVERIFY IMMEDIATE)
		maskView vIconBar
		maskLoop lDisabledIcon
		noun N_CONTROL
		helpVerb V_HELP
	)
	
	(method (select)
		(return
			(if (super select: &rest)
				(theGame showControls:)
				(return TRUE)
			else
				(return FALSE)
			)
		)
	)
)

(instance iconHelp of IconItem
	(properties
		view vIconBar
		loop lHelpIcon
		cel 0
		cursor vHelpCursor
		type helpEvent
		message V_HELP
		signal (| RELVERIFY IMMEDIATE)
		maskView vIconBar
		maskLoop lDisabledIcon
		noun N_HELP
		helpVerb V_HELP
	)
)

(instance walkCursor of Cursor
	(properties
		view vWalkCursor
	)
)

(instance lookCursor of Cursor
	(properties
		view vLookCursor
	)
)

(instance doCursor of Cursor
	(properties
		view vDoCursor
	)
)

(instance talkCursor of Cursor
	(properties
		view vTalkCursor
	)
)