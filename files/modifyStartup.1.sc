+ OSXPlatform {
	startupFiles {
//		var filename = "startup.rtf";
//		^[this.systemAppSupportDir +/+ filename, this.userAppSupportDir +/+ filename];
			// look for startup files inside the app Contents directory
		var filename = "startup.*";
		^(String.scDir +/+ filename).pathMatch;
	}

	startup {
		Document.implementationClass.startup;
		// make a server window for the internal if you like
		//Server.internal.makeWindow;
//		Server.local.makeWindow;
		// uncomment if you use a startup file
//		this.loadStartupFiles;
		// uncomment if you have multiple help files
//		Help.addToMenu;
	}
}

+ Main {
	startup {
		platform = this.platformClass.new;
		platform.initPlatform;

		super.startup;

		GUI.fromID( this.platform.defaultGUIScheme );
		GeneralHID.fromID( this.platform.defaultHIDScheme );
		
		//("python "++String.scDir.dirname++"/readstats.py &").unixCmd;

		// Set Server.default and the 's' interpreter variable to the internal server.
		// You should use the internal server for standalone applications --
		// otherwise, if your application has a problem, the user will
		// be stuck with a process, possibly making sound, that he won't know
		// how to kill.
		Server.default = Server.internal;
		interpreter.s = Server.default;

			// some folder paths that should point inside the app's Contents folder
		SynthDef.synthDefDir = String.scDir +/+ "synthdefs/";
		Archive.archiveDir = String.scDir;

		this.platform.startup;

		// from here on, you should customize what should happen...

		StartUp.run;

		// One can boot the server, then use .load to evaluate a file
		// OR - put things into a class... like the SCSA_Demo

		"Welcome to Standalone Demo made with SuperCollider, type cmd-d for help.".postln;

		Server.default.boot;

		Server.default.waitForBoot({
			
			var aSynth, bSynth;
			var windo, label1, label2, netslider, cpuslider;
			var rout;
			var netres, cpures;
			var oldinpack, oldoutpack, inpack, outpack, changeinpack, changeoutpack;
			var usercpu, systcpu;
			
			SynthDef("networkSound", { arg inpack = 0, outpack = 0, mul = 0.12;
				var outArray;
				outArray = [
						Ringz.ar(Dust.ar(inpack*0.6, mul), 1600, 2),
						Ringz.ar(Dust.ar(outpack*0.6, mul), 2100, 2)
					];
				Out.ar(0, outArray)
			}, [0.15, 0.15]).load(Server.default);
			
			SynthDef("cpuSound", { arg cpuuser = 0, cpusys = 0, mul = 0.4;
				var outArray;
				outArray = [
					LPF.ar(
						Gendy3.ar(1,2,0.3,-0.7,75,0.03,0.1),
						(cpusys*30)+40,
						(cpusys / 200 )* mul
					),
					LPF.ar(
						Gendy3.ar(1,2,0.3,-0.7,150,0.03,0.1),
						(cpuuser*30)+40,
						(cpuuser / 200 )* mul
					),
				];
				Out.ar(0, outArray)
			}, [0.15,0.15]).load(Server.default);
			
			aSynth = Synth("networkSound", [\inpack, 30, \outpack, 30, \mul, 0.12]);
			bSynth = Synth("cpuSound", [\cpuuser, 40, \cpusys, 20, \mul, 0.4]);
			
			windo = Window("Volume controls for Network Activity Chimes", Rect(100, 500, 400, 140));
			
			label1 = StaticText (windo, Rect(40, 0, 300, 30));
			label1.string = "Network Chimes Volume";
			
			netslider = Slider (windo, Rect(40, 25, 300, 30));
			netslider.value = 0.12;
			netslider.action={ |sl| aSynth.set(\mul, sl.value) }; // set the action of the slider
			
			label2 = StaticText (windo, Rect(40, 60, 300, 30));
			label2.string = "CPU Buzz Volume";
			
			cpuslider = Slider (windo, Rect(40, 85, 300, 30));
			cpuslider.value = 0.4;
			cpuslider.action={ |sl| bSynth.set(\mul, sl.value) }; // set the action of the slider
			
			netres = "/usr/sbin/netstat -I en1".unixCmdGetStdOut.findRegexp("([^\\s]+)\\s+");
			oldinpack = netres.at(27).at(1).asFloat;
		     oldoutpack = netres.at(31).at(1).asFloat;
			
			rout = Routine({
			
				9999999999.do({  // about 3.17 years
					
					netres = "/usr/sbin/netstat -I en1".unixCmdGetStdOut.findRegexp("([^\\s]+)\\s+");
					//netres.at(27).at(1).postln;
					//netres.at(31).at(1).postln;
					inpack = netres.at(27).at(1).asFloat;
					outpack = netres.at(31).at(1).asFloat;
					//inpack = 5;
					//outpack = 5;
					changeinpack = inpack-oldinpack;
					changeoutpack = outpack-oldoutpack;
					oldoutpack = outpack;
					oldinpack = inpack;
					
					cpures = "top -l 1 -n 0 -s 0".unixCmdGetStdOut.split($\n).at(3).findRegexp("[\\d]+\\.[\\d]+");
					//~cpures.at(0).at(1).postln;
					//~cpures.at(1).at(1).postln;
					usercpu = cpures.at(0).at(1).asFloat;
					systcpu = cpures.at(1).at(1).asFloat;
					//usercpu = 33;
					//systcpu = 22;
					
					aSynth.set(\inpack, changeinpack, \outpack, changeoutpack);
					bSynth.set(\cpuuser, usercpu, \cpusys, systcpu);
					
					0.1.wait; 				// pause for .1 second
				})
				
			}).play(AppClock);
		
			windo.front;
			
		});
		
		// close post window if user should not have it
		//Document.listener.close;
	}

}
