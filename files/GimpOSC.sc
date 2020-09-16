/*
here will be dragons
*/

GimpOSC {
	var <respSpec, <respSender, <respReceiver, <pic, <>delay, <>specs, <>newPic, <>messageSize;
	*new {
		^super.new.init;
	}
	init{
		messageSize = 8000; // 1000 before
		respSender = OSCresponderNode(nil, '/gimp/ping', 
			{ arg time, resp, msg;
				var net, newMsg, task, nrSlices;
				// message size in pixel
				var msgPSize = (messageSize / 3).floor.asInteger;
				// number of pixels in every message
				if( msg[1] == -1, 
					{   
						// send the image as chunks to gimp
						task = Task({
							"ping triggered".postln;
							net = NetAddr.new("127.0.0.1", 57130);
							net.sendMsg("/gimp/spec", 
								this.pic.width, 
								this.pic.height,
								(this.pic.bpp - 1));// bpp without alpha
							"specs sent".postln;
							// slice up the bitmap
							nrSlices = (this.pic.array.size / msgPSize).ceil.asInteger;
							nrSlices.do({ |index|
								var end;
								newMsg = Int8Array.new;
								if( (index + 1) < nrSlices,{ 
									end = (index * msgPSize)+(msgPSize - 1);
								},{
									end = this.pic.array.size;
								});		
								newMsg = newMsg.addAll(
									(this.pic.array.copyRange(
										index * msgPSize, 
										end).collect(_.asArray255(true))
									).flat );
								net.sendMsg("/gimp/pic", index, newMsg);
								("sent slice " ++ index 
									++ " with length "++newMsg.size).postln;
								(0.04).wait;	
							});
							// end communication
							net.sendMsg("/gimp/end", -1);
							(time.asString 
								++ ": sent Array").postln; 
						});
						task.start;
					});
			}).add;
		respSpec = OSCresponderNode(nil, '/gimp/spec', 
			{ arg time, resp, msg; 
				// width, height, bpp
				this.specs = [ msg[1], msg[2], msg[3]];
				this.newPic = [ ];
				this.delay = time;
				(time.asString ++ ": Receiving new Array...").postln;
			}).add;
		respReceiver = OSCresponderNode(nil, '/gimp', 
			{ arg time, resp, msg;
				if( msg[1] == -1, 
					{   
						this.pic = Bitmap.fromArray255(
							this.specs[0],
							this.specs[1], 
							(this.newPic%255).clump(specs[2]));
						this.delay = time - this.delay;
						(time.asString 
							++ ": Updated Array in " 
							++ this.delay ++ " seconds.").postln; 
						this.newPic = [ ];
					},
					{ 
						("Received chunk " ++ msg[1]).postln;
						this.newPic = this.newPic ++ msg[2]; 
					}
				)
			}).add;
		"Responders ready"
	}
	/* seems to crash sc */
	pic_ { arg img;
		if(img.isKindOf(Bitmap),
			{ pic = img },
			{ "Error: Not an image" });
		}
}