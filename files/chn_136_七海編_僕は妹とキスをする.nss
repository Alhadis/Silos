//<continuation number="370">

chapter main
{

	$PreGameName = "boot_七海ルート";

	if($GameStart != 1)
	{
		$GameName = "chn_136_七海編_僕は妹とキスをする";
		$GameContiune = 1;
		$七海ルート=true;
		$RouteON=true;
		Reset();
	}

	chn_136_七海編_僕は妹とキスをする();
}


function chn_136_七海編_僕は妹とキスをする()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★七海編

//ＢＧ//拓巳の部屋
//以下、拓巳の妄想世界
//ただし妄想エフェクトはありません
//※七海は部屋着です

	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");

	CubeRoom3("ルーム", 100, 0);
	Rotate("ルーム", 10, 90, 0, 0, Axl1, true);
	Fade("ルーム", 0, 1000, null, true);

	Fade("Black", 2000, 0, null, true);
	Delete("Black");
	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
目を開けると、コンテナハウスの見慣れた天井があった。
僕は横たわっている。
ベッドの上。

あれ？

もしかして僕、寝てた？

すごく怖い夢を見た気がする。
すごくおぞましい夢を見ていた気がする。

でもきっと夢だ。

あれが現実だったのか、夢だったのかなんて、どうでもよかった。
これが現実なのか、妄想なのかなんて、どうでもよかった。

胸のあたりに、重みと、柔らかな感触。
目を向けると、そこに七海がいた。
僕の胸の上で、寝そべっていた。

目が合う。
七海は僕を見ている。じっと。潤んだ瞳で。少し、頬を桜色に染めて。

//◆ささやき
//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000010na">
「昨日の夜は、ありがと……」

なんのことか、最初は分からなかった。

//◆ささやき
//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000020na">
「ナナの気持ち、受け入れてくれて……うれしかった」

//◆ささやき
//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000030na">
「おにぃに愛してもらえて……嬉しかった」

//◆ささやき
//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000040na">
「おにぃのこと、今までよりずっとずっと、好きになっちゃった」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH11",4000,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
そうか、これはいわゆるエロゲ展開か。
案外素直に、その状況に納得した。

今の七海が、とてもかわいく思える。
とても、愛おしく思える。
妹として、そして同時に……１人の女の子として。

//◆ささやき
//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000050na">
「これからも、たくさん、ナナのこと、愛してね……？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/01000060ta">
「……だ、だが断る、って言ったら？」

いつものクセで、ついそう言ってみたくなった。
七海は唇を尖らせ、身体を起こす。

//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000070na">
「もう……。真面目な話してるのに。おにぃのバカ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_じん体_動作_すかーと裾まくり");
	MusicStart("SE01",0,1000,0,1000,null,false);

	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Rotate("ルーム", 1500, @-50, @0, @0, AxlDxl, false);
	Fade("Black", 1000, 1000, null, true);

	Delete("ルーム");
//	Delete("七海同衾");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
ベッドから出て行ってしまった。
しまったなあ、どうやって謝ろうかなあ、と考えを巡らせる。

そこで、自分の手になにかが握られていることに気付く。
顔の前まで持ってきて確かめると、それはバングルだった。

前に僕があげたものじゃなくて、それよりももっとファンシーで、かわいらしいバングル。

七海に似合いそうだ。
そう思って、僕もベッドから出た。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼べー：ＢＧ：片付いている部屋にしてあります。
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg195_02_6_chnBエンド拓巳部屋_a.jpg");

	FadeDelete("Black", 1000, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/01000080ta">
「七海、これ、プレゼント」

{	Stand("st七海_トレーナー_通常","shock", 200, @+100);
	FadeStand("st七海_トレーナー_通常_shock", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000090na">
「え？」

きょとんとしている七海の右手首に、バングルをはめてあげた。
なんだか、結婚指輪をはめてあげてるみたいで、むずがゆい気分になる。

{	Stand("st七海_トレーナー_通常","smile", 200, @+100);
	FadeStand("st七海_トレーナー_通常_smile", 300, true);
	DeleteStand("st七海_トレーナー_通常_shock", 300, false);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000100na">
「わあ、かわいいバングルだ。ナナにくれるの？」

//■３６０
//僕がうなずくと、七海は心の底からうれしそうに微笑んだ。
僕がうなずくと、七海は心の底から嬉しそうに微笑んだ。

{	Stand("st七海_トレーナー_通常","shy", 200, @+100);
	FadeStand("st七海_トレーナー_通常_shy", 300, true);
	DeleteStand("st七海_トレーナー_通常_smile", 0, false);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000110na">
「えへへ、大事にするね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/01000120ta">
「七海……ぼ、僕たちは……ずっと、一緒だよね？」

{	Stand("st七海_トレーナー_通常","shock", 200, @+100);
	FadeStand("st七海_トレーナー_通常_shock", 300, true);
	DeleteStand("st七海_トレーナー_通常_shy", 0, false);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000130na">
「え？　いきなりどうしたの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/01000140ta">
「……ずっと、一緒にいたいんだ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/01000150ta">
「七海と、ずっと一緒に……」

{	Stand("st七海_トレーナー_通常","shy", 200, @+100);
	FadeStand("st七海_トレーナー_通常_shy", 300, true);
	DeleteStand("st七海_トレーナー_通常_shock", 0, false);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000160na">
「や、やだな。そんなダイタンなこと言い出すなんて、おにぃらしくないよ？　熱でもあるの？」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000170na">
「あ、分かった。からかってるんでしょ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/01000180ta">
「……ほ、本気だよ」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000190na">
「おにぃ……」

//◆兄妹＝きょうだい
//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000200na">
「そ、それって、兄妹として？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("st七海_トレーナー_拗ね","angry", 500, @+100);
	FadeStand("st七海_トレーナー_拗ね_angry", 300, false);
	DeleteStand("st七海_トレーナー_通常_shy", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000210na">
「それとも、えっと、１人の女の子として？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/01000220ta">
「……両方」

{	Stand("st七海_トレーナー_通常","shy", 500, @+100);
	DeleteStand("st七海_トレーナー_拗ね_angry", 300, false);
	FadeStand("st七海_トレーナー_通常_shy", 300, true);}
//◆嬉しそう
//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000230na">
「両方……。ふーん、両方か……えへへ」

//◆嬉しそう
//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000240na">
「おにぃの気持ち、初めて聞けたかも」

//◆嬉しそう
//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000250na">
「ナナのこと、そんな風に思ってたんだ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/01000260ta">
「……キモいかな？」

{	Stand("st七海_トレーナー_通常","smile", 200, @+100);
	FadeStand("st七海_トレーナー_通常_smile", 300, false);
	DeleteStand("st七海_トレーナー_通常_shy", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000270na">
「キモくないよっ。むしろ、その……すごく嬉しい……」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000280na">
「ま、まあ、おにぃがそこまで言ってくれたんだし、しょうがないから、ナナも一緒にいてあげるよ」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000290na">
「たーだーし！　一つだけね、条件があるの」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/01000300ta">
「条件……？」

{	Stand("st七海_トレーナー_通常","shy", 200, @+100);
	FadeStand("st七海_トレーナー_通常_shy", 300, false);
	DeleteStand("st七海_トレーナー_通常_smile", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000310na">
「うん。あのね」

七海は、ちょっぴりもじもじとして。
顔を真っ赤にして。

僕の目を、じっと見て。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu七海_トレーナー_通常","shy", 200, @+100);
	DeleteStand("st七海_トレーナー_通常_shy", 500, true);
	FadeStand("bu七海_トレーナー_通常_shy", 500, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000320na">
「キス……してほしいな」

そう言った。

七海の頼みなら、僕はなんだってする。
決めたんだ。七海と２人だけで、生きていくって。

他のなにもいらない。
僕は、七海さえいてくれれば、それでいい。

//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000330na">
「ダメ……？」

//◆兄妹＝きょうだい
//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000340na">
「兄妹でキスなんて……不潔かな……？」

僕は首を左右に振る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/01000350ta">
「そんなこと、ないよ」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000360na">
「おにぃ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu七海_トレーナー_通常_shy", 300, true);
	Wait(500);

	SetVolume360("@CH11", 500, 0, null);

	CreateSE("SE01","SE_じん体_動作_抱く1");
	CreateSE("SE02","SE_じん体_掴む");

	MusicStart("SE01",0,1000,0,1000,null,false);
	MusicStart("SE02",0,1000,0,1000,null,false);


//ＣＧ//七海とキス
	CreateTexture360("ナナキス", 1000, 0, -80, "cg/ev/ev141_01_1_七海キス_a.jpg");
	Fade("ナナキス", 0, 0, null, true);
	Move("ナナキス", 500, @0, @80, Dxl1, false);
	Fade("ナナキス", 500, 1000, null, true);

	Delete("back*");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【七海】
<voice name="七海" class="七海" src="voice/chn06/01000370na">
「だ～い好き！」

{	BGMPlay360("chn04", 0, 1000, true);}
と、七海が勢いよくしがみついてきた。

僕は、妹とキスをする。

妹の、甘い吐息を感じる。

とても幸せで。
とても満たされた気分になって。
七海への愛おしさで溢れて。

でもなぜか、少しだけ、もの悲しくて――

僕の頬を、熱い雫が伝っていって――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	XBOX360_LockVideo(true);
	CreateTextureEX("背景１", 1000, 0, 0, "cg/bg/bg049_01_6_拓巳部屋地震後_a.jpg");
	CreateTextureEX("背景２", 2000, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
		CreateTextureEX("背景３", 1000, 409, -483, "cg/ev/ev802_01_1_七海コーラ死_a.jpg");
		Zoom("背景３", 0, 2000, 2000, null, true);
	XBOX360_LockVideo(false);

	SetVolume360("chn04", 0, 0, NULL);

	CreateSE("SE01","SE_き械_でん化製ひん_ラジオ_ぴンクのいず");

	CreateMovie360("砂嵐", 1000, Center, Middle, true, false, "dx/mv砂嵐.avi");
	SoundPlay("SE01", 0, 1000, true);
	Fade("砂嵐", 0, 500, null, true);
	Fade("背景１", 0, 1000, null, true);
	Wait(700);
		Fade("背景３", 0, 1000, null, true);
		Wait(700);

	SetVolume360("SE01", 0, 0, NULL);
	Fade("背景２", 0, 1000, null, true);
		Delete("背景３");
	Delete("背景１");
	Delete("砂嵐");
	Wait(1500);

	BGMPlay360Suspend("CHN_ED_nanami", 0, 1000, true);
	Fade("背景２", 1000, 0, null, true);
	Delete("背景２");

	$SYSTEM_text_interval = 128;
	LoadBox10();

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text3606001]
その涙は流れるままにして、強く、心に誓った。
{WaitKey(1500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text3606002]
七海がいる、この世界は。
{WaitKey(1500);}
誰にも、侵させない。
{WaitKey(1500);}
僕が、しっかりして。
{WaitKey(1500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text3606003]
絶対に、守る――
{WaitKey(1500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(1000);//――――――――――――――――――――――――――――――

//エンディングへ

//七海編エンド

//	ClearAll(2000);
//	Wait(1000);
}
