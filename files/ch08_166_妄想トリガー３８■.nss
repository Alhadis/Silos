//<continuation number="790">




chapter main
{

	$PreGameName = "boot_第八章";

	if($GameStart != 1)
	{
		$GameName = "ch08_166_妄想トリガー３８■";
		$GameContiune = 1;
		$GameDebugSelect = 1;
		Reset();
	}

		ch08_166_妄想トリガー３８■();
}


function ch08_166_妄想トリガー３８■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	Stand("bu梨深_制服_通常","normal", 250, @-360);
	Stand("bu大輔_制服_通常","normal", 200, @360);
	FadeStand("bu梨深_制服_通常_normal", 0, true);
	FadeStand("bu大輔_制服_通常_normal", 0, true);
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg098_02_2_AHロビー_a.jpg");
	CreateSE("SE01","SE_はいけい_びょういん_LOOP");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	MusicStart("SE01", 5000, 400, 0, 1000, null, true);

//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐１０へ
//ネガティブ妄想→分岐１１へ
//妄想しない→分岐１２へ

if($妄想トリガー通過３８ == 0)
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
			$妄想トリガー３８ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー３８ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー３８ = 0;
		}
	}
}


if($GameDebugSelect == 1)
{
	SetChoice02("梨深ルート有り","梨深ルート無し");
	select
	{
		if($SYSTEM_skip||$SYSTEM_text_auto)
		{
			$SYSTEM_skip=false;
			$SYSTEM_text_auto=false;
		}
	
		case @選択肢１:
		{
			ChoiceA02();
			$梨深ルート=true;
			$RouteON=true;
		}
		case @選択肢２:
		{
			ChoiceB02();
			$梨深ルート=false;
		}
	}
	$GameDebugSelect = 0;
}

//=============================================================================//

if($妄想トリガー３８ == 2)
{
//☆☆☆
//分岐１０
//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ

	BGMPlay360("CH*", 0, 0, false);
	SoundPlay("SE*", 0, 0, false);

	DelusionIn();
	BoxDelete(0);


	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg098_02_2_AHロビー_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	DeleteStand("bu梨深_制服_通常_normal", 0, true);
	DeleteStand("bu大輔_制服_通常_normal", 0, true);

	Stand("bu梨深_制服_通常","normal", 250, @-360);
	Stand("bu大輔_制服_通常","normal", 200, @360);

	FadeStand("bu大輔_制服_通常_normal", 0, true);
	FadeStand("bu梨深_制服_通常_normal", 0, true);


	DelusionIn2();


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600010ri">
「あなたはタクのなんなの、って」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16600020ta">
「え……」

そ、それって、どういう意味だろう……。

{	BGMPlay360("CH05", 1000, 1000, true);
	Stand("bu大輔_制服_通常","shock", 200, @360);
	FadeStand("bu大輔_制服_通常_shock", 300, true);
	DeleteStand("bu大輔_制服_通常_normal", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16600030mi">
「うお、マジで！？　宣戦布告ってヤツか？」

{	Stand("bu梨深_制服_右向き","hurry", 250, @-360);
	DeleteStand("bu梨深_制服_通常_normal", 300, false);
	FadeStand("bu梨深_制服_右向き_hurry", 400, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600040ri">
「たはは、まあ、そんなとこ……かな」

梨深がはにかむ。
チラチラと、僕の方を見てくる。

{	Stand("bu梨深_制服_通常","hard", 250, @-360);
	DeleteStand("bu梨深_制服_右向き_hurry", 300, false);
	FadeStand("bu梨深_制服_通常_hard", 400, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600050ri">
「タクは渡さないからって、言っちゃったし……」

{	Stand("bu梨深_制服_通常","happy", 250, @-360);
	FadeStand("bu梨深_制服_通常_happy", 300, true);
	DeleteStand("bu梨深_制服_通常_hard", 0, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600060ri">
「そしたら見事に叩かれたんだけどさ」

{	Stand("bu大輔_制服_通常","worry", 200, @360);
	FadeStand("bu大輔_制服_通常_worry", 300, true);
	DeleteStand("bu大輔_制服_通常_shock", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16600070mi">
「すげー。女の戦いだな」

三住くんが僕の頭をワシワシとかき回してくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu梨深_制服_通常_happy", 500, true);
	Stand("bu大輔_制服_通常","pride", 200, @360);
	FadeStand("bu大輔_制服_通常_pride", 300, true);
	DeleteStand("bu大輔_制服_通常_worry", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16600080mi">
「おいタク。どーすんだ？　どーすんだよ、え？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16600090ta">
「え、と……」

つまりどういうことなんだろう。
いまいちよく分かっていないというか、頭の中が真っ白なんだけど。

//◆楽しそうに
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16600100mi">
「コクられてんだぞ、お前！」

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16600110mi">
「もう付き合っちまえよっ」

{	CreateSE("SE03","SE_衝撃_せ中を押される");
	DeleteStand("bu大輔_制服_通常_pride", 200, false);
	SoundPlay("SE03", 0, 1000, false);
	Shake("背景１", 200, 0, 5, 0, 0, 500, null, false);}
三住くんは笑いながら、いきなり僕の背中を押した。
不意打ちを食らってよろけてしまう。
その先には梨深。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH*", 1000, 0, false);
	Stand("bu梨深_制服_通常","shock", 250, @0);
	FadeStand("bu梨深_制服_通常_shock", 500, false);
	CreateSE("SE03","SE_じん体_動作_尻餅");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16600120ta">
「うわっ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600130ri">
「きゃっ！？」

{	SoundPlay("SE03", 0, 1000, false);
	Shake("背景１", 500, 0, 5, 0, 0, 500, null, false);
	Shake("bu梨深_制服_通常_shock", 500, 0, 5, 0, 0, 500, null, false);
	DeleteStand("bu梨深_制服_通常_shock", 500, true);
	Wait(500);}
結果的に、梨深に抱きつくような形になってしまった。

{	BGMPlay360("CH11", 2000, 1000, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16600140ta">
「ご、ごめ……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600150ri">
「あ、うん」

すごく、ドキドキする。
梨深の身体はとっても柔らかくて、温かくて……

//◆ささやき
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600160ri">
「タク……あたし……」

慌てて離れようとしたけど、梨深の手が僕の背中に回された。
おずおずと、抱きしめてくる。

その梨深の驚きの行動に、僕の全身に電撃が走った。

梨深の好意が、密着した身体を通して伝わってきた。この好意を、受け止めてあげたい。梨深を、僕だけのものにしたい。

そんな気持ちに支配されて、僕も同じように彼女のしなやかな身体を抱きしめようとした。

{	BGMPlay360("CH*", 500, 0, false);}
そのとき梨深の肩越しに、人影が目に入った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg099_01_2_AH廊下_a.jpg");
	Fade("背景２", 500, 1000, null, true);
	Stand("stあやせ_パジャマ_武器構え","angry", 200, @0);
	Move("stあやせ_パジャマ_武器構え_angry", 0, @0, @100, null, true);
	FadeStand("stあやせ_パジャマ_武器構え_angry", 1000, true);
	BGMPlay360("CH10", 2000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【拓巳】
それは、ディソードを手にしたあやせで。
僕の方を見て、憎悪にまみれた表情を浮かべていた。

ここからだと聞こえないけど、ブツブツとなにかをつぶやいている。

ゾクリとした。

なんという修羅場。
これは確実に血を見る。
そう思ったら、今すぐ逃げ出したくなった――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ

	BGMPlay360("CH*", 0, 0, false);
	SoundPlay("SE*", 0, 0, false);

	DelusionOut();

	Delete("背景１");
	Delete("背景２");
	DeleteStand("stあやせ_パジャマ_武器構え_angry", 0, true);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg099_01_2_AH廊下_a.jpg");

	DelusionOut2();
	PositiveHuman();

	CreateSE("SE01","SE_はいけい_びょういん_LOOP");
	MusicStart("SE01", 2000, 600, 0, 1000, null, true);
//ＢＧ//ＡＨ東京総合病院・ロビー//夕方

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//１０メートルくらい離れたところから呼びかけている
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16600170mi">
「おーいタク、なにボーッとしてんだ。行くぞ」

三住くんが、僕を呼んでいた。
彼の横で、梨深も僕に手を振っている。

目をしばたたかせながら、周囲を見回してみる。
僕は梨深と抱き合ってなんていなかった。
あやせの姿も見当たらない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16600180ta">
「はぁ、ドキドキした……」

{#TIPS_ヤンデレ = true;$TIPS_on_ヤンデレ = true;}
修羅場は苦手だ。
<FONT incolor="#88abda" outcolor="BLACK">ヤンデレ</FONT>は二次元だけでじゅうぶん。
ましてや当事者になんか絶対になりたくない。

{$TIPS_on_ヤンデレ = false;}
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16600190mi">
「タク！　早く来いって」

僕は慌てて２人を追いかけた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);


//合流５
}


//=============================================================================//

if($妄想トリガー３８ == 1)
{
//☆☆☆
//分岐１１
//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ

	BGMPlay360("CH*", 0, 0, false);
	SoundPlay("SE*", 0, 0, false);

	DelusionIn();
	BoxDelete(0);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg098_02_2_AHロビー_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	DeleteStand("bu梨深_制服_通常_normal", 0, true);
	DeleteStand("bu大輔_制服_通常_normal", 0, true);

	Stand("bu梨深_制服_通常","normal", 250, @-360);
	Stand("bu大輔_制服_通常","normal", 200, @360);

	FadeStand("bu大輔_制服_通常_normal", 0, true);
	FadeStand("bu梨深_制服_通常_normal", 0, true);

	DelusionIn2();

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600200ri">
「あなたはもうずっとこの病院に入院してたんでしょう、って」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16600210ta">
「え……」

{	Stand("bu大輔_制服_通常","shock", 200, @360);
	FadeStand("bu大輔_制服_通常_shock", 300, true);
	DeleteStand("bu大輔_制服_通常_normal", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16600220mi">
「どういう意味だ、それ？」

{	Stand("bu梨深_制服_通常","hard", 250, @-360);
	FadeStand("bu梨深_制服_通常_hard", 300, true);
	DeleteStand("bu梨深_制服_通常_normal", 0, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600230ri">
「あのね、岸本さんは、退院なんてしてなかったの」

{	BGMPlay360("CH15", 2000, 1000, true);
	DeleteStand("bu大輔_制服_通常_shock", 500, true);}
梨深は少し得意げに、あやせに関する驚きの情報を披露し始めた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu梨深_制服_通常_hard", 500, true);
	Stand("bu梨深_制服_通常","hard", 250, @-50);
	FadeStand("bu梨深_制服_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600240ri">
「たまにしか学校に来なかったのも、この病院から無断で通ってたから。ライブだってそう」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600250ri">
「そしてニュージェネ事件は、岸本さんが生み出した妄想を、彼女自身の手で実行したものだったの」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600260ri">
「ファンタズムの歌詞の通りに、事件を起こしたのよ。それによって注目を浴びるために」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600270ri">
「それがあたしの推理した、ニュージェネ事件の真相。さっき、思い切って岸本さん本人にぶつけてみたんだ」

{	Stand("bu梨深_制服_右向き","hurry", 250, @-50);
	DeleteStand("bu梨深_制服_通常_hard", 300, false);
	FadeStand("bu梨深_制服_右向き_hurry", 400, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600280ri">
「そしたら叩かれちゃった。たはは」

たはは、じゃないよ……。

なんの証拠もないのに殺人犯扱いされたら、誰だって怒るよ。

あ、でも梨深は、僕が殺人犯扱いしても怒らなかったっけ……。

{	Stand("bu梨深_制服_正面","normal", 250, @-50);
	DeleteStand("bu梨深_制服_右向き_hurry", 300, false);
	FadeStand("bu梨深_制服_正面_normal", 400, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600290ri">
「でもあたしの推理は間違ってないはず。
タク、気をつけてね。岸本さんは――」

{	Stand("bu梨深_制服_正面","hard", 250, @-50);
	FadeStand("bu梨深_制服_正面_hard", 300, true);
	DeleteStand("bu梨深_制服_正面_normal", 0, false);}
//※※３６０以下
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn00/01000010ri">
「異常だよ」

//※※３６０以上
//【梨深】
//<voice name="梨深" class="梨深" src="voice/ch08/16600300ri">
//「狂ってるよ」

梨深がそんなことを口にするなんて信じられない。
聞き間違いかと思った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Wait(1000);

	BGMPlay360("CH*", 500, 0, false);
	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");

	DeleteStand("bu梨深_制服_正面_hard", 0, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16600310ay">
「私は正常よ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16600320ta">
「え……！？」

よく通る声が響き渡った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_衝撃_衝撃音02");
	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg099_01_2_AH廊下_a.jpg");
	Stand("stあやせ_パジャマ_武器構え","angry", 200, @0);
	Move("stあやせ_パジャマ_武器構え_angry", 0, @0, @80, null, true);
	FadeStand("stあやせ_パジャマ_武器構え_angry", 0, true);
	Delete("色１");
	SoundPlay("SE02", 0, 1000, false);
	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text105]
見ると、あやせがディソードを手にして、病棟の入り口に立っている。

{	BGMPlay360("CH13", 2000, 1000, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16600330ay">
「すべては、大いなる意志の導き！」

{	CreateSE("SE02","SE_じん体_動作_足_走る_LOOP");
	SoundPlay("SE02", 0, 1000, true);
	DeleteStand("stあやせ_パジャマ_武器構え_angry", 200, false);}
叫ぶと、剣を構えて僕たちの方に突進してきた。

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16600340mi">
「お、おい、逃げようぜ……！」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600350ri">
「タク、どうしよう！？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16600360ta">
「ど、どうしようって……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16600370ay">
「グラジオールに栄光あれぇぇぇ！」

あやせは明らかに常軌を逸している。

どんどん近づいてくる。
やばい。逃げろ。
逃げないと殺される……！

{	CreateSE("SE03","SE_じん体_動作_滑って転ぶ");
	SoundPlay("SE03", 0, 1000, false);
	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Shake("背景２", 400, 5, 5, 0, 0, 500, null, false);
	DrawTransition("色１", 100, 0, 1000, 100, null, "cg/data/down2.png", true);}
焦りすぎて、僕は足をもつれさせてしまった。
派手に転んでしまう。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600380ri">
「タク！」

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16600390mi">
「あきらめろ、梨深！」

梨深と三住くんが、僕を置いて逃げていく。
小さくなっていく２人の背中に手を伸ばす。

{	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg098_01_2_AHロビー_a.jpg");
	Fade("背景１", 0, 1000, null, true);
	DrawTransition("色１", 100, 1000, 0, 100, null, "cg/data/lcenter2.png", true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16600400ta">
「待って！　置いていかないで！」

{	BGMPlay360("CH*", 200, 0, false);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16600410ay">
「死ねぇぇ！」

{	SoundPlay("SE02", 200, 0, false);
	Stand("buあやせ_パジャマ_武器構え","angry", 200, @0);
	Fade("背景１", 0, 0, null, true);
	FadeStand("buあやせ_パジャマ_武器構え_angry", 0, true);}
振り返ると、目の前に立っていたあやせが、ディソードを振りかぶったところだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_擬音_ディそーど_空を切る1");
	CreateSE("SE04","SE_擬音_ディそーど_人を切る");
	CreateSE("SE05","SE_じん体_血_噴きでる_包丁でさされ");

	SoundPlay("SE03", 0, 1000, false);
	Wait(500);

	Shake("背景２", 300, 5, 5, 0, 0, 500, null, false);
	SoundPlay("SE04", 0, 1000, false);
	SoundPlay("SE05", 0, 1000, false);
	CreateColor("色１", 400, 0, 0, 1280, 720, "White");
	Fade("色１", 0, 1000, null, true);
	DeleteStand("buあやせ_パジャマ_武器構え_angry", 0, true);

	Fade("色１", 0, 0, null, true);

	Wait(500);

	CreateColor("色１", 500, 0, 0, 1280, 720, "RED");
	DrawTransition("色１", 100, 0, 1000, 100, null, "cg/data/zoom1.png", true);
	Wait(2000);

	CreateColor("色２", 450, 0, 0, 1280, 720, "Black");
	Fade("色２", 0, 1000, null, true);
	DrawTransition("色１", 2500, 1000, 0, 100, null, "cg/data/effect.png", false);
	Fade("色１", 2400, 0, null, true);


//ＢＧ//赤
//ＳＥ//斬られる

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
//ＢＧ//ＡＨ東京総合病院・ロビー//夕方

	BGMPlay360("CH*", 0, 0, false);
	SoundPlay("SE*", 0, 0, false);

	DelusionOut();

	Delete("色*", 0, true);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg099_01_2_AH廊下_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	DelusionOut2();
	NegativeHuman();

	CreateSE("SE01","SE_はいけい_びょういん_LOOP");
	MusicStart("SE01", 2000, 300, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//◆１０メートルくらい離れたところから呼びかけている
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16600420mi">
「おーいタク、なにボーッとしてんだ。行くぞ」

三住くんが、僕を呼んでいた。
彼の横で、梨深も僕に手を振っている。

目をしばたたかせながら、周囲を見回してみる。
あやせの姿は見当たらなかった。
僕はどこもケガをしていない。斬られていない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16600430ta">
「はぁ、も、妄想……か……」

殺されたかと思った……。
あんなに怖いあやせは、妄想の中だけでいい。

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16600440mi">
「タク！　早く来いって」

僕は慌てて２人を追いかけた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);

//合流５
}


//=============================================================================//

if($妄想トリガー３８ == 0)
{
//☆☆☆
//分岐１２


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//◆※実はウソ。本当は“拓巳を覚醒させたくないから近づかないで”とあやせに訴えた。あやせはそれで梨深もまた“七騎士のひとりだ”と気付き、梨深に失望して叩いた。
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600450ri">
「剣を見せて、って」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16600460ta">
「え……」

まさか、梨深にも剣が……ディソードが見えるの？

一瞬、そう思ったけど、違った。

{	Stand("bu梨深_制服_正面","normal", 250, @-360);
	FadeStand("bu梨深_制服_正面_normal", 300, true);
	DeleteStand("bu梨深_制服_通常_normal", 0, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600470ri">
「ほら、タクが前に剣のこと話してたでしょ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600480ri">
「だからあたしも見たいなあって」

{	Stand("bu大輔_制服_通常","worry", 200, @360);
	FadeStand("bu大輔_制服_通常_worry", 300, true);
	DeleteStand("bu大輔_制服_通常_normal", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16600490mi">
「それで引っぱたかれたのか？　意味分からん」

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16600500mi">
「岸本って剣の話ばっかしてるのにな」

{	Stand("bu大輔_制服_通常","sigh", 200, @360);
	FadeStand("bu大輔_制服_通常_sigh", 300, true);
	DeleteStand("bu大輔_制服_通常_worry", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16600510mi">
「さっきも病室に入ったとたん、グラディエーターがどうとか言い出して、マジびびったぜ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);

	DeleteStand("bu大輔_制服_通常_sigh", 0, true);
	DeleteStand("bu梨深_制服_正面_normal", 0, true);


//合流５へ
}


//=============================================================================//

	Wait(500);

	CreateTexture360("背景２", 500, 0, 0, "cg/bg/bg098_02_2_AHロビー_a.jpg");
	DrawTransition("背景２", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);

	Delete("色１");
	Wait(500);
	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg098_02_2_AHロビー_a.jpg");


//☆☆☆
//合流５
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
３人、肩を並べて歩きながら、外来棟のロビーを通り過ぎる。

すでに外来受付は終わったらしく、ロビーには数えるほどの人しかいない。

ただ、ロビーの端に設置してある大きな液晶テレビの前にだけ、１０人ほどが集まっていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","normal", 250, @-360);
	FadeStand("bu梨深_制服_正面_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600520ri">
「なにかな？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","smile", 200, @360);
	FadeStand("bu大輔_制服_通常_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602008]
//◆笑いながら
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16600530mi">
「また新しいニュージェネでも起きたんじゃね？」

{	DeleteStand("bu大輔_制服_通常_smile", 500, true);}
三住くんが何気なくつぶやいた言葉に、僕は身を固くする。
でもすぐに、梨深が――

{	Stand("bu梨深_制服_正面","sad", 250, @-360);
	FadeStand("bu梨深_制服_正面_sad", 200, true);
	DeleteStand("bu梨深_制服_正面_normal", 500, true);}
//◆優しくブレス
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600540ri">
「…………」

{	DeleteStand("bu梨深_制服_正面_sad", 500, true);}
さりげなく、手を握ってくれた。

その手の温もりのおかげで、それ以上怯えずに済んだ。
緊張していた心が、スッと溶けていくような感覚。

梨深は僕の支え。
梨深は僕に安心をくれる。
梨深は僕と一緒にいてくれる。

少し楽観的すぎるところがあるけど、彼女がそばにいてくれれば、僕は僕に襲い来る恐怖にギリギリ耐えることができる。

梨深がいてくれてよかった……。

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16600550mi">
「なあ、２人とも来てみろよ！」

いつの間にかテレビの前に行ってしまった三住くんが、僕と梨深を手招きしている。

他の人たち――年老いた患者や若い患者、さらには看護師まで、そこに集まっている人たちはみんなテレビ画面に釘付けになっている。

いったいなんだろう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","normal", 250, @-360);
	FadeStand("bu梨深_制服_正面_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600560ri">
「行ってみよ？」

{	DeleteStand("bu梨深_制服_正面_normal", 500, false);}
梨深に手を引かれるようにして、僕もテレビが見える位置まで移動する。

そして恐る恐る、画面へと目をやった。
そこに表示されたテロップを見て、
僕は、呆然となった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Wait(1000);

	SoundPlay("SE01", 500, 0, false);

//ＣＧ//ニュージェネ犯人逮捕を伝えるテレビ特番
//※画面左上に『ニュージェネ事件犯人逮捕！』のテロップ
//※連行される容疑者の静止映像（容疑者は頭から上着を被っており顔は見えない）
	CreateSE("SE03","SE_衝撃_衝撃音01");
	CreateTextureEX("背景１", 100, 0, -80, "cg/ev/ev061_01_2_ニュージェネ犯人逮捕TV_a.jpg");

	Fade("背景１", 0, 1000, null, true);

	SoundPlay("SE03", 0, 1000, false);
	Wait(3000);
	CreateSE("SE01","SE_はいけい_びょういん_LOOP");
	MusicStart("SE01", 5000, 500, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
それは――

ニュージェネ事件の犯人逮捕を伝えるニュースだった。

{	Move("背景１", 1000, @0, @100, AxlDxl, false);}
//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch08/16600570ka">
「繰り返し、お伝えします」

//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch08/16600580ka">
「今日午後３時半頃、警視庁渋谷署は、いわゆるニュージェネレーションの狂気と呼ばれる、渋谷で発生した一連の殺人事件のうち――」

//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch08/16600590ka">
「９月２９日に起きた、通称『張り付け』殺人事件の容疑者を逮捕しました」

//◆こまえだ・しんご
//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch08/16600600ka">
「殺人容疑で逮捕されたのは、無職、小前田新悟容疑者、２５歳です」

//おおた・ひさし
//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch08/16600610ka">
「容疑については、先ほど渋谷署で行われた記者会見の通り、今のところ太田久さん殺害についてのみで――」

//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch08/16600620ka">
「他の事件に関する容疑は今後、追求していく構えです」

//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch08/16600630ka">
「小前田容疑者は、太田さん殺害については容疑を認めており――」

//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch08/16600640ka">
{#TIPS_ゾンビ = true;$TIPS_on_ゾンビ = true;}「“交際している女性が、太田さんにしつこく付け回され、カッとなって首を絞めた。しかし<FONT incolor="#88abda" outcolor="BLACK">ゾンビ</FONT>だったため死なず、張り付けにして動きを止めた”」

{$TIPS_on_ゾンビ = false;}
//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch08/16600650ka">
「――などと、意味不明の供述をしています」

//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch08/16600660ka">
「警察の調べでは、小前田容疑者には現在交際している女性がいないことが明らかになっており、薬物を摂取していた疑いもあるとみて――」

信じられない気分だった。

テレビ画面に繰り返し映し出される、容疑者が車で移送させられる録画中継。

周囲に群がるマスコミが焚いたカメラのフラッシュで、画面が激しく明滅する。

容疑者の男は頭からジャンパーをかぶり、その風貌はまったく分からない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	SoundPlay("SE01", 5000, 0, false);
	BGMPlay360("CH12", 5000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600670ri">
「タク」

繋いでいる梨深の手に、力がこめられる。
テレビ画面を見つめたまま、梨深は僕につぶやいた。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600680ri">
「やっぱりタクは、犯人なんかじゃなかったし」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600690ri">
「『将軍』っていう人も、単なるイタズラだったんだよ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600700ri">
「楠さんだって、間違った推理をしてただけ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600710ri">
「ね？　これで、なにもかも解決」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16600720ri">
「もう、見えない影なんかに怯えること、ないんだよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
そうだ。
『張り付け』の犯人が捕まったっていうことは、自動的に、僕は犯人じゃないっていうことになるんだ。

僕は夢遊病でも、多重人格でもなかった。いたって正常だったことが証明された。

同時に。
僕が見たあの血まみれの梨深もまた、否定される。
あれは現実じゃなかった。きっと僕の妄想だったんだ。

終わりだ。
この１ヶ月くらい、僕を苛み続けた悪夢は、今、終わったんだ。

もう、物陰に怯えることも、
“神の視線”に怯えることも、
ディソードを手に入れるために必死になる必要も、

ないんだ。

それなのに、どうしてだろう。

胸の奥には、釈然としない気持ちが残っている。

『将軍』が、ただのイタズラで僕をつけ回していたなんて、それこそ現実味に欠ける気がする。

どうしてもそう思ってしまうのは、僕の“まともな感覚”がこの１ヶ月で麻痺してしまったからだろうか――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH*", 500, 0, false);
	Wait(1000);

//ＳＥ//拓巳のケータイのバイブ音
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg098_02_2_AHロビー_a.jpg");
	CreateSE("SE03","SE_日常_けい帯_ばいぶ_LOOP");
	SoundPlay("SE03", 0, 1000, true);
	Fade("背景２", 0, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
ポケットに入れておいたケータイが震えた。

バイブ機能をセットしておいたとは言え、病院内でケータイを使うわけにはいかない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(1000);
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg097_01_2_ＡＨ病院外観_a.jpg");
	DrawTransition("背景１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601012]
僕は梨深の手を離し、正面玄関から外に出て、{	SoundPlay("SE03", 200, 0, false);}ケータイを取った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602012]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16600730ta">
「は、はい……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603012]
//以下、七海の声は電話の声
//ＶＦ//電話の声
//◆苦しそうなブレス
//【七海】
<voice name="七海" class="七海" src="voice/ch08/16600740na">
「…………」

{	Wait(500);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16600750ta">
「だ、誰……？」

身構えてしまう。
また、あの『通りゃんせ』が聞こえてくるかもしれない。

すぐに、かけてきた相手の名前を確認する。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Wait(1000);

//イメージＢＧ//拓巳のケータイのディスプレイ
//「番号非通知」と表示されている
//おがみ：非通知画像なし？
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg188_03_2_携帯電話七海表示_a.jpg");
	Fade("背景２", 0, 1000, null, true);

//ＳＥ//心臓の鼓動
	CreateSE("SE03","SE_じん体_心臓_鼓動");
	SoundPlay("SE03", 0, 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
でも非通知になっていた。
嫌な予感がして、慌てて切ろうとしたら――

//苦しそう
//【七海】
<voice name="七海" class="七海" src="voice/ch08/16600760na">
「おにぃ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH06", 3000, 1000, true);

//ＣＧ//髪をいじる七海の手首のアップ（白い包帯がのぞいている）
//フラッシュバックで一瞬表示
//ＳＥ//心臓の鼓動
	CreateSE("SE03","SE_じん体_心臓_鼓動");
	SoundPlay("SE03", 0, 1000, false);
	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 200, 1000, null, true);
	CreateColor("回想明度", 1000, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);
	CreateTexture360("背景２", 500, 0, 0, "cg/ev/ev069_01_1_七海廊下後姿髪かきあげ_a.jpg");
	Fade("回想フラッシュ", 500, 0, null, true);

	Wait(1500);

	Fade("回想フラッシュ", 200, 1000, null, true);
	CreateColor("色２", 150, 0, 0, 1280, 720, "Black");
	Delete("背景２", 0, true);
	Delete("回想明度");
	Fade("回想フラッシュ", 1000, 0, null, true);
	Delete("回想フラッシュ");



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
電話を通して聞こえてきた、ひどく苦しげな声は、紛れもなく――

七海の声。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//イメージＢＧ//七海の切断された手首（とその手が握っているケータイ）
//フラッシュバックで一瞬表示
//ＳＥ//心臓の鼓動
	CreateSE("SE03","SE_じん体_心臓_鼓動");
	SoundPlay("SE03", 0, 1000, false);
	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 200, 1000, null, true);
	CreateColor("回想明度", 1000, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);
	CreateTexture360("背景２", 500, 0, 0, "cg/bg/bg160_03_3_ダンボール箱_a.jpg");
	Fade("回想フラッシュ", 500, 0, null, true);

	Wait(1500);

	Fade("回想フラッシュ", 200, 1000, null, true);
	Delete("色*");
	Delete("背景２", 0, true);
	Delete("回想明度");
	Fade("回想フラッシュ", 1000, 0, null, true);
	Delete("回想フラッシュ");

	SoundPlay("SE01", 3000, 500, true);
	BGMPlay360("CH06", 1000, 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16600770ta">
「な……なみ……？」

{	Wait(1000);}
//◆苦しげ
//【七海】
<voice name="七海" class="七海" src="voice/ch08/16600780na">
「ナナの――」

{	BGMPlay360("CH*", 1000, 0, true);
	Wait(1000);}
//◆苦しげ
//【七海】
<voice name="七海" class="七海" src="voice/ch08/16600790na">
「右手を、返して」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//以上、七海の声は電話の声
//ＳＥ//通話が一方的にブツッと切れる
//ＳＥ//「ツーツーツー」
//おがみ：SEの内容により変更＞ブツと切れる音とツーツーが混同している

	CreateSE("SE03","SE_日常_でんわ_ぶつっと切れる");
	SoundPlay("SE03", 0, 1000, false);

	Wait(800);

//～～Ｆ・Ｏ
//★梨深編
if(!$梨深ルート){
	CreateSE("SE04","SE_日常_でんわ_つーつーつー_LOOP");
	MusicStart("SE04",0,1000,0,1000,null,true);
	Wait(3000);
	SetVolume("SE04", 2000, 0, null);
	Wait(1500);

}else{
	CreateSE("SE04","SE_日常_でんわ_つーつーつー_LOOP");
	MusicStart("SE04",0,1000,0,1000,null,true);
	Wait(3000);
	SetVolume("SE04", 2000, 0, null);
	ClearAll(2000);
	Wait(1000);

}



}