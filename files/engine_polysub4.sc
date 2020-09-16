// a subtractive polysynth engine
// https://github.com/monome/dust/blob/4abfe0e0c3e4eadf65a807beb4f154b3e725543a/lib/sc/Engine_PolySub.sc

Engine_PolySub4 : CroneEngine {

  classvar <polyDef;
  classvar <paramDefaults;
  classvar <maxNumVoices;

  var <ctlBus; // collection of control busses
  var <mixBus; // audio bus for mixing synth voices
  var <gr; // parent group for voice nodes
  var <voices; // collection of voice nodes

  *initClass {
    maxNumVoices = 16;
    StartUp.add {
      // a decently versatile subtractive synth voice
      polyDef = SynthDef.new(\polySub4, {
       arg out, gate=1, hz, velocity=1, level=0.2, // the basics
        // amplitude envelope params
        ampAtk=0.05, ampDec=0.1, ampSus=1.0, ampRel=1.0, ampCurve= -1.0,
        // filter envelope params
        cutAtk=0.0, cutDec=0.0, cutSus=1.0, cutRel=1.0,
        hzLag = 0.1;

        var freq = Lag.kr(hz, hzLag);
        var adsr = EnvGen.ar(Env.adsr(cutAtk,cutDec,cutSus,cutRel), gate, doneAction:2);

        var nvoices1 = 5, nvoices2 = 4;
        var detune1 = 8, detune2 = 4;
        var rr1 = Array.rand2(nvoices1,0.5);
        var rr2 = Array.rand2(nvoices2,0.5);

        var osc1 = (1..nvoices1-1).collect({|numOsc|
          var m = 2**(detune1/1200).rand2;
          var lfo = SinOsc.ar(3.rand).range(0,1);
          Pan2.ar(DelayC.ar(LFSaw.ar(m * freq/2), 0.02, freq.reciprocal * lfo),rr1[numOsc]);
        });

        var osc2 = (1..nvoices2-1).collect({|numOsc|
          var m = 2**(detune2/1200).rand2;
          var lfo = SinOsc.ar(3.rand).range(0,1);
          Pan2.ar(DelayC.ar(LFSaw.ar(m * freq), 0.02, freq.reciprocal * lfo),rr2[numOsc]);
        });

        var snd = BLowPass4.ar(osc1, 800, 0.5)/1 + BHiPass4.ar(osc2,200,0.5) / 4;
        Out.ar(out, LeakDC.ar(Limiter.ar(level*velocity*snd*adsr)));
      });

      CroneDefs.add(polyDef);
      
      //// FIXME: probably a better way... ehh.
      paramDefaults = Dictionary.with(
        \level -> -12.dbamp,
        \velocity -> 1,
        \ampAtk -> 0.05, \ampDec -> 0.1, \ampSus -> 1.0, \ampRel -> 1.0, \ampCurve ->  -1.0,
        \cutAtk -> 0.0, \cutDec -> 0.0, \cutSus -> 1.0, \cutRel -> 1.0,
        \hzLag -> 0.1
      );

    } // Startup
  } // initClass

  *new { arg context, callback;
    ^super.new(context, callback);
  }

  alloc {
    gr = ParGroup.new(context.xg);

    voices = Dictionary.new;
    ctlBus = Dictionary.new;
    polyDef.allControlNames.do({ arg ctl;
      var name = ctl.name;
      postln("control name: " ++ name);
      if((name != \gate) && (name != \hz) && (name != \out), {
        ctlBus.add(name -> Bus.control(context.server));
        ctlBus[name].set(paramDefaults[name]);
      });
    });

    ctlBus.postln;

    ctlBus[\level].setSynchronous( 0.2 );


    //--------------
    //--- voice control, all are indexed by arbitarry ID number
    // (voice allocation should be performed by caller)

    // start a new voice
    this.addCommand(\start, "if", { arg msg;
      this.addVoice(msg[1], (440/32)*(2**((msg[1]-9)/12)), msg[2], true);
    });


    // same as start, but don't map control busses, just copy their current values

    this.addCommand(\solo, "i", { arg msg;
      this.addVoice(msg[1], (440/32)*(2**((msg[1]-9)/12)), msg[2], false);
    });


    // stop a voice
    this.addCommand(\stop, "i", { arg msg;
      this.removeVoice(msg[1]);
    });

    // free all synths
    this.addCommand(\stopAll, "", {
      gr.set(\gate, 0);
      voices.clear;
    });

    // generate commands to set each control bus
    ctlBus.keys.do({ arg name;
      this.addCommand(name, "f", { arg msg; ctlBus[name].setSynchronous(msg[1]); });
    });

    postln("polysub: performing init callback");
  }

  addVoice { arg id, hz,velocity,map=true;
    var params = List.with(\out, context.out_b.index, \hz, hz);
    var numVoices = voices.size;
    //postln("num voices: " ++ numVoices);

    if(voices[id].notNil, {
      voices[id].set(\gate, 1);
      voices[id].set(\hz, hz);
      voices[id].set(\velocity,velocity);
    }, {
      if(numVoices < maxNumVoices, {
        // shouldn't need this
        // this.removeVoice(id);
        ctlBus.keys.do({ arg name;
          params.add(name);
          params.add(ctlBus[name].getSynchronous);
        });
        
        voices.add(id -> Synth.new(\polySub4, params, gr));
        NodeWatcher.register(voices[id]);
        voices[id].onFree({
          voices.removeAt(id);
        });

        if(map, {
          ctlBus.keys.do({ arg name;
            voices[id].map(name, ctlBus[name]);
          });
        });
      });
    });
  }

  removeVoice { arg id;
    if(true, { //voices[id].notNil, {
      voices[id].set(\gate, 0);
      //voices.removeAt(id);
    });
  }

  free {
    gr.free;
    ctlBus.do({ arg bus, i; bus.free; });
  }

} // class
