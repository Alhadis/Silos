//<continuation number="30">




chapter main
{

	$PreGameName = "boot_第三章";

	if($GameStart != 1)
	{
		$GameName = "ch03_069_無人の街";
		$GameContiune = 1;
		Reset();
	}

		ch03_069_無人の街();
}


function ch03_069_無人の街()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//ＢＧ//神泉の町並み//夜


	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg014_02_3_神泉町並み_a.jpg");
	DrawTransition("背景２", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);

	Wait(500);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
今日は土曜日だから通行人と何度もすれ違ってもいいはずなのに、今のところまったく誰にも会わない。

いつもは開いている店なんかもことごとく閉まってるし、ちょっと変だ。

もしかして僕が勘違いしてるのかな。
午後７時だと思っていたけど、実は午前２時ぐらいだったりして。

そんなわけないか。ふひひ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06900010ta">
「…………」

それにしても静かすぎる。
雑音や生活音がほとんど聞こえてこない。
町の雰囲気が、いつもと違う。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//コンビニ外観//夜
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg070_01_3_コンビニ外観_a.jpg");
	DrawTransition("背景１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);

	Wait(500);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
神泉駅前のコンビニにたどり着く。
駅前だっていうのに、やっぱり人がひとりもいない。
だんだん怖くなってきた。

当たり前だったものがいきなりなくなると、それだけで自分が異世界に巻き込まれたような気さえしてくる。

普段は人と会ったり話すのも敬遠している僕だけど、今ばかりはとにかく誰かの顔を見たかった。

コンビニの中に駆け込む。
ここなら店員が絶対いるはずだ――
そう思って店内を見回した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//コンビニ店内

	CreateSE("SE02","SE_日常_びょういん_自動どあ開く");
	SoundPlay("SE02", 0, 1000, false);

	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg071_01_3_コンビニ店内_a.jpg");
	DrawTransition("背景２", 1000, 0, 1000, 100, null, "cg/data/cblind.png", true);

	Wait(500);

	SoundPlay("SE02", 1000, 0, false);

	Wait(700);

	CreateSE("SE02","SE_じん体_動作_のぞく");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
――誰も、いなかった。

客どころか、店員もいない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06900020ta">
「は、はは……まさか」

そんなわけないよ。きっと店員は奥に引っ込んでるんだ。

レジになにか商品を持って行けば、すぐに出てくるはず。

{	SoundPlay("SE02", 0, 500, false);}
だから僕はあえてのんびりとコンビニ弁当を選び、ついでにマンガ雑誌をチェックするフリをしてから、レジに弁当を置いた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06900030ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("１４");
	TypeBegin();//――――――――――――――――――――――――――――――

	EndTrigger();

}