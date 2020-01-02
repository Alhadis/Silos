	SECTION CODE

	XDEF PopulateTestData, ProcessRawValues

	XDEF string_G, string_AP, string_PE, string_SemiMajorAxis, string_SemiMinorAxis
	XDEF string_e, string_VVI, string_inc, string_TAp, string_TPe, string_TrueAnomaly
	XDEF string_period, string_SolidFuel, string_LiquidFuel, string_Oxidizer, string_ECharge
	XDEF string_Pitch, string_Roll, string_Heading, string_Lat, string_Lon, string_RAlt, string_Density, string_Vsurf

	XDEF lbl_G, lbl_AP, lbl_PE, lbl_SemiMajorAxis, lbl_SemiMinorAxis
	XDEF lbl_e, lbl_VVI, lbl_inc, lbl_TAp, lbl_TPe, lbl_TrueAnomaly
	XDEF lbl_period, lbl_SolidFuel, lbl_LiquidFuel, lbl_Oxidizer, lbl_ECharge
	XDEF lbl_Pitch, lbl_Roll, lbl_Heading, lbl_Lat, lbl_Lon, lbl_RAlt, lbl_Density, lbl_Vsurf

	XDEF unit_G, unit_AP, unit_PE, unit_SemiMajorAxis, unit_SemiMinorAxis
	XDEF unit_e, unit_VVI, unit_inc, unit_TAp, unit_TPe, unit_TrueAnomaly
	XDEF unit_period, unit_SolidFuel, unit_LiquidFuel, unit_Oxidizer, unit_ECharge
	XDEF unit_Pitch, unit_Roll, unit_Heading, unit_Lat, unit_Lon, unit_RAlt, unit_Density, unit_Vsurf

	XDEF value_G, value_AP, value_PE, value_SemiMajorAxis, value_SemiMinorAxis
	XDEF value_e, value_VVI, value_inc, value_TAp, value_TPe, value_TrueAnomaly
	XDEF value_period, value_SolidFuel, value_LiquidFuel, value_Oxidizer, value_ECharge
	XDEF value_Pitch, value_Roll, value_Heading, value_Lat, value_Lon, value_RAlt, value_Density, value_Vsurf
	XDEF value_SOINumber

	public KSPPacketBuffer

M_SwapEndianness	MACRO
				    ror.w   #8, \1
				    swap    \1
				    ror.w   #8, \1
					ENDM

M_LoadFloatFromPacketStructure	MACRO
	
	move.l	KSP_\1(a0), d0
	M_SwapEndianness d0
	move.l	d0, value_\1
	ENDM

M_LoadWordFromPacketStructure	MACRO
	move.w	KSP_\1(a0), value_\1
	ENDM

M_LoadByteFromPacketStructure	MACRO
	move.b	KSP_\1(a0), value_\1
	ENDM

PopulateTestData:
	lea		TestPacket, a0

	M_LoadFloatFromPacketStructure AP
	M_LoadFloatFromPacketStructure PE
	M_LoadFloatFromPacketStructure SemiMajorAxis
	M_LoadFloatFromPacketStructure SemiMinorAxis
	M_LoadFloatFromPacketStructure VVI
	M_LoadFloatFromPacketStructure e
	M_LoadFloatFromPacketStructure inc
	M_LoadFloatFromPacketStructure G
	M_LoadFloatFromPacketStructure TAp
	M_LoadFloatFromPacketStructure TPe
	M_LoadFloatFromPacketStructure TrueAnomaly
	M_LoadFloatFromPacketStructure Density
	M_LoadFloatFromPacketStructure period
	M_LoadFloatFromPacketStructure RAlt
	M_LoadFloatFromPacketStructure Alt
	M_LoadFloatFromPacketStructure Vsurf
	M_LoadFloatFromPacketStructure Lat
	M_LoadFloatFromPacketStructure Lon

	M_LoadFloatFromPacketStructure LiquidFuelTot
	M_LoadFloatFromPacketStructure LiquidFuel
	M_LoadFloatFromPacketStructure OxidizerTot
	M_LoadFloatFromPacketStructure Oxidizer
	M_LoadFloatFromPacketStructure EChargeTot
	M_LoadFloatFromPacketStructure ECharge
	M_LoadFloatFromPacketStructure MonoPropTot
	M_LoadFloatFromPacketStructure MonoProp
	M_LoadFloatFromPacketStructure IntakeAirTot
	M_LoadFloatFromPacketStructure IntakeAir
	M_LoadFloatFromPacketStructure SolidFuelTot
	M_LoadFloatFromPacketStructure SolidFuel
	M_LoadFloatFromPacketStructure XenonGasTot
	M_LoadFloatFromPacketStructure XenonGas
	M_LoadFloatFromPacketStructure LiquidFuelTotS
	M_LoadFloatFromPacketStructure LiquidFuelS
	M_LoadFloatFromPacketStructure OxidizerTotS
	M_LoadFloatFromPacketStructure OxidizerS

	M_LoadFloatFromPacketStructure MissionTime
	M_LoadFloatFromPacketStructure deltaTime
	M_LoadFloatFromPacketStructure VOrbit
	M_LoadFloatFromPacketStructure MNTime
	M_LoadFloatFromPacketStructure MNDeltaV
	M_LoadFloatFromPacketStructure Pitch
	M_LoadFloatFromPacketStructure Roll
	M_LoadFloatFromPacketStructure Heading
	M_LoadWordFromPacketStructure ActionGroups
	M_LoadWordFromPacketStructure SOINumber
	M_LoadByteFromPacketStructure MaxOverheat ;byte
	M_LoadFloatFromPacketStructure MachNumber
	M_LoadWordFromPacketStructure IAS
	M_LoadByteFromPacketStructure CurrentStage ;byte
	M_LoadByteFromPacketStructure TotalStage ;byte

	RTS

	move.l	#$4b3c614e, value_AP	
	move.l	#$4b3c614e, value_PE			
	move.l	#$4b3c614e, value_SemiMajorAxis	
	move.l	#$4b3c614e, value_SemiMinorAxis	
	move.l	#$4b3c614e, value_VVI			
	move.l	#$4b3c614e, value_e				
	move.l	#$4b3c614e, value_inc			
	move.l	#$4b3c614e, value_G				
	move.l	#$4b3c614e, value_TAp			
	move.l	#$4b3c614e, value_TPe			
	move.l	#$4b3c614e, value_TrueAnomaly	
	move.l	#$4b3c614e, value_Density		
	move.l	#$4b3c614e, value_period		
	move.l	#$4b3c614e, value_RAlt			
	move.l	#$4b3c614e, value_Alt			
	move.l	#$4b3c614e, value_Vsurf			
	move.l	#$40c00000, value_Lat			
	move.l	#$c2940000, value_Lon			

;Fuel
	move.l	#$4b3c614e, value_LiquidFuelTot	
	move.l	#$4b3c614e, value_LiquidFuel	
	move.l	#$4b3c614e, value_OxidizerTot	
	move.l	#$4b3c614e, value_Oxidizer		
	move.l	#$4b3c614e, value_EChargeTot	
	move.l	#$4b3c614e, value_ECharge		
	move.l	#$4b3c614e, value_MonoPropTot	
	move.l	#$4b3c614e, value_MonoProp		
	move.l	#$4b3c614e, value_IntakeAirTot	
	move.l	#$4b3c614e, value_IntakeAir		
	move.l	#$4b3c614e, value_SolidFuelTot	
	move.l	#$4b3c614e, value_SolidFuel		
	move.l	#$4b3c614e, value_XenonGasTot	
	move.l	#$4b3c614e, value_XenonGas		
	move.l	#$4b3c614e, value_LiquidFuelTotS	
	move.l	#$4b3c614e, value_LiquidFuelS	
	move.l	#$4b3c614e, value_OxidizerTotS	
	move.l	#$4b3c614e, value_OxidizerS		

	move.l	#$4b3c614e, value_MissionTime	
	move.l	#$4b3c614e, value_deltaTime		
	move.l	#$4b3c614e, value_VOrbit		
	move.l	#$4b3c614e, value_MNTime		
	move.l	#$4b3c614e, value_MNDeltaV		
	move.l	#$4b3c614e, value_Pitch			
	move.l	#$4b3c614e, value_Roll			
	move.l	#$4b3c614e, value_Heading		
	move.w	#0, value_ActionGroups
	move.b	#0, value_SOINumber	
	move.b	#0, value_MaxOverheat
	move.l	#$4b3c614e, value_MachNumber
	move.l	#$4b3c614e, value_IAS
	move.b	#0, value_CurrentStage
	move.b	#0, value_TotalStage

	RTS

*************************************
M_FloatToString		MACRO
					move.l	value_\1, d0
					lea		string_\1, a0
					JSR		FloatToString
					ENDM

*************************************
ProcessRawValues:
	xref FloatToString

	;This takes approximately 10 years on an 8MHz 68000
	M_FloatToString AP
	M_FloatToString PE			
	M_FloatToString SemiMajorAxis	
	M_FloatToString SemiMinorAxis	
	M_FloatToString VVI			
	M_FloatToString e				
	M_FloatToString inc			
	M_FloatToString G				
	M_FloatToString TAp			
	M_FloatToString TPe			
	M_FloatToString TrueAnomaly	
	M_FloatToString Density		
	M_FloatToString period		
	M_FloatToString RAlt			
	M_FloatToString Alt			
	M_FloatToString Vsurf			
	M_FloatToString Lat			
	M_FloatToString Lon			

;Fuel
	M_FloatToString LiquidFuelTot	
	M_FloatToString LiquidFuel	
	M_FloatToString OxidizerTot	
	M_FloatToString Oxidizer		
	M_FloatToString EChargeTot	
	M_FloatToString ECharge		
	M_FloatToString MonoPropTot	
	M_FloatToString MonoProp		
	M_FloatToString IntakeAirTot	
	M_FloatToString IntakeAir		
	M_FloatToString SolidFuelTot	
	M_FloatToString SolidFuel		
	M_FloatToString XenonGasTot	
	M_FloatToString XenonGas		
	M_FloatToString LiquidFuelTotS	
	M_FloatToString LiquidFuelS	
	M_FloatToString OxidizerTotS	
	M_FloatToString OxidizerS		

	M_FloatToString MissionTime	
	M_FloatToString deltaTime		
	M_FloatToString VOrbit		
	M_FloatToString MNTime		
	M_FloatToString MNDeltaV		
	M_FloatToString Pitch			
	M_FloatToString Roll			
	M_FloatToString Heading		
	;M_FloatToString ActionGroups ;word
	;M_FloatToString SOINumber ;byte
	;M_FloatToString MaxOverheat ;byte
	M_FloatToString MachNumber
	M_FloatToString IAS
	;M_FloatToString CurrentStage ;byte
	;M_FloatToString TotalStage ;byte

	RTS

;KSPIO packet field offsets
	SECTION DATA

KSP_AP					equ	0
KSP_PE					equ	4
KSP_SemiMajorAxis		equ	8
KSP_SemiMinorAxis		equ	12
KSP_VVI					equ	16
KSP_e					equ	20
KSP_inc					equ	24
KSP_G					equ	28
KSP_TAp					equ	32
KSP_TPe					equ	36
KSP_TrueAnomaly			equ	40
KSP_Density				equ	44
KSP_period				equ	48
KSP_RAlt				equ	52
KSP_Alt					equ	56
KSP_Vsurf				equ	60
KSP_Lat					equ	64
KSP_Lon					equ	68
KSP_LiquidFuelTot		equ	72
KSP_LiquidFuel			equ	76
KSP_OxidizerTot			equ	80
KSP_Oxidizer			equ	84
KSP_EChargeTot			equ 88
KSP_ECharge				equ	92
KSP_MonoPropTot			equ 96
KSP_MonoProp			equ 100
KSP_IntakeAirTot		equ	104
KSP_IntakeAir			equ 108
KSP_SolidFuelTot		equ	112
KSP_SolidFuel			equ	116
KSP_XenonGasTot			equ	120
KSP_XenonGas			equ	124
KSP_LiquidFuelTotS		equ	128
KSP_LiquidFuelS			equ	132
KSP_OxidizerTotS		equ	136
KSP_OxidizerS			equ	140
KSP_MissionTime			equ	144
KSP_deltaTime			equ	148
KSP_VOrbit				equ	152
KSP_MNTime				equ	156
KSP_MNDeltaV			equ	160
KSP_Pitch				equ	164
KSP_Roll				equ	168
KSP_Heading				equ	172
KSP_ActionGroups		equ	176
KSP_SOINumber			equ	178
KSP_MaxOverheat			equ	179
KSP_MachNumber			equ	180
KSP_IAS					equ	184
KSP_CurrentStage		equ	188
KSP_TotalStage			equ	189
KSP_Checksum			equ 190

;Orbital parameters and stuff
lbl_AP				dc.b	"Ap      : ",0
lbl_PE				dc.b	"Pe      : ",0
lbl_SemiMajorAxis	dc.b	"SMajAxis: ",0
lbl_SemiMinorAxis	dc.b	"SMinAxis: ",0
lbl_VVI				dc.b	"Vert Vel: ",0
lbl_e				dc.b	"Eccentrc: ",0
lbl_inc				dc.b	"O Inclin: ",0
lbl_G				dc.b	"Gravity : ",0
lbl_TAp				dc.b	"TimeToAp: ",0
lbl_TPe				dc.b	"TimeToPe: ",0
lbl_TrueAnomaly		dc.b	"TrueAnom: ",0
lbl_Density			dc.b	"Atm Dens: ",0
lbl_period			dc.b	"ObtPriod: ",0
lbl_RAlt			dc.b	"RadarAlt: ",0
lbl_Alt				dc.b	"Altitude: ",0
lbl_Vsurf			dc.b	"SfcVeloc: ",0
lbl_Lat				dc.b	"Sfc Lat : ",0
lbl_Lon				dc.b	"Sfc Long: ",0

;Fuel
lbl_LiquidFuelTot	dc.b	"T LqFuel: ",0
lbl_LiquidFuel		dc.b	"LqFuel  : ",0
lbl_OxidizerTot		dc.b	"T Oxidzr: ",0
lbl_Oxidizer		dc.b	"Oxidizer: ",0
lbl_EChargeTot		dc.b	"T Electr: ",0
lbl_ECharge			dc.b	"ElecChar: ",0
lbl_MonoPropTot		dc.b	"T MonoPr: ",0
lbl_MonoProp		dc.b	"MonoProp: ",0
lbl_IntakeAirTot	dc.b	"T Intake: ",0
lbl_IntakeAir		dc.b	"IntkeAir: ",0
lbl_SolidFuelTot	dc.b	"T SolidF: ",0
lbl_SolidFuel		dc.b	"Solid Fl: ",0
lbl_XenonGasTot		dc.b	"T XenonG: ",0
lbl_XenonGas		dc.b	"XenonGas: ",0
lbl_LiquidFuelTotS	dc.b	"T LqFl S: ",0
lbl_LiquidFuelS		dc.b	"LiquidFS: ",0
lbl_OxidizerTotS	dc.b	"T OxidzS: ",0
lbl_OxidizerS		dc.b	"OxidizrS: ",0

lbl_MissionTime		dc.b	"MET     : ",0
lbl_deltaTime		dc.b	"DltaTime: ",0
lbl_VOrbit			dc.b	"OrbitVel: ",0
lbl_MNTime			dc.b	"MnvrTime: ",0
lbl_MNDeltaV		dc.b	"MnvrDltV: ",0
lbl_Pitch			dc.b	"Pitch   : ",0
lbl_Roll			dc.b	"Roll    : ",0
lbl_Heading			dc.b	"Heading : ",0
lbl_ActionGroups	dc.b	"ActionGr: ",0
lbl_SOINumber		dc.b	"SOI Nmbr: ",0
lbl_MaxOverheat		dc.b	"Overheat: ",0
lbl_MachNumber		dc.b	"Mach Num: ",0
lbl_IAS				dc.b	"IAS     : ",0
lbl_CurrentStage	dc.b	"CrntStge: ",0
lbl_TotalStage		dc.b	"TotlStgs: ",0

;Units of measure
;Orbital parameters and stuff
unit_AP				dc.b	"M",0
unit_PE				dc.b	"M",0
unit_SemiMajorAxis	dc.b	"M",0
unit_SemiMinorAxis	dc.b	"M",0
unit_VVI			dc.b	"M/s",0
unit_e				dc.b	"",0
unit_inc			dc.b	"Rad",0
unit_G				dc.b	"g",0
unit_TAp			dc.b	"sec",0
unit_TPe			dc.b	"sec",0
unit_TrueAnomaly	dc.b	"Rad",0
unit_Density		dc.b	"kg/m",$FE,0 ;kg/m³
unit_period			dc.b	"sec",0
unit_RAlt			dc.b	"M",0
unit_Alt			dc.b	"M",0
unit_Vsurf			dc.b	"M/s",0
unit_Lat			dc.b	"Deg",0
unit_Lon			dc.b	"Deg",0

;Fuel
unit_LiquidFuelTot	dc.b	"",0
unit_LiquidFuel		dc.b	"",0
unit_OxidizerTot	dc.b	"",0
unit_Oxidizer		dc.b	"",0
unit_EChargeTot		dc.b	"",0
unit_ECharge		dc.b	"",0
unit_MonoPropTot	dc.b	"",0
unit_MonoProp		dc.b	"",0
unit_IntakeAirTot	dc.b	"",0
unit_IntakeAir		dc.b	"",0
unit_SolidFuelTot	dc.b	"",0
unit_SolidFuel		dc.b	"",0
unit_XenonGasTot	dc.b	"",0
unit_XenonGas		dc.b	"",0
unit_LiquidFuelTotS	dc.b	"",0
unit_LiquidFuelS	dc.b	"",0
unit_OxidizerTotS	dc.b	"",0
unit_OxidizerS		dc.b	"",0

unit_MissionTime	dc.b	"",0
unit_deltaTime		dc.b	"sec",0
unit_VOrbit			dc.b	"M/s",0
unit_MNTime			dc.b	"sec",0
unit_MNDeltaV		dc.b	"M/s",0
unit_Pitch			dc.b	"Deg",0
unit_Roll			dc.b	"Deg",0
unit_Heading		dc.b	"Deg",0
unit_ActionGroups	dc.b	"",0
unit_SOINumber		dc.b	"",0
unit_MaxOverheat	dc.b	"",0
unit_MachNumber		dc.b	"Ma",0
unit_IAS			dc.b	"M/s",0
unit_CurrentStage	dc.b	"",0
unit_TotalStage		dc.b	"",0

;Values
	even
;Orbital parameters and stuff
KSPValues:
value_AP			dc.l	0
value_PE			dc.l	0
value_SemiMajorAxis	dc.l	0
value_SemiMinorAxis	dc.l	0
value_VVI			dc.l	0
value_e				dc.l	0
value_inc			dc.l	0
value_G				dc.l	0
value_TAp			dc.l	0
value_TPe			dc.l	0
value_TrueAnomaly	dc.l	0
value_Density		dc.l	0
value_period		dc.l	0
value_RAlt			dc.l	0
value_Alt			dc.l	0
value_Vsurf			dc.l	0
value_Lat			dc.l	0
value_Lon			dc.l	0

;Fuel
value_LiquidFuelTot	dc.l	0
value_LiquidFuel	dc.l	0
value_OxidizerTot	dc.l	0
value_Oxidizer		dc.l	0
value_EChargeTot	dc.l	0
value_ECharge		dc.l	0
value_MonoPropTot	dc.l	0
value_MonoProp		dc.l	0
value_IntakeAirTot	dc.l	0
value_IntakeAir		dc.l	0
value_SolidFuelTot	dc.l	0
value_SolidFuel		dc.l	0
value_XenonGasTot	dc.l	0
value_XenonGas		dc.l	0
value_LiquidFuelTotS	dc.l	0
value_LiquidFuelS	dc.l	0
value_OxidizerTotS	dc.l	0
value_OxidizerS		dc.l	0

value_MissionTime	dc.l	0
value_deltaTime		dc.l	0
value_VOrbit		dc.l	0
value_MNTime		dc.l	0
value_MNDeltaV		dc.l	0
value_Pitch			dc.l	0
value_Roll			dc.l	0
value_Heading		dc.l	0
value_ActionGroups	dc.w	0
value_SOINumber		dc.b	0
value_MaxOverheat	dc.b	0
value_MachNumber	dc.l	0
value_IAS			dc.l	0
value_CurrentStage	dc.b	0
value_TotalStage	dc.b	0

;Strings
;Orbital parameters and stuff
string_AP			ds.b	32
string_PE			ds.b	32
string_SemiMajorAxis	ds.b	32
string_SemiMinorAxis	ds.b	32
string_VVI			ds.b	32
string_e			ds.b	32
string_inc			ds.b	32
string_G			ds.b	32
string_TAp			ds.b	32
string_TPe			ds.b	32
string_TrueAnomaly	ds.b	32
string_Density		ds.b	32
string_period		ds.b	32
string_RAlt			ds.b	32
string_Alt			ds.b	32
string_Vsurf		ds.b	32
string_Lat			ds.b	32
string_Lon			ds.b	32

;Fuel
string_LiquidFuelTot	ds.b	32
string_LiquidFuel	ds.b	32
string_OxidizerTot	ds.b	32
string_Oxidizer		ds.b	32
string_EChargeTot	ds.b	32
string_ECharge		ds.b	32
string_MonoPropTot	ds.b	32
string_MonoProp		ds.b	32
string_IntakeAirTot	ds.b	32
string_IntakeAir	ds.b	32
string_SolidFuelTot	ds.b	32
string_SolidFuel	ds.b	32
string_XenonGasTot	ds.b	32
string_XenonGas		ds.b	32
string_LiquidFuelTotS	ds.b	32
string_LiquidFuelS	ds.b	32
string_OxidizerTotS	ds.b	32
string_OxidizerS	ds.b	32

string_MissionTime	ds.b	32
string_deltaTime	ds.b	32
string_VOrbit		ds.b	32
string_MNTime		ds.b	32
string_MNDeltaV		ds.b	32
string_Pitch		ds.b	32
string_Roll			ds.b	32
string_Heading		ds.b	32
string_ActionGroups	ds.b	32
string_SOINumber	ds.b	32
string_MaxOverheat	dc.b	32
string_MachNumber	ds.b	32
string_IAS			ds.b	32
string_CurrentStage	ds.b	32
string_TotalStage	ds.b	32

;A KSP packet.
	even
TestPacket		dc.b	$1B,$53,$68,$44,$63,$1A,$12,$C9,$B1,$17,$93,$48,$B4,$56,$EF,$46,$C4,$54,$EF,$42,$3C,$AC,$7E,$3F 	;24 bytes
TestPacket2		dc.b	$E0,$14,$C7,$3D,$DE,$64,$E1,$40,$0C,$00,$00,$00,$21,$01,$00,$00,$51,$D5,$48,$40,$D3,$88,$8C,$3F,$29 ;25 bytes
TestPacket3		dc.b	$02,$00,$00,$33,$9C,$F8,$42,$53,$DA,$3F,$43,$E2,$54,$EF,$42,$B2,$14,$C7,$BD,$9E,$B8,$8E,$43,$00,$00
TestPacket4		dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$48,$42,$00,$00,$48,$42,$00,$00,$20
TestPacket5		dc.b	$41,$00,$00,$20,$41,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0C,$43,$28,$2F,$D6,$42,$00,$00,$00,$00
TestPacket6		dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$00,$00,$00,$00
TestPacket7		dc.b	$00,$00,$00,$2E,$CF,$53,$43,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$B4,$42,$00,$00,$00,$00,$3F,$A0
TestPacket8		dc.b	$D3,$3F,$00,$00,$82,$22,$5F,$1E,$A5,$3E,$F9,$22,$DE,$42,$00,$01,$12,$34

