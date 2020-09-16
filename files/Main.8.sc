;;; Sierra Script 1.0 - (do not remove this comment)
;
;	 MAIN.SC
;
;	 This is the main game script. It contains the main game instance and all the global variables.
;	
;	 In addition to the above, it contains the crucial default Messager
;	 and its findTalker method (used for mapping talker numbers to a Talker or Narrator instance).
;
;

(script# MAIN)
(include game.sh) (include "0.shm")
(use BordWind)
(use Dialog)
(use Intrface)
(use StopWalk)
(use Polygon)
(use PolyPath)
(use Timer)
(use Flags)
(use Ego)
(use Osc)
(use Grooper)
(use Print)
(use Talker)
(use IconBar)
(use Messager)
(use GControl)
(use Invent)
(use Sound)
(use Game)
(use User)
(use System)

(public
	SCI11 0
	Bset 1
	Bclr 2
	Btst 3
	AddPolygonsToRoom 4
	CreateNewPolygon 5
	Face 6
	EgoDead 7
)

(local
	ego								  	;pointer to ego
	theGame							  	;ID of the Game instance
	curRoom							  	;ID of current room
	unused_1		
	quit							  	;when TRUE, quit game
	cast							  	;collection of actors
	regions							  	;set of current regions
	timers							  	;list of timers in the game
	sounds							  	;set of sounds being played
	inventory						  	;set of inventory items in game
	addToPics						  	;list of views added to the picture
	curRoomNum						  	;current room number
	prevRoomNum						  	;previous room number
	newRoomNum						  	;number of room to change to
	debugOn							  	;generic debug flag -- set from debug menu
	score							  	;the player's current score
	possibleScore					  	;highest possible score
	textCode							;code that handles interactive text
	cuees							  	;list of who-to-cues for next cycle
	theCursor						  	;the number of the current cursor
	normalCursor	=	ARROW_CURSOR	;number of normal cursor form
	waitCursor		=	HAND_CURSOR 	;cursor number of "wait" cursor
	userFont		=	USERFONT	  	;font to use for Print
	smallFont		=	4 			  	;small font for save/restore, etc.
	lastEvent						  	;the last event (used by save/restore game)
	modelessDialog					  	;the modeless Dialog known to User and Intrface
	bigFont			=	USERFONT	  	;large font
	version			=	0			  	;pointer to 'incver' version string
										;	WARNING!  Must be set in room 0
										;	(usually to {x.yyy    } or {x.yyy.zzz})
	unused_3
	curSaveDir							;address of current save drive/directory string
	unused_4
	perspective							;player's viewing angle: degrees away
										;	from vertical along y axis
	features							;locations that may respond to events
	unused_5
	useSortedFeatures	=	FALSE		;enable cast & feature sorting?
	unused_6
	overlays			=	-1
	doMotionCue							;a motion cue has occurred - process it
	systemWindow						;ID of standard system window
	unused_7
	unused_8
	modelessPort
	[sysLogPath	20]						;-used for system standard logfile path	
	endSysLogPath						;/		(uses 20 globals)
	gameControls						;pointer to instance of game controls
	ftrInitializer						;pointer to code that gets called from
										;	a feature's init
	doVerbCode							;pointer to code that gets invoked if
										;	no feature claims a user event
	approachCode						;pointer to code that translates verbs
										;	into bits
	useObstacles	=	TRUE			;will Ego use PolyPath or not?
	unused_9
	theIconBar							;points to TheIconBar or Null	
	mouseX								;-last known mouse position
	mouseY								;/
	keyDownHandler						;-our EventHandlers, get called by game
	mouseDownHandler					;/
	directionHandler					;/
	speechHandler						;a special handler for speech events
	lastVolume
	pMouse			=	NULL			;pointer to a Pseudo-Mouse, or NULL
	theDoits		=	NULL			;list of objects to get doits each cycle
	eatMice			=	60				;how many ticks before we can mouse
	user			=	NULL			;pointer to specific applications User
	syncBias							;-globals used by sync.sc
	theSync								;/		(will be removed shortly)
	unused_10
	fastCast							;list of talkers on screen
	inputFont		=	SYSFONT			;font used for user type-in
	tickOffset							;used to adjust gameTime after restore
	howFast								;measurment of how fast a machine is
	gameTime							;ticks since game start
	narrator							;pointer to narrator (normally Narrator)
	msgType			=	TEXT_MSG		;type of messages used
	messager							;pointer to messager (normally Messager)
	prints								;list of Print's on screen
	walkHandler							;list of objects to get walkEvents
	textSpeed		=	2				;time text remains on screen
	altPolyList							;list of alternate obstacles
	;globals 96-99 are unused
	global96
	global97
	global98
	lastSysGlobal
	;globals 100 and above are for game use	
	myTextColor				;color of text in message boxes
	myBackColor				;color of message boxes
	myHighlightColor		;color of icon highlight
	myLowlightColor			;color of icon lowlight
	isVGA					;is the graphics driver VGA or not?
	debugging				;debug mode enabled
	statusLine				;pointer for status line code
	soundFx					;sound effect being played
	theMusic				;music object, current playing music
	globalSound				;ambient sound
	disabledIcons
	oldCurIcon
	scoreFont				;font for displaying the score in the control panel
	numColors				;Number of colors supported by graphics driver
	numVoices				;Number of voices supported by sound driver
	deathReason				;message to display when calling EgoDead
	gameFlags				;pointer for Flags object, which only requires one global
)

;These will be replaced with macro defines once those are supported
(procedure (Bset flagEnum)
;;;	(= [gameFlags (/ flagEnum 16)]
;;;		(|
;;;			[gameFlags (/ flagEnum 16)]
;;;			(>> $8000 (mod flagEnum 16))
;;;		)
;;;	)
	(gameFlags set: flagEnum)
)

(procedure (Bclr flagEnum)
;;;	(= [gameFlags (/ flagEnum 16)]
;;;		(&
;;;			[gameFlags (/ flagEnum 16)]
;;;			(~ (>> $8000 (mod flagEnum 16)))
;;;		)
;;;	)
	(gameFlags clear: flagEnum)
)

(procedure (Btst flagEnum)
;;;	(return
;;;		(&
;;;			[gameFlags (/ flagEnum 16)]
;;;			(>> $8000 (mod flagEnum 16))
;;;		)
;;;	)
	(gameFlags test: flagEnum)
)

(procedure (CreateNewPolygonHelper polyBuffer nextPoly &tmp newPoly pointCount)
	(= newPoly (Polygon new:))
	(= pointCount (Memory MReadWord (+ polyBuffer 2)))
	(newPoly
		dynamic: FALSE
		type: (Memory MReadWord polyBuffer)
		size: pointCount
		; Use the points directly from the buffer:
		points: (+ polyBuffer 4)
	)
	; Tell the caller the position of the next poly, if they care:
	(if (> argc 1)
		(Memory MWriteWord
			nextPoly
			(+ polyBuffer 4 (* 4 pointCount))
		)
	)
	(return newPoly)
)

;	
;	 Creates Polygon objects based on the point lists in polyBuffer and adds
;	 them to the room's obstacles.
;	
;	 :param heapPtr polyBuffer: An array with polygon points.
;	
;	 Example usage::
;	
;	 	(AddPolygonsToRoom @P_ThePolygons)
;	
;	 The array begins with a number indicating how many polygons there are. This is followed
;	 by the following information for each polygon:
;	
;	 	- A number expressing the type of the polygon (e.g. PBarredAccess).
;	 	- A number indicating how many points are in the polygon.
;	 	- (x y) pairs of numbers for each point.
;	
;	 Example::
;	
;	 	[P_ThePolygons 19] = [2 PContainedAccess 4 319 189 319 50 0 50 0 189 PBarredAccess 3 319 189 319 50 0 50]
;	
;	 See also: :doc:`/polygons`.		
(procedure (AddPolygonsToRoom polyBuffer &tmp polyCount)
	(if (u< polyBuffer 100)
		(Prints {polyBuffer is not a pointer. Polygon ignored.})
	else
		(= polyCount (Memory MReadWord polyBuffer))
		(+= polyBuffer 2)
		(while polyCount
			(curRoom
				addObstacle:
					(if (== polyCount 1)
						(CreateNewPolygonHelper polyBuffer)
					else
						(CreateNewPolygonHelper polyBuffer @polyBuffer)
					)
			)
			(-- polyCount)
		)
	)
)

;
; .. function:: CreateNewPolygon(polyBuffer [nextPolyOptional])
;
; 	Creates a new polygon object.
; 	
; 	:param heapPtr polyBuffer: An array with polygon points.
; 	:param heapPtr nextPolyOptional: An optional pointer that receives the position of the next polygon in the buffer.
; 	
; 	Example usage::
; 	
; 		(aRock setOnMeCheck: ftrPolygon (CreateNewPolygon @P_Rock))
;
; 	The array consists of the following:	
; 	
; 		- A number expressing the type of the polygon (e.g. PBarredAccess).
; 		- A number indicating how many points are in the polygon.
; 		- (x y) pairs of numbers for each point.
; 		
; 	Example::
; 	
; 		[P_Rock 10] = [PContainedAccess 4 319 189 319 50 0 50 0 189]
; 		
; 	See also: :doc:`/polygons`.
(procedure (CreateNewPolygon polyBuffer &tmp polyCount)
	(if (u< polyBuffer 100)
		(Prints {polyBuffer is not a pointer. Polygon ignored.})
		(return NULL)
	else
		(= polyCount (Memory MReadWord polyBuffer))
		(+= polyBuffer 2)
		(return (CreateNewPolygonHelper polyBuffer &rest))
	)
)

(procedure (Face actor1 actor2 both whoToCue &tmp ang1To2 theX theY i)
	;This makes one actor face another.
	(= i 0)
	(if (IsObject actor2)
		(= theX (actor2 x?))
		(= theY (actor2 y?))
		(if (== argc 3) (= i both))
	else
		(= theX actor2)
		(= theY both)
		(if (== argc 4) (= i whoToCue))
	)
	(= ang1To2
		(GetAngle (actor1 x?) (actor1 y?) theX theY)
	)
	(actor1
		setHeading: ang1To2 (if (IsObject i) i else 0)
	)
)

(procedure (EgoDead theReason)
	;This procedure handles when ego dies. It closely matches that of SQ4, SQ5 and KQ6.
	;If a specific message is not given, the game will use a default message.
	(if (not argc)
		(= deathReason deathGENERIC)
	else
		(= deathReason theReason)
	)
	(curRoom newRoom: DEATH)
)


(instance SCI11 kindof Game
	; The main game instance. It adds game-specific functionality.
	
	(properties
		printLang ENGLISH	;set your game's language here. Supported languages can be found in SYSTEM.SH.
	)

	(method (init)
		;load some important modules
		Print
		BorderWindow
		DText
		DButton
		StopWalk
		Polygon
		PolyPath
		(ScriptID GAME_EGO)
		Timer
		IconBar
		Inventory
		(ScriptID SIGHT)
		Narrator
		Oscillate
		(super init:)

		;Assign globals to this script's objects
		((= theMusic musicSound)
			owner: self
			flags: mNOPAUSE
			init:			
		)
		((= globalSound theGlobalSound)
			owner: self
			flags: mNOPAUSE
			init:			
		)
		((= soundFx soundEffects)
			owner: self
			flags: mNOPAUSE
			init:			
		)
		(= messager gameMessager)
		(= doVerbCode gameDoVerbCode)
		(= approachCode gameApproachCode)
		(= handsOffCode gameHandsOff)
		(= handsOnCode gameHandsOn)
		(= statusLine statusCode)
		((= gameFlags gameEventFlags)
			init:
		)
		(= normalCursor theArrowCursor)		
		(= waitCursor theWaitCursor)

		;anything not requiring objects in this script is loaded in GAME_INIT.SC
		((ScriptID GAME_INIT 0) init:)
	)
	
	(method (startRoom roomNum)
		(if debugging
			((ScriptID DEBUG 0) init:)
		)
		(statusLine doit: roomNum)
		((ScriptID DISPOSE_CODE 0) doit: roomNum)
		(ego normalize:)
		(super startRoom: roomNum)
	)

	(method (handleEvent event &tmp oldCur)
		(super handleEvent: event)
		(if (event claimed?) (return TRUE))
		(return
			(switch (event type?)
				(keyDown
					(switch (event message?)
						(TAB
							(if (not (& ((theIconBar at: ICON_INVENTORY) signal?) DISABLED))
								(if fastCast
									(return fastCast)
								)
								(ego showInv:)
								(event claimed: TRUE)
							)
						)
						(`^q
							(theGame quitGame:)
							(event claimed: TRUE)
						)
						(`^c
							(if (not (& ((theIconBar at: ICON_CONTROL) signal?) DISABLED))
								(if fastCast
									(return fastCast)
								)
								(theGame showControls:)
								(event claimed: TRUE)
							)
						)
						(`#2
							(cond 
								((theGame masterVolume:)
									(theGame masterVolume: 0)
								)
								((> numVoices 1)
									(theGame masterVolume: 15)
								)
								(else
									(theGame masterVolume: 1)
								)
							)
							(event claimed: TRUE)
						)
						(`#5
							(if (not (& ((theIconBar at: ICON_CONTROL) signal?) DISABLED))
								(if fastCast
									(return fastCast)
								)
								(theGame save:)
								(event claimed: TRUE)
							)
						)
						(`#6
							(if (not (& ((theIconBar at: ICON_CONTROL) signal?) DISABLED))
								(if fastCast
									(return fastCast)
								)
								(theGame restore:)
								(event claimed: TRUE)
							)
						)
					)
				)
			)
		)
	)
	
	(method (setCursor cursorObj tOrF theX theY &tmp oldCurObj moveToX moveToY)
		;this is the same as the original setCursor method
		;but, the cursors are objects now.
		;For reference, see cursor.sc

		(= oldCurObj theCursor)
		(= theCursor cursorObj)
		(if (> argc 2)
			(= moveToX (if (< theX 0) 0 else theX))  ;this will fix off-screen cursor problem
			(= moveToY (if (< theY 0) 0 else theY))
			(SetCursor moveToX moveToY)
		)
		(if (IsObject cursorObj)
			(if argc
	  			((= theCursor cursorObj) init:)
			)
			(cursorObj init:)
		else
  			(SetCursor cursorObj 0 0)
		)
		(return oldCurObj)
	)
	
	(method (showControls &tmp oldCur)
		(theIconBar hide:)
		(= oldCur ((theIconBar curIcon?) cursor?))
		(theGame setCursor: normalCursor TRUE)
		(gameControls
			window: (ScriptID GAME_CONTROLS 1)
			show:
		)
		(theGame setCursor: oldCur TRUE)		
	)
	
	(method (solvePuzzle pValue pFlag)
		;Adds an amount to the player's current score.
		;It checks if a certain flag is set so that the points are awarded only once.
		(if (and (> argc 1) (gameFlags test: pFlag))
			(return)
		)
		(if pValue
			(= score (+ score pValue))
			(if (and (> argc 1) pFlag)
				(gameFlags set: pFlag)
				(statusLine doit: curRoomNum)
				(pointsSound
					number: sPoints
					loop: 1
					flags: mNOPAUSE
					play:
				)
			)
		)
	)		
	
	(method (showAbout)
		((ScriptID GAME_ABOUT 0) doit:)
		(DisposeScript GAME_ABOUT)
	)
	
	(method (masterAudioVolume newVol)
		;this will allow for digital sound volume to be adjusted
		(if argc
			(DoAudio Volume newVol)
		else
			(DoAudio Volume)
		)
	)
	
	(method (restart &tmp oldCur)
		;if a parameter is given, skip the dialog and restart immediately
		(if argc
			(super restart:)
		else
			;the game's restart dialog
			(= oldCur ((theIconBar curIcon?) cursor?))
			(theGame setCursor: normalCursor)		
			(if modelessDialog
				(modelessDialog dispose:)
			)
			(if
				(Print
					font:		userFont
					width:		100
					mode:		teJustCenter
					addText:	N_RESTART NULL NULL 1 0 0 MAIN
					addButton:	TRUE N_YESORNO NULL NULL 1 0 25 MAIN
					addButton:	FALSE N_YESORNO NULL NULL 2 75 25 MAIN
					init:
				)
				(super restart:)
			else
				(theGame setCursor: oldCur)
			)
		)
	)

	(method (quitGame &tmp oldCur)
		;if a parameter is given, skip the dialog and quit immediately		
		(if argc
			(super quitGame:)
		else
		;the game's quit dialog
			(= oldCur ((theIconBar curIcon?) cursor?))
			(theGame setCursor: normalCursor)		
			(if modelessDialog
				(modelessDialog dispose:)
			)		
			(if
				(Print
					font:		userFont
					width:		100
					mode:		teJustCenter
					addText:	N_QUITGAME NULL NULL 1 0 0 MAIN
					addButton:	TRUE N_YESORNO NULL NULL 1 0 25 MAIN
					addButton:	FALSE N_YESORNO NULL NULL 2 75 25 MAIN
					init:
				)
				(super quitGame:)
			else
				(theGame setCursor: oldCur)
			)
		)
	)
	
	(method (pragmaFail &tmp theVerb)
		;nobody responds to user input
		(if modelessDialog
			(modelessDialog dispose:)
		)
		(if (User canInput:)
			(= theVerb ((User curEvent?) message?))
			(if (OneOf theVerb V_DO V_LOOK V_TALK)
				(messager say: N_PRAGFAIL theVerb NULL 1 0 MAIN)
			else ;non-handled verb
				(messager say: N_PRAGFAIL V_COMBINE NULL 1 0 MAIN)
			)
		)
	)
)

(instance statusCode of Code
	
	(method (doit roomNum &tmp [statusBuf 50] [scoreBuf 50])
		(if
			;add rooms where the status line is not shown
			(not (OneOf roomNum 
					TITLE SPEED_TEST WHERE_TO DEATH
				 )
			)
			(Message MsgGet MAIN N_STATUSLINE NULL NULL 1 @statusBuf)
			(Format @scoreBuf @statusBuf score possibleScore)
			(DrawStatus @scoreBuf 23 0)
		)
	)
)

(instance gameMessager of Messager
	
	(method (findTalker who &tmp theTalker)
		(if
			(= theTalker
				(switch who
					;Add the talkers here, using the defines you set in the message editor
					;from TALKERS.SH
					(else  narrator)
				)
			)
			(return)
		else
			(super findTalker: who)
		)
	)
)

(instance gameDoVerbCode of Code
	;if there is no corresponding message for an object and verb, bring up a default message.
	(method (doit theVerb)
		(if (OneOf theVerb V_LOOK V_DO V_TALK)
			(messager say: N_VERB_GENERIC theVerb NULL 1 0 MAIN)
		else ;non-handled verb
			(messager say: N_VERB_GENERIC V_COMBINE NULL 1 0 MAIN)
		)
	)
)

(instance gameApproachCode of Code
	
	(method (doit theVerb)
		(switch theVerb
			(V_LOOK $0001)
			(V_TALK $0002)
			(V_WALK $0004)
			(V_DO $0008)
			(else  $8000)
		)
	)
)

(instance gameHandsOff of Code
	
	(method (doit)
		(if (not oldCurIcon)
			(= oldCurIcon (theIconBar curIcon?))
		)
		(user canControl: FALSE canInput: FALSE)
		(ego setMotion: 0)
		(= disabledIcons NULL)
		(theIconBar eachElementDo: #perform checkIcon)
		(theIconBar curIcon: (theIconBar at: ICON_CONTROL))
		(theIconBar disable:
			ICON_WALK
			ICON_LOOK
			ICON_DO
			ICON_TALK
			ICON_CURITEM
			ICON_INVENTORY
		)
		(if (not (HaveMouse))
			(theGame setCursor: INVIS_CURSOR)
		else
			(theGame setCursor: waitCursor)
		)
	)
)

(instance gameHandsOn of Code
	
	(method (doit)
		(user canInput: TRUE canControl: TRUE)
		(theIconBar enable:
			ICON_WALK
			ICON_LOOK
			ICON_DO
			ICON_TALK
			ICON_CURITEM
			ICON_INVENTORY
		)
		(if (not (curRoom inset:))
			(theIconBar enable: ICON_CONTROL)
		)
		(if (not (theIconBar curInvIcon?))
			(theIconBar disable: ICON_CURITEM)	
		)
		(if oldCurIcon
			(theIconBar curIcon: oldCurIcon)
			(theGame setCursor: (oldCurIcon cursor?))
			(if
				(and
					(== (theIconBar curIcon?) (theIconBar at: ICON_CURITEM))
					(not (theIconBar curInvIcon?))
				)
				(theIconBar advanceCurIcon:)
			)
		)
		(= oldCurIcon 0)
		(theGame setCursor: ((theIconBar curIcon?) cursor?) TRUE)
	)
)

(instance gameEventFlags of Flags
	(properties
		size NUMFLAGS
	)
)

(instance theWaitCursor of Cursor
	(properties
		view	HAND_CURSOR
	)
)

(instance theArrowCursor of Cursor
	(properties
		view	ARROW_CURSOR
	)
)

(instance theGlobalSound of Sound)
(instance musicSound of Sound)
(instance soundEffects of Sound)
(instance pointsSound of Sound
	(properties
		priority 15
	)
)

(instance checkIcon of Code
	
	(method (doit theIcon)
		(if
			(and
				(theIcon isKindOf: IconItem)
				(& (theIcon signal?) DISABLED)
			)
			(= disabledIcons
				(| disabledIcons (>> FORCE (theIconBar indexOf: theIcon)))
			)
		)
	)
)
