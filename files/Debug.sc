;;; Sierra Script 1.0 - (do not remove this comment)
;
;	DEBUG.SC
;	
;	This script contains the in-game debug functionality, triggered by setting the "debugging" global
;	variable to TRUE. You can press SHIFT-? to get a list of debug options.
;
;

(script# DEBUG)
(include game.sh)
(use Main)
(use Intrface)
(use Print)
(use PolyEdit)
(use DlgEdit)
(use Dialog)
(use WriteFtr)
(use Feature)
(use Window)
(use Invent)
(use User)
(use Actor)
(use System)

(public
	debugHandler 0
)

(local
	invDButton
)
(procedure (noScrolling)
	(if (OneOf (curRoom style?) SCROLLRIGHT SCROLLLEFT SCROLLUP SCROLLDOWN)
		(curRoom drawPic: (curRoom picture?) 100 style: PLAIN)
	)
)

(instance debugHandler of Feature

	(method (init)
		(super init:)
		(mouseDownHandler addToFront: self)
		(keyDownHandler addToFront: self)
	)
	
	(method (dispose)
		(mouseDownHandler delete: self)
		(keyDownHandler delete: self)
		(super dispose:)
		(DisposeScript DEBUG)
	)
	
	(method (handleEvent event &tmp [str 160] oldPort evt i obj underbits colorIndex t l b r temp171 temp172 temp173 oldCur)
		(switch (event type?)
			(keyDown
				(event claimed: TRUE)
				(switch (event message?)
					(`@a
						(= i (cast first:))
						(while i
							(= obj (NodeValue i))
							(Format @str
								{class: %s\nview: %d\nloop: %d\ncel: %d\nposn: %d %d %d\nheading: %d\npri: %d\nsignal: $%x\nillBits: $%x\n}
								((obj -super-?) name?)
								(obj view?)
								(obj loop?)
								(obj cel?)
								(obj x?)
								(obj y?)
								(obj z?)
								(obj heading?)
								(obj priority?)
								(obj signal?)
								(if (obj isKindOf: Actor)
									(obj illegalBits?)
								else
									-1
								)
							)
							(if
								(not
									(Print
										addText: @str
										window: SysWindow
										addTitle: (obj name?)
										addIcon:
											(obj view?)
											(obj loop?)
											(obj cel?)
											(+ (Print x?) 80)
											(Print y?)
										init:
									)
								)
								(break)
							)
							(= i (cast next: i))
						)
					)
					(`@b
						(PolygonEditor doit:)
					)
					(`@c
						(noScrolling)
						(Show CMAP)
					)
					(`@d
						(DialogEditor doit:)
					)
					(`@e
					)
					(`@f
					)
					(`@g
						(= str 0)
						(GetInput @str 6 {Variable No.})
						(= i (ReadNumber @str))
						(= str 0)
						(GetInput @str 6 {Value})
						(= [ego i] (ReadNumber @str))
						(= str 0)
					)
					(`@h
						(= str 0)
						(Print
							addText: {Global number:}
							addEdit: @str 6 0 12
							init:
						)
						(= i (ReadNumber @str))
						(if (IsObject [ego i])
							(Format @str
								{ Global %d: %s_}
								i
								([ego i] name?)
							)
						else
							(Format @str
								{ Global %d: %d_}
								i
								[ego i]
							)
						)
						(Prints @str)
					)
					(`@i
						(dInvD doit:)
					)
					(`@j						
					)
					(`@k
						(= oldPort (GetPort))
						(SetPort 0)
						(= temp171 5)
						(= temp172 16)
						(= t 15)
						(= l 80)
						(= r (+ t (* 34 temp171)))
						(= b (+ l (* 10 temp172)))
						(= underbits
							(Graph GSaveBits t l r b VMAP)
						)
						(Graph GFillRect t l r b 1 255)
						(= colorIndex 0)
						(while (< colorIndex 256)
							(Graph
								GFillRect
								(+ t temp171 (* temp171 (/ colorIndex 8)))
								(+ l temp172 (* 16 (mod colorIndex 8)))
								(+ t temp171 temp171 (* temp171 (/ colorIndex 8)))
								(+ l temp172 temp172 (* temp172 (mod colorIndex 8)))
								1
								colorIndex
							)
							(++ colorIndex)
						)
						(Graph GShowBits t l r b VMAP)
						(repeat
							(if
								(or
									(== ((= evt (Event new:)) type?) mouseDown)
									(== (evt type?) keyDown)
								)
								(break)
							)
							(evt dispose:)
						)
						(evt dispose:)
						(Graph GRestoreBits underbits)
						(Graph GShowBits t l r b VMAP)
						(SetPort oldPort)
					)
					(`@l
						(= str 0)
						(= i (GetNumber {Flag No.}))
						(gameFlags set: i)
					)
					(`@m
						(= str 0)
						(= i (GetNumber {Flag No.}))
						(gameFlags clear: i)
					)
					(`@n
						(= str 0)
						(= i (GetNumber {Flag No.}))
						(Format @str {%d} (gameFlags test: i))
						(Prints @str)
					)
					(`@o
						((ScriptID LOGGER) doit: @sysLogPath 0)
					)
					(`@p
						(noScrolling)
						(Show PMAP)
					)
					(`@q
						(theGame detailLevel: 1)
					)
					(`@r
						(Format @str
							DEBUG 1
							(curRoom name?)
							curRoomNum
							(curRoom curPic?)
							(curRoom style?)
							(curRoom horizon?)
							(curRoom north?)
							(curRoom south?)
							(curRoom east?)
							(curRoom west?)
							(if (IsObject (curRoom script?))
								((curRoom script?) name?)
							else
								{..none..}
							)
						)
						(Print width: 120 addText: @str init:)
						(theGame showMem:)
					)
					(`@s
					)
					(`@t
						(if modelessDialog
							(modelessDialog dispose:)
						)
						(if (> (= i (GetNumber {Teleport to})) 0)
							(curRoom newRoom: i)
						)
					)
					(`@u
						(User canInput: TRUE canControl: TRUE)
						(theIconBar enable:
							ICON_WALK
							ICON_LOOK
							ICON_DO
							ICON_TALK
							ICON_CURITEM
							ICON_INVENTORY
						)
					)
					(`@v
						(Show VMAP)
						(addToPics doit:)
					)
					(`@w
						(WriteCode doit:)
					)
					(`@x
						(= quit TRUE)
					)
					(`@y
					)
					(`@z
						(= quit TRUE)
					)
					(`?
						(Prints
							{Debug options:______(Page 1 of 5)\n\n
							___A - Show cast\n
							___B - Polygon editor\n
							___C - Show control map\n
							___D - Dialog editor\n
							___E - (vacant) \n
							___F - (vacant)\n
							___G - Set global\n}
						)
						(Prints
							{Debug options:______(Page 2 of 5)\n\n
							___H - Show global\n
							___I - Get inventory item\n
							___J - (vacant)\n
							___K - Show palette\n
							___L - Set flag\n
							___M - Clear flag\n
							___N - Show flag\n}
						)
						(Prints
							{Debug options:______(Page 3 of 5)\n\n
							___O - QA Note Logger\n
							___P - Show priority map\n
							___Q - Set Detail to 1\n
							___R - Show room info/free memory\n
							___S - (vacant)\n
							___T - Teleport\n
							___U - Give HandsOn\n}
						)
						(Prints
							{Debug options:______(Page 4 of 5)\n\n
							___V - Show visual map\n
							___W - Feature writer\n
							___Y - (vacant)\n
							___X,Z - Quick quit\n}
						)
						(Prints
							{Debug options:______(Page 5 of 5)\n\n
							__A=Alt, C=Ctrl, L=Left shift, R=Right shift\n\n
							__Left click:\n____A_______Move ego\n____CL______Show ego\n____CR______Show room\n____CA______Show position\n}
						)
					)
					(else
						(event claimed: FALSE)
					)
				)
			)
			(mouseDown
				(switch (event modifiers?)
					(ENTER 0)
					(14 0)
					(12
						(event claimed: TRUE)
						(Format @str DEBUG 2 (event x?) (event y?))
						(= oldPort
							(Print
								posn: 160 10
								font: 999
								modeless: TRUE
								addText: @str
								init:
							)
						)
						(while (!= 2 ((= evt (Event new:)) type?))
							(evt dispose:)
						)
						(evt dispose:)
						(oldPort dispose:)
					)
					(5
						(event type: keyDown message: 4864)
						(self handleEvent: event)
					)
					(9 0)
					(10 0)
					(shiftRight 0)
					(shiftLeft 0)
					(ctrlDown 0)
					(altDown
						(event claimed: TRUE)
						(= oldCur (theGame setCursor: INVIS_CURSOR))
						(temp173 startUpd:)
						(while (!= 2 ((= evt (Event new:)) type?))
							(temp173 x: (evt x?) y: (- (evt y?) 10))
							(Animate (cast elements?) 0)
							(evt dispose:)
						)
						(evt dispose:)
						(theGame setCursor: oldCur)
						(temp173 signal: i)
					)
				)
			)
		)
	)
)

(instance dInvD of Dialog
	
	(method (init &tmp theX theY temp2 ret newDText inventoryFirst temp6)
		(= temp2 (= theX (= theY 4)))
		(= ret 0)
		(= inventoryFirst (inventory first:))
		(while inventoryFirst
			(= temp6 (NodeValue inventoryFirst))
			(++ ret)
			(if (temp6 isKindOf: InvItem)
				(self
					add:
						((= newDText (DText new:))
							value: temp6
							text: (temp6 name?)
							nsLeft: theX
							nsTop: theY
							state: 3
							font: 999
							setSize:
							yourself:
						)
				)
			)
			(if
			(< temp2 (- (newDText nsRight?) (newDText nsLeft?)))
				(= temp2 (- (newDText nsRight?) (newDText nsLeft?)))
			)
			(if
				(>
					(= theY
						(+ theY (- (newDText nsBottom?) (newDText nsTop?)) 1)
					)
					130
				)
				(= theY 4)
				(= theX (+ theX temp2 10))
				(= temp2 0)
			)
			(= inventoryFirst (inventory next: inventoryFirst))
		)
		(= window systemWindow)
		(self setSize:)
		(= invDButton (DButton new:))
		(invDButton
			text: {Outta here!}
			font: 999
			setSize:
			moveTo: (- nsRight (+ 4 (invDButton nsRight?))) nsBottom
		)
		(self add: invDButton setSize: center:)
		(return ret)
	)
	
	(method (doit &tmp ret item)
		(self init:)
		(self open: 4 15)
		(= ret invDButton)
		(repeat
			(= ret (super doit: ret))
			(if
			(OneOf ret 0 -1 invDButton invDButton)
				(break)
			)
			(ego get: (inventory indexOf: (ret value?)))
		)
		(if (== ret invDButton)
			(= item 0)
			(while (< item (inventory size?))
				(if ((inventory at: item) isKindOf: InvItem)
					(ego get: item)
				)
				(++ item)
			)
		)
		(self eachElementDo: #dispose 1 dispose:)
	)
	
	(method (handleEvent event &tmp eMsg eType)
		(= eMsg (event message?))
		(switch (= eType (event type?))
			(keyDown
				(switch eMsg
					(UPARROW
						(= eMsg SHIFTTAB)
					)
					(DOWNARROW
						(= eMsg TAB)
					)
				)
			)
			(direction
				(switch eMsg
					(dirN
						(= eMsg SHIFTTAB)
						(= eType keyDown)
					)
					(dirS
						(= eMsg TAB)
						(= eType keyDown)
					)
				)
			)
		)
		(event type: eType message: eMsg)
		(super handleEvent: event)
	)
)