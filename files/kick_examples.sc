// Using /synths/kick.sc

(
  Synth(\kick, [
    \freq: 32.midicps
  ]);
)

(
  ~kick = Pbind(
    \instrument, \kick,
    \freq, 30.midicps, // A: 21, 33, 45=110, 57, 69, 81, 93
    \hitHz, 600,
    \hitDur, 0.025,
    \amp, 0.5,
    \dur, 4
  );
)

~kick.play;
~kick.stop;
~kick.clear;
