Server.program = "/usr/bin/scsynth";

// same for Score
Score.program = Server.program;

// set some server options for different setups
#[\internal, \local].do { |s|
	s = Server.perform(s);
	s.options.numInputBusChannels = 2; // set the number of output jack ports
	s.options.numOutputBusChannels = 2; // set the number of input jack ports
	s.options.memSize = 1024 * 54; // 12 Mb for the synth, rt-memory for DelayC and friends
	s.options.maxNodes = 1024 * 4; // increase the maximum number of nodes to play simultaneously

	// tips:
	// s.options.blockSize = 1; //great when using NRT to maximize the resolution of the 
				    // control rate ugens during the render
};

// hook up jack ports to audio channels
"SC_JACK_DEFAULT_INPUTS".setenv(
	"system:capture_1,"
	"system:capture_2"
);
"SC_JACK_DEFAULT_OUTPUTS".setenv(
	"system:playback_1,"
	"system:playback_2"
);
 
//---- now set up our gui portion ----//
GUI.swing; //use swingosc

//"AWT_TOOLKIT".setenv("MToolkit"); //necessary when working with Awesome WM 

SwingOSC.program = "/usr/share/SwingOSC/SwingOSC.jar";

//We choose a LookAndFeel - for aesthetic purposes? Actually here we do it to prevent a warning showing in the post window
SwingOSC.default.options.javaOptions = "-Dswing.defaultlaf=javax.swing.plaf.metal.MetalLookAndFeel";

g = SwingOSC.default;

g.waitForBoot({
 	Server.local.makeGui; //show local server
 	Server.internal.makeGui; //show internal server
});

