/*
 * Copyright (C) 2009, Miguel Negrão <miguel.negrao _at_ friendlyvirus _dot_ org>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */
 
 // 16-05-2009 
 // initial release
 
 
 /*
	Modified by Peter Vasil, 2009, 2010, 2011 
 */
 
ToolsMenu {
	
	*add { |foldersToScan, foldersToShow|
		var tools  = SCMenuGroup.new(nil, "ptrv",9),midi, audio, files, guikit, soundcard, serverdefault, layout;
		SCMenuItem.new(tools,  "Open startup.rtf").action_({ 
			Document.open(PathName(Platform.userExtensionDir).pathOnly++"startup.rtf")
			});
		SCMenuSeparator.new(tools);
		SCMenuItem.new(tools,  "Quarks.gui").action_({ Quarks.gui});
		SCMenuItem.new(tools,  "Quarks.checkoutAll").action_({ Quarks.checkoutAll});
		SCMenuSeparator.new(tools);
		SCMenuItem.new(tools, "Post incoming OSC traffic").action_({
			(
			thisProcess.recvOSCfunc = { |time, addr, msg| 
				if(msg[0] != '/status.reply') {
					"time: % sender: %\nmessage: %\n".postf(time, addr, msg); 
				}  
			}
			);
		});
		SCMenuItem.new(tools, "Stop posting OSC traffic").action_({
			thisProcess.recvOSCfunc = nil;
		});
		SCMenuSeparator.new(tools);
		SCMenuItem.new(tools, "Recording Manager").action_({
			RecordingManager.new(compressionType: "mp3");
		});
		SCMenuItem.new(tools, "Open Recordings").action_({
			("open" + thisProcess.platform.recordingsDir.quote).unixCmd;
		});
		SCMenuItem.new(tools, "Open Extensions").setShortCut("e", true, true).action_({
			("open" + (Platform.userAppSupportDir++"/Extensions").quote).unixCmd;
		});
//		SCMenuSeparator.new(tools);
		
		SCMenuSeparator.new(tools);
		SCMenuItem.new(tools, "Init GamePad").action_({
				var deviceID, spec = "AnalogRumblePad";
				GeneralHID.buildDeviceList;
				deviceID = GeneralHID.findBy( 3888, 272, -98369536, 257 );
				~gamepad = GeneralHID.open( deviceID );
				postf("\n\t***\tInitialized % Gamepad Environment >>>gamepad<<<\nuse ~gamepad to access the instance\n", spec);
				GeneralHID.startEventLoop;
				postf("\n>>>Event loop runing: ___%___\n", GeneralHID.eventLoopIsRunning.asString);
				~gamepad.setSpec(spec);
				postf("Spec map set to: %\nFollowing pseudomethods acces the states and actions:\n", spec);
				~gamepad.spec.map.keys.asList.sort.do{ |key|
					postf("~gamepad['%']\n", key);
				};
				~gamepad.debug_(true);
				
				//postf("\n>>>Event loop runing: ___%___\n", GeneralHID.eventLoopIsRunning.asString);
			});
			SCMenuItem.new(tools, "Close GamePad").action_({
				GeneralHID.stopEventLoop;
				postf("\n>>>Event loop running: ___%___\n", GeneralHID.eventLoopIsRunning.asString);
				~gamepad.close;
			});
/*			SCMenuItem.new(tools, "Announce OSC").action_({
				"open -a AnnounceOSC.app".unixCmd;
				"If you don't have AnnounceOSC.app you have to download it from:".postln;
				"http://cloud.github.com/downloads/cappelnord/AnnounceOSC/AnnounceOSCMacApp.zip".postln;
				"and put it in your applications folder".postln;
				"";
			});
*/
		//SCMenuSeparator.new(tools);
		SCMenuSeparator.new(tools);
		serverdefault = SCMenuGroup.new(tools, "Default Server");
		SCMenuItem.new(serverdefault, "--> localhost").action_({
			Server.default = Server.local;
			"Default server --> local".postln
		});
		SCMenuItem.new(serverdefault, "--> internal").action_({
			Server.default = Server.internal;
			"Default server --> internal".postln
		});
		soundcard = SCMenuGroup.new(tools, "Soundcard");
		SCMenuItem.new(soundcard, "--> JackRouter").action_({
			Server.local.options.device = "JackRouter";
			Server.internal.options.device = "JackRouter";
			"Selected soundcard: --> JackRouter".postln;
		});
		SCMenuItem.new(soundcard, "--> FireWire 410 Multichannel").action_({
			Server.local.options.device = "FireWire 410 Multichannel";
			Server.internal.options.device = "FireWire 410 Multichannel";
			"Selected soundcard: --> FireWire 410 Multichannel".postln;
		});
		SCMenuItem.new(soundcard, "--> Soundflower (2ch)").action_({
			Server.local.options.device = "Soundflower (2ch)";
			Server.internal.options.device = "Soundflower (2ch)";
			"Selected soundcard: --> Soundflower (2ch)".postln;
		});
		SCMenuItem.new(soundcard, "--> Soundflower (16ch)").action_({
			Server.local.options.device = "Soundflower (16ch)";
			Server.internal.options.device = "Soundflower (16ch)";
			"Selected soundcard: --> Soundflower (16ch)".postln;
		});
		SCMenuItem.new(soundcard, "--> mic+out").action_({
			Server.local.options.device = "mic+out";
			Server.internal.options.device = "mic+out";
			"Selected soundcard: --> mic+out".postln;
		});
		SCMenuItem.new(soundcard, "--> line+out").action_({
			Server.local.options.device = "line+out";
			Server.internal.options.device = "line+out";
			"Selected soundcard: --> line+out".postln;
		});
		
		//audio
		audio = SCMenuGroup.new(tools,  "Audio");
		SCMenuItem.new(audio,  "EQ").action_({MasterEQ.new});
		SCMenuItem.new(audio,  "Rec").action_({ServerRecordWindow(Server.default)});
		SCMenuItem.new(audio,  "Sound Card Options").action_({Server.deviceGuis});
		//SCMenuItem.new(audio,  "Init Binaural Buffers").action_({BinAmbi2O.init});
		//midi
		midi = SCMenuGroup.new(tools,  "Midi");
		SCMenuItem.new(midi,"Init").action_({
			MIDIClient.init;
			"Connected to:".postln;
			MIDIIn.connect( MIDIClient.sources.at(1).postln);

		});
		SCMenuItem.new(midi, "Check incoming values").action_({
		MIDIIn.control = {arg src, chan, num, val;
				[num,val].postln;
				};
		});
		SCMenuItem.new(midi,"Stop checking incoming values").action_({
			MIDIIn.control = {}
		});
	
		SCMenuItem(tools, "Sound Tester").action_({
			SoundTester.new;
		});
		SCMenuSeparator.new(tools);
		
		layout = SCMenuGroup.new(tools, "Layout");
		SCMenuItem(layout, "Layout > STD")
		.action_({
		Document.listener
			.title_("post")
			.bounds_(Rect(5,Window.screenBounds.height - 530,500,500))
			.font_(Font("Inconsolata", 13))
			.background_(Color.new255(20, 28, 58, 240))
			.stringColor_(Color.new255(231, 218, 30, 200));
			//.alwaysOnTop_(true);
			Document.postColor_(Document.listener.stringColor);
		});
		SCMenuItem(layout, "Layout > STD2")
		.action_({
		Document.listener
			.title_("post")
			.bounds_(
				(Window.screenBounds.width-400 @ 0) @
				(Window.screenBounds.width @ Window.screenBounds.height)
			)
			.font_(Font("Helvetica", 11))
			.background_(Color.new255(20, 28, 58, 240))
			.stringColor_(Color.new255(231, 218, 30, 200));
			//.alwaysOnTop_(true);
			Document.postColor_(Document.listener.stringColor);
		});
		SCMenuItem(layout, "Layout > EDU")
		.action_({
		Document.listener
			.title_("post")
			.bounds_((0@20)@(Window.screenBounds.width@250))
			.font_(Font("Inconsolata", 22))
			.background_(Color.new(0,0,0.4,1))
			.stringColor_(Color.white)
			.alwaysOnTop_(true);
			Document.postColor_(Color.white);
		});

		SCMenuItem(layout, "Layout > DEV")
		.action_({
			Document.listener
				.title_("console")
				.bounds_(
					(Window.screenBounds.width-400 @ 0) @
					(Window.screenBounds.width @ Window.screenBounds.height)
				)
				.font_(Font("Inconsolata", 14))
				.background_(Color.new(0,0,0,0.96))
				.stringColor_(Color.green)
				.alwaysOnTop_(false);
			Document.postColor_(Color.green);
		});

		
		SCMenuSeparator.new(tools);
		guikit = SCMenuGroup.new(tools, "GUI Kit");
		SCMenuItem.new(guikit, "--> Cocoa").action_({ 
			GUI.cocoa;
			GUI.current.postln;
			});
		if('SwingOSC'.asClass.notNil) {
			SCMenuItem.new(guikit, "--> Swing").action_({
				GUI.swing;
				if(SwingOSC.default.serverRunning.not){
					SwingOSC.default.boot;
				};
				GUI.current.postln;
			});
		};		
		SCMenuSeparator.new(tools);
		//lang
/*		SCMenuItem.new(tools,  "Auto Sintax Colorizing").setShortCut("0").action_({
		Document.current.keyDownAction_{|doc, char, mod, unicode, keycode|
	  		  if(unicode==13 or:(unicode==32) or: (unicode==3)){
	     		   Document.current.syntaxColorize
	   		 }
			}; 
			
		});*/
		SCMenuItem.new(tools, "Auto Completion").action_({
			Document.current.autoComplete
			});
		SCMenuItem.new(tools, "Count lines").action_({
			"Lines: ".post;
			(Document.current.string.occurrencesOf($\n) + 1).postln;
		});
		SCMenuItem.new(tools, "Count characters").action_({
			"Characters: ".post;
			Document.current.string.size.postln;
		});
		SCMenuSeparator.new(tools);
		SCMenuItem.new(tools, "Freq Analyzer").setShortCut("0", false, false).action_({
			Server.default.freqscope;
		});
/*		SCMenuItem.new(tools, "List Nodes").action_({
			"".postln;
			Server.default.name.postln;
			Server.default.queryAllNodes});
*/		SCMenuItem.new(tools, "List Buffers").action_({
			"".postln;
		Server.default.cachedBuffersDo { arg buf; [buf.bufnum, buf.path].postln}
		});
				
		SCMenuSeparator.new(tools);
		SCMenuItem.new(tools, "Start History").action_({
			History.clear.end;
			History.start;
		});
		SCMenuItem.new(tools, "Stop History").action_({
			History.end;
			History.document;
		});
		SCMenuSeparator.new(tools);
		SCMenuItem.new(tools, "SynthDescLib read+browse").action_({ 
			SynthDescLib.read.global.browse;
			});
		SCMenuItem.new(tools, "Random helpfile").action_({ 
			Document.open(PathName("Help").deepFiles.choose.fullPath)
			});
		SCMenuItem.new(tools, "Rebuild help tree").action_({
			Help.rebuildTree;
		});
		SCMenuSeparator.new(tools);
/*		SCMenuItem.new(tools, "REBOOT!").action_({
			Server.default.reboot;
		}).setShortCut("k", false, true); // CMD+SHIFT+r;
*/		SCMenuItem.new(tools, "ixiQuarks").action_({ XiiQuarks.new});
		SCMenuItem.new(tools, "ColorPicker").action_({ColorPicker()});
		SCMenuItem.new(tools, "Server window to front").setShortCut( "#" ).action_({
			Server.default.window.front;
		});
		//SCMenuItem( SCMenuGroup( tools, "Scripts" ), "Run" ).setShortCut( "r" ).action_({ thisProcess.run });

		//SCMenuSeparator.new(tools);
		//Files
		//files = SCMenuGroup.new(tools,  "Files");

//		files = SCMenuGroup.new(nil,  "Files");
//				if(foldersToScan.notNil){
//					foldersToScan = foldersToScan.collect{ |path| PathName(path) };
//					foldersToScan.do{ |path|
//						this.filesMenu(files,path.name,path);
//					}
//				};
				
		if(foldersToShow.notNil){
			foldersToShow = foldersToShow.collect{ |path| PathName(path) };
			foldersToShow.do { |path|
				//this.filesMenu(nil,path.name,path);
				var fm = SCMenuGroup.new(nil,path.name);
				path.files.do { |path2|
					this.filesMenu(fm,path2.name,path2);
				};
				path.folders.do { |path2|
					this.filesMenu(fm,path2.name,path2);
				};				
			};
		};
		
/*		SCMenuItem.new(tools, "Reload ToolsMenu").action_({
			this.refresh(foldersToScan, foldersToShow, files);
		});
*/	
	}
	
	*filesMenu { arg rootMenu,name, thepath;
//		var temppath;
//		var menuGroup;
		if(thepath.isFolder )
		{ //it's a folder 
			if(thepath.folderName.extension == "rtfd")
			{ var temppath = thepath.fullPath;
				//temppath = thepath.fullPath;
				temppath.pop;
				SCMenuItem.new(rootMenu,thepath.folderName).action_({Document.open(temppath) })
			}
			{
				var menuGroup = SCMenuGroup.new(rootMenu, name);
				//menuGroup = SCMenuGroup.new(rootMenu, name);
				thepath.files.do{ |path|
					SCMenuItem.new(menuGroup,  path.fileName).action_({
						if((path.extension == "rtf") ||
							(path.extension == "sc") ||
							(path.extension == "scd") ||
							(path.extension == "html")) {
							Document.open(path.fullPath);
						}
						{
							("open " ++ "'" ++ path.fullPath ++ "'"	 ++ "").unixCmd;
						}
					});
				};
				thepath.folders.do{ |path|
					this.filesMenu(menuGroup,path.folderName,path)
				};
			}
		}		
		{ SCMenuItem.new(rootMenu,thepath.fileName).action_({Document.open(thepath.fullPath) }) }
		
	}
	
/*	*refresh { arg foldersToScan, foldersToShow, files;
		if(foldersToScan.notNil){
			foldersToScan = foldersToScan.collect{ |path| PathName(path) };
			foldersToScan.do{ |path|
				this.filesMenu(files,path.name,path);
			}
		};
		
		if(foldersToShow.notNil){
			foldersToShow = foldersToShow.collect{ |path| PathName(path) };
			foldersToShow.do { |path|
				//this.filesMenu(nil,path.name,path);
				var fm = SCMenuGroup.new(nil,path.name);
				path.files.do { |path2|
					this.filesMenu(fm,path2.name,path2);
				};
				path.folders.do { |path2|
					this.filesMenu(fm,path2.name,path2);
				};				
			};
		};
	}
*/	
}

+ PathName {
	
	name{
	if(this.isFolder){^this.folderName };
	if(this.isFile){ ^this.fileName };
	}
	
}


// change the path to point to a file you want to run with cmd^run
//+ Main {
//		run { "/Users/peter/Library/Application Support/SuperCollider/startup.rtf".load }
//}



//// change the path to point to a file you want to run with cmd^run
//+ Main {
//		run { "/Users/peter/Library/Application Support/SuperCollider/Extensions/RedFolderGUI/RedFolderGUIStarter.rtf".load }
//}
			