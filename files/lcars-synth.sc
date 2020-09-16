s = Server.local;

"SC_JACK_DEFAULT_OUTPUTS".setenv("system:playback_1,system:playback_2");

MIDIClient.init;

MIDIIn.connect(0, MIDIClient.sources.at(2).uid);
MIDIIn.connect(0, MIDIClient.sources.at(3).uid);


s.waitForBoot({

var notes, on, off, switchOscillator, createOscillator, setOscillatorVolume, setOscillatorOffset, setOscillatorFineTune, oscillatorTypes, oscillatorVolumes, oscillatorOffset, oscillatorFineTune;

var oscFineTuneKnobs, oscTypeButtons, oscVolumeSliders, oscVolumeValues, oscFineTuneValues;

	w = Window("Test Window").front;

	oscTypeButtons = Array.newClear(4);
	oscVolumeSliders = Array.newClear(4);
	oscVolumeValues = Array.newClear(4);
	oscFineTuneKnobs = Array.newClear(4);
	oscFineTuneValues = Array.newClear(4);
//	k = Knob.new(w, Rect(10, 30, 48, 48));
//	t = StaticText(w, Rect(10,10, 48,12));
//	t.string = "FOO";

	oscTypeButtons[0] = Button(w, Rect(10,10,60,20)).states_([
					["Sine", Color.black, Color.red],
					["Saw", Color.white, Color.black],
					["Pulse", Color.red, Color.white],
					["Tri", Color.blue, Color.clear]
				]).action_({ arg butt;
					oscillatorTypes[0] = butt.value;
					switchOscillator.value(0, oscillatorTypes[0]);
				});

	oscTypeButtons[1] = Button(w, Rect(80,10,60,20)).states_([
					["Sine", Color.black, Color.red],
					["Saw", Color.white, Color.black],
					["Pulse", Color.red, Color.white],
					["Tri", Color.blue, Color.clear]
				]).action_({ arg butt;
					oscillatorTypes[1] = butt.value;
					switchOscillator.value(1, oscillatorTypes[1]);
				});


	oscTypeButtons[2] = Button(w, Rect(150,10,60,20)).states_([
					["Sine", Color.black, Color.red],
					["Saw", Color.white, Color.black],
					["Pulse", Color.red, Color.white],
					["Tri", Color.blue, Color.clear]
				]).action_({ arg butt;
					oscillatorTypes[2] = butt.value;
					switchOscillator.value(2, oscillatorTypes[2]);
				});


	oscTypeButtons[3] = Button(w, Rect(220,10,60,20)).states_([
					["Sine", Color.black, Color.red],
					["Saw", Color.white, Color.black],
					["Pulse", Color.red, Color.white],
					["Tri", Color.blue, Color.clear]
				]).action_({ arg butt;
					oscillatorTypes[3] = butt.value;
					switchOscillator.value(3, oscillatorTypes[3]);
				});

	oscVolumeSliders[0] = Slider(w, Rect(35,35,20,100));
	oscVolumeSliders[0].action = { setOscillatorVolume.value(0, oscVolumeSliders[0].value); };

	oscVolumeSliders[1] = Slider(w, Rect(105,35,20,100));
	oscVolumeSliders[1].action = { setOscillatorVolume.value(1, oscVolumeSliders[1].value); };

	oscVolumeSliders[2] = Slider(w, Rect(175,35,20,100));
	oscVolumeSliders[2].action = { setOscillatorVolume.value(2, oscVolumeSliders[2].value); };

	oscVolumeSliders[3] = Slider(w, Rect(245,35,20,100));
	oscVolumeSliders[3].action = { setOscillatorVolume.value(3, oscVolumeSliders[3].value); };

	oscVolumeValues[0] = StaticText(w, Rect(10, 140, 60, 14));
	oscVolumeValues[1] = StaticText(w, Rect(80, 140, 60, 14));
	oscVolumeValues[2] = StaticText(w, Rect(150, 140, 60, 14));
	oscVolumeValues[3] = StaticText(w, Rect(220, 140, 60, 14));

	oscFineTuneKnobs[0] = Knob(w, Rect(10, 160, 60, 60));
	oscFineTuneKnobs[0].action = { setOscillatorFineTune.value(0, (oscFineTuneKnobs[0].value*2)-1); };

	oscFineTuneKnobs[1] = Knob(w, Rect(80, 160, 60, 60));
	oscFineTuneKnobs[1].action = { setOscillatorFineTune.value(1, (oscFineTuneKnobs[1].value*2)-1); };

	oscFineTuneKnobs[2] = Knob(w, Rect(150, 160, 60, 60));
	oscFineTuneKnobs[2].action = { setOscillatorFineTune.value(2, (oscFineTuneKnobs[2].value*2)-1); };

	oscFineTuneKnobs[3] = Knob(w, Rect(220, 160, 60, 60));
	oscFineTuneKnobs[3].action = { setOscillatorFineTune.value(3, (oscFineTuneKnobs[3].value*2)-1); };

	oscFineTuneValues[0] = StaticText(w, Rect(10, 230, 60, 14));
	oscFineTuneValues[1] = StaticText(w, Rect(80, 230, 60, 14));
	oscFineTuneValues[2] = StaticText(w, Rect(150, 230, 60, 14));
	oscFineTuneValues[3] = StaticText(w, Rect(220, 230, 60, 14));

	

	SynthDef("osc-sine", {
		arg freq = 440, amp = 1, offset = 0, fineTune = 0;
		Out.ar([0,1], SinOsc.ar(freq * ( 1 + (fineTune * 0.029302236643492)), offset*2pi) * amp);
		
	}).send();

	SynthDef("osc-saw", {
		arg freq = 440, amp = 1, offset = 0, fineTune = 0;
		Out.ar([0,1], LFSaw.ar(freq * ( 1 + (fineTune * 0.029302236643492)), offset*2) * amp);
		
	}).send();

	SynthDef("osc-pulse", {
		arg freq = 440, amp = 1, offset = 0, fineTune = 0;
		Out.ar([0,1], LFPulse.ar(freq * ( 1 + (fineTune * 0.029302236643492)), offset) * amp);
	}).send();

	SynthDef("osc-tri", {
		arg freq = 440, amp = 1, offset = 0, fineTune = 0;
		Out.ar([0,1], LFTri.ar(freq ** ( 1 + (fineTune * 0.029302236643492)), offset * 4) * amp);
	}).send();


notes = Array.newClear(128);  // array has one slot per possible MIDI note

notes.do({
	arg item, i;

	notes[i] = Array.newClear(4);
});

oscillatorVolumes = Array.newClear(4);
oscillatorVolumes = [1,0,0,0];
oscillatorTypes = Array.newClear(4);
oscillatorTypes = [0,0,0,0];
oscillatorOffset = Array.newClear(4);
oscillatorOffset = [0,0,0,0];
oscillatorFineTune = Array.newClear(4);
oscillatorFineTune = [0,0,0,0];



switchOscillator = {
	arg num, oscillator;

	notes.do({
		arg item, i;

		if (item[num] != nil, {
			item[num].free();
			notes[i][num] = createOscillator.value(num, oscillator, i.midicps);
		});
	});

	oscTypeButtons[num].value_(oscillator);

};

setOscillatorVolume = {
	arg num, volume;

	oscillatorVolumes[num] = volume;

	notes.do({
		arg item, i;

		if (item[num] != nil, {
			item[num].set(\amp, volume);
		});
	});
	
	oscVolumeSliders[num].value_(volume);
	oscVolumeValues[num].string = volume;

	postln(["set oscillator ",num," volume to ", volume]);
};

setOscillatorOffset = {
	arg num, offset;

	oscillatorOffset[num] = offset;

	notes.do({
		arg item, i;

		if (item[num] != nil, {
			item[num].set(\offset, offset);
		});
	});
	
	postln(["set oscillator ",num," offset to ", offset]);
};

setOscillatorFineTune = {
	arg num, fineTune;

	oscillatorFineTune[num] = fineTune;

	notes.do({
		arg item, i;

		if (item[num] != nil, {
			item[num].set(\fineTune, fineTune);
		});
	});
	
	oscFineTuneKnobs[num].value_((fineTune+1)/2);
	oscFineTuneValues[num].string = fineTune;

	postln(["set oscillator ",num," fineTune to ", fineTune]);
};



createOscillator = {
	arg num, oscillator, freq;
	var newNode, out;

	switch (oscillator,
		0, { postln("Oscillator is now sine"); newNode = Synth("osc-sine", [\freq, freq, \amp, oscillatorVolumes[num], \offset, oscillatorOffset[num], \fineTune, oscillatorFineTune[num]]); },
		1, { postln("Oscillator is now saw"); newNode = Synth("osc-saw", [\freq, freq, \amp, oscillatorVolumes[num], \offset, oscillatorOffset[num], \fineTune, oscillatorFineTune[num]]); },
		2, { postln("Oscillator is now pulse"); newNode = Synth("osc-pulse", [\freq, freq, \amp, oscillatorVolumes[num], \offset, oscillatorOffset[num], \fineTune, oscillatorFineTune[num]]); },
		3, { postln("Oscillator is now tri"); newNode = Synth("osc-tri", [\freq, freq, \amp, oscillatorVolumes[num], \offset, oscillatorOffset[num], \fineTune, oscillatorFineTune[num]]); }
	);

};

on = Routine({
	var event, newNode, foo;
	loop {
		event = MIDIIn.waitNoteOn;	// all note-on events
			// play the note

		newNode = [
				createOscillator.value(0, oscillatorTypes[0], event.b.midicps),
				createOscillator.value(1, oscillatorTypes[1], event.b.midicps),
				createOscillator.value(2, oscillatorTypes[2], event.b.midicps),
				createOscillator.value(3, oscillatorTypes[3], event.b.midicps)
			];
				
		notes.put(event.b, newNode);	// save it to free later
	}
}).play;

off = Routine({
	var event;
	loop {
		event = MIDIIn.waitNoteOff;
			// look up the node currently playing on this slot, and release it
		notes[event.b][0].free(); notes[event.b][0] = nil;
		notes[event.b][1].free(); notes[event.b][1] = nil;
		notes[event.b][2].free(); notes[event.b][2] = nil;
		notes[event.b][3].free(); notes[event.b][3] = nil;

//		delete(notes[event.b]);
//		notes[event.b] = nil;
//		notes[event.b].remove();
	}
}).play;

q = { on.stop; off.stop; };


MIDIIn.control = {
	arg src, chan, num, val, oscSwitch, maxOsc = 3;

	oscSwitch = Array.newClear(4);

	/* Switch oscillator 1 */

	if (chan == 9 && val == 127, { 
		oscSwitch[0] = false;
		oscSwitch[1] = false;
		oscSwitch[2] = false;
		oscSwitch[3] = false;

		if (num == 13, {oscillatorTypes[0] = oscillatorTypes[0] + 1; oscSwitch[0] = true;});
		if (num == 14, {oscillatorTypes[0] = oscillatorTypes[0] - 1; oscSwitch[0] = true;});


		if (num == 23, {oscillatorTypes[1] = oscillatorTypes[1] + 1; oscSwitch[1] = true;});
		if (num == 24, {oscillatorTypes[1] = oscillatorTypes[1] - 1; oscSwitch[1] = true;});


		if (num == 33, {oscillatorTypes[2] = oscillatorTypes[2] + 1; oscSwitch[2] = true;});
		if (num == 34, {oscillatorTypes[2] = oscillatorTypes[2] - 1; oscSwitch[2] = true;});


		if (num == 43, {oscillatorTypes[3] = oscillatorTypes[3] + 1; oscSwitch[3] = true;});
		if (num == 44, {oscillatorTypes[3] = oscillatorTypes[3] - 1; oscSwitch[3] = true;});

		if (oscillatorTypes[0] > maxOsc, {oscillatorTypes[0] = maxOsc;});
		if (oscillatorTypes[0] < 0, {oscillatorTypes[0] = 0;});

		if (oscillatorTypes[1] > maxOsc, {oscillatorTypes[1] = maxOsc;});
		if (oscillatorTypes[1] < 0, {oscillatorTypes[1] = 0;});

		if (oscillatorTypes[2] > maxOsc, {oscillatorTypes[2] = maxOsc;});
		if (oscillatorTypes[2] < 0, {oscillatorTypes[2] = 0;});

		if (oscillatorTypes[3] > maxOsc, {oscillatorTypes[3] = maxOsc;});
		if (oscillatorTypes[3] < 0, {oscillatorTypes[3] = 0;});

		if (oscSwitch[0] == true, { switchOscillator.value(0, oscillatorTypes[0])});
		if (oscSwitch[1] == true, { switchOscillator.value(1, oscillatorTypes[1])});
		if (oscSwitch[2] == true, { switchOscillator.value(2, oscillatorTypes[2])});
		if (oscSwitch[3] == true, { switchOscillator.value(3, oscillatorTypes[3])});
	});


	/* Set Oscillator Volume */
	if (chan == 9 && num == 12, {
		setOscillatorVolume.value(0, (1/127)*val);
	});

	if (chan == 9 && num == 22, {
		setOscillatorVolume.value(1, (1/127)*val);
	});

	if (chan == 9 && num == 32, {
		setOscillatorVolume.value(2, (1/127)*val);
	});

	if (chan == 9 && num == 42, {
		setOscillatorVolume.value(3, (1/127)*val);
	});

	/* Set Oscillator Offset */
	if (chan == 9 && num == 11, {
		setOscillatorOffset.value(0, (1/127)*val);
	});

	if (chan == 9 && num == 21, {
		setOscillatorOffset.value(1, (1/127)*val);
	});

	if (chan == 9 && num == 31, {
		setOscillatorOffset.value(2, (1/127)*val);
	});

	if (chan == 9 && num == 41, {
		setOscillatorOffset.value(3, (1/127)*val);
	});

	/* Set Oscillator Fine Tune */
	if (chan == 9 && num == 51, {
		setOscillatorFineTune.value(0, (val / 64) - 1);
	});

	if (chan == 9 && num == 61, {
		setOscillatorFineTune.value(1, (val / 64) - 1);
	});

	if (chan == 9 && num == 71, {
		setOscillatorFineTune.value(2, (val / 64) - 1);
	});

	if (chan == 9 && num == 81, {
		setOscillatorFineTune.value(3, (val / 64) - 1);
	});


	[chan,num,val].postln; 
};



MIDIIn.noteOff = { arg src, chan, num, vel; 	[chan,num,vel / 127].postln; };
MIDIIn.noteOn = { arg src, chan, num, vel; 	[chan,num,vel / 127].postln; };


});


// EOF
