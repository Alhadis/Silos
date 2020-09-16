~filePath = "/home/don/music/sc/playground/sampling/et.wav";

~b0 = Buffer.read(s, ~filePath);
~b0.play;

// Frames
~b0.numFrames;

// Channels
~b0.numChannels;

// Duration
~b0.duration;

// Buffer numbers (bufnums)
~b0.bufnum;

// Buffer sample rate
~b0.sampleRate;
s.sampleRate;

// Summary
~b0.query;

// How to load only part of a sound file into a buffer
// Loading only the first half second of the sound file:
~start = 100000
~end = ~start + s.sampleRate/2;
~b0_part = Buffer.read(s, ~filePath, ~start, ~end)
~b0_part.play;

(
  SynthDef.new(\bufrd_test, {
    arg amp=1, out=0, buf;
    var sig, ptr;
    ptr = Line.ar(0, BufFrames.kr(buf)-1, BufDur.kr(buf), doneAction:2);
    sig = BufRd.ar(2, buf, ptr);
    sig = sig * amp;
    Out.ar(out, sig);
  }).add;
)

Synth.new(\bufrd_test, [\buf, ~b0.bufnum]);
