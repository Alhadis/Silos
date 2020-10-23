//<continuation number="620">

chapter main
{

	$PreGameName = "boot_七海ルート";

	if($GameStart != 1)
	{
		$GameName = "chn_132_七海編_混乱";
		$GameContiune = 1;
		$七海ルート=true;
		$RouteON=true;
		Reset();
	}

	chn_132_七海編_混乱();
}


function chn_132_七海編_混乱()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★七海編

	CreateSE("SE360101","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE360101",2000,500,0,1000,null,true);

//ＢＧ//拓巳の部屋
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");
	Fade("back01", 0, 0, null, true);
	Fade("back01", 2000, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
夕食を終えた後――

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00800010ta">
「な、七海、話がある」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st七海_私服_通常","normal", 200, @+100);
	FadeStand("st七海_私服_通常_normal", 300, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00800020na">
「んー？　なに？」

七海は、部屋の隅に積み上げてあったマンガ本を読んでいた。
顔を上げず、おざなりな感じで返事をしてくる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00800030ta">
「ま、真面目な話だから、ちゃんと、聞けよ……」

{	Stand("st七海_私服_通常","shock", 200, @+100);
	FadeStand("st七海_私服_通常_shock", 300, false);
	DeleteStand("st七海_私服_通常_normal", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00800040na">
「ど、どうしたの？　急に改まっちゃって」

七海は戸惑ったように本を閉じると、姿勢を正した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateSE("SE01","SE_じん体_動作_尻餅");
	MusicStart("SE01",0,1000,0,1000,null,false);

	DeleteStand("st七海_私服_通常_shock", 500, true);
	Stand("bu七海_私服_通常","normal", 200, @+100);
	FadeStand("bu七海_私服_通常_normal", 500, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00800050na">
「これでいい？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00800060ta">
「……一昨日のことは、な、なにか、思い出した？」

一昨日、七海はこのコンテナハウスの外で、全裸でうずくまっていた。

着ていた服も、カバンも、あとバングルも行方不明。
ケータイは、血が付いた状態で僕のところにダンボールで送られてきた。

これは普通じゃない。

七海はなぜそうなったのか、自分自身でも分からないって言ってた。
軽い記憶喪失状態だった。

今はどうなんだろう？　快復したんだろうか。
目の前にいる七海は、すっかりいつもの七海に戻ってるようだけど……。

僕の問いかけに、七海はすぐに表情を曇らせて、小さく首を左右に振った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu七海_私服_拗ね","angry", 200, @+100);
	DeleteStand("bu七海_私服_通常_normal", 300, false);
	FadeStand("bu七海_私服_拗ね_angry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00800070na">
「まだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00800080ta">
「まったく、ぜ、全然……？」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00800090na">
「まったく、全然」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00800100na">
「なるべくね、そのことは考えないようにしてたんだ……。お母さんにも、話してないし……」

{	Stand("bu七海_私服_通常","shy", 200, @+100);
	FadeStand("bu七海_私服_通常_shy", 300, true);
	DeleteStand("bu七海_私服_拗ね_angry", 300, false);}
//◆無理に笑う
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00800110na">
「おかげで、制服がなくなった理由、ごまかすの大変だったよぉ。えへへ」

やっぱり、病院に連れて行った方がいいのかな。
記憶喪失って、何科なんだろう？　精神科？

――だとしたら、高科先生に診てもらうのがいいかも。

そう考えたけど、高科先生はニュージェネ事件で殺されたことを思い出し、胸の奥の方に締め付けられるような痛みを覚えた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00800120ta">
「七海……、ぼ、僕は……命を狙われてる」

{	Stand("bu七海_私服_通常","shock", 200, @+100);
	FadeStand("bu七海_私服_通常_shock", 300, false);
	DeleteStand("bu七海_私服_通常_shy", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00800130na">
「へ？」

七海は目を丸くした。

いきなりそんなことを言われたら、誰だって僕のことをデンパなヤツだと思うだろう。

でも、これは事実だ……。
僕はすべてを打ち明けることにした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE360101", 2000, 1, null);


	CreateColor("Black", 4000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 1500, 1000, null, true);

	Stand("bu七海_私服_拗ね","sad", 200, @+100);
	FadeStand("bu七海_私服_拗ね_sad", 0, false);
	DeleteStand("bu七海_私服_通常_shock", 0, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
『将軍』のこと。ニュージェネ第３の事件『張り付け』を目撃したこと。それ以降、僕を襲った数々の奇妙で恐ろしい出来事のこと。

全裸の七海を発見する直前に送られてきた、『将軍』からの脅迫とも取れるメールやチャット。そして二度に渡る、ニセモノの七海からのイタズラ電話。

七海は最初は“おにぃの妄想でしょ～？”と苦笑していた。
でもやがて、僕が冗談を言っているわけじゃないと分かったらしく、表情を強張らせた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE360101", 2000, 500, null);
	FadeDelete("Black", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00800140ta">
「いいか、こ、これからしばらくは、ひ、１人で外に出ちゃ、ダメだ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00800150ta">
「どこで、襲われるか、分からないから」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00800160na">
「お、おにぃ……、ナナ、怖いよ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00800170ta">
「ぼ、僕だって、怖いよ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00800180ta">
「だ、だから、２人で協力するんだ」

２人なら、お互いに支え合うことができる。

僕みたいなダメ兄貴が、どれだけ七海の心の支えになれるかどうかは分からないけど。少なくとも僕は、七海がいてくれないと、耐えられない。

物理的に守ってくれる人の助けを借りたいところではあるけど……。
警察に相談するのもためらわれる。

前にこのＫＵＲＥＮＡＩ会館ビルの前で話をした刑事たちは、あれ以来まったく姿を見せない。警備をしてくれるっていう話はどうなったんだ。

それに、『張り付け』の犯人が僕だってまだ疑ってるかもしれないし。
警察は信用できない。

有効な対抗策を思いつくまでは、なるべくこのベースに籠もっているしかない。

七海はソファに身を沈めたまま、自分自身を抱きしめるようにして、身を震わせていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ

	ClearAll(2000);
	Wait(2000);
}


