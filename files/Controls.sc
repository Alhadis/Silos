;;; Sierra Script 1.0 - (do not remove this comment)
;
;	CONTROLS.SC
;
;	This script contains the game's control panel and its controls.
;
;

(script# GAME_CONTROLS)
(include game.sh) (include "5.shm")
(use Main)
(use BordWind)
(use GameWindow)
(use SlideIcon)
(use IconBar)
(use GControl)
(use Window)
(use System)

(public
	gcCode 0
	gcWin 1
)

(instance gcCode of Code
	
	(method (init)
		(= gameControls GameControls)
		(gameControls
			window: gcWin
			add:
				iconOk
				(detailSlider theObj: theGame selector: #detailLevel yourself:)
				(volumeSlider theObj: theGame selector: #masterVolume yourself:)
				(speedSlider theObj: ego selector: #setSpeed yourself:)
				(iconSave theObj: theGame selector: #save yourself:)
				(iconRestore theObj: theGame selector: #restore yourself:)
				(iconRestart theObj: theGame selector: #restart yourself:)
				(iconQuit theObj: theGame selector: #quitGame yourself:)
				(iconAbout theObj: theGame selector: #showAbout yourself:)
				iconTextSwitch	;comment this out if you do not intend to have speech in your game
				iconHelp
			eachElementDo: #highlightColor 40
			eachElementDo: #lowlightColor 5
			eachElementDo: #modNum GAME_CONTROLS
			helpIconItem: iconHelp
			curIcon: iconSave
			okButton: iconOk
			state: NOCLICKHELP
		)
	)
)

(instance gcWin of BorderWindow
	
	(method (open &tmp [ofStr 25] priority)
		(= priority -1)
		(self
			top: (/ (- SCRNHIGH (+ (CelHigh vControlIcons lControlFixtures 1) 6)) 2)
			left: (/ (- SCRNWIDE (+ 151 (CelWide vControlIcons lSliderText 1))) 2)
			bottom:
				(+
					(CelHigh vControlIcons lControlFixtures 1)
					6
					(/ (- SCRNHIGH (+ (CelHigh vControlIcons lControlFixtures 1) 6)) 2)
				)
			right:
				(+
					151
					(CelWide vControlIcons lSliderText 1)
					(/ (- SCRNWIDE (+ 151 (CelWide vControlIcons lSliderText 1))) 2)
				)
			priority: priority
		)
		(super open:)
		(DrawCel vControlIcons lSliderText 5
			(+
				(/
					(-
						(- (+ 151 (CelWide vControlIcons lSliderText 1)) (+ 4 (CelWide vControlIcons lControlFixtures 1)))
						(CelWide vControlIcons lSliderText 5)
					)
					2
				)
				4
				(CelWide vControlIcons lControlFixtures 1)
			)
			3
			priority
		)
		(DrawCel vControlIcons lControlFixtures 1 4 3 priority)
		(DrawCel vControlIcons lControlFixtures 0 94 38 priority)
		(DrawCel vControlIcons lControlFixtures 0 135 38 priority)
		(DrawCel
			vControlIcons lSliderText 4 63
			(- (- 37 (+ (CelHigh vControlIcons lSliderText 4) 3)) 9)
			priority
		)
		(DrawCel
			vControlIcons lSliderText 3 101
			(- (- 37 (+ (CelHigh vControlIcons lSliderText 4) 3)) 9)
			priority
		)
		(DrawCel
			vControlIcons lSliderText 2 146
			(- (- 37 (+ (CelHigh vControlIcons lSliderText 4) 3)) 9)
			priority
		)
		(Graph GShowBits 12 1 15 (+ 151 (CelWide vControlIcons lSliderText 1)) 1)
		(SetPort 0)
	)
)


(instance detailSlider of Slider
	(properties
		view vControlIcons
		loop lSliderText
		cel 1
		nsLeft 139
		nsTop 73
		signal FIXED_POSN
		noun N_DETAIL
		helpVerb V_HELP
		sliderView vControlIcons
		bottomValue 1
		topValue 3
	)
)

(instance volumeSlider of Slider
	(properties
		view vControlIcons
		loop lSliderText
		cel 1
		nsLeft 179
		nsTop 73
		signal FIXED_POSN
		noun N_VOLUME
		helpVerb V_HELP
		sliderView vControlIcons
		topValue 15
	)
)

(instance speedSlider of Slider
	(properties
		view vControlIcons
		loop lSliderText
		cel 1
		nsLeft 219
		nsTop 73
		signal FIXED_POSN
		noun N_SPEED
		helpVerb V_HELP
		sliderView vControlIcons
		bottomValue 15
	)
	
	(method (show)
		(if (not (user controls?))
			(= signal (| FIXED_POSN DISABLED))
		else
			(= signal FIXED_POSN)
		)
		(super show: &rest)
	)
	
	(method (mask)
	)
	
	(method (move)
		(if (user controls?)
			(super move: &rest)
		)
	)
)


(instance iconSave of ControlIcon
	(properties
		view vControlIcons
		loop lSaveButton
		cel 0
		nsLeft 80
		nsTop 42
		noun N_SAVE
		signal (| VICON FIXED_POSN RELVERIFY IMMEDIATE HIDEBAR) ;$01c3
		helpVerb V_HELP
	)
)

(instance iconRestore of ControlIcon
	(properties
		view vControlIcons
		loop lRestoreButton
		cel 0
		nsLeft 80
		nsTop 62
		signal (| VICON FIXED_POSN RELVERIFY IMMEDIATE HIDEBAR) ;$01c3
		noun N_RESTORE
		helpVerb V_HELP
	)
)

(instance iconRestart of ControlIcon
	(properties
		view vControlIcons
		loop lRestartButton
		cel 0
		nsLeft 80
		nsTop 82
		signal (| VICON FIXED_POSN RELVERIFY IMMEDIATE HIDEBAR) ;$01c3
		noun N_RESTART
		helpVerb V_HELP
	)
)

(instance iconQuit of ControlIcon
	(properties
		view vControlIcons
		loop lQuitButton
		cel 0
		nsLeft 80
		nsTop 102
		signal (| VICON FIXED_POSN RELVERIFY IMMEDIATE HIDEBAR) ;$01c3
		noun N_QUIT
		helpVerb V_HELP
	)
)

(instance iconAbout of ControlIcon
	(properties
		view vControlIcons
		loop lAboutButton
		cel 0
		nsLeft 80
		nsTop 142
		signal (| VICON FIXED_POSN RELVERIFY IMMEDIATE HIDEBAR) ;$01c3
		noun N_ABOUT
		helpVerb V_HELP
	)
)

(instance iconHelp of ControlIcon
	(properties
		view vControlIcons
		loop lHelpButton
		cel 0
		nsLeft 106
		nsTop 142
		cursor vHelpCursor
		message V_HELP
		signal (| VICON FIXED_POSN RELVERIFY IMMEDIATE) ;$0183
		noun N_HELP
		helpVerb V_HELP
	)
)

(instance iconOk of ControlIcon
	(properties
		view vControlIcons
		loop lOKButton
		cel 0
		nsLeft 80
		nsTop 122
		signal (| VICON FIXED_POSN RELVERIFY IMMEDIATE HIDEBAR) ;$01c3
		noun N_OK
		helpVerb V_HELP
	)
)

(instance iconTextSwitch of IconItem
	(properties
		view vControlIcons
		loop lModeButton
		cel 0
		nsLeft 137
		nsTop 143
		cursor ARROW_CURSOR
		signal $0183
		noun N_MSGMODE
		helpVerb V_HELP
	)
	
	(method (doit)
		(switch msgType
			(TEXT_MSG
				(= msgType CD_MSG)
			)
			(CD_MSG
				(= msgType (| TEXT_MSG CD_MSG))
			)
			((| TEXT_MSG CD_MSG)
				(= msgType TEXT_MSG)
			)
		)
		(self show:)
	)
	
	(method (show)
		(switch msgType
			(TEXT_MSG
				(DrawCel vControlIcons lCurrentMode 0 188 141 -1)
			)
			(CD_MSG
				(DrawCel vControlIcons lCurrentMode 1 188 141 -1)
			)
			((| TEXT_MSG CD_MSG)
				(DrawCel vControlIcons lCurrentMode 2 188 141 -1)
			)
		)
		(Graph GShowBits 141 188
			(+ 141 (CelHigh vControlIcons lCurrentMode))
			(+ 188 (CelWide vControlIcons lCurrentMode))
			1
		)
		(super show: &rest)
	)
)
