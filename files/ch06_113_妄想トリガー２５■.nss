//<continuation number="570">




chapter main
{

	$PreGameName = "boot_第六章";

	if($GameStart != 1)
	{
		$GameName = "ch06_113_妄想トリガー２５■";
		$GameContiune = 1;
		Reset();
	}

		ch06_113_妄想トリガー２５■();
}


function ch06_113_妄想トリガー２５■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateSE("SE環境","SE_日常_PC_はーどでぃすく_LOOP");
//	CreateTexture360("背景２", 5000, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
//	CreateTexture360("背景かぶせ", 5500, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	CreateTexture360("背景２", 450, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");
	CreateTexture360("背景かぶせ", 500, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");
//	Delete("box01");
	Delete("背景かぶせ");


//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	SoundPlay("SE環境", 2000, 500, true);


//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐１へ
//ネガティブ妄想→分岐２へ
//妄想しない→分岐３へ

if($妄想トリガー通過２５ == 0)
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
			$妄想トリガー２５ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー２５ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー２５ = 0;
		}
	}
}



//=============================================================================//

if($妄想トリガー２５ == 2)
{
//☆☆☆
//分岐１
//フラグ【６章エンドフラグ①】ＯＮ
	$６章エンドフラグ① = true;


//ここはあえて妄想ＩＮエフェクトなし
//ＳＥ//コンテナハウスの扉が勢いよく開く

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateSE("SE01","SE_日常_部屋の扉開く_勢いよく");
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg026_01_1_拓巳部屋_a.jpg");
	Delete("box01");
	Delete("背景２");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	SoundPlay("SE01", 0, 1000, false);
	Wait(200);

	Stand("st梨深_制服_正面","hard", 10200, @150);
	FadeStand("st梨深_制服_正面_hard", 200, true);

	Wait(200);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/11300010ri">
「タク……！」

梨深……！

まさに計ったように。
僕の心の叫びが届いたかのように。

梨深は、やっぱり僕のピンチに駆けつけてくれた。

{	DeleteStand("st梨深_制服_正面_hard", 500, true);}
扉を開け、部屋の中に飛び込んでくる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300020ta">
「り、梨深……助けて……」

梨深は僕の顔をそっとのぞき込んでから、周囲を見回した。すぐに僕の怯えの原因がＰＣにあることを悟ったのか、ムッとした表情でキーボードを叩き出す。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");

	ChatMain(420,-54,"002");
	Fade("box01", 0, 1000, null, true);
	Fade("背景２", 0, 1000, null, true);

<PRE @box01>
[text911]
蒋軍さんが入室しました
現在のメンバー：２人
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFCC);
	TypeChat("0");

<PRE @box01>
[text912]
蒋軍：久しぶり
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	TypeChat("0");

<PRE @box01>
[text913]
蒋軍：僕のことキライ？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	TypeChat("0");

<PRE @box01>
[text914]
蒋軍：プレゼントを贈るよ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	TypeChat("0");

<PRE @box01>
[text915]
蒋軍：喜んでもらえると嬉しい
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	TypeChat("0");

	Wait(500);

	CreateSE("SE02","SE_日常_PC_キーたたく_短");
	SoundPlay("SE02", 0, 500, false);

//	ChatMain(420,-54,"002");

	Fade("背景２", 0, 1000, null, false);
	Fade("box01", 0, 1000, null, true);

	Wait(1000);

	CreateSE("SE02","SE_き械_でん化製ひん_ぱそコン_キーボーど_エンター");
	SoundPlay("SE02", 0, 500, false);

//イメージＢＧ//ＰＣ画面（チャット画面）
//ＳＥ//キーボードを叩く音
//ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text002]
ナイトハルト：うるさいバカ！
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("0");

	Wait(1000);

	CreateSE("SE02","SE_日常_PC_キーたたく_中");
	SoundPlay("SE02", 0, 500, false);

	Wait(2500);


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text003]
ナイトハルト：タクにこれ以上ちょっかいかけないで！！１１！！！
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("0");

//ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/11300030ri">
「こういうときはきつく言った方がいいよ」

梨深は僕を振り返って、優しく微笑んだ。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/11300040ri">
「こう言っておけば案外あっさり引き下がるでしょ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300050ta">
「…………」

ホントに、そうかな……。

梨深はネットには詳しくなさそうだから、呑気に構えてるけど。

きつい言い方は、相手を怒らせるだけじゃないだろうか……。

ましてや相手は、あの『将軍』なんだよ……。

固唾を呑んでモニタを見つめていると、しばらくして『将軍』の発言が書き込まれた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ウェブＣＨＡＴ開始

	Wait(500);

	CreateSE("SE01","SE_衝撃_衝撃音02");
	SoundPlay("SE01", 0, 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text105]
蒋軍：ころしてやる
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("2000");

	Wait(2500);

	ChatPerson("001");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text106]
蒋軍さんが退室しました
現在のメンバー：１人
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFCC);
	SoundChat(0,0,false);
	TypeChat("0");

	Delete("");

//ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300060ta">
「…………」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/11300070ri">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("背景２", 1000, 0, null, false);
	Fade("box01", 1000, 0, null, true);
	Delete("@box01");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
部屋に、沈黙が流れる。

なんてことだ……。

やっぱり怒らせちゃったんだ。
最後の発言だけ、明らかに温度が違う。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_右向き","hurry", 200, @150);
	FadeStand("st梨深_制服_右向き_hurry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602007]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/11300080ri">
「たはは、どうせ口だけだよー、口だけ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/11300090ri">
「まさかここに直接押しかけてくるなんてことはないって」

{	Stand("st梨深_制服_正面","sad", 200, @150);
	FadeStand("st梨深_制服_正面_sad", 500, false);
	DeleteStand("st梨深_制服_右向き_hurry", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/11300100ri">
「それよりタク、大丈夫だった？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/11300110ri">
「ごめんね、電話くれたでしょ。ちょうどこっちに向かってるところだったから出られなかった」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/11300120ri">
「さっきの地震の後、タクが心配になって、ここまで全力疾走してきたんだ」

{	Stand("st梨深_制服_正面","normal", 200, @150);
	FadeStand("st梨深_制服_正面_normal", 300, true);
	DeleteStand("st梨深_制服_正面_sad", 0, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/11300130ri">
「来てよかった……」

梨深の声を聞きながらも、僕はモニタから目を離せなかった。

“ころしてやる”という文字が、心をどうしようもなくざわつかせる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300140ta">
「な、なんてことを……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/11300150ri">
「あたしが来たからもう平気だよ。なんの心配もないから」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300160ta">
「なんてことを、し、して、くれたんだよ……っ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300170ta">
「こ、こ、殺される……アイツに殺される……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300180ta">
「早く逃げないと……！」

{	Stand("st梨深_制服_正面","hard", 200, @150);
	FadeStand("st梨深_制服_正面_hard", 300, true);
	DeleteStand("st梨深_制服_正面_normal", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/11300190ri">
「落ち着いて……っ。殺されなんてしないよ、タクの考えすぎ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	SoundPlay("SE*", 1000, 0, false);

	Stand("st梨深_制服_正面","lost", 200, @150);
	FadeStand("st梨深_制服_正面_lost", 500, true);
	DeleteStand("st梨深_制服_正面_hard", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/11300200ri">
「…………」

不意に梨深が黙り込んだ。
眉をひそめて天井を見上げ、

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300210ta">
「ど、どうしたの……？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/11300220ri">
「……その目……だれの目？」

{
//おがみ：実績：その目
	Eyes();
	DeleteStand("st梨深_制服_正面_lost", 500, true);}
ポツリとつぶやいて、
それから表情を歪ませ、
頭を抱える。

{	BGMPlay360("CH06",1000,1000,true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/11300230ri">
「……っ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/11300240ri">
「頭……急に、痛くなって……きた……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300250ta">
「え？　え……？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/11300260ri">
「う、う……痛い……割れ……そう……」

我慢できず、という様子で梨深はその場にへたり込む。いやいやをするように頭を振り出す。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/11300270ri">
「なんで急に……うう……」

まさか……！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CubeRoom2("ルーム", 100, 0);
	Fade("ルーム", 500, 1000, null, false);
	Rotate("ルーム", 0, @0, @180, @0, null, true);
	Rotate("ルーム", 500, @80, @0, @0, AxlDxl, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
僕は反射的に天井を見上げていた。

天井のそのさらに上。そこにあるかもしれない人工衛星。

『将軍』の攻撃！？

{	Fade("ルーム", 500, 0, null, false);
	CreateColor("色１", 100, 0, 0, 1280, 720, "Red");
	Fade("色１", 0, 700, null, true);
	Fade("色１", 500, 0, null, true);}
//◆苦痛
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/11300280ri">
「あ、あああああっ！」

{	CreateColor("色１", 100, 0, 0, 1280, 720, "Red");
	Fade("色１", 0, 700, null, true);
	Fade("色１", 500, 0, null, true);}
//◆苦痛
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/11300290ri">
「痛い痛い痛い痛い！　割れるっ！　割れそう……！」

{	CreateColor("色１", 100, 0, 0, 1280, 720, "Red");
	Fade("色１", 0, 1000, null, true);
	Fade("色１", 500, 0, null, true);}
//◆苦痛
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/11300300ri">
「ぎ、ぎ……ぎ、ぐ、いやああああああっ――」

ツ、と。
梨深の鼻から、血が垂れた。

悲鳴にも似たうめき声は急に途絶え。
梨深の身体が、ぐらりとよろめく。
そのまま、頭から床に倒れ込んだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//人が倒れる音
	CreateSE("SE02","SE_じん体_動作_滑って転ぶ");
	SoundPlay("SE02", 0, 1000, false);

	Wait(1000);

	SetVolume360("CH*", 1000, 0, null);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300310ta">
「り……み……？」

返事はない。
ピクリとも動かない。

殺されたんだ……。
『将軍』の、衛星からの電磁波攻撃で、梨深は、殺されたんだ。

なんて……静かな殺人。

音も、匂いも、気配さえもなく、梨深を殺した。

静かすぎるがゆえに、逆に恐ろしい。

逃げ場は、ない――

僕はその場に膝をつき、梨深の肩を揺すった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300320ta">
「ねえ……起きてよ……梨深……」

地球上のどこにも、逃げ場はない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300330ta">
「僕を、置いていかないでよ……」

『将軍』は、僕がどこに逃げようと、空の上から攻撃してくる――

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300340ta">
「こんなの……こんなの……っ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300350ta">
「こんなの、妄想に決まってる……っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 100, 0, 0, 1280, 720, "Red");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 1500, 1000, null, true);

//ＳＥ//妄想ＯＵＴ
//画面エフェクト//妄想ＯＵＴ

	SetVolume360("CH*", 100, 0, null);
	MusicStart("SE*", 100, 0, 0, 1000, null, false);

	DelusionOut();

	ClearAll(0);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");
	ChatMain(420,-54,"002");
	Fade("box01", 0, 1000, null, true);
	Fade("背景１", 0, 1000, null, true);

<PRE @box01>
[text111]
蒋軍さんが入室しました
現在のメンバー：２人
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFCC);
	TypeChat("0");

<PRE @box01>
[text112]
蒋軍：久しぶり
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	TypeChat("0");

<PRE @box01>
[text113]
蒋軍：僕のことキライ？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	TypeChat("0");

<PRE @box01>
[text114]
蒋軍：プレゼントを贈るよ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	TypeChat("0");

<PRE @box01>
[text115]
蒋軍：喜んでもらえると嬉しい
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	TypeChat("0");

	ChatPerson("001");

<PRE @box01>
[text116]
蒋軍さんが退室しました
現在のメンバー：１人
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFCC);
	TypeChat("0");
	DelusionOut2();
	PositiveHuman();

	Wait(2000);

//イメージＢＧ//ＰＣ画面（チャット画面）

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
我に返ると、僕はいまだＰＣのモニタの前にいた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//ウェブＣＨＡＴ開始

/*
おがみ：演出の為、コメントアウトします
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text012]
将軍さんが退室しました
現在のメンバー：１人
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFCC);
	TypeChat("0");

//ウェブＣＨＡＴ終了
//↑妄想ＯＵＴしたらすでにチャット画面に表示されてるようにしたいです
//※妄想中に打ち込まれた「ナイトハルト：うるさいバカ！」「ナイトハルト：たくにこれ以上ちょっかいかけないで！！１１！！！」「将軍：ころしてやる」はなくなっているようにできますか？
*/

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
さっき梨深が書き込んだ発言が消えている。

『将軍』の“ころしてやる”もだ。

部屋を振り返ってみたけど、梨深の死体はどこにもなかった。

//◆ブレス
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300360ta">
「…………」

梨深が殺されてないことにはホッとしたけど。

梨深が来てくれなかったことにはガッカリした。

どうして……来てくれないんだ……。

僕が、こんなに怯えてるって言うのに……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//合流１へ
}


//=============================================================================//

if($妄想トリガー２５ == 1)
{
//☆☆☆
//分岐２
//ここはあえて妄想ＩＮエフェクトなし

//ＳＥ//コンテナハウスのドアを叩く音（かなり激しく）

	SoundPlay("SE*", 0, 0, false);

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateSE("SE01","SE_じん体_動作_手_扉たたく02_LOOP");
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");

	Fade("box01", 0, 0, null, true);
	Delete("box01");
	Fade("背景１", 0, 1000, null, true);
	Delete("背景２");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	SoundPlay("SE01", 0, 1000, true);

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
そのとき、計ったように扉を叩く音が響いた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300370ta">
「梨深……っ」

梨深だ！　梨深はやっぱり来てくれたんだ！

救われた気分になって、扉の方へと向かう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

//ＳＥ//コンテナハウスのドアを叩く音（かなり激しく）

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
でも、途中で立ち止まった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300380ta">
「…………」

//ＳＥ//コンテナハウスのドアを叩く音（かなり激しく）
なんでそんなに激しく叩くの……？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300390ta">
「り……み……？」

{	SoundPlay("SE01", 200, 0, false);}
扉の向こうに呼びかけてみる。
と、音がピタリとやんだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300400ta">
「…………」

静寂。

返事はない。
なにか答えてほしい。
どうしてなにも言わないんだ？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300410ta">
「梨深……なんでしょ……？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300420ta">
「答えてよ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//５秒ほどウエイト
//ＳＥ//コンテナハウスのドアを叩く音（かなり激しく）
//以下、ドアを叩くＳＥはずっと続く

	Zoom("背景１", 4000, 1300, 1300, Axl1, false);
	Move("背景１", 4000, @-80, @0, Axl1, false);

	Wait(4000);

	CreateSE("SE01","SE_じん体_動作_手_扉たたく01_LOOP");
	CreateSE("SE02","SE_じん体_動作_手_扉たたく02_LOOP");
	Wait(500);
	SoundPlay("SE01", 0, 1000, true);
	SoundPlay("SE02", 0, 1000, true);

	Wait(1000);
	Move("背景１", 500, @80, @0, Axl1, false);
	Zoom("背景１", 500, 1000, 1000, Axl1, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300430ta">
「……っ！」

{	BGMPlay360("CH06",1000,1000,true);}
返事がないまま、再び扉が叩かれる。

梨深じゃないの？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300440ta">
「誰だ……誰……なんだ……？」

まさか『将軍』……？

一度疑心暗鬼に陥ってしまったら、もう扉を開けて誰なのかを確かめる勇気は消え去ってしまった。

僕はのろのろと後ずさり、やがてイスの背もたれにぶつかってよろけてしまう。

その間も、ドアを叩く音は延々と続いている。
誰かが、叩き続けている。

いや、それだけじゃなく――

{	CreateSE("SE03","SE_じん体_動作_手_扉たたく02_LOOP");
	SoundPlay("SE03", 0, 1000, true);}
横の壁や、天井からも、叩く音が響き始める。

外にいる誰かは、
ひとりだけじゃない……！

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300450ta">
「だ、だ、誰だよぉっ……！」

恐怖に耐えられなくなり、たまらず叫んだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//叩く音が止まる
	SoundPlay("SE01", 200, 0, false);
	SoundPlay("SE02", 200, 0, false);
	SoundPlay("SE03", 200, 0, false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
すると、まるで僕の声に反応するように音がピタリとやむ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300460ta">
「はぁっ、はぁっ、はぁっ……」

逃げたい。逃げ出したい。今すぐこの場から遠ざかりたい。

でもどうやって？
きっと外で、謎の集団がこのコンテナハウスを取り囲んでるのに……！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

//ＳＥ//爪で鉄を引っ掻く音
//扉だけでなく壁からも天井からも

	CreateSE("SE01","SE_じん体_動作_手_ぱいぷいす引きずる");
	CreateSE("SE02","SE_じん体_動作_手_ぱいぷいす引きずる");
	CreateSE("SE03","SE_じん体_動作_手_ぱいぷいす引きずる");
	CreateSE("SE04","SE_じん体_動作_手_ぱいぷいす引きずる");
	Wait(500);
	SoundPlay("SE04", 0, 1000, true);
	Wait(600);
	SoundPlay("SE01", 0, 1000, true);
	Wait(500);
	SoundPlay("SE02", 0, 1000, true);
	Wait(800);
	SoundPlay("SE03", 0, 1000, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
音が再び響き出した。

今度は壁を叩く音じゃなく、爪で引っ掻くような、不快な音。

相手の姿が見えない分、恐怖はさらに強くなる。

『将軍』の差し金だっていうのは分かってるけど、壁を一枚隔てたところで僕に嫌がらせをしているこいつらが、どんな姿をしているのかまったく想像できない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300470ta">
「う……」

全身に鳥肌が立ち、不快感で吐き気がさらに増す。
僕はきつく耳を塞いだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300480ta">
「やめて……やめてよ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300490ta">
「許してよぉぉっ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//妄想ＯＵＴ
//画面エフェクト//妄想ＯＵＴエフェクト
//イメージＢＧ//ＰＣ画面（チャット画面）

	SetVolume360("CH*", 100, 0, null);
	MusicStart("SE*", 100, 0, 0, 1000, null, false);

	DelusionOut();

	ClearAll(0);



	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");
	ChatMain(420,-54,"002");
	Fade("box01", 0, 1000, null, true);
	Fade("背景１", 0, 1000, null, true);

<PRE @box01>
[text211]
蒋軍さんが入室しました
現在のメンバー：２人
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFCC);
	TypeChat("0");

<PRE @box01>
[text212]
蒋軍：久しぶり
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	TypeChat("0");

<PRE @box01>
[text213]
蒋軍：僕のことキライ？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	TypeChat("0");

<PRE @box01>
[text214]
蒋軍：プレゼントを贈るよ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	TypeChat("0");

<PRE @box01>
[text215]
蒋軍：喜んでもらえると嬉しい
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	TypeChat("0");

	ChatPerson("001");

<PRE @box01>
[text216]
蒋軍さんが退室しました
現在のメンバー：１人
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFCC);
	TypeChat("0");

	DelusionOut2();
	NegativeHuman();

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
我に返ると、僕はいまだＰＣのモニタの前にいた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ウェブＣＨＡＴ開始

/*
おがみ：以下演出部分なのでコメントアウト

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text020]
将軍さんが退室しました
現在のメンバー：１人
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFCC);
	TypeChat("0");

//ウェブＣＨＡＴ終了
//↑妄想ＯＵＴしたらすでにチャット画面に表示されてるようにしたいです
*/

	CreateTextureEX("振り返り", 5000, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	Fade("振り返り", 0, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text021]
ハッとして部屋の中へと振り返る。

そのままの姿勢で、じっと耳を澄ませた。

……音は、しない。

僕の妄想だったの……？

５分ほど、指先ひとつ動かさず怯えた心のままコンテナの外の様子を窺い続けた。

結局なんの気配もなく、試しに扉を少しだけ開けて外を見てみた。

誰もいなかった。

妄想……だったのかな……？

でも、いまだに心臓は不安で押し潰されそうだった。

モニタに目を戻す。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Fade("振り返り", 500, 0, null, true);
	Delete("振り返り");

//合流１へ
}


//=============================================================================//

if($妄想トリガー２５ == 0)
{
//☆☆☆
//分岐３

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("背景３", 5000, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	Fade("背景３", 0, 1000, null, true);
	Fade("box01", 0, 0, null, true);
	Delete("box01");
	Delete("背景２");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	BGMPlay360("CH01",1000,1000,true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
そうつぶやけば、今までなら梨深がタイミングよく現れてくれた。でも電話は繋がらなかった……。

部屋の隅に転がっている、ニセモノのディソードが目に入る。

わずかな希望にすがるべく、それを手にした。

これはオモチャだ……。
あやせにもそう断言された。

でも、もしかするともしかするかもしれない。
そう思いたい。

ディソードさえあれば、僕は救われるんだ。
『将軍』からの攻撃だって打ち負かせるんだ。

だから、頼むよ……。

僕はディソードを構える。
剣の切っ先に集中する。

本物で、あってくれ……！
僕を、救ってくれ……！

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300500ta">
「ディソード……真の姿を現せ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 5100, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 400, 0, 1000, 100, null, "cg/data/lcenter2.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601022]
目をきつく閉じ、柄を握る手に力を込めた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300510ta">
「…………」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300520ta">
「……………………」

無音。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DrawTransition("色１", 1000, 1000, 0, 100, null, "cg/data/lcenter2.png", true);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602022]
そっと目を開けてみる。

なにも、変わっていなかった。
これは、オモチャだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300530ta">
「くそぅ！　くそうくそうくそう！　この役立たず！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE04","SE_じん体_動作_手_棒を振り回す");
	CreateSE("SE05","SE_衝撃_落下激突");
	CreateSE("SE06","SE_衝撃_とれーぶちまけ");
	SoundPlay("SE04", 0, 1000, false);
	Wait(500);
	SoundPlay("SE05", 0, 1000, false);
	SoundPlay("SE06", 0, 1000, false);

//ＳＥ//オモチャ剣を床に叩きつける

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
オモチャ剣を床に叩きつけ、

それからウロウロと部屋の中を歩き回った。

爪を噛みつつ、どうすればいいか考える。

でも恐怖に押し潰されそうで、考えなんてちっともまとまらなかった。

考えようとしているうちにまた頭が痛くなってきて、やむなくＰＣの前に戻る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ウェブＣＨＡＴ開始

	SetVolume360("CH*", 1000, 0, null);
	MusicStart("SE*", 1000, 0, 0, 1000, null, false);

	Wait(1000);

	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");

	ChatMain(420,-54,"002");
	Fade("box01", 0, 1000, null, true);
	Fade("背景２", 0, 1000, null, true);

<PRE @box01>
[text511]
蒋軍さんが入室しました
現在のメンバー：２人
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFCC);
	TypeChat("0");

<PRE @box01>
[text512]
蒋軍：久しぶり
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	TypeChat("0");

<PRE @box01>
[text513]
蒋軍：僕のことキライ？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	TypeChat("0");

<PRE @box01>
[text514]
蒋軍：プレゼントを贈るよ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	TypeChat("0");

<PRE @box01>
[text515]
蒋軍：喜んでもらえると嬉しい
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	TypeChat("0");

<PRE @box01>
[text024]
蒋軍さんが退室しました
現在のメンバー：１人
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFCC);
	TypeChat("0");

	ChatPerson("001");

	Fade("背景３", 0, 0, null, true);
	Delete("背景３");

	Fade("box01", 0, 1000, null, true);

	Wait(1000);


//ウェブＣＨＡＴ終了
//合流１へ

}

//=============================================================================//

//☆☆☆
//合流１

	CreateSE("SE環境","SE_日常_PC_はーどでぃすく_LOOP");
	SoundPlay("SE環境", 1000, 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text025]
『将軍』はすでにチャットから退室していた。
残ったのは、わずか４行の痕跡だけ。

その文字すら見たくなくて、『将軍』がいなくなった今のうちに急いでチャットルームから抜ける。

まだ身体の震えは止まらなかった。

『将軍』は僕を挑発している。

僕につきまとってなにが楽しいんだろう。

僕が新たな犠牲者として選ばれて、
『将軍』はいよいよ行動を開始したっていうこと？

それとも自分がやった罪を誰かに押しつけるのに、僕が最適だってこと？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300540ta">
「誰か……助けて……助けてよぅ……」

覚醒バージョンの星来たんをすがるように見つめる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300550ta">
「ひとりは……怖いんだ……」

ひとりでいたくない。
誰かにそばにいてほしい。
誰かに、守ってもらいたい。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300560ta">
「そ、そうだ……学校だ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11300570ta">
「学校へ、行けば……」

学校には、梨深が、いる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景３", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	Fade("box01", 200, 0, null, false);
	Fade("背景３", 200, 1000, null, true);
	Delete("@box01");
	Delete("box01");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601025]
ここでひとりで不安なときを過ごすのは耐えられない。

僕は部屋着であるよれよれのトレーナーを脱ぎ捨てると、急いで制服に着替えてベースを出た。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg026_01_1_拓巳部屋_a.jpg");
	SetVolume360("CH*", 2000, 0, null);
	SoundPlay("SE*", 1000, 0, false);

	CreateSE("SE02","SE_日常_扉_開ける");
	Fade("背景２", 200, 1000, null, true);
	SoundPlay("SE02", 0, 1000, false);
	Wait(1000);

	SoundPlay("SE03", 1500, 0, false);

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);

	CreateSE("SE03","SE_日常_扉_閉まる");
	SoundPlay("SE03", 0, 1000, false);

	Wait(3000);


}