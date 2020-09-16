/*

SceneTree.sc

Supercollider Application For KOROGARU PAVILION YCAM
Wrten by Koichiro Mori @ moxuss.org 2013

*/

(
var scenes  = [
//  ~appDir++"scenes/testScene.sc",
  ~appDir++"scenes/AtomicScene.sc",
  ~appDir++"scenes/RouletteScene.sc",
  ~appDir++"scenes/Yamaguchi-UmiScene.sc",
  ~appDir++"scenes/Yamaguchi-YamaScene.sc"
];

var synthdefs  = [
  ~appDir++"synths/MasterVolumeSynth.sc",
  ~appDir++"synths/MicRcorderSynth.sc",
  ~appDir++"synths/SimplePlayer.sc",
  ~appDir++"synths/AtomicSynth.sc",
  ~appDir++"synths/RouletteSynth.sc",
  ~appDir++"synths/Yamaguchi_UmiSynth.sc",
  ~appDir++"synths/Yamaguchi_YamaSynth.sc"
];

synthdefs.do({|defs| defs.loadPaths()});
scenes.do({|scene| scene.loadPaths()});

~scenesP = [ \atomicScene, \rouletteScene,\yamaguchi_UmiScene  ];
~scenesF = [ \atomicSceneFlex,\rouletteSceneFlex,\yamaguchi_YamaSceneFlex ];

)
