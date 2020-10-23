//<continuation number="1340">




chapter main
{

	$PreGameName = "boot_第七章";

	if($GameStart != 1)
	{
		$GameName = "ch07_144_妄想トリガー３２■";
		$GameContiune = 1;
		Reset();
	}

		ch07_144_妄想トリガー３２■();
}


function ch07_144_妄想トリガー３２■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//ＢＧ//１０７前//夕方
//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	PrintBG(1000);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//☆☆☆
//妄想トリガー
//ポジティブ妄想→分岐７へ
//ネガティブ妄想→分岐８へ
//妄想しない→分岐９へ

if($妄想トリガー通過３２ == 0)
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
			$妄想トリガー３２ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー３２ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー３２ = 0;
		}
	}
}


//=============================================================================//

if($妄想トリガー３２ == 2)
{
//☆☆☆
//分岐７




//ＢＧ//１０７前//夕方
//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("背景３", 400, 0, 0, "cg/bg/bg009_02_2_107_a.jpg");
	Fade("背景３", 0, 1000, null, true);
	Stand("bu梢_制服_通常","normal", 450, @+150);

	CreateSE("SE01","SE_日常_雑踏02");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);


	FadeStand("bu梢_制服_通常_normal", 300, true);
	MusicStart("SE01", 1000, 1000, 0, 1000, null, true);

	FadeDelete("back*", 300, true);
	Delete("back*");
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
そっか、それじゃ妄想か……。

{	BGMPlay360("CH03", 2000, 1000, true);}
もちろん、さっきの血まみれＤＱＮたちも含めて。

{	Stand("bu梢_制服_通常","sad", 500, @+150);
	FadeStand("bu梢_制服_通常_sad", 300, false);
	DeleteStand("bu梢_制服_通常_normal", 300, true);}
//◆わざと「でもでも」です
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400010ko">
「妄想でもでもなーいもん」

妄想としか考えられないでしょ！

星来たんと同じだよ。
僕の脳内でだけ再生される、僕の嫁だ。

{	Stand("bu梢_制服_通常","shy2", 500, @+150);
	FadeStand("bu梢_制服_通常_shy2", 300, false);
	DeleteStand("bu梢_制服_通常_sad", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400020ko">
「こ、こずぴぃは、西條くんのお嫁さんになった覚えはー、なーいよ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 300, 1000, null, false);
	Stand("bu星来_覚醒後_通常","angry", 550, @0);
	FadeStand("bu星来_覚醒後_通常_angry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【星来】
<voice name="星来" class="星来" src="voice/ch07/14400030se">
「っていうか、タッキーは浮気しちゃダメっしょ。あたしだけ見ててほしいのに」

//◆拗ねた口調
//【星来】
<voice name="星来" class="星来" src="voice/ch07/14400040se">
「このぼけなす」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色２", 600, 0, 0, 1280, 720, "Black");
	Fade("色２", 200, 1000, null, true);
	DeleteStand("bu星来_覚醒後_通常_angry", 0, false);
	Delete("色１");
	Fade("色２", 400, 0, null, true);
	Delete("色２");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
星来たんが僕の嫁であることには変わりはないよ。

そもそも、こずぴぃなんていうアホっぽいキャラにまったく覚えがないんだけど……。

{	Stand("bu梢_制服_通常","sad", 500, @+150);
	FadeStand("bu梢_制服_通常_sad", 300, false);
	DeleteStand("bu梢_制服_通常_shy2", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400050ko">
「えう……アホっぽい？　ぽい？」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400060ko">
「でもでーもー、ホントに幻聴や妄想じゃーなーくてっ」

じゃあ誰だって言うんだ？
まさか、目の前でオドオドしてる転校生とか？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH*", 0, 0, false);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//※以下のセリフのみリアルの声
//◆ブレス
//【梢】
<voice name="梢" class="梢" src="voice/ch07/14400070ko">
「…………」

//※以上のセリフのみリアルの声
と、その転校生が小さくうなずいた。

{	BGMPlay360("CH03", 1000, 1000, true);}
え、ま、まさかね……。
今のはたまたま偶然だよね。

それにうなずいたように見えただけで、もしかしたら僕の勘違いかもしれないし。

{	Stand("bu梢_制服_通常","angry", 500, @+150);
	FadeStand("bu梢_制服_通常_angry", 300, false);
	DeleteStand("bu梢_制服_通常_sad", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400080ko">
「だーかーらー！　こずぴぃがこずぴぃなのー！」

そんなわけあるはずがないでしょ！
こんなテレパシーのような真似をできるもんか！

{	Stand("bu梢_制服_正面","sad", 500, @+150);
	DeleteStand("bu梢_制服_通常_angry", 500, true);
	FadeStand("bu梢_制服_正面_sad", 500, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400090ko">
「うにゅ～、どうしたら信じてくれるのー？」

なにが“うにゅ～”だよ。
心なしか転校生まで悲しそうな顔をしているように見えるから不思議だ。

くそ……いい加減鬱陶しくなってきた。

そんなに言うなら、こずぴぃとやら、自分が転校生であることを証明してみてよ。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400100ko">
「証明……？」

スリーサイズは？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――
	
	Stand("bu梢_制服_通常","sad", 500, @+150);
	DeleteStand("bu梢_制服_正面_sad", 500, true);
	FadeStand("bu梢_制服_通常_sad", 500, true);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//◆怯える
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400110ko">
「ひうぅっ」

{	Stand("bu梢_制服_通常","shy", 500, @+150);
	FadeStand("bu梢_制服_通常_shy", 300, false);
	DeleteStand("bu梢_制服_通常_sad", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400120ko">
「西條くん……ヘンタイタ～イなのら……」

答えられないのか。
ということはやっぱりお前は妄想だ。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400130ko">
「……うぴ～」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400140ko">
「こずぴぃ、自分のスリーサイズなんてあまり計ったことなーいの……」

じゃあバストだけでいい。
だいたいの数値を教えてよ。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400150ko">
「恥ずかしぃのら……」

……うーむ。
自分の脳内で繰り広げられているあまりに変態すぎる会話に、ちょっと引く……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400160ko">
「７３……くらいでしゅ～」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14400170ta">
「…………」

確かに転校生も胸はペッタンコだ。
一応、辻褄は合っている。
ちなみに僕は貧乳も好きだ。

//※以下のセリフのみリアルの声
//◆ブレス
//【梢】
<voice name="梢" class="梢" src="voice/ch07/14400180ko">
「…………」

//※以上のセリフのみリアルの声
なぜか転校生が、顔を真っ赤にしている。ただでさえ小柄な身体を、ますます縮こまらせた。

――こんなの偶然だ。

声とリアクションがシンクロしてるのはたまたまだ。そもそも今のは証明にならないし。

{	Stand("bu梢_制服_通常","sad", 500, @+150);
	FadeStand("bu梢_制服_通常_sad", 300, false);
	DeleteStand("bu梢_制服_通常_shy", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400190ko">
「ちゃんとちゃ～んと答えたのー！」

だって、転校生のバストサイズなんて僕が知るわけないじゃないか。計らせてください、なんて言ったら逮捕間違いなしだし。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400200ko">
「うにゅ～」

じゃあ、生年月日は？

{	Stand("bu梢_制服_通常","smile", 500, @+150);
	FadeStand("bu梢_制服_通常_smile", 300, false);
	DeleteStand("bu梢_制服_通常_sad", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400210ko">
「それなら簡単なのら。１１月１３日だよ」

//■３６０
//「それなら簡単なのら。１１月の１３日だよ」
ふーん。

まあ、結局それも実際には調べようがないけどね。

ほとんど喋ったことのない三次元女子に、いきなり“キミの誕生日っていつ？”なんて聞けていたら、僕はとっくの昔にリア充だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_正面","sad", 500, @+150);
	DeleteStand("bu梢_制服_通常_smile", 500, true);
	FadeStand("bu梢_制服_正面_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//※以下のセリフのみリアルの声
//◆ブレス
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400220ko">
「…………」

//※以上のセリフのみリアルの声
すると目の前でうなだれていた転校生が、突然自らのカバンの中を漁り始めた。

そしてなにかを引っ張り出し、涙目で僕に突きつけてくる。

それは生徒手帳だった。
まだ新品同然だ。

その表紙をめくると、転校生の顔写真や“折原梢”という名前、さらに生年月日も書かれてあった。

生年月日……。
思わずその日付に注目してしまう。
書かれてあったのは――

１１月１３日。

{	BGMPlay360("CH*", 1000, 0, false);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14400230ta">
「え、ウソ……でしょ……」

{	Stand("bu梢_制服_通常","shy", 500, @+150);
	DeleteStand("bu梢_制服_正面_sad", 500, false);
	FadeStand("bu梢_制服_通常_shy", 500, true);}
//※以下のセリフのみリアルの声
//◆恥ずかしそうなブレス
//【梢】
<voice name="梢" class="梢" src="voice/ch07/14400240ko">
「…………っ」

//※以上のセリフのみリアルの声
そう言えば、名前。
この転校生、生徒手帳を見る限りだと……

折原梢。
こずえ。
こずぴぃ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14400250ta">
「ま、まさか……」

{	Stand("bu梢_制服_通常","normal", 500, @+150);
	FadeStand("bu梢_制服_通常_normal", 300, false);
	DeleteStand("bu梢_制服_通常_shy", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400260ko">
「だから～だから～、最初からそう言ってたのら。こずぴぃ、なの」

もしかしてこれって、妄想じゃない……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	PositiveHuman();

//合流３へ
}


//=============================================================================//

if($妄想トリガー３２ == 1)
{
//☆☆☆
//分岐８


//おがみ：ビデオロック
	XBOX360_LockVideo(true);

//ＢＧ//１０７前//夕方
	CreateTextureEX("背景３", 400, 0, 0, "cg/bg/bg009_02_2_107_a.jpg");
	Fade("背景３", 0, 1000, null, true);
	Stand("bu梢_制服_通常","normal", 450, @+150);

	CreateSE("SE01","SE_日常_雑踏02");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	FadeStand("bu梢_制服_通常_normal", 300, true);
	MusicStart("SE01", 0, 1000, 0, 1000, null, true);

	FadeDelete("back*", 300, true);
	Delete("back*");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
ということは――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateTexture360("背景０",700, center, middle, "SCREEN");
	CreateColor("黒", 1000, 0, 0, 1280, 720, "Black");
	DrawTransition("黒", 200, 0, 1000, 100, null, "cg/data/down2.png", true);
	CreateTexture360("空", 800, 0, 0, "cg/bg/bg126_01_2_夕焼け空_a.jpg");
	DrawTransition("黒", 200, 1000, 0, 100, null, "cg/data/up2.png", true);
	Delete("黒");
	Delete("背景０");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
僕はギクリとして、空を見上げた。

まさか『将軍』からの音声攻撃！？
僕の思考を監視してる！？

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400270ko">
「しょ～ぐん？　ぐん？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_衝撃_ふらっしゅばっく");
//ＢＧ//ＰＣ画面（ｗｅｂページ、英文テキスト表示）
//※５章で出てきた、アメリカの訴訟記録
//フラッシュバックで一瞬表示
	CreateColor("色１", 1500, 0, 0, 1280, 720, "BLACK");
	CreateTextureEX("特許", 1600, 0, 0, "cg/bg/bg139_02_3_特許_a.jpg");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Fade("特許", 200, 1000, null, true);

//	CreateTexture360("背景１", 1500, center, middle, "SCREEN");

	Delete("色１");
//	Delete("特許");

	FadeDelete("特許", 1000, true);
//	Delete("背景１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
人工衛星から、僕を攻撃してきている！

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14400280ta">
「ひぃぃっ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("黒１", 1000, 0, 0, 1280, 720, "Black");
	DrawTransition("黒１", 200, 0, 1000, 100, null, "cg/data/down2.png", true);
	Delete("空");
	SetVolume("SE01", 0, 500, null);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
たまらず頭を抱え、その場にしゃがみ込む。

殺される！
今度こそ殺される！

この前、Ｏ－ＦＲＯＮＴで僕が『将軍』の言うことを聞かなかったから、あいつは怒ってこんな行動に出たに違いない！

どうしよう、どこへ行けばこの攻撃から身を守れる？

それを考えて、絶望的な気分に突き落とされた。

逃げ場は、ない――

宇宙空間から、ピンポイントで僕へと向けられる、目に見えない攻撃。きっと遮蔽物があろうと兵器で貫通してくる。少なくとも日本には逃げる場所も、隠れる場所も存在しない。

終わりだ……僕はもう、完全に終わりだ……

//◆こわーい＝怖い
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400290ko">
「こずぴぃのこと、こわーい……？」

なにが“こずぴぃ”だ！
そんな萌え声で僕を油断させようっていう気なの！？

なんでだよっ、なんでそんなに僕を付け狙うんだよぅ！

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400300ko">
「うにゅ～、付け狙ってなんてないのら……」

僕をどうするつもり！？

僕の頭を爆発させる？
僕の脳だけをドロドロに溶かす？
それともただ脳だけを殺して、植物状態にでもするの？

そんなの……イヤだ……
僕は死にたくない……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	DeleteStand("bu梢_制服_通常_normal", 0, true);

	Wait(500);

	Stand("bu梢_制服_正面","sad", 500, @+150);
	FadeStand("bu梢_制服_正面_sad", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//※以下のセリフのみリアルの声
//◆ブレス
//【梢】
<voice name="梢" class="梢" src="voice/ch07/14400310ko">
「…………」

//※以上のセリフのみリアルの声
うずくまって怯えていた僕の肩を、誰かが指でつついた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 1000, 1000, null);
	Fade("黒１", 1000, 0, null, true);
	Delete("黒１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
恐る恐る顔を上げると、相変わらず転校生がそこにいた。

僕の指をつつきながら、言葉をつぶやこうとして結局なにも言わず、おずおずと手を挙げる。

{	Stand("bu梢_制服_通常","sad", 500, @+150);
	DeleteStand("bu梢_制服_正面_sad", 500, true);
	FadeStand("bu梢_制服_通常_sad", 500, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400320ko">
「こずぴぃが、こずぴぃなのら」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14400330ta">
「え……？」

{	Stand("bu梢_制服_通常","angry", 500, @+150);
	FadeStand("bu梢_制服_通常_angry", 300, false);
	DeleteStand("bu梢_制服_通常_sad", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400340ko">
「こ・ず・ぴぃ・が！　こ・ず・ぴぃ・なの！」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400350ko">
「それとこずぴぃは、“転校生”じゃなくて、折原梢、なのら」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14400360ta">
「…………」

折原梢。そんな名前をだいぶ前に三住くんから聞いた覚えが、かすかにある。

梢。
こずえ。
こずぴぃ。

まさか……。

この声は、君が僕の頭の中に送り込んできているものっていうこと？

{	Stand("bu梢_制服_通常","normal", 500, @+150);
	FadeStand("bu梢_制服_通常_normal", 300, false);
	DeleteStand("bu梢_制服_通常_angry", 300, true);}
転校生はコクコクと一生懸命な様子でうなずく。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14400370ta">
「テ、テ、テレパシー……？」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400380ko">
「仕組みはよく分かんないのら」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400390ko">
「でもできるのー」

そんなバカな……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	NegativeHuman();

//合流３へ
}


//=============================================================================//

if($妄想トリガー３２ == 0)
{
//☆☆☆
//分岐９

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

//ＢＧ//１０７前//夕方
	CreateTextureEX("背景３", 400, 0, 0, "cg/bg/bg009_02_2_107_a.jpg");
	Fade("背景３", 0, 1000, null, true);
	Stand("bu梢_制服_通常","normal", 450, @+150);

	CreateSE("SE01","SE_日常_雑踏02");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	FadeStand("bu梢_制服_通常_normal", 300, true);
	MusicStart("SE01", 0, 1000, 0, 1000, null, true);
	
	FadeDelete("back*", 300, true);
	Delete("back*");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
精神的に追い詰められすぎて、脳内で新たな人格を作り出さなきゃ耐えられなかったってことなのか。

やっぱり僕は、優愛の言葉通り、多重人格――？

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400400ko">
「こずぴぃはちゃんとこずぴぃなのらー」

//◆ひとー＝人
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400410ko">
「西條くんとは違うひとーだよ」

普通、多重人格の人は別人格同士での会話はできないって聞いたけど……。
僕は特殊ってことか。

{	Stand("bu梢_制服_通常","sad", 500, @+150);
	FadeStand("bu梢_制服_通常_sad", 300, false);
	DeleteStand("bu梢_制服_通常_normal", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400420ko">
「こずぴぃはちがーうのー！」

うんざりだ……。

そのうち、この“こずぴぃ”とかいうウザい人格だけじゃなくて、それ以外の人格の声も聞こえてくるようになるんだろうか。

そもそも、僕の中にはいったい何人の人格がいるんだろう。アメリカには２４人もの人格を持つ患者もいるって、なにかの本で読んだことがあるけど。

さらに言えば。

この僕っていう人格が、主人格かどうかさえ定かじゃない。

西條拓巳の肉体の本来の持ち主は、僕じゃない人格かもしれないんだ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_正面","sad", 500, @+150);
	DeleteStand("bu梢_制服_通常_sad", 500, true);
	FadeStand("bu梢_制服_正面_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//※以下のセリフのみリアルの声
//◆ブレス
//【梢】
<voice name="梢" class="梢" src="voice/ch07/14400430ko">
「…………」

//※以上のセリフのみリアルの声
呆然となって立ち尽くしている僕の肩を、転校生が指でつついた。

そうしながら、言葉をつぶやこうとして結局なにも言わず、おずおずと手を挙げる。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400440ko">
「こずぴぃが、こずぴぃなのら」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14400450ta">
「え……？」

{	Stand("bu梢_制服_通常","angry", 500, @+150);
	DeleteStand("bu梢_制服_正面_sad", 500, true);
	FadeStand("bu梢_制服_通常_angry", 500, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400460ko">
「こ・ず・ぴぃ・が！　こ・ず・ぴぃ・なの！」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400470ko">
「それとこずぴぃは、“転校生”じゃなくて、折原梢、なのら」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14400480ta">
「…………」

折原梢。そんな名前をだいぶ前に三住くんから聞いた覚えが、かすかにある。

梢。
こずえ。
こずぴぃ。

まさか……。

この声は、君が僕の頭の中に送り込んできているものっていうこと？

{	Stand("bu梢_制服_通常","normal", 500, @+150);
	FadeStand("bu梢_制服_通常_normal", 300, false);
	DeleteStand("bu梢_制服_通常_angry", 300, true);}
転校生はコクコクと一生懸命な様子でうなずく。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14400490ta">
「テ、テ、テレパシー……？」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400500ko">
「仕組みはよく分かんないのら」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400510ko">
「でもできるのー」

そんなバカな……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//合流３へ
}


//=============================================================================//

//☆☆☆
//合流３

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
声の正体は……彼女……だって言うの？

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400520ko">
「西條くん、だーいじょうぶ？」

転校生はうつむいたまま、上目遣いで僕の顔を指差した。その指先が震えている。

//◆たらりーっ＝擬音
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400530ko">
「たらりーって、出てる」

自分の顔に触れてみた。
鼻の下がぬるぬるする。鼻血が出ていた。

転校生がポケットティッシュを差し出してくる。

それを受け取って鼻血を拭きながらも、僕は薄気味悪さを覚えていた。

転校生は――

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400540ko">
「“こずぴぃ”だよ？」

こ、こずぴぃは、口を動かしていない。喋ってない。
それなのに、どうして僕には、彼女の声が聞こえるんだろう……。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400550ko">
「心の声なのら」

そのウザい語尾はやめてくれ。三次元でやられると引く。

{	Stand("bu梢_制服_通常","sad", 500, @+150);
	FadeStand("bu梢_制服_通常_sad", 300, false);
	DeleteStand("bu梢_制服_通常_normal", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400560ko">
「ふぇうっ、ご、ごめーん……」

って、僕の心の声も聞こえるの！？

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400570ko">
「聞こえるよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14400580ta">
「ふ、普通に、話さないのは、な、なんで……？」

{	Stand("bu梢_制服_通常","shy", 500, @+150);
	FadeStand("bu梢_制服_通常_shy", 300, false);
	DeleteStand("bu梢_制服_通常_sad", 300, true);}
//※以下のセリフのみリアルの声
//◆恥ずかしそうなブレス
//【梢】
<voice name="梢" class="梢" src="voice/ch07/14400590ko">
「…………っ」

//※以上のセリフのみリアルの声
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400600ko">
「恥ずかしいし……」

そっか……。
その気持ちはよく分かる。僕もそうだから。

{	Stand("bu梢_制服_正面","normal", 500, @+150);
	DeleteStand("bu梢_制服_通常_shy", 200, true);
	FadeStand("bu梢_制服_正面_normal", 200, true);}
と、彼女は小動物っぽくキョロキョロとして、僕をチラリと見てからひとりで駅の方へ歩き出した。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400610ko">
「ここー、離れた方がいいと思う」

なんで？
困惑しながらも僕は付いていく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("効果０",700, center, middle, "SCREEN");
	Delete("背景*");
	DeleteStand("bu梢_制服_正面_normal", 0, true);

	SetVolume("SE01", 1000, 0, NULL);

	CreateSE("SE10","SE_はいけい_しぶ谷えき_LOOP");
	MusicStart("SE10", 1000, 1000, 0, 1000, null, true);

//ＢＧ//センター街//夕方
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg079_01_2_渋谷駅前_a.jpg");
	DrawTransition("効果０", 1000, 1000, 0, 100, null, "cg/data/left3.png", true);
	Delete("背景３");
	Delete("効果０");

	Stand("bu梢_制服_通常","normal", 500, @+150);
	FadeStand("bu梢_制服_通常_normal", 500, true);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
歩いていて気付いた。

脇腹に刺すような痛みがある。歩を進める度にズキズキとするから、僕はたまらず立ち止まった。

脇腹をおさえ、息をつく。

人が多い。
渋谷なんて大嫌いだ……。

すれ違うすべての人に笑われている気がする。
みんなに見られているような気がする。

みんなが僕の顔を知っているように思えてくる。

――僕を、見るな。
――僕を、笑うな。

どこか、人のいないところで休みたい……。

{	Stand("bu梢_制服_通常","smile", 500, @+150);
	FadeStand("bu梢_制服_通常_smile", 300, false);
	DeleteStand("bu梢_制服_通常_normal", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400620ko">
「ほいじゃあ、いーいところがあるのら！」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400630ko">
「ごあんなーい、します♪」

こずぴぃは、学校で何度か顔を合わせていたときとは、明らかにテンションが違った。

それにリアルでは無口なのに、心の声は、こんなにも、その……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_通常","angry", 500, @+150);
	FadeStand("bu梢_制服_通常_angry", 300, false);
	DeleteStand("bu梢_制服_通常_smile", 300, true);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//◆「うぷー」＝頬をふくらませて怒ってる
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400640ko">
「あっ、今、うるさーい女って考えたー！　うぷー！」

……心の声で話ができるっていうのは、便利だけど、鬱陶しい。

っていうか、僕もあっさり受け入れちゃってるけど、これっていったいどういう仕組みなんだろう。

まさか本物の超能力……？

{	Stand("bu梢_制服_通常","sad", 500, @+150);
	FadeStand("bu梢_制服_通常_sad", 300, false);
	DeleteStand("bu梢_制服_通常_angry", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400650ko">
「やっぱり、こずぴぃのこと、気味悪い……よね」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400660ko">
「こんなの、普通じゃないし……」

……普通じゃないのは、別に気にしてないよ。
他にも変人と遭遇する機会が最近増えたし。

それにこずぴぃは、口調はちょっと変だけど、怖いわけでも、デンパなわけでもないから、まだマシだよ……。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400670ko">
「そう言ってもらえると、うるうるーってなっちゃうのら……」

歩きながらこずぴぃはいきなり泣き出す。
驚いて、僕は慌ててポケットティッシュを返した。

//※以下のセリフのみリアルの声
//◆泣く
//【梢】
<voice name="梢" class="梢" src="voice/ch07/14400680ko">
「…………っ」

//※以上のセリフのみリアルの声
彼女はペコペコと必要以上に頭を下げてそれを受け取り、目元の涙を拭った。

……さっきの続きだけど。

考えてることを全部読まれちゃうのは、気味が悪いし、居心地も悪い。
それが、率直な感想。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400690ko">
「そーだよね……」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400700ko">
「ごめんなしゃい……」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400710ko">
「でーもでーも、聞きたくなくても聞こえちゃうの……うにゅ～」

そう、なの……？

//◆そうなの
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400720ko">
「そなの」

まあ、なんにせよ君も僕みたいなキモオタに
そんなこと言われたくないよね……。

こんなキモい男には、やっぱり価値なんてない……。

{	Stand("bu梢_制服_通常","angry", 500, @+150);
	FadeStand("bu梢_制服_通常_angry", 300, false);
	DeleteStand("bu梢_制服_通常_sad", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400730ko">
「そーんなことない！」

鬱モードに戻りかけたところで、こずぴぃが心の声で強く叫んだ。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400740ko">
「ダーメだよ、そんなこと、言っちゃ」

{	Stand("bu梢_制服_通常","sad", 500, @+150);
	FadeStand("bu梢_制服_通常_sad", 300, false);
	DeleteStand("bu梢_制服_通常_angry", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400750ko">
「そんな、悲しいこと……」

//※以下のセリフのみリアルの声
//◆泣く
//【梢】
<voice name="梢" class="梢" src="voice/ch07/14400760ko">
「……っ、……」

//※以上のセリフのみリアルの声
またはらはらと泣き始める。

なんで泣くの？
僕に同情してるの？

だとしたらそんなの必要ないよ。

なにしろ僕は、妄想で脳内人格を作り出して、それが実在してる人物だって勘違いしちゃうぐらいなんだ。例えば梨深とか……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_正面","normal", 500, @+150);
	DeleteStand("bu梢_制服_通常_sad", 500, true);
	FadeStand("bu梢_制服_正面_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
//◆「こーと」＝「事」
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400770ko">
「それって、咲畑しゃん……じゃなかった、咲畑さんのこーと？」

知ってるの！？

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400780ko">
「だって、クラスメイトだよ」

{	Stand("bu梢_制服_通常","shy", 500, @+150);
	DeleteStand("bu梢_制服_正面_normal", 500, true);
	FadeStand("bu梢_制服_通常_shy", 500, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400790ko">
「西條くんのー、カノジョしゃんなのら」

ち、違うよ……！

{	Stand("bu梢_制服_通常","normal", 500, @+150);
	FadeStand("bu梢_制服_通常_normal", 500, true);
	DeleteStand("bu梢_制服_通常_shy", 500, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400800ko">
「違うのー？　てっきりてっきり、そうだとばーぁっかり思ってた」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14400810ta">
「…………」

こずぴぃが、梨深のことを知っている。
それが意味するのは――

梨深は、実在してるっていうこと。

僕の妄想じゃない。
僕の脳内キャラじゃない。
梨深は、ちゃんと、いるんだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14400820ta">
「そう、か……」

よかった……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("効果０",700, center, middle, "SCREEN");
	
	DeleteStand("bu梢_制服_通常_normal", 0, true);
	Delete("背景*");
	
//ＢＧ//ＭＨＶ前//夕方
	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg074_01_2_ＭＨＶ前_a.jpg");
	DrawTransition("効果０", 1000, 1000, 0, 100, null, "cg/data/left3.png", true);
	
	Delete("背景１");
	Delete("効果０");

	Stand("bu梢_制服_通常","normal", 500, @+150);
	FadeStand("bu梢_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
でも、だとしたらどうして、一度も連絡をくれないんだろう。

やっぱり、あのＯ－ＦＲＯＮＴの一件で、梨深にも愛想を尽かされちゃったのかな。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400830ko">
「咲畑しゃん、地震があったあの日、青い顔をして早退していっちゃったのら」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400840ko">
「それ以来、学校来てなーいよ？」

{	Stand("bu梢_制服_通常","sad", 500, @+150);
	DeleteStand("bu梢_制服_通常_normal", 300, false);
	FadeStand("bu梢_制服_通常_sad", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400850ko">
「もしかして、家族になにか悲しーいことがあった……かも～」

そう……なんだ……。

救われた気分になった。僕は梨深に見捨てられたわけじゃないって分かったら、本気で涙が出そうになった。

そういうことなら、また、学校に行く理由ができた。梨深にもう一度会いたい。それまでは、頑張って、学校に行こう――

{	SetVolume("SE10", 2000, 500, NULL);
	Stand("bu梢_制服_正面","sad", 500, @+150);
	DeleteStand("bu梢_制服_通常_sad", 300, false);
	FadeStand("bu梢_制服_正面_sad", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400860ko">
「気をつけーてね」

え……？

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400870ko">
「西條くんがー、咲畑しゃんと付き合ってるって思ってたから、言わなかったけどけどけどー」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400880ko">
「咲畑しゃんには、気をつけて」

どういう、意味……？

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400890ko">
「咲畑しゃんは、よく分かんないのら……」

だから、どういう意味だよ……。

よく分からない、って――

あの『張り付け』のこと？

それとも、彼女と１年生の頃からクラスメートだったっていう事実が僕の記憶から欠落してること？

確かに梨深には、いまだに謎の部分がある。

でも彼女は、僕を何度も助けてくれた。
怯えてた僕に“一緒にいてあげる”って言ってくれた。

彼女は僕の敵じゃない……！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE10", 2000, 1000, NULL);

//	CreateSE("SE10","SE_はいけい_しぶ谷えき_LOOP");
//	MusicStart("SE10", 1000, 1000, 0, 1000, null, true);

	Stand("bu梢_制服_通常","sad", 500, @+150);
	DeleteStand("bu梢_制服_正面_sad", 500, true);
	FadeStand("bu梢_制服_通常_sad", 500, true);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400900ko">
「ひゃう～～」

なぜかこずぴぃは目を回していた。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400910ko">
「そんなに一度にいっぱぁい考えらーれると……」

//◆いけにゃい～＝いけない
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400920ko">
「こずぴぃ、ついていけにゃい～」

ご、ごめん……。

なんだか不思議だ。

僕はいつも、誰かと会話するときは考えていることの２割も言えないで終わっちゃうことがほとんどだったけど、心の会話じゃむしろ“喋りすぎ”ならぬ“考えすぎ”っていうことになっちゃうのかも。

こずぴぃにしてもそうだ。

まさかこんなに――脳内で――喋る子だとは思わなかった。

{	Stand("bu梢_制服_通常","normal", 500, @+150);
	FadeStand("bu梢_制服_通常_normal", 300, false);
	DeleteStand("bu梢_制服_通常_sad", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400930ko">
「喋ってる、っていう感覚は薄ーいよ？」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400940ko">
「考えてるだけ。それが流れ込むだけ。
相手にはビビーッて。相手からはドバーッて」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400950ko">
「慣れてないと、自分の思考と相手の思考がごちゃごちゃーってなって、うにゃあ？　ってなるの」

に、日本語でおｋ……。

ニュアンスとしてはなんとなく理解できるけど。

会話の機微みたいなものがない、っていうことかな。

相手の顔色を窺って、言いたいことが言えなくなっちゃう、なんてこともない。

考えてることが駄々漏れなら、“空気を読む”ことさえできなくなるよね。

一方通行じゃないけど、双方向でもなくて、てんでバラバラに飛び交っている矢印を選んで他は聞かないようにしなきゃいけない、みたいなことなのかも。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400960ko">
「だからだーから、気楽だし、距離感も近いけど――」

{	Stand("bu梢_制服_通常","sad", 500, @+150);
	FadeStand("bu梢_制服_通常_sad", 300, false);
	DeleteStand("bu梢_制服_通常_normal", 300, true);}
//◆悲しそうに
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400970ko">
「傷つくことも、簡単なの」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14400980ta">
「…………」

一瞬、こずぴぃは表情を曇らせた。
でもすぐに、泣き笑いのような表情を浮かべる。

{	Stand("bu梢_制服_通常","shy2", 500, @+150);
	FadeStand("bu梢_制服_通常_shy2", 300, false);
	DeleteStand("bu梢_制服_通常_sad", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14400990ko">
「えへ。西條くんは初めてなのにすーんごく上手だよー」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401000ko">
「こずぴぃとビビビが合うの」

ビビビが、ね……。
波長が合う、って言いたいのかな？

{	Stand("bu梢_制服_通常","smile", 500, @+150);
	FadeStand("bu梢_制服_通常_smile", 300, false);
	DeleteStand("bu梢_制服_通常_shy2", 300, true);}
//◆そーう＝そう
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401010ko">
「そーう。はちょーはちょー」

まあ、星来たん相手にいつも似たようなことやってるからじゃないかな……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_通常","normal", 500, @+150);
	FadeStand("bu梢_制服_通常_normal", 300, false);
	DeleteStand("bu梢_制服_通常_smile", 300, true);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
//◆うぴぃ＝怯える
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401020ko">
「あ、でもでもー、あのときの西條くんは怖かったの。うぴぃ」

あのとき……？

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401030ko">
「今日の朝、教室で」

げ、そ、そう言えば……
僕ってばむちゃくちゃやばい妄想をしてたような。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401040ko">
「だから、ふひゃーって思って、つい声をかけちゃったのら……」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401050ko">
「ほんとーは、なるべくこの力を他の人に知られないようにしーようって、決めてたのに」

いや、あのときは、自暴自棄になってたっていうか……えと、えと……まぁ……あくまで妄想というか……はは……

軽蔑するよね、普通。
はあ……。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401060ko">
「きっと、それをほんっとーにやってたら、こずぴぃは西條くんを――」

{	SetVolume("SE10", 500, 1, NULL);
	Stand("bu梢_制服_通常","smile", 500, @+150);
	FadeStand("bu梢_制服_通常_smile", 300, false);
	DeleteStand("bu梢_制服_通常_normal", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401070ko">
「殺してたよ♪」

……え？

あまりにも無邪気に、そんな物騒なことを言うから。
そのギャップに、僕は、ゾクリとした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("効果０",700, center, middle, "SCREEN");
	
	DeleteStand("bu梢_制服_通常_smile", 0, true);
	Delete("背景*");
	
//ＢＧ//Ｒｏｆｔ前//夕方
	CreateTexture360("背景３", 100, 0, 0, "cg/bg/bg058_01_2_Ｒｏｆｔ前_a.jpg");
	DrawTransition("効果０", 1000, 1000, 0, 100, null, "cg/data/left3.png", true);

	SetVolume("SE10", 2000, 1000, NULL);

	Delete("背景２");
	Delete("効果０");

	Stand("bu梢_制服_通常","normal", 500, @+150);
	FadeStand("bu梢_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
僕らは無言のまま――でも心での交信は続けながら――センター街を抜けて井の頭通りに出た。

僕らって、傍目から見ると、無言のまま互いの顔も見ずに歩いている、初々しいカップルに見えるのかな。

{	Stand("bu梢_制服_通常","shy", 500, @+150);
	FadeStand("bu梢_制服_通常_shy", 300, false);
	DeleteStand("bu梢_制服_通常_normal", 300, true);}
//※以下のセリフのみリアルの声
//◆ビックリして息を呑む
//【梢】
<voice name="梢" class="梢" src="voice/ch07/14401080ko">
「っ！」

//※以上のセリフのみリアルの声
隣でこずぴぃが盛大に息を呑む。
そして目を丸くして、僕の顔を見上げてきた。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401090ko">
「カ、カップル……」

ち、違う！　あくまで例えだよ、た・と・え！

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401100ko">
「またふひゃーってさせられたのらー」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401110ko">
「西條くんにラブラブラーブ告白されたかと……」

ご、ごめん……。

やっぱり全部筒抜けだとやりにくい……。
こずぴぃと話してるときは、余計な妄想はできるだけしない方が身のためかも。

{	Stand("bu梢_制服_通常","normal", 500, @+150);
	FadeStand("bu梢_制服_通常_normal", 300, false);
	DeleteStand("bu梢_制服_通常_shy", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401120ko">
「あのーあのー、聞きたいな」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401130ko">
「先週の、西條くんがテレビに出てたときのこと」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14401140ta">
「…………」

……どうせ、言ったって信じてくれないよ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_通常","angry", 500, @+150);
	FadeStand("bu梢_制服_通常_angry", 300, false);
	DeleteStand("bu梢_制服_通常_normal", 300, true);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
//◆頬を膨らませているような感じで
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401150ko">
「それ決めつけー。うぷー」

{	Stand("bu梢_制服_通常","normal", 500, @+150);
	FadeStand("bu梢_制服_通常_normal", 300, false);
	DeleteStand("bu梢_制服_通常_angry", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401160ko">
「こずぴぃは、あのとき下にいたんだよ」

下……？

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401170ko">
「スクランブル交差点。ハチ公口の改札前。ちょうど、通りかかって」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401180ko">
「あのとき、ずっと声、聞こえーてたよ」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401190ko">
「西條くんの、声」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401200ko">
「七海しゃんを助けたい、助けなきゃ、って」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401210ko">
「聞こえたよ」

僕の心の声は、そんな遠くまで届いたの？
Ｏ－ＦＲＯＮＴの屋上から駅の改札まで、意外と距離あるけど。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401220ko">
「それだけ、あのときの西條くんの想いは、強かったーのら」

じゃあ、こずぴぃは分かってくれるんだね。

僕が、超能力のパフォーマンスをやるつもりであんな騒動を起こしたわけじゃないって。

{	Stand("bu梢_制服_正面","normal", 500, @+150);
	DeleteStand("bu梢_制服_通常_normal", 500, true);
	FadeStand("bu梢_制服_正面_normal", 500, true);}
//◆混乱
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401230ko">
「うん。だからだーから、価値はなくなくないよ。<?>
{	Stand("bu梢_制服_正面","sad", 500, @+150);
	FadeStand("bu梢_制服_正面_sad", 300, true);
	DeleteStand("bu梢_制服_正面_normal", 300, true);}
う？　なくなく？」

でも……結局、ダメだったんだ。
僕は七海を……妹を助けるよりも、自分の命を優先した。
ギリギリになって、逃げた……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text021]
//※「Ｒｏｆｔ」＝「Ｌｏｆｔ」のこと
こずぴぃは、Ｒｏｆｔの前で立ち止まった。
その入り口を指差しながら、僕を見る。

どうやら“案内する”って言ってたのは、この中らしい。

Ｒｏｆｔの中に休む場所なんてあるとは思えない。

それに狭い密閉空間に、客がいっぱいだ。

……無意識のうちに足が震えていた。
あの夜のスクランブル交差点で聞いた歓声や怒声が、頭の中に響いてくる。

人が多い場所には行きたくない……。
Ｒｏｆｔの中に入ったら、逃げ場がなくなる……。

{	Stand("bu梢_制服_通常","smile", 500, @+150);
	DeleteStand("bu梢_制服_正面_sad", 500, true);
	FadeStand("bu梢_制服_通常_smile", 500, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401240ko">
「だーいじょうぶだよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundStop("SE10");

	CreateTexture360("効果０",700, center, middle, "SCREEN");

	DeleteStand("bu梢_制服_通常_smile", 0, true);
	Delete("背景*");

//ＢＧ//Ｒｏｆｔ店内
	CreateTexture360("背景４", 100, 0, 0, "cg/bg/bg059_01_2_Ｒｏｆｔ店内_a.jpg");
	DrawTransition("効果０", 1000, 1000, 0, 100, null, "cg/data/left3.png", true);

	Delete("背景３");
	Delete("効果０");

//あやべ：Ｒｏｆｔ店内ＳＥ
	CreateSE("SE02","SE_はいけい_ゲロカエルんしょぷ_LOOP");
	MusicStart("SE02", 500, 700, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
彼女は僕が怯えているにもかかわらず、それを無視してどんどん先に歩いていく。

僕はできるだけ周囲を見ないようにしながら、足早についていくしかなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景５", 200, 0, 0, "cg/bg/bg060_01_2_Ｒｏｆｔエスカレーター昇り_a.jpg");
	Fade("背景５", 500, 1000, null, true);
	Delete("背景４");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601022]
上りエスカレーターに乗ると、こずぴぃは後ろに立つ僕に振り返った。
小柄な彼女は一段上にいて、それでちょうど背の高さが同じぐらいになった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_通常","normal", 500, @+150);
	FadeStand("bu梢_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602022]
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401250ko">
「七海しゃんは助かったんだよね？　だーったら、西條くんが頑張ったおかげだよ」

僕の力で助かったわけじゃない。
僕はなにもしてないのと同じだよ……。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401260ko">
「屋上から、手を伸ーばしてたよね？」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401270ko">
「なにを、しようとしたの？」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401280ko">
「びょーんって、飛ぼうとしたのかな？」

……違うよ。
剣を、手に入れようとしてた。

それは妄想の剣で、あの屋上から見た景色の中に溶け込んでて。

//◆さらっと
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401290ko">
「ディソード？」

うん。そう。
手を伸ばせばつかめるって言われたけど、できなかった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14401300ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//心臓の鼓動
	SetVolume("SE02", 1000, 0, null);

	CreateSE("SE03","SE_じん体_心臓_鼓動");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14401310ta">
「な、なんで……っ！？」

思わず叫んでしまった。

すれ違う下りエスカレーターに乗っていたカップルに、冷たい目を向けられて、慌てて自分の口を手で押さえる。

……こずぴぃ、なんでディソードのこと、知ってるの？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_通常","smile", 500, @+150);
	FadeStand("bu梢_制服_通常_smile", 300, false);
	DeleteStand("bu梢_制服_通常_normal", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601023]
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14401320ko">
「こずぴぃも持ってーるもん」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14401330ta">
「へ……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu梢_制服_通常_smile", 300, true);

	CreateTextureEX("背景６", 200, 0, 0, "cg/bg/bg059_01_2_Ｒｏｆｔ店内_a.jpg");
	Fade("背景６", 500, 1000, null, true);
	Delete("背景５");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602023]
５階でエスカレーターを降りると、こずぴぃは何気なく右手を頭上に掲げた。

その仕草はまるで、太陽のまぶしさに対して手でひさしを作っているかのようで。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＧ//梢・ディソード顕現
//※可能なら梢のディソード顕現シーンはアニメーションがいいです！
//梢・ディソード顕現パターン
//①梢が右手を頭の上に掲げる。手は開いた状態。
//②ワイヤーフレームのごとく枠部分が光点をなぞっていくようにして出現
//③枠部分のワイヤーフレームが完成したところで、ガラス部分の発光が出現
//④梢がグリップ部分を握ると、全体が実体化。梢はあいている左手で剣を支える（ラフ絵のポーズ）

//あやべ：フラッシュ
	Delete("SE*");

	CreateSE("SE09","SE_擬音_光が広がる");
	CreateSE("SE36009","SE_擬音_ディそーど落ちる");

	MusicStart("SE36009", 0, 1000, 0, 1000, null, false);
	MusicStart("SE09", 0, 1000, 0, 1000, null, false);

	CreateColor("フラッシュ", 1000, 0, 0, 1280, 720, "White");
	Request("フラッシュ", AddRender);
	Fade("フラッシュ", 0, 0, null, true);
	Fade("フラッシュ", 1000, 1000, null, true);

	DeleteStand("bu梢_制服_通常_smile", 0, ture);

	CreateTexture360("梢ディソード", 500, 0, -624, "cg/ev/ev071_01_1_梢ディソード顕現_a.jpg");
	Request("梢ディソード", Smoothing);
	Fade("梢ディソード", 0,1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text024]
その手に沿うように、いきなり空中に光が出現する。

いや、それは光というより、線。

例えるなら、ワイヤーフレームに似ていた。

いくつもの光線がなにもなかったはずの空間に交錯し、やがて形作ったのは、スノーボードのような形状。

{//ＳＥ//衝撃音
	CreateSE("SE04","SE_擬音_ディそーど出現");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);}
そこへ、青い光――ワイヤーフレームの光線よりも輝きが激しい――が幾筋か走り。

こずぴぃが、開いていた手を握りしめた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	Fade("フラッシュ", 2000, 0, null, false);
bg/bg244_01_6_chnディソード全体_梢_a.png
	Move("梢ディソード", 3000, 0, @+624, Dxl2, true);
	Wait(1000);
	CreateTextureEX("梢ディソード２", 1000, 0, -240, "cg/ev/ev071_01_1_梢ディソード顕現_a.jpg");
	Request("梢ディソード２", Smoothing);
	Fade("梢ディソード２", 2000, 1000, null, true);

	CreateTextureEX("梢ディソード３", 1500, 0, -240, "cg/ev/ev071_01_1_梢ディソード顕現_a.jpg");
	Request("梢ディソード３", Smoothing);
	Fade("梢ディソード３", 0, 1000, null, true);

	Delete("梢ディソード");
	Delete("背景*");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text025]
直後、ワイヤーフレームだったものが、

テクスチャを貼ったかのように、

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	FadeDelete("フラッシュ", 2000, false);
	Move("梢ディソード３", 3000, 0, @+240, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601025]
重厚さと冷たさを感じさせる金属の板へと姿を変えていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14401340ta">
「ディ……ソード……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("SE*", 500, 0, null);


	WaitAction("梢ディソード３", null);
	Delete("フラッシュ");
	Delete("梢ディソード２");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602025]
セナやあやせが持っていたものと、形状はあまりにもかけ離れているけど。
それでも、身に纏う空気は同じだった。

板、というにはあまりに禍々しく。

剣、というにはあまりにも飾り気がなく。

無垢なる獰猛さと。
破滅的な凛々しさとを持ち合わせているそれを。

彼女は、軽々と掲げ持っている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("３３");
	TypeBegin();//――――――――――――――――――――――――――――――


	EndTrigger();

//おがみ：↓これ、次のスクリプト冒頭じゃだめなの？
//梢ディソードＣＧ次cut引継ぎ
//おがみ：360ちらつき防止のため次スクリプトへ
//	PrintBG(1000);
	Delete("梢ディソード３");


}