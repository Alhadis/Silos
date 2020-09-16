TrainingSample {
	classvar <version;
	classvar < s;
	classvar <allowBroadcast;
	classvar <printO;
	classvar <printIO;
	classvar <toThinkingModule;
	classvar <printI;
	classvar <b;

	*init {

		super.initClass;
			 version = "June 06 2017";
		     ("TechLado.sc: " ++ version).postln;
	}

		*normalize {
		arg x,y, threshold = (-40);
		var z = y.clip(threshold.dbamp, 300.dbamp);//normliztion to 0.dbmps?
		^ (x/z);
//(y < (threshold.dbamp)).asInteger *
			}

	*outOfRange {
		|x, y, threshold= (-40), outOfRange = (-1)|
		var a = x * (y > (threshold.dbamp)); //  x or 0
		var b = (y <= (threshold.dbamp)) * outOfRange;
		^a+b;
		}

	*record  {arg pathToAudio = "~/path", dKickOutput = Env.new([-0.9, -0.9], [30]), dHiHatsOutput = Env.new([-0.9, -0.9], [30]), dSnareOutput = Env.new([-0.9, -0.9], [30]), dGuiraOutput = Env.new([-0.9, -0.9], [30]), dTimbalOutput = Env.new([-0.9, -0.9], [30]), dJamBlockOutput = Env.new([-0.9, -0.9], [30]), dPadOutput = Env.new([-0.9, -0.9], [30]), dBassOutput = Env.new([-0.9, -0.9], [30]), dStringsOutput = Env.new([-0.9, -0.9], [30]), loopSample = 0, port = 57700, printIandO = false, printInputs = false, printOutputs = false, doneActionKick = 0, doneActionHihats = 0, doneActionSnare = 0, doneActionGuira = 0, doneActionTimbal = 0, doneActionJamB = 0, doneActionPad = 0, doneActionBass = 0, doneActionStrings = 0;

		~doneActionKick = doneActionKick; ~doneActionHihats = doneActionHihats;~doneActionSnare =  doneActionSnare; ~doneActionGuira = doneActionGuira; ~doneActionTimbal = doneActionTimbal;  ~doneActionJamB = doneActionJamB; ~doneActionPad = doneActionPad;   ~doneActionBass = doneActionBass; ~doneActionStrings = doneActionStrings;
		toThinkingModule = NetAddr.new("localhost", port);
			 allowBroadcast = true;
			 printO = printOutputs;
		     printI = printInputs;
		     printIO = printIandO;
		     b = Bus.control(s, 12);
//b.scope;

		~bufferAlloc0 = Buffer.alloc(s, 1024,2);//for sampling rates 44100 and 48000
		~bufferAlloc1 = Buffer.alloc(s, 1024,2);
		~bufferAlloc2 = Buffer.alloc(s, 1024,2);
		~bufferAlloc3 = Buffer.alloc(s, 1024,2);
		~bufferAlloc4 = Buffer.alloc(s, 1024,2);
		~bufferAlloc5 = Buffer.alloc(s, 1024,2);
		~bufferAlloc6 = Buffer.alloc(s, 1024,2);

		~performance = Buffer.read(s, pathToAudio);
		~dKickOutput = dKickOutput;
		~dHiHatsOutput = dHiHatsOutput;
		~dSnareOutput = dSnareOutput;
		~dGuiraOutput = dGuiraOutput;
		~dTimbalOutput = dTimbalOutput;
		~dJamBlockOutput = dJamBlockOutput;
		~dPadOutput = dPadOutput;
		~dBassOutput = dBassOutput;
		~dStringsOutput = dStringsOutput;
		~loopSample = loopSample;

//~performance = Buffer.read(s, "c:\\Users\\d0kt0r0\\Desktop\\trainingSamples\\c0");
//~performance = RGGTRN.timbal;
//Env.new([0,0,1,1,0,0],[5,0.05,120,1]);
// ~desiredOutput = ~generateOutputEnvelope.([ [5,125] ]); // this would be very convenient...
//~bufferRead = RGGTRN.timbal;

SynthDef (\training, {
	var in0 = PlayBuf.ar(2, ~performance, BufRateScale.kr(~performance),1, 0, ~loopSample, doneAction:2); //read buffer two channels(stereo)
	var in = Mix.ar(in0); //mixing to one channel (mono)
	var fft0 = FFT(~bufferAlloc0, in);
	var fft1 = PV_Copy(fft0, ~bufferAlloc1);
	var fft2 = PV_Copy(fft0, ~bufferAlloc2);
	var fft3 = PV_Copy(fft0, ~bufferAlloc3);
    var fft4 = PV_Copy(fft0, ~bufferAlloc4);
 	var fft5 = PV_Copy(fft0, ~bufferAlloc5);
    var fft6 = PV_Copy(fft0, ~bufferAlloc6);

	//////////////////////feature extraction Ugens//////////////////
	var loudness = Loudness.kr(fft0); //loudness = amplitude = intensity
	var pitch = Pitch.kr(in, initFreq:in, minFreq:16); //pitch detection in Hertz
	// mfcc = MFCC.kr(fft1, 13); //timbre detection only for monophonic instruments/pieces
	var centroid = SpecCentroid.kr(fft1); //amount of brightness = amount of treble freqs
	var amplitude = Amplitude.kr(in);
	var filteringVeryLowFreqs = TrainingSample.normalize(Amplitude.kr(LPF.ar(in, 60)), amplitude); //filtering freqs as Rhythm 20hz and below
			var filteringLowFreqs = TrainingSample.normalize(Amplitude.kr (BPF.ar(in, 120, 1.3)), amplitude); //filtering low freqs between 20 and 100hz
	var filteringMidFreqs = TrainingSample.normalize(Amplitude.kr(BPF.ar(in, 240, 1.3)), amplitude); //filtering mid freq between 100 and 500hz
	var filteringHighFreqs = TrainingSample.normalize(Amplitude.kr(HPF.ar(in,480)), amplitude); //filtering high freq above 501hz
	var cFilter = Amplitude.kr(Mix.ar(BPF.ar(in,[24,36,48,60,72,84,96].midicps,0.01)));//filtering the pitch class of C
			var csFilter = Amplitude.kr(Mix.ar(BPF.ar(in,([24,36,48,60,72,84,96]+1).midicps,0.01))); //... C#
	var dFilter = Amplitude.kr(Mix.ar(BPF.ar(in,([24,36,48,60,72,84,96]+2).midicps,0.01))); //... D
	var dsFilter = Amplitude.kr(Mix.ar(BPF.ar(in,([24,36,48,60,72,84,96]+3).midicps,0.01))); //... D#
	var eFilter = Amplitude.kr(Mix.ar(BPF.ar(in,([24,36,48,60,72,84,96]+4).midicps,0.01))); //... E
	var fFilter = Amplitude.kr(Mix.ar(BPF.ar(in,([24,36,48,60,72,84,96]+5).midicps,0.01))); //... F
	var fsFilter = Amplitude.kr(Mix.ar(BPF.ar(in,([24,36,48,60,72,84,96]+6).midicps,0.01))); //... F#
    var gFilter = Amplitude.kr(Mix.ar(BPF.ar(in,([24,36,48,60,72,84,96]+7).midicps,0.01))); //... G
	var gsFilter = Amplitude.kr(Mix.ar(BPF.ar(in,([24,36,48,60,72,84,96]+8).midicps,0.01))); //... G#
  	var aFilter = Amplitude.kr(Mix.ar(BPF.ar(in,([24,36,48,60,72,84,96]+9).midicps,0.01))); //... A
	var asFilter = Amplitude.kr(Mix.ar(BPF.ar(in,([24,36,48,60,72,84,96]+10).midicps,0.01))); //... A#
	var bFilter = Amplitude.kr(Mix.ar(BPF.ar(in,([24,36,48,60,72,84,96]+11).midicps,0.01))); //... B
	var onsets = Onsets.kr(fft2,0,\rcomplex); //detecting intitial impulse of a sound (transient)
			var zeroCrossing = ZeroCrossing.kr(A2K.kr(in)); //detecting variation or changes in the signal
	var specFlatness = SpecFlatness.kr(fft3);// how "noise-like is a sound" (wikipedia), how tonal or noisy is, how close is a sound to being a noise, 0 = pure sinusoid to 1 = white noise
	var specPcile = SpecPcile.kr(fft4, 0.95); //amount of skweness (assimetry) of a wave// cumulative distribution of the freq spectrum// in which band (high, mid or low) is the energy located
	var keyTrack = KeyTrack.kr(fft5);

	////////////////////desired outputs/////////////////

			var desiredKick = EnvGen.kr(~dKickOutput, doneAction: ~doneActionKick);
	var desiredHihats = EnvGen.kr(~dHiHatsOutput, doneAction: ~doneActionHihats);
	var desiredSnare = EnvGen.kr(~dSnareOutput, doneAction: ~doneActionSnare);
	var desiredGuira = EnvGen.kr(~dGuiraOutput, doneAction: ~doneActionGuira);
	var desiredTimbal = EnvGen.kr(~dTimbalOutput, doneAction: ~doneActionTimbal);
	var desiredJamBlock = EnvGen.kr(~dJamBlockOutput, doneAction: ~doneActionJamB);
	var desiredPad = EnvGen.kr(~dPadOutput, doneAction: ~doneActionPad);
	var desiredBass = EnvGen.kr(~dBassOutput, doneAction: ~doneActionBass);
	var desiredStrings = EnvGen.kr(~dStringsOutput, doneAction: ~doneActionStrings);


	var quarternotetick, eighthnotetick, sixteenthnotetick, tempo, features;
	#quarternotetick, eighthnotetick, sixteenthnotetick, tempo =	BeatTrack.kr(fft6);


	///////////////////////sending sound features to a list////////////////////////////
	features = [/*3*/amplitude, /*4*/pitch[0], /*5*/centroid, /*6*/filteringVeryLowFreqs, /*7*/ filteringLowFreqs, /*8*/ filteringMidFreqs, /*9*/filteringHighFreqs, /*10*/ cFilter, /*11*/csFilter, /*12*/ dFilter, /*13*/ dsFilter, /*14*/eFilter, /*15*/fFilter, /*16*/ fsFilter, /*17*/ gFilter, /*18*/ gsFilter, /*19*/aFilter, /*20*/asFilter, /*21*/ bFilter, /*22*/ onsets, /*23*/ zeroCrossing, /*24*/ specFlatness, /*25*/ specPcile, /*26*/ keyTrack, /*27*/ quarternotetick,
		/*28*/ eighthnotetick, /*29*/ sixteenthnotetick, /*30*/ tempo, /*31*/ desiredKick, /*32*/desiredHihats, /*33*/ desiredSnare, /*34*/ desiredGuira, /*35*/ desiredTimbal, /*36*/ desiredJamBlock, /*37*/ desiredPad, /*38*/ desiredBass, /*39*/desiredStrings];
	SendReply.kr(Impulse.kr(20), "/training", features);
			Out.kr(b.index, [cFilter, csFilter, dFilter, dsFilter, eFilter, fFilter, fsFilter, gFilter, gsFilter, aFilter, asFilter, bFilter]);
	Out.ar(0, in0);
}).play;

//receiving features and adding them to a list
OSCdef (\feat, {|msg, time|
	var d = Dictionary.new;
	d[\time] = time;
			/*1*/d[\amplitude] = msg[3]; //.linlin(0,64, -1,1);
			/*2*/d[\pitch] = msg[4].linlin(16, 4000, -1,1);
			/*3*/d[\centroid] = msg[5].linlin(20, 20000, -1,1);
			/*4*/d[\filteringVeryLowFreqs] = msg[6].linlin(0.01,1, -1,1);
			/*5*/d[\filteringLowFreqs] = msg[7].linlin(0.01, 1, -1,1);
			/*6*/d[\filteringMidFreqs] = msg[8].linlin(0.01, 1, -1,1);
			/*7*/d[\filteringHighFreqs] = msg[9].linlin(0.01, 1, -1,1);
			/*8*/d[\cFilter] = msg[10].linlin(24,96, -1,1);
    /*9*/d[\csFilter] = msg[11];
			/*10*/d[\dFilter] = msg[12].linlin(0,0.1, -1,1);
	/*11*/d[\dsFilter] = msg[13].linlin(0,0.1, -1,1);
	/*12*/d[\eFilter] = msg[14].linlin(0,0.1, -1,1);
	/*13*/d[\fFilter] = msg[15].linlin(0,0.1, -1,1);
	/*14*/d[\fsFilter] = msg[16].linlin(0,0.1, -1,1);
	/*15*/d[\gFilter] = msg[17].linlin(0,0.1, -1,1);
	/*16*/d[\gsFilter] = msg[18].linlin(0,0.1, -1,1);
	/*17*/d[\aFilter] = msg[19].linlin(0,0.1, -1,1);
	/*18*/d[\asFilter] = msg[20].linlin(0,0.1, -1,1);
	/*19*/d[\bFilter] = msg[21].linlin(0,0.1, -1,1);
			/*20*/d[\onsets] = msg[22].linlin(0,1, -1,1);
			/*21*/d[\zeroCrossing] = msg[23].linlin(0,9000, -1,1); //confirm later
			/*22*/d[\specFlatness] = msg[24].linlin(0,1, -1,1);
			/*23*/d[\specPcile] = msg[25].linlin(0,20900, -1,1);
			/*24*/d[\keyTrack] = msg[26].linlin(0,23, -1,1);
			/*25*/d[\quarternotetick] = msg[27].linlin(0,1, -1,1);
			/*26*/d[\eighthnotetick] = msg[28].linlin(0,1, -1,1);
			/*27*/d[\sixteenthnotetick] = msg[29].linlin(0,1, -1,1);
			/*28*/d[\tempo] = msg[30].linlin(0,2, -1,1);
			/////////////desired outputs//////////
	/*29*/d[\desiredKick] = msg[31];
	/*30*/d[\desiredHihats] = msg[32];
	/*31*/d[\desiredSnare] = msg[33];
	/*32*/d[\desiredGuira] = msg[34];
	/*33*/d[\desiredTimbal] = msg[35];
	/*34*/d[\desiredJamBlock] = msg[36];
	/*35*/d[\desiredPad] = msg[37];
	/*36*/d[\desiredBass] = msg[38];
	/*37*/d[\desiredStrings] = msg[39];
			if (printOutputs, {["kick " ++ d[\desiredKick].asFloat, "hihats " ++ d[\desiredHihats].asFloat,  "snare " ++ d[\desiredSnare].asFloat, "guira " ++ d[\desiredGuira].asFloat, "timbal " ++ d[\desiredTimbal].asFloat, "jamBlock " ++ d[\desiredJamBlock].asFloat, "pad " ++ d[\desiredPad].asFloat, "bass " ++ d[\desiredBass].asFloat, "strings " ++ d[\desiredStrings].asFloat].postln});
			if (printInputs, {"inputs" ++ [d[\amplitude].asFloat, d[\pitch].asFloat, d[\centroid].asFloat, d[\filteringVeryLowFreqs].asFloat, d[\filteringLowFreqs].asFloat, d[\filteringMidFreqs].asFloat, d[\filteringHighFreqs].asFloat, d[\cFilter].asFloat, d[\csFilter].asFloat, d[\dFilter].asFloat, d[\dsFilter].asFloat, d[\eFilter].asFloat, d[\fFilter].asFloat, d[\fsFilter].asFloat, d[\gFilter].asFloat, d[\gsFilter].asFloat, d[\aFilter].asFloat, d[\asFilter].asFloat, d[\bFilter].asFloat, d[\onsets].asFloat, d[\zeroCrossing].asFloat, d[\specFlatness].asFloat, d[\specPcile].asFloat, d[\keyTrack].asFloat, d[\quarternotetick].asFloat, d[\eighthnotetick].asFloat, d[\sixteenthnotetick].asFloat, d[\tempo].asFloat, d[\desiredKick].asFloat, d[\desiredHihats].asFloat, d[\desiredSnare].asFloat, d[\desiredGuira].asFloat, d[\desiredTimbal].asFloat, d[\desiredJamBlock].asFloat, d[\desiredPad].asFloat, d[\desiredBass].asFloat, d[\desiredStrings].asFloat].postln});
			if (printIandO, {["inputs" ++ [/*d[\amplitude].asFloat, d[\pitch].asFloat,*/ d[\centroid].asFloat, d[\filteringVeryLowFreqs].asFloat, d[\filteringLowFreqs].asFloat, d[\filteringMidFreqs].asFloat, d[\filteringHighFreqs].asFloat, /*d[\cFilter].asFloat, d[\csFilter].asFloat, d[\dFilter].asFloat, d[\dsFilter].asFloat, d[\eFilter].asFloat, d[\fFilter].asFloat, d[\fsFilter].asFloat, d[\gFilter].asFloat, d[\gsFilter].asFloat, d[\aFilter].asFloat, d[\asFilter].asFloat, d[\bFilter].asFloat,*/ d[\onsets].asFloat, d[\zeroCrossing].asFloat, d[\specFlatness].asFloat, d[\specPcile].asFloat /*d[\keyTrack].asFloat, d[\quarternotetick].asFloat, d[\eighthnotetick].asFloat, d[\sixteenthnotetick].asFloat, d[\tempo].asFloat*/ ], "outputs" ++ [d[\desiredKick].asFloat, /*d[\desiredHihats].asFloat, d[\desiredSnare].asFloat,*/ d[\desiredGuira].asFloat, d[\desiredTimbal].asFloat, d[\desiredJamBlock].asFloat,/* d[\desiredPad].asFloat,*/ d[\desiredBass].asFloat, d[\desiredStrings].asFloat]].postln;});

			if (allowBroadcast, {
				toThinkingModule.sendMsg("/train",  /**d[\amplitude].asFloat, d[\pitch].asFloat,*/ d[\centroid].asFloat, d[\filteringVeryLowFreqs].asFloat, d[\filteringLowFreqs].asFloat, d[\filteringMidFreqs].asFloat, d[\filteringHighFreqs].asFloat, /*d[\cFilter].asFloat, d[\csFilter].asFloat, d[\dFilter].asFloat, d[\dsFilter].asFloat, d[\eFilter].asFloat, d[\fFilter].asFloat, d[\fsFilter].asFloat, d[\gFilter].asFloat, d[\gsFilter].asFloat, d[\aFilter].asFloat, d[\asFilter].asFloat, d[\bFilter].asFloat,*/ d[\onsets].asFloat, d[\zeroCrossing].asFloat, d[\specFlatness].asFloat, d[\specPcile].asFloat, /*d[\keyTrack].asFloat, d[\quarternotetick].asFloat, d[\eighthnotetick].asFloat, d[\sixteenthnotetick].asFloat, d[\tempo].asFloat*/ d[\desiredKick].asFloat, /*d[\desiredHihats].asFloat, d[\desiredSnare].asFloat,*/ d[\desiredGuira].asFloat, d[\desiredTimbal].asFloat, d[\desiredJamBlock].asFloat,/* d[\desiredPad].asFloat,*/ d[\desiredBass].asFloat, d[\desiredStrings].asFloat)});
}, "/training");
		^super.newCopyArgs(pathToAudio, dKickOutput, dHiHatsOutput, dSnareOutput, dJamBlockOutput, dPadOutput, dBassOutput, loopSample, printInputs, printOutputs, printIandO, doneActionKick, doneActionHihats, doneActionSnare, doneActionGuira, doneActionTimbal, doneActionJamB, doneActionPad, doneActionBass, doneActionStrings;
);
	}
}

