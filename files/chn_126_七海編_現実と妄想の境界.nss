

chapter main
{

	$PreGameName = "boot_七海ルート";

	if($GameStart != 1)
	{
		$GameName = "chn_126_七海編_現実と妄想の境界";
		$GameContiune = 1;
		$七海ルート=true;
		$RouteON=true;
		Reset();
	}

	chn_126_七海編_現実と妄想の境界();
}


function chn_126_七海編_現実と妄想の境界()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★七海編


//画面エフェクト//以下、妄想エフェクトなし
//ＢＧ//拓巳の部屋
//以下、七海の立ち絵は部屋着です
	BGMPlay360("CH*", 500, 0, true);
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 1000, null, true);

	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");

	CreateSE("SE36001","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE36001",2000,500,0,1000,null,true);

	FadeDelete("Black", 1000, true);

	Wait(1000);

	Stand("st七海_トレーナー_拗ね","sad", 200, @+100);
	FadeStand("st七海_トレーナー_拗ね_sad", 500, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300130na">
「…………」

なるべくキレイな、自分の服を選んで、七海に着せようと思ったけど、なかなかいいものが見つからなかった。そもそも外に出かけるとき用の私服なんてそんなに持ってない。

やむなく、保存用に取っておいた新品のブラチュートレーナーを着させた。

それから、インスタントのコーヒーを入れた。

普段、僕はコーヒーなんか飲まない。でもずっと前に、七海が親からの差し入れだと言って持ってきた物の中に、コーヒーもあったことを思い出したんだ。

賞味期限は切れてないから、大丈夫のはず……。

七海はソファでおとなしく座っていた。

まだ顔色は悪いけど、服を着て少し落ち着いたのか、身体の震えは治まったみたいだ。

コーヒーを入れたカップを無言のまま手渡すと、それを素直に受け取る。

{	Stand("st七海_トレーナー_拗ね","angry", 200, @+100);
	FadeStand("st七海_トレーナー_拗ね_angry", 300, true);
	DeleteStand("st七海_トレーナー_拗ね_sad", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300140na">
「ありがと……」

{	DeleteStand("st七海_トレーナー_拗ね_angry", 500, true);}
カップを両手で包み込むようにして、黒い液体の表面をじーっと見つめている。

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300150na">
「ブラックだね……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00300160ta">
「さ、砂糖とか、ミルクとか、そ、そんな、気の利いたものは、ここには、ないんだ……」

僕の説明に納得したらしく、七海は口をすぼめてコーヒーに息を吹きかける。

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300170na">
「ふー、ふー……」

それから、ゆっくりと、カップに口を付けた。

{	Stand("bu七海_トレーナー_拗ね","pinch", 200, @+100);
	FadeStand("bu七海_トレーナー_拗ね_pinch", 300, true);}
//◆熱い
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300180na">
「あつっ。うぅ……」

こいつって猫舌だったっけ？
うーん、どうだったかよく思い出せない。そもそもそんなこと、これまでまったく気にしたことがないんだからしょうがない。

七海は一生懸命、コーヒーを飲んでいる。
身体が温まってきたらしく、頬がほんのりと桜色に染まり出した。

{	Stand("bu七海_トレーナー_拗ね","angry", 200, @+100);
	FadeStand("bu七海_トレーナー_拗ね_angry", 300, true);
	DeleteStand("bu七海_トレーナー_拗ね_pinch", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300190na">
「おにぃ……。このコーヒー、熱いよぅ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00300200ta">
「じゃ、じゃあ、飲むな……」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300210na">
「……飲むけど」

{	DeleteStand("bu七海_トレーナー_拗ね_angry", 500, true);}
文句言うか素直になるか、どっちかにしろよな……。
でも、文句を言える程度には気力も回復したっていうことかな。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateTexture360("上敷き", 10000, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");

//画面エフェクト//以下、妄想エフェクト有り
//	CreateColor("Black", 4000, 0, 0, 1280, 720, "Black");
//	Fade("Black", 0, 0, null, true);
//	Fade("Black", 500, 1000, null, true);
	CreateEffect("レンズ１", 3000, -200, -400, 1600, 1600, "Lens");
	SetAlias("レンズ１", "レンズ１");
	CreateProcess("レンズプロセス１", 1000, 0, 0, "LensMove");
	Request("レンズプロセス１", Start);

	FadeDelete("上敷き", 2000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00300220ta">
「な、なあ……、いったい、なにがあったの……？」

思い切って、聞いてみた。

あの血が付いたケータイを見たとき、てっきり、七海は『将軍』に連れ去られたと思った。

でも全然そんなことはなくて、僕はＯ－ＦＲＯＮＴに行くこともなく、今、こうして七海と一緒にいる。

ただ、どうして七海が全裸だったのか、そうなった状況がさっぱり分からない。
体温が異常に低かったのも、謎だ。

僕の質問に、七海はカップの中を見つめたままだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE36001", 2000, 0, null);


	BGMPlay360("CH04",0,1000,true);

	Stand("bu七海_トレーナー_拗ね","sad", 200, @+100);
	FadeStand("bu七海_トレーナー_拗ね_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300230na">
「分かんない……」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300240na">
「自分でも、なんで、おにぃの部屋の前にいたのか、よく思い出せないの……」

これって、記憶喪失……？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00300250ta">
「し、シワだらけの、子供に、会わなかった……？　車イスに乗ってる、怪しいヤツなんだけど……」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300260na">
「ううん……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00300270ta">
「ケ、ケータイ、なくした……よな？」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300280na">
「なくしたのかな……？　そもそも、ナナの服、どこに置いてきちゃったんだろ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00300290ta">
「だ、誰かに、ひどいこと、されなかったか？」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300300na">
「ひどいことって……？」

だ、だからそれは……ええと、エロゲ的に言うと、陵辱とか……。

聞けるわけないよな……。

少なくとも七海の身体にはどこにも傷らしいものが見当たらないから、その可能性も低そうだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//画面エフェクト//以下、妄想エフェクトなし
	FadeDelete("レンズ１", 1000, true);

	Stand("bu七海_トレーナー_通常","shock", 200, @+100);
	DeleteStand("bu七海_トレーナー_拗ね_sad", 500, true);
	FadeStand("bu七海_トレーナー_通常_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300310na">
「あ……」

なにかを思い出したかのように、七海は顔を上げた。

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300320na">
「バングル……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00300330ta">
「は？」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300340na">
「おにぃにもらったバングル……なくしちゃった……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00300350ta">
「そ、そりゃ、服も持ち物もないんだから、バングルも、ないだろ、常識的に考えて……」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300360na">
「う、うん、そうなんだけど……」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300370na">
「なんでだろ、バングルだけは、なくしちゃったこと、思い出して……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00300380ta">
「どこでなくしたの？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu七海_トレーナー_拗ね","sad", 200, @+100);
	DeleteStand("bu七海_トレーナー_通常_shock", 300, true);
	FadeStand("bu七海_トレーナー_拗ね_sad", 300,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300390na">
「それは……分かんないけど……」

{	DeleteStand("bu七海_トレーナー_拗ね_sad", 500, true);}
七海はしょんぼりしている。
ダメだ、埒があかないぞ。
今、話を聞いたところで、なにも分かりそうにない。

病院に連れていくべきかな？
その前に、まず親に連絡した方がいいかもしれない。
で、迎えに来てもらって……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("上敷き", 10000, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");

//▼べー：効果：レンズ導入部がフェードで入れ替わりませんので、黒フラッシュを仮で入れます。
//画面エフェクト//以下、妄想エフェクト有り
//	CreateColor("Black", 4000, 0, 0, 1280, 720, "Black");
//	Fade("Black", 0, 0, null, true);
//	Fade("Black", 500, 1000, null, true);
	
	CreateEffect("レンズ１", 3000, -200, -400, 1600, 1600, "Lens");
	SetAlias("レンズ１", "レンズ１");
	CreateProcess("レンズプロセス１", 1000, 0, 0, "LensMove");
	Request("レンズプロセス１", Start);

	FadeDelete("上敷き", 1000, true);

	Stand("st七海_トレーナー_拗ね","angry", 200, @+100);
	FadeStand("st七海_トレーナー_拗ね_angry", 300, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300400na">
「ねえ、おにぃ……」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300410na">
「今日……ここに泊まっちゃ、ダメ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00300420ta">
「え、な、なんでだよ……」

{	Stand("st七海_トレーナー_拗ね","cry", 200, @+100);
	FadeStand("st七海_トレーナー_拗ね_cry", 300, true);
	DeleteStand("st七海_トレーナー_拗ね_angry", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300430na">
「なんだか、ナナ、混乱してて……、ワケ、分かんなくて……」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300440na">
「あんまり、動きたくないよ……」

まあ、普段のウザさは影を潜めてるし、一晩ぐらいなら、泊まるのは全然問題ないけど……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00300450ta">
「お、親には、連絡、しとけよ……」

例のダンボールは、部屋の隅に転がっていた。
その中から、血の付いたケータイを拾い上げる。
濡れティッシュで丁寧に血を拭ってから、七海に手渡した。

{	Stand("st七海_トレーナー_拗ね","sad", 200, @+100);
	FadeStand("st七海_トレーナー_拗ね_sad", 300, true);
	DeleteStand("st七海_トレーナー_拗ね_cry", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300460na">
「ナナの……ケータイだ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00300470ta">
「これ、送ってきたのって、七海なの？」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300480na">
「……？」

首を傾げている。
聞いた僕がバカだった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00300490ta">
「お、親に連絡したら、シャワー、浴びてこいよ……」

//◆温めた＝あっためた
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00300500ta">
「身体、温めた方が、いいと思うし……」

シャワーは外にある。

プレハブみたいなシャワールームが、コンテナの横にデンと置いてあるだけなんだけど、一応、排水とかは無理矢理設置してもらったから、じゅうぶん使える代物だ。

湯船はないから、ゆっくり風呂に入りたいときは銭湯に行くけど、僕も普段はほとんどシャワーだけで済ませている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//画面エフェクト//以下、妄想エフェクトなし
	FadeDelete("レンズ１", 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300510na">
「……うん。浴びてくる」

{	Stand("st七海_トレーナー_拗ね","angry", 200, @+100);
	FadeStand("st七海_トレーナー_拗ね_angry", 300, true);
	DeleteStand("st七海_トレーナー_拗ね_sad", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300520na">
「ね、ねえ、一緒に……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00300530ta">
「は！？」

この妹はなにをトチ狂ったことを言い出しているんだ！？
僕が仰天しているのを見て、七海は苦笑した。

{	Stand("st七海_トレーナー_通常","shy", 200, @+100);
	DeleteStand("st七海_トレーナー_拗ね_angry", 300, true);
	FadeStand("st七海_トレーナー_通常_shy", 300,true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300540na">
「ち、違うよぉ。一緒に入るわけ、ないじゃん……」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300550na">
「でも、１人で外に出るの……なんだか、怖くて……」

そりゃ、そうだよな……。
自分では思い出せないけど、気が付いたら全裸で外にいたなんて、怖いに決まってる。

//■３６０
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300560na">
//「だ、だから、ナナがシャワー浴びてる間、声が聞こえるところに、いてほしいなぁって……」
「だ、だから、ナナがシャワー浴びている間、声が聞こえるところに、いてほしいなぁって……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st七海_トレーナー_通常_shy", 500, true);
	Stand("bu七海_トレーナー_通常","shy", 500, @+100);
	FadeStand("bu七海_トレーナー_通常_shy", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00300570na">
「ダ、ダメ、かなぁ……？」

上目遣いで、僕にすがるような目を向けてくる。
その仕草に、僕は心の中でついつい、うめいてしまった。
まずい、ちょっと、萌えそうになっちゃっただろ……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00300580ta">
「わ、分かったよ……」

七海が弱ってる今日ぐらいは、兄貴らしいこと、してやろう……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//～～Ｆ・Ｏ

//妄想エフェクトの短い間隔での切り替えはここまで
	SetVolume360("CH*", 2000, 0, null);


	ClearAll(2000);
	Delete("レンズ１"):
	Wait(1500);
}



