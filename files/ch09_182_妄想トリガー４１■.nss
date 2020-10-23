//<continuation number="120">




chapter main
{

	$PreGameName = "boot_第九章";

	if($GameStart != 1)
	{
		$GameName = "ch09_182_妄想トリガー４１■";
		$GameContiune = 1;
		Reset();
	}

		ch09_182_妄想トリガー４１■();
}


function ch09_182_妄想トリガー４１■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();




//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateBG(100, 0, 0, 0, "cg/bg/bg196_01_3_山手通り_a.jpg");
	CreateSE("SE01","SE_はいけい_しぶ谷えき_LOOP");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	MusicStart("SE01", 2000, 800, 0, 1000, null, true);

//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐４へ
//ネガティブ妄想→分岐５へ
//妄想しない→分岐６へ

if($妄想トリガー通過４１ == 0)
{
	SetChoice03("ポジティブ想","ネガティブ妄想","妄想しない");
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
			$妄想トリガー４１ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー４１ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー４１ = 0;
		}
	}
}


//=============================================================================//

if($妄想トリガー４１ == 2)
{
//☆☆☆
//分岐４

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
僕は、自分の足を、一歩、前へと踏み出した。

……踏み出した、つもりだった。

でも、足はピクリとも動いていなかった。
動いてくれなかった。
気が付けば、膝が震えていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18200010ta">
「う、ううう……」

勇気が、出ない。
こんなにも死にたいのに。
死ぬことの恐怖が、僕に一歩進むことを肯定してくれない。

死にたいのは、僕。
死を恐れるのも、僕。

訳が分からなくなる。
自分の気持ちを把握できなくなる。

僕は、
死にたいのか。
生きたいのか。

どっちなんだ……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18200020ta">
「死……にたい……」

{	CreateColor("back10", 200, 0, 0, 1280, 720, "Black");
	Fade("back10", 0, 0, null, false);
	Fade("back10", 500, 1000, null, false);}
歯を食いしばり。
目を閉じ。
“死にたい”と心の中で連呼する。

{	Fade("back10", 500, 0, null, true);
	Delete("back10");}
でも、やっぱり、足は動かなくて。
ものすごい速さで通り過ぎていく車。その鋼鉄の凶器に轢き殺される光景が脳裏に浮かび、身がすくんで。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18200030ta">
「死にたい……のに……」

結局、ヘナヘナとその場でへたり込む。

この期に及んでも自分がヘタレで、甘えたガキであるって、思い知らされる。

どうせなら、今こうして歩道でしゃがみ込んでいる僕のところに、スリップした車が突っ込んできてくれないだろうかなんて、都合のいいことを考えてしまう。

不可抗力で死ねたら、どんなに楽だろう――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	PositiveHuman();

	SetVolume("SE01", 1000, 0, NULL);

	Wait(1000);

//～～Ｆ・Ｏ
//合流２へ
}


//=============================================================================//

if($妄想トリガー４１ == 1)
{
//☆☆☆
//分岐５

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
僕は重い足を前へと踏み出す。

信号のないこの場所。
フラフラと、車道へ。
そこに救いが待っている気がして。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_擬音_クラクションとスキール音");
	MusicStart("SE03", 1000, 1000, 0, 1000, null, false);
	CreateColor("back03", 100, 0, 0, 1280, 720, "White");
	DrawTransition("back03", 500, 0, 1000, 100, Axl3, "cg/data/爆発.png", true);
//ＳＥ//車のクラクション

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
ライトのまばゆい光。
つんざくばかりのクラクションノイズ。
不安感を与えるスキール音。

さあ、殺せ。
このニセモノの僕を。
醜い化け物を。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Wait(1000);

	SetVolume("SE01", 0, 0, NULL);
	SetVolume("SE03", 0, 0, NULL);

//ＳＥ//車に轢かれる
	CreateSE("SE04","SE_衝撃_どあに激突");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

//ＢＧ//赤
	CreateColor("back04", 100, 0, 0, 1280, 720, "Red");
	DrawTransition("back04", 300, 0, 1000, 100, Dxl3, "cg/data/ランダム.png", true);

	Delete("back03");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
腰に強い衝撃――

身体を持って行かれる。
ボンネットに乗り上げ。

激痛――

側頭部に硬いなにかが激突し。
視界がブラックアウト。
骨が砕ける音が頭の中に響く。

水の中にいるかのように、息ができず。
跳ね飛ばされる。
転がる。

手足がのたうち回る。
痛みが神経を焼き切ってしまいそう。

ああ、これで、死ねる――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
//ＢＧ//山手通り//夜

	DelusionOut();

	Delete("*");

	CreateBG(100, 0, 0, 0, "cg/bg/bg196_01_3_山手通り_a.jpg");

	DelusionOut2();

	CreateSE("SE01","SE_はいけい_しぶ谷えき_LOOP");
	MusicStart("SE01", 0, 800, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
目を開けると、僕は歩道に立っていた。
たった今、自分が轢かれた車道が目の前にある。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18200040ta">
「…………」

自分の身体を見てみる。
どこにも傷がない。血も出てない。痛みも感じない。

幽霊にでもなったのかと思った。思いたかった。

でも、それなら車道に自分の死体が倒れているはずだ。

そんな光景はどこにもない。僕を轢いた車も存在していない。

妄想だった……？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18200050ta">
「くそぅ、くそぅ、くそぅ……」

僕は、死にたいアピールをして同情を誘いたいわけじゃない。
本気で、死にたいんだ……。

今度こそ救いを求め、車道に飛び出した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_擬音_クラクションとスキール音");
	MusicStart("SE03", 2000, 700, 0, 1000, null, false);
	CreateColor("back03", 100, 0, 0, 1280, 720, "White");
	DrawTransition("back03", 500, 0, 1000, 100, Axl3, "cg/data/爆発.png", true);

//ＳＥ//車のクラクション

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
ライトのまばゆい光。
つんざくばかりのクラクションノイズ。
不安感を与えるスキール音。

さあ、殺せ。
このニセモノの僕を。
醜い化け物を。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//車に轢かれる
//ＢＧ//赤

	SetVolume("SE03", 1000, 1000, NULL);

	Wait(1000);

	SetVolume("SE03", 0, 0, NULL);

	CreateSE("SE04","SE_衝撃_どあに激突");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	CreateColor("back04", 100, 0, 0, 1280, 720, "Red");
	DrawTransition("back04", 300, 0, 1000, 100, Dxl3, "cg/data/ランダム.png", true);

	Delete("back03");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
腰に強い衝撃――

身体を持って行かれる。
ボンネットに乗り上げ。

激痛――

側頭部に硬いなにかが激突し。
視界がブラックアウト。
骨が砕ける音が頭の中に響く。

水の中にいるかのように、息ができず。
跳ね飛ばされる。
転がる。

手足がのたうち回る。
痛みが神経を焼き切ってしまいそう。

ああ、これで、死ねる――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
//ＢＧ//山手通り//夜

	DelusionOut();

	Delete("*");

	CreateBG(100, 0, 0, 0, "cg/bg/bg196_01_3_山手通り_a.jpg");

	DelusionOut2();

	CreateSE("SE01","SE_はいけい_しぶ谷えき_LOOP");
	MusicStart("SE01", 500, 800, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
ハッとして目を開けると、僕は、

また、

歩道に立っていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18200060ta">
「なんで……」

なんでいちいち妄想に逃げるんだ。僕は……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18200070ta">
「ああああぁっ」

震える声で、悲鳴に近い叫びを上げ。
再度、車道に転がり出る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_擬音_クラクションとスキール音");
	MusicStart("SE03", 2000, 700, 0, 1000, null, false);
	CreateColor("back03", 100, 0, 0, 1280, 720, "White");
	DrawTransition("back03", 500, 0, 1000, 100, Axl3, "cg/data/爆発.png", true);
//ＳＥ//車のクラクション

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
ライトのまばゆい光。
つんざくばかりのクラクションノイズ。
不安感を与えるスキール音。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Wait(1000);
	SetVolume("SE03", 0, 0, NULL);
	CreateSE("SE04","SE_衝撃_どあに激突");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	CreateColor("back04", 100, 0, 0, 1280, 720, "Red");
	DrawTransition("back04", 300, 0, 1000, 100, Dxl3, "cg/data/ランダム.png", true);
	Delete("back03");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602006]
//ＳＥ//車に轢かれる
//ＢＧ//赤
今度こそ、死なせて――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
//ＢＧ//山手通り//夜

	DelusionOut();

	Delete("*");

	CreateBG(100, 0, 0, 0, "cg/bg/bg196_01_3_山手通り_a.jpg");

	DelusionOut2();

	CreateSE("SE01","SE_はいけい_しぶ谷えき_LOOP");
	MusicStart("SE01", 500, 800, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18200080ta">
「…………」

なにも、変わらなかった。

気が狂いそうになる。
僕は、実は死にたくないの……？
それとも、すでに死んでいて、今見ているのは夢？

脳だけが、死の間際に超感覚を獲得して、１秒にも満たない時間の中で最後にこの幻覚を見せているとか？

//※あえてスペース入れてます
そ　ん　な　わ　け　あ　る　か。

ほとんど自棄になって、また車道に出ようとした。

でも――

足が、震えていた。
その場から、動けなくなった。

３回繰り返した、死の場面の妄想。
そこで想像した痛みだけが、リアルさを伴って僕の心に押し寄せ、恐怖をかき立てる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18200090ta">
「う、ううう……」

訳が分からなくなる。
自分の気持ちを把握できなくなる。

僕は、
死にたいのか。
生きたいのか。

どっちなんだ……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18200100ta">
「死……にたい……」

歯を食いしばり。
目を閉じ。
“死にたい”と心の中で連呼する。

そうすることで、ようやく足が前へと進み出た。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_擬音_クラクションとスキール音");
	MusicStart("SE03", 2000, 700, 0, 1000, null, false);
	CreateColor("back03", 100, 0, 0, 1280, 720, "White");
	DrawTransition("back03", 500, 0, 1000, 100, Axl3, "cg/data/爆発.png", true);
//ＳＥ//車のクラクション

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
ヘッドライトが僕を照らしているのが、目を閉じていても分かる。
クラクションが耳をつんざく。
スキール音がものすごい勢いで近づいてくる。

頼むから、轢き殺してくれ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//車に轢かれる
//ＢＧ//赤

	SetVolume("SE03", 1000, 1000, NULL);

	Wait(1000);

	SetVolume("SE03", 0, 0, NULL);

	CreateSE("SE04","SE_衝撃_どあに激突");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	CreateColor("back04", 100, 0, 0, 1280, 720, "Red");
	DrawTransition("back04", 300, 0, 1000, 100, Dxl3, "cg/data/ランダム.png", true);

	Delete("back03");


//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
//ＢＧ//山手通り//夜

	DelusionOut();

	Delete("*");

	CreateBG(100, 0, 0, 0, "cg/bg/bg196_01_3_山手通り_a.jpg");

	DelusionOut2();

	CreateSE("SE01","SE_はいけい_しぶ谷えき_LOOP");
	MusicStart("SE01", 500, 800, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
僕の望みは、あっさりと否定された。

僕は五体満足で、歩道に立ち尽くしている。

どうして――

その場に、泣き崩れた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18200110ta">
「どうして、僕は、僕を、死なせてくれないんだ……」

生きたくなんてないのに。
救われたいのに。

もう、このクソゲーから解放してよ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	NegativeHuman();

	SetVolume("SE01", 1000, 0, NULL);

	Wait(1000);

//～～Ｆ・Ｏ
//合流２へ
}


//=============================================================================//

if($妄想トリガー４１ == 0)
{
//☆☆☆
//分岐６

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
僕は重い足を前へと踏み出す。

信号のないこの場所。
フラフラと、車道へ。
そこに救いが待っている気がして。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_擬音_クラクションとスキール音");
	MusicStart("SE03", 2000, 700, 0, 1000, null, true);
	CreateColor("back03", 100, 0, 0, 1280, 720, "White");
	DrawTransition("back03", 500, 0, 1000, 100, Axl3, "cg/data/爆発.png", true);
//ＳＥ//車のクラクション
//ＳＥ//急ブレーキする車

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
ライトのまばゆい光。
つんざくばかりのクラクションノイズ。
不安感を与えるスキール音。

さあ、殺せ。
このニセモノの僕を。
醜い化け物を。

殺してくれ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume("SE03", 0, 0, NULL);
	SetVolume("SE01", 0, 0, NULL);
//ＢＧ//白
//５秒ほどウエイト
	Wait(4000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
衝撃は、いつまで経っても来なかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_はいけい_しぶ谷えき_LOOP");
	MusicStart("SE01", 1500, 1000, 0, 1000, null, true);
	CreateBG(100, 1500, 0, 0, "cg/bg/bg196_01_3_山手通り_a.jpg");
//ＢＧ//山手通り//夜

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
目を開ける。

目の前に、車が止まっていた。
僕は、いまだ路上に２本の足で立っていた。

運転手が降りてきて、僕になにかを大声でまくし立ててきている。
肩を小突き、怒鳴ってくる。

どうして――

その場に、泣き崩れた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18200120ta">
「どうして、轢き殺してくれないんだ……」

どうして誰も、
僕を救ってくれないんだ。
僕を解放してくれないんだ。

ニセモノには、殺される価値すらないって言うの――？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(1000);

//～～Ｆ・Ｏ

//合流２へ

}
}