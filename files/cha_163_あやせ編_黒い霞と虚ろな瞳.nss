//<continuation number="140">

chapter main
{

	$PreGameName = "boot_あやせルート";

	if($GameStart != 1)
	{
		$GameName = "cha_163_あやせ編_黒い霞と虚ろな瞳";
		$GameContiune = 1;
		$あやせルート=true;
		$RouteON=true;
		Reset();
	}

	cha_163_あやせ編_黒い霞と虚ろな瞳();
}


function cha_163_あやせ編_黒い霞と虚ろな瞳()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★あやせ編

	CreateSE("SE3601","SE_じん体_動作_足_階だん歩く");
	MusicStart("SE3601",4000,1000,0,1000,null,true);

	Wait(1000);
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
//ＢＧ//井の頭線地下トンネル
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg194_01_6_井の頭線地下トンネル_a.jpg");



	DrawTransition("Black", 1000, 1000, 0, 100, null, "cg/data/right3.png", true);
	Delete("Black");

	Wait(1000);

	CreateSE("SE3602","SE_じん体_動作_足_階だん歩く");
	MusicStart("SE3602",1000,500,0,1000,null,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
駅員もいなくて、電車も止まっている状況で、あやせは線路に降り立ち、その線路沿いをなおも進んでいく。

薄暗いトンネル。本来は一般人じゃ決して入ってこられない場所。
まだ崩落はしていないけど、いつ崩れるかもしれないとひやひやしてしまう。

こんな線路を歩くことになるなんて、昨日までの僕は想像すらしてなかった。

線路を歩いて冒険か。映画化決定だね。

……っていうか、似た話で、有名な映画がもうすでにあったっけ。
僕が生まれる前に作られた映画だから、当然見たことはない。知ってるのは“線路を歩いて死体を探しに行く映画”っていうことぐらい。

まあ、地下鉄のトンネルじゃ、情緒の欠片もないけど。

この線路を歩き続けると、神泉、駒場東大前、池ノ上、下北沢という駅を通ることになる。今や陸の孤島となった渋谷を脱出するなら、こうして線路を歩いていくのは悪くない方法だ。

でも僕らはもともと代々木にいて、わざわざ渋谷に戻ってきたんだ。
だから、あやせが渋谷を脱出する気でいるとは思えない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01200030ta">
「あの……ど、どこへ、行くの……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stあやせ_制服_武器構え","hard", 250, @+150);
	FadeStand("stあやせ_制服_武器構え_hard", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01200040ay">
「……神泉の駅よ」

いったいそこになにがあるって言うんだ？

神泉駅から学校へ行くつもりなのかな？　それとも僕のベースが目的地だったりして。でもあやせは僕のベースの場所は知らないはずだし……。

そう言えば星来たんは無事だろうか。
あの地震でＫＵＲＥＮＡＩ会館ビルも倒壊していて、僕の嫁たちが瓦礫に埋もれていたらどうしよう……。

そんな下らないことを考えているうちに、明かりが見えてきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE36*", 1000, 0, null);
	Wait(1000);
//ＢＧ//崩壊渋谷神泉駅ホーム
	PrintBG(2000);

	CreateSE("SE3611","SE_はいけい_崩壊しぶ谷_神泉えきほーむ_LOOP");
	MusicStart("SE3611",2000,1000,0,1000,null,true);

	CreateTexture360("背景０", 100, 0, 0, "cg/bg/bg193_01_5_崩壊渋谷神泉駅ホーム_a.jpg");
	DrawTransition("back*", 1000, 1000, 0, 100, null, "cg/data/right3.png", true);

	Delete("back*");
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
神泉駅は、トンネルを抜けると踏切があって、そこでわずかに空が顔をのぞかせる。その後、線路は再び屋内に入って、そこがホームになる。

地震のせいか、ホームの照明は消えていて、かなり薄暗い。

人影はほとんどなかった。
２人ほど、ホームでうずくまっているのが見えるぐらいだ。
服装から見ると、翠明の女子生徒っぽかった。

あやせはその２人に、なんの迷いもなく歩み寄っていく。
もしかして知り合いだったりするんだろうか。

近づくにつれて、暗い中でも女子生徒の姿がはっきり見えてきた。
そして僕は、眉をひそめた。

あの２人、どこかで、見たことがあるような……。

すぐに、彼女たちが何者か、悟った。

セナと、こずぴぃだ……！

だけど様子がおかしい。
僕らの足音は聞こえているはずなのに、こっちを見ようともしない。
へたり込んだまま、顔も上げず、動かない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01200050ta">
「セ、セナ……？　こずぴぃ……？」

呼びかけてみる。
それでも２人は動かない。
いったい、どうしたって言うんだ？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE3611", 1000, 1, null);


	CreateSE("SE回想in","SE_衝撃_衝撃音02");

	CreateColor("回想フラッシュ", 2500, 0, 0, 1280, 720, "WHITE");
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 0, 0, null, true);

	Fade("回想フラッシュ", 0, 1000, null, true);
	SoundPlay("SE回想in",0,1000,false);

	CreateColor("回想明度", 2400, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);

	CreateTexture360("回想背景", 2000, 0, 0, "cg/bg/bg107_01_3_外来棟屋上_a.jpg");
	Stand("buあやせ_制服_通常","hard", 2200, @-50);
	FadeStand("buあやせ_制服_通常_hard", 0, true);

	Fade("回想フラッシュ", 500, 0, null, true);

	Wait(100);

//■３６０：ＶＦ：ファイル名、タグ調整
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//ＶＦ//回想セリフ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900580ay_efx">
「黒騎士の心が殺されていく」

//ＶＦ//回想セリフ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900590ay_efx">
「だから回収するの。ディソードを」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


	Wait(100);

	Fade("回想フラッシュ", 0, 1000, null, true);

	Delete("回想明度");
	Delete("回想背景");
	DeleteStand("buあやせ_制服_通常_hard", 0, true);

	SetVolume("SE3611", 1000, 1000, null);

	Fade("回想フラッシュ", 1500, 0, null, true);
	Delete("回想フラッシュ");

	Wait(500);
	SetVolume("SE3611", 1500, 1000, null);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
まさか……。
そんな、まさか……！

僕は慌てて２人に駆け寄った。
うなだれているセナの顔をのぞき込む。

//◆愕然
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01200060ta">
「あ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//※「ev_035_梢コケる」と「ev_093_セナ父殺し」のキャラ絵を使い回して、表情とバストアップ部分は見せずに（暗くて見えないということにして）へたり込んでいる様子をチラッとだけでも表現できるといいかもなぁ、と思ったり思わなかったりです
//▼べー：ＥＶ：こちら作成するのでしょうか。とりあえず表示だけしておきます。

//	CreateTexture360("梢崩壊", 500, 0, 0, "cg/ev/ev035_01_0_梢コケる_a.jpg");
	CreateColor("黒幕", 2500, 0, 0, 1280, 720, "BLACK");
	Fade("黒幕", 0, 0, null, true);

	Fade("黒幕", 500, 1000, null, true);
	CreateColor("黒幕２", 2500, 0, 0, 1280, 720, "BLACK");
	DrawTransition("黒幕２", 0, 600, 600, 300, null, "cg/data/up.png", true);

	CreateTexture360("セナ崩壊", 500, 0, 0, "cg/ev/ev093_01_1_セナ父殺し_a.jpg");
	Fade("黒幕", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
セナの瞳に、精気はなかった。
虚ろで、光は失せ、なにも見ていない。
誰彼構わずにらみつけていた、あの鋭い目付きは面影もない。

蚊の鳴くほどの小さな声でなにかをブツブツとつぶやいているけど、聞き取ることはできなかった。

それはこずぴぃも同じだった。
やっぱり目から輝きがなくなり、だらしなくよだれを垂らして、言葉になっていないかすれた声を発している。

２人に、なにがあったんだ。
この渋谷で、なにが起こってるんだよ……！？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("黒幕", 500, 1000, null, true);

	FadeDelete("セナ崩壊", 0, true);
	Delete("黒幕２");

	Fade("黒幕", 500, 0, null, true);
	Delete("黒幕");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
訳が分からなくて、あやせに視線で問いかけてみる。
だけどあやせは、２人にはまったく関心がないみたいだった。

２人の傍らに転がっている、それぞれのディソード。
それに、自らのディソードを近づけて。

//ＳＥ//共鳴音
{	CreateSE("SE01","SE_擬音_共鳴音_激しい_LOOP");
	MusicStart("SE01", 1000, 1000, 0, 1000, null, true);}
また、激しい共鳴音がホームに鳴り響く。
計３本のディソードの形が変形する。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("フラッシュ",2000, 0, 0, 1280, 720, "White");
	Fade("フラッシュ", 0, 0, null, true);

//ＳＥ//衝撃音
	SetVolume("SE3611", 1000, 0, null);
	SetVolume("SE01", 350, 0, null);
	Wait(500);

	CreateSE("SE03","SE_擬音_ディそーど_衝撃は");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	Wait(200);
	Fade("フラッシュ", 0, 1000, null, true);
	DrawTransition("フラッシュ", 200, 0, 1000, 200, null, "cg/data/zoom1.png", true);
	CreateTexture360("あやせディソード", 500, 0, 0, "cg/bg/bg242_01_6_chnディソード全体_あやせ_a.jpg");
	Request("あやせディソード", Smoothing);
	Zoom("あやせディソード", 0, 1200, 1200, null, true);


	Zoom("あやせディソード", 3000, 1000, 1000, Dxl1, false);
	DrawTransition("フラッシュ", 1000, 1000, 0, 200, null, "cg/data/zoom2.png", false);
	FadeDelete("フラッシュ", 1000, true);
	Wait(2000);

	SetVolume("SE3602", 3000, 1000, null);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3677004]
風圧に似た衝撃を感じて、僕の身体がよろけた。

それが去った後には、すでにセナとこずぴぃのディソードは、あやせの手の中に収まっていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	FadeDelete("あやせディソード", 1000, true);

	Stand("stあやせ_制服_武器構え","hard", 250, @+100);
	FadeStand("stあやせ_制服_武器構え_hard", 500, true);

//おがみ：先行読み込み
	CreateColor("黒幕２", 400, 0, 0, 1280, 720, "BLACK");
	Fade("黒幕２", 0, 0, null, true);
	CreateColor("下敷き", 50, 0, 0, 1280, 720, "BLACK");
	Fade("下敷き", 0, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01200070ay">
「これで、６本揃った」

あやせが、興奮したように頬を上気させ、僕を見る。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01200080ay">
「拓巳。あとは、キミが手に入れるだけよ」

だから、なんでそんなに平然としていられるんだよ……！

カッとなって、同時に、またも頭に、刺すような痛み。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateColor("Red", 1000, 0, 0, 1280, 720, "Red");
	Fade("Red", 0, 0, null, true);
	Request("Red", AddRender);

//ＳＥ//衝撃音
//ＢＧ//おどろおどろしいイメージ
	CreateSE("SE02","SE_き械_でん化製ひん_ラジオ_ぴンクのいず");
	CreateSE("SEおど","SE_衝撃_衝撃音02");
	CreateSE("SE360103","SE_擬音_ないふ_しゅっ血");
	CreateSE("SE03","SE_擬音_ないふ_しゅっ血");

	Stand("st梢_制服_正面_血まみれ","sigh", 250, @0);
	Stand("bu梢_制服_正面_血まみれ","sigh", 250, @300);

	CreateTextureEX("おど", 600, 0, 0, "cg/bg/bg207_01_6_おどろおどろしいイメージ_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	BGMPlay360("CH26", 2000, 1000, true);
	CreateMovie360("砂嵐", 500, Center, Middle, true, false, "dx/mv砂嵐.avi");	

	MusicStart("SE02",0,1000,0,1000,null,true);
	Fade("砂嵐", 0, 1000, null, true);
	Wait(200);
	SetVolume("SE02", 0, 1, null);
	Fade("砂嵐", 0, 0, null, true);
	Wait(500);
	SetVolume("SE02", 0, 1000, null);
	Fade("砂嵐", 0, 1000, null, true);

	Delete("背景０");
	DeleteStand("stあやせ_制服_武器構え_hard", 0, true);
	Fade("下敷き", 0, 0, null, true);
	Fade("Red", 200, 1000, null, true);

//	CreateTextureEX("おど２", 700, 0, 0, "cg/bg/bg207_01_6_おどろおどろしいイメージ_a.jpg");
//	SetAlias("おど", "おど");
//	SetAlias("おど２", "おど２");
//	Zoom("おど", 0, 2000, 2000, null, true);
//	Zoom("おど２", 0, 2000, 2000, null, true);
//	Request("おど２", Smoothing);
//	Request("おど２", AddRender);
//	Fade("おど２", 0, 500, null, false);
//	Rotate("おど２", 100000, @0, @0, @2000, Dxl2,false);
//	Rotate("おど", 100000, @0, @0, @-1000, Dxl2,false);
//	CreateProcess("プロセス１", 1000, 0, 0, "odoro");
//	Request("プロセス１", Start);
//	Zoom("おど２", 100000, 2000, 2000, Dxl2, false);
	Fade("おど", 0, 500, null, true);

	Fade("黒幕２", 0, 1000, null, true);
	DrawTransition("黒幕２", 0, 300, 300, 300, null, "cg/data/up.png", true);


	MusicStart("SEおど", 0, 700, 0, 1000, null, false);
	SetVolume("SE02", 1500, 300, null);

	FadeDelete("Red", 1000, false);
	Fade("砂嵐", 1000, 300, null, true);

	Wait(1000);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
世界が赤くなり。

あらゆるものは錆び、朽ち果て、腐り落ち。

こずぴぃから強烈な腐臭が漂う。

そのこずぴぃが、ゆらりと立ち上がった。
全身が赤く染まっている。
それは血？　それとも錆？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeStand("st梢_制服_正面_血まみれ_sigh", 1000, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn05/01200090ko">
「殺してやる……」

こずぴぃが顔を上げた。
その顔は黒い靄に覆われていた。

すさまじい殺意。

僕の首を絞めようとするかのように、こずぴぃの細い手が伸びてきて。

まばたきしたら、こずぴぃはまたへたり込んでいた。
うなだれた表情はうかがい知れず。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn05/01200100ko">
「殺してやる……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume("SE02", 0, 1000, null);
	Fade("砂嵐", 0, 1000, null, true);
//	Fade("おど２", 0, 0, null, false);
	Fade("おど", 0, 0, null, true);
	DeleteStand("st梢_制服_正面_血まみれ_sigh", 0, true);
	FadeStand("bu梢_制服_正面_血まみれ_sigh", 0, true);
	Wait(300);
	SetVolume("SE02", 0, 300, null);
//	Fade("おど２", 0, 500, null, false);
	Fade("おど", 0, 500, null, true);
	Fade("砂嵐", 0, 300, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
ノイズが走り。
こずぴぃは僕の横に瞬時に移動していた。

黒い靄が僕の肩に触れる。
ぞっとするような冷たさ。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn05/01200110ko">
「みんな、殺してやるの……」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn05/01200120ko">
「拓巳しゃんも……鏡でズタズタに……」

感情のない、無機質なささやき。
だからこそ、普通よりも恐ろしくて。

まばたきをする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	SetVolume("SE02", 0, 1000, null);
	Fade("砂嵐", 0, 1000, null, true);
//	Fade("おど２", 0, 0, null, false);
	Fade("おど", 0, 0, null, true);
	DeleteStand("bu梢_制服_正面_血まみれ_sigh", 0, true);
	Wait(300);
	SetVolume("SE02", 0, 300, null);
//	Fade("おど２", 0, 500, null, false);
	Fade("おど", 0, 500, null, true);
	Fade("砂嵐", 0, 300, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603005]
ズタズタにされていたのは、セナだった。
こずぴぃは、しゃがみ込んでいるセナの頭に、ガラスの破片を勢いよく振り下ろす。

//ＳＥ//ナイフで刺される
{	MusicStart("SE360103", 0, 1000, 0, 1000, null, false);}
どす黒い血が、セナのキレイで長い黒髪を染めていく。

こずぴぃはもう一度、ガラスを振り上げ。

刺す。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


//ＳＥ//ナイフで刺される
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	SetVolume("SE02", 0, 1000, null);
	Fade("砂嵐", 0, 1000, null, true);
//	Fade("おど２", 0, 0, null, false);
	Fade("おど", 0, 0, null, true);


	Wait(500);

	SetVolume("SE02", 1000, 300, null);

//	Rotate("おど２", 100000, @0, @0, @2000, Dxl2,false);
//	Rotate("おど", 100000, @0, @0, @-1000, Dxl2,false);
//	Fade("おど２", 0, 500, null, false);
	Fade("おど", 0, 500, null, true);
	Fade("砂嵐", 200, 0, null, true);
	Delete("砂嵐");
	Delete("黒幕２");

	CreateSE("SE04","SE_擬音_肉を食む");
	CreateSE("SEおど２","SE_衝撃_衝撃音01");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
ノイズ。

こずぴぃがセナの代わりにへたり込んでいた。

セナは、それまで存在していなかった、ホームレスらしき男に馬乗りになっている。頭を男の肩あたりに埋めて。

//ＳＥ//生肉をむしゃむしゃと食べる音
{	MusicStart("SE04", 0, 1000, 0, 1000, null, false);}
その頭を、小刻みに動かしている。

なにをしているんだろう？
垂れた髪に隠れて、よく見えない。

するとゆっくりとセナは顔を上げた。
男の肩は血まみれだった。肉がミンチ状になっていて、ピンク色の筋肉がテラテラと光っているのが見えた。

いや……それは血？　筋肉？　赤錆？

//◆「父さん……おいしいよ」
//◆食べながら喋る
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn05/01200130sn">
「ほうふぁん……おいひいよ……」

振り返ったセナの口の周りが、血まみれで。
なにかを、もしゃもしゃと、咀嚼していた――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume("SE02", 300, 0, null);

//ＳＥ//衝撃音
//ＢＧ//崩壊渋谷神泉駅ホーム
	SetVolume360("CH*", 2000, 0, NULL);

	MusicStart("SEおど２", 0, 700, 0, 1000, null, false);

	CreateColor("White", 1000, 0, 0, 1280, 720, "White");
	Fade("White", 0, 0, null, true);
	Fade("White", 200, 1000, null, true);


	CreateTexture360("背景０", 100, 0, 0, "cg/bg/bg193_01_5_崩壊渋谷神泉駅ホーム_a.jpg");

	Delete("プロセス１");
	Delete("おど");
	Delete("おど２");
	Delete("砂嵐");
	Delete("下敷き");
	Delete("黒幕２");

	Wait(2000);

	CreateSE("SE3611","SE_はいけい_崩壊しぶ谷_神泉えきほーむ_LOOP");
	MusicStart("SE3611",2000,1000,0,1000,null,true);

	FadeDelete("White", 2000, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
足許がふらついて、倒れ込んだ拍子に、世界は元の色に戻っていた。
頭痛も消えている。

僕は額を押さえ、軽く頭を振った。
すごく、気分が悪い。吐き気がする。

激しいショックや、瞬間的な恐怖はないけど。
じわじわと、毒が全身に回ってくるような感じ。
心に重くのしかかってくる後味の悪さ。

顔を上げて、セナとこずぴぃを見た。
２人はやっぱりその場から動かず、へたり込んでいるだけ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buあやせ_制服_武器構え","normal", 250, @+100);
	FadeStand("buあやせ_制服_武器構え_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01200140ay">
「どうしたの？」

あやせが手を差し伸べてきた。
また、なにか言いたげな表情。

僕はその手を握って立ち上がった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE*", 2000, 0, null);

	ClearAll(2000);
	Wait(1000);
}



//おどろおどろしいfunction
function odoro()
{
	while(1)
	{
	Rotate("@おど２", 100000, @0, @0, @2000, null, false);
	Rotate("@おど", 100000, @0, @0, @-1500, null, true);
	}
}

