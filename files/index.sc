(
  var path = Platform.userConfigDir ++ '/src/synths/wraps/';

  this.executeFile(path ++ 'carriers.sc');
  this.executeFile(path ++ 'amp_adsr.sc');
  this.executeFile(path ++ 'amp_perc.sc');
  this.executeFile(path ++ 'rlpf.sc');
  this.executeFile(path ++ 'filter_freq_adsr.sc');
  this.executeFile(path ++ 'modulators.sc');
  this.executeFile(path ++ 'fm.sc');
  this.executeFile(path ++ 'kick_freq_env.sc');

  ~stereo = { | signal, out = 0, pan = 0, amp = 1 |
    Out.ar(out, Pan2.ar(signal, pan, amp))
  };
)
