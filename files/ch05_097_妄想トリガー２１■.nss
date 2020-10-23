//<continuation number="1430">




chapter main
{

	$PreGameName = "boot_第五章";

	if($GameStart != 1)
	{
		$GameName = "ch05_097_妄想トリガー２１■";
		$GameContiune = 1;
		$GameDebugSelect = 1;
		Reset();
	}

		ch05_097_妄想トリガー２１■();
}


function ch05_097_妄想トリガー２１■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTexture360("back14", 100, 0, 0, "cg/bg/bg075_01_1_ＭＨＶ店内_a.jpg");
	Stand("bu梨深_制服_通常","angry", 200, @+150);
	FadeStand("bu梨深_制服_通常_angry", 0, false);
	Delete("back0*");

	CreateSE("SE03","SE_はいけい_しーでーしょっぷ店内_LOOP");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	MusicStart("SE03", 0, 1000, 0, 1000, null, true);

//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐４へ
//ネガティブ妄想→分岐５へ
//妄想しない→分岐６へ

if($妄想トリガー通過２１ == 0)
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
			$妄想トリガー２１ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー２１ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー２１ = 0;
		}
	}
}


if($GameDebugSelect == 1)
{
	SetChoice03("あやせ白下着","あやせスク水","あやせ制服");
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
			$あやせ白下着 = true;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$あやせスク水 = true;
		}
		case @選択肢３:
		{
			ChoiceC03();
		}
	}
	$GameDebugSelect = 0;
}


//=============================================================================//

if($妄想トリガー２１ == 2)
{
//☆☆☆
//分岐４
//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ

	SetVolume("SE03", 0, 0, NULL);

	DelusionIn();

	Delete("*");

	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg075_01_1_ＭＨＶ店内_a.jpg");

	DelusionIn2();


	BGMPlay360("CH05", 2000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
梨深は少し恥ずかしそうに頬を染め――

それから、意を決したようにささやいた。

{	Stand("bu梨深_制服_通常","normal", 200, @+150);
	FadeStand("bu梨深_制服_通常_normal", 500, true);}
//◆ウィスパー、艶っぽく
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700010ri">
「あたしのこと、好きにしていいよ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700020ta">
「え……」

その言葉の意味を理解して、僕はキョドってしまう。

冗談なのか本気なのか、梨深の真意が分からない。

ひとまず彼女から目をそらそうとした。
ところがそれより先に――

{	DeleteStand("bu梨深_制服_通常_normal", 500, true);
	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 500, true);}
//◆ウィスパー
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700030ri">
「しゃがんで」

チラリと周囲を窺った梨深が、僕の肩を押さえつけるように力を入れてくる。

僕は訳も分からずそれに従った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("back03", 300, 0, 0, 1280, 720, "Black");
	Fade("back03", 0, 0, null, false);
	DeleteStand("bu梨深_制服_通常_normal", 500, false);
	Fade("back03", 500, 1000, null, true);
	Stand("bu梨深_制服_通常","normal", 400, @0);
	FadeStand("bu梨深_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
膝を抱えるようにして、ＣＤの陳列棚に背中を預ける。

いったいどういうつもりなのか戸惑っていると、梨深も僕の前にしゃがみ込んだ。

//◆ウィスパー
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700040ri">
「膝伸ばして」

それはつまり、床に直接座り込めっていうこと？

{	DeleteStand("bu梨深_制服_通常_normal", 500, true);}
そんなＤＱＮみたいな真似はしたくなかったけど、梨深は僕のふくらはぎを抱えるようにして、無理矢理足を伸ばすよう要求してくる。

やむなく、僕は地べたに足を投げ出した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_じん体_動作_のぞく");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

//ＣＧ//座った拓巳の上に馬乗り梨深
	CreateTextureEX("back05", 100, 0, -80, "cg/ev/ev043_01_2_梨深CD貸してくれたら_a.jpg");
	Request("back05", Smoothing);
	Fade("back05", 0, 1000, null, true);

	FadeDelete("back03", 1000, true);

	Wait(1500);

	Move("back05", 2000, 0, 0, null, false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆甘いブレス
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700050ri">
「…………」

と、なにを思ったか梨深が僕の足の上に馬乗りになる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700060ta">
「ちょ……」

//◆黙って、という意味
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700070ri">
「シッ」

梨深の人差し指が、僕の唇に添えられた。
黙れ、ということらしい。

で、でも、店の中で、こんなこと――

僕の考えを読んだかのように、梨深がはにかんだ。

//◆ウィスパー
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700080ri">
「ここ……インディーズのコーナーって、
お客さんあんまり来ないよね……」

//◆ウィスパー
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700090ri">
「こうしてしゃがんだら……周りから見えなくなっちゃう……」

そ、それがなんだって言うんだ……

//◆ウィスパー
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700100ri">
「ねえ……タク」

梨深が顔をさらに寄せてくる。
吐息が僕の頬にかかる。

熱い……吐息。

僕は魅せられたように、梨深の潤んだ瞳から目をそらせない。吸い込まれそうになる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//◆甘い吐息
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700110ri">
「…………」

梨深もまた、僕をまっすぐ見つめている。

そうしたまま、手だけを動かして……

僕のブレザーのボタンを、ひとつひとつ外していく。

//◆ウィスパー
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700120ta">
「な……なに……を……」

問いかけに答えず、梨深はさらに僕のネクタイに手をかける。引っ張るようにしてほどき、続いてシャツのボタンまで外し出す。

//◆ウィスパー
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700130ta">
「ね、ねえ……ひ、人が……来る……」

//◆ウィスパー
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700140ri">
「そうだね……」

//◆ウィスパー
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700150ri">
「人が来たら……すごく、まずいよね……」

言葉とは裏腹に、梨深の細い手が、僕のはだけた胸元からシャツの中に入ってくる。

肌の上を、ひんやりとした手がゆっくりと滑る。

//◆ウィスパー
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700160ta">
「あ……う……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700170ri">
「ふふっ」

妖艶な笑み。

普段は明るくて元気で、あまり性的な雰囲気を感じさせない梨深が見せたその表情に、僕の胸は切なくなった。

//◆ウィスパー
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700180ri">
「タクの胸、ドキドキ……してる」

//◆ウィスパー
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700190ta">
「り、梨深って……テラエロス……」

//◆ウィスパー
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700200ri">
「テラエロスぅ……？」

あ、しまった……。
つい思ってることを口に出しちゃった……。

それだけ、僕は動揺していた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//◆ウィスパー、いたずらげに
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700210ri">
「それって、どういう意味かな……？」

//◆ウィスパー、いたずらげに
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700220ri">
「教えてよ、タク……」

すごく……エロいっていう意味です……。

梨深の指先が、僕の肌の上や首筋を、這うように愛撫する。

くすぐったくて……それ以上に気持ちいい。

//◆ウィスパー
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700230ri">
「あたしのこと……好きにしたくなってきた……？」

本能の赴くままに、僕はコクコクとうなずいていた。

//◆ウィスパー
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700240ri">
「じゃあ……」

//◆ウィスパー
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700250ri">
「ここで……しちゃおっか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700260ta">
「な……」

耳を疑った。
しちゃおっか……だって？
それって……

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700270ta">
「な、なにを？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH05", 0, 0, NULL);

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
	DelusionOut();

	Delete("*");

	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg075_01_1_ＭＨＶ店内_a.jpg");

	DelusionOut2();
	PositiveHuman();


//ＢＧ//ＭＨＶ店内

	Stand("bu梨深_制服_通常","hard", 200, @+150);
	FadeStand("bu梨深_制服_通常_hard", 500, true);

	CreateSE("SE03","SE_日常_ねっとかふぇ_空調_LOOP");
	MusicStart("SE03", 500, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700280ri">
「……お～い」

ハッと、我に返った。

梨深が、不思議そうに眉をひそめて僕の顔の前で手を振っていた。

僕は床に座っていないし、梨深が僕の足の上に馬乗りになっていることもない。

ただ普通に向かい合って立っているだけ。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700290ri">
「どうしたの？　急に意識がどこかに飛んじゃってたみたいだけど」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700300ta">
「な、ななな、なんっ、でも、な、なな、いっ！」

{	Stand("bu梨深_制服_通常","smile", 200, @+150);
	FadeStand("bu梨深_制服_通常_smile", 500, true);
	DeleteStand("bu梨深_制服_通常_hard", 0, true);}
//◆苦笑
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700310ri">
「お、落ち着けー」

僕は梨深から一歩飛び退き、背中を向けて深呼吸した。

はあ……エ、エロい妄想をしてしまった……。

僕って最低だ。かなり自己嫌悪。

いやいや、見返りだとかなんだとか言い出す梨深も悪いんだ。そんな思わせぶりなエロセリフを口にされたら、男なら誰だって想像しちゃうよ……。

そ、そう言えば、結局見返りってなんだったんだろう……。

{	Stand("bu梨深_制服_通常","hard", 200, @+150);
	FadeStand("bu梨深_制服_通常_hard", 500, true);
	DeleteStand("bu梨深_制服_通常_smile", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700320ri">
「その調子だと、話聞いてなかったでしょ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700330ta">
「う、うん……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700340ri">
「じゃあもう一回言うけど……」

{	Stand("bu梨深_制服_正面","normal", 200, @+150);
	DeleteStand("bu梨深_制服_通常_hard", 500, false);
	FadeStand("bu梨深_制服_正面_normal", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700350ri">
「あたしのお気に入りＣＤを貸すっていうので
手を打ってくれないかな？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700360ta">
「は……？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700370ri">
「ねえねえ、いいでしょ？　お願いします、この通り！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700380ta">
「…………」

ま、まあ現実はこんなものだよな。

って言うか、僕は三次元の女子に興味はなかったはずなのに、どうして梨深とそういうことになる妄想をしたんだろう。

{	Stand("bu梨深_制服_通常","happy", 200, @+150);
	DeleteStand("bu梨深_制服_正面_normal", 500, false);
	FadeStand("bu梨深_制服_通常_happy", 500, true);}
僕が梨深の申し出にあっさりうなずくと、彼女はガッツポーズをして喜んでいた。

その姿がおかしくて、こんな危機的状況なのに僕はつい笑ってしまった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	ClearAll(1000);

	Wait(500);

//～～Ｆ・Ｏ
//合流２へ

}


//=============================================================================//

if($妄想トリガー２１ == 1)
{
//☆☆☆
//分岐５
//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ
	DelusionIn();

	Delete("*");

	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg075_01_1_ＭＨＶ店内_a.jpg");

	Stand("bu梨深_制服_通常","angry", 200, @+150);
	FadeStand("bu梨深_制服_通常_angry", 500, true);

	DelusionIn2();

	CreateSE("SE03","SE_はいけい_しーでーしょっぷ店内_LOOP");
	MusicStart("SE03", 1000, 1000, 0, 1000, null, true);

	BGMPlay360("CH10", 1000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700390ri">
「たたき割ってあげる」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700400ta">
「……はい？」

た、たたき割る……？

唐突な感じがした。

梨深は、そんなＤＱＮ行為をやるような子じゃないって
思ってたのに……。

僕の戸惑いをよそに、梨深はなおも真面目に語り続ける。

{	Stand("bu梨深_制服_通常","hard", 200, @+150);
	FadeStand("bu梨深_制服_通常_hard", 500, true);
	DeleteStand("bu梨深_制服_通常_angry", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700410ri">
「そのＣＤを持ってる人は呪われちゃうの」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700420ri">
「タク、知らなかったでしょ？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700430ri">
「あたしの調べた情報によるとね」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700440ri">
「ニュージェネの被害者は、みんなそのＣＤを買った人なの」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700450ri">
「ＦＥＳの予言は……ＣＤを買った人にだけ当てはまる……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700460ri">
「ＦＥＳの……呪いなの……」

そんな……まさか……

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700470ri">
「ニュージェネ事件は、全部……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700480ri">
「ＦＥＳの仕業……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700490ri">
「急がないと……次に死ぬのは……タクだよ？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH10", 0, 0, NULL);
	SetVolume("SE03", 0, 0, NULL);

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
	DelusionOut();

	Delete("*");

	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg075_01_1_ＭＨＶ店内_a.jpg");

	DelusionOut2();
	NegativeHuman();


//ＢＧ//ＭＨＶ店内

	Stand("bu梨深_制服_通常","hard", 200, @+150);
	FadeStand("bu梨深_制服_通常_hard", 500, true);

	CreateSE("SE03","SE_はいけい_しーでーしょっぷ店内_LOOP");
	MusicStart("SE03", 500, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700500ri">
「……お～い」

ハッと、我に返った。

梨深が、不思議そうに眉をひそめて僕の顔の前で手を振っていた。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700510ri">
「どしたの？　急に意識がどこかに飛んじゃってたみたいだけど」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700520ta">
「あ、いや……な、なんでも……」

なんだ、妄想だったのか……。びっくりした……。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700530ri">
「その調子だと、話聞いてなかったでしょ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700540ta">
「う、うん……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700550ri">
「じゃあもう一回言うけど……」

{	Stand("bu梨深_制服_正面","normal", 200, @+150);
	DeleteStand("bu梨深_制服_通常_hard", 500, false);
	FadeStand("bu梨深_制服_正面_normal", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700560ri">
「あたしのお気に入りＣＤを貸すっていうので
手を打ってくれないかな？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700570ta">
「は……？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700580ri">
「ねえねえ、いいでしょ？　お願いします、この通り！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700590ta">
「…………」

ま、まあ現実はこんなものだよな。

{	Stand("bu梨深_制服_通常","happy", 200, @+150);
	DeleteStand("bu梨深_制服_正面_normal", 500, false);
	FadeStand("bu梨深_制服_通常_happy", 500, true);}
僕が梨深の申し出にあっさりうなずくと、彼女はガッツポーズをして喜んでいた。

その姿がおかしくて、こんな危機的状況なのに僕はつい笑ってしまった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	ClearAll(1000);

	Wait(500);

//～～Ｆ・Ｏ
//合流２へ

}

//=============================================================================//

if($妄想トリガー２１ == 0)
{
//☆☆☆
//分岐６

	Stand("bu梨深_制服_通常","normal", 200, @+150);
	FadeStand("bu梨深_制服_通常_normal", 300, true);
	DeleteStand("bu梨深_制服_通常_angry", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700600ri">
「えっと……」

って、考え込んじゃってるよ。

もしかしてノープランだったのかな。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700610ta">
「…………」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700620ta">
「み、見返り、なんて、いらない……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700630ri">
「え……」

{	Stand("bu梨深_制服_正面","sad", 200, @+150);
	DeleteStand("bu梨深_制服_通常_normal", 500, false);
	FadeStand("bu梨深_制服_正面_sad", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700640ri">
「それって……貸してくれないっていうこと？」

梨深はしょんぼりして、肩を落とした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu梨深_制服_正面_sad", 500, true);

	Stand("st梨深_制服_正面","sad", 200, @+150);
	FadeStand("st梨深_制服_正面_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700650ri">
「そっかぁ、残念……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700660ta">
「い、いや、違うよ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700670ta">
「見返りなんて、ひ、必要ないって、こと……。普通に、か、貸すよ……」

{	Stand("st梨深_制服_正面","normal", 200, @+150);
	DeleteStand("st梨深_制服_正面_sad", 500, false);
	FadeStand("st梨深_制服_正面_normal", 500, true);}
//◆感動している
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700680ri">
「タク……」

{	Stand("st梨深_制服_通常","smile", 200, @+150);
	DeleteStand("st梨深_制服_正面_normal", 500, false);
	FadeStand("st梨深_制服_通常_smile", 500, true);}
//◆嬉しい
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700690ri">
「ありがとうっ」

満面の笑み。
すごく嬉しそうだ。

僕に抱きついてきそうな勢い。

普段、女の子に喜ばれることなんて滅多にないから、僕まで嬉しくなる。

ゆ、勇気を出して言ってみて、よかった……。

{	Stand("st梨深_制服_通常ビシッ！","happy", 200, @+150);
	DeleteStand("st梨深_制服_通常_smile", 500, false);
	FadeStand("st梨深_制服_通常ビシッ！_happy", 500, true);}
//◆敬礼
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700700ri">
「ビシィ！　じゃあ見返りなしで借ります！」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700710ri">
「となれば、善は急げ。タクの家にレッツゴー♪」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	ClearAll(1000);

	Wait(500);

//～～Ｆ・Ｏ
//合流２へ

}

//=============================================================================//

//☆☆☆
//合流２
//ＢＧ//拓巳の部屋
	CreateTextureEX("back03", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");

	Fade("back03", 500, 1000, null, true);

	CreateSE("SE10","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE10", 500, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
なんとか無事にベースまで戻ってこられた。

もちろん梨深のおかげだ。感謝してる。

ただ、部屋の中を片付けるからちょっと待っててほしいっていう
僕の頼みをあっさり却下したのは、どうかと思う。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_通常","normal", 200, @-100);
	FadeStand("st梨深_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700720ri">
「だって、前に来たときに汚いっていうのはよーく分かったし。今さら片付けたって無駄だよ」

{	Stand("st梨深_制服_通常","happy", 200, @-100);
	FadeStand("st梨深_制服_通常_happy", 300, true);
	DeleteStand("st梨深_制服_通常_normal", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700730ri">
「かっこつけなくてもいいって。あたしとタクの仲でしょ。ね♪」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700740ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_通常","normal", 200, @-100);
	FadeStand("st梨深_制服_通常_normal", 300, true);
	DeleteStand("st梨深_制服_通常_happy", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
どんな仲なんだ……。

僕の記憶からは梨深のことはすっぽりと抜け落ちている。
だから、よく分からない。

たまに、梨深の馴れ馴れしさに驚かされる。<k>
それは決して不快ってわけじゃないけど、僕と梨深とで距離感に齟齬が生まれているのは確かだ。

そもそも部屋を片付けなくても平気だなんて、梨深は本気で言ってるんだろうか。

床には僕が食べ終わった後のコンビニ弁当の容器とかが散乱しているし、ベッドの上には過激なイラストが描かれたエロゲの箱が積み上げられているって言うのに。

よっぽど梨深の神経が太いのか、僕が警戒されていないのか。どっちにしろ複雑な気分だ……。

梨深は僕のそんな苦悩なんてまったく気付いていないらしく、ソファに座ってファンタズムのＣＤの歌詞カードを真剣に眺めている。

{	DeleteStand("st梨深_制服_通常_normal", 300, false);
	CreateSE("SE101","SE_日常_家具_イス_きしむ");
	MusicStart("SE101", 0, 1000, 0, 1000, null, false);
	CreateBG(100, 500, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");}
僕はＰＣ用のイスにどっかりと腰を下ろした。身体の緊張をほどく。

怯え続けていたからか今日は精神がすり減ったけど、それほど疲れを感じてないのは梨深が一緒にいてくれたからかな……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_通常","normal", 200, @+100);
	FadeStand("st梨深_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700750ri">
「さて、どうしよっか」

歌詞カードを閉じた梨深が、大きく伸びをしてから僕に笑みを送ってきた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700760ta">
「…………」

どうしようって言われても……どうすればいいんだ？

そもそも梨深は遊びに来たわけじゃない。
ＣＤを貸すっていうのも当初の目的じゃない。

ここに一緒にいてくれるとして、いったいなにをすればいいんだろう？

そもそもなにかをしなくちゃいけないのか？

エロゲだったら即、Ｈシーンに突入するんだろうけど……。

って、やばいやばい。
今はそういうことを考えない方がいい。

ただでさえ、三次元の女子と部屋にふたりきりっていう、僕にしてみれば緊迫のシチュエーションなんだ。

余計な妄想をしていたら意識しちゃって変なボロを出しちゃいかねない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_正面","normal", 200, @+100);
	DeleteStand("st梨深_制服_通常_normal", 500, false);
	FadeStand("st梨深_制服_正面_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700770ta">
「…………」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700780ri">
「…………」

沈黙。

梨深はぼんやりとして、床に散乱したマンガ本や、ベッドに積み上げられたエロゲを眺めている。

気まずい……。

なにか僕から喋った方がいいような気もするけど、話題と言えばゲームやアニメのことぐらいしか思い浮かばない。

梨深がそれらに詳しいとも思えないし。

そもそも一緒にいてくれるって言ったのは梨深なんだから、梨深からなにか話してくれないかな。

僕に会話のリードを期待されても困る……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_通常","normal", 200, @+100);
	DeleteStand("st梨深_制服_正面_normal", 500, false);
	FadeStand("st梨深_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700790ta">
「…………」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700800ri">
「…………」

やっぱり、三次元女子は苦手だ。

一緒にいてくれるのはありがたいけど、この沈黙のプレッシャーには耐えきれない……。

この部屋が薄暗いっていうのも問題だよね。なんだか雰囲気が淫靡っぽいって錯覚しそうだ。

いたたまれなくなって、僕はＰＣに向かった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	DeleteStand("st梨深_制服_通常_normal", 300, false);

//イメージＢＧ//ＰＣ画面
//以下、梨深は汎用絵出さないで話が進む
//ＳＥ//以下、断続的にキーボードを叩く音
	CreateBG(100, 500, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");

/*森島SEダミー*/
	CreateSE("SE03","SE_日常_PC_キーたたく_中");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
調べなくちゃいけないことがある。

{	SetVolume("SE10", 1000, 0, NULL);
	BGMPlay360("CH24", 2000, 1000, true);}
さっき学校で思いついたこと。ディソードを手に入れるためのヒントになるかもしれないこと。

“頭に描いたものを、映像化することは可能なのか”

以前、セナから教えられたＶＲ技術や“人間は電気仕掛け”っていうあたりを取っ掛かりに、さらに突き詰めて調べていってみよう。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700810ri">
「なにしてるの？」

梨深が立ち上がって、僕の方に近寄ってきた。

えーっと、せ、説明した方がいいのかな。

でもどう説明していいやら……めんどくさそう……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700820ta">
「…………」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700830ri">
「ねえねえ。なにしてるか教えてよー」

リアクションを返さないでいたら、梨深は僕の背中をつんつんと指でつついてきた。

さ、さすがに無視するわけにもいかないか……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


	CreateSE("SE04","SE_日常_PC_マウスくりっく");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	CreateBG(100, 300, 0, 0, "cg/bg/bg011_01_1_検索欄UP_a.jpg");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700840ta">
「き、君は……そのぅ、も、妄想が、げ、現実になるって、
信じられる？」

僕はブラウザに検索キーワードを入力しつつ、梨深の方は見ずに、むしろ星来たんに話しかけているつもりで口を動かした。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700850ri">
「妄想が現実に？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700860ri">
「あはは、無理でしょー」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700870ri">
「もしそれができたら、人はとっくに万能になってるよ」

万能……か。確かにそうかもしれない。

妄想っていうのはどんな非現実的なことでも可能な世界。それが現実になるなら……非現実が現実と化すっていうことになる。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700880ri">
「それがどうしたの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700890ta">
「それに、ち、近いシステムが……ア、アメリカで、
その、えっと……特許……あるんだ……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700900ri">
「え～、冗談でしょ？」

僕の背後で、梨深が呆れたようにため息をつく気配を感じる。

{	CreateSE("SE04","SE_日常_PC_マウスくりっく");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	CreateBG(100, 300, 0, 0, "cg/bg/bg139_01_3_特許_a.jpg");}
そこで、ＳＨＩＨＯが拾ってきてくれた例の特許画像を表示してやる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700910ri">
「ん？　これは？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700920ta">
「と、特許の……証拠、しゃ、写真」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700930ri">
「え、ホントに？」

梨深が身を乗り出してきて、モニタに顔を近づける。

僕の顔のすぐ横からのぞき込むような形になった。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700940ri">
「うわ、あたし英語って苦手……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700950ri">
「すごいね、タク。英語読めるなんて」

ち、近い……。

モニタの光に反射してキラキラ光る彼女の瞳の輝きまで確認できるぐらいの距離。また僕はドギマギしてしまう。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700960ri">
「ねえねえ、どういうことか教えてよ」

どうやら興味を持ったらしかった。

僕は梨深の近さはなるべく考えないようにして、とにかくモニタと星来たんだけを交互に視界に入れるよう心がける。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700970ta">
「う、生まれながらに、盲目の、ひ、人でも、ビデオカメラみたいな
……え、えっと、映像機器を、と、と、通すことで、そこに、う、
映る、景色が見えるように、な、なるんだ。これ、豆知識……な」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09700980ri">
「ビデオカメラが目の代わりっていうこと？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09700990ta">
「そ、そう。……ＶＲ、技術、って言うんだよ……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09701000ri">
「へ～。もしホントだったらすごいなあ」

だからホントなんだってば。

テストだって成功したって、セナが言ってたし。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09701010ri">
「んー、でも……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09701020ri">
「機械を使って目が見えるようになるのと、妄想が現実になるって、どう繋がるの？」

//◆苦笑
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09701030ri">
「あたし、頭悪いからよく分かんないや、たはは……」

{	CreateSE("SE04","SE_日常_PC_キーたたく_短");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	CreateBG(100, 300, 0, 0, "cg/bg/bg011_01_1_検索欄UP_a.jpg");}
梨深に説明をしつつも、引っかかりそうなキーワードで手当たり次第に検索してみるけど、なかなか思ったようなページを見つけられない。

それでも根気強く、新しいキーワードを入力し続ける。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09701040ta">
「映像機器に映る、け、景色も、脳内で思い浮かべた、も、妄想も……電気信号だから……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09701050ri">
「う～ん？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09701060ta">
「ぎゃ、逆に考えるんだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09701070ta">
「脳内に電気信号を送るんじゃなくて、脳内から電気信号を送るって、考えるんだ……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09701080ri">
「ほほ～」

返ってくるのは曖昧な返事ばっかり。

あんまりよく分かってない……のかも……。

詳しく説明するのも面倒だったから、僕はそれ以上語るのをやめた。調べ物に集中する。

まあ、別に分かってもらえなくてもいいさ。
所詮、僕が思いついた推測でしかないんだから。

//◆よく分かってない
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09701090ri">
「ふむふむ～？」

梨深はいまだにひとりでうなったりコクコクうなずいたりしている。

もうほっとこう。

いろいろ検索はかけているけど、なかなか僕の推測を実証してくれるような資料は見つからなかった。

少しアプローチの仕方を変えて、今度は特許方面から重点的に検索をかけてみよう。

ＳＨＩＨＯに教えてもらった、アメリカの特許についてまとめた海外サイトに行ってみる。

//ＳＥ//キーボードを叩く音
{	CreateSE("SE04","SE_日常_PC_キーたたく_長");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);}
そこで、それっぽい特許がないかどうか探す。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateSE("SE04","SE_日常_PC_マウスくりっく");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
//イメージＢＧ//特許登録イメージ２
//※プロットにあったものとは別。新規に架空のものを作成
	CreateBG(100, 300, 0, 0, "cg/bg/bg139_02_3_特許_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09701100ta">
「あ……！」

いくつかリンクを辿っていくうちに、ようやく前にＳＨＩＨＯが拾ってくれたものと似た雰囲気の画像がヒットした。どうやらＶＲ装置とは違う特許書類の画像らしい。

さっそく内容を読んでみる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09701110ta">
「『神経信号パルスを遠隔地からモニターし、それを映像および音声として再現する装置と方法』……！」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09701120ri">
「おお～？」

まさに僕が考えた通りの内容じゃないか！

僕は思わずイスから腰を浮かしていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09701130ta">
「こ、これ……す、すごいぞ……っ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09701140ri">
「ん？　すごいの？　なにがなにが？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09701150ta">
「か、簡単に……言うと……こ、これ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09701160ta">
「他人の“思考を盗撮する”……技術だ……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09701170ri">
「思考を……盗撮……」

つまり、人間が頭の中で考えている音や映像を、特殊な機器を使って盗み見ることができるっていうこと。

しかも神経信号パルスのモニタリングは、人工衛星を使って行うことさえ可能って書いてある……。
これなら、対象者が地球上のどこにいても盗撮は可能だ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text021]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09701180ri">
「ホントにそんなことできるの？　ＳＦ小説とか、そういう類のものなんじゃ……？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09701190ta">
「と、特許って……そのシステム自体が、か、完全に仕上がって、ないと……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09701200ta">
「ぜ、ぜ、絶対に、取得できないんだって……」

ネットで特許のことについて調べたら、そう書いてあった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09701210ta">
「だ、だか、ら……これも……ちゃ、ちゃんとシステムが、確立されてるって……ことだよ……」

これはフィクションじゃない。

システムを構築する技術力と金さえあれば、いつでも実現可能だっていうこと。

セナは、こう言っていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 5000, 0, 0, 1280, 720, "WHITE");
	Fade("色１", 0, 0, null, false);
	Request("色１", AddRender);
	Fade("色１", 100, 1000, null, true);
	CreateTextureEX("back13", 2000, 0, 0, "cg/bg/bg081_01_1_電車カットボディ窓_a.jpg");
	Stand("buセナ_制服_通常","hard", 2200, @+200);
	FadeStand("buセナ_制服_通常_hard", 0, true);
	CreateColor("back14", 2500, 0, 0, 1280, 720, "Black");
	Fade("back14", 0, 300, null, false);
	Fade("back13", 0, 1000, null, true);
	FadeDelete("色１", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text200]
//ＶＦ//回想セリフ
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch04/08200100sn">
「ある意図的な情報を、
神経パルスへコンバートすることが可能なら――」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch04/08200110sn">
「人の五感すべて、さらには人の意志そのものもコントロールできるんじゃないか？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 5000, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);
	Fade("色１", 100, 1000, null, true);
	DeleteStand("buセナ_制服_通常_hard", 0, true);
	Delete("back13");
	Delete("back14");
	FadeDelete("色１", 500, true);
	SetVolume360("CH24", 500, 1000, NULL);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text201]
その説についてはソースが出てこなかったから、あくまでセナの推測でしかない。

でも、僕が思いついた説は……ソースがあった。

なんで、こんな凄いニュースが日本ではまったく知られていないんだろう。

はっきり言ってノーベル賞ものだと思うんだけど。

僕は続けて、思考盗撮というキーワードで検索をかけてみた。

すると、アメリカのとある訴訟記録が出てきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE04","SE_日常_PC_マウスくりっく");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

//ＢＧ//ＰＣ画面（ｗｅｂページ、英文テキスト表示）
	CreateBG(100, 300, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09701240ri">
「うわ、また英文だ……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09701250ri">
「頭痛くなってきそうだよー」

けっこう長文だから、僕も読むのが面倒くさかった。

ちょっと変な文章になるかもしれないけど、翻訳ソフトを使って和訳してみる。

書かれている内容は、まとめるとこんな感じ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE04","SE_日常_PC_マウスくりっく");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
//	CreateBG(100, 0, 0, 0, "cg/bg/bg044_03_1_ワープロ文章_a.jpg");

	CreateColor("back03", 100, 0, 0, 1280, 720, "Black");
	Fade("back03", 0, 0, null, false);
	Fade("back03", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
//以下、ＢＧイメージの可能性がありますが、一応ＢＯＸ化致します。
//以下、英文ページを拓巳が意訳した内容
訴訟記録
原告、Ｎ・Ｋ・ラビン
被告、アメリカ合衆国国防総省、中央情報局

●原告による主張

//※テキストオーバー
私の思考は、特殊な機器によって盗み見られ、記録され、衛星を使っていずこかへと転送されている。

私は衛星による人質だ。昼夜絶え間なく、いくつもの衛星によって攻撃にもさらされた。

①追跡　②思考監視
③全身の監視　④バイオ周波数攻撃
⑤音声攻撃　⑥肉体の衰弱化

１９９０年１２月下旬以来、私は睡眠中に、人為的に作られた夢（映像的、および音声的内容を持ち、声の内容も含む）を見せられた。

１９９２年２月～５月にかけて、私はバイオ周波数攻撃（苦痛、拷問、ハラスメント）を受けた。

これらが私に対する攻撃だと認識し、１９９２年２月から、私はノートに以下の記録を記した。
・日付　・時間　・特に顕著で苦痛を覚えた精神攻撃の内容

バイオ周波数攻撃は私の身体のあらゆる部分に対して行われた。苦痛、拷問、ハラスメントは私の身体の一部、時には全身に、不快感、疲労、苦痛を与えるべく調整されていた。

//※テキストオーバー
主な部位は以下の通りである。

・胸部　・視覚　・下腹部
・脳（睡眠障害を引き起こすための）
・脳（人工的な夢を見させるための）

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//以上、英文ページを拓巳が意訳した内容
//以上、ＢＧイメージの可能性がありますが、一応ＢＯＸ化致します。

	CreateBG(100, 500, 0, 0, "cg/bg/bg139_02_3_特許_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text024]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09701260ta">
「思考監視、思考盗撮……しかも国家ぐるみ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09701270ta">
「……ちょ、マジ？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09701280ri">
「あー、あたしこれ知ってる。何年か前に映画で見た！」

それはフィクションでしょ……。

でも、ここに書かれている訴訟記録はそうじゃない。

可能性はふたつ。
原告がただのメンヘラか。
すべて事実か。

その境界線を見極めることは難しい。

さっきの特許から考えれば、事実なんだろうけど……。

{	SetVolume360("CH24", 1000, 0, NULL);}
だけど、セナやあやせはメンヘラじゃない。
特にあやせだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――









//フラグ判定
//フラグ【あやせ白下着】ＯＮの場合
//分岐７へ

//フラグ【あやせスク水】ＯＮの場合
//分岐８へ

//フラグ【あやせ白下着】【あやせスク水】両方ともＯＦＦの場合
//分岐９へ


//=============================================================================//
//フラグ判定
//フラグ【あやせ白下着】ＯＮの場合
if($あやせ白下着 == true)
{

//分岐７
//画面エフェクト//回想
//ＣＧ//あやせが２人いる（白下着ｖｅｒ）

	CreateColor("back14", 500, 0, 0, 1280, 720, "White");
	Fade("back14", 0, 0, null, false);
	Fade("back14", 300, 1000, null, true);
	CreateColor("back15", 300, 0, 0, 1280, 720, "Black");
	Fade("back15", 0, 300, null, false);

	if(#下着パッチ==true)
	{
		CreateTextureEX("back16", 100, 0, 0, "ex/ev/ev039_01_3_あやせ白下着_a.jpg");
	}
	else
	{
		CreateTextureEX("back16", 100, 0, 0, "cg/ev/ev039_01_3_あやせ白下着_a.jpg");
	}

	Fade("back16", 0, 1000, null, false);
	FadeDelete("back14", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text025]
あのとき……

僕の目の前で、あやせは２人になった。

“そうなった瞬間”は目撃できなかったけど、振り返ったらそこにあやせがもうひとりいて、しかもなぜか下着姿だった。

それにディソードだって、なにもないところからいきなり取り出して見せた。

あれは幻覚とか妄想じゃなかった。

あんなのを見せられたら、ただのメンヘラ呼ばわりはもうできない。

ただ、あやせはこうも言ってた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text026]
//ＶＦ//回想セリフ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch05/09701290ay">
「キミが望んだ妄想よ」

あの不思議な現象って、やっぱり……

僕が妄想した結果、あんなことになったのかな……。

確かに僕はあの直前に、あやせの下着は何色かなって頭の中で考えてた。

//ＶＦ//回想セリフ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch05/09701300ay">
「ディソードは、力を持つ人の目にしか映らない」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch05/09701310ay">
「キミには、私の剣が見えているでしょう？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch05/09701320ay">
「それが意味するのは、ひとつだけ」

あやせが言っていた“力”って、そういうことなのかな？

妄想を、現実に投影しちゃう力。
それを僕が持っているかもしれない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateColor("back14", 500, 0, 0, 1280, 720, "White");
	Fade("back14", 0, 0, null, false);
	Fade("back14", 300, 1000, null, true);
	Delete("back15");
	Delete("back16");
	CreateTextureEX("back03", 100, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");
	Fade("back03", 0, 1000, null, true);
	FadeDelete("back14", 500, true);

//合流３へ
//=============================================================================//

}
else if($あやせスク水 == true)
{

//=============================================================================//
//分岐８
//画面エフェクト//回想
//ＣＧ//あやせが２人いる（スク水ｖｅｒ）


	CreateColor("back14", 500, 0, 0, 1280, 720, "White");
	Fade("back14", 0, 0, null, false);
	Fade("back14", 300, 1000, null, true);
	CreateColor("back15", 300, 0, 0, 1280, 720, "Black");
	Fade("back15", 0, 300, null, false);

	if(#下着パッチ==true)
	{
		CreateTextureEX("back16", 100, 0, 0, "ex/ev/ev039_02_3_あやせ白下着_a.jpg");
	}
	else
	{
		CreateTextureEX("back16", 100, 0, 0, "cg/ev/ev039_02_3_あやせ白下着_a.jpg");
	}

	Fade("back16", 0, 1000, null, false);
	FadeDelete("back14", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text027]
あのとき……

僕の目の前で、あやせは２人になった。

“そうなった瞬間”は目撃できなかったけど、振り返ったらそこにあやせがもうひとりいて、しかもなぜかスク水姿だった。

それにディソードだって、なにもないところからいきなり取り出して見せた。

あれは幻覚とか妄想じゃなかった。

あんなのを見せられたら、ただのメンヘラ呼ばわりはもうできない。

ただ、あやせはこうも言ってた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text028]
//ＶＦ//回想セリフ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch05/09701330ay">
「キミが望んだ妄想よ」

あの不思議な現象って、やっぱり……

僕が妄想した結果、あんなことになったのかな……。

確かに僕はあの直前に、あやせにスク水を着せたら萌えるって頭の中で考えてた。

//ＶＦ//回想セリフ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch05/09701340ay">
「ディソードは、力を持つ人の目にしか映らない」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch05/09701350ay">
「キミには、私の剣が見えているでしょう？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch05/09701360ay">
「それが意味するのは、ひとつだけ」

あやせが言っていた“力”って、そういうことなのかな？

妄想を、現実に投影しちゃう力。
それを僕が持っているかもしれない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("back14", 500, 0, 0, 1280, 720, "White");
	Fade("back14", 0, 0, null, false);
	Fade("back14", 300, 1000, null, true);
	Delete("back15");
	Delete("back16");
	CreateTextureEX("back03", 100, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");
	Fade("back03", 0, 1000, null, true);
	FadeDelete("back14", 500, true);

//合流３へ
//=============================================================================//


}
else
{


//=============================================================================//
//分岐９
//画面エフェクト//回想
//ＣＧ//あやせが２人いる（制服ｖｅｒ）

	CreateColor("back14", 500, 0, 0, 1280, 720, "White");
	Fade("back14", 0, 0, null, false);
	Fade("back14", 300, 1000, null, true);
	CreateColor("back15", 300, 0, 0, 1280, 720, "Black");
	Fade("back15", 0, 300, null, false);
	CreateTextureEX("back16", 100, 0, 0, "cg/bg/bg092_01_3_玉川通り地下道_a.jpg");
	Stand("buあやせ_ステージ衣装_通常","normal", 200, @+150);
	Fade("back16", 0, 1000, null, false);
	FadeStand("buあやせ_ステージ衣装_通常_normal", 0, true);
	FadeDelete("back14", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text029]
あのとき……

僕の目の前で、あやせは２人になった。

“そうなった瞬間”は目撃できなかったけど、振り返ったらそこにあやせがもうひとりいた。

それにディソードだって、なにもないところからいきなり取り出して見せた。

あれは幻覚とか妄想じゃなかった。

あんなのを見せられたら、ただのメンヘラ呼ばわりはもうできない。

ただ、あやせはこうも言ってた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text030]
//ＶＦ//回想セリフ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch05/09701370ay">
「これもキミの妄想よ」

あの不思議な現象って、やっぱり……

僕が妄想した結果、あんなことになったのかな……。

//ＶＦ//回想セリフ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch05/09701380ay">
「ディソードは、力を持つ人の目にしか映らない」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch05/09701390ay">
「キミには、私の剣が見えているでしょう？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch05/09701400ay">
「それが意味するのは、ひとつだけ」

あやせが言っていた“力”って、そういうことなのかな？

妄想を、現実に投影しちゃう力。
それを僕が持っているかもしれない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("back14", 500, 0, 0, 1280, 720, "White");
	Fade("back14", 0, 0, null, false);
	Fade("back14", 300, 1000, null, true);
	DeleteStand("buあやせ_ステージ衣装_通常_normal", 0, true);
	Delete("back15");
	Delete("back16");
	CreateTextureEX("back03", 100, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");
	Fade("back03", 0, 1000, null, true);
	FadeDelete("back14", 500, true);

//合流３へ

}
//=============================================================================//




//合流３
//イメージＢＧ//ＰＣ画面

	CreateTexture360("上敷き", 100, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");
	Delete("back*");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text031]
いやいやいや。
考えが飛躍してるかも。

科学の力を使って妄想を映像として再現するシステムがあったからって、そういう超能力があるなんて突飛すぎる。

//ＶＦ//回想セリフ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch05/09701410ay">
「見つけなくちゃいけない。自分自身で」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch05/09701420ay">
「方法なんて、私にも分からないのよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09701430ta">
「…………」

ただ、もしも……

ディソードを手に入れる方法っていうのが、まさにその超能力的なものだとしたら。

もしも、僕にその超能力的なものがあるんだとしたら。

試してみる価値はあるかもしれない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("２２");
	TypeBegin();//――――――――――――――――――――――――――――――

	EndTrigger();



}