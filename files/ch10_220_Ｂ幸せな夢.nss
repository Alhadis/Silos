//<continuation number="940">




chapter main
{

	$PreGameName = "boot_第十章";

	if($GameStart != 1)
	{
		$GameName = "ch10_220_Ｂ幸せな夢";
		$GameContiune = 1;
		$Ｂルート = true;
		Reset();
	}

		ch10_220_Ｂ幸せな夢();
}


function ch10_220_Ｂ幸せな夢()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	CreateColor("back10", 100, 0, 0, 1280, 720, "Black");

//２ヶ月後――
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, Middle, Auto, Auto, "２ヶ月後――");
	Move("テキスト１", 0, @8, @0, null, true);
	SetBacklog("２ヶ月後――", "NULL", NULL);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	WaitKey();

/*
//ＢＧ//黒
//以下、画面黒で文章のみ画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
２ヶ月後――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――
//以上、画面黒で文章のみ画面中央に表示
*/

//イメージＢＧ//青空

	CreateTextureEX("back03", 100, 0, -80, "cg/bg/bg002_01_1_青空_a.jpg");
	Move("back03", 3000, 0, 0, Dxl2, false);
	Fade("back03", 1000, 1000, null, true);
	Delete("テキスト１");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
冬の空は、青さが少ない。
その代わり、夏の空と違って凛とした透明感がある。

朝。
目覚まし時計で目を覚ました僕は、歯を磨きながら空を見上げていた。

あの騒動から２ヶ月。
渋谷は今も復興作業が続けられている。

年も明けて、渋谷も以前みたいな騒がしさやきらびやかさを少しずつ取り戻してきている。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000010ri">
「タク！」

僕を呼ぶ声。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH03", 1000, 1000, true);
	CreateBG(100, 500, 0, 0, "cg/bg/bg006_01_1_コンテナ外観_a.jpg");
	Stand("st梨深_制服_通常","normal", 200, @+150);
	FadeStand("st梨深_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
振り返ると、梨深が階段を上がってきたところだった。
彼女の制服姿を見るのは、あの日以来だ。

{	Stand("st梨深_制服_通常ビシッ！","happy", 200, @+150);
	DeleteStand("st梨深_制服_通常_normal", 500, false);
	FadeStand("st梨深_制服_通常ビシッ！_happy", 500, true);}
梨深は僕に微笑みかけて、敬礼のようなポーズをした。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000020ri">
「ビシィ！　おはよー」

{	Stand("st梨深_制服_通常ビシッ！","smile", 200, @+150);
	FadeStand("st梨深_制服_通常ビシッ！_smile", 300, true);
	DeleteStand("st梨深_制服_通常ビシッ！_happy", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000030ri">
「朝ご飯、急いで作るね」

{	DeleteStand("st梨深_制服_通常ビシッ！_smile", 500, true);}
梨深の手には、コンビニの袋。
中には食パンと卵、それに牛乳が入っていた。
流し台の前に立ち、いそいそと準備を始める。

梨深はこの２ヶ月、毎日のようにこのベースにやって来ては、ご飯を作ってくれている。

彼女自身は料理をろくにしたことがないらしくて、修行も兼ねているらしい。

僕を実験台にするなって言いたいけど、女の子の手料理を食べられるなんて幸せなことだから、あえてぐっと我慢していた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","normal", 200, @+150);
	FadeStand("bu梨深_制服_正面_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000040ri">
「今日から学校、再開だね」

あの地震以来、翠明学園はずっと休校になっていたけど、今日から再開する。

これを機に、僕も半引きこもりのような生活はやめて、真面目に学校に行くことにしたんだ。

{	Stand("bu梨深_制服_正面","smile", 200, @+150);
	FadeStand("bu梨深_制服_正面_smile", 300, true);
	DeleteStand("bu梨深_制服_正面_normal", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000050ri">
「タクと、また学校に通えるなんて、嬉しいな」

卵を割りながら、梨深がそう言った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("back10", 100, center, middle, "SCREEN");

	DeleteStand("bu梨深_制服_正面_smile", 0, false);

	SetVolume360("CH03", 1000, 0, NULL);
	CreateColor("back11", 100, 0, 0, 1280, 720, "Black");
	DrawTransition("back11", 1000, 0, 1000, 500, null, "cg/data/細かいひし形左右.png", true);

	CreateSE("SE01","SE_日常_扉_閉まる");
	MusicStart("SE01",0,1000,0,1000,null,false);


//ＢＧ//拓巳の部屋
	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg195_01_6_Bエンド拓巳の部屋_a.jpg");
	DrawTransition("back03", 1000, 0, 1000, 500, null, "cg/data/細かいひし形左右.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg195_01_6_Bエンド拓巳の部屋_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
さすがに冬のまっただ中に外で食事するのは、寒さに耐えられなくて無理だ。

梨深が作ってくれた、２人分のトーストとスクランブルエッグを室内に運び、小さな座卓に並べる。
それからソファに並んで座った。

{	Stand("bu梨深_制服_正面","smile", 200, @+150);
	FadeStand("bu梨深_制服_正面_smile", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000060ri">
「じゃあ、いただきまーす」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/22000070ta">
「いただきます」

{	CreateSE("SE360101","SE_じん体_動作_抱く1");
	MusicStart("SE360101",0,1000,0,1000,null,false);
	DeleteStand("bu梨深_制服_正面_smile", 500, true);}
手を合わせてから、僕は座卓の端に置いてあったバターに手を伸ばす。

ところが梨深もほぼ同時に同じことをしていたから、バターの容器の上で、僕と梨深の指先が触れることになった。

{	BGMPlay360("CH11", 1000, 1000, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000080ri">
「あ」

なんというラブコメ展開。
頭の中ではそう苦笑しつつも、すぐ横に座る梨深と至近距離で目が合って、ドキドキしてしまう。

梨深も目を離そうとしない。
手を引っ込めることもしない。
互いに身を固まらせ、指を触れ合わせたまま見つめ合う。

//◆ささやき
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000090ri">
「タク……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","normal", 200, @+0);
	FadeStand("bu梨深_制服_正面_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
と、梨深が僕の手に指を絡ませてきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	if(#下着パッチ==true)
	{
		CreateTexture("梨深", 200, Center, InBottom, "ex/bu/bu梨深_制服_正面_下着_lost_eye02.png");
	}else{
		CreateTexture("梨深", 200, Center, InBottom, "cg/bu/bu梨深_制服_正面_lost_eye02.png");
	}
	Fade("梨深", 0, 0, null, true);


	Move("梨深", 0, @0, @136, null, true);

	Fade("梨深", 400, 1000, null, false);
	DeleteStand("bu梨深_制服_正面_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text804]
目をそっと閉じ、わずかに顎をそらす。

僕も自然に梨深の手を握り返していた。
そして、梨深の唇にそっと――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH11", 0, 0, NULL);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//◆呆れて
//【七海】
<voice name="七海" class="七海" src="voice/ch10/22000010na">
「朝からなにイチャついてんの？」

{	Stand("bu梨深_制服_通常","shock", 200, @+0);
	FadeDelete("梨深", 500, false);
	FadeStand("bu梨深_制服_通常_shock", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000110ri">
「えっ！？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/22000120ta">
「わあ！？」

{	CreateSE("SE01","SE_衝撃_鞄_落ちる");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
	Move("bu梨深_制服_通常_shock", 500, @+200, @0, Dxl3, true);}
慌てて僕は梨深から離れた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH08", 1000, 1000, true);

	CreateTexture360("back10", 100, center, middle, "SCREEN");
	DeleteStand("bu梨深_制服_通常_shock", 0, false);
	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg026_01_1_拓巳部屋_a.jpg");
	DrawTransition("back03", 500, 0, 1000, 100, null, "cg/data/right2.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg026_01_1_拓巳部屋_a.jpg");
	Stand("st七海_制服_拗ね","angry", 200, @+50);
	FadeStand("st七海_制服_拗ね_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text100]
扉の方を見ると、いつの間に現れたのか、七海が腕を組んで呆れたような顔をしている。

//◆照れる
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000130ri">
「ナ、ナナちゃん、おはよー、たはは……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/22000140ta">
「七海、心臓に悪いことするなよ……」

//◆呆れて
//【七海】
<voice name="七海" class="七海" src="voice/ch10/22000150na">
「はあ、おにぃと梨深さんって、ホント仲いいねー」

//◆ボソッと
//【七海】
<voice name="七海" class="七海" src="voice/ch10/22000160na">
「妬けちゃうなあ……」

{	Stand("st七海_制服_通常","normal", 200, @+50);
	DeleteStand("st七海_制服_拗ね_angry", 500, false);
	FadeStand("st七海_制服_通常_normal", 500, true);}
//◆いたずらげに
//【七海】
<voice name="七海" class="七海" src="voice/ch10/22000170na">
「ねえねえ、実際のところ、どこまでいったの？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000180ri">
「ど、どこまで、って？」

//【七海】
<voice name="七海" class="七海" src="voice/ch10/22000190na">
「またまたぁ。とぼけてないで教えてよ、梨深さん」

七海は梨深をターゲットに定めたみたいだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("back10", 100, center, middle, "SCREEN");
	DeleteStand("st七海_制服_通常_normal", 0, false);

	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg195_01_6_Bエンド拓巳の部屋_a.jpg");
	DrawTransition("back03", 500, 0, 1000, 100, null, "cg/data/right2.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg195_01_6_Bエンド拓巳の部屋_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text101]
ずかずかと部屋に入ってくると、ＰＣ用のイスを引き寄せてきて梨深の前に座る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_通常","normal", 190, @+350);
	Stand("bu七海_制服_通常","normal", 200, @-350);
	FadeStand("bu梨深_制服_通常_normal", 500, false);
	FadeStand("bu七海_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【七海】
<voice name="七海" class="七海" src="voice/ch10/22000200na">
「キスは当然したとして、その先は？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000210ri">
「ちょ、ちょっと～。からかわないでよぉ」

//【七海】
<voice name="七海" class="七海" src="voice/ch10/22000220na">
「いいじゃん。教えて～」

{	Stand("bu梨深_制服_通常","smile", 190, @+350);
	FadeStand("bu梨深_制服_通常_smile", 300, true);
	DeleteStand("bu梨深_制服_通常_normal", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000230ri">
「教えなーい」

{	Stand("bu梨深_制服_通常","normal", 190, @+350);
	FadeStand("bu梨深_制服_通常_normal", 300, true);
	DeleteStand("bu梨深_制服_通常_smile", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch10/22000240na">
「じゃあおにぃ。教えてよ、どこまでいったか」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/22000250ta">
「…………」

教えるもなにも、キスすらまだなわけだが。
あああ、僕のバカ、アホ。チャンスはこれまでにもいくらでもあったのに。

こんなんじゃ童貞を卒業するのはいつになるやらって感じだよ……はあ。
僕は自分のヘタレさに凹みながら、牛乳を口に含む。

{	Stand("bu七海_制服_通常","shy", 200, @-350);
	FadeStand("bu七海_制服_通常_shy", 300, true);
	DeleteStand("bu七海_制服_通常_normal", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch10/22000260na">
「梨深さんがのんびりしてるなら、
ナナがおにぃを奪っちゃおうっかなぁ」

{	Stand("bu梨深_制服_通常","shock", 190, @+350);
	FadeStand("bu梨深_制服_通常_shock", 200, true);
	DeleteStand("bu梨深_制服_通常_normal", 0, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/22000270ta">
「ぶーーーー！」

盛大に牛乳を吹いていた。

{	Stand("bu七海_制服_通常","pride", 200, @-350);
	FadeStand("bu七海_制服_通常_pride", 300, true);
	DeleteStand("bu七海_制服_通常_shy", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch10/22000280na">
「おにぃ、きったなー」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/22000290ta">
「ちょ、おま……っ」

{	Stand("bu七海_制服_通常","smile", 200, @-350);
	FadeStand("bu七海_制服_通常_smile", 300, true);
	DeleteStand("bu七海_制服_通常_pride", 0, true);}
//◆笑いながら
//【七海】
<voice name="七海" class="七海" src="voice/ch10/22000300na">
「冗談だよ。本気にされても困っちゃうってば」

はあ……あんまりビックリさせるなよ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH08", 1000, 0, NULL);
//～～Ｆ・Ｏ

	ClearAll(1000);
	Wait(2000);

//ＢＧ//松濤公園

	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg015_01_0_松濤公園_a.jpg");
	DrawTransition("back03", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);
	CreateBG(100, 1000, 0, 0, "cg/bg/bg015_01_0_松濤公園_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
３人で肩を並べて学校へ向かう。
梨深は、ファンタズムのあの歌をまた鼻歌で奏でている。

松濤公園の中を通り抜けるのが、僕がいつもしているショートカット。

公園は、池の石垣が一部崩れたままになっていたりと、地震の影響がわずかに見られる。それでも渋谷中心部の惨状に比べれば全然マシだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH11", 1000, 1000, true);
	Stand("st優愛_制服_通常左手下","normal", 200, @+320);
	FadeStand("st優愛_制服_通常左手下_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/22000310yu">
「おはようございます」

優愛が、例のベンチに座っていた。
僕らの方を振り返り、柔らかな笑みを浮かべて頭を下げてくる。

{	Stand("st優愛_制服_通常左手下","smile", 200, @+320);
	FadeStand("st優愛_制服_通常左手下_smile", 300, true);
	DeleteStand("st優愛_制服_通常左手下_normal", 0, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/22000320yu">
「あの、西條くん、昨日は、とても楽しかったです」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st七海_制服_通常","shock", 200, @-320);
	FadeStand("st七海_制服_通常_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602007]
//【七海】
<voice name="七海" class="七海" src="voice/ch10/22000330na">
「昨日？」

{	Stand("st優愛_制服_通常左手下","normal", 200, @+320);
	FadeStand("st優愛_制服_通常左手下_normal", 300, true);
	DeleteStand("st優愛_制服_通常左手下_smile", 0, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/22000340ta">
「優愛と一緒に、秋葉原まで買い物に行ったんだ」

{	Stand("st七海_制服_通常","pride", 200, @-320);
	FadeStand("st七海_制服_通常_pride", 300, true);
	DeleteStand("st七海_制服_通常_shock", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch10/22000350na">
「あ、分かった。お人形さんでしょ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/22000360ta">
「フィギュアと言えよぅ……」

まあ、フィギュアを買いに行ったのは事実だけど。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常","smile", 200, @+320);
	DeleteStand("st優愛_制服_通常左手下_normal", 500, false);
	FadeStand("st優愛_制服_通常_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//◆嬉しそう
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/22000370yu">
「新しい星来ちゃん、さっそく、部屋に飾りました」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_通常","normal", 250, @0);
	FadeStand("st梨深_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000380ri">
「あたしも行きたかったなあ」

{	Stand("st七海_制服_通常","normal", 200, @-320);
	FadeStand("st七海_制服_通常_normal", 300, true);
	DeleteStand("st七海_制服_通常_pride", 0, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/22000390ta">
「え、梨深って、フィギュアに、興味あるの？」

すると梨深は、かすかにはにかんだ。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000400ri">
「んー、っていうか」

{	Stand("st梨深_制服_通常","smile", 250, @0);
	FadeStand("st梨深_制服_通常_smile", 300, true);
	DeleteStand("st梨深_制服_通常_normal", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000410ri">
「タクの好きなもの、あたしも、好きになりたいし」

{	Stand("st七海_制服_通常","shy", 200, @-320);
	FadeStand("st七海_制服_通常_shy", 300, true);
	DeleteStand("st七海_制服_通常_normal", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch10/22000420na">
「わあ、大胆発言……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/22000430yu">
「だったら、今度、一緒に買いに行きましょう」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000440ri">
「え、本当？　ありがとうございます」

優愛と梨深は、すっかり意気投合していた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH11", 2000, 0, NULL);

	CreateTexture360("back10", 100, center, middle, "SCREEN");
	DeleteStand("st七海_制服_通常_shy", 0, false);
	DeleteStand("st梨深_制服_通常_smile", 0, false);
	DeleteStand("st優愛_制服_通常_smile", 0, true);

//ＢＧ//昇降口

	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg051_01_1_昇降口_a.jpg");
	DrawTransition("back03", 500, 0, 1000, 100, null, "cg/data/right3.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg051_01_1_昇降口_a.jpg");

	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE01", 1000, 500, 0, 1000, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
優愛と七海とは別校舎なので、昇降口で別れる。

上履きに履き替えていると、背後から誰かが、僕の耳に息を吹きかけてきた。

ぞわり、と鳥肌が立ち、飛び退くようにして振り返る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	SetVolume("SE01", 2000, 0, null);

	BGMPlay360("CH14",0,1000,true);

	Stand("stあやせ_制服_通常","smile", 200, @+240);
	FadeStand("stあやせ_制服_通常_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
そこには、口をすぼめて微笑むあやせの姿。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/22000450ay">
「ふふふ。おはよう、拓巳」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/22000460ta">
「あ、おはよう……」

{	Stand("st梨深_制服_正面","normal", 200, @-240);
	FadeStand("st梨深_制服_正面_normal", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000470ri">
「おはよう、アヤちゃん」

{	Stand("stあやせ_制服_通常","shy", 200, @+240);
	FadeStand("stあやせ_制服_通常_shy", 300, true);
	DeleteStand("stあやせ_制服_通常_smile", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/22000480ay">
「アヤちゃん……」

あやせは梨深の呼びかけにふと首を傾げ――

//◆少し嬉しそう
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/22000490ay">
「初めてよ。そんな呼び方をされたのは」

{	Stand("stあやせ_制服_通常","normal", 200, @+240);
	FadeStand("stあやせ_制服_通常_normal", 300, true);
	DeleteStand("stあやせ_制服_通常_shy", 0, true);}
//◆少し嬉しそう
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/22000500ay">
「悪くないわ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_正面","smile", 200, @-240);
	FadeStand("st梨深_制服_正面_smile", 300, true);
	DeleteStand("st梨深_制服_正面_normal", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//◆笑顔
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000510ri">
「でしょ？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/22000520ay">
「ファンタズムのライブがあるの。明後日」

{	Stand("st梨深_制服_通常","normal", 200, @-240);
	DeleteStand("st梨深_制服_正面_smile", 500, false);
	FadeStand("st梨深_制服_通常_normal", 500, true);}
いきなり話題が飛ぶ。
あやせは相変わらずつかみ所がない。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/22000530ay">
「よかったら来て」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/22000540ta">
「僕に言ってるの？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/22000550ay">
「拓巳に言ってるのよ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/22000560ay">
「それと、梨深も」

{	Stand("st梨深_制服_通常","smile", 200, @-240);
	FadeStand("st梨深_制服_通常_smile", 300, true);
	DeleteStand("st梨深_制服_通常_normal", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000570ri">
「わ、本当？　絶対行くね」

ファンタズムは一度解散したけど、今年に入って急遽復活したって聞いた。

どういう心境の変化か分からないけど、あやせの歌はもう一度聞いてみたい。

{	Stand("stあやせ_制服_通常","smile", 200, @+240);
	FadeStand("stあやせ_制服_通常_smile", 300, true);
	DeleteStand("stあやせ_制服_通常_normal", 0, true);}
//◆少し笑いながら
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/22000580ay">
「でも、拓巳は渡さないわ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st梨深_制服_通常_smile", 500, false);
	DeleteStand("stあやせ_制服_通常_smile", 500, true);
	Stand("buあやせ_制服_通常","smile", 200, @+240);
	FadeStand("buあやせ_制服_通常_smile", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
なにが“でも”なのかは分からないけど、あやせは梨深を牽制するように、僕の頬に手を伸ばしてきてそっと撫でた。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/22000590ay">
「じゃあね、拓巳」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH14", 2000, 0, null);

	DeleteStand("buあやせ_制服_通常_smile", 500, true);

	Wait(500);

	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE01", 1000, 500, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
妖艶に微笑んで、先に階段を上っていく。
僕は訳も分からず呆然とそれを見送った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_通常","hard", 200, @-240);
	FadeStand("st梨深_制服_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000600ri">
「タク、鼻の下伸びてる」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/22000610ta">
「え……」

慌てて口許を手で覆った。

{	Stand("st梨深_制服_通常","smile", 200, @-240);
	FadeStand("st梨深_制服_通常_smile", 300, true);
	DeleteStand("st梨深_制服_通常_hard", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000620ri">
「あはは。冗談」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("back10", 100, center, middle, "SCREEN");
	DeleteStand("st梨深_制服_通常_smile", 0, true);

//ＢＧ//廊下
	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");
	DrawTransition("back03", 500, 0, 1000, 100, null, "cg/data/right3.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");

	Stand("st梨深_制服_正面","normal", 200, @+320);
	FadeStand("st梨深_制服_正面_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
教室の前まで来たところで、

//以下、梢は普通に喋っています。心の声ではありません
//【梢】
<voice name="梢" class="梢" src="voice/ch10/22000630ko">
「拓巳しゃーん！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梢_制服_通常","smile", 200, @-320);
	FadeStand("st梢_制服_通常_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601012]
こずぴぃが、廊下の先からはち切れんばかりの笑顔で突進してきた。

{	CreateSE("SE10","SE_衝撃_せ中を押される");
	MusicStart("SE10", 0, 700, 0, 1000, null, false);
	Move("st梢_制服_通常_smile", 500, @0, @+300, Dxl2, false);
	DeleteStand("st梢_制服_通常_smile", 300, true);
	CreateSE("SE11","SE_じん体_動作_尻餅");
	MusicStart("SE11", 0, 600, 0, 1000, null, false);
	Stand("st梨深_制服_通常","shock", 200, @+320);
	DeleteStand("st梨深_制服_正面_normal", 500, false);
	FadeStand("st梨深_制服_通常_shock", 500, true);}
でも教室から出てきた男子と激突し、派手に尻餅をつく。

こずぴぃは涙目になりながらその男子に謝り、それからやっとのことで僕のところへやって来た。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 2000, 0, null);

	Stand("st梢_制服_通常","sad", 200, @-100);
	FadeStand("st梢_制服_通常_sad", 500, true);

	BGMPlay360("CH03",0,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602012]
//【梢】
<voice name="梢" class="梢" src="voice/ch10/22000640ko">
「おはようさんさーんなの……」

{	Stand("st梨深_制服_通常","hard", 200, @+320);
	FadeStand("st梨深_制服_通常_hard", 300, true);
	DeleteStand("st梨深_制服_通常_shock", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000650ri">
「怪我はない？　廊下を走っちゃダメだよ、こずぴぃ」

{	Stand("st梢_制服_通常","shy", 200, @-100);
	FadeStand("st梢_制服_通常_shy", 0, true);
	DeleteStand("st梢_制服_通常_sad", 0, true);}
//【梢】
<voice name="梢" class="梢" src="voice/ch10/22000660ko">
「うにゅ～」

こずぴぃはモジモジとした。
それから上目遣いで僕の顔を見つめてくる。

//【梢】
<voice name="梢" class="梢" src="voice/ch10/22000670ko">
「拓巳しゃんに、はやーく教えたかったのら」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/22000680ta">
「教えるって、なにを？」

//【梢】
<voice name="梢" class="梢" src="voice/ch10/22000690ko">
「うんとね、<?>
{	Stand("st梢_制服_通常","smile", 200, @-100);
	FadeStand("st梢_制服_通常_smile", 300, true);
	DeleteStand("st梢_制服_通常_shy", 0, true);}
ほらっ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("back10", 100, center, middle, "SCREEN");
	DeleteStand("st梨深_制服_通常_hard", 0, false);
	DeleteStand("st梢_制服_通常_smile", 0, true);

//ＢＧ//廊下
	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");
	DrawTransition("back03", 500, 0, 1000, 100, null, "cg/data/right3.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
こずぴぃが、たった今自分が走ってきた方を指差す。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stセナ_制服_横向","hard_r", 200, @320);
	FadeStand("stセナ_制服_横向_hard_r", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601013]
よく見ると、壁に寄りかかるようにして、セナが立っていた。

腕を組み、やたらと不機嫌そうな表情を顔に貼り付けている。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000700ri">
「セナさん、退院したんだー」

セナはこの２ヶ月、ずっと入院していた。
諏訪にやられた精神攻撃をずっと引きずっていたんだ。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/22000710sn">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	DeleteStand("stセナ_制服_横向_hard_r", 500, true);
	Stand("buセナ_制服_通常","hard", 200, @+320);
	FadeStand("buセナ_制服_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602013]
セナは顔を上げると、僕らの方へとゆっくりと歩み寄ってきた。
相変わらず怖い。

なんにもしてないのにいきなりビンタをかましてきそうな、そんなオーラをまとっている。

僕は週に二度はセナのお見舞いに行っていたけど、どれだけこっちが話を振っても、結局最後まで一言も口を利いてくれなかったなあ。あれは拷問にも似た気まずさだった。

もしかしたら激しく嫌われているのかもしれない。
セナは、苦手だ……。

僕とセナの間に流れる、張り詰めた緊張感。
というか一方的に僕がビビってるだけなんだけど。

//【梢】
<voice name="梢" class="梢" src="voice/ch10/22000720ko">
「というわーけで！　今日学校が終わったら、退院のおいわーいをしよしよっ」

こずぴぃひとりだけが、はしゃいだ様子を見せる。
こ、この雰囲気でお祝いもクソもないような気が……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("buセナ_制服_通常","normal", 200, @+320);
	FadeStand("buセナ_制服_通常_normal", 300, true);
	DeleteStand("buセナ_制服_通常_hard", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/22000730sn">
「おい、西條」

そこでようやくセナが口を開いた。
ギクッとする。目を合わせられない。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/22000740sn">
「これを」

と、セナがなにかを差し出してきた。
それは“あたり”と書かれた小さな棒。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/22000750ta">
「……？」

//【梢】
<voice name="梢" class="梢" src="voice/ch10/22000760ko">
「あ、ガルガリ君の当たり棒なのら」

{	Stand("buセナ_制服_横向","shy", 200, @+320);
	DeleteStand("buセナ_制服_通常_normal", 500, false);
	FadeStand("buセナ_制服_横向_shy", 500, true);}
困惑しつつ、それを受け取った。
セナはすぐにプイとそっぽを向き。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/22000770sn">
「お前に、言いたいことがある」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/22000780ta">
「な、なんでしょう……？」

//◆切ないブレス
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/22000790sn">
「…………」

なんだか、セナの頬が桜色に染まっているように見えるのは気のせいだろうか。

{	SetVolume360("CH03", 500, 0, null);
	Stand("buセナ_制服_照れ","shy", 200, @+320);
	DeleteStand("buセナ_制服_横向_shy", 500, false);
	FadeStand("buセナ_制服_照れ_shy", 500, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/22000800sn">
「お、お前のことが……好きだ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/22000810ta">
「…………へ？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	DeleteStand("buセナ_制服_照れ_shy", 500, true);

	if(#下着パッチ==true)
	{
		CreateTexture("梨深", 200, Center, InBottom, "ex/bu/bu梨深_制服_通常_下着_shock_lip02.png");
	}else{
		CreateTexture("梨深", 200, Center, InBottom, "cg/bu/bu梨深_制服_通常_shock_lip02.png");
	}
	Fade("梨深", 0, 0, null, true);

	Move("梨深", 0, @192, @136, null, false);
	Stand("bu梢_制服_正面","normal", 180, @-240);
	Fade("梨深", 500, 1000, null, false);
	FadeStand("bu梢_制服_正面_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
//◆あ然としてブレス
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000820ri">
「…………」

//【梢】
<voice name="梢" class="梢" src="voice/ch10/22000830ko">
「うぴ？」

いきなりの告白に、僕だけじゃなくて梨深もこずぴぃもぽか～んとしてしまった。

一瞬、からかわれたかと思ったけど、セナはそんな冗談を言うキャラじゃない。

ということは……ｍｊｄ？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 1000, 0, NULL);
	SetVolume("SE10", 1000, 0, NULL);
	BGMPlay360("CH05", 1000, 1000, true);
	CreateTexture360("back10", 100, center, middle, "SCREEN");
	DeleteStand("bu梢_制服_正面_normal", 0, true);
	Delete("梨深");
	CreateBG(100, 500, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");
	Stand("buセナ_制服_照れ","smile", 200, @+320);
	FadeStand("buセナ_制服_照れ_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601015]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/22000840sn">
「何度も、お見舞いに来てくれて……嬉しかったんだ……」

{	Stand("buセナ_制服_横向","hard_r", 200, @+320);
	DeleteStand("buセナ_制服_照れ_smile", 500, false);
	FadeStand("buセナ_制服_横向_hard_r", 500, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/22000850sn">
「い、言わせるな、このバカが！」

勝手にデレて、勝手にツンに戻っている。
いやしかし、いきなりそんなこと言われても……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("buセナ_制服_横向_hard_r", 500, true);
	Stand("st梨深_制服_通常","shock", 200, @+290);
	Stand("stセナ_制服_通常","normal", 200, @+0);
	Stand("st梢_制服_正面","normal", 200, @-260);
	FadeStand("st梨深_制服_通常_shock", 500, false);
	FadeStand("stセナ_制服_通常_normal", 500, false);
	FadeStand("st梢_制服_正面_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000860ri">
「ええええええ！？」

ワンテンポ遅れて、梨深が驚きの声をあげる。
こずぴぃはまだ状況を理解していないのか、目を白黒させている。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/22000870sn">
「なんだ、咲畑。異論があるのか」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22000880ri">
「ありまくりだよっ！　そんな、えーとえーと、と、とにかくダメだって！」

//【梢】
<voice name="梢" class="梢" src="voice/ch10/22000890ko">
「？？？？」

梨深やこずぴぃは激しく混乱しているけど、一番困惑してるのは僕だよ。
まさかそんな宣言されるなんて。

{	SetVolume360("CH05", 5000, 0, NULL);}
いったいどんなリアクションを取ればいいのか分からなくて、僕は窓の外の、透明な空を見上げた。

なんだか、新学期が始まって早々、ドタバタした１日になったなあ。

この平穏で、楽しくなりそうな時間が、これから毎日のように続くんだろうか。

――続いてほしいな。

僕は心からそう願って。

ふと、窓に映った自分の顔を見た。

そこに映っているのは。

僕じゃなくて。

皺だらけの――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	CreateTexture360("back01", 100, center, middle, "SCREEN");

	DeleteStand("st梨深_制服_通常_shock", 0, false);
	DeleteStand("stセナ_制服_通常_normal", 0, false);
	DeleteStand("st梢_制服_正面_normal", 0, true);

//ＳＥ//心臓の鼓動「ドクン」
//ＳＥ//舞台の照明が切られるような音「ガシャン」
//ＢＧ//黒

	CreateSE("SE01","SE_じん体_心臓_鼓動");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	WaitAction("SE01", null);

	CreateSE("SE02","SE_擬音_妄そうOUT");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	CreateColor("back10", 100, 0, 0, 1280, 720, "Black");
	Fade("back10", 0, 0, null, false);
	Fade("back10", 100, 1000, null, true);

	CreateMovie360("ムービー", 100, Center, Middle, true, false, "dx/mvPC00.avi");
	Fade("ムービー", 0, 0, null, false);

//	Request("ムービー", Play);

	Fade("ムービー", 1000, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
色が、光が、消えた。

僕は真っ暗な空間で、膝を抱えている。

目の前には、この空間の唯一の光源。

モニタのような、窓のような、枠のようなもの。

その中で、梨深と、セナと、こずぴぃが、楽しそうになにかを喋っている。声は聞こえてこない。

それを見つめる僕は。
感情が完璧に凪いでいて。
あるいは、心が死んでいるのかもしれなくて。

気付く。

見ていたのは、僕の妄想。
逃げ込んだ、二次元の世界。
完全なる幻。

いつから、妄想だった？

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/22000900nr">
「最初からですよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("back03", 100, 0, 0, "cg/ev/ev104_01_6_野呂瀬足_a.jpg");
	Fade("back03", 1000, 1000, null, true);

	Delete("ムービー");

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
背後を振り向く。
野呂瀬が立っていた。
でも暗くて、足しか見えない。

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/22000910nr">
「諏訪くんに、心を殺されたではありませんか」

あのときから、ずっと、僕は妄想を……？

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/22000920nr">
「君のＣＯＤＥサンプルは採取できました。もう用済みですから、いつでも塵に還ってもらって結構です」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/22000930ta">
「…………」

なにも感じない。
心が死んだんだから。
なにも感じないはずなのに。

一筋、涙が頬をつたった。

僕は、最後の最後で、負け犬に戻ったんだ。辛い現実から、逃げたんだ。

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/22000940nr">
「最後に幸せな夢を見られて、よかったですね」

僕は、結局、価値のない人間だった。

ごめん、梨深。

謝っても、なぜ謝らなくちゃいけないのか、もうよく分からなくなっていた。
罪悪感も、感じなかった。

そして僕は、さっきの妄想の続きに戻ることにした。
そのうち、誰かが僕のことを殺してくれるだろう。

だからそれまで、逃避した世界で幸せに浸りたかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	ClearAll(2000);

	Wait(2000);

//～～Ｆ・Ｏ

}