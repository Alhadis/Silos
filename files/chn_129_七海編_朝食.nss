

chapter main
{

	$PreGameName = "boot_七海ルート";

	if($GameStart != 1)
	{
		$GameName = "chn_129_七海編_朝食";
		$GameContiune = 1;
		$七海ルート=true;
		$RouteON=true;
		Reset();
	}

	chn_129_七海編_朝食();
}


function chn_129_七海編_朝食()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★七海編

//ＢＧ//コンテナ外観

	BGMPlay360("CH08",0,1000,true);

	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg006_01_1_コンテナ外観_a.jpg");
	Fade("back01", 0, 0, null, true);
	Fade("back01", 1000, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
キャンプで使うような、折りたたみ式の小さなテーブルとイスを設置し、５分ほど待つ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st七海_トレーナー_通常","normal", 200, @-150);
	FadeStand("st七海_トレーナー_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
準備を終えた七海が料理を持ってきて、テーブルに並べる。
見た目はかなりおいしそうだ。

七海って昔から、母親の料理の手伝いをしていたよな。
だから、料理の腕はそれなりのものだったりする。

ま、料理が下手で“失敗しちゃった、テヘ☆”って照れ笑いをするのが許されるのは、二次元女子だけってことだよ。

三次元の妹にそんなことをされたら、リアルで引く。というか、本気で蹴り飛ばしたくなるはず。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st七海_トレーナー_通常_normal", 500, true);
	Stand("bu七海_トレーナー_通常","smile", 200, @+150);
	FadeStand("bu七海_トレーナー_通常_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
七海はニコニコしながら、僕の横に置いてあったイスに腰掛けた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500240ta">
「ちょっ、な、なんで隣に座るんだよ……っ」

近いだろ……。肩が触れそうじゃないか。
こんな照れ臭い距離で食事なんてできない。
僕の方から、七海と少し距離を取った。

{	Stand("bu七海_トレーナー_通常","angry", 200, @+150);
	FadeStand("bu七海_トレーナー_通常_angry", 300, true);
	DeleteStand("bu七海_トレーナー_通常_smile", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500250na">
「えー？　だって、ここにイスが置いてあったんだもん」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500260na">
「おにぃが置いたんでしょ？」

いや、まあ、置いたけど……。

イスはキャンプ用だけあって、高さは３０センチもないし、女子でも片手で持ち上げることができる軽いものだ。

ちょっと移動させるぐらい、簡単だろうに。

{	Stand("bu七海_トレーナー_通常","normal", 200, @+150);
	FadeStand("bu七海_トレーナー_通常_normal", 300, true);
	DeleteStand("bu七海_トレーナー_通常_angry", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500270na">
「まあいいや。ほら、おにぃ、食べなよ」

{	Stand("bu七海_トレーナー_通常","smile", 200, @+150);
	FadeStand("bu七海_トレーナー_通常_smile", 300, true);
	DeleteStand("bu七海_トレーナー_通常_normal", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500280na">
「いっただきまーす」

七海は手を合わせて、さっさと箸を付け始めた。
意外にも食欲は旺盛みたいだ。

どうやら、すっかり元気になったみたいだな。
昨日、あんなに弱っていたのがウソみたいだ。

案外、“ウソみたい”じゃなくてホントに“ウソ”だったりして。
ウソをついた理由は、もちろんひとつしかない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("White", 4000, 0, 0, 1280, 720, "White");
	Fade("White", 0, 0, null, true);
	Request("White", AddRender);
	Fade("White", 100, 1000, null, true);

	DeleteStand("bu七海_トレーナー_通常_smile", 0, true);

	Fade("White", 300, 200, null, true);
	Wait(300);

	Stand("bu七海_トレーナー_通常","shy", 200, @+150);
	FadeStand("bu七海_トレーナー_通常_shy", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//ＶＦ//妄想セリフ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500290na">
「大好きなおにぃと一緒にいたくて、ウソついちゃったの……」

みたいな？
うはｗｗｗそれなんてエロゲ？ｗｗｗ
もちろん僕はこう答えるね。

だが断る！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("White", 300, 1000, null, true);
	DeleteStand("bu七海_トレーナー_通常_shy", 0, true);
	FadeDelete("White", 1000, true);

	Wait(500);

	Stand("bu七海_トレーナー_通常","pride", 200, @+150);
	FadeStand("bu七海_トレーナー_通常_pride", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500300na">
「おにぃ、なんかニヤニヤしてる……」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500310na">
「また変な妄想でもしてた？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500320ta">
「う……」

図星を突かれて、僕はとっさに顔を伏せた。
サンドイッチのひとつを手に取り、頬張る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500330ta">
「お、うまい……」

ハムサンドは、きちんとからしマヨネーズが塗られていた。
基本中の基本だけど、ここには調味料の買い置きなんてなかったことを考えると、けっこうすごいことだ。

{	Stand("bu七海_トレーナー_通常","smile", 200, @+150);
	FadeStand("bu七海_トレーナー_通常_smile", 300, false);
	DeleteStand("bu七海_トレーナー_通常_pride", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500340na">
「へへ～、でしょでしょ？　わざわざ朝早くに、２４時間やってるスーパーに行って、いろいろ買ってきたんだよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500350ta">
「……え、ちょっ、か、買ってきたって？　その格好で！？　ど、どんだけ痴女なんだよ！」

{	Stand("bu七海_トレーナー_通常","angry", 200, @+150);
	FadeStand("bu七海_トレーナー_通常_angry", 300, false);
	DeleteStand("bu七海_トレーナー_通常_smile", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500360na">
「痴女じゃないもん！　このままで外歩けるわけないじゃん」

//◆穿いて＝はいて
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500370na">
「ちゃんと、おにぃのズボン借りて、それ穿いて行ってきたよ」

{	Stand("bu七海_トレーナー_通常","shy", 200, @+150);
	FadeStand("bu七海_トレーナー_通常_shy", 300, false);
	DeleteStand("bu七海_トレーナー_通常_angry", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500380na">
「下着だって買ってきたし」

なるほど、下着は買ったのか……。

つまり下着を買うまでは、ノーブラノーパンで男物のトレーナーとズボンという装備だったわけですね。それは実にけしからん。

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500390na">
「ホントは、このトレーナーも着替えたかったんだけどさ。アニメの絵が描いてあって、けっこう恥ずかしいし」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu七海_トレーナー_拗ね","angry", 200, @+150);
	DeleteStand("bu七海_トレーナー_通常_shy", 300, false);
	FadeStand("bu七海_トレーナー_拗ね_angry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//◆ちょっと照れ
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500400na">
「でも、おにぃが着せてくれたんだから、勝手に着替えちゃうのも、悪いかな、なんて……」

ふん。星来たんの魅力が分からないとは、これだからスイーツ女は困る。
と、とは言え、さすがの僕も、アキバならまだしも、これを着て渋谷を歩く勇気は……ないかも……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500410ta">
「そ、それで、お金は……？」

{	Stand("bu七海_トレーナー_通常","smile", 200, @+150);
	DeleteStand("bu七海_トレーナー_拗ね_angry", 300, false);
	FadeStand("bu七海_トレーナー_通常_smile", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500420na">
「ちょうどね、借りたズボンに財布が入ってたから、大丈夫だったよ」

ベーコンを、小さな口ではむはむとかじりながら、しれっとそんなことを言いやがった。
大丈夫って、なにが大丈夫なんだ！

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500430ta">
「その財布、僕のだろっ！　ぼ、僕の金、使ったのかよ……！」

{	Stand("bu七海_トレーナー_通常","angry", 200, @+150);
	FadeStand("bu七海_トレーナー_通常_angry", 300, true);
	DeleteStand("bu七海_トレーナー_通常_smile", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500440na">
「だってナナ、昨日お財布もなくしちゃったもん」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500450ta">
「だ、だからって、か、か、勝手に使うなよ……っ」

文句を言ったけど、七海は聞いていなかった。
しょんぼりした様子で、ベーコンエッグの半熟の黄身をぐちゃぐちゃと潰している。

{	Stand("bu七海_トレーナー_拗ね","angry", 200, @+150);
	DeleteStand("bu七海_トレーナー_通常_angry", 300, false);
	FadeStand("bu七海_トレーナー_拗ね_angry", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500460na">
「はぁ～、財布もなくしちゃったし、学校のカバンもどっか行ったし」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500470na">
「それに、バングルがなくなっちゃったのが、一番ショック……」

こっちもショックだ……。
そりゃ、ＲＭＴでそれなりに金は持ってるけど、盗まれたみたいでイヤな気分になってくる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500480ta">
「あ、あんな安物のバングルなんか、なくしたって、ど、どうってことないだろ……常識的に考えて」

しかも僕がタダであげたものじゃないか。七海にとってはちっともダメージはないはずだ。
なんでそんなに、あのバングルにこだわるんだか……。

七海はもじもじとした。

{	SetVolume360("CH08", 12000, 0, null);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500490na">
「だって、初めておにぃからもらったプレゼントだったんだもん。すごく、嬉しかったのに」

……だ、騙されないぞ。そんなかわいいこと言ったって、勝手に僕の財布から金を抜いた事実は、消えないんだぞ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu七海_トレーナー_通常","angry", 200, @+150);
	DeleteStand("bu七海_トレーナー_拗ね_angry", 300, false);
	FadeStand("bu七海_トレーナー_通常_angry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500500na">
「ナナね、絶対見つけ出すから。なくしたままにしておくなんて、できないよ」

なぜか拳をぎゅっと握りしめて、そう宣言する。
何気なくそれを見ていた僕は、その七海の右手の袖口に、白い包帯が巻かれていることに違和感を覚えた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500510ta">
「そ、その、包帯……」

{	Stand("bu七海_トレーナー_通常","shock", 200, @+150);
	FadeStand("bu七海_トレーナー_通常_shock", 300, true);
	DeleteStand("bu七海_トレーナー_通常_angry", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500520na">
「え？　あ、これ？」

僕の指摘に、七海はわざわざ袖をめくって見せた。

確かに右手首に包帯が巻かれている。
昨日、全裸でここにうずくまっていたときは、あんな包帯、なかったよな……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH08", 500, 0, null);

	CreateSE("SE回想in","SE_衝撃_ふらっしゅばっく");
	SoundPlay("SE回想in",0,1000,false);

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 100, 1000, null, true);

	CreateTexture360("back02", 1000, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");
	Fade("回想フラッシュ", 500, 0, null, true);

//■３６０：ＶＦ：要調整
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//ＶＦ//回想セリフ＆ケータイの声
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500520na_01">
「右手を……返して……」

//ＶＦ//回想セリフ＆電話の声
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500520na_02">
「ナナの……右手――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE360101","SE_日常_雑踏02");
	MusicStart("SE360101",2000,500,0,1000,null,true);


	Fade("回想フラッシュ", 100, 1000, null, true);
	Delete("back02");
	Fade("回想フラッシュ", 1500, 0, null, true);
	Delete("回想フラッシュ");
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
そ、そうか、昨日のいたずらの続きだな？
ずいぶん凝ったいたずらだな。いったい、なにが目的だ？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500530ta">
「そ、そんな包帯、外せよ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500540ta">
「いたずらにしたって、あ、悪趣味だよ」

{	Stand("bu七海_トレーナー_通常","angry", 200, @+150);
	FadeStand("bu七海_トレーナー_通常_angry", 300, true);
	DeleteStand("bu七海_トレーナー_通常_shock", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500550na">
「いたずらなんかじゃないよ」

{	Stand("bu七海_トレーナー_拗ね","sad", 200, @+150);
	DeleteStand("bu七海_トレーナー_通常_angry", 300, false);
	FadeStand("bu七海_トレーナー_拗ね_sad", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500560na">
「朝、起きてから、右手がちょっとズキズキするの」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500570na">
「原因は分かんないけど、とりえあず包帯買って巻いたんだ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500580ta">
「ズキズキ痛むのに、包帯だけ巻いたって、意味ないだろ……」

{	Stand("bu七海_トレーナー_通常","angry", 200, @+150);
	DeleteStand("bu七海_トレーナー_拗ね_sad", 300, false);
	FadeStand("bu七海_トレーナー_通常_angry", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500590na">
「包帯だけのわけないじゃん！　ちゃんと湿布も貼ったよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500600ta">
「だ、だったら湿布だけで、いいじゃないか。わざわざ、包帯を巻く意味が、わ、分からない」

{	Stand("bu七海_トレーナー_通常","pride", 200, @+150);
	FadeStand("bu七海_トレーナー_通常_pride", 300, true);
	DeleteStand("bu七海_トレーナー_通常_angry", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500610na">
「そうだけど……。ほら、病は気からって言うし」

さらに意味不明……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500620ta">
「いいから、取れよ」

ぞんざいに言ってサンドイッチをぱくつきながらも、僕の心臓はドキドキと早鐘を鳴らしていた。

考え過ぎかもしれないけど、もし、昨日の七海の電話がいたずらなんかじゃなかったとしたら、って思うと……。

七海のこの元気さは実は演技かなにかで、ホントは、すごく深刻な状況に追い込まれていて、僕に対してそれを隠そうとしているんだとしたら……。

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500630na">
「もー。ホント、わがままなおにぃだなぁ」

{	DeleteStand("bu七海_トレーナー_通常_pride", 500, true);}
七海は渋々といった様子で、包帯をほどき始める。
意外にも素直に従ったことに、逆に僕は戸惑った。
やっぱり考え過ぎだったのかな？

七海の腕は見ないようにして、僕はベーコンエッグを口に運んだ。

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500640na">
「はい、取ったよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE360101", 1000, 10, null);


	CreateSE("SE01","SE_じん体_心臓_鼓動");
	MusicStart("SE01",0,1000,0,1000,null,false);
	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
ゴクリと、僕は一度、息を呑んで。
それから、ゆっくりと――
妹の腕を、視界に捉えた。

{	Wait(500);
	SetVolume("SE360101", 2000, 300, null);}
包帯の下は、とてもキレイだった。傷ひとつない。内出血すらない。
っていうか、わざわざ湿布まではがしたのか……。そこまでしろとは言ってないんだけど。

{	CreateSE("SE01","SE_じん体_掴む");
	MusicStart("SE01",0,300,0,1000,null,false);}
七海の手をつかみ、顔を近づけてさらにまじまじと観察する。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu七海_トレーナー_通常","shock", 200, @+150);
	FadeStand("bu七海_トレーナー_通常_shock", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//◆びっくり
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500650na">
「お、おにぃ……！？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500660ta">
「……き、傷なんて、ない」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500670ta">
「なんにも、ない……」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500680na">
「あるなんて、一言も言ってないよ。ズキズキするんだって、説明したじゃん」

そ、そうだよな。
やっぱり、僕の考え過ぎだったんだ。

まだ、昨日の『将軍』からのメールが頭にあって、疑心暗鬼が抜け切れていないのかも。

……っていうか。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500690ta">
「くさっ！　お前の腕、し、湿布くさっ！」

たまらず顔をしかめ、七海の腕を離す。

{	Stand("bu七海_トレーナー_通常","angry", 200, @+150);
	FadeStand("bu七海_トレーナー_通常_angry", 300, true);
	DeleteStand("bu七海_トレーナー_通常_shock", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500700na">
「むぅー！　そんなの当たり前じゃん！　女の子にくさいって言うなんて、最低！　バカおにぃ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500710ta">
「うるさい。さっさとメシ食って、学校行け」

僕は、自分の貴重な時間を、いちいち七海に翻弄されてムダにしたくないんだ。

{	Stand("bu七海_トレーナー_通常","shock", 200, @+150);
	FadeStand("bu七海_トレーナー_通常_shock", 300, true);
	DeleteStand("bu七海_トレーナー_通常_angry", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500720na">
「あ、そっか、学校かぁ……。
でも、制服ないのに、どうやって行こう？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500730ta">
「……た、確かに」

{	Stand("bu七海_トレーナー_拗ね","angry", 200, @+150);
	DeleteStand("bu七海_トレーナー_通常_shock", 300, false);
	FadeStand("bu七海_トレーナー_拗ね_angry", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500740na">
「んー、今日は学校休んで、家に帰ろうっと。ブラウスとスカートの替えはあるけど、ブレザーはどうしよう……。新しく買ってもらうしかないかなぁ……」

{	DeleteStand("bu七海_トレーナー_通常_shock", 300, true)}
今後の対応を１人でぶつぶつつぶやいている七海を尻目に、僕はさっさと朝食を平らげ、コンテナハウスの中に戻った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	CreateSE("SE01","SE_日常_扉_開ける");
	MusicStart("SE01",0,1000,0,1000,null,false);

	ClearAll(2000);
	Wait(1000);
}
