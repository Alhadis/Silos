/*“The Universe is in My Voice
The Universe Speaks through the Dawn
To Those of Earth and Other Worlds
Listen While You Have the Chance”
- Sun Ra
Excerpt from Astro Black,
The Immeasurable Equation: The Collected Poetry and Prose
2005, Pg 75
*/

///
Server.default.options.outDevice_("External Headphones");
Troop.start;
Server.killAll;

/// dynklank drones with pythagorean arrays
(
SynthDef('universe', { |out,"/Users/rrome/Desktop/Troop-0.10.2/src/interface/img/icon.ico"
    amps (#[0.03, 0.3, 0.6, 1.2])|
	var freqs, env, signal;
	freqs = Array.fill(4, Pxrand([27, 28.44, 32, 36, 38.44, 42.66, 48, 54, 56.88, 64, 216, 227.55, 256, 288, 307.54, 341.33, 384, 432, 455.11, 512, 576, 615.09, 768, 682.88, 1728, 1820.44, 2048], inf).iter);
	env = Env.sine(90, 1);
    signal = DynKlank.ar(`[freqs, amps], PinkNoise.ar([0.007,0.007]));
	Out.ar(out, signal*EnvGen.kr(env, doneAction: Done.freeSelf));
}).add;
)

b = Synth('universe');
a.free;
b.free;

a.set(\amps, Array.rand(4, 0.3, 2));//f
a.set(\amps, Array.rand(4, 0.3, 1.2));//mf
a.set(\amps, Array.rand(4, 0.03, 1));//mp
a.set(\amps, Array.rand(4, 0.03, 0.6));//p

/// pinkmorse longtones
(
SynthDef('pinkmorse', { |out,
	dur = 90,
	level = 0.5|
	Out.ar(out, [PinkNoise.ar(EnvGen.kr(Env.triangle(dur, level), 1, 1, 0, 1, 2)), PinkNoise.ar(EnvGen.kr(Env.triangle(dur, level), 1, 1, 0, 1, 2))])
}).add;
)

c = Synth('pinkmorse');
c.free;

///pinkmorse loops

(Task({
	var dur, level;
	dur = 0.5;
	level = 0.25;
	3.do { arg i;
		Synth.grain(
			'pinkmorse',
			["dur", 1],
			s
		);
	};
	3.do { arg i;
		Synth.grain(
			'pinkmorse',
			["dur", 2],
			s
		);
	};
	3.do { arg i;
		Synth.grain(
			'pinkmorse',
			["dur", 1],
			s
		);
	};
}).play;
)

///
//

(
Task{
	var dur, level;
	dur = 0.5;
	level = 0.25;
	//universe
	2.do { arg i;
		Synth.grain(
			'pinkmorse',
			["dur", 1],
			s
		);
	};
	/*
		1.do { arg i;
		Synth.grain(
			'pinkmorse',
			["dur", 2],
			s
		);
		"..-   ".postln;
		3.wait;
	};
	1.do { arg i;
		Synth.grain(
			'pinkmorse',
			["dur", 2],
			s
		);
	};
	    1.do { arg i;
		Synth.grain(
			'pinkmorse',
			["dur", 1],
			s
		);
		"-.   ".postln;
		3.wait;
	};
	2.do { arg i;
		Synth.grain(
			'pinkmorse',
			["dur", 1],
			s
		);
		"..   ".postln;
		3.wait;
	};
	3.do { arg i;
		Synth.grain(
			'pinkmorse',
			["dur", 1],
			s
		);
	};
		1.do { arg i;
		Synth.grain(
			'pinkmorse',
			["dur", 2],
			s
		);
		"...-   ".postln;
		3.wait;
	};
	    1.do { arg i;
		Synth.grain(
			'pinkmorse',
			["dur", 1],
			s
		);
		3.wait;
		".   ".postln;
	};
	1.do { arg i;
		Synth.grain(
			'pinkmorse',
			["dur", 1],
			s
		);
	};
	1.do { arg i;
		Synth.grain(
			'pinkmorse',
			["dur", 2],
			s
		);
	};
		1.do { arg i;
		Synth.grain(
			'pinkmorse',
			["dur", 1],
			s
		);
		".-.   ".postln;
		3.wait;
	};
	3.do { arg i;
		Synth.grain(
			'pinkmorse',
			["dur", 1],
		);
		"...   ".postln;
		3.wait;
	};
	1.do { arg i;
		Synth.grain(
			'pinkmorse',
			["dur", 1],
			s
		);
		".   ".postln;
		3.wait;
	*/

}).play;

u.stop;
u.play;

///morse visualization for sc
(
/*
*  MORSE by Jonathan Siemasko
*  http://www.schemawound.com/
*  Function to take a string and convert it to morse code.
*  Handles a-z, A-Z and 0-9
*/
var morse = {|inString, spaceBetweenLetters = 3, spaceBetweenWords = 7|
	var outString = ""; //String that will be output
	var letterSpace = ""; //String representing space between letters
	var wordSpace = ""; //String representing space between words
	var charToMorse;
	(spaceBetweenLetters - 1).do{letterSpace = letterSpace ++ " "};
	(spaceBetweenWords - spaceBetweenLetters).do{wordSpace = wordSpace ++ " "};
	charToMorse = {|inChar|
		switch(inChar,
			$A, {".-"},     $B, {"-..."},   $C, {"-.-."},   $D, {"-.."},    $E, {"."},      $F, {"..-."},
			$G, {"--."},    $H, {"...."},   $I, {".."},     $J, {".---"},   $K, {"-.-"},    $L, {".-.."},
			$M, {"--"},     $N, {"-."},     $O, {"---"},    $P, {".--."},   $Q, {"--.-"},   $R, {".-."},
			$S, {"..."},    $T, {"-"},      $U, {"..-"},    $V, {"...-"},   $W, {".--"},    $X, {"-..-"},
			$Y, {"-.--"},   $Z, {"--.."},
			$1, {".----"},  $2, {"..---"},  $3, {"...--"},  $4, {"....-"},  $5, {"....."},  $6, {"-...."},
			$7, {"--..."},  $8, {"---.."},  $9, {"----."},  $0, {"-----"},
			$ , {wordSpace}
		);
	};
	inString.toUpper.do{|char, i|
		var isFinalChar = (i != (inString.size - 1));
		var isWordSpace = (char != $ );
		outString = outString ++ charToMorse.(char);
		if(isFinalChar && isWordSpace, {outString = outString + letterSpace});
	};
	outString;
};
morse.("The Universe is in My Voice");
)
