// This works in SCVim
"/home/don/music/sc/playground/loadtest/synth.sc".load;

(
  // These do not work in SCVim, but they do
  // work in the official SuperCollider IDE
  "./synth.sc".resolveRelative.load;
  // ("./synth.sc").loadRelative;
  Synth(\testsynth);
)
