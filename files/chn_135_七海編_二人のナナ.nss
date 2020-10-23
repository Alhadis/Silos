

chapter main
{

	$PreGameName = "boot_七海ルート";

	if($GameStart != 1)
	{
		$GameName = "chn_135_七海編_二人のナナ";
		$GameContiune = 1;
		$七海ルート=true;
		$RouteON=true;
		Reset();
	}

	chn_135_七海編_二人のナナ();
}


function chn_135_七海編_二人のナナ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★七海編

//ＢＧ//拓巳の部屋・扉開いてる・夜
//画面エフェクト//以下、妄想エフェクト無しになります
	PrintBG(1000);
	CreateTexture360("背景０", 100, 0, 0, "cg/bg/bg026_01_3_拓巳部屋_a.jpg");


	FadeDelete("back*", 1000, true);
//キャラ表示//ディソードを持った血まみれ七海（右手なし）
	Stand("st七海_制服ダメージ_武器構え","lost", 200, @+180);
	FadeStand("st七海_制服ダメージ_武器構え_lost", 1000, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900110na">
「お、にぃ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00900120ta">
「あ、あ……」

そこに、七海がいた。

なくしたはずの制服を着て。

全身、血にまみれ。

その右手から先は切断されていて。

抱えるように、見たこともない剣――ディソードを持って。

虚ろな目を僕に向けていた。
僕は絶句して、言葉が出ない。

{	BGMPlay360("CH06", 3000, 1000, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900130na">
「どうして、あのとき、来てくれなかったの……？」

//◆泣きそう
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900140na">
「１週間も、待ってたのに……」

//◆泣きそう
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900150na">
「おにぃ、助けてって……ずっと、呼んでたのに……」

これは妄想だ。
これは妄想だ……！
これは！　妄想だ！

//◆泣きそう
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900160na">
「右手が、痛いの……っ」

//◆泣きそう
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900170na">
「返して……ナナの……右手……っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//フラッシュバック
	CreateSE("SE回想in","SE_衝撃_ふらっしゅばっく");
	SoundPlay("SE回想in",0,1000,false);

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 100, 1000, null, true);

	CreateColor("回想明度", 2000, 0, 0, 1280, 720, "WHITE");
	Request("回想明度", AddRender);
	Fade("回想明度", 0, 100, null, true);

	CreateTexture360("回想背景１", 1000, 0, 0, "cg/bg/bg026_02_3_拓巳部屋_a.jpg");
	Fade("回想フラッシュ", 500, 0, null, true);

//■３６０：ＶＦ：タグ調整

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//ＶＦ//回想セリフ
//【七海】
//「助けて……」
<voice name="七海" class="七海" src="voice/chn06/00900170na_01">
「右手を……返して……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 100, 1000, null, true);

	CreateTexture360("回想背景２", 1100, 0, 0, "cg/bg/bg006_01_1_コンテナ外観_a.jpg");
	Stand("bu七海_トレーナー_拗ね","sad", 1200, @+150);
	FadeStand("bu七海_トレーナー_拗ね_sad", 300, true);
	Fade("回想フラッシュ", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
//■３６０：ＶＦ：タグ調整
//ＶＦ//回想セリフ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900170na_02">
「朝、起きてから、右手がちょっとズキズキするの」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("回想フラッシュ", 100, 1000, null, true);
	Delete("回想背景*");
	Delete("回想明度");

	DeleteStand("bu七海_トレーナー_拗ね_sad", 0, true);
	Fade("回想フラッシュ", 1500, 0, null, true);
	Delete("回想フラッシュ");

	CreateColor("黒隠し", 2100, 0, 0, 1280, 720, "BLACK");
	Fade("黒隠し", 0, 0, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603001]
どっちが、妄想？
どっちが、現実？

僕は、なにを見ていたんだ？
僕は、これまで誰と喋っていたんだ？

あの七海は、どこへ行った？
この七海は、どこから来た？

{	Fade("黒隠し", 100, 1000, null, true);}
//◆いつも通りの元気さ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900180na">
「おにぃ！」

いきなり、背後から七海の声がした。
目の前に、血まみれの七海がいるのに。
背後からも、七海が、僕を、呼んだんだ。

恐る恐る、振り返る。
そこに――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//拓巳の部屋（部屋の奥を見ている）
//キャラ表示//七海・部屋着
	PrintBG(1000);
	DeleteStand("st七海_制服ダメージ_武器構え_lost", 0, true);
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");

	Stand("st七海_トレーナー_通常","normal", 200, @-320);
	FadeStand("st七海_トレーナー_通常_normal", 500, true);

	DrawTransition("back*", 500, 1000, 0, 100, null, "cg/data/right3.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
七海がいた。

僕が貸してあげた部屋着を着て。
右手はちゃんとくっついている。

七海が……２人いる……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 200, 1000, null, true);

	CreateWindow("ウィンドウ１", 500, 512, 0, 512, 720, false);
	CreateTexture360("ウィンドウ１/背景２", 100, 0, @0, "cg/bg/bg026_01_3_拓巳部屋_a.jpg");

	CreateColor("境界線", 1500, 512, 0, 2, 720, "Black");

//ＶＦ//２人の七海が同時に同じセリフを喋る
	Stand("st七海_制服ダメージ_武器構え2","cry", 300, @+350);
	FadeStand("st七海_制服ダメージ_武器構え2_cry", 0, false);
	Stand("st七海_トレーナー_通常","angry", 200, @-350);
	FadeStand("st七海_トレーナー_通常_angry", 0, false);
	DeleteStand("st七海_トレーナー_通常_normal", 0, true);
//◆以下、同時
	CreateVOICE("七海Ａ","chn06/00900190na");
//	CreateVOICE("七海Ｂ","chn06/00900200na");
//	SoundPlay("七海Ｂ",0,1000,false);

//	SetBacklog("「そいつ、誰？」", "voice/chn06/00900200na", 七海Ｂ);
	SetBacklog("「そいつ、誰？」", "voice/chn06/00900190na", 七海);
//【七海】
//<voice name="七海" class="七海" src="voice/chn06/00900190na">
//「そいつ、誰？」

	Fade("Black", 200, 0, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
{	SoundPlay("七海Ａ",0,1000,false);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900200na">
「そいつ、誰？」

//◆以上、同時
２人の七海が、同時に喋った。

七海が、七海を見て、いぶかしげな顔をする。

七海も、七海を見て、泣きそうな顔をする。

//※いぶかしげな顔をしたのは部屋着の七海。泣きそうな顔をしたのはディソード持った血まみれ七海
２人の七海に挟まれて、僕は――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

	Fade("Black", 200, 1000, null, true);

	Delete("境界線");
	Delete("ウィンドウ*");
	DeleteStand("st七海_トレーナー_通常_angry", 0, true);
	DeleteStand("st七海_制服ダメージ_武器構え2_cry", 0, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	Stand("st七海_制服ダメージ_武器構え2","hate", 300, @+280);
	Stand("st七海_トレーナー_通常","hate", 110, @-280);
	FadeStand("st七海_制服ダメージ_武器構え2_hate", 0, true);
	FadeStand("st七海_トレーナー_通常_hate", 0, true);
	CreateTexture360("背景０", 120, 0, 0, "cg/bg/bg026_01_3_拓巳部屋_a.jpg");
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//▼べー：演出：ここから七海が同時に口ぱくします。クラス名変更で対応可能と思われますが、無理なようであれば演出変更でお願いします。

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00900210ta">
「これは、妄想だ……！」

その場にへたり込んで、頭を抱えた。

妄想なら、早く覚めてほしい。
こんな悪趣味な妄想は、見たくないんだ……！
それなのに、ちっとも現実には戻らなくて。

{	FadeDelete("Black", 500, true);}
//◆血まみれ七海のセリフ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900220na">
「そのニセモノ……なんなの……？」

血まみれの七海が、ゆらりと動いた。
七海の身長と同じくらい巨大で、禍々しく、痛々しさすら覚えるディソードを構える。

//◆血まみれ七海のセリフ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900230na">
「なんで、ニセモノが……おにぃと一緒にいるの……？」

//◆血まみれ七海のセリフ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900240na">
「そいつのせいで、ナナを……助けに来て、くれなかったの……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	DeleteStand("st七海_制服ダメージ_武器構え2_hate", 500, false);
	Fade("背景０", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//◆部屋着の七海のセリフ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900250na">
「ナナは、ニセモノじゃないよっ」

//■３６０
//◆部屋着の七海のセリフ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900260na">
//「そっちこそ、そんな変な剣なんて持って、ニセモノじゃん！」
「そっちこそ、そんな変な剣持って、ニセモノじゃん！」

どっちも、七海の声だ。
どっちも、七海の顔だ。
どっちも、僕をおにぃと呼ぶ。

どっちが、本物？
どっちが、ニセモノ？

両方とも、本物？
両方とも、ニセモノ？

{	Stand("st七海_制服ダメージ_武器構え2","cry", 300, @+280);
	FadeStand("st七海_制服ダメージ_武器構え2_cry", 500, false);
	Fade("背景０", 500, 1000, null, true);}
//◆血まみれ七海のセリフ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900270na">
「ニセモノの、くせに……っ」

//◆血まみれ七海のセリフ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900280na">
「おにぃから、離れてよぅ……！」

{	DeleteStand("st七海_制服ダメージ_武器構え2_cry", 500, false);
	Fade("背景０", 500, 0, null, true);}
血まみれの七海が、構えたディソードを、片手で軽々と振り回す。
その切っ先は、正確に、血にまみれていない方の七海の首を狙っていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//ディソード振る
	CreateSE("SE01","SE_擬音_ディそーど_空を切る1");
	Stand("st七海_トレーナー_拗ね","pinch", 110, @-280);

	CreateMovie360("ムービー", 2000, Center, Middle, false, false, "dx/mv軌跡01.avi");	
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
//	Request("ムービー", Play);
//	WaitAction("ムービー", null);
	Wait(300);
	Fade("ムービー", 500, 0, null, true);
	Delete("ムービー");

	DeleteStand("st七海_トレーナー_通常_hate", 300, false);
	FadeStand("st七海_トレーナー_拗ね_pinch", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//◆部屋着の七海のセリフ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900290na">
「きゃっ」

よけようともせず、身を固くした七海の首に。<k>
まともに。<k>
ディソードの凶悪な刃が食い込んで――

すり抜けた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00900300ta">
「え……？」

血にまみれていない方の七海は、今まさに、斬られたはず。
なのに、血も出ず。ケガもなく。同じ姿勢のまま、そこに立っている。

ディソードは、確かに振り抜かれた。あの勢いなら、七海の首なんてあっさりはね飛ばされていたはずだった。

{	Stand("st七海_制服ダメージ_武器構え2","hate", 300, @+280);
	FadeStand("st七海_制服ダメージ_武器構え2_hate", 500, false);
	Fade("背景０", 500, 1000, null, true);}
//◆血まみれ七海のセリフ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900310na">
「やっぱり、ニセモノ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Stand("st七海_トレーナー_通常","shock", 110, @-280);
	DeleteStand("st七海_トレーナー_拗ね_pinch", 0, false);
	FadeStand("st七海_トレーナー_通常_shock", 0, true);
	DeleteStand("st七海_制服ダメージ_武器構え2_hate", 500, false);
	Fade("背景０", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//◆部屋着の七海のセリフ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900320na">
「あ、れ……？　ナナは……なんで……？」

やめろ……。

{	Stand("st七海_制服ダメージ_武器構え2","hate", 300, @+280);
	FadeStand("st七海_制服ダメージ_武器構え2_hate", 200, false);
	Fade("背景０", 200, 1000, null, true);
	DeleteStand("st七海_トレーナー_通常_shock", 0, true);}
//◆血まみれ七海のセリフ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900330na">
「ニセモノだからだよっ」

{	Stand("st七海_トレーナー_通常","hate", 110, @-280);
	FadeStand("st七海_トレーナー_通常_hate", 0, false);
	DeleteStand("st七海_制服ダメージ_武器構え2_hate", 200, false);
	Fade("背景０", 200, 0, null, true);}
//◆部屋着の七海のセリフ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900340na">
「ニセモノじゃないっ！」

黙れよ……。

{	Stand("st七海_制服ダメージ_武器構え2","cry", 300, @+280);
	FadeStand("st七海_制服ダメージ_武器構え2_cry", 200, false);
	Fade("背景０", 200, 1000, null, true);
	DeleteStand("st七海_トレーナー_通常_hate", 0, true);}
//◆血まみれ七海のセリフ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900350na">
「おにぃ、離れて……！　そいつから、離れて！」

{	Stand("st七海_トレーナー_拗ね","dent", 110, @-280);
	FadeStand("st七海_トレーナー_拗ね_dent", 0, false);
	DeleteStand("st七海_制服ダメージ_武器構え2_cry", 200, false);
	Fade("背景０", 200, 0, null, true);}
//◆部屋着の七海のセリフ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900360na">
「違うよ、おにぃ。ナナは、ここにいるよ？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00900370ta">
「だ、黙れよぉ！」

耐えきれず、叫んでいた。
ワケが分からなかった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00900380ta">
「どっちかが、妄想だ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00900390ta">
「僕の妹は……七海は、２人は存在しないんだ……」

２人の七海を、交互に見比べる。
どっちも、七海にしか見えない。
だから、部屋着を着ている七海に、僕は向き直った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	DeleteStand("st七海_トレーナー_拗ね_dent", 500, true);
	Stand("bu七海_トレーナー_拗ね","dent", 500, @-180);
	FadeStand("bu七海_トレーナー_拗ね_dent", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
僕は、望む。
こっちの七海が、本物であることを。

ベッドできつく抱きしめ合った、この七海が、本物であることを。

僕は、望み。
手を、伸ばす。

七海の顔に。
その頬を、撫でるために。

でも――

さっきのディソードと同じように。
僕の手は、七海の身体を――

すり抜けた。

七海が、そこにいるのに。
触ることが、できない。
なんの感触もない。

さながら、ホログラムで投影された映像。

僕は、自分でも制御できない悲しみに支配されて。
涙が、ポロポロと溢れて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu七海_トレーナー_通常","shock", 500, @-180);
	FadeStand("bu七海_トレーナー_通常_shock", 300, false);
	DeleteStand("bu七海_トレーナー_拗ね_dent", 300, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//◆部屋着の七海のセリフ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900400na">
「う……そ……」

{	Stand("bu七海_トレーナー_拗ね","dent", 500, @-180);
	DeleteStand("bu七海_トレーナー_通常_shock", 300, false);
	FadeStand("bu七海_トレーナー_拗ね_dent", 300, true);}
//◆部屋着の七海のセリフ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900410na">
「ウソだよ……」

//◆部屋着の七海のセリフ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900420na">
「ナナは、ニセモノじゃないよ……っ」

{	Stand("bu七海_トレーナー_拗ね","sad", 500, @-180);
	FadeStand("bu七海_トレーナー_拗ね_sad", 300, false);
	DeleteStand("bu七海_トレーナー_拗ね_dent", 300, true);}
//◆部屋着の七海のセリフ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900430na">
「ねえ、おにぃ、そうだよね？　そうだって、言ってよ……」

七海が、僕にすがりついてこようとした。
僕は、抱きとめようとした。

だけど、やっぱり、目の前の七海に、実体はなく。
身体は、僕の手をすり抜ける。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu七海_トレーナー_拗ね","cry", 500, @-180);
	FadeStand("bu七海_トレーナー_拗ね_cry", 300, false);
	DeleteStand("bu七海_トレーナー_拗ね_sad", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//◆部屋着の七海のセリフ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900440na">
「違う……違うもん……」

{	Stand("bu七海_トレーナー_拗ね","pinch", 500, @-180);
	FadeStand("bu七海_トレーナー_拗ね_pinch", 300, false);
	DeleteStand("bu七海_トレーナー_拗ね_cry", 300, true);}
//◆部屋着の七海のセリフ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900450na">
「ナナは……ここにいるもん……！」

{	CreateSE("SE02","SE_にん間_動作_手_はたく");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);}
七海の右手が、僕の左手を握りしめてくる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00900460ta">
「あ……」

そこに、感触はあった。
確かに、僕の手を、弱々しい力で、握ってくる。

身体にも、首にも、頭にも、感触はないのに。

七海の“右手だけが”僕に触れている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	DeleteStand("bu七海_トレーナー_拗ね_pinch", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//◆血にまみれた七海のセリフ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900470na">
「ばけもの！」

“右手のない”血まみれの七海が、叫んだ。

//◆血にまみれた七海のセリフ
//苦しげ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900480na">
「おにぃから、今すぐ、離れて……！」

叫んだ直後に、フッとその身体から力が抜け、ディソードを抱えたまま、七海は倒れ込んだ。

//ＳＥ//倒れる音
{	CreateSE("SE03","SE_じん体_動作_滑って転ぶ");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);}
その七海は、額にすごい汗を浮かべていた。
顔から血の気は失せている。

当たり前だ、右手があんなにばっさりと切断されていて、あれだけ血を流していたら、ぶっ倒れるに決まってる。

イヤな想像が、僕の頭の中を駆け巡っている。

そんなはずはないって思いつつも、そうとしか思えない、この状況に対するひとつの解答。
悪夢としか思えない、答え。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	PrintBG(1000);
	CreateTexture360("背景３", 100, 0, 0, "cg/bg/bg026_01_3_拓巳部屋_a.jpg");

	Stand("st梨深_制服_武器構えB","sad", 200, @+280);
	FadeStand("st梨深_制服_武器構えB_sad", 0, true);

	SetVolume360("CH*", 500, 0, null);

	DrawTransition("back*", 500, 1000, 0, 100, null, "cg/data/right3.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
//◆悲しみ
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00900490ri">
「そうだよ……」

七海ではない、声。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00900500ri">
「タクが、今、考えた通りなの」

倒れた七海の向こう――
扉の外に立っているのは――

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00900510ta">
「り……み……」

翼のようなディソードを構えた、咲畑梨深。

目が合った。
梨深は、とても悲しそうな目で、僕を見ていた。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00900520ri">
「あなたが今、右手を握っている、そのナナちゃんは――」

//■３６０
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00900530ri">
//「あなたが、リアルブートしようとしてる存在」
「あなたが、リアルブートしようとしている存在」

リアルブート……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_武器構えB","hard", 200, @+280);
	FadeStand("st梨深_制服_武器構えB_hard", 300, false);
	DeleteStand("st梨深_制服_武器構えB_sad", 300, true);

	BGMPlay360("CH22",0,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00900540ri">
「現実に耐えられなくなったあなたが生んだの」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00900550ri">
「ディソードを持ってるナナちゃんが、本物なんだよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu七海_トレーナー_通常","hate", 300, @-220);
	FadeStand("bu七海_トレーナー_通常_hate", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
//◆部屋着を着た七海のセリフ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900560na">
「う、ウソ言わないでよっ」

//◆部屋着を着た七海のセリフ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900570na">
「ナナの方が、本物だもん！」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00900580ri">
「タク……あなたは、ナナちゃんの切断された手首を見て、ショック状態になったの」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00900590ri">
「そして、妄想した。そんな手首は見てないって。ナナちゃんは五体満足で、無事だって」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "White");
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 0, 0, null, true);

	Fade("回想フラッシュ", 100, 1000, null, true);
	CreateTexture360("七海手首", 2000, 0, middle, "cg/bg/bg160_03_3_chnダンボール箱_a.jpg");
	CreateTextureEX("七海手首２", 2010, 0, middle, "cg/bg/bg160_03_3_ダンボール箱_a.jpg");
	CreateColor("回想明度", 2050, 0, 0, 1280, 720, "White");
	Fade("回想明度", 0, 300, null, true);
	Fade("回想フラッシュ", 500, 0, null, true);

	Fade("回想フラッシュ", 1500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602008]
//■３６０追加
手首なんて、僕は見てない。将軍から送られてきたのは血まみれのケータイ電話で……。

{	Fade("七海手首２", 5000, 1000, null, false);}
それとも、手首はそこに“あった”の？<K>
僕が“見ようとしていなかった”だけで？<K>
僕が“認識していなかった”だけで？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//一瞬だけフラッシュバック
//ＣＧ//裸の七海がＫＵＲＥＮＡＩビル屋上の隅にうずくまっている
	CreateSE("SE回想in","SE_衝撃_衝撃音02");
	SoundPlay("SE回想in",0,1000,false);

	Fade("回想フラッシュ", 100, 1000, null, true);

	Delete("七海手首*");

	CreateTexture360("七海うずくまり", 2000, 0, middle, "cg/ev/ev139_02_3_七海うずくまり_a.jpg");
	Fade("回想フラッシュ", 500, 0, null, true);

	Wait(1500);

	Fade("回想フラッシュ", 100, 1000, null, true);

	Delete("七海うずくまり");
	Delete("回想明度");

	Fade("回想フラッシュ", 1000, 0, null, true);
	Delete("回想フラッシュ");


	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
あの、全裸の七海は――
僕が、生み出したって言うの……？

そして、ホントの七海は――

右手首を切断されて、血まみれで、今、目の前に倒れている七海は、
『将軍』に捕まってたって言うの？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00900600ta">
「ウソだ……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00900610ri">
「ホントなの」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00900620ri">
「ねえ、タク。今すぐ、妄想するのをやめて」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00900630ri">
「あなたがしようとしていることは、人間を１人、丸々作り出すっていう恐ろしい行為なんだよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00900640ri">
「あなたは今、核兵器のエネルギーをも上回る力を使ってる」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00900650ri">
「そのせいでこの１週間、あなたはほとんど昏睡状態だった。自覚、してないかもしれないけど」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00900660ri">
「タク……、このままじゃ、ホントに、この世界に２人のナナちゃんがいることになるの」

{	Stand("st梨深_制服_武器構えB","sad", 200, @+280);
	FadeStand("st梨深_制服_武器構えB_sad", 300, false);
	DeleteStand("st梨深_制服_武器構えB_hard", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00900670ri">
「それに、あなたがその妄想に力を使えば使うほど……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00900680ri">
「命の灯火が、失われていく人がいるんだよ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00900690ri">
「だから……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00900700ta">
「ウソだ……」

{	Stand("st梨深_制服_武器構え","sad", 200, @+280);
	DeleteStand("st梨深_制服_武器構えB_sad", 300, false);
	FadeStand("st梨深_制服_武器構え_sad", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00900710ri">
「ごめんね、あなたを守れなかったあたしの責任だよね」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00900720ri">
「だけどお願い、辛いかもしれないけど――」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00900730ri">
「現実を見て」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00900740ri">
「今すぐ、妄想を止めて」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu七海_トレーナー_拗ね","dent", 300, @-220);
	DeleteStand("bu七海_トレーナー_通常_hate", 300, false);
	FadeStand("bu七海_トレーナー_拗ね_dent", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900750na">
「おにぃ……消さないで……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00900760ri">
「これ以上、妄想を続けるなら……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00900770ri">
「あたしが、あなたを殺す」

{	Stand("bu七海_トレーナー_拗ね","cry", 300, @-220);
	FadeStand("bu七海_トレーナー_拗ね_cry", 300, false);
	DeleteStand("bu七海_トレーナー_拗ね_dent", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00900780na">
「おにぃ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_じん体_動作_手_梨深を振り払う");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	DeleteStand("bu七海_トレーナー_拗ね_cry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
僕は、七海の右手を振り払った。

もう、たくさんだ……。
なにもかも、うんざりだ。

なにを信じればいいのか、さっぱり分からない。

梨深の話を信じろって？　無理だ。

泣きながら僕を見ている七海を信じろって？　無理だ。

ディソードを抱えるようにして倒れている七海を信じろって？　無理だ。

僕自身を信じろって？　無理だ。

僕が望んでいたのは、些細なことだった。
ただ、平穏に、波風なく、暮らしていくこと。
七海と――妹と――静かに、生きていくこと。

それだけが、望みだった。
それだけを、願ってた。

僕には、望むことも、許されないの？
願う事も、許されないの？

だったら――

みんな、消えちゃえばいいんだ。
こんな世界、消し飛んでしまえ。

そして、誰にも邪魔されない、僕の脳内で。
妄想の中で。
本物も偽物もない、ただ１人の七海と、２人きりの世界を生きる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st梨深_制服_武器構え_sad", 500, true);

	Stand("bu七海_トレーナー_拗ね","dent", 300, @0);
	FadeStand("bu七海_トレーナー_拗ね_dent", 500, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00900790ta">
「僕は」

七海の瞳の中を、のぞき込んだ。
涙で濡れていて、キラキラと、輝いていて。
七海が、僕を見てくれていて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00900800ta">
「七海がいてくれれば、それでいいんだ……」

つぶやいた、その直後に――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 1000, 0, null);

	DeleteStand("bu七海_トレーナー_拗ね_dent", 500, true);

//▼べー：Shake追加予定
//ＳＥ//地響き
	CreateSE("SE01","SE_自然_じ鳴り_ふぇーどいん_LOOP");
	MusicStart("SE01", 500, 1000, 0, 1000, null, false);

	CreateSE("SE02","SE_自然_じ鳴り_LOOP");
	MusicStart("SE02", 500, 1000, 0, 1000, null, true);

	CreateTexture360("shake01", 110, 0, 0, "cg/bg/bg026_01_3_拓巳部屋_a.jpg");
	Request("shake01", Smoothing);
	SetAlias("shake01", "shake01");
	Fade("shake01", 0, 1000, null, true);

	CreateProcess("プロセス１", 1000, 0, 0, "Shaker");
	Request("プロセス１", Start);


	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601012]
世界が、揺れた。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00900810ri">
「サードメルト！？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Wait(500);

//ＳＥ//衝撃音
//ＳＥ//爆発音
//ＢＧ//白
	CreateSE("SE04","SE_衝撃_爆発音");
	CreateSE("SE05","SE_衝撃_爆発音");
	CreateSE("SE360104","SE_衝撃_道路陥ぼつ");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	MusicStart("SE360104", 0, 1000, 0, 1000, null, false);
	CreateColor("White", 5000, 0, 0, 1280, 720, "White");
	Request("White", AddRender);

	Fade("White", 0, 0, null, false);
	Fade("White", 500, 1000, null, true);

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602012]
僕の望みは、今、叶えられた。
世界は白に包まれて。
なにもかもを巻き込んで。

文字通り、消し飛んだ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


//～～Ｆ・Ｏ
	SetVolume("SE*", 1000, 0, null);
	ClearAll(4500);
	Wait(2500);
}

//shake用function
function Shaker()
{
	Shake("@shake01", 1000, 0, 0, 10, 10, 1000, null, true);
	while(1)
	{
	Shake("@shake01", 500, 10, 10, 10, 10, 1000, null, true);
	Shake("@shake01", 500, 20, 20, 10, 10, 1000, null, true);
	Shake("@shake01", 500, 10, 10, 20, 20, 1000, null, true);
	}

}
