s.boot;
s.quit;
s.scope;
FreqScope.new;

// Osc is the primary UGen for oscillating over wavetables and it is a linear
// interpolation that, unline SinOsc, can operate on a custom wavetable stored
// in a buffer. There is also COsc (chorusing) and VOsc (variable).

// Shaper uses a wavetable as a transfer function in order to alter the shape
// of an input signal. This will be covered more in part 2.

// Signal is a language-side ordered collection (like an array that can only
// contain floats) used for representing a sampled function in an offline
// context (away from the audio server). The size should be a power of 2.
// 1024 is a good place to start. We can either use sineFill on Signal or an
// Env with its asSignal message.

// In order to get sound from a Signal, the buffer must be converted to wavetable
// format (most things like SinOsc, VOsc, etc need this format as well) using the
// asWavetable message.

// To plot wavetable format, use:
// ~wt.collect({arg n; n}).plot;
// which converts it to an array.

// only need to do this once
// 2048 is the size of the wavetable (twice the size of the signal)
b  = Buffer.alloc(s, 2048);


///////////////////////////////////////////////////////////

// Using Signal.sineFill and multiple amplitudes
// to create additive synthesis with multile sine waves
(
~amps = [1] ++ ({[0, exprand(0.05,0.5)].choose}!31);
~sig = Signal.sineFill(
    1024,
    ~amps,
    0!32
);
~wt = ~sig.asWavetable;
b.loadCollection(~wt);
// ~wt.plot('sc:env');
// ~sig.plot('sc:signal');
)

b.plot('sc:buffer');

{Osc.ar(b, MouseX.kr(10, 10000, 1), mul:0.2!2)}.play;
// and with the right channel one octive higher and slightly detuned
{Osc.ar(b, MouseX.kr(10, 10000, 1)*[1,2.01], mul:0.2!2)}.play;
s.freeAll;

///////////////////////////////////////////////////////////

// Using an envelope with asSignal and then
// asWavetable to create an abstract shape
// The times (2nd argument) are proportional values
(
var env, sig, wt;
// env = Env([0,0.6,-0.9,0.3,0],[4,3,2,1],\lin);
// env = Env([0,0.6,-0.9,0.3,0],[4,3,2,1],\sine);
env = Env([0,0.6,-0.9,0.3,0],[4,3,2,1],{rrand(-20,20)}!4);
sig = env.asSignal(1024);
wt = sig.asWavetable;
b.loadCollection(wt);
wt.plot;
// sig.plot;
)

b.plot;

{Osc.ar(b, MouseX.kr(10, 10000, 1)*[1,2.01], mul:0.2!2)}.play;


///////////////////////////////////////////////////////////

// Totally random envelopes
(
  var env, sig, wt, numSegs;
  numSegs = rrand(4,20);
  env = Env(
    (({rrand(0.0,1.0)}!(numSegs+1)) * [1,-1]).scramble,
    {exprand(1,20)}!numSegs,
    {rrand(-20,20)}!numSegs
  );
  sig = env.asSignal(1024);
  wt = sig.asWavetable;
  b.loadCollection(wt);
)

b.plot('sc:buffer');

{Osc.ar(b, MouseX.kr(10, 10000, 1)*[1,2.01], mul:0.2!2)}.play;


///////////////////////////////////////////////////////////

// Using Signal.waveFill to take full control over the signal shape
// waveFill acts a lot like collect (you pass it a function)
(
  var sig, wt;
  sig = Signal.newClear(1024);
  sig.waveFill({
    arg x, old, i;
    var out;
    out = sin(x.pow(1.5));
    out = out * 1.5;
    out = out.fold(-1,1);
    out = out.cubed;
  }, 0, 2pi);
  wt = sig.asWavetable;
  b.loadCollection(wt);
)

b.plot('sc:buffer');

{Osc.ar(b, MouseX.kr(10, 10000, 1)*[1,2.01], mul:0.2!2)}.play;
s.freeAll;


///////////////////////////////////////////////////////////

// So there are at least 4 different ways to create wavetables:
//   - Signal.sineFill
//   - b.sine1/2/3 (example not in this file)
//   - Env().asSignal
//   - Signal.waveFill
