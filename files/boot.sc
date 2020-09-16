/* boot.sc*/

// SUPER DIRT
"/Users/moxuse/dev/tidal_sc/start_superdirt.scd".loadPaths;

// GRAINULER
"/Users/moxuse/dev/sc/src/grain_test.sc".loadPaths;

// CAGECUT
"/Users/moxuse/dev/sc/src/cagecut_selector_gui.sc".loadPaths;


//MIDI port ORCA
(
MIDIClient.init;
MIDIIn.connect;
)
(
var diversions = ();
~instList = [
	(\name: \ml, \index: 0)
	, (\name: \ml2, \index: 34)
	, (\name: \ml3, \index: 0)
	, (\name: \ml4, \index: 16)
	, (\name: \ml5, \index: 3)
	, (\name: \mb, \index: 2) // 5
	, (\name: \ml, \index: 8)
	, (\name: \mbd2, \index: 8)
	, (\name: \mst, \index: 7)
	, (\name: \mhh, \index: 0)
	, (\name: \mbs, \index: 1) // 10
	, (\name: \ml6, \index: 1)
	, (\name: \ml6, \index: 2)
	// 10
];
~instList2 = [
	\shu,
	\shu2,
	\mem1,
	\mem2,
	\lead_0,
	\lead_1,
	\lead_2,
	\lead_f,
	\lead_g,
	\lead_h,
	\lead_i,
	\flau,
	\lead_j,
	\lead_k
];
~instList3 = [
	(\name: \ml3, \index: 2)
	, (\name: \mfl, \index: 9)
	, (\name: \mfl, \index: 7)
	, (\name: \ml2, \index: 20)
];

//PMOSC
"/Users/moxuse/dev/sc/src/pmosc.sc".loadPaths;

"/Users/moxuse/dev/sc/src/orca_midi_min.sc".loadPaths;
"/Users/moxuse/dev/sc/src/lead_receiver.sc".loadPaths;
"/Users/moxuse/dev/sc/src/orca_playback.sc".loadPaths;

~diversions = diversions;
~dirt.orbits[0].defaultParentEvent[\diversion] = { diversions[~s].value };
~diversions[\sync] = {
	NetAddr("localhost", 49160).sendMsg("time:0");
};
)


( // reset event
~diversions[\sync] = nil;
~dirt.orbits[0].defaultParentEvent[\diversion] = nil
)
