s.boot;
s.quit;
s.scope;
FreqScope.new;

// This tutorial is about morphing between multiple wavetables
// In a musical piece, we don't want a hard cut between different wavetables
// VOsc is designed to morph/mix between different wavetables
// First we need at least 2 wavetables
(
~wt0 = Signal.sineFill(
    1024,
    1/(1..8),
    0!8
).asWavetable;

~wt1 = Signal.sineFill(
    1024,
    [1,0,1/2,1,1/4],
    [0,0,pi,0,pi]
).asWavetable;
)

~wt0.plot;
~wt1.plot;

// Load them into buffers on the local server
(
~b0 = Buffer.loadCollection(s, ~wt0);
~b1 = Buffer.loadCollection(s, ~wt1);
)

// And now play them
(
{
  var sig;
  // morph between bufnum 0 and 1 using the mouse
  sig = VOsc.ar(MouseX.kr(0,1), 300, mul:0.2!2);
}.play;
)

// let's use a SynthDef to clean things up and make it more flexible

(
  SynthDef(\vosc, { | out=0 |
    var sig, bufpos;
    bufpos = MouseX.kr(0,1);
    sig = VOsc.ar(bufpos, 300, mul:0.2!2);
    Out.ar(out, sig);
  }).add;
)

Synth(\vosc);

// Note: all the buffers VOsc uses must be the same size
// but this is still sloppy because we have to hardcode the actual bufnums

~buf = Buffer.allocConsecutive(4, s, 2048);

(
~wt = Array.fill(4, {
    var numSegs = rrand(4,20);
    Env(
        [0]++(({rrand(0.0,1.0)}!(numSegs-1)) * [1,-1]).scramble++[0],
        {exprand(1,20)}!numSegs,
        {rrand(-20,20)}!numSegs
    ).asSignal(1024).asWavetable;
});
)

(
~buf.do({
    arg buf, i;
    buf.loadCollection(~wt[i]);
});
)

~wt.do({arg n, i; n.plot('sc:'++~buf[i].bufnum.asString)});

(
SynthDef.new(\vosc, {
    arg out=0, buf=0, numBufs=2, freq=300, amp=0.2;
    var sig, bufpos, detuneSig;
    detuneSig = LFNoise1.kr(0.2!8).bipolar(0.2).midiratio;
    bufpos = buf + LFNoise1.kr(0.5).range(0, numBufs-1);
    sig = VOsc.ar(bufpos, freq*detuneSig);
    sig = Splay.ar(sig);
    sig = LeakDC.ar(sig) * amp;
    Out.ar(out, sig);
}).add;
)

Synth(\vosc, [\freq, 43.midicps, \buf, ~buf[0].bufnum, \numBufs, 4]);
