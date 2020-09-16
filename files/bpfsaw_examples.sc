// Using /synths/bpfsaw.sc

(
  10.do{
    Synth(\bpfsaw, [
      \freq, 50,
      \detune, 0, // 0 to disable detuning
      \cfmin, 50*2,
      \cfmax, 50*50,
      \rqmin, 0.005,
      \rqmax, 0.03,
      \amp, 0.6,
    ]);
  }
)

(
  10.do{
    Synth(\bpfsaw, [
      \midinote, [23,35,54,63,64],
      \detune, 0.7, // 0 to disable detuning
      \cfmin, ([23,35,54,63,64]).midicps*2,
      \cfmax, ([23,35,54,63,64]).midicps*40,
      \cfhzmin, 3,
      \cfhzmax, 6,
      \rqmin, 0.08,
      \rqmax, 0.5,
      \amp, 0.5,
      \atk, 4,
      \rel, 12,
    ]);
  }
)

(
  Pbindef(\ex1,
    \instrument, \bpfsaw,
    \midinote, Pseq([
      [23,35,54,63,64],
      [45,52,54,59,61,64],
      [28,40,47,56,59,63]
    ]),
    \detune, 0.3, // 0 to disable detuning
    \cfmin, Pseq([
      ([23,35,54,63,64]).midicps*2,
      ([45,52,54,59,61,64]).midicps*2,
      ([28,40,47,56,59,63]).midicps*2
    ]),
    \cfmax, Pseq([
      ([23,35,54,63,64]).midicps*40,
      ([45,52,54,59,61,64]).midicps*40,
      ([28,40,47,56,59,63]).midicps*40
    ]),
    \rqmin, 0.05,
    \rqmax, 0.3,
    \amp, 0.6,
    \atk, 2,
    \rel, 8,
    \dur, 5,
  )
)

Pbindef(\ex1).play;
Pbindef(\ex1).stop;

(
  Pbindef(\ex2,
    \instrument, \bpfsaw,
    \dur, Pwhite(4.5,7.0,inf),
    \midinote, Pxrand([
      [23,35,54,63,64],
      [45,52,54,59,61,64],
      [28,40,47,56,59,63],
      [42,52,57,61,63],
    ], inf),
    \detune, Pexprand(0.05,0.2,inf),
    \cfmin, 100,
    \cfmax, 1500,
    \rqmin, Pexprand(0.01,0.15,inf),
    \atk, Pwhite(2.0,2.5,inf),
    \rel, Pwhite(6.5,10.0,inf),
    \ldb, 6,
    \amp, 0.2
  )
)

Pbindef(\ex2).play;
Pbindef(\ex2).stop;

(
  Pbindef(\ex3,
    \instrument, \bpfsaw,
    \dur, Pexprand(0.1,1,inf),
    \freq, Pexprand(0.25,9,inf),
    \detune, 0,
    \rqmin, 0.005,
    \rqmax, 0.008,
    \cfmin, 150,
    \cfmax, 1500,
    \amp, 0.7
  )
)

Pbindef(\ex3).play;
Pbindef(\ex3).stop;

(
  Pbindef(\ex4,
    \instrument, \bpfsaw,
    \dur, Prand([1,0.5], inf),
    \freq, Prand([1/2, 2/3, 1, 4/3, 2, 5/2, 3, 4, 6, 8], inf),
    \detune, Pwhite(0,0.1,inf),
    \rqmin, 0.005,
    \rqmax, 0.008,
    \cfmin, Prand((Scale.major.degrees+64).midicps, inf) * Prand([0.5,1,2,4], inf),
    \cfmax, Pkey(\cfmin) * Pwhite(1.008,1.025, inf),
    \atk, 3,
    \sus, 1,
    \rel, 5,
    \amp, 0.7
  );
)

Pbindef(\ex4).play;
Pbindef(\ex4).stop;

(
  ~ex5 = Pbind(
    \instrument, \bpfsaw,
    // \midinote, Pxrand([23,35,54,45,52,54,28,40,47], inf),
    \scale, Scale.major,
    \octave, 4,
    \degree, Pxrand(Scale.major.degrees, inf),
    \detune, 0.02, // 0 to disable detuning
    \cfmin, 250,
    \cfmax, 2500,
    // \cfhzmin, 2,
    // \cfhzmax, 4,
    \rqmin, 0.05,
    \rqmax, 0.6,
    \atk, 0.2,
    \rel, 0.9,
    \amp, 0.3,
    \dur, Prand([1, 1/2, 1, 2/3], inf)
  );
  // }
)

~ex5.play;
~ex5.end(5);
