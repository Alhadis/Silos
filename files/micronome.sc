
//Microbrute keyboard range C0 - C6: midi nums: 12 - 84
//Velocity doesnt matter to the brute.
~mOut.noteOn(0, 73);// Max velocity at all times!!!!!!!

~mOut.noteOff(0, 65);// Max velocity at all times!!!!!!!

~mOut.allNotesOff(0);

(
// State
var show = false;
var hold = false;
var transPressCount = 0;
var seqPressCount = 0;


// Notes
var pitchRange = 2;
// var notesOn = Bag[]; ??????
var topNote = 60;
var topNoteOff = 60;

//Sequence
 var seqState = 0; //0 is off, 1 is recording, and else is playing
// var seq = List[]......
var selectedSeq = 0; // thru 3


// Osc
var monome = NetAddr.new("localhost", 13090);
var bridge = NetAddr.new("localhost", 8000);

// Functions
var lightMonome;
var noteOn, noteOff, setHold, setMod;
var selectPress, playPress, transPress;


setMod = { |val|
	// enter the value that you want it to be changed to.
	if((val >= 0) && (val <= 12)){
		pitchRange = val;
		~mOut.sysex(Int8Array[16rB0, 16r65, 16r0, 16rB0, 16r64, 16r0,
			16rB0, 16r06, val]);
		//if( val < 4){
		monome.sendMsg("/sc/mutrol/grid/led/row", 0,0,
			if(val<4){ 1+(16*((2**val) -1 )) }{ 241 },
			if(val<4){ 0 }{ 2**(val-4)-1} );
	}
};

setHold = {|state|
	hold = state;
	~mOut.control(0, 105, 127*(hold.if{0}{1}) );
	monome.sendMsg("/sc/mutrol/grid/led/row", 0,7,hold.if{12}{3}+80, 171);
	noteOff.(topNote);
};

noteOn = {|num| if((num>=12) && (num <= 96)){ ~mOut.noteOn(0, num) }};
noteOff = {|num|  ~mOut.noteOff(0, num) };

lightMonome = {
	var play = (seqState == 1);
	var pitchG4 = (pitchRange >=5 );
	// Left side
	monome.sendMsg("/sc/mutrol/grid/led/map", 0,0,
		(pitchG4.if{241}{ 1+(16*((2**pitchRange)-1)) }) +
		(if(~trans.on){12}{0}),
		80, 0, // Tap and clear - let tick handle updating this
		// Play and select
		80 + ( play.if{12}{0} ), 80 + ( play.if{12}{0} ),
		80, // Record
		0, //Playback speed
		80+3+(9*hold.if{1}{0}) // Hold
	);
	// Right Side
	monome.sendMsg("/sc/mutrol/grid/led/map", 8,0,
		(pitchG4).if{ 2**(pitchRange-4)-1 }{0},
		171,0,171,171,171,0,171);
};

selectPress = {|xPos, yPos|
	seqPressCount = seqPressCount + 1;
	if(seqPressCount == 1){ selectedSeq = 2*(yPos-3) + xPos }
};

playPress = {|time|
};

transPress = {
	if( ~trans.on ){
		~trans.stop;
		monome.sendMsg("/sc/mutrol/grid/led/set", 2,0,0);
		monome.sendMsg("/sc/mutrol/grid/led/set", 3,0,0);
		monome.sendMsg("/sc/mutrol/grid/led/row",
			0,1,80,171);
		monome.sendMsg("/sc/mutrol/grid/led/row",0,2,0);
	}{
		~trans.start;
		monome.sendMsg("/sc/mutrol/grid/led/set", 2,0,1);
		monome.sendMsg("/sc/mutrol/grid/led/set", 3,0,1);
	}
};
// Initialization
~mOut.control(0,105, 0);  // Seq Play hold to off
~mOut.sysex(Int8Array[16rB0, 16r65, 16r0, 16rB0, 16r64, 16r0,
	16rB0, 16r06, 2]);

lightMonome.value;

// Osc
OSCdef(\mutrol_press,
	{|msg, time|  //msg.postln;
		var xPos = msg[1], yPos = msg[2];
		show = true;
		if(msg[3] == 1)
		// Press
		{
			if(xPos >= 4)
			{
				//Mod or key press
				if(yPos == 0)
				{ setMod.(xPos-3) }
				{
					if(hold){ noteOff.(topNote) };
					topNote = (12*yPos) + (xPos-4);
					if(seqState != 1){ noteOn.(topNote) };
				}

			}{// Control area
				case
				// Exit and toggle trans
				{ yPos == 0 }
				{
					if(xPos < 2)
					{ show = false;  bridge.sendMsg("/bridge/show"); } // Exit
					{ transPress.() } // On Off
				}

				// Tap and Clear
				{ (yPos == 1) || (yPos == 2)}
				{
					if(xPos < 2)
					{ ~trans.clear_tap } // Clear
					{ ~trans.tap(time) } // Tap
				}

				// Pattern Select and play
				{ (yPos == 3) || (yPos == 4)}
				{
					if(xPos < 2)
					{ selectPress.(xPos, yPos) }
					{ playPress.(time) }
				}

				// Nothin
				//{ yPos == 5 }

				// Pattern Note Speed
				//{ yPos == 6 }

				// Hold
				{ yPos == 7 }
				{
					if( xPos<2 )
					{ setHold.(false) }
					{ setHold.(true) }
				}
			}
		}
		// Release
		{
			if((xPos >= 4) && (yPos >= 1) && (hold == false))
			{ noteOff.((12*yPos) + (xPos-4)) }
		}
	},
	'/sc/mutrol/grid/key');

OSCdef(\mutrol_show, { show = true; lightMonome.value; }, '/sc/mutrol/show');
OSCdef(\mutrol_hide, { show = false; }, '/sc/mutrol/hide');

OSCdef(\mutrol_tick,
	{ |msg|
		var tick = msg[1];
		/*if(seqState == 1){
			var speed = 12;
			if(tick%(speed) == 0){
				if((tick/speed)%2 == 0)
				{ noteOff.(topNote); topNoteOff = topNote }//on
				{ noteOff.(topNoteOff) }
			}
		};*/
		if(show != false){
			if(tick%48 == 0){
				monome.sendMsg("/sc/mutrol/grid/led/set", 0,1,1);
				monome.sendMsg("/sc/mutrol/grid/led/set", 1,1,1);
				monome.sendMsg("/sc/mutrol/grid/led/set", 0,2,1);
				monome.sendMsg("/sc/mutrol/grid/led/set", 1,2,1);
				monome.sendMsg("/sc/mutrol/grid/led/set", 2,1,0);
				monome.sendMsg("/sc/mutrol/grid/led/set", 2,2,0);
				monome.sendMsg("/sc/mutrol/grid/led/set", 3,1,0);
				monome.sendMsg("/sc/mutrol/grid/led/set", 3,2,0);
			};
			if(tick%48 == 24){
				monome.sendMsg("/sc/mutrol/grid/led/set", 2,1,1);
				monome.sendMsg("/sc/mutrol/grid/led/set", 2,2,1);
				monome.sendMsg("/sc/mutrol/grid/led/set", 3,1,1);
				monome.sendMsg("/sc/mutrol/grid/led/set", 3,2,1);
				monome.sendMsg("/sc/mutrol/grid/led/set", 0,1,0);
				monome.sendMsg("/sc/mutrol/grid/led/set", 1,1,0);
				monome.sendMsg("/sc/mutrol/grid/led/set", 0,2,0);
				monome.sendMsg("/sc/mutrol/grid/led/set", 1,2,0);
			}
		}
	},
	'/tick');
)


// cc messages

// On sc
//Receive Channel 102
//Sync Source 108 // internal or external or auuto
//LFO Retrig Mode 110
//Gate Length 113//Length of notes being played in sequenece

//Maybe later
//Next Seq Mode 106 //instant change or wait until current is over
//Seq Retrig 104
//Env Legato Mode 109

// Prob never
//Note Priority 111
//Seq Step/Gate Mode 114 //use the gate or tempo