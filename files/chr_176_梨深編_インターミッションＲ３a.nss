//<continuation number="910">


chapter main
{

	$PreGameName = "boot_梨深ルート";

	if($GameStart != 1)
	{
		$GameName = "chr_176_梨深編_インターミッションＲ３a";
		$GameContiune = 1;
		$梨深ルート=true;
		$RouteON=true;
		Reset();
	}

	chr_176_梨深編_インターミッションＲ３a();
}


function chr_176_梨深編_インターミッションＲ３a()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//■インターミッションＲ３

//ＢＧ//拓巳の部屋外観・夜
//サードメルト後なので、可能なら流し台などを倒しておいてもらえるとありがたいです……
	IntermissionIn();

	DeleteAll();
//▼べー：ＢＧ：差し替え
//おがみ：BG：追加
	CreateTexture360("back04", 100, center, middle, "cg/bg/bg006_02_3_コンテナ外観_a.jpg");

	IntermissionIn2();

	CreateSE("SE360101","SE_はいけい_崩壊しぶ谷_道玄坂_LOOP");
	CreateSE("SE360201","SE_はいけい_崩壊しぶ谷_神泉えきほーむ_LOOP");
	MusicStart("SE360101",2000,100,0,1000,null,true);
	MusicStart("SE360201",2000,500,0,1000,null,true);


	Wait(1000);

	Stand("st梨深_制服_通常","angry", 200, @+280);
	FadeStand("st梨深_制服_通常_angry", 500, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
咲畑梨深がコンテナハウスから出ると、周囲の世界は一変していた。

死の街――

そんな形容がふさわしい。
周りに見えるビルのいくつかは倒壊し、それを免れた建物も壁に深い亀裂が刻まれている。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200010ri">
「サードメルト……これほどだなんて」

{	Wait(500);}
//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02200020jn">
「……手遅れだったよ。野呂瀬玄一は、予定より早くノアⅡを本格的に稼働させた」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//車椅子の軋む音「キィ……」
	CreateSE("SE01","SE_日常_車椅す");
	SoundPlay("SE01", 0, 1000, false);

	Stand("st将軍_車椅子_通常","normal", 200, @-280);
	FadeStand("st将軍_車椅子_通常_normal", 500, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
声とともに、車イスに腰掛けた少年が現れる。

この古い雑居ビルは、バリアフリーなどではない。車椅子に座ったまま１人でこの屋上へ来ることなど不可能であるにもかかわらず、彼はそこにいた。

梨深はその少年の登場にも驚く素振りを見せない。

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02200030jn">
「元の君に、戻ったみたいだね」

{	Stand("st梨深_制服_通常","normal", 200, @+280);
	FadeStand("st梨深_制服_通常_normal", 300, false);
	DeleteStand("st梨深_制服_通常_angry", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200040ri">
「元のあたしなんて、いないよ。どっちかって言うと、タクが望んだあたしに戻った、っていう感じ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200050ri">
「タクがそう望んでくれたことはさ、すごく、嬉しかったけどね」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02200060jn">
「“彼”はまた、ディソードなしで力を使った」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02200070jn">
「もう少し追い込めば、覚醒できる――」

{	Stand("st梨深_制服_通常","hard", 200, @+280);
	FadeStand("st梨深_制服_通常_hard", 300, false);
	DeleteStand("st梨深_制服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200080ri">
「タクのことは、そっとしておいてあげて」

遮るように、梨深はきっぱりと言った。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200090ri">
「ノアⅡは、あたしがなんとかする」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200100ri">
「ナナちゃんも、あたしが助ける」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200110ri">
「あなたも、死なせないよ」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02200120jn">
「君１人じゃ、野呂瀬に対抗はできない」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02200130jn">
「それに、前から言っているけど、君は、普通に生きるべきなんだ」

{	Stand("st梨深_制服_通常","normal", 200, @+280);
	FadeStand("st梨深_制服_通常_normal", 300, false);
	DeleteStand("st梨深_制服_通常_hard", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200140ri">
「タクとね、約束、したんだ」

梨深は、どんよりと曇る空を見上げて、儚げに微笑んだ。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200150ri">
「あたしがタクのこと守るって」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200160ri">
「だから、行くね」

{	Stand("st梨深_制服_通常ビシッ！","smile", 200, @+280);
	DeleteStand("st梨深_制服_通常_normal", 300, false);
	FadeStand("st梨深_制服_通常ビシッ！_smile", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200170ri">
「ビシィ！」

//【将軍】
//<voice name="将軍" class="将軍" src="voice/chn01/02200280jn">
<voice name="将軍" class="将軍" src="voice/chn01/02200180jn">
「梨深……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st梨深_制服_通常ビシッ！_smile", 500, true);
//	CreateSE("SE01","SE_じん体_動作_足_階だん歩く");
//	MusicStart("SE01", 1000, 300, 0, 1000, null, false);

	Wait(500);

	DeleteStand("st将軍_車椅子_通常_normal", 500, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
車椅子の少年の横をすり抜けて、梨深は階段を下りていった。
少年はそれを追わず――追うことができず――車椅子に深々と身を沈めて、ため息をついた。

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02200190jn">
「自分を、犠牲にするつもりなの、梨深……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	ClearAll(2000);
	Wait(1000);
}

