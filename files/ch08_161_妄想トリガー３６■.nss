//<continuation number="490">




chapter main
{

	$PreGameName = "boot_第八章";

	if($GameStart != 1)
	{
		$GameName = "ch08_161_妄想トリガー３６■";
		$GameContiune = 1;
		$GameDebugSelect = 1;
		Reset();
	}

		ch08_161_妄想トリガー３６■();
}


function ch08_161_妄想トリガー３６■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg102_01_2_あやせの病室_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐４へ
//ネガティブ妄想→分岐５へ
//妄想しない→分岐６へ

if($妄想トリガー通過３６ == 0)
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
			$妄想トリガー３６ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー３６ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー３６ = 0;
		}
	}
}


if($GameDebugSelect == 1)
{
	SetChoice02("７章エンドフラグ①有り","７章エンドフラグ①無し");
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
			$７章エンドフラグ① = true;
		}
		case @選択肢２:
		{
			ChoiceB02();
		}
	}

	$GameDebugSelect = 0;
}

//=============================================================================//

if($妄想トリガー３６ == 2)
{
//☆☆☆
//分岐４
//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ

	BGMPlay360("CH*", 0, 0, false);
	SoundPlay("SE*", 0, 0, false);

	DelusionIn();

	BoxDelete(0);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg102_01_2_あやせの病室_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	Stand("bu大輔_制服_通常","shock", 250, @100);
	FadeStand("bu大輔_制服_通常_shock", 0, true);

	CreateSE("SE01","SE_はいけい_白いびょう室_LOOP");
	SoundPlay("SE01", 2000, 500, true);

	DelusionIn2();

	Wait(1500);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16100010mi">
「どこ行ったんだ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16100020ta">
「さ、さあ……」

{	Stand("bu大輔_制服_通常","smile", 250, @100);
	FadeStand("bu大輔_制服_通常_smile", 300, true);
	DeleteStand("bu大輔_制服_通常_shock", 300, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16100030mi">
「ま、戻ってくるまで待つか」

{	DeleteStand("bu大輔_制服_通常_smile", 500, true);}
そう言うと、三住くんはなぜか部屋の中を物色し始める。彼にはデリカシーの欠片もないみたいだ。

ここはあやせの部屋と言っても過言じゃない。私的な物や服がいくつも置かれているし、消毒液の匂いに混じって、女の子の部屋特有のいい香りも漂っている。

部屋の主が不在の状況で勝手に入っちゃったっていうことが、あやせのプライベートをのぞき見ているような気がして、居心地が悪い。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16100040ta">
「そ、そういうの、よくないよ……。外で、ま、待ってた方が……」

{	Stand("bu大輔_制服_通常","pride", 250, @100);
	FadeStand("bu大輔_制服_通常_pride", 200, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16100050mi">
「ちょっと見るだけだって。お前も知りたいと思わねえのか、ＦＥＳの私生活ってやつをよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16100060ta">
「…………」

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16100070mi">
「興味あるだろ？」

{	DeleteStand("bu大輔_制服_通常_pride", 500, true);}
た、確かに……。
あやせのプライベートは、謎に包まれている。
ちょっとでいいから見てみたいっていう気はする。

三住くんにはまったく躊躇はないみたいだ。
その堂々とした態度を見て、僕も考えを改めた。

一度、病室のドアの方へ振り返り、誰も来ないのを確かめる。
そして、ドキドキしながら真っ先に調べたのは――

ベッドだった。
わずかに乱れているシーツ。

なにを期待しているのか自分でもよく分からないままに、
それをそーっとめくってみて、目を疑った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	MusicStart("SE01", 2000, 0, 0, 1000, null, false);

	CreateSE("SE02","SE_じん体_動作_すかーと裾まくり");
	SoundPlay("SE02", 0, 1000, false);

	Wait(500);

//イメージＢＧ//ベッドの上にあやせの下着
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg185_01_1_あやせ下着_a.jpg");
	Zoom("背景２", 0, 2000, 2000, null, true);
	Fade("背景２", 0, 1000, null, true);

	Wait(1000);

	CreateTextureEX("背景３", 100, 0, 0, "cg/bg/bg185_01_1_あやせ下着_a.jpg");
	Fade("背景３", 2000, 1000, null, true);
	Delete("背景２", 0, true);

	BGMPlay360("CH05", 1000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
シーツの下に隠れていたのは、下着。しかも上下セット。

紫色のパンツと思われるそれは無造作に丸められていて、明らかに脱ぎ捨てたようにしか見えない。

使用前じゃない。使用後だぞ、ふひひ。

そしてこの病室は個室。
身に付けていたのは、あやせ以外には考えられないじゃないか。

な、な、なんというエロス……。

{	Fade("背景３", 0, 0, null, true);
	Wait(500);}
慌てて三住くんの方を窺った。
でも彼は、手に取った雑誌を読んでいて、ベッドの上の衝撃には気付いていない。

{	Fade("背景３", 0, 1000, null, true);
	Wait(500);}
下着に目を戻す。

{	CreateSE("SE02","SE_じん体_心臓_鼓動_LOOP");
	SoundPlay("SE02", 0, 1000, true);}
ゴクリと息を呑んだ。
のどがカラカラになっていた。

{	CreateSE("SE03","SE_じん体_動作_すかーと裾まくり");
	SoundPlay("SE03", 0, 1000, false);}
僕はほとんど無意識のうちに、震える指を、その下着へと伸ばしていた。

鼓動が速くなるのを自覚しつつ、そっと、パンツに触れてみる。

なぜかプニプニとした妙な肉感があった。

なんか、変……だぞ……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg102_01_2_あやせの病室_a.jpg");
	Stand("bu大輔_制服_通常","pride", 250, @0);
	SoundPlay("SE*", 200, 0, true);
	BGMPlay360("CH*", 200, 0, false);
	Fade("背景２", 0, 1000, null, true);
	FadeStand("bu大輔_制服_通常_pride", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//◆※あえて「私」です
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16100080mi">
「それは私のおいなりさんだ」

{	CreateSE("SE02","SE_衝撃_ガラス_割れる_発砲");
	SoundPlay("SE02", 0, 1000, false);}
//◆ビックリしている
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16100090ta">
「ゲェェ――ッ！？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ

	BGMPlay360("CH*", 0, 0, false);
	SoundPlay("SE*", 0, 0, false);

	DelusionOut();

	DeleteStand("bu大輔_制服_通常_pride", 0, true);

//ＢＧ//ＡＨ総合病院・病室//夕方
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg102_01_2_あやせの病室_a.jpg");
	Fade("背景１", 0, 1000, null, true);
	Stand("bu大輔_制服_通常","pride", 250, @100);
	FadeStand("bu大輔_制服_通常_pride", 200, true);


	DelusionOut2();
	PositiveHuman();

	CreateSE("SE01","SE_はいけい_白いびょう室_LOOP");
	SoundPlay("SE01", 2000, 500, true);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16100100mi">
「見ろよタク。変な本があるぞ」

三住くんに呼びかけられて、ハッとする。

僕は病室の隅に立っていた。
ベッドのシーツはめくられていなくて、当然ながらそこにエロ下着は見当たらない。

はあ、妄想か……。

最後にとてつもなくおぞましい展開になったような気がするけど、思い出さないでおこう……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//合流２へ
}


//=============================================================================//

if($妄想トリガー３６ == 1)
{
//☆☆☆
//分岐５
//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ
//※妄想ＩＮエフェクトない方がいいかもしれません……

//	BGMPlay360("CH*", 0, 0, false);
//	SoundPlay("SE*", 0, 0, false);
//	DelusionIn();
//	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg102_01_2_あやせの病室_a.jpg");
//	Fade("背景１", 0, 1000, null, true);
//	Stand("st大輔_制服_通常","shock", 250, @210);
//	FadeStand("st大輔_制服_通常_shock", 0, true);
//	DelusionIn2();
//	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16100110mi">
「どこ行ったんだ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16100120ta">
「さ、さあ……」

窓が開いている。
風を受けて、白いカーテンが揺れていた。

僕は何気なく、その窓に近づく。

なにかを見ようとしたわけじゃない。
窓を閉めようと思ったわけでもない。

ホントにただ、なんとなくの行動だった。

窓際に立ち。
そこから空を見上げようとしたら――

{	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 100, 0, 1000, 100, null, "cg/data/down2.png", true);}
ふと影がよぎり。
真上から、音もなくなにかが落ちてきて。

一瞬、

それと、

目が、

合った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_衝撃_衝撃音02");
	SoundPlay("SE02", 0, 1000, false);
	BGMPlay360("CH06", 500, 1000, true);

	Stand("buあやせ_パジャマ_通常","hard", 250, @0);
	Rotate("buあやせ_パジャマ_通常_hard*", 1, @0, @0, 180, null, true);
	Move("buあやせ_パジャマ_通常_hard*", 0, @0, @-150, null, true);
	Zoom("buあやせ_パジャマ_通常_hard*", 0, 1500, 1500, null, true);
	FadeStand("buあやせ_パジャマ_通常_hard", 0, true);
	Wait(200);
	DeleteStand("buあやせ_パジャマ_通常_hard", 0, true);

	Wait(1000);

	Fade("色１", 4000, 0, null, true);

//ＳＥ//人が地面に激突した音「ドーン！」

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
影はすぐに消えて。
{	CreateSE("SE02","SE_衝撃_落下激突");
	SoundPlay("SE02", 0, 1000, false);}
直後に下の方から、激しい衝撃音が轟く。

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16100130mi">
「な、なんだ！？」

僕はその場にへたり込んだ。
身体が、ぶるぶると震え出す。

今、落ちていったのが、なんだったのか。
僕は気付いてしまった。

岸本あやせ。

彼女が、上から降ってきた。
そして、墜落した。

きっと窓から見下ろせば、そこに彼女はいるだろう。血まみれになって、脳漿を地面にぶちまけて、倒れているだろう。

死ぬ直前の彼女と、僕は、目が合ってしまった。

あやせが最後に見た人間は、僕。
生きているあやせを最後に見たのは、僕。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16100140ta">
「う、ああああ――」

うめくように。
悲鳴が自然と口から迸り。
僕は頭を抱えた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ

	BGMPlay360("CH*", 0, 0, false);
	SoundPlay("SE*", 0, 0, false);

	DelusionOut();

//ＢＧ//ＡＨ総合病院・病室//夕方
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg102_01_2_あやせの病室_a.jpg");
	Fade("背景１", 0, 1000, null, true);
	Stand("bu大輔_制服_通常","pride", 250, @100);
	FadeStand("bu大輔_制服_通常_pride", 200, true);


	DelusionOut2();
	NegativeHuman();

	CreateSE("SE01","SE_はいけい_白いびょう室_LOOP");
	SoundPlay("SE01", 2000, 500, true);


//ＢＧ//ＡＨ総合病院・病室//夕方

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16100150mi">
「見ろよタク。変な本があるぞ」

三住くんに呼びかけられて、ハッとする。

僕は窓際じゃなくて、病室の隅に立っていた。

慌てて窓に駆け寄り、下をのぞき込む。
でもあやせは倒れていなかった。

はあ、妄想か……。
その場にヘナヘナと崩れ落ちそうになるのを、窓枠をつかんでかろうじて耐えた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//合流２へ
}


//=============================================================================//

if($妄想トリガー３６ == 0)
{
//☆☆☆
//分岐６
//フラグ【８章エンドフラグ①】ＯＮ
	$８章エンドフラグ① = true;

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16100160mi">
「どこ行ったんだ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16100170ta">
「さ、さあ……」

窓が開いている。
風を受けて、白いカーテンが揺れていた。

この病室に入ってきたときから、それが妙に気になっている。

ネガティブな妄想をしそうになる。
あやせが、あの窓から飛び降りたんじゃないか、って。

見下ろせば、そこに血まみれのあやせが脳漿をぶちまけた状態で倒れているんじゃないかって。

確かめずにはいられない。
僕はほとんど憑かれたように、震える足を一歩ずつ前へ進めていた。

窓際に立つ。
夕焼け空。
爽やかな秋晴れ。

果たして、下はどうなってる？
地獄絵図？

ゴクリと息を呑み、僕はそっと、窓から頭を出して、下をのぞき込んだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16100180ta">
「…………」

なにも異常はない。
あやせの死体はどこにも見当たらない。

どうやら考えすぎだったみたいだ。
ホッとして、顔を引っ込めようとしたときに、

ふと、気付いてしまった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//階下の窓からなびいているタオル（風に揺れていて文字は読めない）
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg186_01_1_たなびくタオル_a.jpg");
	Fade("背景２", 500, 1000, null, true);
	CreateSE("風音","SE_自然_風音_LOOP");
	SoundPlay("風音", 2000, 1000, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
それは、ひとつ下の階の窓。
一枚のタオルが、風でなびいている。

ただの白いタオルかと思ったけど、
全体に紺色で文字らしきものが描かれている。

はためいているせいで、なかなか読み取れない。

別に興味はなかった。
そんなタオルに描かれた文字なんてどうでもいいはずだった。

だけど、必死に読もうとしている自分がいて。

よく見れば、
そこに描かれた文字は、

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SoundPlay("風音", 2000, 0, false);

	SoundPlay("SE01", 1000, 0, false);

//イメージＢＧ//階下の窓からなびいているタオル（タオルに描かれた文字「その目だれの目？」）
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg186_02_1_たなびくタオル_a.jpg");
	CreateSE("SE02","SE_衝撃_衝撃音02");

	Fade("背景１", 0, 1000, null, true);
	SoundPlay("SE02", 0, 1000, false);
	Wait(2500);

//――その目だれの目？
	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 600, center, middle, Auto, Auto, "――その目だれの目？");

	SetBacklog("――その目だれの目？", "NULL", NULL);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	Wait(500);

	FadeDelete("テキスト１", 1000, false);
	FadeDelete("色１", 1000, false);
	Wait(300);
	CreateSE("風音","SE_自然_風音_LOOP");
	SoundPlay("風音", 2000, 1000, true);

//おがみ：実績：その目
	Eyes();


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
言葉を失った。
目を離せなかった。

直後に――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	Wait(500);

//イメージＢＧ//階下の窓からなびいていたタオルが引っ込められる
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg186_01_1_たなびくタオル_a.jpg");
	Fade("背景２", 0, 1000, null, true);

	Wait(1000);

	CreateTextureEX("背景３", 100, 0, 0, "cg/bg/bg186_03_1_たなびくタオル_a.jpg");
	Fade("背景３", 200, 1000, null, true);

	Wait(1000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
サッと、タオルが引っ込められた。

まるで、今、僕がそのタオルを見ていたことを、分かっていたかのように……。

いや、そんなはずないっ。

この真下の病室に、ピンポイントで僕の知り合いが入院しているわけはないし。

入院患者じゃない何者かが待ち構えていたにしても、僕がこの病室から下をのぞき込むなんて予測不可能のはずじゃないか。

病室には監視カメラもないし。

単なる偶然だ。そうに決まってる。

でも、もしも、偶然じゃなかったら……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("風音", 2000, 0, false);
	CreateSE("SE01","SE_はいけい_白いびょう室_LOOP");
	SoundPlay("SE01", 2000, 500, true);
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg102_01_2_あやせの病室_a.jpg");
	Fade("背景１", 0, 1000, null, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
恐怖を覚えて、病室の入り口の方を振り返った。
誰もいない。
扉は閉められている。

すごく気味が悪くて、僕はすぐに窓際から離れた。
考えるな。考えないようにするんだ。

あれは偶然。ただの偶然。そう自分に言い聞かせる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","pride", 250, @100);
	FadeStand("bu大輔_制服_通常_pride", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602010]
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16100190mi">
「見ろよタク。変な本があるぞ」

三住くんに呼びかけられて、ハッとした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――



//合流２へ
}


//=============================================================================//

//☆☆☆
//合流２

	Delete("背景２");
	Delete("背景３");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
彼は、棚の上に置かれた本の一冊を手に取り、しげしげと眺めている。

{	Stand("bu大輔_制服_通常","shock", 250, @100);
	FadeStand("bu大輔_制服_通常_shock", 200, true);
	DeleteStand("bu大輔_制服_通常_pride", 200, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16100200mi">
「『ヌー』だぜ、『ヌー』」

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16100210mi">
「この雑誌、まだ続いてたんだな」

『ヌー』は、ＵＦＯや異星人、超能力、宗教、都市伝説、怪奇現象、超古代文明やオーパーツなど、オカルト系全般の情報を取り扱う専門誌だ。

デンパな話ばかりしていたあやせがこの雑誌を読んでいたというのは、じゅうぶん納得できる。

{	Stand("bu大輔_制服_通常","sigh", 250, @100);
	FadeStand("bu大輔_制服_通常_sigh", 200, true);
	DeleteStand("bu大輔_制服_通常_shock", 200, false);}
//※※３６０以下
//【三住】
<voice name="三住" class="三住" src="voice/chn00/00800010mi">
「こっちの文庫本は……なになに、『グラジオール記黙示録詩編』？　ファンタジー小説っぽいな」

//※※３６０以上
//【三住】
//<voice name="三住" class="三住" src="voice/ch08/16100220mi">
//「こっちの文庫本は……なになに、『グラジオール・サーガ』？　ファンタジー小説っぽいな」

その小説のことは知らないけど、グラジオールっていう単語には聞き覚えがあった。

どこで聞いたんだっけ？
ごく最近だと思うんだけど……。

{	Stand("bu大輔_制服_通常","worry", 250, @100);
	FadeStand("bu大輔_制服_通常_worry", 200, true);
	DeleteStand("bu大輔_制服_通常_sigh", 200, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16100230mi">
「はあ、岸本と付き合うとなると、この趣味に合わせないといけねえのか。大変そうだぜ、これは……」

もしかして彼はまだ、あやせと付き合うことをあきらめてないんだろうか。以前、秒殺でフラれてたのに。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu大輔_制服_通常_worry", 500, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16100240ta">
「あ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Request("背景１", Smoothing);
	Zoom("背景１", 1500, 2000, 2000, AxlDxl, false);
	Move("背景１", 1500, @-512, @-112, AxlDxl, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602011]
ふと、窓際にあやせのディソードが立て掛けられているのに気付いた。
ＳＦ映画に出てくる宇宙戦艦のようなフォルム。

いつ見ても、美しさと残酷さを兼ね備えた、かっこいい剣だ。今は光ってないし、ただそこにあるだけなのに、相変わらずものすごい存在感だ。

三住くんは剣に気付く様子がない。
やっぱり、普通の人の目には見えないんだ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
もし――
これをあやせに黙って持っていったら、この剣は僕のものになるんだろうか。

労せずしてディソードを手に入れられるなら、なりふり構っている場合じゃない。
僕の中で欲望がせり上がってくる。

ゴクリと息を呑み、恐る恐る、剣へと手を伸ばした。
柄の部分を、つかむ。

つかんだ、つもりだった。

でも手は、剣をすり抜けていた。握りしめたのは空気だけ。もう一度試してみるけど、結果は同じだった。

つかめない。触れることさえできない。

今、この剣はリアルブートされていない、っていうことなんだろうか。
周囲共通認識が為されていないから、ただのあやせの妄想でしかない状態。

幻。
夢。
残像。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Zoom("背景１", 1500, 1000, 1000, AxlDxl, false);
	Move("背景１", 1500, @512, @112, AxlDxl, true);
	Stand("bu大輔_制服_通常","sigh", 250, @100);
	FadeStand("bu大輔_制服_通常_sigh", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601012]
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16100250mi">
「なにやってんだ、お前？」

僕を見て、三住くんが不思議そうな顔をしていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 2000, 1000, null, true);
	DeleteStand("bu大輔_制服_通常_sigh", 0, true);
	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602012]
それから１０分ほど待っても、あやせが戻ってくる気配はなかった。
トイレに行ったはずの梨深も来ない。どこに行ったんだろう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("色１", 2000, 0, null, true);
	Wait(500);
	Delete("色１");
	Stand("bu大輔_制服_通常","worry", 250, @100);
	FadeStand("bu大輔_制服_通常_worry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603012]
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16100260mi">
「梨深ってこの病室の場所、知ってたか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16100270ta">
「あ……」

病室の場所をナースステーションで聞いたのは、梨深と別れた後だ。もしかして場所が分からなくてどこかをさまよっているのかも。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","smile", 250, @100);
	FadeStand("bu大輔_制服_通常_smile", 200, true);
	DeleteStand("bu大輔_制服_通常_worry", 200, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//◆笑いながら
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16100280mi">
「あいつバカだからな。
俺たちみたいに、誰かに聞こうって発想がないのかもしんねえぞ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16100290ta">
「……さ、探しに……」

梨深が一緒じゃないと、不安だ。
この病院だって、安全とは言い切れない。

『将軍』が僕を思考盗撮しているなら、
ここにいることだって知られているはず。

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16100300mi">
「そうだな。待つのも飽きたし、
タクもあいつがいないと寂しいだろうからな。ははっ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16100310ta">
「…………」

{	Stand("bu大輔_制服_通常","pride", 250, @100);
	FadeStand("bu大輔_制服_通常_pride", 200, true);
	DeleteStand("bu大輔_制服_通常_smile", 200, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16100320mi">
「なあ、ぶっちゃけ、梨深とはどうなんだ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16100330ta">
「え？」

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16100340mi">
「付き合ってんのかって聞いてんだよ。
お前ら、最近けっこういい感じじゃね？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16100350ta">
「……つ、付き合って、ないよ」

言いながらも、顔が火照ってしまう。

{	DeleteStand("bu大輔_制服_通常_pride", 500, true);}
僕と、梨深が、付き合う……か。

確かに何度か妄想したことはある。

三次元に興味はなかったけど、いまや僕の中で梨深の存在はかなり大きなものになりつつある。

でも前に梨深が“一緒にいてあげる”って言ってくれたとき、
同時にこうも言ってた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SoundPlay("SE01", 1000, 1, true);
	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 100, 1000, null, true);
	CreateColor("回想明度", 150, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);
	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	CreateColor("色２", 130, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 1000, null, true);
	Fade("色２", 0, 500, null, true);
	Stand("bu梨深_制服_正面","normal", 110, @0);
	FadeStand("bu梨深_制服_正面_normal", 0, true);
	Fade("回想フラッシュ", 1000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601013]
//ＶＦ//回想セリフ
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16100360ri">
「そんなの、友達だからに決まってるでしょ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SoundPlay("SE01", 3000, 200, true);
	Fade("回想フラッシュ", 200, 1000, null, true);
	Delete("色*");
	Delete("回想明度");
	DeleteStand("bu梨深_制服_正面_normal", 0, true);
	Fade("回想フラッシュ", 1000, 0, null, true);
	Delete("回想フラッシュ");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602013]
つまり友達としか見られていないっていうこと。

僕みたいなキモオタと恋人の関係になろうなんて、きっと向こうはまったく考えてないだろう。

そもそも梨深って、そういうのに鈍感そうだし。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//ＡＨ総合病院・廊下//夕方
	SoundPlay("SE01", 2000, 0, false);
	CreateSE("SE02","SE_日常_びょういんどあ_開く");
	SoundPlay("SE02", 0, 1000, false);

	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 500, 1000, null, true);

	Wait(1500);
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg106_01_2_ナースステーション_a.jpg");
	Fade("背景１", 500, 1000, null, true);

	Delete("色*", 0, true);

	CreateSE("SE02","SE_日常_びょういんどあ_閉まる");
	SoundPlay("SE02", 0, 1000, false);

	Wait(1000);

	CreateSE("SE01","SE_はいけい_びょういん_LOOP");
	MusicStart("SE01", 3000, 500, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
僕は三住くんと手分けして、梨深かあやせを探すことにした。

三住くんが階段を下っていったので、僕は上の階を探してみることにした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg099_01_2_AH廊下_a.jpg");
	DrawTransition("背景２", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601014]
//◆精神障害者。男。５０代。子供みたいな喋り方。
//◆「あみぃちゃん」＝「たくみちゃん」と言っているが舌足らずであみぃに聞こえる。
//◆「ろこぉ」＝どこ
//【山井】
<voice name="山井" class="山井" src="voice/ch08/16100370yi">
「あみぃちゃん！　ろこぉ！？　あみぃちゃん！」

５０代くらいの初老の入院患者と、廊下ですれ違った。男はよたよたと歩きながら、しきりに“あみぃちゃん”なる人の名を呼んでいる。

僕はそれを無視して廊下の奥へ。

病院内を歩き回ることにはそれほど抵抗はない。
昔からよく通っていたからだろう。

ただ、廊下の角や扉が開いたままの病室から『将軍』が現れないかとドキドキしてしまう。

それに、どこからかたまに聞こえてくる悲鳴のような奇声も心臓に悪い。

廊下は全体的にクリーム色で統一されていた。

扉が開いている病室とそうでない病室がある。『将軍』の気配がないか確かめようと、いくつかの病室の中をのぞいてみた。

どの病室もベッドがふたつ並んでいて、シーツが人の形にふくらんでいた。そこに患者が寝ているんだろう。ただ、顔は死角になっていて見えなかった。

廊下を歩いている人の姿はあまりない。

さっきの“あみぃちゃん”を呼んでいたおっさんと、看護師がひとり。今のところすれ違ったのはその２人だけ。

あまりここにはいたくない。
なぜかそんな気がした。

雰囲気が重苦しい。不快感はないけど、僕はここにいちゃいけないような気がする。

なおも先に進むと右側へと折れるような形で曲がり角になっていた。

その先に病室がさらに続いているんだろうか。そう思いながら、恐る恐る曲がってみると――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SoundPlay("SE01", 100, 0, false);

	CreateSE("SE02","SE_衝撃_衝撃音02");
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg109_01_2_黒い壁_a.jpg");

	Fade("背景１", 50, 1000, null, true);
	SoundPlay("SE02", 0, 1000, false);

	BGMPlay360("CH06", 1000, 1000, true);

	CreateSE("SE05","SE_日常_のいず");
	SoundPlay("SE05", 5000, 1000, true);

	Wait(3000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
いきなり、目の前が壁だった。

しかも、それまでのクリーム色がウソのように、曲がった先の突き当たりだけが黒いペンキで塗り潰されている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg109_01_2_黒い壁_a.jpg");
	Fade("背景２", 0, 1000, null, true);
	Zoom("背景２", 2000, 1200, 1200, Dxl2, false);
	Fade("背景２", 2000, 0, null, false);
	CreateSE("SE01","SE_じん体_心臓_鼓動_LOOP");
	SoundPlay("SE01", 0, 1000, true);
	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601015]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16100380ta">
「…………」

なぜか――
動悸が速まる。

その場から一歩も動けなくなる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Zoom("背景２", 0, 1000, 1000, null, true);
	Fade("背景２", 0, 1000, null, true);
	Zoom("背景２", 2000, 1200, 1200, Dxl2, false);
	Fade("背景２", 2000, 0, null, false);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602015]
視界がグラグラと揺れる。

激しい目眩かと思って目を閉じ、まぶたの上から指で揉んでみると、自分の目玉が痙攣していた。

足許から這い上がってくる、氷のように冷たい悪寒。

呼吸すら忘れ、僕は立ち尽くす。

目の前の黒を、見つめる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Zoom("背景２", 0, 1000, 1000, null, true);
	Fade("背景２", 0, 1000, null, true);
	Zoom("背景２", 2000, 1200, 1200, Dxl2, false);
	Fade("背景２", 2000, 0, null, false);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603015]
吸い込まれそうな。
呑み込まれそうな。

どこまでも深い黒。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Zoom("背景２", 0, 1000, 1000, null, true);
	Fade("背景２", 0, 1000, null, true);
	Zoom("背景２", 2000, 1200, 1200, Dxl2, false);
	Fade("背景２", 2000, 0, null, false);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604015]
なにもないはずなのに。
どこからか見られている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Zoom("背景２", 0, 1000, 1000, null, true);
	Fade("背景２", 0, 1000, null, true);
	Zoom("背景２", 2000, 1200, 1200, Dxl2, false);
	Fade("背景２", 2000, 0, null, false);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3605015]
“神の視線”が僕のうなじに突き刺さってくる。
その存在感は、ベースにいるときの比じゃなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Zoom("背景２", 0, 1000, 1000, null, true);
	Fade("背景２", 0, 1000, null, true);
	Zoom("背景２", 2000, 1200, 1200, Dxl2, false);
	Fade("背景２", 2000, 0, null, false);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3606015]
見るな――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Zoom("背景２", 0, 1000, 1000, null, true);
	Fade("背景２", 0, 1000, null, true);
	Zoom("背景２", 2000, 1200, 1200, Dxl2, false);
	Fade("背景２", 2000, 0, null, false);
	CreateColor("色１", 200, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 2000, 0, 600, 100, Dxl2, "cg/data/lcenter2.png", true);
	DrawTransition("色１", 1000, 600, 500, 100, Axl2, "cg/data/lcenter2.png", true);
	DrawTransition("色１", 100, 600, 1000, 100, Axl2, "cg/data/lcenter2.png", true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16100390ta">
「……っ」

すべての精神力を使って、まぶたを閉じた。

その瞬間に、呼吸ができるようになり、僕はゼイゼイと息をしながら後ずさる。

{	BGMPlay360("CH*", 5000, 0, false);

	CreateSE("SE02","SE_じん体_動作_足_走る_LOOP");
	SoundPlay("SE05", 5000, 0, false);
	SoundPlay("SE01", 3000, 0, false);
	SoundPlay("SE02", 0, 1000, false);}
そのまま顔を伏せ、逃げるように廊下を引き返した。

{	SoundPlay("SE02", 2000, 0, false);}
あやせの病室がある階へと早足で戻り、ゼイゼイと息をつく。

うなじに触れてみると、粘つくような汗がにじみ出ていた。うなじだけじゃない、全身が汗でねとついている。

いったい、なんだったんだろう……。
『将軍』に思考盗撮されているのか？

“神の視線”の気配は消えてくれない。

息苦しさや悪寒も治まらない。

気持ちが一気に萎えた。

もう帰りたい。

梨深に付き添ってもらって、ベースに引きこもってしまいたい。

そもそも僕なんかが見舞いに来たところで、あやせは喜ぶどころかウザがるだろう。

三住くんの下心丸出しのこの見舞いに、僕が付き合うのもバカげてる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg099_02_2_AH廊下_a.jpg");
	Fade("背景１", 0, 1000, null, true);
	Fade("色１", 1000, 0, null, true);

	CreateSE("SE01","SE_はいけい_びょういん_LOOP");
	SoundPlay("SE01", 2000, 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
帰ろう――

『将軍』や優愛が現れる前に。

あいつらは神出鬼没だ。

僕の居場所を簡単に突き止めてくる。

どこにいたって気を引き締めていないとダメだ。

僕はよろよろと、壁に手を添えながらあやせの病室を目指した。三住くんは戻ってきているだろうか。梨深と合流できたことを願って、のろのろと歩を進める。

//【看護師Ａ】
<voice name="看護師Ａ" class="看護師Ａ" src="voice/ch08/16100400n1">
「――山井さんが、またあみぃちゃんっていう名前を呼んでたんですよ」

看護師の話し声が、前方から聞こえてくる。
顔を上げると、２人のナースがこっちに歩いてくるところだった。
ひとりはまだ若く、もうひとりは恰幅のいいおばさん。

//【看護師Ａ】
<voice name="看護師Ａ" class="看護師Ａ" src="voice/ch08/16100410n1">
「いったい誰のことを探してるのか……」

//【看護師長】
<voice name="看護師長" class="看護師長" src="voice/ch08/16100420n2">
「それ、この病院に伝わる怪談よ」

//【看護師長】
<voice name="看護師長" class="看護師長" src="voice/ch08/16100430n2">
「誰も知らない幻の病室があって、そこに“あみぃちゃん”が入院してるらしいわ」

//【看護師長】
<voice name="看護師長" class="看護師長" src="voice/ch08/16100440n2">
「もう何年も前からある噂」

僕は、顔を伏せてその２人が通り過ぎるのを待つ。息を止めて、荒い呼吸をごまかす。

明らかに不審そうな目で見られていると分かったけど、とにかく無視するしかなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//ナースステーション
	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg106_01_2_ナースステーション_a.jpg");
	DrawTransition("背景２", 1000, 0, 1000, 100, null, "cg/data/やや細かい縦ブラインド左右.png", true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
看護師２人をやり過ごし、なおも必死に歩いていくと、ナースステーションに辿り着いた。

あやせの病室はもっと手前だったはずで、どうやら行きすぎてしまったらしい。

僕は舌打ちし、額の汗を拭う。
まだ、見られている気配がする。

ズキズキと胸の奥が痛む。
耳鳴りもしている。

すごく気持ちが悪い。
体調は最悪だ。

来るときはこんなことなかったのに。
僕の身体はいったいどうなっちゃったんだ……？

すごく苦しくて、
我慢できなくなり、

ナースステーションにいる看護師に、助けを求めようとした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＧ//葉月が無表情でボードになにか書き込んでいる

	if($葉月メガネ == 1)
	{
		CreateTextureEX("背景１", 100, 0, 0, "cg/ev/ev078_02_3_葉月ナースめがね_a.jpg");
	}else
	{
		CreateTextureEX("背景１", 100, 0, 0, "cg/ev/ev078_01_3_葉月ナースめがね_a.jpg");
	}


	Fade("背景１", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
でも、ひとりしかいなかった。

どうやら僕の存在に気付いてないらしく、僕に背中を向けた状態で、何事かをぶつぶつとつぶやきながら仕事に没頭している。

手にしているのはクリップボード。そこに挟んだ用紙に、なにかを書き込んでいる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//※このセリフ、テキストなしでＳＥ扱いみたいな感じにした方がいいかもしれません
//◆小声でぶつぶつと
//【葉月】
//<voice name="葉月" class="葉月" src="voice/ch08/16100450hd">
//「神光の救いあれ、神光の救いあれ、神光の救いあれ、神光の救いあれ、神光の救いあれ、神光の救いあれ、神光の救いあれ、神光の救いあれ、神光の救いあれ、神光の救いあれ、神光の救いあれ……」

	CreateVOICE("葉月","ch08/16100450hd");
	SoundPlay("葉月", 0, 300, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text119]
あ……！

この人、何度か会ったことがあるぞ。
看護師の葉月さんだ。

そうか、ここはＡＨ東京総合病院の精神科。彼女がいて当然だ。僕だってこの１ヶ月だけでも２回もお世話になっている。

それならちょうどいい、彼女に声をかければ、すぐに介抱してくれるはず――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SoundPlay("SE01", 100, 0, false);
	SoundPlay("葉月", 100, 0, false);

//ＳＥ//ナースコール
	CreateSE("SE02","SE_日常_びょういん_なーすコール_LOOP");
	SoundPlay("SE02", 0, 1000, true);

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg106_01_2_ナースステーション_a.jpg");
	Fade("背景２", 0, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
そのとき、突然緊迫感を与えるようなコール音が響いた。

葉月さんはハッとしてクリップボードを置くと、手許のスイッチかなにかを操作する。
{	CreateSE("SE03","SE_じん体_動作_のぞく");
	SoundPlay("SE03", 0, 1000, false);
	Wait(1000);
	SoundPlay("SE02", 50, 0, false);}
すぐにコール音は途切れた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_じん体_動作_席を立つ_勢いよく");
	CreateSE("SE04","SE_じん体_動作_足_走る_LOOP");
	SoundPlay("SE03", 0, 1000, false);
	Wait(1000);
	SoundPlay("SE04", 0, 1000, false);
	Wait(1000);
	SoundPlay("SE04", 3000, 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601020]
どうやらナースコールの呼び出しだったらしくて、彼女は慌ただしくナースステーションを飛び出していってしまった。

どうして、僕に気付いてくれないんだろう。
すぐ後ろで、こんなに苦しんでるって言うのに。

立っていられない。
目眩がひどい。

{	CreateSE("SE01","SE_はいけい_びょういん_LOOP");
	SoundPlay("SE01", 2000, 500, true);}
僕は仕方なく、ナースステーションの中に入り、看護師さんが戻ってくるまで待っていることにする。

{	CreateSE("SE03","SE_日常_家具_イス_きしむ");
	SoundPlay("SE03", 0, 1000, false);}
さっき葉月さんが立っていた場所にスツールを見つけ、そこに腰掛けた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16100460ta">
「はあ……はあ……」

頭が痛い。
一週間前の地震のときみたいだ。

でもあのときとは痛みの質が違う……ような気がする。

なにか飲みたい。
荒い呼吸を繰り返していたせいか、呼吸するだけでのどが痛む。

何気なく周囲を見回す。

葉月さんが持っていたクリップボード。
そこに描かれているものが、視界に入った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景３", 100, 0, 0, "cg/bg/bg187_01_3_カルテはりつけ_a.jpg");
	Fade("背景３", 300, 1000, null, true);
	Wait(1000);
	Fade("背景３", 300, 0, null, true);
	SoundPlay("SE01", 1000, 0, false);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602020]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16100470ta">
「え…………？」

いつも、葉月さんは、診察中、優しい笑みを浮かべながら、このクリップボードになにかを書き込んでいた。

処方するべき薬の名前とか、体温の数値とかだと思っていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16100480ta">
「え……？」

だから、なぜそこに、それが描かれているのか、
僕は理解できなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	BGMPlay360("CH01", 3000, 1000, true);

//イメージＢＧ//カルテのような紙に落書きされたネタ画像
//ネタ画像＝１章冒頭でグリムが拓巳に見せた、『スプー』のようなイラスト
//カルテに数値や薬の名前などは書かれていない
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg187_01_3_カルテはりつけ_a.jpg");
	Fade("背景１", 1000, 1000, null, true);

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text021]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16100490ta">
「これ……って……？」

以前にも、どこかで――

このへたくそな絵を、僕は見たことがある――

どこだった？
どこで、これを……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateTextureEX("背景３", 100, 0, 0, "cg/ev/ev014_01_1_スプー_a.jpg");
	CreateSE("SE03","SE_衝撃_ふらっしゅばっく");
	CreateColor("色１", 150, 0, 0, 1280, 720, "RED");
	Fade("色１", 0, 1000, null, true);
	SoundPlay("SE03", 0, 1000, false);
	Fade("背景３", 0, 1000, null, true);
	Wait(50);
	Fade("色１", 0, 0, null, true);
	Wait(1000);
	Fade("色１", 0, 1000, null, true);
	Fade("背景３", 0, 0, null, true);
	Wait(50);
	Fade("色１", 1000, 0, null, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601021]
頭が痛い。
刺すような痛み。

うなじのあたりにはチリチリとした感覚。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateTextureEX("背景３", 100, 0, 0, "cg/bg/bg109_01_2_黒い壁_a.jpg");
	CreateSE("SE03","SE_衝撃_ふらっしゅばっく");
	CreateColor("色１", 150, 0, 0, 1280, 720, "RED");
	Fade("色１", 0, 1000, null, true);
	SoundPlay("SE03", 0, 1000, false);
	Fade("背景３", 0, 1000, null, true);
	Wait(50);
	Fade("色１", 0, 0, null, true);
	Wait(1000);
	Fade("色１", 0, 1000, null, true);
	Fade("背景３", 0, 0, null, true);
	Wait(50);
	Fade("色１", 1000, 0, null, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602021]
――僕を見るな！

クリップボードを手に取った。
カルテのような用紙が何枚も挟んである。

めくってみた。

//おがみ：紙めくる音代用
{	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 100, 1000, null, true);
	CreateSE("SE03","SE_じん体_動作_ぺーじめくり");
	SoundPlay("SE03", 0, 1000, false);
	Fade("色１", 100, 0, null, true);}
２枚目にも、まったく同じへたくそな絵。

さらにめくる。

{	Fade("色１", 100, 1000, null, true);
	CreateSE("SE03","SE_じん体_動作_ぺーじめくり");
	SoundPlay("SE03", 0, 1000, false);
	Fade("色１", 100, 0, null, true);}
３枚目も同じ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_じん体_動作_ぺーじめくり");
	CreateSE("SE04","SE_じん体_動作_ぺーじめくり");
	CreateSE("SE05","SE_じん体_動作_ぺーじめくり");
	Fade("色１", 100, 1000, null, true);
	SoundPlay("SE03", 0, 1000, false);
	Fade("色１", 100, 0, null, true);
	Wait(200);
	Fade("色１", 100, 1000, null, true);
	SoundPlay("SE04", 0, 1000, false);
	Fade("色１", 100, 0, null, true);
	Wait(200);
	Fade("色１", 100, 1000, null, true);
	SoundPlay("SE05", 0, 1000, false);
	Fade("色１", 100, 0, null, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603021]
４枚目も。５枚目も。６枚目も。

どれも、同じ絵が繰り返し落書きされていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH*", 500, 0, true);
	CreateColor("色１", 150, 0, 0, 1280, 720, "RED");
	Fade("色１", 0, 0, null, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604021]
この絵は――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_衝撃_衝撃音02");
	CreateTextureEX("背景４", 100, 0, 0, "cg/ev/ev014_01_1_スプー_a.jpg");
	CreateTextureEX("背景５", 100, 0, 0, "cg/ev/ev006_01_3_グロ画像_a.jpg");
	CreateTextureEX("背景６", 100, 0, 0, "cg/ev/ev005_01_3_杭貼付け_a.jpg");
	SoundPlay("SE03", 0, 1000, false);
	Fade("背景４", 0, 1000, null, true);
	Wait(200);
	Fade("背景５", 0, 1000, null, true);
	Wait(200);
	Fade("背景６", 0, 1000, null, true);
	Wait(200);
	Fade("色１", 200, 1000, null, true);
	Fade("背景４", 0, 0, null, true);
	Fade("背景５", 0, 0, null, true);
	Fade("背景６", 0, 0, null, true);
	Wait(200);
	Wait(1000);
	Fade("色１", 2000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3605021]
『張り付け』だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――




//=============================================================================//
//フラグ判定
//フラグ【７章エンドフラグ①】ＯＮの場合
if($７章エンドフラグ① == true)
{

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
そして７枚目には――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(1000);

	CreateTextureEX("背景７", 100, 0, 0, "cg/bg/bg171_01_3_カルテその目_a.jpg");
	CreateSE("SE04","SE_衝撃_衝撃音01");

	Fade("背景７", 0, 1000, null, true);
	Wait(400);
	SoundPlay("SE04", 0, 1000, false);

	Wait(1000);

//イメージＢＧ//クリップボードに挟まれたカルテに書かれた「その目だれの目？」
//７章妄想トリガーで使用したもの
//合流３へ

}
//=============================================================================//

	Wait(2000);

//フラグ判定
//フラグ【７章エンドフラグ①】ＯＦＦの場合
//テキストなし
//合流３へ


//合流３
//～～Ｆ・Ｏ

}