//<continuation number="690">




chapter main
{

	$PreGameName = "boot_第九章";

	if($GameStart != 1)
	{
		$GameName = "ch09_188_妄想トリガー４３■";
		$GameContiune = 1;
		Reset();
	}

		ch09_188_妄想トリガー４３■();
}


function ch09_188_妄想トリガー４３■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//☆☆☆
//妄想トリガー
//ポジティブ妄想→分岐１０
//ネガティブ妄想→分岐１１
//妄想しない→分岐１２

if($妄想トリガー通過４３ == 0)
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
			$妄想トリガー４３ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー４３ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー４３ = 0;
		}
	}
}


//=============================================================================//

if($妄想トリガー４３ == 2)
{
//☆☆☆
//分岐１０
//フラグ【９章エンドフラグ①】ＯＮ
	$９章エンドフラグ① = true;

//ＣＧ//１章の「七海来訪」を使ってください
//１章のＣＧと違うのは「夜であること」「右手の手首に包帯を巻いていること」

	CreateTextureEX("back03", 100, 0, -480, "cg/ev/ev801_02_3_七海来訪_a.jpg");
	Fade("back03", 500, 1000, null, true);

	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800010na">
「あ、やっと出てきた」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Move("back03", 1000, @0, @+480, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800020na">
「生存かくに～ん☆」

僕が扉を開けるなり、七海が笑顔で手を振ってきた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18800030ta">
「…………っ」

僕は凍り付く。
あまりにも、七海の態度が普通だから。
あまりにも、いつもと同じテンションだから。

そしてその右手首に、やっぱり白い包帯が巻かれているのが見えたから。

つい数時間前にかけてきた電話。
“右手を返して”っていうあの苦しげな声。

今、目の前で僕に向けてきている笑み。
右手に巻いた包帯。

矛盾する。
七海は、矛盾している。

ああ、そうか。

きっとこいつも、妄想に違いない。

七海なんていう妹は、そもそも初めから存在していなかったんだ。

そうだ。
そうに、決まってる……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 500, 500, 0, 1000, null, true);

	CubeRoom4("ルーム", 100, 0);
	MoveCube("ルーム", 50, 0, 0, 150, null, true);
	Rotate("ルーム", 50, 0, -60, 0, Null, true);

	Rotate("ルーム", 1000, 0, -90, 0, Null, false);
	MoveCube("ルーム", 1000, 0, -200, 150, Axl1, false);
	Fade("ルーム", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
僕は七海を無視して、部屋の中に引き返すと、ソファに腰を下ろした。

星来たんのフィギュアを、もう一度きつく握りしめる。
力を込めすぎて、手の方が少し痛かった。でもどうせ、その痛みさえも妄想だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu七海_制服_通常","shock", 200, @+150);
	FadeStand("bu七海_制服_通常_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800040na">
「おにぃ、どしたの？　元気ないじゃん」

この世のすべては妄想でできている。
僕の脳内だけで展開される妄想だ。

僕も、こうして見ている妄想も、なにもかもニセモノなんだ。

{	Stand("bu七海_制服_通常","pride", 200, @+150);
	FadeStand("bu七海_制服_通常_pride", 300, true);
	DeleteStand("bu七海_制服_通常_shock", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800050na">
「徹夜でゲームでもやってたの？　もっと人間らしい生活したら」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18800060ta">
「……れ……」

{	Stand("bu七海_制服_通常","normal", 200, @+150);
	FadeStand("bu七海_制服_通常_normal", 300, true);
	DeleteStand("bu七海_制服_通常_pride", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800070na">
「え？　なになに？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18800080ta">
「……だまれ……」

{	Stand("bu七海_制服_拗ね","angry", 200, @+150);
	DeleteStand("bu七海_制服_通常_normal", 500, false);
	FadeStand("bu七海_制服_拗ね_angry", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800090na">
「ちょっとぉ。そんな言い方しなくてもいいじゃん……」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800100na">
「おにぃだからってなに言っても許される、とか思ってる？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18800110ta">
「黙れよ……妄想妹……が……」

{	Stand("bu七海_制服_通常","shock", 200, @+150);
	DeleteStand("bu七海_制服_拗ね_angry", 500, false);
	FadeStand("bu七海_制服_通常_shock", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800120na">
「もーそー？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu七海_制服_通常_shock", 300, true);
	Rotate("ルーム", 2000, 80, -90, 0, Axl1, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
僕はソファの背もたれに身を預け、天井を見上げた。
特に深い意味もなく、そこにあるサビを数え始める。

七海を視界に入れたくなかった。
自分が虚しくなるだけだから。

まあ、虚しくなってもどうでもいいんだけどね、なにしろ僕は妄想の存在だからさ……。

//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800130na">
「ねえ、おにぃ。ホントに平気？　いつもと全然様子が違うけど……」

一人前に僕の心配かよ……。
妄想妹に心配されている。
それが、僕に苛立ちを湧き立たせる。

っていうか、こいつはなんで勝手に部屋に入ってきてるんだ。

//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800140na">
「あ、分かった！　お腹空いたんでしょ」

ギリリと、僕は歯噛みして。

//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800150na">
「だったらナナがなにか作ろうか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18800160ta">
「取れ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//◆鶏＝とり
//◆「とれ」と「とり」の聞き間違い

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800170na">
「ん？　鶏って言った？　鶏肉？」

誰も鶏なんて一言も言ってない。

//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800180na">
「鶏肉だと……やっぱ唐揚げかなあ。でもひとりで作ったことないし……」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800190na">
「あ、別に、おにぃのリクエストがあったから作るわけじゃないからね。ナナも今日は鶏肉でなにか作りたいなあって思ってただけだよっ」

この七海は、ウザい。
本物に似ているのが許せない。

いや、えっと、あれ……。
“本物の七海”なんて存在しないんだっけ？
じゃあこの七海こそ本物？　の七海？

頭がこんがらがる。

だから僕は。

考えるのをやめた。
どうでもいい。
結局は全部妄想だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18800200ta">
「包帯……取れ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18800210ta">
「取ってみろ……ボケが……」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800220na">
「包帯って、ああ、これ？」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800230na">
「転んで打撲しただけだし」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18800240ta">
「…………」

打撲……。

ホントか？
ウソか？
取れば分かるさ。

//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800250na">
「ホント、わがままなおにぃだなぁ」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800260na">
「じゃあ約束してよ。
ナナが包帯取って見せたら、おにぃも元気出すって」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//ＳＥ//包帯を取る音
	CreateSE("SE02","SE_じん体_動作_すかーと裾まくり");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
衣擦れの音が、静かな部屋に響く。
耳鳴りが、する。
頭が痛い。

それらも妄想。だから気にしない。

//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800270na">
「はい。これで満足？」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800280na">
「って、ちょっとおにぃ！
わざわざ取ったんだから、ちゃんと見てよぅ」

{	Rotate("ルーム", 2000, 0, -90, 0, AxlDxl, false);}
僕はのろのろと目線を下ろす。


七海が制服の袖をたくし上げ、右手首を僕の方に突き出している。
その、細い腕に――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	WaitAction("ルーム", null);

	CreateSE("SE02","SE_じん体_心臓_鼓動");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	CreateColor("back10", 1000, 0, 0, 1280, 720, "Black");
	Fade("back10", 0, 0, null, false);
	Fade("back10", 300, 1000, null, true);

	Delete("ルーム");

//ＣＧ//七海の手に「その目だれの目？」という、カミソリでつけた傷によって字が書かれ、血が滴っている
//ＳＥ//心臓の鼓動
	CreateSE("SE03","SE_じん体_手首_たれる血");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	Wait(500);

	CreateSE("SE36001","SE_衝撃_衝撃音02");
	CreateTextureEX("back3601", 1500, 0, 0, "cg/ev/ev142_01_1_七海その目誰の目_a.jpg");

	MusicStart("SE36001",0,1000,0,1000,null,false);
	Fade("back3601", 0, 1000, null, true);
	FadeDelete("back10", 0, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
血が、滴り。
リストカットした傷で、描かれた字は。

//	Stand("bu七海_制服_通常","angry", 200, @+150);
//	FadeStand("bu七海_制服_通常_angry", 0, true);
//◆無感情でささやき
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800290na">
「その目、だれの目？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
//ＢＧ//拓巳の部屋

//おがみ：実績：その目
	Eyes();

	DelusionOut();

	Delete("*");

	CubeRoom4("ルーム", 100, 0);
	MoveCube("ルーム", 0, 0, -100, 100, null, true);
	Fade("ルーム", 0, 1000, null, true);
	Rotate("ルーム", 500, 0, -90, 0, Null, true);

	Stand("bu七海_制服_通常","pride", 200, @+150);
	FadeStand("bu七海_制服_通常_pride", 0, true);

	DelusionOut2();
	PositiveHuman();

	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 1000, 500, 0, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
視界に閃光が走って。
僕が見たその異様な手首の傷は、その閃光が消えたときにはきれいさっぱりなくなっていた。

僕は荒くなった息を整える。
唇をきつく噛みしめる。

七海は、包帯を外した自分の手をさすっていた。

//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800300na">
「青あざ、だいぶ消えてくれたなあ。最初はすごく腫れてたんだよ」

それがホントなのかどうか、分からない。

確かに傷なんてない。
でもさっきはあった。

もう、なにも分からない。
考えたくもない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu七海_制服_通常_pride", 300, true);
	Rotate("ルーム", 3000, 80, -90, 0, Axl1, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
僕はまた、ソファに首を預ける。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18800310ta">
「ねえ、七海……」

妹――なのかどうかも定かじゃない女――に、視線を向けないまま僕は呼びかける。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18800320ta">
「お前が本物でもニセモノでも、どっちでもいいよ……」

今の僕が求めているのは、ただひとつ――

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18800330ta">
「僕を、殺して、くれないか……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
//合流４へ
}


//=============================================================================//

if($妄想トリガー４３ == 1)
{
//☆☆☆
//分岐１１

	CreateTextureEX("back03", 100, 0, 0, "cg/ev/ev082_01_3_七海ゾンビ_a.jpg");
	Fade("back03", 1000, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
そこに立っていたのは、確かに七海だった。

でも、雨も降っていないのに、なぜか全身びしょ濡れで。
着ている制服の裾から、水滴がひっきりなしに垂れている。
うなだれ、前髪に隠れて、その表情はよく見えない。

さっきまでの、やたらと怒鳴っていたうるささがウソみたいに、一言も喋ろうとしない。

と、七海はのろのろとこっちに手を伸ばしてきた。
その、右手に。
手首は、なかった。

袖に隠れて、はっきりとは見えないけど。
ないんだ。
手が。

//◆低い声
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800340na">
「お……にぃ……」

まるで七海じゃないような、低い声。

//◆低い声
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800350na">
「お……にぃ……」

ゆっくりと、七海が顔を上げた。

その肌は、土気色で、かさかさで、荒れまくっていて。
唇はどす黒い色になっていて。

ふたつの目の奥は、空洞だった。
眼球が、存在しなかった。
深い黒。

落ちくぼんだその空間から。
ウジ虫が、一匹、這い出てきた。

これは、死体だ。
七海の死体が、動き、喋っている。

//◆低い声
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800360na">
「お……に……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
腐臭を放つ七海の左手が、僕の首をつかむ。
ゾッとするくらいに冷たい手。

その握力は、尋常じゃなかった。
女子の力とは思えない。男子でもこんな握力のヤツなんてほとんどいない。

首の骨が、砕けるかのような感覚。

息が苦しい。
僕は咳き込む。
七海の手はどんどん強く圧迫してくる。

死ぬ――

僕は手を振り回し。
でも、すぐにもがくのをやめた。

殺してくれるのなら、
さあ、殺せ……。

七海の亡霊に殺されるのなら、少しは気が楽だ。
お前がそんな姿になったのは、僕のせいだから。
僕を殺すのは、七海こそふさわしい。

だから、早く――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("BlackAll", 200, 0, 0, 1280, 720, "Black");
	Fade("BlackAll", 0, 0, null, false);
	Fade("BlackAll", 1000, 1000, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
僕は目を閉じて。
身を委ねる。

早く、僕の首の骨を砕いてくれ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
//ＢＧ//拓巳の部屋
	DelusionOut();
	Delete("*");

	CubeRoom4("ルーム", 100, 0);
	MoveCube("ルーム", 0, 0, -100, 100, null, true);
	Fade("ルーム", 0, 1000, null, true);
	Rotate("ルーム", 500, 0, -90, 0, Null, true);

	Stand("bu七海_制服_通常","normal", 200, @+200);
	FadeStand("bu七海_制服_通常_normal", 0, true);
	DelusionOut2();
	NegativeHuman();

	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 500, 500, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
七海の死体の姿は一瞬でかき消えた。

扉のところに立っていたはずの僕は、いつの間にかソファに座っていた。手には星来たんを握りしめている。

七海が、部屋の真ん中に立って普通に喋っていた。

右手には包帯を巻いてはいるけど、ちゃんと繋がっていた。

肌だって普通だし、身体は濡れてなんていないし、瞳だってちゃんとある。

今のが妄想だと気付いて、ガッカリした。
なんで妄想なんだ。
なんで現実じゃなかったんだ。

//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800370na">
「おにぃ、もしかしてお腹すいてる？」

七海はそんな僕のため息に気付き、前屈みになって顔をのぞき込んできた。

//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800380na">
「だからさっきから全然元気ないんでしょ」

{	Stand("bu七海_制服_通常","shy", 200, @+200);
	FadeStand("bu七海_制服_通常_shy", 300, true);
	DeleteStand("bu七海_制服_通常_normal", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800390na">
「しょうがないから、ナナがなんか作ったげるよ」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800400na">
「んー、なにがいいかなあ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu七海_制服_通常","smile", 200, @+200);
	FadeStand("bu七海_制服_通常_smile", 300, true);
	DeleteStand("bu七海_制服_通常_shy", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800410na">
「あ、そうだ。オムライスにしようかな」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800420na">
「最近、卵を半熟にするのがマイブームなんだ。すごいでしょ？」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800430na">
「おにぃも、ひとり暮らしなんかしなかったら、ナナのおいしいおいしい半熟オムライスを食べられたのに」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800440na">
「もったいないことしたねー」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
七海はやたらと喋り続けている。
しかもどことなく上機嫌に見える。
いつもは、ここに来る度にぐちぐちと文句を垂れるのに。

この七海は、本物か？
さっきかけてきた電話とは全然テンションが違う。
白々しいくらいに違う。

だから、目の前にいるこの七海も妄想なんじゃないかって思えてくる。

この世のすべては妄想でできている。
僕の脳内だけで展開される妄想だ。
僕も、こうして見ている妄想も、なにもかもニセモノなんだ。

例え本物だったとしても、もうどうでもいいことだけど。

僕は妄想の存在で、こいつのホントの兄じゃないんだから。血縁なんか、ないんだから。

もう、なにも考えたくもない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18800450ta">
「ねえ、七海……」

{	Stand("bu七海_制服_通常","normal", 200, @+200);
	FadeStand("bu七海_制服_通常_normal", 300, true);
	DeleteStand("bu七海_制服_通常_smile", 0, true);}
妹――なのかどうかも定かじゃない女――に、視線を向けないまま僕は呼びかける。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18800460ta">
「お前が本物でもニセモノでも、どっちでもいいよ……」

今の僕が求めているのは、ただひとつ――

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18800470ta">
「僕を、殺して、くれないか……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
//合流４へ
}


//=============================================================================//

if($妄想トリガー４３ == 0)
{
//☆☆☆
//分岐１２

	CreateBG(100, 1000, 0, 0, "cg/bg/bg026_01_3_拓巳部屋_a.jpg");
	Stand("st七海_制服_拗ね","sad", 200, @+150);
	FadeStand("st七海_制服_拗ね_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800480na">
「あ……」

僕が扉を開けると、七海はわずかにピクリと身を震わせ、黙り込んだ。

//◆元気ない
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800490na">
「おにぃ……」

さっきまであんなにもぎゃーぎゃーわめいていたのに、いきなり神妙な態度になる。

僕は戸惑う。
こんな七海はあんまり見たことがない。

だから、考えてしまう。
この七海は、本物なのかどうか。

//◆元気ない
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800500na">
「いるなら、早く出てよぅ……」

//◆おずおずと
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800510na">
「……入って、いい？」

僕はなにも答えなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st七海_制服_拗ね_sad", 500, true);


//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	CubeRoom4("ルーム", 100, 0);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);



	Rotate("ルーム", 0, 0, -50, 0, Axl1, false);
	MoveCube("ルーム", 0, 0, 100, 50, null, true);
	Rotate("ルーム", 1000, 0, -90, 0, Axl1, false);
	MoveCube("ルーム", 1000, 0, -100, 150, Axl1, false);
	MusicStart("SE01", 500, 500, 0, 1000, null, true);
	Fade("ルーム", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text100]
問いかけを無視して部屋の中に引き返し、ソファに腰を下ろした。

星来たんのフィギュアを、もう一度きつく握りしめる。
力を込めすぎて、手の方が少し痛かった。でもどうせ、その痛みさえも妄想だ。

//◆切ないブレス
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800520na">
「…………」

七海は僕の後に続いて、黙って部屋に入ってきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu七海_制服_拗ね","sad", 200, @+200);
	FadeStand("bu七海_制服_拗ね_sad", 500, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
それから、どうしたらいいのか分からないっていう様子で、散らかっている雑誌を少しずらし、床にしゃがみ込む。

//◆切ないブレス
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800530na">
「…………」

なにも喋らない。
いつもなら、すぐさま説教を垂れ始めるのに。

膝を抱え、浮かない顔で床の一点を見つめている。
右手の袖の下から、わずかに包帯がのぞいていた。

そんな座り方してるとパンツが見えるぞ、と言おうとしたけどやめた。

この七海は、きっと妄想だ。
僕も妄想だし。

この世のすべては妄想でできている。
僕の脳内だけで展開される妄想だ。

僕も、こうして見ている妄想も、なにもかもニセモノなんだ。

だから、パンツが見えようが素っ裸で街を歩こうが、どうでもいいんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu七海_制服_拗ね_sad", 300, false);
	Rotate("ルーム", 3000, 70, -90, 0, Axl2, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
僕は七海から目をそらし、天井を見上げる。
特に深い意味もなく、そこにあるサビを数え始める。

七海を視界に入れたくなかった。
自分が虚しくなるだけだから。

沈黙が流れる。
ＰＣのファンの音だけが、この狭い室内に響いている。

いつも、七海が来るとこのベースはウザいくらいに騒がしくなったのに。
その記憶さえも妄想だったのかもしれない。

//◆寂しそう
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800540na">
「ねえ、おにぃ……」

//◆寂しそう
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800550na">
「なにか、喋ってよ……」

元気のない声。
やっぱりいつもの七海じゃない。
だから、こいつは妄想だ。

//◆寂しそう
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800560na">
「どうして、なんにも言ってくんないの……？」

//◆寂しそう
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800570na">
「包帯のこととか……気に、なんないの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18800580ta">
「…………」

僕は天井のサビを数える作業に集中する。

興味なんてない。
お前は妄想だ。
本物だとしても、僕とはもう無関係だ。

僕は妄想だったんだから、こいつとは血縁でもなんでもない。

//◆寂しそう
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800590na">
「なにか、言って……お願いだから……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//包帯を取る音
	CreateSE("SE02","SE_じん体_動作_すかーと裾まくり");
	MusicStart("SE02", 0, 500, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
唐突に、衣擦れの音が、静かな部屋に響く。
耳鳴りが、する。

頭が痛い。
それらも妄想。だから気にしない。

七海がこの場で脱ぎ出そうが、その包帯を外し始めようが、どんな突拍子のない行動を取り始めたって、驚かない。興味がない。

これは妄想。僕も妄想。脈絡がなくて当然。
それで完結してるんだ。

//◆元気ない
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800600na">
「ほら……見てよ……」

僕は、見ない。
見るのが、怖い。

//◆元気ない
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800610na">
「青あざ、だいぶ消えてくれたなあ……。最初は、すごく腫れてたんだよ」

//◆元気ない
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800620na">
「バスケしてて、転んで打撲したんだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18800630ta">
「…………」

//◆元気ない
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800640na">
「……見ても、くれないの？」

//◆元気ない
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800650na">
「ナナって、おにぃに心配されたこと、一度もないなあ……」

//◆元気ない
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18800660na">
「逆は、しょっちゅうなのに……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601015]
もう、なにも見たくない。
なにも考えたくもない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18800670ta">
「ねえ、七海……」

妹――なのかどうかも定かじゃない女――に、視線を向けないまま僕は呼びかける。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18800680ta">
「お前が本物でもニセモノでも、どっちでもいいよ……」

今の僕が求めているのは、ただひとつ――

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18800690ta">
「僕を、殺して、くれないか……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
//合流４へ
}

	SetVolume("SE*", 2000, 0, null);


	Wait(2000);

}