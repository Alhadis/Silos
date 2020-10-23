//<continuation number="920">

chapter main
{

	$PreGameName = "boot_梨深ルート";

	if($GameStart != 1)
	{
		$GameName = "chr_172_梨深編_偽りの日常";
		$GameContiune = 1;
		$梨深ルート=true;
		$RouteON=true;
		Reset();
	}

	chr_172_梨深編_偽りの日常();
}


function chr_172_梨深編_偽りの日常()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	Delete("背景*");
	Delete("色*");
	SetVolume360("CH*", 500, 0, true);
	SoundPlay("SE*",500,0,false);
	ClearAll(0);


//ＢＧ//黒
	CreateColor("黒幕", 2100, 0, 0, 1280, 720, "BLACK");
	Fade("黒幕", 0, 1000, null, true);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");
	Fade("背景１", 2000, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
梨深は――梨深って呼んでいいのかどうか分からないけど――ホントに完璧に記憶を失っていた。

あるいは、この梨深は元々記憶なんて持っていない、とも言えるかもしれない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("黒幕", 1000, 0, null, true);
	Delete("黒幕");

	BGMPlay360("CH04",0,1000,true);

	CreateSE("SE10","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE10", 2000, 500, 0, 1000, null, true);

	Stand("st梨深_制服_正面","normal", 250, @0);
	FadeStand("st梨深_制服_正面_normal", 500, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900010ri">
「あたしは、りみっていうの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900020ta">
「うん、そ、そうだよ……。咲畑梨深」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900030ri">
「さきはたりみ」

{	Stand("st梨深_制服_正面","smile", 250, @0);
	FadeStand("st梨深_制服_正面_smile", 300, true);
	DeleteStand("st梨深_制服_正面_normal", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900040ri">
「そうなんだ～」

その口振りは、まるで他人事だ。

{	Stand("st梨深_制服_正面","normal", 250, @0);
	FadeStand("st梨深_制服_正面_normal", 300, true);
	DeleteStand("st梨深_制服_正面_smile", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900050ri">
「あなたは？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900060ri">
「おなまえ、なんていうのかな？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900070ta">
「ぼ、僕は、西條拓巳……」

こんな基本的なことを一から教えなくちゃいけないなんて……。
この先のことを考えると、暗澹とした気分になる。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900080ri">
「にしじょうたくみ」

{	Stand("st梨深_制服_正面","smile", 250, @0);
	FadeStand("st梨深_制服_正面_smile", 300, true);
	DeleteStand("st梨深_制服_正面_normal", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900090ri">
「タク、だね！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900100ta">
「え……」

//◆嬉しそう
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900110ri">
「タク！」

同じだ……。その呼び方は、同じなんだね……。

{	Stand("st梨深_制服_正面","sad", 250, @0);
	FadeStand("st梨深_制服_正面_sad", 300, true);
	DeleteStand("st梨深_制服_正面_smile", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900120ri">
「ねえねえ、タク～。あのね、あたしね、手が、べとべとしてるの」

手には、乾いた血がべっとりとこびりついている。
赤黒く変色したそれは、こずぴぃの血だ――そのはずだ。
こずぴぃの死体は消えていたけど、血だけは残っている。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900130ri">
「べとべと、やだなぁ」

自分の手を見て、梨深はしょんぼりしている。
こずぴぃの笑顔を思い出し、僕はうずくような胸の痛みを覚えた。
それをこらえつつ、濡れタオルを用意した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	DeleteStand("st梨深_制服_正面_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900140ta">
「ほ、ほら、手、出して……」

僕の言葉に、梨深はおずおずと両手を差し出してきた。
タオルで、その血を拭っていく。

白かったタオルは、みるみる赤く染まる。
キレイに拭い取るには、少し強めに擦らなければならなかった。
指と指の間まで、ゴシゴシと擦っていると――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","smile", 250, @0);
	FadeStand("bu梨深_制服_正面_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900150ri">
「あはは。くすぐったい」

{	DeleteStand("bu梨深_制服_正面_smile", 500, true);}
梨深が楽しそうに笑う。
なんで自分の手に血がこびりついているのか、その理由についてはまったく気にならないらしい。

くそぅ、呑気なもんだよ……。

っていうか、手ぐらい自分で拭けよ。
どうして僕がこんな子供の世話みたいなこと、
しなくちゃいけないんだ……。

……なんて、そんなこと言えるはずはなかった。

梨深は、僕を守ろうとしてくれたんだ。
そのせいで、故意なのか事故なのか分からないけど、人を殺して。
そして、心が壊れてしまった。

だから、僕には、今の梨深を放り出すことなんてできない。
梨深がこうなったのは、僕のせいでもあるんだから。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900160ta">
「ほ、ほら、キレイに、なったよ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","smile", 250, @0);
	FadeStand("bu梨深_制服_正面_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900170ri">
「ありがとー」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900180ri">
「ぴかぴかだぁ、あたしの手」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900190ri">
「すっきりしたよっ」

僕の手を握って、指を絡めて。
無邪気に、ブンブンと上下に振る。

とても楽しそうで、まるで子供みたいで。
その笑顔を見て、僕はなぜか、とても切なくなった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900200ta">
「ねえ、梨深……。君は、ぼ、僕を、守ってくれる？」

{	Stand("bu梨深_制服_正面","normal", 250, @0);
	FadeStand("bu梨深_制服_正面_normal", 300, true);
	DeleteStand("bu梨深_制服_正面_smile", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900210ri">
「まもる？　なにを？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900220ta">
「僕を……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900230ri">
「あのね、あたしね、よくわかんない」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900240ri">
「でもね、タクはあたしのおともだちだから、あたしにしんせつにしてくれるよね」

{	Stand("bu梨深_制服_正面","smile", 250, @0);
	FadeStand("bu梨深_制服_正面_smile", 300, true);
	DeleteStand("bu梨深_制服_正面_normal", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900250ri">
「だからね、あたし、タクがいてくれてよかったよ。えへへ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	SetVolume("SE10", 1000, 200, null);

	CreateColor("黒幕", 2100, 0, 0, 1280, 720, "BLACK");
	Fade("黒幕", 0, 0, null, true);
	Fade("黒幕", 500, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
ダメだ。梨深は、もうダメだ。
僕を守ってくれる梨深は、もういないんだ……。

僕はうなだれた。
梨深はここにいるべきじゃない。
梨深の家って、どこにあるんだろう。

梨深の家族に連絡すべきかと思ったけど、彼女の持ち物からは連絡先を特定するものがなにも見つからなかった。

学校に行けば、教師が住所を知ってるんだろうけど、今日はもう遅いから入れないだろうし。

そもそもよく考えてみれば、僕は梨深についてあまりになにも知らない。
どこに住んでいるのか。家族は何人なのか。誕生日は？　血液型は？

僕は、なにも知らない……。
とにかく、僕じゃもうどうすることもできない……。

{	Stand("bu梨深_制服_正面","normal", 250, @0);
	FadeStand("bu梨深_制服_正面_normal", 0, true);
	DeleteStand("bu梨深_制服_正面_smile", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900260ri">
「タクー、タクー」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE10", 1000, 500, null);

	Fade("黒幕", 500, 0, null, true);
	Delete("黒幕");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
梨深が僕の服の袖を引っ張り、名前を呼んでくる。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900270ri">
「ねえねえ、タクー」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900280ri">
「あたしね、おなかぺこぺこー」

今は、何時だろう。
外はもう日が暮れている。夕食時だ。

でもあいにく、ここには買い置きなんてない。
なにか、買ってこないと。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900290ta">
「な、なにが、食べたい？」

//◆考え中
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900300ri">
「ん？　んー？」

記憶喪失の場合、食べ物のことも忘れちゃったりするのかな？
どんなメニューがこの世の中には存在するのか知らないとか、味も分からなくなってるとか。

{	Stand("bu梨深_制服_正面","smile", 250, @0);
	FadeStand("bu梨深_制服_正面_smile", 300, true);
	DeleteStand("bu梨深_制服_正面_normal", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900310ri">
「あ、そうだ！　あのね、あたし、おそばがたべたい！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900320ta">
「おそば……？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900330ri">
「おそば、すき！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900340ta">
「す、好き、なの……？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900350ri">
「すき！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900360ta">
「なんで？　た、食べたこと、あるの？」

{	Stand("bu梨深_制服_正面","sad", 250, @0);
	FadeStand("bu梨深_制服_正面_sad", 300, true);
	DeleteStand("bu梨深_制服_正面_smile", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900370ri">
「たべたこと？　んー、ないかも……」

{	Stand("bu梨深_制服_正面","normal", 250, @0);
	FadeStand("bu梨深_制服_正面_normal", 300, true);
	DeleteStand("bu梨深_制服_正面_sad", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900380ri">
「でもね、おそばは、すきだよ」

{	DeleteStand("bu梨深_制服_正面_normal", 500, true);}
どういうことだ？
記憶が戻り始めてる？
あるいは前の梨深の食べ物の好みだけを、覚えてる？

記憶が戻ってくれるなら、僕としても助かるんだけど……。
とりあえずスーパーにそばを買いに行こう。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900390ta">
「梨深、こ、ここで待ってて。ぜ、絶対、外に出ちゃダメだ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","normal", 250, @0);
	FadeStand("bu梨深_制服_正面_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900400ri">
「はーい」

{	Wait(500);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900410ta">
「……ビシィ」

試しに、僕は前の梨深がよくしていたポーズをやってみた。
片手を、敬礼するように頭に添える。

これで、梨深がなにかを思い出してくれるなら……。
そう思ったんだけど。

{	Stand("bu梨深_制服_正面","smile", 250, @0);
	FadeStand("bu梨深_制服_正面_smile", 300, true);
	DeleteStand("bu梨深_制服_正面_normal", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900420ri">
「びし？　なぁに？　かっこいいね！」

全然通じなかった。
むしろ興味津々という感じで目を輝かせている。
すごく恥ずかしくなって、僕は逃げるように部屋を出た。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu梨深_制服_正面_smile", 500, true);

	CreateColor("黒幕", 100, 0, 0, 1280, 720, "BLACK");
	Fade("黒幕", 0, 0, null, true);


	SetVolume("SE10", 2000, 0, null);

	CreateSE("SE01","SE_日常_扉_開ける");
	MusicStart("SE01",0,1000,0,1000,null,false);

	Fade("黒幕", 1000, 1000, null, true);


	Wait(1500);

	CreateSE("SE02","SE_日常_扉_閉まる");
	MusicStart("SE02",0,1000,0,1000,null,false);

	Wait(1000);

//ＢＧ//神泉町の町並み・夜
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg014_03_3_神泉町並み_a.jpg");
	DrawTransition("背景１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);

	CreateSE("SE10","SE_日常_雑踏02");
	MusicStart("SE10",2000,1000,0,1000,null,false);


	Wait(1000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
スーパーへの道すがら、近くに警察がいないかを確認してみる。

セナとこずぴぃの死体は、やっぱり消えていた。

もしも警察が近くにいるなら、目撃者がいた可能性がある。
いないなら……誰にも見つかっていないっていうこと。
もしそうなら、しばらくはバレないかもしれない。

もちろん警察だけじゃなく、『将軍』がどこかから現れないかと、常に物陰などを警戒した。

幸いにも、例の“神の視線”は、今のところ気配を感じない。
それでも、夜は外に出たくなかった。
闇が怖い。

そしてその闇の奥に、ぼうっと、こずぴぃやセナが死んだときの光景が浮かび上がってくる。２人の無残に変わり果てた姿が、浮かび上がってくる。

僕はすぐに目をそらし、自分の足許だけを見つめて、スーパーへ急いだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("黒幕", 100, 0, 0, 1280, 720, "BLACK");
	Fade("黒幕", 0, 0, null, true);


	SetVolume("SE10", 2000, 0, null);

	Fade("黒幕", 1000, 1000, null, true);

	Wait(2500);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg006_01_3_コンテナ外観_a.jpg");
	DrawTransition("背景１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);

	Delete("黒幕");

//ＢＧ//拓巳の部屋外観・夜



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
ベースに戻り、カセットコンロを引っ張り出してきて、外でそばを茹でる。

コンテナハウスの中だと、換気ができないし燃えやすそうなものがたくさん散らかってるしで、危ないんだ。

鍋に適当にそばを放り込む。
もちろんインスタントの乾麺だ。
梨深はそれを興味深そうに眺めていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_正面","normal", 250, @0);
	FadeStand("st梨深_制服_正面_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900430ri">
「おそばって、こうやってつくるんだねー」

{	DeleteStand("st梨深_制服_正面_normal", 300, true);}
こずぴぃの血溜まりは、まだそこにある。
もうほとんど乾いていて、夜ということもあって表面的には黒い染みにしか見えない。

その上に、部屋にたまっていた空きダンボールを、たたんで敷く。
こんなことしたって、なんの解決にもならないけど、なるべく目に入れたくなかったんだ。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900440ri">
「タクー、タクー！　こぼれそうだよー！」

梨深に呼ばれてコンロのところに戻った。

沸騰しすぎて、麺を入れたお湯が溢れそうになっている。
梨深はそれをただ「おおー」と言いながら見ているだけで、動こうとしない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900450ta">
「火を、け、消して」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","normal", 250, @0);
	FadeStand("bu梨深_制服_正面_normal", 300, true);

	CreateSE("SE01","SE_日常_照明消灯");
	CreateSE("SE02","SE_日常_照明消灯");
	CreateSE("SE360101","SE_日常_燃える_LOOP");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603005]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900460ri">
「ん？　んー？」

{	MusicStart("SE01",0,1000,0,1000,null,false);}
梨深は首を傾げながらも、コンロのスイッチをひねった。
――強くなる方へ。

{	SetVolume("SE360101",0,1000, null);
	Stand("bu梨深_制服_正面","smile", 250, @0);
	FadeStand("bu梨深_制服_正面_smile", 300, true);
	DeleteStand("bu梨深_制服_正面_normal", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900470ri">
「わー。あふれたよー。すごーい」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900480ta">
「いや、す、すごいじゃ、ないでしょ……！」

{	MusicStart("SE02",0,1000,0,1000,null,false);
	SetVolume("SE360101", 1000, 0, null);
	DeleteStand("bu梨深_制服_正面_smile", 300, true);}
慌てて梨深を押しのけて、火を消す。
お湯が大量に吹きこぼれてしまった。

まあいいや……。食べられさえすれば、そばの味とかコシとか、そんなものにそれほど気を回す必要はない。

というわけで鍋から麺を取り出して湯切りし、流しでさっと水洗い。
そうしろって、説明書きに書いてあったからで、別に手慣れてるわけじゃない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900490ta">
「ひ、冷やしと、あったかいのと、ど、どっちがいい？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","smile", 250, @0);
	FadeStand("bu梨深_制服_正面_smile", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604005]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900500ri">
「つめたいの！」

{	DeleteStand("bu梨深_制服_正面_smile", 300, true);}
どんぶりに麺を盛り、一緒に買ってきためんつゆをどばどばとかけた。
薬味はねぎのみ。適当に刻んで、できあがり。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("黒幕", 100, 0, 0, 1280, 720, "BLACK");
	Fade("黒幕", 0, 0, null, true);

	CreateSE("SE01","SE_日常_扉_開ける");
	MusicStart("SE01",0,1000,0,1000,null,false);

	Fade("黒幕", 1000, 1000, null, true);

	Wait(1500);

	CreateSE("SE02","SE_日常_扉_閉まる");
	MusicStart("SE02",0,1000,0,1000,null,false);

//ＢＧ//拓巳の部屋
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");
	DrawTransition("背景１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);

	Delete("黒幕");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
急いで梨深を連れて部屋の中に入った。
後片付けは、明日、明るくなってからやろう。

今は、できるだけ外にいたくなかった。
まだわずかに血の臭いが漂っていたし。

なんだか、オカルトチックだけど、怖かったんだ。
血まみれのセナとこずぴぃが、今にもゾンビみたいに歩いて現れそうな気がして。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_じん体_動作_尻餅");
	MusicStart("SE01",0,1000,0,1000,null,false);


	Stand("bu梨深_制服_正面","normal", 250, @0);
	FadeStand("bu梨深_制服_正面_normal", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900510ri">
「ねえタク。たべていい？　たべていい？」

梨深には、僕のような深刻な悩みはないらしい。

いや、だからこそ梨深は前の人格から新しい人格に変わったのかもしれない。人を殺したっていう現実をキレイさっぱり忘れるために。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900520ta">
「ど、どうぞ……」

{	Stand("bu梨深_制服_正面","smile", 250, @0);
	FadeStand("bu梨深_制服_正面_smile", 300, true);
	DeleteStand("bu梨深_制服_正面_normal", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900530ri">
「わーい。いただきまーす」

{	DeleteStand("bu梨深_制服_正面_smile", 500, true);}
梨深は箸を鷲づかみにした。
フォークのような使い方だ。
丼の縁に口を付けながら、そばをすすっている。

//※「ょぅι゛ょ」ＴＩＰＳ作成が必要
//おがみ：TIPS組み込み済み
{#TIPS_ょぅι゛ょ = true;$TIPS_on_ょぅι゛ょ = true;}
――どう見ても<FONT incolor="#88abda" outcolor="BLACK">ょぅι゛ょ</FONT>の食べ方です。本当にありがとうございました。

{$TIPS_on_ょぅι゛ょ = false;}
箸の持ち方すら忘れたらしい。
そばの作り方も、コンロの火の消し方も、忘れた。
その割に、“いただきます”と食事前に言うことは覚えていた。

物事に対するあらゆる認識が、退行化しているってことか。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900540ri">
「食べられないよー」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900550ta">
「え？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","sad", 250, @0);
	FadeStand("bu梨深_制服_正面_sad", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602006]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900560ri">
「食べられないー」

梨深は、上手に食べられなくてもどかしそうにしていた。
そりゃ、あんな食べ方じゃ当たり前だよ。

{	Stand("bu梨深_制服_正面","normal", 250, @0);
	FadeStand("bu梨深_制服_正面_normal", 300, true);
	DeleteStand("bu梨深_制服_正面_sad", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900570ri">
「食べさせて」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900580ta">
「なん……だと……？」

本気で言ってるの？
僕が、梨深に、食べさせるだって？

介護士にでもなった気分だ。
それとも父親か？
同い年の娘を持つなんて、勘弁してよ……。

{	Stand("bu梨深_制服_正面","sad", 250, @0);
	FadeStand("bu梨深_制服_正面_sad", 300, true);
	DeleteStand("bu梨深_制服_正面_normal", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900590ri">
「タクぅ」

甘えるようにねだってくるので、僕はため息をつき、仕方なく食べさせてあげることにした。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900600ta">
「ほ、ほら。あーんして」

{	Stand("bu梨深_制服_正面","smile", 250, @0);
	FadeStand("bu梨深_制服_正面_smile", 300, true);
	DeleteStand("bu梨深_制服_正面_sad", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900610ri">
「あーん」

{	DeleteStand("bu梨深_制服_正面_smile", 500, true);}
梨深は僕が差し出したそばを口に含み、おいしそうに咀嚼。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","smile", 250, @0);
	FadeStand("bu梨深_制服_正面_smile", 500, true);

	CreateSE("SE10","SE_日常_PC_はーどでぃすく_LOOP");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900620ri">
「えへへ。おいしいよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900630ta">
「そ、それは、よ、よかった……」

{	SetVolume360("CH04", 5000, 0, null);
	DeleteStand("bu梨深_制服_正面_smile", 500, true);}
ふと、思う。

{	MusicStart("SE10", 3000, 500, 0, 1000, null, true);}
三次元の女子との、こんな何気ない日常。
僕が求めていたのはきっと、こんな毎日なんだ。

エロゲみたいな、劇的なイベントとかは特に起きることもなくて。

ヒロインの抱える心の傷でうだうだしたり、互いに想い合っているのにすれ違ってしまったり、あまつさえ殺人事件に巻き込まれたりすることなく。

小説やゲームにしたら、面白くもなんともない、こういう日常を。
僕は、求めていた気がする。

その日常が、実際に今、こうして目の前にある。
しかも僕と一緒にいてくれるのは、梨深だ。

正直に言う。梨深は、かわいい。
僕のことを守ってくれるとも言ってくれた。
僕だって、できればずっと、梨深と一緒にいたい。

だけど、こんなのは偽りだ。

こんな日常は、決して長くは続かない。

そして、梨深は、梨深じゃない。

あまりにも儚い時間。

そう考えると、すごく切なくて。哀しくて。虚しくて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900640ta">
「戻ってきてよ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900650ta">
「梨深、元に、戻ってくれ……」

そうつぶやかずにはいられなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE10", 200, 1, null);

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg000_06_1_chnチャットサンプル_a.jpg");
	Fade("背景２", 0, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//ＶＦ//ＰＣのスピーカーからの音声
//【星来】
<voice name="星来" class="星来" src="voice/ch01/02100020se">
「メールだよ～、ぼけなす♪」

{	SetVolume("SE10", 2000, 300, null);
	Fade("背景２", 300, 0, null, true);}
ハッとした。
ＰＣからの、星来たんの声。
誰かから、メールが来た。

『将軍』か……？

予感がする。
これは、よくないメールだ。
見たくない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900660ta">
「ぼ、僕を、見るな……」

視線を感じる。
誰かに見られている。
いつもよりも確かな感覚がある。

周囲を見回す。
この部屋には、僕と梨深以外には、誰もいない。

僕の手が止まったので、梨深はやむなくそばを相手に悪戦苦闘中。
僕の方は見ていない。

となれば、見ているのは、あいつしかいない。
“その目だれの目？”って、問いかけるまでもない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	SetVolume("SE10", 1000, 500, null);

	Fade("背景２", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
僕はうめきつつ、ＰＣの前へ。
新着メールをチェックする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――


//イメージＢＧ//ＰＣ画面（メールソフト）
	CreateTextureEX("背景３", 100, 0, 0, "cg/bg/bg222_01_6_chnPC画面メール将軍_a.jpg");

	SetVolume("SE10", 200, 1, null);
	CreateSE("SE360101","SE_衝撃_衝撃音02");

	CreateSE("SE01","SE_日常_PC_マウスくりっく");
	MusicStart("SE01",0,1000,0,1000,null,false);
	Wait(1000);
	Fade("背景３", 0, 1000, null, true);

	MusicStart("SE360101",0,1000,0,1000,null,false);
	Wait(2000);

	SetVolume("SE10", 1000, 500, null);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602008]
１通だけ、来ていた。
送信者は――

『将軍』

//◆本物の将軍からのメールです
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900670ta">
「うぅ、くそぅ……くそぅ……！」

今度は、なにをするつもりだ？
今度こそ、フェイクじゃなくて、ホントに七海を誘拐するつもり？
それとも、いよいよ、僕を直接殺しに来るの？

恐怖に全身の毛が逆立つ。
うなじのチリチリとした感覚が、さらに強くなる。気持ち悪い。頭も少し痛い。

僕を見ないでよ……！

震える指でマウスを操作し、メールを開いた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Wait(300);

	CreateSE("SE01","SE_日常_PC_マウスくりっく");
	MusicStart("SE01",0,1000,0,1000,null,false);

	Wait(500);

//おがみ：BG：ダミー組み込み
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg222_02_6_chnPC画面メール将軍内容_a.jpg");
	Fade("背景１", 0, 1000, null, true);
	CreateTextureEX("下敷き", 40, 0, 0, "cg/bg/bg222_02_6_chnPC画面メール将軍内容_a.jpg");

	Delete("背景２");
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//イメージＢＧ//将軍からのメール（梨深編）
//送信者は『将軍』。件名は「目覚めて」。本文は無しで真っ白。送信時間は１１月６日（木）２１時２９分。
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900680ta">
「あ、れ……？」

なにも、書いてなかった。
タイトルに『目覚めて』とあるだけ。
本文は、真っ白だ。

目覚めて……って、どういう意味だ？
ギガロマニアックスとして目覚めろとか？　まさかね……。

初めて会ったときも、『将軍』は似たようなことを言っていた気がする。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900690ta">
「バ、バカに、して……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900700ta">
「ぼ、ぼぼ、僕を、怯えさせて、そ、そんなに、楽しいかっ」

苛つく。と同時に、胸の奥にわだかまっている恐怖を振り払いたくて。

//ＳＥ//キーボードに手の平を強く叩き付ける「ガシャン！」
//おがみ：SE：ダミー
{	Shake("背景１", 300, 0, 5, 0, 0, 500, null, false);
	CreateSE("SE01","SE_衝撃_せ中を押される");
	MusicStart("SE01",0,1000,0,1000,null,false);}
キーボードに強く手の平を叩きつけた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume("SE10", 1000, 0, null);

	Wait(500);

//おがみ：SE：ダミー
//ＳＥ//ＰＣスピーカーからのノイズ音
	CreateSE("SE360201","SE_き械_でん化製ひん_ラジオ_ぴンクのいず");
	MusicStart("SE360201",200,300,0,1000,null,true);

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
スピーカーが、ノイズを発した。
なにか変な操作でもしちゃったかな……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE360301","SE_き械_でん化製ひん_ラジオ_ぴンクのいず");
	MusicStart("SE360301",0,1000,0,1000,null,false);

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602009]
//ＳＥ//ＰＣスピーカーからのノイズ音
//ＶＦ//ＰＣのスピーカーからの音声
//◆「目覚めて。もう時間がない」と言っている
//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/01900710jn">
「……ざめ……じか……」

{	BGMPlay360("CH01",500,1000,true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900720ta">
「……っ！？」

なにか、聞こえた……。
ノイズに混じって、なにかが、聞こえたぞ……。

//ＳＥ//ＰＣスピーカーからのノイズ音
少し焦りながら、ＰＣを調べる。
ＭＰ３プレイヤーは作動してない。
ブラウザで動画サイトも開いてない。

『将軍』のメールにウイルスでも仕込んであったのかと思ったけど、ファイルらしきものはなにも添付されていない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE360301","SE_き械_でん化製ひん_ラジオ_ぴンクのいず");
	MusicStart("SE360301",0,1000,0,1000,null,false);

	Wait(1000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//ＳＥ//ＰＣスピーカーからのノイズ音
//ＶＦ//ＰＣのスピーカーからの音声
//◆「時間がないんだ」と言っている
//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/01900730jn">
「……ん……だ……」

まただ、また聞こえた。
息苦しい。額から汗がにじみ出てくる。

そ、そうだ、音声を切れ。
ＰＣの音声を、ミュートにしてやれば、こんな紛らわしいノイズ、すぐに聞こえなくなる。

{	CreateSE("SE360301","SE_き械_でん化製ひん_ラジオ_ぴンクのいず");
	MusicStart("SE360301",0,1000,0,1000,null,false);}
//ＳＥ//ＰＣスピーカーからのノイズ音
マウスで、画面右下のサウンド設定をクリック。
表示されたボリュームコントロール設定画面の、全ミュートの項をチェック。

{	SetVolume("SE*", 1500, 0, null);}
//ＳＥ//ノイズは聞こえなくなる
これで、なにも聞こえない。
声と聞き間違えるような、そんなノイズも耳にしなくて済む。

僕は、疲れてるんだ。動揺してるんだ。そりゃ動揺もするよ。つい数時間前に、知り合いが２人、目の前で死んだんだ……。

あやせのお見舞いに行った病院で、変なものも見たし。
七海からも妙な電話があったし。

だから、さっきのノイズは、単なる聞き間違いだ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	CreateSE("SE01","SE_じん体_心臓_鼓動");
	CreateSE("SE02","SE_じん体_心臓_鼓動");

	CreateSE("SE360301","SE_き械_でん化製ひん_ラジオ_ぴンクのいず");
	MusicStart("SE360301",1000,1000,0,1000,null,true);

	Wait(1000);

	SetVolume("SE360301", 500, 1, null);

	SetVolume360("CH01", 1000, 100, null);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
//ＶＦ//ＰＣのスピーカーからの音声
//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/01900740jn">
「……目覚めて」

//ＳＥ//心臓の音
{	MusicStart("SE01",0,1000,0,1000,null,false);}
声が――

//ＶＦ//ＰＣのスピーカーからの音声
//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/01900750jn">
「時間がないんだ」

{	MusicStart("SE02",0,1000,0,1000,null,false);}
スピーカーから――

//ＶＦ//ＰＣのスピーカーからの音声
//◆途中でノイズで聞こえなくなる
//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/01900760jn">
「もうすぐ、サードメルトが起き――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


//ＳＥ//ＰＣスピーカーからのノイズ音
	SetVolume("SE360301", 2000, 300, null);
	SetVolume360("CH01", 2000, 1000, null);


	CreateColor("移動フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("移動フラッシュ", 0, 0, null, true);
	Request("移動フラッシュ", AddRender);
	CreateSE("SE01","SE_衝撃_衝撃音02");

	Fade("移動フラッシュ", 100, 1000, null, true);
	CreateTexture360("背景３", 100, 0, 0, "cg/ev/ev052_02_3_将軍車椅子_a.jpg");
	Fade("背景３", 0, 0, null, true);
	Fade("背景３", 0, 1000, null, true);

	SoundPlay("SE01", 0, 1000, false);
	Fade("移動フラッシュ", 500, 0, null, true);

	Wait(1000);

	Fade("移動フラッシュ", 100, 1000, null, true);
	CreateTextureEX("背景２", 80, 0, 0, "cg/bg/bg026_02_3_拓巳部屋_a.jpg");
	Fade("背景２", 0, 1000, null, true);
	CreateTexture360("下敷き", 50, 0, 0, "cg/bg/bg026_02_3_拓巳部屋_a.jpg");
	Delete("背景３");
	Fade("移動フラッシュ", 500, 0, null, true);
	Delete("移動フラッシュ");

	Wait(1000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900770ta">
「あ……あ……」

はっきりと、聞こえた。
あいつだ……。『将軍』の声だ……。
スクランブル交差点で僕に話しかけてきた声と、同じだ……！

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900780ta">
「な、な、なんでだよ！？　ミュートに、し、したはずだろ！？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("背景１", 500, 0, null, true);
	Delete("背景１");

	Stand("bu梨深_制服_正面","normal", 250, @0);
	FadeStand("bu梨深_制服_正面_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900790ri">
「タク、さーどめるとって、なぁに？」

梨深は相変わらず無垢な表情で、首を傾げている。
僕はその梨深に詰め寄った。
両肩をつかんで、揺さぶる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900800ta">
「り、梨深、頼むよ……しっかりしてよ……！」

{	Stand("bu梨深_制服_正面","sad", 250, @0);
	FadeStand("bu梨深_制服_正面_sad", 300, true);
	Shake("bu梨深_制服_正面*", 300, 5, 0, 0, 0, 500, null, false);
	DeleteStand("bu梨深_制服_正面_normal", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900810ri">
「いた、いたいよぅ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900820ta">
「言ってくれ、ぼ、僕を守るって、言ってくれよ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900830ta">
「ぼ、僕は、ひ、１人じゃ、耐えられない……このままじゃ、こ、殺される……！」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900840ri">
「あうぅ、いたく、しないで……っ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900850ta">
「ぼ、僕は、き、君を、責めないから……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900860ta">
「き、君がいてくれないと、こ、困るんだ……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900870ta">
「だから……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01900880ri">
「いたいの、やだ……」

{	DeleteStand("bu梨深_制服_正面_sad", 500, true);}
梨深の瞳から、涙がこぼれた。
僕は梨深を怯えさせている。
彼女の肩が、小刻みに震えている。

{	SetVolume("SE360301", 2000, 0, null);}
僕はゆっくりと手を離した。

//◆泣く
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900890ta">
「頼むよ……」

//◆泣く
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900900ta">
「目を、覚まし――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 1000, 0, null);

	Wait(500);

	CreateSE("SE01","SE_自然_じ鳴り_ふぇーどいん_LOOP");
	MusicStart("SE01", 500, 1000, 0, 1000, null, false);

	CreateSE("SE02","SE_自然_じ鳴り_LOOP");
	MusicStart("SE02", 500, 1000, 0, 1000, null, true);

	CreateTextureEX("shake01", 100, 0, 0, "cg/bg/bg026_02_3_拓巳部屋_a.jpg");
	Request("shake01", Smoothing);
	SetAlias("shake01", "shake01");
	Fade("shake01", 0, 1000, null, true);

	CreateProcess("プロセス１", 1000, 0, 0, "Shaker");
	Request("プロセス１", Start);

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602011]
//ＳＥ//地響き
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900910ta">
「……え！？」

床が激しく揺れ始めた。
地震……！？
この前より大きい……！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//共鳴音
	CreateSE("SE03","SE_擬音_共鳴音_女性悲鳴のよう");

	CreateColor("攻撃フラッシュ", 2100, 0, 0, 1280, 720, "RED");
	Fade("攻撃フラッシュ", 0, 0, null, true);
	Request("攻撃フラッシュ", AddRender);
	Fade("攻撃フラッシュ", 0, 900, null, true);
	Fade("攻撃フラッシュ", 1500, 0, null, false);

	MusicStart("SE03", 500, 1000, 0, 1000, null, false);

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603011]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01900920ta">
「……ぐぁぁぁっ」

激しい耳鳴り。
頭が割れるほどの、甲高い共鳴音。

耳に何千本もの細い針を突き刺されているようで。
脳を、ミキサーでぐちゃぐちゃにかき回されているかのようで。

そして――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume("SE*", 500, 0, NULL);

//ＳＥ//衝撃音
//ＢＧ//白
//ＳＥ//爆発音

	CreateSE("SE04","SE_衝撃_爆発音");
	CreateSE("SE05","SE_衝撃_爆発音");
	CreateSE("SE360104","SE_衝撃_道路陥ぼつ");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	MusicStart("SE360104", 0, 1000, 0, 1000, null, false);
	CreateColor("white", 100, 0, 0, 1280, 720, "White");
	Fade("white", 0, 0, null, false);
	Fade("white", 500, 1000, null, true);

	Wait(2000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604011]
すさまじい衝撃とともに、視界が白く染まった――


</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	SetVolume("SE*", 2000, 0, null);
	SetVolume360("CH*", 2000, 0, null);

//～～Ｆ・Ｏ

//少し間を置く
	ClearAll(2000);
	Wait(2000);



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
