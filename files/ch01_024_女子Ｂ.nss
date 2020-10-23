//<continuation number="150">




chapter main
{

	$PreGameName = "boot_第一章";

	if($GameStart != 1)
	{
		$GameName = "ch01_024_女子Ｂ";
		$GameContiune = 1;
		Reset();
	}

	ch01_024_女子Ｂ();
}


function ch01_024_女子Ｂ()
{
	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	CreateColor("back05", 100, 0, 0, 1280, 720, "Black");

//☆Cut-94-----------------------------
//ＢＧ//廊下//昼
	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");
	DrawTransition("back03", 500, 0, 1000, 100, null, "cg/data/right3.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");

	CreateSE("SE02","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE02", 1000, 500, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
２年生の教室から中庭に向かうには、渡り廊下を通って３年生の教室がある校舎に入り、そこの階段を降りていくのが最短ルートだ……と思う。

そんなに学校には来ないから、校内のどこがどこに繋がっているかにはあんまり詳しくない。特別教室の場所だって全部は把握できてないし。

だからちょっと不安を覚えつつ、僕は渡り廊下を進んでいった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Stand("stセナ_制服_通常","angry", 200, @+150);
	FadeStand("stセナ_制服_通常_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//ＣＨ//セナ
渡り廊下にはひとりの女子がいて、廊下のど真ん中に立って空を眺めていた。しかもやけに厳しい顔だ。黄昏れてる、っていう感じじゃない。

その女は、明らかに通行の邪魔なのに微動だにしなかった。

僕の足音は聞こえてるはずだろぉ。どいてくれよな、急いでるのに……。

なんだかこの女からはＤＱＮの香りがした。できるだけ近づかないように、目を付けられないようにしよう。

{	DeleteStand("stセナ_制服_通常_angry", 500, false);}
そう思いつつ、僕は"女子Ｂ"の後ろをそそくさとすり抜けようとした。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch01/02400010sn">
「…………おい」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02400020ta">
「……っ」

やばい、声をかけられた！

まさかカツアゲされる？　それとも僕の顔が気に入らないって言って、ＤＱＮグループのたまり場に連れて行かれてリンチか！？

そ、そ、そんなの勘弁してよ……。
僕がなにをしたって言うんだよ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buセナ_制服_通常","angry", 200, @+150);
	FadeStand("buセナ_制服_通常_angry", 500, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
女子Ｂの方をそっとうかがうと、にらまれていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("buセナ_制服_通常","hard", 200, @+150);
	FadeStand("buセナ_制服_通常_hard", 300, false);
	DeleteStand("buセナ_制服_通常_angry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch01/02400030sn">
「お前、誰だ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02400040ta">
「え……」

誰だ、って言われても……。

僕は西條拓巳だけど。もちろんこの女とは初対面だから、相手が僕の名前を知るわけがないけど。

やっぱりこの女、僕にひどいことをしようとしてるに違いない……！

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02400050ta">
「す、すいません……っ」

女子Ｂの顔を見ないようにしてペコリと頭を下げ、それから僕は全力で逃げ出した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("サウンド１","SE_じん体_動作_足_走る_LOOP");
	MusicStart("サウンド１",0,1000,0,1000,null,true);

	CreateTexture360("背景１", 100, center, middle, "SCREEN");

	DeleteStand("buセナ_制服_通常_hard", 0, false);
	FadeDelete("back0*", 0, true);

	DrawTransition("背景１", 500, 1000, 0, 100, null, "cg/data/left2.png", true);

	Wait(1000);

	SetVolume("サウンド１", 1000, 0, NULL);
	SetVolume("SE02", 1000, 0, NULL);

	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg043_01_1_学校中庭_a.jpg");
	DrawTransition("back03", 500, 0, 1000, 100, null, "cg/data/right2.png", true);

	Delete("背景１");

	CreateSE("SE02","SE_日常_校門前_朝");
	MusicStart("SE02", 1000, 400, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
３年生校舎の階段を駆け下りて外に飛び出したところで、背後を窺う。さっきの怖そうな女は追いかけてはこなかったみたいだ。

助かった……。三次元は罠だらけで嫌になる。

荒い息を整えて、僕は中庭を見回した。

中庭は、プールと校舎とに挟まれていて、庭というより通路と言った方がいいくらい縦に長い。

//コスモス
等間隔に花壇があって、今は紫色の花が目立っている。あれってなんていう花だろう。よく分からない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常","sad", 200, @-150);
	FadeStand("st優愛_制服_通常_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
その花壇の前に、手持ち無沙汰で花を眺めている優愛の姿を見つけた。

ホントにいた……。
僕を、待っててくれた……。

他の誰でもない、僕だけを、待っててくれた……。

優愛は、僕を裏切らない。
僕は、優愛を信じていいのかもしれない。
優愛なら、僕を救ってくれるのかもしれない。

{	Stand("st優愛_制服_通常左手下","shock", 200, @-150);
	DeleteStand("st優愛_制服_通常_sad", 300, false);
	FadeStand("st優愛_制服_通常左手下_shock", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02400060yu">
「あ……」

優愛が顔を上げて、僕に気付く。

そして、みるみるうちに目を丸くした。

僕は気恥ずかしさを感じて目をそらし、そこに立ち尽くす。このまま歩み寄っていってもいいのかどうか、分からない。

どうして驚いているんだろう。

僕は来ない方がよかったのかな……。

迷っていると、優愛の方から僕に駆け寄ってきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常","shock", 200, @-150);
	DeleteStand("st優愛_制服_通常左手下_shock", 300, false);
	FadeStand("st優愛_制服_通常_shock", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02400070yu">
「び、びっくり、しました……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02400080ta">
「え……？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02400090yu">
「西條くんが、本当に来てくれるなんて……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02400100yu">
「どうせ来てもらえないって、あきらめかけてたんです……」

{	Stand("st優愛_制服_通常","normal", 200, @-150);
	FadeStand("st優愛_制服_通常_normal", 300, true);
	DeleteStand("st優愛_制服_通常_shock", 0, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02400110yu">
「でも、待っててよかった……」

案外、優愛は僕と似たような思考の持ち主かもしれない。物事をなんでもネガティブにとらえちゃうって言うか。

ただ、優愛と僕とで決定的に違うことがある。

僕はネガティブに考えて、なにもしない。
優愛は、ネガティブに考えるけど、自分から行動する。

そんな優愛の行動力を、僕は素直に尊敬できた。
僕もそうありたいって、思った。

{	Stand("st優愛_制服_通常左手下","shy", 200, @-150);
	DeleteStand("st優愛_制服_通常_normal", 300, false);
	FadeStand("st優愛_制服_通常左手下_shy", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02400120yu">
「えっと、一緒に、か……帰って、くれますか……？」

おずおずとしたその問いかけに、僕はうなずいた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//ＢＧ//校門//夕方

	CreateTexture360("背景１", 300, center, middle, "SCREEN");

	DeleteStand("st優愛_制服_通常左手下_shy", 0, false);
	CreateBG(100, 0, 0, 0, "cg/bg/bg016_01_2_学校校門_a.jpg");
	Stand("bu優愛_制服_通常","normal", 200, @150);
	FadeStand("bu優愛_制服_通常_normal", 0, true);

	DrawTransition("背景１", 1000, 1000, 0, 100, null, "cg/data/left3.png", true);
	FadeDelete("背景１", 0, true);

	SetVolume("SE02", 1000, 800, NULL);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
優愛と肩を並べて、校門に向かう。

なんだか気恥ずかしい。下校中の他の生徒から羨望の眼差しを向けられているような気もしてくる。

意識するとどんどんガチガチになってきた。
やっぱり女の子とふたりきりで帰るなんて、無理だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	Stand("st護_スーツ_通常","normal", 150, @-300);
	Move("st護_スーツ_通常*", 0, @80, @80, null, true);
	FadeStand("st護_スーツ_通常_normal", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02400130ta">
「ん？」

//ＣＨ//諏訪
//２章インターミッション０５への伏線。すでに捜査の手が学校にまで及んでいる。
{	DeleteStand("st護_スーツ_通常_normal", 500, true);}
見慣れない教師とすれ違った。っていうか、制服じゃなくてスーツを着ているから、教師じゃないかと思っただけなんだけど。

あんな若い教師……いたっけ？

僕は普段学校に滅多に来ないから、当然のように教師の顔なんてまったく覚えてないんだ。
たまに担任の顔すら忘れることがある。

スーツ教師は辺りをキョロキョロしながら、校舎の方へと歩いていった。

{	Stand("bu優愛_制服_通常","shock", 200, @150);
	FadeStand("bu優愛_制服_通常_shock", 300, true);
	DeleteStand("bu優愛_制服_通常_normal", 0, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02400140yu">
「どうしました？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02400150ta">
「あ……」

僕は慌てて首を振ると、優愛に並んで再び歩き出した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,500);//――――――――――――――――――――――――――――――

	SetVolume("SE02", 1000, 0, NULL);

	ClearAll(1000);

	Wait(500);

}

