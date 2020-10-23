//<continuation number="240">

chapter main
{

	$PreGameName = "boot_優愛ルート";

	if($GameStart != 1)
	{
		$GameName = "chy_166_優愛編_さよなら";
		$GameContiune = 1;
		$優愛ルート=true;
		$RouteON=true;
		Reset();
	}

	chy_166_優愛編_さよなら();
}


function chy_166_優愛編_さよなら()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★優愛編
//ＢＧ//１０７//渋谷崩壊後
	CreateSE("SE01","SE_はいけい_崩壊しぶ谷_107前_LOOP");
	MusicStart("SE01", 2000, 1000, 0, 1000, null, true);

	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg001_02_5_崩壊渋谷_a.jpg");
	Fade("back01", 0, 0, null, true);
	Fade("back01", 1000, 1000, null, true);

	Wait(1000);

	Move("back01", 6000, @0, @-800, DxlAuto, true);

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
美愛に支えてもらいながら、渋谷駅の方を目指して歩く。

渋谷は、死の街と化していた。

あちこちに、死体が転がっている。血まみれだったり、四肢が切断されていたり、頭が押し潰されていたり、そんな、人の尊厳もクソもない地獄絵図が広がっていた。

かつてのきらびやかな街のイメージはどこにもなく。
そこにあるのは死と灰燼と絶望だけ。

道路のアスファルトには大きな裂け目ができていて、いつ崩落してもおかしくなかった。

崩れたビルから落ちてきた巨大な瓦礫が、行く手を塞いでいて、まっすぐ歩くことすら困難だった。

{	CreateSE("SE3601","SE_はいけい_瓦礫_踏む足音_LOOP");
	MusicStart("SE3601",0,1000,0,1000,null,true);}
それでも、僕も美愛も脇目もふらず、周囲からの救いを求める声も無視して、ひたすら歩き続けた。
遠くにそびえ立つのが見える、コーネリアスタワーへ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE3601", 1500, 700, null);
	SetVolume("SE01", 1500, 300, null);
//ＢＧ//夜空
	CreateTexture360("back02", 100, 0, 0, "cg/bg/bg206_01_3_夜空_a.jpg");
	Fade("back02", 0, 0, null, true);
	Fade("back02", 1000, 1000, null, true);

	Delete("back01");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
タワーは、健在だった。

ところどころ、外壁が崩れかけていたりするけど、あの地震を耐え抜き、ちゃんとまっすぐに建っている。

外から見上げる限り、全ての部屋の明かりは消えていた。
もしかしたらみんな避難して、無人なのかもしれない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE3601", 1500, 0, null);
	SetVolume("SE01", 1500, 0, null);

//ＢＧ//黒
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 1000, 1000, null, true);

	Wait(1000);

	Delete("back02");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
ロビーには案の定、誰もいなくて、電気が来ていないらしく、エレベーターも動かなかった。
仕方なく、非常階段で屋上へ向かうことにした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//コーネリアスタワー階段
//↑セナ編のＢＧ「希ビル非常階段」の流用でもいいかもです
//通常照明ではなく赤い非常灯のみとかの差分にしてもらえると最高です
	CreateSE("SE02","SE_じん体_動作_足_階だん歩く");
	MusicStart("SE02", 0, 1000, 0, 1000, null, true);

	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg219_01_6_chnコーネリアス階段_a.jpg");

	DrawTransition("Black", 1000, 1000, 0, 100, null, "cg/data/right3.png", true);
	Delete("Black");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
コーネリアスタワーは地上４１階建てだ。高さは１８４メートル。
『集団ダイブ』の事件をネットで見たとき、ついでに調べておいたんだ。

それだけの高さを、階段で上ろうなんて、無茶な話だった。
まして、僕は頭痛でまともに歩けないのに。

それでも、美愛は僕を支えながら、汗だくになりつつ階段を一歩一歩、上り続けた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常左手下_メガネなし","worry", 200, @+100);
	FadeStand("bu優愛_制服_通常左手下_メガネなし_worry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01400010ma">
「お父さんとお母さんは、わたしが、自分のこと優愛ちゃんだって言い出して、気を遣ってくれたんだと思う」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01400020ma">
「わたしを優愛として扱って、美愛が死んだことにしたのかも」

それは美愛の独り言。
僕は黙って聞くだけ。

いや、聞く必要すらないのかも。
美愛だって、僕に聞いてもらいたくて話してるわけじゃない気がする。

{	Stand("bu優愛_制服_通常左手下_メガネなし","shy", 200, @+100);
	FadeStand("bu優愛_制服_通常左手下_メガネなし_shy", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_メガネなし_worry", 0, true)}
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01400030ma">
「昔から、そうだった。わたしは、生意気な娘だったから」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01400040ma">
「両親はいつも、わたしを、腫れ物にでも触るかのように扱ったわ」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01400050ma">
「美愛を死んだことにするなんてね。親は、優愛ちゃんより美愛に死んでほしかったのかもしれない」

{	Stand("bu優愛_制服_通常左手下_メガネなし","hard", 200, @+100);
	FadeStand("bu優愛_制服_通常左手下_メガネなし_hard", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_メガネなし_shy", 0, true)}
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01400060ma">
「それも全部、わたしのせいだけど。自分が優愛ちゃんだと思い込んだ、わたしのせいよ」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01400070ma">
「優愛ちゃんが死んだみたいに、わたしも死ねばいいのよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01400080ta">
「ゆ、優愛は、ど、どんな人だったの……？」

{	Stand("bu優愛_制服_通常左手下_メガネなし","worry", 200, @+100);
	FadeStand("bu優愛_制服_通常左手下_メガネなし_worry", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_メガネなし_hard", 0, true)}
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01400090ma">
「……憧れ、だった。うらやましかった。たまに苛ついたりしたけど、嫌いじゃなかった」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01400100ma">
「むしろ……大好きだった。優愛ちゃんのこと、大好きだった……。わたしのことを分かってくれる、たった１人の、かけがえのない人だったもの……」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01400110ma">
「優愛ちゃんが笑顔でいてくれれば、わたしはどんなに辛いことがあっても、嬉しかった」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01400120ma">
「いつもわたしのこと、心配してくれたわ。心配させてるのが申し訳なくて、わたしは、つい冷たく接してた。それなのに、いつも優しくて……」

{	Stand("bu優愛_制服_通常左手下_メガネなし","sad", 200, @+100);
	FadeStand("bu優愛_制服_通常左手下_メガネなし_sad", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_メガネなし_worry", 0, true)}
//◆泣く
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01400130ma">
「優愛ちゃん……うっ、うう……」

美愛は階段を上りながら、静かに涙を流した。
後悔の涙か、哀しみの涙か、罪の意識による涙か。
僕には、分からなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 500, 1000, null, true);


	Wait(1000);

	DeleteStand("bu優愛_制服_通常左手下_メガネなし_sad", 0, true)
	Delete("back03");
//ＢＧ//コーネリアスタワー屋上//夜
	SetVolume("SE02", 0, 0, null);
	
	CreateSE("SE03","SE_日常_おーふろんと屋上扉開ける");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	CreateSE("SE04","SE_自然_風音_LOOP");
	Wait(1500);
	MusicStart("SE04", 1000, 1000, 0, 1000, null, true);

	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg220_01_3_chnコーネリアス屋上_a.jpg");

	FadeDelete("Black", 1000, true);

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
屋上のヘリポートは、予想以上に風が強かった。

３６０度、渋谷の夜景を見渡せる大パノラマだけど、今、そのキレイなはずの夜景は見当たらない。眼下に広がるのは、闇ばかり。

かろうじて、遠くに東京タワーや六本木ビルズ、あとは新宿方面のビル群が見えるけど。

真下にある渋谷は、完全に沈黙している。

明かりはほとんどなくて、闇が、崩壊した街の姿を隠してくれているんだ。

もしもこれが昼だったら、渋谷の変わり果てた姿に、愕然としちゃうだろう。

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01400140ma">
「西條くん。もしよかったら……」

美愛が、支えてくれていた腕をそっと離した。
僕はその場に、力なくへたり込む。

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01400150ma">
「一緒に、飛んでくれない？」

美愛は、まっすぐに闇夜を見つめたままだ。
激しい風がその長い髪をはためかせているせいで、彼女がどんな表情をしているのかはよく分からなかった。

美愛が、飛ぶためにここに来たのは気付いていた。
姉の後を追うつもりだ。
そして僕の答えは、決まっていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01400160ta">
「い、イヤだね。ぼ、僕は、死にたくない。なんで、ぼ、僕を監禁した女と、し、心中しなくちゃ、いけないんだ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常左手下_メガネなし","smile", 200, @+100);
	FadeStand("bu優愛_制服_通常左手下_メガネなし_smile", 300, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01400170ma">
「……そう言うと思った」

{	DeleteStand("bu優愛_制服_通常左手下_メガネなし_smile", 300, true);}
美愛は風に煽られてふらつきながら、一歩ずつ、ヘリポートの縁へと向かって進み出した。

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01400180ma">
「そうそう、西條くんと予約しにいった、星来ちゃんのフィギュア」

ふと立ち止まり、振り返って。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常左手下_メガネなし","normal", 200, @+100);
	FadeStand("st優愛_制服_通常左手下_メガネなし_normal", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01400190ma">
「ちゃんと、買ったのよ」

{	Stand("st優愛_制服_通常左手下_メガネなし","shy", 200, @+100);
	FadeStand("st優愛_制服_通常左手下_メガネなし_shy", 300, true);
	DeleteStand("st優愛_制服_通常左手下_メガネなし_normal", 0, true);}
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01400200ma">
「とてもかわいくて、セクシーだね。すっかり気に入っちゃって、わたしの部屋の机の上に、飾ってあるの」

美愛は、儚い笑みを浮かべていた。
なんで今、そんなこと、話すんだ……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01400210ta">
「そ、そんなこと言っても、ぼ、僕は、君に、同情しない」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01400220ma">
「同情なんて、求めてないわ」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01400230ma">
「それじゃ、さよなら、西條くん。わたしを殺した人」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01400240ma">
「わたしも、優愛ちゃんのところに行くね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE*", 2000, 0, null);
	Wait(2000);

//アイキャッチ

//～～Ｆ・Ｏ
}


