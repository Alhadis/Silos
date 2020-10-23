//<continuation number="10">




chapter main
{

	$PreGameName = "boot_第一章";

	if($GameStart != 1)
	{
		$GameName = "ch01_015_楠優愛";
		$GameContiune = 1;
		Reset();
	}

	ch01_015_楠優愛();
}


function ch01_015_楠優愛()
{
	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	CreateColor("背景１", 100, 0, 0, 1280, 720, "Black");
	Fade("背景１", 0, 1000, null, true);

//☆Cut-66-----------------------------
//ＢＧ//１０９前//夜
	CreateBG(100, 1000, 0, 0, "cg/bg/bg009_02_3_107_a.jpg");

//ＳＥ//センター街
	CreateSE("SE01","SE_日常_雑踏01");
	MusicStart("SE01", 0, 800, 0, 1000, null, true);

	Delete("背景*");
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
カフェを出て、急ぎ足でベースに向かう。

結局、ビビっちゃってあの後すぐに店を出た。

一刻も早く帰りたいっていうのに、歩道は人でごった返していて、思うように進めない。

だんだん気分が悪くなってきた。
人混みは苦手だ……。みんなが僕を見て、クスクス笑っているような気がしてくるし。

信号が赤だったのでやむなく立ち止まり、周囲に素早く視線を巡らせる。
女子Ａの姿は見当たらない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg027_01_3_道玄坂_a.jpg");
	DrawTransition("back03", 500, 0, 1000, 100, null, "cg/data/right3.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg027_01_3_道玄坂_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
道玄坂を登ってくると、だいぶ歩きやすくなった。
いつもなら、できるだけ人が通らない裏通りを選んで帰るんだけど――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//衝撃音（フラッシュバック）
	CreateSE("SE02","SE_衝撃_ふらっしゅばっく");
//ＣＧ//張り付け死体
//一瞬だけ表示
	CreateTextureEX("はりつけ", 200, 0, 0, "cg/ev/ev005_01_3_杭貼付け_a.jpg");

	MusicStart("SE02", 0, 700, 0, 1000, null, false);
	Fade("はりつけ", 0, 1000, null, true);
	Wait(300);
	Fade("はりつけ", 400, 0, null, true);

	CreateTextureEX("交差点０", 100, center, Middle, "cg/ev/ev018_01_3_優愛_a.jpg");
	Request("交差点０", Smoothing);
	Move("交差点０", 0, @520, @0, null, true);
	Zoom("交差点０", 0, 2000, 2000, null, true);

//ＢＧ//道玄坂//夜

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
一昨日の夜のこともあるから、念には念を入れて表通りを選んだ。

{	Fade("交差点０", 500, 1000, null, true);}
また赤信号でひっかかり、改めて背後を確認してみるけど、女子Ａは見当たらなかった。
やっぱり＠カフェで見かけたのは別人だったのかもしれない。

少しだけホッとして、それまで強張っていた肩の力を少しだけ緩め、正面に向き直った――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	Move("交差点０", 1000, @-520, @0, Axl1, true);
	Delete("はりつけ");
	Wait(500);

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

//ＣＧ//交差点の向こう側で信号待ちしてこちらを見ている優愛//赤信号
	CreateSE("SE02","SE_じん体_心臓_鼓動");
	CreateTextureEX("交差点", 100, center, Middle, "cg/ev/ev018_01_3_優愛_a.jpg");
	Zoom("交差点", 0, 2000, 2000, null, true);
	Request("交差点", Smoothing);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Zoom("交差点", 200, 1000, 1000, null, false);
	Fade("交差点", 300, 1000, null, true);

	Delete("交差点０");
	Delete("back*");

	SetVolume("SE01", 0, 0, NULL);
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01500010ta">
「……！」

愕然となって、一歩、後ずさる。

横断歩道を挟んだ向こう側。
信号待ちをしている人たちの中に、あの女がいた。

しかも、眼鏡の奥の視線は、あからさまに僕へと向けられ、そらそうともしない。

なにかを訴えかけようとしているような、深刻な色をたたえた瞳……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("３");
	TypeBegin();//――――――――――――――――――――――――――――――

	EndTrigger();

}

