;;; Sierra Script 1.0 - (do not remove this comment)
;
;	GAMEINIT.SC
;
;	Add things to initialize at game start here.
;	Make sure they don't require any objects or methods in MAIN.SC.
;
;
(script# GAME_INIT)
(include game.sh) (include "0.shm")
(use Main)
(use GameEgo)
(use GameWindow)
(use GameIconBar)
(use GameInv)
(use BordWind)
(use Talker)
(use User)
(use System)

(local
	[quitStr 120]
)

(public
	GameInitCode 0
)

(instance GameInitCode of Code
	
	(method (init)
		;When you quit the game, a random message will appear at the DOS prompt.
		;Customize these messages in the message editor as you see fit.
		(Message MsgGet MAIN N_QUIT_STR NULL NULL (Random 1 4) @quitStr)
		(SetQuitStr @quitStr)
		
		; These correspond to font codes used in messages.
		; By default, render messages in font 0 (system font).
		; Render messages with the |f1| tag in userFont (default 1).
		; Render messages with the |f2| tag in smallFont (default 4).
		; Render messages with the |f3| tag in font 1307.		
		(TextFonts SYSFONT userFont smallFont 1307)
		; These correspond to color codes used in messages (values into global palette).
		; By default, render messages as color 0.
		; Render messages with the |c1| tag as color 15.
		; Render messages with the |c2| tag as color 23.
		; Render messages with the |c3| tag as color 5.		
		(TextColors 0 15 23 5)
		
		;set up the colors
		;check the current driver and determine if it is VGA or not
		(if
			(and
				(>= (= numColors (Graph GDetect)) 2)
				(<= numColors 16)
			)
			;if 16 colors or less, it's not VGA
			(= isVGA FALSE)
		else
			(= isVGA TRUE)
		)
		
		;now set up the interface colors
		(if isVGA
			;VGA colors
			(= myTextColor 0)
			(= myBackColor 5)
			(= myLowlightColor (Palette PALMatch 159 159 159))
			(= myHighlightColor 0)
		else
			;EGA colors
			(= myTextColor vBLACK)
			(= myBackColor vLGREY)
			(= myLowlightColor vGREY)
			(= myHighlightColor vBLACK)
		)
		
		;load up the ego, icon bar, inventory, and control panel
		((= ego (ScriptID GAME_EGO 0)) view: vEgo)
		((ScriptID GAME_ICONBAR 0) init:)
		((ScriptID GAME_INV 0) init:)
		((ScriptID GAME_CONTROLS 0) init:)	
		
		(= userFont USERFONT)
		(= systemWindow BorderWindow)
		((= narrator Narrator)
			font: userFont
			back: myBackColor
			keepWindow: TRUE
		)		
		(user alterEgo: ego canControl: FALSE canInput: FALSE)
		(= useSortedFeatures TRUE)
		(= eatMice 30)	
		
		(= msgType TEXT_MSG)		
		(= scoreFont 9)
		(= possibleScore 999)
		(= score 0)
		(= numVoices (DoSound NumVoices))
		(= debugging TRUE)	;Set this to FALSE to disable the debug features
		(theIconBar enable:)	
		;now go to the speed test room
		(theGame
			setCursor:	(waitCursor posn: 300 180, yourself:),
			handsOff:,
			newRoom:		SPEED_TEST
		)		
		(DisposeScript GAME_INIT)	;don't need this in memory anymore
	)
)