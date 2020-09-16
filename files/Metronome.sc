// Adapted from Metronome.sc found here: http://delysid.org/music/sc.html

// Todo:
//	- Allow bpm to be mapped to a midi control.
//	- Allow num and denom to be passed as a Pseq or array for compound time signatures.
//	- Centralise the bpm limits.
//	- Add GUI controls for changing time signature.

Metronome {
	// Metronome data.
	var <num,<denom,<bpm,<out,<isPlaying,<clock,pattern;
	
	*initClass {
		Class.initClassTree(Server);
	}
	
	*new {
		arg num=4,denom=4,bpm=120,out=0;
		^super.newCopyArgs(num,denom,bpm,out).init;
	}
	
	init {
		// Create the "click" synth.
		// Simply white noise passed through a high-pass filter and a percussive envelope.
		SynthDef(\metronomeClick, {
			arg out=0, amp=1;
			
			var env, output;
			env = Env.perc(0.01, 0.04, 1);
			output = HPF.ar(WhiteNoise.ar(amp), 800) * EnvGen.kr(env, doneAction:2);
			
			Out.ar(out, output);
		}).store;
		
		// Keep the bpm within limits.
		if ( bpm < 10,  { bpm = 10  } );
		if ( bpm > 300, { bpm = 300 } );
		
		isPlaying = false;
		clock = TempoClock(bpm/60);
		this.setUpPattern;
	}
	
	setUpPattern {
		pattern = Pbind(
			\instrument, \metronomeClick,
			\amp, Pseq([0.5,Pseq([0.1],num-1)],inf),
			\dur, 4/denom,
			\out, out);
	}
	
	num_ {
		arg newVal;

		pattern.stop;
		num = newVal;
		if (isPlaying) { this.play };
	}
	
	denom_ {
		arg newVal;

		pattern.stop;
		denom = newVal;
		if (isPlaying) {this.play};
	}
	
	bpm_ {
		arg newVal;
		
		bpm = newVal;
		
		if ( bpm < 10 , { bpm = 10  } );
		if ( bpm > 300, { bpm = 300 } );
		
		clock.tempo = bpm/60;
	}
	
	out_ {
		arg newVal;
		
		pattern.stop;
		out = newVal;
		this.setUpPattern;
		if (isPlaying) {this.play};
	}
	
	play {
		if (isPlaying) {this.stop};
		this.setUpPattern;
		pattern=pattern.play(clock:clock, quant:denom);
		isPlaying = true;
	}
	
	stop {
		pattern.stop;
		isPlaying = false;
	}
}

MetronomeGUI {
	var <metronome;
	// GUI
	var tempoSpec,win,bStart,bClose,timeSigDisplay,tempoSlider,tempoDisplay;
	
	*initClass {
	}
	
	*new {
		arg num=4,denom=4,bpm=120,out=0;
		^super.newCopyArgs(num,denom,bpm,out).init;
	}
	
	init {
		metronome = Metronome.new(4, 4, 120, 0);
		this.createGUI;
	}
	
	createGUI {
		win = Window.new("Metronome", Rect(100, 100, 400, 120)).front;
		win.onClose_({metronome.stop});
		
		bStart = Button(win, Rect(150, 20, 100, 20))
			.states_([
				["Start", Color.black, Color.gray],
				["Stop", Color.black, Color.red]
			])
			.action_({
				arg butt;

				// n.b. value has already changed by the time action is called.
				if(butt.value == 1, {
					metronome.play;
				},
				{
					metronome.stop;
				});
			});
	
		bClose = Button(win, Rect(150, 40, 100, 20))
			.states_([
				["Close", Color.black, Color.gray]
			])
			.action_({
				win.close;
			});
	
		tempoDisplay = StaticText(win, Rect(100, 60, 200, 20));
		tempoDisplay.align = \center;
		tempoDisplay.string = "Tempo: " + metronome.bpm + " bpm";
	
		tempoSpec = ControlSpec(10, 300, \lin, 1, metronome.bpm, "bpm");
	
		tempoSlider = Slider(win, Rect(50, 80, 300, 20))
			.action_({
				arg slider;
				metronome.bpm = tempoSpec.map(slider.value);
			});
		tempoSlider.value = tempoSpec.unmap(120);
	
		timeSigDisplay = StaticText(win, Rect(100, 100, 200, 20));
		timeSigDisplay.align = \center;
	}
}