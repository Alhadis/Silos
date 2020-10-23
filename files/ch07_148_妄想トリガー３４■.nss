//<continuation number="930">




chapter main
{

	$PreGameName = "boot_第七章";

	if($GameStart != 1)
	{
		$GameName = "ch07_148_妄想トリガー３４■";
		$GameContiune = 1;
		Reset();
	}

		ch07_148_妄想トリガー３４■();
}


function ch07_148_妄想トリガー３４■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//	CreateTexture360("背景３", 100, 0, 0, "cg/bg/bg093_01_2_井の頭通り交番前_a.jpg");
//	Fade("背景３", 0, 1000, null, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	PrintBG(1000);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//☆☆☆
//妄想トリガー
//ポジティブ妄想→分岐１３へ
//ネガティブ妄想→分岐１４へ
//妄想しない→分岐１５へ

if($妄想トリガー通過３４ == 0)
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
			$妄想トリガー３４ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー３４ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー３４ = 0;
		}
	}
}


//=============================================================================//

if($妄想トリガー３４ == 2)
{
//☆☆☆
//分岐１３
	CreateSE("SE01","SE_日常_雑踏02");
	MusicStart("SE01", 0, 1000, 0, 1000, null, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTexture360("背景３", 100, 0, 0, "cg/bg/bg093_01_2_井の頭通り交番前_a.jpg");
	
	Stand("bu梢_制服_武器構え青","normal", 200, @+250);
	FadeStand("bu梢_制服_武器構え青_normal", 0, true);
	Stand("buセナ_制服_食事棒","sigh", 300, @-250);
	FadeStand("buセナ_制服_食事棒_sigh", 0, true);	

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Wait(500);

	FadeDelete("back*", 300, true);
	Delete("back*");
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800010sn">
「…………」

セナは唇を尖らせ、
それから、おずおずとアタリ棒を受け取ってくれた。

{	Stand("buセナ_制服_横向","shy", 300, @-250);
	DeleteStand("buセナ_制服_食事棒_sigh", 500, true);
	FadeStand("buセナ_制服_横向_shy", 500, true);}
//◆照れくさい
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800020sn">
「あ、ありがとう……」

僕は驚きのあまり絶句してしまった。

まさかセナの口から感謝の言葉を聞けるなんて、想像を絶する事態だ。

そんな僕の驚きに気付いていないのか、セナは僕を一瞥し、

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800030sn">
「お前、優しいな」

一言だけ小さくつぶやいて、すぐにプイと顔をそむけてしまう。
今、顔が少し紅潮してたのは気のせいかな。

まあ、素直にお礼を言ってきたから少し彼女のことを見直した。

怖い女だと思ってたけど、こういうかわいいところもあるんだ。

//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14800040ko">
「セナしゃんは～、今ので今のーで――」

こずぴぃが、その場でクルリと回って、僕とセナの顔を嬉しそうにのぞき込んできた。

{	BGMPlay360("CH05", 1000, 1000, true);
	Stand("bu梢_制服_武器構え青","smile", 200, @+250);
	FadeStand("bu梢_制服_武器構え青_smile", 300, false);
	DeleteStand("bu梢_制服_武器構え青_normal", 300, true);}
//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14800050ko">
「拓巳しゃんのこと、好きになっちゃったのら～」

{	Stand("buセナ_制服_通常","angry", 300, @-250);
	DeleteStand("buセナ_制服_横向_shy", 500, false);
	FadeStand("buセナ_制服_通常_angry", 500, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800060sn">
「こ、梢っ！　なにをバカな――」

//◆嬉しそう
//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14800070ko">
「顔がぽっぽ～ってなってるの～」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800080sn">
「う、うるさいうるさい！」

おお……い、今のセリフは……！

ツンデレブームの元祖『蒼眼のジュン』の口癖と同じじゃないか。
ついニヤけていたら、セナに指を突きつけられた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buセナ_制服_横向","shy", 300, @-250);
	DeleteStand("buセナ_制服_通常_angry", 500, false);
	FadeStand("buセナ_制服_横向_shy", 500, true);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆照れくさい
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800090sn">
「お前もニヤニヤしてるんじゃないっ」

こんなに可愛らしく動揺しているセナは、初めて見た。
少しイタズラ心が出てきて、試しに質問してみる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14800100ta">
「ガ、ガルガリ君は……好きですか？」

{	Stand("buセナ_制服_通常","hard", 300, @-250);
	DeleteStand("buセナ_制服_横向_shy", 500, true);
	FadeStand("buセナ_制服_通常_hard", 500, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800110sn">
「悪いか」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14800120ta">
「ど、どの辺が……？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800130sn">
「おいしいだろ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14800140ta">
「そ、それだけ……？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800150sn">
「あと、かわいい」

ブスッとしたまま、セナは意味不明なことを言った。

//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14800160ko">
「かーわいいー。かーわいいー♪」

棒アイスにかわいいとかかわいくないとかあるのかな……。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800170sn">
「アイスが、じゃないからな」

{	Stand("buセナ_制服_横向","shy", 300, @-250);
	DeleteStand("buセナ_制服_通常_hard", 500, true);
	FadeStand("buセナ_制服_横向_shy", 500, true);}
//◆照れくさい
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800180sn">
「ガルガリ君が、かわいいんだ」

なるほど。イメージキャラクターのことか。

……かわいい、かな？

//◆照れくさい
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800190sn">
「あのいがぐり頭が……最高だ」

//◆照れくさい
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800200sn">
「抱きしめて頬ずりしたくなる」

そう語るセナの表情は、恋する乙女のそれだった。
ま、まあ、趣味とか好みは人それぞれだよね……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	PositiveHuman();


	Stand("buセナ_制服_通常","hard", 300, @-250);
	DeleteStand("buセナ_制服_横向_shy", 500, true);
	FadeStand("buセナ_制服_通常_hard", 500, false);

	Stand("bu梢_制服_武器構え青","normal", 200, @+250);
	FadeStand("bu梢_制服_武器構え青_normal", 300, false);
	DeleteStand("bu梢_制服_武器構え青_smile", 300, true);

	BGMPlay360("CH*", 2000, 0, true);
//合流５へ
}


//=============================================================================//

if($妄想トリガー３４ == 1)
{
//☆☆☆
//分岐１４
//フラグ【７章エンドフラグ②】ＯＮ
	$７章エンドフラグ② = true;

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTexture360("背景３", 100, 0, 0, "cg/bg/bg093_01_2_井の頭通り交番前_a.jpg");
	
	Stand("bu梢_制服_武器構え青","normal", 200, @+250);
	Stand("buセナ_制服_食事棒","sigh", 300, @-250);
	FadeStand("bu梢_制服_武器構え青_normal", 0, true);
	FadeStand("buセナ_制服_食事棒_sigh", 0, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	CreateSE("SE01","SE_日常_雑踏02");
	MusicStart("SE01", 0, 1000, 0, 1000, null, true);

	FadeDelete("back*", 300, true);
	Delete("back*");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
厚意でそう言ったのに、セナは僕を一瞥しただけであっさりと申し出を無視した。

{	Stand("buセナ_制服_横向","pride", 300, @-300);
	DeleteStand("buセナ_制服_食事棒_sigh", 500. false);
	FadeStand("buセナ_制服_横向_pride", 500, true);}
そしてなぜか、彼女の方が棒を差し出してくる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14800210ta">
「……？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800220sn">
「…………」

しかも、なんの説明もしようとしない。
ハズレ棒をもらっても嬉しくもなんともないんだけど。

もしかして、コンビニにあるゴミ箱まで捨ててこい、って命令されてるんだろうか。

この女ならじゅうぶんあり得る。

きっとセナには気の弱い男の舎弟が何人もいて、いつも顎で使っているんだ。

うう、僕をバカにして。
でも逆らったら怖そうだから、唇を噛みながらもしょうがなくそれを受け取った。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800230sn">
「私の勝ち」

ビルとビルの間からのぞいている空へと視線を固定させたまま、セナはそう言い放つ。

僕はため息をつき、何気なくそのハズレ棒を見て、
息を呑んだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Delete("SE01");

//イメージＢＧ//「その目だれの目？」のアイス棒
//棒アイスの棒（食べ終わったもの）に「その目だれの目？」と書かれてある
	CreateSE("SE02","SE_衝撃_衝撃音01");

	CreateTextureEX("棒アイス", 500, 0, 0, "cg/bg/bg180_01_1_アイスその目_a.jpg");
	Fade("棒アイス", 200, 1000, null, true);

	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	Wait(1000);

//おがみ：実績：その目
	Eyes();

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
なんだよ……これ……

{	Fade("棒アイス", 1000, 0, null, true);
	Delete("棒アイス");
	CreateSE("SE01","SE_日常_雑踏02");
	MusicStart("SE01", 1000, 1000, 0, 1000, null, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800240sn">
「先週出た、渋谷限定品だ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800250sn">
「ただのアタリより価値がある」

そう説明するセナの表情は満足げだ。
もしかして、自慢されてるんだろうか。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800260sn">
「だから、私の勝ち」

それっていったいなんの勝負……？
それに、こんな趣味の悪いアタリ棒は……僕は、いらない……。

この場で真っ二つに折っちゃいたい衝動に駆られたけど、ぐっとこらえてセナに棒を返した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	NegativeHuman();

	Stand("buセナ_制服_通常","hard", 300, @-250);

	DeleteStand("buセナ_制服_横向_pride", 500, false);
	FadeStand("buセナ_制服_通常_hard", 500, true);

//合流５へ
}


//=============================================================================//

if($妄想トリガー３４ == 0)
{
//☆☆☆
//分岐１５

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTexture360("背景３", 100, 0, 0, "cg/bg/bg093_01_2_井の頭通り交番前_a.jpg");

	Stand("bu梢_制服_武器構え青","normal", 200, @+250);
	FadeStand("bu梢_制服_武器構え青_normal", 0, true);
	Stand("buセナ_制服_食事棒","sigh", 300, @-250);
	FadeStand("buセナ_制服_食事棒_sigh", 0, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	CreateSE("SE01","SE_日常_雑踏02");
	MusicStart("SE01", 0, 1000, 0, 1000, null, true);

	FadeDelete("back*", 300, true);
	Delete("back*");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800270sn">
「断る」

い、一刀両断か……。

人の厚意を無駄にするなんて、イヤな女だ。
それともアレですか、ツンデレキャラにお約束の強がりですか。

三次元じゃ萌えないんだよぅ、そういうのは！

{	Stand("bu梢_制服_武器構え青","smile", 200, @+250);
	FadeStand("bu梢_制服_武器構え青_smile", 300, false);
	DeleteStand("bu梢_制服_武器構え青_normal", 300, true);}
//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14800280ko">
「ほいじゃあ、こうしよーよ、セナしゃん」

//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14800290ko">
「こないだ２人で一緒にお勉強した、渋谷言葉を言ってくれたら、拓巳しゃんが当たり棒あげるそーうです♪」

{	Stand("buセナ_制服_通常","hard", 300, @-250);
	DeleteStand("buセナ_制服_食事棒_sigh", 500, false);
	FadeStand("buセナ_制服_通常_hard", 500, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800300sn">
「いらないと言っているだろう」

//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14800310ko">
「いいからー。早くー。楽しいときに言う言葉ー」

//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14800320ko">
「“って言うかぁー、超楽しくてマジヤバーい。ちょべりぐー”」

な、なんというＤＱＮギャル語。数年前の死語も混ざってるし。

そんなのを２人して勉強してたのか。ある意味で微笑ましいけど……。

//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14800330ko">
「渋谷になじむためなのらー」

//◆ささ＝さあさあどうぞ
//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14800340ko">
「ささ、セナしゃん」

{	Stand("buセナ_制服_横向","shy", 300, @-250);
	DeleteStand("buセナ_制服_通常_hard", 500, false);
	FadeStand("buセナ_制服_横向_shy", 500, true);}
//◆恥ずかしくて必死に抵抗
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800350sn">
「む、無理、今は無理だ」

{	Stand("bu梢_制服_武器構え青","normal", 200, @+250);
	FadeStand("bu梢_制服_武器構え青_normal", 300, true);
	DeleteStand("bu梢_制服_武器構え青_smile", 0, true);}
//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14800360ko">
「無理じゃー、なーい」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800370sn">
「む・り・だ！」

{	Stand("bu梢_制服_武器構え青","sad", 200, @+250);
	FadeStand("bu梢_制服_武器構え青_sad", 300, true);
	DeleteStand("bu梢_制服_武器構え青_normal", 0, true);}
//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14800380ko">
「……うう」

こずぴぃはまた涙目になり、セナをじーっと見つめる。
これをやられたら、さすがのセナも――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buセナ_制服_通常","hard", 300, @-250);
	DeleteStand("buセナ_制服_横向_shy", 500, false);
	FadeStand("buセナ_制服_通常_hard", 500, true);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//◆ひるむ
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800390sn">
「…………」

{	Stand("buセナ_制服_通常","angry", 300, @-250);
	FadeStand("buセナ_制服_通常_angry", 300, true);
	DeleteStand("buセナ_制服_通常_hard", 0, true);}
//◆ため息
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800400sn">
「……はあ」

//◆ボソボソと
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800410sn">
「って、ていうか……ちょ、ちょう楽しくて、マジやばい……」

//◆ボソボソと
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800420sn">
「ちょべりぐー」

{	Stand("bu梢_制服_武器構え青","smile", 200, @+250);
	FadeStand("bu梢_制服_武器構え青_smile", 300, false);
	DeleteStand("bu梢_制服_武器構え青_sad", 300, true);}
//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14800430ko">
「えへ。相変わらずセナしゃんはカタコトでーすね」

{	Stand("buセナ_制服_横向","shy", 300, @-250);
	DeleteStand("buセナ_制服_通常_angry", 500, false);
	FadeStand("buセナ_制服_横向_shy", 500, true);}
セナは赤面し、顔をそむけてしまった。

き、貴重なものが見られた……。さっきまでやたらと難解な理論をすらすらと喋っていたのとは大違いだ。デレモード最高。三次元の可能性をまたも垣間見た。

こずぴぃ、ＧＪ。

というわけで、セナに当たり棒をプレゼントした。
案外素直にセナはそれを受け取る。

{	Stand("buセナ_制服_通常","angry", 300, @-250);
	DeleteStand("buセナ_制服_横向_shy", 500, false);
	FadeStand("buセナ_制服_通常_angry", 500, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800440sn">
「礼は、言わないからな……」

と、これ見よがしにディソードを担ぎ直してまたにらんできたから、僕はすぐに目を伏せた。

なんでプレゼントしたのに凄まれなくちゃいけないんだ。ホント、この女は苦手だ。ずっとデレモードでいてくれないかな……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("buセナ_制服_通常","hard", 300, @-250);
	FadeStand("buセナ_制服_通常_hard", 300, true);
	DeleteStand("buセナ_制服_通常_angry", 0, true);

	Stand("bu梢_制服_武器構え青","normal", 200, @+250);
	FadeStand("bu梢_制服_武器構え青_normal", 300, false);
	DeleteStand("bu梢_制服_武器構え青_smile", 300, true);

//合流５へ
}


//=============================================================================//

//☆☆☆
//合流５

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800450sn">
「それよりお前――」

{	Stand("bu梢_制服_武器構え青","smile", 200, @+250);
	FadeStand("bu梢_制服_武器構え青_smile", 300, false);
	DeleteStand("bu梢_制服_武器構え青_normal", 300, true);}
//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14800460ko">
「拓巳しゃんですよー」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800470sn">
「拓巳しゃんなのか」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14800480ta">
「ちょ、ちが……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14800490ta">
「しゃん、は……つ、付けなくても……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800500sn">
「名前は？」

前に名乗ったような気がするけど……。
忘れられたらしい。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14800510ta">
「に、西條拓巳、です……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800520sn">
「だったら西條」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800530sn">
「もう、これ以上エラーを作るのはやめておけ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14800540ta">
「は……？」

{	Stand("bu梢_制服_正面","normal", 200, @+250);
	DeleteStand("bu梢_制服_武器構え青_smile", 500, true);
	FadeStand("bu梢_制服_正面_normal", 500, true);}
//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14800550ko">
「なんでー？」

//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14800560ko">
「剣は自分の心なのら。否定しちゃダーメー」

//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14800570ko">
「こずぴぃは、この剣のおかげで助かったよー？」

助かった……か。
こずぴぃの過去に、なにがあったのか……。

“殺したいって願った”って言ってたことも気になる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800580sn">
「妄想を現実にする行為にはリスクが付きまとう」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800590sn">
「粒子とともに対生成される反粒子は、ディソードにストックされていくんだ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800600sn">
「反粒子は数学的に言えば“過去へ向かうもの”だから」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800610sn">
「ストックすればするほど、ギガロマニアックスには“現在の状態とのずれ”が発生し――」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800620sn">
「やがてその矛盾により、存在としての自己崩壊へ至る」

に、日本語でおｋ。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800630sn">
「梢も、あまりディソードを出すのはやめるんだ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800640sn">
「普通に生活していきたいなら、私の忠告を聞け」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800650sn">
「これは、お前たちの命に関わる話だ」

セナが冗談で言っているようには見えない。この女は、冗談を言うタイプじゃない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800660sn">
「ましてや西條」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800670sn">
「お前はディソードなしでリアルブートした。本来ならそんなことできるはずがないんだ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800680sn">
「ディラックの海には、ディソードを通してしか干渉できないんだから」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800690sn">
「お前は普通じゃない」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800700sn">
「ヤツらに目を付けられてもおかしくない」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14800710ta">
「ヤ、ヤツら……って？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800720sn">
「ギガロマニアックスの力を悪用しようとしている連中がいる」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14800730ta">
「そ、それって……『将軍』！？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800740sn">
「知らない」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800750sn">
「誰だそれは」

……こずぴぃ、今セナは嘘をついた？

{	Stand("bu梢_制服_武器構え青","normal", 200, @+250);
	DeleteStand("bu梢_制服_正面_normal", 500, true);
	FadeStand("bu梢_制服_武器構え青_normal", 500, true);}
//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14800760ko">
「ついてなーいよ」

{	Stand("buセナ_制服_通常","angry", 300, @-250);
	FadeStand("buセナ_制服_通常_angry", 300, false);
	DeleteStand("buセナ_制服_通常_hard", 300, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800770sn">
「西條、『将軍』とは誰だ」

声の冷たさに、僕はゾクリとした。
当然だけど目を合わせられない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――
	
	CreateTexture360("背景０", 1000, center, middle, "SCREEN");
	CreateSE("SE04","SE_衝撃_衝撃音03");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	Shake("背景０", 500, 5, 5, 0, 0, 500, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
胸ぐらをつかまれた。
息が苦しくなる。

{	Delete("背景０");}
うう、なんでこんな凶暴なんだ……。
僕、なにか悪いことした？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800780sn">
「そいつは、４０代ぐらいの男か？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14800790ta">
「ち、違うよ、ち、小さな、じいさん、だよ」

{	Stand("buセナ_制服_通常","hard", 300, @-250);
	FadeStand("buセナ_制服_通常_hard", 300, false);
	DeleteStand("buセナ_制服_通常_angry", 300, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800800sn">
「…………」

セナはあっさりと手を離した。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800810sn">
「そいつもギガロマニアックスなのか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14800820ta">
「わ、分からない……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14800830ta">
「で、でも、ニュ、ニュージェネの、真犯人……だよ……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800840sn">
「真犯人……だと？」

セナは自分のおとがいに指を添え、じっと考え込んでしまう。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800850sn">
「…………」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14800860ta">
「…………」

険悪な雰囲気。
得体の知れない不安。
セナはなにかを知っている。

いったい、なんなの……？
ギガロマニアックスの力を悪用しようとしている連中って、何者……？

{	Stand("bu梢_制服_武器構え青","smile", 200, @+250);
	FadeStand("bu梢_制服_武器構え青_smile", 300, false);
	DeleteStand("bu梢_制服_武器構え青_normal", 300, true);}
//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14800870ko">
「あ、そだそだー！　３人で記念撮影しまーしょ！　ほらアレ！」

唐突に、脳天気な声を上げてこずぴぃが指差したもの。それは――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundStop("SE01");
//ＢＧ//アジアース（ゲーセン）
//※アジアース→アドアーズのこと
	CreateTextureEX("背景４", 500, 0, 0, "cg/bg/bg068_01_2_アジアース店内_a.jpg");
	Fade("背景４", 1000, 1000, null ,true);
	
	DeleteStand("bu梢_制服_武器構え青_smile", 0, true);
	DeleteStand("buセナ_制服_通常_hard", 0, true);
	Delete("背景３");

	CreateSE("SE001","SE_はいけい_ゲームセンター_LOOP");
	MusicStart("SE001", 1000, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
交番の横にあるゲーセン。
そこで記念撮影と言えば、必然的に……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＧ//プリントシール機の画面に映る拓巳、梢、セナ①
//※↑拓巳が真ん中。恥ずかしくてうつむき気味。梢は恥ずかしそうに顔真っ赤にしながらも楽しそう。拓巳に抱きつくぐらいに接近。後ろでひとりセナがプイと顔を背けている。セナも恥ずかしいので顔が赤い。梢とセナのディソードもばっちり画面内に入っている。
//※「プリクラ」という言葉は商標登録されているので使えないです

	CreateTextureEX("プリクラ１", 600, 0, 0, "cg/ev/ev062_01_1_プリクラ_a.jpg");
	Fade("プリクラ１", 1000, 1000, null, true);
	Delete("背景４");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
やっぱりこうなるわけで。

//◆まーんなか＝真ん中
//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14800880ko">
「拓巳しゃん、ほら、まーんなか！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14800890ta">
「いや、ちょ、僕は……」

//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14800900ko">
「セナしゃん、横見てたらダーメですぅ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14800910sn">
「私は、こういうのは……」

//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14800920ko">
「こずぴぃだって初めてーなのだ。ドキドーキ♪」

こずぴぃは、画面に出てくる指示に従ってボタンを勝手にどんどん押していく。

僕とセナの心の準備が整わないうちに、画面から声が聞こえてきた。

//ＶＦ//機械の音声
//【シール機】
<voice name="シール機" class="シール機" src="voice/ch07/14800930sm">
「ハイ！　ポーズ！　カシャッ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//画面エフェクト//写真を撮った風に
	CreateColor("フラッシュ", 1000, 0, 0, 1280, 720, "White");
	Request("フラッシュ", AddRender);
	Fade("フラッシュ", 0, 0, null, true);
	Fade("フラッシュ", 50, 1000, null, true);
	
//ＣＧ//プリントシール機の画面に映る拓巳、梢、セナ②
//※↑３人のキャラは①とまったく同じで、プリクラのように画面に文字が書き込んであり、ディソードが忽然と消えている。
//書かれている文字→「ぎがろまにあっくすトリオ」「はつたいけーん♪」どちらも女の子らしい丸文字

	CreateTextureEX("プリクラ２", 700, 0, 0, "cg/ev/ev062_02_1_プリクラ_a.jpg");
	Fade("プリクラ２", 0, 1000, null, false);
	Fade("フラッシュ", 1500, 0, null, true);
	
	Delete("シール１");
	Delete("フラッシュ");
	
	SoundStop("SE001");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
……撮った写真には、<k>
ディソードが写っていなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	ClearAll(1000);
	
	Wait(3000);

}