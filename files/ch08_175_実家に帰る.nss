//<continuation number="480">




chapter main
{

	$PreGameName = "boot_第八章";

	if($GameStart != 1)
	{
		$GameName = "ch08_175_実家に帰る";
		$GameContiune = 1;
		Reset();
	}

		ch08_175_実家に帰る();
}


function ch08_175_実家に帰る()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	Delete("背景*");
	Delete("色*");
	BGMPlay360("CH*", 500, 0, true);
	SoundPlay("SE*",0,0,false);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg055_01_2_下北沢街並み_a.jpg");
	Fade("背景１", 2000, 1000, null, true);

	Wait(1000);
	CreateSE("SE01","SE_日常_雑踏01");
	MusicStart("SE01", 2000, 1000, 0, 1000, null, true);


//アイキャッチ
//※拓巳視点に戻る

//ＢＧ//下北沢の街並み//夕方

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
セナは結局あの後、目を血走らせてこずぴぃになにかを問い詰め、やがてひとりで足早に去っていった。

こずぴぃが追いかけていったけど、セナがどうして急に取り憑かれたような態度になったのか、僕には分からないままだった。

そして今、僕はトボトボと下北沢の街を歩いている。

もうちょっと歩けば、僕の実家がある。
ベースからは歩いて３０分もかからない。
七海は実家にいるだろうか……。

下北沢は、渋谷ほどじゃないけど道を歩いている人の数が多い。

例のエスパー騒動の影響はまだ色濃く残っていて、僕を見かけてバカにしたような笑みを浮かべたり、ケータイで写真を撮ってくるヤツまでいる。

恥ずかしさと屈辱感に打ちのめされながらも、僕は家への道を急いだ。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500010ri">
「ごめんね……」

僕の少し後ろを歩いている梨深が、目を伏せたままそうつぶやいた。
ここまで歩いてくる間に、すでに梨深は１０回以上その言葉を繰り返している。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500020ri">
「黙っててごめん」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17500030ta">
「…………」

謝られても、答えようがなかった。

僕は、梨深のことが分からない。

出会ったときからそうだった。

梨深は僕を支えてくれたけど。
僕と一緒にいてくれたけど。

でもやっぱり、分からないことだらけだった。

僕はずっと、それをうやむやのまま放置してきた。

はっきりさせてしまったら、梨深と一緒にいられなくなるような予感がしていたからかもしれない。

それが、怖かったんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17500040ta">
「ど、どうして……僕と、一緒に、いてくれるの……？」

勇気を出して、それだけ聞いた。

梨深が僕みたいなヤツと一緒にいてくれる理由。

それはやっぱり、優愛のときみたいに、僕を陥れようとしているから？

だけど、返ってきた答えはそんなものじゃなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_正面","sad", 250, @150);
	FadeStand("st梨深_制服_正面_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500050ri">
「あなたに……目覚めてほしくないの」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500060ri">
「普通の生活を、送ってほしかった」

目覚めてほしくないって……
ギガロマニアックスとして、っていうこと？

梨深は、僕以上に僕のことを知っている。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17500070ta">
「い、いったい、君は……な、何者なの？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500080ri">
「あたしは……」

梨深は少し躊躇してから、

{	Stand("st梨深_制服_正面","normal", 250, @150);
	FadeStand("st梨深_制服_正面_normal", 200, false);
	DeleteStand("st梨深_制服_正面_sad", 200, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500090ri">
「あたしは、タクの友達だって思ってる」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500100ri">
「友達で、いたいな」

それってつまり、
これ以上は聞くなっていうことか……。

だけど、聞かずにはいられない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17500110ta">
「僕はギガロマニアックスなの？」

{	Stand("st梨深_制服_正面","sad", 250, @150);
	FadeStand("st梨深_制服_正面_sad", 200, false);
	DeleteStand("st梨深_制服_正面_normal", 200, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500120ri">
「…………そうとも言えるし」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500130ri">
「違うとも言える」

どっちなんだ……。
はぐらかすつもり？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17500140ta">
「き、君は、Ｉｒ２のこと、し、知ってたの？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500150ri">
「…………聞いたことがあるだけ」

誰から聞いたのかは、言わなかった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17500160ta">
「セナが、い、言ってたのは、ホント、なの……？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500170ri">
「…………ウソだよ」

ウソだ。
ウソだというその答えがウソだ。
梨深の態度を見ていれば分かる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17500180ta">
「君は……」

なおも問いかけようとして、僕は口をつぐんだ。

梨深は僕の敵なのか、味方なのか。

それを聞けば、答え次第で梨深と一緒にはいられなくなる。だから、聞けない。

なにもなかったことにすれば、騙されたままでこの先も今まで通りに過ごすことができる。その方が楽だし、幸せなのかもしれない。

そうしよう。
僕はバカなフリをして、梨深に騙され続けよう。

少なくとも梨深は、僕のことを何度も助けてくれたんだから、今後も危害を加えられることはない。

梨深の言う通り、普通の生活を送れれば、僕はそれでいいんだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17500190ta">
「あ、ありが、とう……」

梨深から目をそらして、僕は質問の代わりにその言葉を口にした。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17500200ta">
「ま、守って、くれて……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500210ri">
「タク……」

{	DeleteStand("st梨深_制服_正面_sad", 200, false);}
それ以上はなにを言えばいいか思い浮かばなくて、僕は黙って実家への道を歩き続けた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE01", 2000, 500, true);
	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg056_01_2_下北沢住宅街_a.jpg");
	DrawTransition("背景２", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
やがて、見覚えのある路地が見えてくる。
閑静でせせこましい住宅街。
たまに遠くから、電車が走る音がかすかに聞こえてくる。

子供の頃から見知った光景。
生まれ育った場所。
この道を通って、小学校にも、中学校にも通った。

目の前にある細い路地を入れば、家まではすぐだ。

七海と顔を合わせることは怖い。
だけど、確かめずにはいられない。
七海の腕が、ちゃんとあるのかどうか。

一度立ち止まって深呼吸して気持ちを落ち着かせ、足を踏み出そうとして。

{	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 1000, null, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500220ri">
「待って」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","sad", 250, @0);
	FadeStand("bu梨深_制服_正面_sad", 0, true);

	Fade("色１", 2000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
振り返ってみると、梨深が泣きそうな顔で僕を見ていた。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500230ri">
「どうしても、行くの？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500240ri">
「ねえ、行かないで」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500250ri">
「もう、普通じゃいられなくなるよ？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500260ri">
「あたし、そんなのやだな」

それって、どういう……

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500270ri">
「帰ろう？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500280ri">
「あのコンテナハウスに、帰ろう？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500290ri">
「あたし、タクが望む限りずっと一緒にいるから」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500300ri">
「それで、一緒に学校に行って、大ちんと３人で他愛もない話をして、帰りに立ち食いそば屋さんとか、ＣＤショップとかに寄って」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500310ri">
「そうやって、これからもやっていこうよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17500320ta">
「ぼ、僕は……七海に、会わなくちゃ……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500330ri">
「いないよ、きっと」

どうして分かるんだ。
また、ウソをついてるの？
僕が実家に行ったらまずい理由があるの？

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500340ri">
「あたし、タクの悲しむ顔、見たくない……」

そうやって……

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17500350ta">
「もう……謎かけみたいなことはやめてよ……」

たくさんだ。

僕に、永遠に分からないままでいろって言うの？

バカなフリなんて、やっぱり無理だよ。

みんながみんな、僕に謎を突きつけてくる。

僕は無知でいたかったのに。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17500360ta">
「実家に行っちゃいけない理由があるなら、い、言ってよ……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17500370ta">
「こ、こんな中途半端なの、うんざり、なんだ……！」

――うんざり？

これまで、すべてにおいて中途半端を選んできたのは、僕自身じゃないか。

すべてから逃げてきたのは、僕自身の意志じゃないか。

そうだ。だからこれからも、そうすべきなんだ。

帰ろう。梨深の言う通りだ。
七海に会う必要なんてない。

右手があるかないか確かめて、もしなかったらどうするつもりだ。

それはつまり僕のせいっていうことになっちゃうじゃないか。

七海に憎まれる。恨まれる。

僕は妹を救えなかった情けない男。その事実が確定してしまう。

今の、曖昧なままの状態にしておけば、罪悪感に囚われることもない。

そうしよう。それが最善の選択だ。

なにも見るな。

謎をどれだけ突きつけられたって、無視しろ。

世界から、引きこもれ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 1000, null, true);
	CreateColor("色２", 600, 0, 0, 1280, 720, "Black");
	Fade("色２", 0, 500, null, true);
	Stand("bu七海_制服_通常","pride", 550, @0);
	FadeStand("bu七海_制服_通常_pride", 200, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//ＶＦ//回想セリフ
//【七海】
<voice name="七海" class="七海" src="voice/ch08/17500380na">
「ホント、世話が焼けるなあ」

{	Stand("bu七海_制服_通常","smile", 550, @0);
	FadeStand("bu七海_制服_通常_smile", 300, true);
	DeleteStand("bu七海_制服_通常_pride", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch08/17500390na">
「ナナがいないとなーんにもできないんだから」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	DeleteStand("bu七海_制服_通常_smile", 0, true);
	Fade("色２", 0, 0, null, true);
	Fade("色１", 3000, 0, null, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602006]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17500400ta">
「ダメだ……」

七海の明るい声が、頭の中に思い出された。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17500410ta">
「ダメだよ……」

ここで逃げたら僕は。

一生、七海と顔を合わせられなくなる。
一生、実家に帰ることができなくなる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//◆戸惑い
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500420ri">
「タク……？」

{	DeleteStand("bu梨深_制服_正面_sad", 500, true);}
僕はぐっと拳を握りしめて。
実家へ続く細い路地へと足を踏み入れる。
そこから家まで５０メートルもない。

最初は早足で。
{	CreateSE("SE03","SE_じん体_動作_足_走る_LOOP");
	SoundPlay("SE03", 0, 1000, true);}
途中からは走って。
{	Wait(1000);}
僕が生まれ育った家を目指す。

あと３０メートル……

２０メートル……

１０メートル……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 1000, 1000, null, true);
	SoundPlay("SE03", 200, 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
０メートル……

{	Wait(1000);}
//◆息を呑む
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17500430ta">
「…………」

そこに、見知った家が、

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SoundPlay("SE01", 1000, 0, false);
	Wait(1000);
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg057_01_2_下北沢拓巳の家_a.jpg");
	Fade("背景１", 0, 1000, null, true);
	Fade("色１", 2000, 0, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602007]
――なかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH01", 2000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17500440ta">
「あ……れ……？」

表札の名前が違っていた。
『西條』じゃなかった。

そもそも、家の形が違う。
僕の住んでいた家よりずっとキレイで新しい。

周囲を見回す。
一軒隣と間違えたのかと思った。

でも違った。

そもそも――

周囲の景色が、記憶の中のそれと一致しない。

道に迷ったのか、入ってくる路地を一本間違えたのかって考え直したけど、そんなはずはなかった。

ここまでの道順には見覚えがあったんだ。
道だけは覚えているんだ。

なのに、家はない。

記憶の通りの道を歩いてきたら、記憶通りの景色は現れず、見ず知らずの光景がそこにあった。

――未視感。

慣れ親しんでいた場所なのに、まるで初めて来たような感覚。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17500450ta">
「ジャメヴュだ……」

{	Wait(500);
	BGMPlay360("CH*", 500, 0, false);}
//◆悲しそう
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500460ri">
「違うよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_正面","sad", 250, @150);
	FadeStand("st梨深_制服_正面_sad", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
梨深が、すぐ後ろに立っていた。
僕の言葉を、即座に否定する。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_じん体_心臓_鼓動");
	SoundPlay("SE03", 0, 1000, false);
	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 200, 1000, null, true);
	CreateColor("回想明度", 1000, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);
	CreateTexture360("背景２", 500, 0, 0, "cg/ev/ev057_01_1_拓巳子供時代_a.jpg");
	Fade("回想フラッシュ", 500, 0, null, true);

	Wait(800);

	Fade("回想フラッシュ", 200, 1000, null, true);
	Delete("背景２", 0, true);
	Delete("回想明度");
	Fade("回想フラッシュ", 500, 0, null, true);
	Delete("回想フラッシュ");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602008]
//◆悲しそう
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500470ri">
「この世界に――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_じん体_心臓_鼓動");
	SoundPlay("SE03", 0, 1000, false);
	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 200, 1000, null, true);
	CreateColor("回想明度", 1000, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);
	CreateTexture360("背景２", 500, 0, 0, "cg/ev/ev801_01_1_七海来訪_a.jpg");
	Fade("回想フラッシュ", 500, 0, null, true);

	Wait(800);

	Fade("回想フラッシュ", 200, 1000, null, true);
	Delete("背景２", 0, true);
	Delete("回想明度");
	Fade("回想フラッシュ", 500, 0, null, true);
	Delete("回想フラッシュ");
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603008]
//◆悲しそう
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17500480ri">
「タクの帰る場所はないの」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	BGMPlay360("CH*", 1500, 0, false);
	SoundPlay("SE*",1500,0,false);

	Wait(1500);

}