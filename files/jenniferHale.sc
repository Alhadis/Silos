// Samples to add:
// - have a nice day
// - center
// - orbital kill zone
// - ion cannon ready

// Need to filter the samples!!!

(

// Osc
var monome = NetAddr.new("localhost", 12261);
var bridge = NetAddr.new("localhost", 8000);

var invertLight, resetLight;
var synths;

// Samples
var sampdir = "/home/dylan/music/samples/g-nome-samples";
var buffers = [
	PathName(sampdir +/+ "weapons/").files.collect(
	{|file|
		if(file.fullPath.endsWith(".wav")){ Buffer.read(s, file.fullPath) }
	}),
	[Buffer.read(s, sampdir +/+ "misc/fullthrottle.wav")],
	[Nil],[Nil],
	[Buffer.read(s, sampdir +/+ "areyousure/menu-best.wav")],
	[Buffer.read(s, sampdir +/+ "misc/recommendcontrol86.wav")],
	[Nil],[Nil]
];

SynthDef(\jenhale, {|t_trig = -1, bufnum|
	var player;
	player = PlayBuf.ar(
		numChannels: 1,
		bufnum: bufnum,
		trigger: t_trig,
		rate: BufRateScale.kr(bufnum),
		doneAction:1
	);
	Out.ar(0, player);
}).add;


// Pause for the def to load
Task({ 0.2.wait }).play;


synths = buffers.collect{|buf|
	Synth.newPaused("jenhale", [bufnum: choose(buf)])};


invertLight = {|x,y|
	bridge.sendMsg("/sc/jenniferhale/grid/led/set",x, y, 1);
	bridge.sendMsg("/sc/jenniferhale/grid/led/set",x+1, y, 1);
	bridge.sendMsg("/sc/jenniferhale/grid/led/set",x+2, y, 1);
	bridge.sendMsg("/sc/jenniferhale/grid/led/set",x+3, y, 1);

	bridge.sendMsg("/sc/jenniferhale/grid/led/set",x, y+1, 1);
	bridge.sendMsg("/sc/jenniferhale/grid/led/set",x+1, y+1, 0);
	bridge.sendMsg("/sc/jenniferhale/grid/led/set",x+2, y+1, 0);
	bridge.sendMsg("/sc/jenniferhale/grid/led/set",x+3, y+1, 1);

	bridge.sendMsg("/sc/jenniferhale/grid/led/set",x, y+2, 1);
	bridge.sendMsg("/sc/jenniferhale/grid/led/set",x+1, y+2, 0);
	bridge.sendMsg("/sc/jenniferhale/grid/led/set",x+2, y+2, 0);
	bridge.sendMsg("/sc/jenniferhale/grid/led/set",x+3, y+2, 1);

	bridge.sendMsg("/sc/jenniferhale/grid/led/set",x, y+3, 1);
	bridge.sendMsg("/sc/jenniferhale/grid/led/set",x+1, y+3, 1);
	bridge.sendMsg("/sc/jenniferhale/grid/led/set",x+2, y+3, 1);
	bridge.sendMsg("/sc/jenniferhale/grid/led/set",x+3, y+3, 1);
};

resetLight = {|index|
	var str = "/sc/jenniferhale/grid/led/set";
	index = index - 1;
	bridge.sendMsg(str, (index%4)*4, index.div(4)*4, 0);
	bridge.sendMsg(str, (index%4)*4+1, index.div(4)*4, 0);
	bridge.sendMsg(str, (index%4)*4+2, index.div(4)*4, 0);
	bridge.sendMsg(str, (index%4)*4+3, index.div(4)*4, 0);

	bridge.sendMsg(str, (index%4)*4, index.div(4)*4+1,0);
	bridge.sendMsg(str, (index%4)*4+1, index.div(4)*4+1,1);
	bridge.sendMsg(str, (index%4)*4+2, index.div(4)*4+1,1);
	bridge.sendMsg(str, (index%4)*4+3, index.div(4)*4+1,0);

	bridge.sendMsg(str, (index%4)*4,index.div(4)*4+2,0);
	monome.sendMsg(str, (index%4)*4+1, index.div(4)*4+2,1);
	bridge.sendMsg(str, (index%4)*4+2, index.div(4)*4+2,1);
	bridge.sendMsg(str, (index%4)*4+3, index.div(4)*4+2,0);

	bridge.sendMsg(str, (index%4)*4, index.div(4)*4+3, 0);
	bridge.sendMsg(str, (index%4)*4+1, index.div(4)*4+3,0);
	bridge.sendMsg(str, (index%4)*4+2, index.div(4)*4+3,0);
	bridge.sendMsg(str, (index%4)*4+3, index.div(4)*4+3,0);
};

// Init
s.notify;
bridge.sendMsg("/sc/jenniferhale/grid/led/map",0,0,0,102,102,0,0,102,102,0);
bridge.sendMsg("/sc/jenniferhale/grid/led/map",8,0,128,38,102,0,0,102,102,0);


// Osc
OSCdef(\jenniferhale_press,
	{|msg|
		if(msg[3] == 1) // Press
		{
			var x = msg[1];
			var y = msg[2];

			case
			{ x >= 0 && x < 4 }{ // Weapon, Are you sure
				if( y >= 4 ){ //Are you sure
					synths[4].run;
					synths[4].set(\t_trig, 1);
					invertLight.value(0,4);
				}{  //Weapon
					synths[0].run;
					synths[0].set(\bufnum, choose(buffers[0]), \t_trig, 1);
					invertLight.value(0,0);
				}
			}
			{ x >=4 && x < 8 }{
				if( y >= 4 ){//control86
					synths[5].run;
					synths[5].set(\t_trig, 1);
					invertLight.value(4,4);
				}{	//full throttle
					synths[1].run;
					synths[1].set(\t_trig, 1);
					invertLight.value(4,0);
				}
			}
			// Exit
			{ x == 15 && y == 0 }{ bridge.sendMsg("/sc/jenniferhale/hide") }
		}
	}, '/sc/jenniferhale/grid/key');

OSCdef(\jenniferhale_show, {
	bridge.sendMsg("/sc/jenniferhale/grid/led/map", 0, 0,
		0,102,102,0,0,102,102,0);
	bridge.sendMsg("/sc/jenniferhale/grid/led/map", 8, 0,
		128,38,102,0,0,102,102,0);
}, '/sc/jenniferhale/show');

OSCdef.newMatching( \trig_respond,
	{ |msg|
		synths.do{|synth, index|
			if(synth.asNodeID == msg[3]){ resetLight.value(index) }
		}
	}, '/n_off');
)
