// Using /synths/hat.sc

// Play with default arguments

Synth(\hat);

// Tweaking various arguments with constants

(
Synth(\hat, [
  \len, 0.1 // closer to a closed hat
]);
)

// With some randomality
(
  Synth(\hat, [
    \len, exprand(0.05, 0.5),
    \freq, exprand(4000, 10000),
    \lpCut, exprand(1500, 4000)
  ]);
)

// On a tempo
(
  ~hat = Pbind(
    \instrument, \hat,
    \amp, 2.3,
    \dur, 1
  );
)

~hat.play;
~hat.stop;
~hat.clear;
