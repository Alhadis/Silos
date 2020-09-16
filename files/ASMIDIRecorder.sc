// ASMIDIRecorder.sc
// It is a class for recording and playing back a MIDI performance session.
//
// Example Usage:
// m = ASMIDIRecorder.new;
// m.startRecording;
// m.stopRecording;
// m.writeEventsToFile("your file");
// m.loadMIDIEvents("your file");
// m.playBackMIDIEvents(speed: 1);
// m.pausePlayBack;
// m.resumePlayBack;
// m.stopPlayBack;
// m.dispose;
// 
// var name = "ahmet", surname = "kizilay";
// var email = name + "." + surname + "@" + "gmail.com"

ASMIDIRecorder {
	var <listOfEvents, tempoClock, <isRecording = false, <isPlaying = false, playBackTask, midiOut;
	
	*new {
		^super.new.pr_init;
	}
	
	pr_init {
		listOfEvents = List.new(2);
	}

	addMIDIEvent {
		arg identifier, src, chan, num, val;
		this.addEvent([identifier, src, chan, num, val]);
	}

	addEvent {
		arg anything;
		(isRecording == true).if({
			anything.add(tempoClock.beats);
			listOfEvents.add(anything);
		}, {
			^"not recording yet";
		});
	}

	startRecording {
		isRecording = true;
		tempoClock = TempoClock.new(1);
	}

	stopRecording {
		isRecording = false;
		tempoClock.stop;
	}

	dispose {
		tempoClock.stop;
		listOfEvents.extList_RemoveAll;
	}
	
	writeEventsToFile {
		arg filePath;
		var file, systemTime;
		file = File(filePath, "w");
		systemTime = "date".unixCmdGetStdOut;
		file.write("# Saved On:" + systemTime + "\n");
		listOfEvents.do {
			arg val, num;
			val.do {
				arg val2, num2;
				file.write(val2.asString);
				(num2 != (val.size - 1)).if({file.write( ", ");}, {file.write("\n");});
			};
		};
		file.close;
		("written to" + filePath);
	}

	playBackMIDIEvents {
		arg midiOutSlot = 2, speed = 1;

		(isPlaying == true).if({^"already playing. Try resumePlayBack"});

		tempoClock.stop;
		tempoClock = TempoClock.new(speed);

		MIDIClient.init;
		midiOut = MIDIOut(0);
		midiOut.connect(midiOutSlot);

		playBackTask = Task.new({
			listOfEvents.do {
				arg val, num;

				(val[0] == "noteOn").if({ midiOut.noteOn(val[2], val[3], val[4]); });
				(val[0] == "noteOff").if({ midiOut.noteOff(val[2], val[3], val[4]); });

				(num != (listOfEvents.size - 1)).if({
					(listOfEvents[num + 1][5].asFloat - val[5].asFloat).wait;				
				});
			};
			isPlaying = false;
		}, tempoClock);

		isPlaying = true;
		playBackTask.play;
	}

	pausePlayBack {
		playBackTask.pause;
	}

	resumePlayBack {
		playBackTask.play(doReset: false);
	}

	stopPlayBack {
		isPlaying = false;
		playBackTask.stop;
		midiOut.stop;
	}

	loadMIDIEvents {
		arg filePath;
		var file, rawMIDIArray;
		
		file = File.new(filePath, "r");
		(listOfEvents == nil).if({listOfEvents = List.new(10);}, {listOfEvents.extList_RemoveAll;});

		file.readAllString.split(Char.nl).do {
			arg val, num;
			(val.size > 0 && val.at(0).class === Char && {val.at(0).isAlphaNum}).if({
				listOfEvents.add(val.replace(" ", "").split($,));
			});
		};
	}
}