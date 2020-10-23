//<continuation number="60">




chapter main
{

	$PreGameName = "boot_第一章";

	if($GameStart != 1)
	{
		$GameName = "ch00_001_インターミッション０１";
		$GameContiune = 1;
		Reset();
	}

	ch00_001_インターミッション０１();
}


//――――――――――――――――
//☆Cut-1------------------------------
//■インターミッション０１

//ＢＧ//黒
//うっすらと崩壊渋谷が見える
//渋谷は崩壊し瓦礫だらけ。天気は雨
//ＳＥ//雨
//冒頭はルックアップレインのMPEG


function ch00_001_インターミッション０１()
{

	$SYSTEM_last_text="プロローグ";

	$SYSTEM_text_auto_lock=true;

	if(Platform()!=100){
		Save(9999);
	}

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	CreateSE("SE01","SE_自然_雨_通常_LOOP");
	MusicStart("SE01", 2000, 1000, 0, 1000, null, true);

	Wait(1000);

	CreateColor("色１", 1000, 0, 0, 1280, 720, "BLACK");
//	CreateTexture360("背景０", 100, @0, @80, "cg/bg/bg001_01_1_崩壊渋谷_a.jpg");
//おがみ：ズーム
	CreateTexture360("背景０", 100, @0, @320, "cg/bg/bg001_01_1_崩壊渋谷_a.jpg");
//おがみ：バーテックス修正　//コメントアウト済み
//	SetVertex("背景０", 400, 0);//コメントアウト済み

	Request("背景０", Smoothing);
	Zoom("背景０", 0, 1500, 1500, null, true);

	CreateMovie360("雨１", 100, Center, Middle, true, false, "dx/mv雨01.avi");
	Request("雨１", AddRender);
	FadeDelete("色１", 3000, true);

	Wait(2000);

	$SYSTEM_text_interval = 128;
	LoadBox10();

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100010ta");
}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text001]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100010ta" mode="off">
視線が、空から降ってくる。
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 2000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100020ta");
	CreateVOICE("タクミ２","ch01/00100030ta");
	CreateVOICE("タクミ３","ch01/00100040ta");
}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text501]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100020ta" mode="off">
その瞳は、いつも僕を見つめていて。
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 1000;
WaitKey($待ち時間);
Delete("タクミ１");
SoundPlay("タクミ２",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100030ta" mode="off">
眼差しは、厚くて真っ黒な雨雲を突き抜けて。
{$待ち時間 = RemainTime ("タクミ２");
$待ち時間 += 2000;
WaitKey($待ち時間);
Delete("タクミ２");
SoundPlay("タクミ３",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100040ta" mode="off">
雨のように僕へと降り注ぐ。
{$待ち時間 = RemainTime ("タクミ３");
$待ち時間 += 3000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(0);//――――――――――――――――――――――――――――――


	Delete("タクミ３");

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100050ta");
}

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

//以下、画面黒で文章のみ画面中央にカットイン
	CreateColor("色１", 1000, 0, 0, 1280, 720, "Black");
	CreateTextureEX("背景２", 100, @0, @0, "cg/bg/bg001_01_1_崩壊渋谷_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text601]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100050ta" mode="off">
――僕を、見るな。
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 2000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

	FadeDelete("@text601", 1000, false);
	FadeDelete("色１", 1000, true);

//以上、画面黒で文章のみ画面中央にカットイン
if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100060ta");
}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text003]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100060ta" mode="off">
雨の冷たさより、背中を預けている瓦礫の冷たさのせいで、
さっきから身体の震えが止まらない。
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 2000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100070ta");
}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text503]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100070ta" mode="off">
ひどく、寒い……。
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 2000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――


if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100080ta");
}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text603]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100080ta" mode="off">
突き刺さってくる、誰のものかも分からない天からの視線。
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 1000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

//ＢＧ//崩壊渋谷//雨
if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100090ta");
}

	CreateMovie360("雨２", 500, Center, Middle, true, false, "dx/mv雨02.avi");	
	Fade("雨２", 0, 0, null, true);
	Request("雨２", AddRender);

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text703]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100090ta" mode="off">
それから逃げるように、僕はわずかに首を持ち上げて周囲を見回す。
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 2000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100100ta");
	CreateVOICE("タクミ２","ch01/00100110ta");
	CreateVOICE("タクミ３","ch01/00100120ta");
	CreateVOICE("タクミ４","ch01/00100130ta");
}

	Fade("雨１", 1000, 0, null, false);
	Fade("雨２", 1000, 1000, null, false);
	Fade("背景２", 3000, 1000, null, false);
	Move("背景２", 10000, @0, @-800, DxlAuto, 4000);


	Delete("雨１");


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text004]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100100ta" mode="off">
そこにあるのは、崩壊した街――
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 1000;
WaitKey($待ち時間);
Delete("タクミ１");
SoundPlay("タクミ２",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100110ta" mode="off">
そこにあるのは、絶望――
{$待ち時間 = RemainTime ("タクミ２");
$待ち時間 += 1000;
WaitKey($待ち時間);
Delete("タクミ２");}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text3602004]
{SoundPlay("タクミ３",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100120ta" mode="off">
そこにあるのは、死――
{$待ち時間 = RemainTime ("タクミ３");
$待ち時間 += 1500;
WaitKey($待ち時間);
Delete("タクミ３");
SoundPlay("タクミ４",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100130ta" mode="off">
そこにあるのは、無――
{$待ち時間 = RemainTime ("タクミ４");
$待ち時間 += 3000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

//おがみ：↑ここおかしい、ウェイトしていない

	WaitAction("背景２", null);
	Delete("背景０");

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100140ta");
	CreateVOICE("タクミ２","ch01/00100150ta");
	CreateVOICE("タクミ３","ch01/00100160ta");
	CreateVOICE("タクミ４","ch01/00100170ta");
}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text005]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100140ta" mode="off">
誰もいない。<?>
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 1000;
WaitKey($待ち時間);
Delete("タクミ１");
SoundPlay("タクミ２",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100150ta" mode="off">
誰も動いてない。<?>
{$待ち時間 = RemainTime ("タクミ２");
$待ち時間 += 1000;
WaitKey($待ち時間);
Delete("タクミ２");
SoundPlay("タクミ３",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100160ta" mode="off">
誰も、生きていない。
{$待ち時間 = RemainTime ("タクミ３");
$待ち時間 += 2000;
WaitKey($待ち時間);
Delete("タクミ３");
SoundPlay("タクミ４",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100170ta" mode="off">
聞こえるのはただ、降り続ける雨の音だけ。
{$待ち時間 = RemainTime ("タクミ４");
$待ち時間 += 2000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

	Delete("タクミ４");

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100180ta");
	CreateVOICE("タクミ２","ch01/00100190ta");
	CreateVOICE("タクミ３","ch01/00100200ta");
}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text505]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100180ta" mode="off">
このまますべてを――
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 2000;
WaitKey($待ち時間);
Delete("タクミ１");
SoundPlay("タクミ２",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100190ta" mode="off">
生きているものも、死んでいるものも、
{$待ち時間 = RemainTime ("タクミ２");
$待ち時間 += 1000;
WaitKey($待ち時間);
Delete("タクミ２");
SoundPlay("タクミ３",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100200ta" mode="off">
すべてを優しく包み込んで洗い流してしまうんだろうか。
{$待ち時間 = RemainTime ("タクミ３");
$待ち時間 += 3000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(0);//――――――――――――――――――――――――――――――


//以下、画面黒で文章のみ画面中央にカットイン
	CreateColor("色１", 1000, 0, 0, 1280, 720, "Black");
	Delete("タクミ３");
	Delete("背景２");

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100210ta");
}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text901]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100210ta" mode="off">
全部の出来事が単なる妄想だったらよかったんだけど、
どうやらそうでもないらしい――
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 1500;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("背景１", 240, 0, -848, "cg/ev/ev001_01_1_INT01近づく梨深_a.jpg");
	Fade("背景１", 0, 1000, null, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	FadeDelete("@text901", 1000, false);
	FadeDelete("色１", 1000, true);
//以上、画面黒で文章のみ画面中央にカットイン


if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100220ta");
	CreateVOICE("タクミ２","ch01/00100230ta");
	CreateVOICE("タクミ３","ch01/00100240ta");
}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text506]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100220ta" mode="off">
身体が、動かない。<?>
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 1500;
WaitKey($待ち時間);
Delete("タクミ１");
SoundPlay("タクミ２",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100230ta" mode="off">
動かせるのはかろうじて、首と瞳だけ。
{$待ち時間 = RemainTime ("タクミ２");
$待ち時間 += 1000;
WaitKey($待ち時間);
Delete("タクミ２");
SoundPlay("タクミ３",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100240ta" mode="off">
身体が震えているけど、そんなのただの生理現象でしかない。
{$待ち時間 = RemainTime ("タクミ３");
$待ち時間 += 2000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

	Delete("タクミ３");

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100250ta");
	CreateVOICE("タクミ２","ch01/00100260ta");
}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text606]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100250ta" mode="off">
僕の意志じゃない。僕は身を震わせたいなんて思ってない。
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 2000;
WaitKey($待ち時間);
Delete("タクミ１");
SoundPlay("タクミ２",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100260ta" mode="off">
僕の自由にならないなら、こんなの僕の身体じゃない。
{$待ち時間 = RemainTime ("タクミ２");
$待ち時間 += 2000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

	Delete("タクミ２");

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100270ta");
	CreateVOICE("タクミ２","ch01/00100280ta");
}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text706]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100270ta" mode="off">
あるいは生まれたときから僕は自由なんかじゃなかったかもしれない。
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 1000;
WaitKey($待ち時間);
Delete("タクミ１");
SoundPlay("タクミ２",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100280ta" mode="off">
心の保管してある場所なんて誰にも分からないんだ。
{$待ち時間 = RemainTime ("タクミ２");
$待ち時間 += 2000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――


	Delete("タクミ２");

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100290ta");
}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text707]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100290ta" mode="off">
それなのにいったい誰が、
この身体の中に僕の心があるって言い切れるんだ？
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 4000;
WaitKey($待ち時間);}

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

	Delete("タクミ１");

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100300ta");
}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text806]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100300ta" mode="off">
でも――
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 2000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

	Delete("タクミ１");

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100310ta");
	CreateVOICE("タクミ２","ch01/00100320ta");
	CreateVOICE("タクミ３","ch01/00100330ta");
}


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text906]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100310ta" mode="off">
だったら僕はどこにいたんだろう？
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 1000;
WaitKey($待ち時間);
Delete("タクミ１");
SoundPlay("タクミ２",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100320ta" mode="off">
僕は、ここにいるのかな？
{$待ち時間 = RemainTime ("タクミ２");
$待ち時間 += 500;
WaitKey($待ち時間);
Delete("タクミ２");
SoundPlay("タクミ３",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100330ta" mode="off">
僕は、どこにもいないのかな？
{$待ち時間 = RemainTime ("タクミ３");
$待ち時間 += 2000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

	Delete("タクミ３");

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100340ta");
}

	//梨深足元
	//ＳＥ//瓦礫の山を踏みながら歩いてくる足音
	CreateSE("SE02","SE_じん体_動作_足_三歩");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	
	Move("背景１", 4000, @0, @320, Dxl1, false);


	BGMPlay360("CH00",0,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text007]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100340ta" mode="off">
すべてが静止している、コワレてしまった世界に、
ふと死の雨以外の音が響く。
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 2000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

	WaitAction("背景１", null);

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100350ta");
}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text507]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100350ta" mode="off">
無の中から浮かび上がってくる、たったひとつの有。
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 2000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(0);//――――――――――――――――――――――――――――――

//以下、画面黒で文章のみ画面中央にカットイン

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateColor("色１", 1000, 0, 0, 1280, 720, "Black");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100360ta");
}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text902]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100360ta" mode="off">
――君は、誰？
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 2000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100370ta");
}


//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("背景２", 240, 0, -384, "cg/ev/ev001_01_2_INT01近づく梨深_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Move("背景１", 12000, @0, @512, Dxl1, false);

	FadeDelete("@text902", 1000, false);
	FadeDelete("色１", 1000, true);
//以上、画面黒で文章のみ画面中央にカットイン

//ＣＧ//瓦礫の山に立ち見下ろしてくる梨深//①
//	CreateBG(300, 1000, 0, 0, "cg/ev/ev001_01_2_INT01近づく梨深_a.jpg");



//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text010]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100370ta" mode="off">
その肌が青白く見えるのは――
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 1500;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100380ta");
}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text410]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100380ta" mode="off">
雨の冷たさに凍えているから？
それとも、君がもう死んでいるから？
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 2000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――



if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100390ta");
}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text510]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100390ta" mode="off">
でも、彼女は震えていなかった。
そして、前髪で隠れそうになっているその瞳は――
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 1000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(0);//――――――――――――――――――――――――――――――

	Fade("背景２", 1000, 1000, null, false);
	Move("背景２", 6000, @0, @192, Axl1, true);

//以下、画面黒で文章のみ画面中央にカットイン
//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateColor("色１", 1000, 0, 0, 1280, 720, "Black");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Delete("背景１");
if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100400ta");
}


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text903]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100400ta" mode="off">
――僕を、見るな。
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 0;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100410ta");
}

	Move("背景２", 2000, @0, @64, Dxl1, false);
	FadeDelete("@text903", 1000, false);
	FadeDelete("色１", 1000, true);
//以上、画面黒で文章のみ画面中央にカットイン


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text011]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100410ta" mode="off">
ひどく悲しそうにも見える。
狂気じみているようにも見える。
なにも映していないようにも見える。
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 3000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

	Delete("タクミ１");

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100420ta");
}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text511]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100420ta" mode="off">
もしも――
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 2000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

	Delete("タクミ１");

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100430ta");
	CreateVOICE("タクミ２","ch01/00100440ta");
}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text611]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100430ta" mode="off">
世界には僕と彼女のふたりだけしかいなくて。
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 1000;
WaitKey($待ち時間);
Delete("タクミ１");
SoundPlay("タクミ２",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100440ta" mode="off">
こうしてお互いだけを永遠に見つめ合っていたら――
{$待ち時間 = RemainTime ("タクミ２");
$待ち時間 += 1500;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

	Delete("タクミ２");

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100450ta");
	CreateVOICE("タクミ２","ch01/00100460ta");
}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text711]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100450ta" mode="off">
僕の世界は、彼女の瞳に映るものだけになるのかな？
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 1500;
WaitKey($待ち時間);
Delete("タクミ１");
SoundPlay("タクミ２",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100460ta" mode="off">
彼女の世界は、僕の瞳に映るものだけになるのかな？
{$待ち時間 = RemainTime ("タクミ２");
$待ち時間 += 2000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

	Delete("タクミ２");

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100470ta");
}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text811]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100470ta" mode="off">
彼女の瞳に映るものは、僕。
僕の瞳に映るものは、彼女。
そう考えると、世界は途端に矮小化する。
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 2000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――


	Delete("タクミ１");

//以下、画面黒で文章のみ画面中央にカットイン
//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateColor("色１", 1000, 0, 0, 1280, 720, "Black");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	CreateVOICE("サウンドりみ","ch01/00100010ri");
	SoundPlay("サウンドりみ",0,1000,false);

	WaitPlay("サウンドりみ", null);
//	WaitKey(500);

/*

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text012]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch01/00100010ri">
「ねえ――」（※音声到着段階でテキスト削除）
{WaitKey(500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

*/

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("背景１", 240, 0, -848, "cg/ev/ev001_01_2_INT01近づく梨深_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Fade("背景１", 1000, 1000, null, true);

	FadeDelete("@text012", 1000, false);
	FadeDelete("色１", 1000, true);


if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100480ta");
}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text013]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100480ta" mode="off">
不意に僕の耳に届く、とてもキレイなノイズ――
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 2000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100490ta");
	CreateVOICE("タクミ２","ch01/00100500ta");
}


//ＣＧ//瓦礫の山に立ち見下ろしてくる梨深//②
//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text014]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100490ta" mode="off">
彼女はうなだれて――
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 2000;
WaitKey($待ち時間);
Delete("タクミ１");
SoundPlay("タクミ２",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100500ta" mode="off">
両手を、左右に広げる――
{$待ち時間 = RemainTime ("タクミ２");
$待ち時間 += 2000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

	Delete("タクミ２");

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100510ta");
}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text514]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100510ta" mode="off">
まるで、あの雨雲の上へ向けて飛び立とうとするかのように。
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 2000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

	Delete("タクミ１");

if(#voice_skip_拓巳 != 1)
{
	CreateVOICE("タクミ１","ch01/00100520ta");
}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text614]
{	SoundPlay("タクミ１",0,1000,false);}
<voice name="拓巳" class="拓巳" src="voice/ch01/00100520ta" mode="off">
あるいは、この雨すべてを、受け止めようとするかのように。
{$待ち時間 = RemainTime ("タクミ１");
$待ち時間 += 2000;
WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

	Request("SE01", Lock);
	SoundStop("SE01");

//	Request("雨", Erase);
	Delete("雨");


//	CreateColor("背景０", 1000, 0, 0, 1280, 720, "WHITE");
//	Fade("背景０", 0, 0, null, true);

//	Fade("背景０", 3000, 1000, null, false);
//	DrawTransition("背景０", 3000, 0, 1000, 100, null, "cg/data/light6.png", true);

//ＣＧ//瓦礫の山に立ち見下ろしてくる梨深//③
//以下、テキスト表示なし。音声のみで。
//以上、テキスト表示なし。音声のみで。

//■インターミッション１終了
//ＳＥ//雨ループ停止


	ClearAll(500);
	Request("SE01", UnLock);

	$skip_log=$SYSTEM_skip;
	$auto_log=$SYSTEM_text_auto;
	$SYSTEM_skip=false;
	$SYSTEM_text_auto=false;
	$SYSTEM_menu_lock = true;

//☆Cut-2------------------------------
//【　オープニングムービー　】へ

	if(#OpMovie){
//おがみ：ムービー再生コマンド変更
//		MoviePlay("dx/mvINTER01.avi", false);
//		MoviePlay("dx/mvOP.avi", false);
		CreateMovie360("インタームービー", 100, 0, 0, false, false, "dx/mvINTER01.avi");
		$MovieTime=RemainTime("インタームービー");
		WaitKey($MovieTime);

		SetVolume360("CH00", 3000, 0, NULL);
		Wait(3000);

		CreateMovie360("ＯＰムービー", 100, 0, 0, false, false, "dx/mvOP.avi");
		Delete("インタームービー");

		$MovieTime=RemainTime("ＯＰムービー");
		WaitKey($MovieTime);

		Delete("ＯＰムービー");
	}else{
//		MoviePlay("dx/mvINTER01.avi", true);
//		MoviePlay("dx/mvOP.avi", true);
		CreateMovie360("インタームービー", 100, 0, 0, false, false, "dx/mvINTER01.avi");
		WaitPlay("インタームービー", null);

		SetVolume360("CH00", 3000, 0, NULL);
		Wait(3000);

		CreateMovie360("ＯＰムービー", 100, 0, 0, false, false, "dx/mvOP.avi");
		Delete("インタームービー");

		WaitPlay("ＯＰムービー", null);

		Delete("ＯＰムービー");
		#OpMovie=true;
	}

//○実績No.1：プロローグ
	XBOX360_Achieved(1);

//雨雲の空が徐々に青空へと変わっていく。太陽の光が射し込んできてホワイトアウト～～
//☆上記はムービーintroに使う
//　インターミッションからシームレスに

	$SYSTEM_menu_lock = false;
	$SYSTEM_text_auto_lock=false;

	if(#keep_auto_and_skip){
		if($skip_log){
			$SYSTEM_skip=true;
		}else if($auto_log){
			$SYSTEM_text_auto=true;
		}
	}
}


////////////////////////////////////ムービー挿入カット部分///////////////////////////////////////
function MovePart()
{
//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text017]
//ＣＧ//瓦礫の山に立ち見下ろしてくる梨深//③
//以下、テキスト表示なし。音声のみで。
//以上、テキスト表示なし。音声のみで。
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch01/00100020ri">
「あなたを見つめる――」

//以下、テキスト表示なし。音声のみで。
//以上、テキスト表示なし。音声のみで。
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch01/00100030ri">
「妄想――」

うなだれた彼女の表情は、僕の位置からもうかがい知ることができない。雨の薄膜の向こうで、君は、どんな顔をしている……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

	FadeDelete("梨深ズーム", 500, false);
	CreateBG( 100, 500, 0, 0, "cg/ev/ev002_01_1_INT01殺してあげる_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text018]
//動かない口アップ
//名前表記なし
//以下、テキスト表示なし。音声のみで。
//以上、テキスト表示なし。音声のみで。
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch01/00100040ri">
「殺してあげる――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――


//ＢＧ//白
	CreateColor("色２", 100, 0, 0, 1280, 720, "WHITE");

//ＳＥ//衝撃音
	CreateSE("SE02","SE_衝撃_衝撃音01");
	SoundPlay("SE02", 0, 1000, false);


	CreateBG(100, 0, 0, @-480, "cg/bg/bg001_01_1_崩壊渋谷_a.jpg");
	FadeDelete("色２", 500, true);
	CreateTexture360("梨深ズーム", 100, 0, 0,"cg/ev/ev003_01_1_INT01横顔_c.png");

	Fade("梨深ズーム", 0, 0, null, false);
	Fade("梨深ズーム", 400, 1000, null, true);


	CreateColor("色２", 100, 0, 0, 1280, 720, "WHITE");

	FadeDelete("梨深ズーム" 0, false);
	CreateTexture360("拓巳ズーム", 100, 0, 0,"cg/ev/ev003_01_1_INT01横顔_b.png");

	FadeDelete("色２", 500, false);

	Fade("拓巳ズーム",500,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text021]
//画面エフェクト//舞い落ちていく光の羽
――天使？

乱舞する光の羽は、
僕を祝福しているのか、
それとも……

ああ……そうか。理解したよ。

"それ"で、僕を殺してくれるんだね――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

	CreateTexture360("梨深ズーム", 100, 0, 0,"cg/ev/ev003_01_1_INT01横顔_c.png");

	Fade("梨深ズーム", 0, 0, null, false);
	Fade("梨深ズーム", 400, 1000, null, true);

//ＣＧ//拓巳の胸に剣を突き刺しながらキスする梨深//①


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text022]
ゆっくりと、倒れている僕の前に彼女が膝をつく。

いまだに、彼女はうなだれたまま。僕の頭をそっと抱えてくる。
僕を見てくれないことに、僕はホッとして、ただ身を委ねた。

{
	CreateMovie360("ムービー１", 100, Center, Middle, false, false, "dx/mv梨深口パク.avi");
	//Request("ムービー１", Play);
}
//以下、テキスト表示なし。音声のみで。
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch01/00100050ri">
「…………」

//「ごめんなさい」と言っているつもり
//ささやきっぽく聞こえるブレス
//以上、テキスト表示なし。音声のみで。
{Request("ムービー１", Erase);}
{CreateColor("色２", 100, 0, 0, 1280, 720, "WHITE");}
耳元で、ささやき。キレイなノイズ。
でも、よく聞こえない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――



//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text023]
//ＣＧ//拓巳の胸に剣を突き刺しながらキスする梨深//②
//名前表記なし
//以下、テキスト表示なし。音声のみで。
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch01/00100060ri">
「ん……っ」

//以上、テキスト表示なし。音声のみで。
温かくて、柔らかくて、優しくて、甘美な感触。

それは麻酔のようで――
不思議なことに、身体の震えが、ゆっくりと治まっていく。
彼女のかすかな鼻息が、僕の頬をくすぐる。とても甘い匂い。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

	CreateTexture360("梨深キス", 100, Center, Middle,"cg/ev/ev004_01_1_INT01KISS_b.png");
	Fade("梨深キス", 0, 0, null, false);
	Zoom("梨深キス", 0, 500, 500, Dxl2, true);

	FadeDelete("色２", 500, false);
	
	Fade("梨深キス", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text024]
//ＣＧ//拓巳の胸に剣を突き刺しながらキスする梨深//③
ふと、胸に圧迫感を覚えた。

彼女の持っていた大きな剣が、僕の胸の皮膚を裂き、肉をえぐり、骨の間を縫い、ゆっくりと身体の中に沈み込んできている。
でも、彼女のキスという麻酔にかけられて、もう痛みを感じない。

こんなにも優しく殺してくれるから――
不意に切なくなって――
涙が溢れそうになって――

それをごまかすために、彼女の頭越しに、雨を落とし続けている鈍色の空を見上げた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

//イメージＢＧ//雨雲の空

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text025]
空が滲んでいるのは、雨のせい？　涙のせい？

もう、あの視線も感じない。

もう、なにもない。

薄れゆく意識の中で、僕は空へと手を伸ばす。

誰か、
教えて、

{	CreateBG(100,1000, 0, 0, "cg/bg/bg002_01_1_青空_a.jpg");}
僕たちのあの空は、何処へいったんだろう――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(300);//――――――――――――――――――――――――――――――

}



