//<continuation number="490">





chapter main
{

	$PreGameName = "boot_第二章";

	if($GameStart != 1)
	{
		$GameName = "ch02_043_妄想トリガー９■";
		$GameContiune = 1;
		Reset();
	}

		ch02_043_妄想トリガー９■();
}


function ch02_043_妄想トリガー９■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg000_01_1_チャットサンプル_a.jpg");
	Delete("背景引継ぎ");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);



//妄想トリガー分岐
//ポジティブ妄想→分岐１０へ
//ネガティブ妄想→分岐１１へ
//妄想しない→分岐１２へ


if($妄想トリガー通過９ == 0)
{
	SetChoice03("ポジティブ妄想","ネガティブ妄想","妄想しない");
	select
	{
		if($SYSTEM_skip||$SYSTEM_text_auto)
		{
			$SYSTEM_skip=false;
			$SYSTEM_text_auto=false;
		}
	
		case @選択肢１:
		{
			ChoiceA03();
			$妄想トリガー９ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー９ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー９ = 0;
		}
	}
}

if($妄想トリガー９ == 2)
{
//=============================================================================//
//分岐１０
//フラグ【２章エンドフラグ②】ＯＮ
	$２章エンドフラグ② = true;

//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ


	DelusionIn();


	ClearAll(0);
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg000_01_1_チャットサンプル_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	DelusionIn2();

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
と、そのとき――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("背景１", 25000, center, middle, "SCREEN");

//おがみ：ビデオロック
	XBOX360_LockVideo(true);
//徒歩：以下、MMOの画面の位置は固定
	MmoMain(0,0,"cg/sys/mmo/エンスー1.jpg");
	MmoKnight();
	Fade("MmoWindow", 0, 1000, null, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	FadeDelete("背景１", 500, true);

	Wait(500);

	Move("MmoWindow", 500, @0, @-230, Dxl1, true);

	Wait(500);

//エンスーＣＨＡＴ開始

	BGMPlay360("CH01",2000,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text002]
ナイトハルト＞二次元の世界へ行こう
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeMmo("2000");

//エンスーＣＨＡＴ終了
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
キーボードになにも打ち込んでないのに、ナイトハルトが言葉を発した。

{#TIPS_目の錯覚 = true;$TIPS_on_目の錯覚 = true;}
<FONT incolor="#88abda" outcolor="BLACK">目の錯覚</FONT>かと思って、目を擦ってみる。
でも、相変わらずチャットウインドウにはその発言が表示されたままだ。

{$TIPS_on_目の錯覚 = false;}
二次元の世界……だって？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(1000);

//エンスーＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text004]
ナイトハルト＞君も勇者になれる。一緒に戦おう
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeMmo("2000");
//エンスーＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04300010ta">
「それって……僕に言ってるの？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(1000);
//エンスーＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text006]
ナイトハルト＞三次元に興味はないんだろう？
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeMmo("2000");

//エンスーＣＨＡＴ終了
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04300020ta">
「ちょ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04300030ta">
「いや、そうだけど……」

{#TIPS_中の人 = true;$TIPS_on_中の人 = true;}
<FONT incolor="#88abda" outcolor="BLACK">中の人</FONT>であるこの僕に話しかけてくるなんて……。

{$TIPS_on_中の人 = false;}
ナイトハルトは、やっぱり意志を持ってるの？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(1000);

//エンスーＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text008]
ナイトハルト＞モニタに手を触れるんだ
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeMmo("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text009]
ナイトハルト＞それで君もバゼラードに入れる
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeMmo("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text010]
ナイトハルト＞西條拓巳としてな
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeMmo("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text011]
ナイトハルト＞合い言葉は
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeMmo("0");

//５秒ほどウエイト

	SoundPlay("SE02", 5000, 0, false);
	SetVolume360("CH*", 6000, 0, null);
	Wait(3000);


	CreateSE("SE01","SE_衝撃_衝撃音01");
	SoundPlay("SE01", 0, 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text012]
ナイトハルト＞“その目だれの目？”
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeMmo("0");
	Wait(3000);

//おがみ：実績：その目
	Eyes();
//エンスーＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04300040ta">
「……だが断る」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04300050ta">
「二次元世界に行くなら、せっかくだから僕はエロゲの世界を選ぶぜ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04300060ta">
「バゼラードはお前に任せるよ、ナイトハルト」

僕はそう答えて、ＰＣの電源を強制終了させた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 100, 0, null);

	CreateColor("フラッシュ", 10000, 0, 0, 1280, 720, "Black");
	Fade("フラッシュ", 0, 0, null, true);
	Fade("フラッシュ", 500, 1000, null, true);


	DelusionOut();

	ClearAll(0);

	CreateColor("フラッシュ", 100, 0, 0, 1280, 720, "Black");
	Fade("フラッシュ", 0, 1000, null, true);

	DelusionOut2();

	PositiveHuman();


//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
//合流４へ
}
//=============================================================================//





if($妄想トリガー９ == 1)
{
//=============================================================================//



	DelusionIn();

	ClearAll(0);

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg000_01_1_チャットサンプル_a.jpg");
	Fade("背景２", 0, 1000, null, true);

	DelusionIn2();

	Wait(500);


//分岐１１
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
と、そのとき――

{	CreateColor("フラッシュ", 100, 0, 0, 1280, 720, "White");
	CreateSE("SE02","SE_衝撃_ふらっしゅばっく");
	Fade("フラッシュ", 400, 1000, null, false);
	SoundPlay("SE02", 0, 500, false);
	Wait(1000);}
モニタがまばゆい光に包まれた。

{	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 300, 0, 1000, 100, null, "cg/data/center.png", true);}
いきなりのことに僕は不意を突かれ、目を閉じる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//おがみ：台本用
//【ナイトハルト】
//「気付いてないと思ったのか？」
	Wait(1000);
//<voice name="ナイトハルト" class="ナイトハルト" src="voice/ch02/04300070kh">
	BGMPlay360("CH01",1000,1000,true);
	SetFont("ＭＳ ゴシック", 19, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, middle, Auto, Auto, "「気付いてないと思ったのか？」");

	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	CreateVOICE("ナイトハルト","ch02/04300070kh");
	SoundPlay("ナイトハルト", 0, 1000, false);
	SetBacklog("「気付いてないと思ったのか？」", "voice/ch02/04300070kh", ナイトハルト);

	WaitAction("テキスト１", null);

	$待ち時間 = RemainTime ("ナイトハルト");
	$待ち時間 += 500;
//	WaitKey($待ち時間);
	WaitKey();

	SoundStop2("ナイトハルト");
	FadeDelete("テキスト１", 2000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text900]
声が、聞こえた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//おがみ：台本用
//【ナイトハルト】
//「いつもいつも、俺はお前の命令に従ってきたのに」
//<voice name="ナイトハルト" class="ナイトハルト" src="voice/ch02/04300080kh">
	BGMPlay360("CH01",1000,1000,true);
	SetFont("ＭＳ ゴシック", 19, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, middle, Auto, Auto, "「いつもいつも、俺はお前の命令に従ってきたのに」");

	CreateVOICE("ナイトハルト","ch02/04300080kh");
	SoundPlay("ナイトハルト", 0, 1000, false);

	SetBacklog("「いつもいつも、俺はお前の命令に従ってきたのに」", "voice/ch02/04300080kh", ナイトハルト);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	$待ち時間 = RemainTime ("ナイトハルト");
	$待ち時間 += 500;
//	WaitKey($待ち時間);
	WaitKey();

	SoundStop2("ナイトハルト");

	FadeDelete("テキスト１", 2000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text901]
その声は、モニタの方から聞こえてくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	Wait(300);
//おがみ：台本用
//【ナイトハルト】
//「俺の中の人が、ここまでバカだとは思わなかったぜ」
//<voice name="ナイトハルト" class="ナイトハルト" src="voice/ch02/04300090kh">
	BGMPlay360("CH01",1000,1000,true);
	SetFont("ＭＳ ゴシック", 19, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, middle, Auto, Auto, "「俺の中の人が、ここまでバカだとは思わなかったぜ」");

	CreateVOICE("ナイトハルト","ch02/04300090kh");
	SoundPlay("ナイトハルト", 0, 1000, false);

	SetBacklog("「俺の中の人が、ここまでバカだとは思わなかったぜ」", "voice/ch02/04300090kh", ナイトハルト);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	$待ち時間 = RemainTime ("ナイトハルト");
	$待ち時間 += 500;
//	WaitKey($待ち時間);
	WaitKey();

	SoundStop2("ナイトハルト");

	FadeDelete("テキスト１", 2000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text902]
――お前は、誰だ！？

{	DrawTransition("色１", 300, 1000, 0, 100, null, "cg/data/center.png", true);}
目を開けてみる。
でもさっきの光のせいで麻痺しちゃっている。
なにも見えない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//おがみ：台本用
//【ナイトハルト】
//「もういい。俺はお前を捨てる」
	Wait(300);
//<voice name="ナイトハルト" class="ナイトハルト" src="voice/ch02/04300100kh">
	SetFont("ＭＳ ゴシック", 19, #000000, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, middle, Auto, Auto, "「もういい。俺はお前を捨てる」");

	CreateVOICE("ナイトハルト","ch02/04300100kh");
	SoundPlay("ナイトハルト", 0, 1000, false);

	SetBacklog("「もういい。俺はお前を捨てる」", "voice/ch02/04300100kh", ナイトハルト);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	$待ち時間 = RemainTime ("ナイトハルト");
	$待ち時間 += 500;
	WaitKey($待ち時間);

	SoundStop2("ナイトハルト");

	WaitKey();

	FadeDelete("テキスト１", 2000, false);

//おがみ：台本用
//【ナイトハルト】
//「これからは自由に生きる」
	Wait(800);
//<voice name="ナイトハルト" class="ナイトハルト" src="voice/ch02/04300110kh">
	SetFont("ＭＳ ゴシック", 19, #000000, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, middle, Auto, Auto, "「これからは自由に生きる」");

	CreateVOICE("ナイトハルト","ch02/04300110kh");
	SoundPlay("ナイトハルト", 0, 1000, false);

	SetBacklog("「これからは自由に生きる」", "voice/ch02/04300110kh", ナイトハルト);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	$待ち時間 = RemainTime ("ナイトハルト");
	$待ち時間 += 500;
//	WaitKey($待ち時間);
	WaitKey();

	SoundStop2("ナイトハルト");

	FadeDelete("テキスト１", 2000, false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text903]
まさか、ナイトハルトなの……？
ぼ、僕を捨てるってどういうこと！？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


//おがみ：台本用
//【ナイトハルト】
//「そのままの意味だ。だからお前はバカなんだ」
	Wait(300);
<voice name="ナイトハルト" class="ナイトハルト" src="voice/ch02/04300120kh">
	SetFont("ＭＳ ゴシック", 19, #000000, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, middle, Auto, Auto, "「そのままの意味だ。だからお前はバカなんだ」");

	CreateVOICE("ナイトハルト","ch02/04300120kh");
	SoundPlay("ナイトハルト", 0, 1000, false);

	SetBacklog("「そのままの意味だ。だからお前はバカなんだ」", "voice/ch02/04300120kh", ナイトハルト);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	$待ち時間 = RemainTime ("ナイトハルト");
	$待ち時間 += 500;
//	WaitKey($待ち時間);
	WaitKey();

	SoundStop2("ナイトハルト");

	FadeDelete("テキスト１", 2000, false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text904]
お前は僕の作ったキャラだぞ！
僕に反乱を起こすのか！？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//おがみ：台本用
//【ナイトハルト】
//「そうだ。もううんざりだ」
	Wait(300);
//<voice name="ナイトハルト" class="ナイトハルト" src="voice/ch02/04300130kh">
	SetFont("ＭＳ ゴシック", 19, #000000, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, middle, Auto, Auto, "「そうだ。もううんざりだ」");

	CreateVOICE("ナイトハルト","ch02/04300130kh");
	SoundPlay("ナイトハルト", 0, 1000, false);

	SetBacklog("「そうだ。もううんざりだ」", "voice/ch02/04300130kh", ナイトハルト);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	$待ち時間 = RemainTime ("ナイトハルト");
	$待ち時間 += 500;
//	WaitKey($待ち時間);
	WaitKey();

	SoundStop2("ナイトハルト");

	FadeDelete("テキスト１", 2000, false);

//おがみ：台本用
//【ナイトハルト】
//「なにが“疾風迅雷”だ。中２病にもほどがあるだろう」
	Wait(300);
//<voice name="ナイトハルト" class="ナイトハルト" src="voice/ch02/04300140kh">
	SetFont("ＭＳ ゴシック", 19, #000000, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, middle, Auto, Auto, "「なにが“疾風迅雷”だ。中２病にもほどがあるだろう」");

	CreateVOICE("ナイトハルト","ch02/04300140kh");
	SoundPlay("ナイトハルト", 0, 1000, false);

	SetBacklog("「なにが“疾風迅雷”だ。中２病にもほどがあるだろう」", "voice/ch02/04300140kh", ナイトハルト);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	$待ち時間 = RemainTime ("ナイトハルト");
	$待ち時間 += 500;
//	WaitKey($待ち時間);
	WaitKey();

	SoundStop2("ナイトハルト");

	FadeDelete("テキスト１", 2000, false);

//おがみ：台本用
//【ナイトハルト】
//「お前に分かるか？　俺がどんな気持ちでそう呼ばれていたか」
	Wait(500);
//<voice name="ナイトハルト" class="ナイトハルト" src="voice/ch02/04300150kh">
	SetFont("ＭＳ ゴシック", 19, #000000, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, middle, Auto, Auto, "「お前に分かるか？　俺がどんな気持ちでそう呼ばれていたか」");

	CreateVOICE("ナイトハルト","ch02/04300150kh");
	SoundPlay("ナイトハルト", 0, 1000, false);

	SetBacklog("「お前に分かるか？　俺がどんな気持ちでそう呼ばれていたか」", "voice/ch02/04300150kh", ナイトハルト);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	$待ち時間 = RemainTime ("ナイトハルト");
	$待ち時間 += 500;
//	WaitKey($待ち時間);
	WaitKey();

	SoundStop2("ナイトハルト");

	FadeDelete("テキスト１", 2000, false);

//おがみ：台本用
//【ナイトハルト】
//「お前はかっこいいつもりだったかもしれないがな」
	Wait(500);
//<voice name="ナイトハルト" class="ナイトハルト" src="voice/ch02/04300160kh">
	BGMPlay360("CH01",1000,1000,true);
	SetFont("ＭＳ ゴシック", 19, #000000, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, middle, Auto, Auto, "「お前はかっこいいつもりだったかもしれないがな」");

	CreateVOICE("ナイトハルト","ch02/04300160kh");
	SoundPlay("ナイトハルト", 0, 1000, false);

	SetBacklog("「お前はかっこいいつもりだったかもしれないがな」", "voice/ch02/04300160kh", ナイトハルト);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	$待ち時間 = RemainTime ("ナイトハルト");
	$待ち時間 += 500;
//	WaitKey($待ち時間);
	WaitKey();

	SoundStop2("ナイトハルト");

	FadeDelete("テキスト１", 2000, false);

//おがみ：台本用
//【ナイトハルト】
//「俺からすれば恥ずかしいだけなんだよ」
	Wait(500);
//<voice name="ナイトハルト" class="ナイトハルト" src="voice/ch02/04300170kh">
	SetFont("ＭＳ ゴシック", 19, #000000, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, middle, Auto, Auto, "「俺からすれば恥ずかしいだけなんだよ」");

	CreateVOICE("ナイトハルト","ch02/04300170kh");
	SoundPlay("ナイトハルト", 0, 1000, false);

	SetBacklog("「俺からすれば恥ずかしいだけなんだよ」", "voice/ch02/04300170kh", ナイトハルト);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	$待ち時間 = RemainTime ("ナイトハルト");
	$待ち時間 += 500;
//	WaitKey($待ち時間);
	WaitKey();

	SoundStop2("ナイトハルト");

	FadeDelete("テキスト１", 2000, false);

//おがみ：台本用
//【ナイトハルト】
//「でも俺は自分の言葉を発することもできず、じっと耐えるしかなかったんだ」
	Wait(500);
//<voice name="ナイトハルト" class="ナイトハルト" src="voice/ch02/04300180kh">
	SetFont("ＭＳ ゴシック", 19, #000000, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, middle, Auto, Auto, "「でも俺は自分の言葉を発することもできず、<BR>　じっと耐えるしかなかったんだ」");

	CreateVOICE("ナイトハルト","ch02/04300180kh");
	SoundPlay("ナイトハルト", 0, 1000, false);

	SetBacklog("「でも俺は自分の言葉を発することもできず、じっと耐えるしかなかったんだ」", "voice/ch02/04300180kh", ナイトハルト);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	$待ち時間 = RemainTime ("ナイトハルト");
	$待ち時間 += 500;
//	WaitKey($待ち時間);
	WaitKey();

	SoundStop2("ナイトハルト");

	FadeDelete("テキスト１", 2000, false);
	Wait(800);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text905]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04300190ta">
「う、う、うるさい！　な、生意気だぞ！
　そんなこと言うなら、け、消すぞ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//おがみ：台本用
//【ナイトハルト】
//「勝手にしろ……」
	Wait(300);
//<voice name="ナイトハルト" class="ナイトハルト" src="voice/ch02/04300200kh">
	SetFont("ＭＳ ゴシック", 19, #000000, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, middle, Auto, Auto, "「勝手にしろ……」");

	CreateVOICE("ナイトハルト","ch02/04300200kh");
	SoundPlay("ナイトハルト", 0, 1000, false);

	SetBacklog("「勝手にしろ……」", "voice/ch02/04300200kh", ナイトハルト);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	$待ち時間 = RemainTime ("ナイトハルト");
	$待ち時間 += 500;
//	WaitKey($待ち時間);
	WaitKey();

	SoundStop2("ナイトハルト");

	FadeDelete("テキスト１", 2000, false);

//おがみ：台本用
//【ナイトハルト】
//「だがな、これだけは覚えておけ」
	Wait(600);
//<voice name="ナイトハルト" class="ナイトハルト" src="voice/ch02/04300210kh">
	SetFont("ＭＳ ゴシック", 19, #000000, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, middle, Auto, Auto, "「だがな、これだけは覚えておけ」");

	CreateVOICE("ナイトハルト","ch02/04300210kh");
	SoundPlay("ナイトハルト", 0, 1000, false);

	SetBacklog("「だがな、これだけは覚えておけ」", "voice/ch02/04300210kh", ナイトハルト);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	$待ち時間 = RemainTime ("ナイトハルト");
	$待ち時間 += 500;
//	WaitKey($待ち時間);
	WaitKey();

	SoundStop2("ナイトハルト");

	FadeDelete("テキスト１", 2000, false);

//おがみ：台本用
//【ナイトハルト】
//「お前が俺をボタンひとつで消せるように――」
	Wait(800);
//<voice name="ナイトハルト" class="ナイトハルト" src="voice/ch02/04300220kh">
	SetFont("ＭＳ ゴシック", 19, #000000, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, middle, Auto, Auto, "「お前が俺をボタンひとつで消せるように――」");

	CreateVOICE("ナイトハルト","ch02/04300220kh");
	SoundPlay("ナイトハルト", 0, 1000, false);

	SetBacklog("「お前が俺をボタンひとつで消せるように――」", "voice/ch02/04300220kh", ナイトハルト);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	$待ち時間 = RemainTime ("ナイトハルト");
	$待ち時間 += 500;
//	WaitKey($待ち時間);
	WaitKey();

	SoundStop2("ナイトハルト");

	FadeDelete("テキスト１", 2000, false);

//おがみ：台本用
//【ナイトハルト】
//「お前も、お前の中の人にボタンひとつで消される程度の存在なんだと」
	Wait(800);
//<voice name="ナイトハルト" class="ナイトハルト" src="voice/ch02/04300230kh">
	SetFont("ＭＳ ゴシック", 19, #000000, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, middle, Auto, Auto, "「お前も、お前の中の人に<BR>　ボタンひとつで消される程度の存在なんだと」");

	CreateVOICE("ナイトハルト","ch02/04300230kh");
	SoundPlay("ナイトハルト", 0, 1000, false);

	SetBacklog("「お前も、お前の中の人にボタンひとつで消される程度の存在なんだと」", "voice/ch02/04300230kh", ナイトハルト);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	$待ち時間 = RemainTime ("ナイトハルト");
	$待ち時間 += 500;
//	WaitKey($待ち時間);
	WaitKey();

	SoundStop2("ナイトハルト");

	FadeDelete("テキスト１", 2000, false);
	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text906]
な、なにを言ってるｎ
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//※ここはクリック待ちなしで強制進行
//※わざと「言ってるｎ」です。

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
	SetVolume360("CH*", 100, 0, null);

	DelusionOut();

	ClearAll(0);
	CreateColor("フラッシュ", 100, 0, 0, 1280, 720, "Black");
	Fade("フラッシュ", 0, 1000, null, true);

	CreateSE("SE02","SE_日常_PC_はーどでぃすく_LOOP");
	SoundPlay("SE02", 2000, 500, true);

	CreateMovie360("ナイトハルト", 100, Center, Middle, true, false, "dx/mvNH01.avi");	
	Fade("ナイトハルト", 0, 1000, null, true);

	DelusionOut2();
	NegativeHuman();

//ＢＧ//拓巳の部屋


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04300240ta">
「……ま、実際にはそんなことあるわけないけどね」

僕は自分の妄想に苦笑し、相変わらずバゼラード世界で一言も発せずに立ち尽くしているナイトハルトを眺めた。

……今日はいつもより無茶させないようにしようかな。

そんなことを思いながら、僕はプレイを開始した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE*", 2000, 0, false);
	Fade("ナイトハルト", 2000, 0, null, true);
	Delete("ナイトハルト");
//～～Ｆ・Ｏ
//合流４へ

}
//=============================================================================//






if($妄想トリガー９ == 0)
{
//=============================================================================//
//分岐１２

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
と、そのとき――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	BGMPlay360("CH13",3000,1000,true);

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	CreateMovie360("ナイトハルト", 100, Center, Middle, true, false, "dx/mvNH01.avi");	
	Fade("ナイトハルト", 0, 0, null, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Fade("ナイトハルト", 3000, 1000, null, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601017]
キーボードに触れていないにもかかわらず、それまで背中を向けて棒立ちしていたナイトハルトの顔だけが、

{	Fade("色１", 0, 1000, null, true);
	Wait(500);}
突然、
こちらへ振り返った――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Wait(1000);
	SetVolume360("CH*", 100, 0, null);
	Fade("色１", 0, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602017]
ような気がしたｗｗｗ

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04300250ta">
「なんつって。ふひひ」

結局その後１時間以上、ボケーッとモニタを眺めていたけど、ナイトハルトは延々とその場に立ち続けているだけだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 2000, 0, null);

	SoundPlay("SE*", 2000, 0, true);

	Fade("色１", 2000, 1000, null, true);

//～～Ｆ・Ｏ
//合流４へ

}
//=============================================================================//




//=============================================================================//
//合流４
//ＢＧ//ビックリカメラ渋谷ハチ公口店１Ｆ店頭//昼
//１０月１０日（金）//日付は表示しない
//ビックリカメラ＝ビックカメラ
//携帯電話コーナー


	ClearAll(0);

	Wait(1000);

	CreateSE("SE02","SE_日常_雑踏01");
	MusicStart("SE02", 2000, 500, 0, 1000, null, true);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg078_01_1_ビックリカメラ携帯売場_a.jpg");
	Fade("背景１", 0, 0, null, true);
	Fade("背景１", 2000, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
……あ、ありのまま今起こったことを話すぜ！

“僕は今日しょうがなく学校に行ったと思ったらいつの間にか放課後に妹とケータイを買いに来ていた”

な、なにを言っているか分からないと思うが、僕もなにをされたのか分からなかった……。

{	MusicStart("@SE*", 500, 0, 0, 0, null, false);
	Wait(500);}
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04300260na">
「おにぃ？　なにブツブツ言ってんの？」

{	Wait(500);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04300270ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH08",0,1000,true);
	Wait(1000);
	Stand("bu七海_制服_通常","normal", 200, @100);
	FadeStand("bu七海_制服_通常_normal", 500, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601018]
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04300280na">
「それよりほら、この機種はどうかって聞いてるんだけど」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04300290ta">
「…………」

早く帰りたい……。
そもそもケータイなんて必要ないって、何度言ったらこのバカ妹は理解してくれるんだ。

今日、学校に行ったら七海が僕の教室にまで攻めてきた。“学校来てるなんて珍しい！”とのたまった後、今日こそケータイを買いに行くんだと命令してきた。

放課後になって、見つからないうちに逃げようとしたんだけど、妹が足だけはやたら速いことを忘れてしまっていた。

で、追いかけっこをした挙げ句にあっさり追いつかれ、こうして駅前まで連れてこられてしまったというわけ。

駅前にはあんまり来たくない。いつもそう思う。
今も、すでに吐き気がこみ上げてきていた。

七海はそんな僕の気持ちも知らず、店頭で何種類もの展示用サンプルを手に取ってはうなっている。

どうして僕のケータイを買うのに七海が悩むのか、理解に苦しむ。

{	Stand("bu七海_制服_通常","smile", 200, @100);
	FadeStand("bu七海_制服_通常_smile", 300, true);
	DeleteStand("bu七海_制服_通常_normal", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04300300na">
「これ、色がけっこうかわいいじゃん？　いいと思うなあ」

意見を求めてくるから、僕は当然のように答える。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04300310ta">
「それ……で、いい……」

{	Stand("bu七海_制服_通常","pride", 200, @100);
	FadeStand("bu七海_制服_通常_pride", 300, true);
	DeleteStand("bu七海_制服_通常_smile", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04300320na">
「うーん、でもなー。おにぃにはちょっとかわいすぎかも。似合わなさそう」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04300330ta">
「…………」

僕はそれでいいって言っているにもかかわらず、これだ。
もう何度“それでいい”って言ったか分からない。

僕に意見を求めてるくせに、その意見を聞くつもりはないんだ。これだから三次元女は最悪なんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu七海_制服_通常","shock", 200, @100);
	FadeStand("bu七海_制服_通常_shock", 300, true);
	DeleteStand("bu七海_制服_通常_pride", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
//◆心配そう
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04300340na">
「おにぃ、だいじょぶ？　やっぱり人の多さにやられちゃった……？」

//◆心配そう
//◆マクディ＝マクドナルド
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04300350na">
「マクディで休もっか？」

マクディだって！？
あのＤＱＮのたまり場であるファーストフード店に入るって言うのか！？
それこそ地獄だ！

僕はブンブンと首を激しく振った。

{	Stand("bu七海_制服_通常","smile", 200, @100);
	FadeStand("bu七海_制服_通常_smile", 300, true);
	DeleteStand("bu七海_制服_通常_shock", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04300360na">
「そっか。じゃ、なるべく早めに決めるね。でもちょっと迷っちゃっててさ」

{	DeleteStand("bu七海_制服_通常_smile", 500, false);}
僕はため息をつくと、七海を置いてひとりで帰ることにした。七海がずらっと並べられたケータイの数々を真剣な顔で吟味している隙に、こっそりその場を離れる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 2000, 0, null);

	Wait(1000);

	CreateSE("SE02","SE_日常_雑踏01");
	SoundPlay("SE02", 2000, 1000, true);

//ＢＧ//１０７前
	CreateTextureEX("背景２", 100, 0, -512, "cg/bg/bg009_01_1_107_a.jpg");
	Fade("背景２", 1000, 1000, null, true);
	CreateTextureEX("１０７追加", 100, 0, 0, "cg/bg/bg009_02_1_107_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
１０７の方へ目を向けて歩き出そうとしたとき、そこに異様な光景を見つけて、僕は思わず立ち止まった。

なんだ、あれ……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＧ//ディソードを持って人混みの中にたたずむセナ
	Move("背景２", 2000, @0, @-320, AxlDxl, true);
	Wait(500);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601020]
たくさんの人混みの向こう。
１０７の階段のところに、やけに目立つ女が立っていたんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("１０７追加", 1000, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602020]
//※剣は青く発光しています
//※リアルブート前（ギガロマニアックスにしか見えない状態）→青く発光、リアルブート後（一般人にも見える状態）→赤く発光
手にしているのは……剣……なのかな？

なんとなく、色や雰囲気が、ＦＥＳがライブで持っていたマイクスタンドと似ている。
むしろ同系統のものと考えるのが妥当だよね。

それにしても、デカい剣だ。
ＦＥＳの持っていたものよりさらに長いかもしれない。

剣を持っている女の方は、驚いたことに翠明の制服を着ていた。

この距離からじゃどんな顔をしているかよく判別できないけど、あんな目立つものを持ちながら、女は悠然とした態度で階段から下の道を歩く人々を眺めていた。

すごい勇気だなあ。
本気で感心しちゃったよ。

この渋谷のど真ん中を、巨大な剣の玩具を持って歩くなんて。どんな羞恥プレイだよ。

あの剣って、新作アニメコスの小道具かなにかなんだろうか。

新作アニメは僕も一応全部チェックしてるんだけどなあ。あんな剣が出てくる作品、あったっけ？　チェック漏れ？

さすがに渋谷をあれを持って歩くのは僕には無理だけど、剣の造形はけっこうかっこいい。あれはちょっと欲しいかもしれない。

アキバに行けば売ってるのかな。
通販やってるかなあ。

{	SoundPlay("SE*", 200, 0, false);
	SetVolume360("CH*", 200, 0, null);}
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04300370na">
「お・にぃ！」

{	Delete("背景２");
	Fade("１０７追加", 10, 0, null, true);
	CreateSE("SE01","SE_衝撃_顔面蹴られる");
	CreateSE("SE02","SE_衝撃_肩にぶつかる");
	SoundPlay("SE01", 0, 1000, false);
	SoundPlay("SE02", 0, 1000, false);
	Shake("背景１", 500, 0, 10, 0, 0, 500, null, false);
	Wait(500);}
いきなり背中に肘打ちが食い込んだ。
悶絶してその場にくずおれそうになる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);
	Delete("１０７追加");

//ＢＧ//ビックリカメラ渋谷ハチ公口店１Ｆ店頭//昼

	BGMPlay360("CH08",0,1000,true);

	Stand("bu七海_制服_通常","angry", 200, @100);
	FadeStand("bu七海_制服_通常_angry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text021]
振り返ると、七海がムッとした表情のまま仁王立ちしていた。

//【七海】
<voice name="七海" class="七海" src="voice/ch02/04300380na">
「もしかして、逃げようとした？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04300390ta">
「う……」

{	Stand("bu七海_制服_拗ね","angry", 200, @100);
	FadeStand("bu七海_制服_拗ね_angry", 500, false);
	DeleteStand("bu七海_制服_通常_angry", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04300400na">
「確かにナナが選ぶのに時間かけ過ぎたのは悪いと思うけどさ……」

{	Stand("bu七海_制服_拗ね","sad", 200, @100);
	FadeStand("bu七海_制服_拗ね_sad", 300, true);
	DeleteStand("bu七海_制服_拗ね_angry", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04300410na">
「だからって、ナナを置き去りにして
逃げようとするなんてひどいよっ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04300420ta">
「…………」

一応、首を左右に振っておいた。

{	Stand("bu七海_制服_キレ","mad", 200, @100);
	FadeStand("bu七海_制服_キレ_mad", 500, false);
	DeleteStand("bu七海_制服_拗ね_sad", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04300430na">
{#TIPS_電磁波 = true;$TIPS_on_電磁波 = true;}「おにぃのバカ！　ケータイの<FONT incolor="#88abda" outcolor="BLACK">電磁波</FONT>の浴びすぎで腎臓悪くして死んじゃえ！」

{$TIPS_on_電磁波 = false;}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04300440ta">
「…………」

意味分からん……。

{	Stand("bu七海_制服_拗ね","sad", 200, @100);
	FadeStand("bu七海_制服_拗ね_sad", 500, false);
	DeleteStand("bu七海_制服_キレ_mad", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04300450na">
「一生懸命おにぃのために選んであげてたナナがバカみたいじゃん」

{	Stand("bu七海_制服_通常","angry", 200, @100);
	FadeStand("bu七海_制服_通常_angry", 500, false);
	DeleteStand("bu七海_制服_拗ね_sad", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04300460na">
「こーなったらもう適当に決める！　おにぃなんて、ナナと同じ機種でじゅうぶんだよっ」

{	CreateSE("SE02","SE_じん体_動作_のぞく");
	SoundPlay("SE02", 0, 1000, false);
	DeleteStand("bu七海_制服_通常_angry", 500, false);}
七海は僕の腕を強引につかんだ。

//【七海】
<voice name="七海" class="七海" src="voice/ch02/04300470na">
「本気で今日契約するんだからね！
それまでぜーったい、逃がさない！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04300480ta">
「わ、分かったよ……離せよ……」

//【七海】
<voice name="七海" class="七海" src="voice/ch02/04300490na">
「分かったならさっさと来て」

なんで七海がここまでムキになっているのか、さっぱり分からない。ホント、ウザい妹だよ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("フラッシュ", 100, 0, 0, 1280, 720, "Black");
	DrawTransition("フラッシュ", 1000, 0, 1000, 100, null, "cg/data/light.png", true);

	SetVolume360("CH*", 2000, 0, null);

	Wait(2000);

//～～Ｆ・Ｏ

}

