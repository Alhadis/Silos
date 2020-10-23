//<continuation number="970">




chapter main
{

	$PreGameName = "boot_第九章";

	if($GameStart != 1)
	{
		$GameName = "ch09_189_インターミッション４６";
		$GameContiune = 1;
		Reset();
	}

		ch09_189_インターミッション４６();
}


function ch09_189_インターミッション４６()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//合流４
//アイキャッチ
//■インターミッション４６

//ＢＧ//ＡＨ総合病院・正面玄関//夜
	IntermissionIn();

	Delete("*");

	CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg097_01_3_ＡＨ病院外観_a.jpg");
	Fade("back04", 0, 1000, null, true);


	IntermissionIn2();

	CreateSE("SE10","SE_日常_消ぼうきゅう急車_サイレン遠く_LOOP");
	MusicStart("SE10", 1000, 700, 0, 1000, null, true);

	CreateSE("SE11","SE_自然_風音_LOOP");
	MusicStart("SE11", 1000, 400, 0, 1000, null, true);

	Wait(1000);

	Stand("st優愛_制服_通常左手下","hard", 200, @+150);
	FadeStand("st優愛_制服_通常左手下_hard", 500, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
ＡＨ東京総合病院の正面玄関。
楠優愛は、その自動ドアの奥をじっと見据えていた。

判刑事から“すぐに帰れ”と言われ、やむなく外に出たものの、彼のことが気になってその場から動けなかった。

判は謎の人影を追って病院の上階へと姿を消してしまった。
それからまだ３分も経っていないが、優愛は判が戻ってきてくれないかと、ロビーの様子を窺う。

判が病院へひとりで向かった後。
優愛は百瀬の制止を振り切って、追いかけてきた。
それは、妹の死の真相、そして真犯人に一歩でも近づくためだ。

判に“手を引け”という脅迫電話をかけ、判の後輩――諏訪さんと言うらしい――を拉致した人物。おそらくその人物が、妹の美愛を殺した人間。

優愛にはそんな予感があった。
だから衝動的な気持ちを抑えきれなかった。

判からは“この事件に関わることは危険だ”と散々忠告されていたにもかかわらず、ここまで来てしまった。

もっとも、優愛がここに来たところでなにができるわけでもない。しょせん、彼女はただの無力な女子高生でしかないのだ。

判が颯爽と犯人を捕まえて戻ってこないだろうか、と優愛は期待する。
そのとき、犯人に直接問い詰めるチャンスが来る。

“なぜ妹を殺さなければいけなかったのですか？”

それが、優愛がどうしても聞きたい問い。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900010yu">
「……？」

そのとき、ふと視線を感じた。
{	DeleteStand("st優愛_制服_通常左手下_hard", 500, true);}
優愛は不安を覚えて周囲を見回す。

まだ日が暮れて２時間も経っていないが、病院の正面玄関は不気味なほど静まり返っている。

{	CreateColor("back10", 500, 0, 0, 1280, 720, "Black");
	DrawTransition("back10", 500, 0, 1000, 100, null, "cg/data/right2.png", false);}
すぐ横には時間外出入口があった。救急患者の搬入口でもあるのだが、そこにも人の気配はない。

病院のすぐ横を、電車が徐行しながら走っている。だが病院前の広い道を走る車の数はほとんどなく、歩行者は皆無。

眠らない街である渋谷と新宿に挟まれたこの場所は、まるでふたつの強烈な光によって生まれた闇。

視線の正体らしき人影は、どこにも見つけられなかった。
優愛は緊張を抑えるように手を胸に置き、小さく息をつく。
それから何気なく病棟の方へと目をやった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_衝撃_衝撃音01");

	Stand("st美愛_私服_通常左手下","normal", 200, @-150);
	FadeStand("st美愛_私服_通常左手下_normal", 0, false);


	Wait(500);
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);


	Fade("back10", 0, 0, null, false);
	Delete("back10");

	Wait(2500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900020yu">
「あ……」

そこに、ひとりの少女が立っていた。

病棟の入り口はすでに明かりが消えて薄暗い。
それなのに、少女の姿はやけにはっきりとその暗がりの中に浮かび上がっている。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900030yu">
「美愛ちゃん……？」

思わず、優愛はそうつぶやいていた。
あり得ないことだと理性では分かっていたが、声に出さずにはいられなかった。

少女の姿は、自身とうり二つ。
今はすでにこの世にいない双子の妹とも、うり二つ。

しかも少女が着ている服には、見覚えがあった。
それは確かに、妹の服だった。

幽霊でも見ているんだろうかと考えると、全身の産毛が逆立つような恐怖を覚えた。

{	CreateSE("SE01","SE_日常_びょういん_自動どあ開く");
	MusicStart("SE01", 0, 500, 0, 1000, null, false);
	DeleteStand("st美愛_私服_通常左手下_normal", 500, true);}
少女は不意にその場で踵を返し、病棟の玄関である自動扉へと向かう。
少女が近づくと、自動扉は静かに開いた。

――幽霊じゃない。

優愛は呆然となる。
とっさに、少女を追うように病棟に向かって駆け出していた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE10", 1000, 0, NULL);
	SetVolume("SE11", 1000, 0, NULL);

	CreateSE("SE02","SE_じん体_動作_足_走る_START");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	SetVolume("SE02", 1000, 0, NULL);
//ＢＧ//ＡＨ東京総合病院・廊下//夜
	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg099_01_3_AH廊下_a.jpg");
	DrawTransition("back03", 500, 0, 1000, 100, null, "cg/data/right2.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg099_01_3_AH廊下_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
病棟内は、すでに消灯時間が過ぎているのか、外よりもさらに静まり返っている。

{	CreateSE("SE03","SE_じん体_動作_足_歩く");
	MusicStart("SE03", 0, 500, 0, 1000, null, false);
	SetVolume("SE03", 5000, 0, NULL);}
優愛が歩く度に、その靴音が廊下のはるか先まで反響した。
さっきの外来棟もそうだったが、静かすぎるのが逆に不気味に思えてくる。

少女の気配は、階上へと消えた。
かすかに笑い声のようなものも聞こえた。

まるで怪談によくあるシーン……

{	CreateSE("SE02","SE_じん体_動作_足_階だん歩く");
	MusicStart("SE02", 0, 500, 0, 1000, null, false);
	SetVolume("SE02", 5000, 0, NULL);
	CreateColor("back04", 100, 0, 0, 1280, 720, "Black");
	DrawTransition("back04", 500, 0, 1000, 100, null, "cg/data/right2.png", true);}
優愛はそう思いながら、ゆっくりと、一歩ずつ慎重に階段を上っていった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg099_01_3_AH廊下_a.jpg");
	DrawTransition("back03", 500, 0, 1000, 100, null, "cg/data/right2.png", true);
	SetVolume("SE02", 500, 0, NULL);
	CreateBG(100, 0, 0, 0, "cg/bg/bg099_01_3_AH廊下_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
２階に出る。
廊下を見渡すが、やはり誰もいない。

目の錯覚だったのだろうかといぶかしんでいると、

//ＶＦ//かなり遠くからの声。廊下で反響しまくり
//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900040ma">
「ふふ……あははは」

上の階から、女性の笑い声。
その声、その笑い方を、優愛は過去に何度も聞いたことがあった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_じん体_動作_足_階だん歩く");
	MusicStart("SE02", 0, 500, 0, 1000, null, false);
	SetVolume("SE02", 3000, 0, NULL);
	CreateColor("back04", 100, 0, 0, 1280, 720, "Black");
	DrawTransition("back04", 500, 0, 1000, 100, null, "cg/data/right2.png", true);
	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg099_01_3_AH廊下_a.jpg");
	DrawTransition("back03", 500, 0, 1000, 100, null, "cg/data/right2.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg099_01_3_AH廊下_a.jpg");
	SetVolume("SE01", 0, 0, NULL);
	Delete("back04");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
３階へ上った優愛が、廊下へと目をやると、そこに――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st美愛_私服_通常左手下","normal", 200, @-250);
	FadeStand("st美愛_私服_通常左手下_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603003]
優愛と同じ顔を持つ、少女が立っていた。

{	BGMPlay360("CH13", 2000, 1000, true);}
//◆※美愛は優愛と同じ声優さんでお願いします。美愛の方が性格がキツい
//美愛は「優愛の立ち絵（メガネなし）」＋私服で。
//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900050ma">
「ふふ……」

ニュージェネ第一の事件『集団ダイブ』で死んだ５人のうちのひとり。
２ヶ月前に死んだはずの妹。

楠美愛が、確かな存在感をもってそこに立っている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常左手下","shock", 200, @+250);
	FadeStand("st優愛_制服_通常左手下_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604003]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900060yu">
「うそ……」

優愛は一度メガネを外して目を擦った。
だが、メガネをかけ直してみても、やはり美愛はそこにいた。

{	Stand("st優愛_制服_通常","shock", 200, @+250);
	DeleteStand("st優愛_制服_通常左手下_shock", 500, false);
	FadeStand("st優愛_制服_通常_shock", 500, true);}
//◆優愛は美愛に対してはタメ口
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900070yu">
「美愛ちゃん……なの？」

{	Stand("st美愛_私服_通常","normal", 200, @-250);
	DeleteStand("st美愛_私服_通常左手下_normal", 500, false);
	FadeStand("st美愛_私服_通常_normal", 500, true);}
//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900080ma">
「どう思う？」

幻聴とは思えないほどにクリアな声。

不敵な笑みを浮かべているその表情。

まさしく優愛の記憶にある美愛のものだった。

美愛はいつもそうだった。自分が悪者になるために、よくそうやって嗤っていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常","sad", 200, @+250);
	FadeStand("st優愛_制服_通常_sad", 300, true);
	DeleteStand("st優愛_制服_通常_shock", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900090yu">
「美愛ちゃん……」

{	Stand("st美愛_私服_通常左手下","normal", 200, @-250);
	DeleteStand("st美愛_私服_通常_normal", 500, false);
	FadeStand("st美愛_私服_通常左手下_normal", 500, true);}
//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900100ma">
「本当に、わたしが美愛で、あなたが優愛、だと思う？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900110yu">
「……どういう、こと？」

{	Stand("st美愛_私服_通常左手下","hard", 200, @-250);
	FadeStand("st美愛_私服_通常左手下_hard", 300, true);
	DeleteStand("st美愛_私服_通常左手下_normal", 0, true);}
//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900120ma">
「もし、逆だったら？」

//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900130ma">
「あなたは、美愛。死んだのは、優愛。殺したのは、あなた」

{	Stand("st優愛_制服_通常","worry", 200, @+250);
	FadeStand("st優愛_制服_通常_worry", 300, true);
	DeleteStand("st優愛_制服_通常_sad", 0, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900140yu">
「な、なにを、言っているの……？」

//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900150ma">
「あなたは、親に愛される姉が疎ましくて、ネットで、殺人を依頼したのよ」

//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900160ma">
「しかも、自殺に見せかけるように、見ず知らずの４人も、一緒に飛び降りさせた」

//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900170ma">
「あなたは、姉になりすまして、妹の死を悲しみ、涙を流しているフリをしながら、これまで姉が独占していた親の愛を、手に入れて、心の中ではほくそ笑んでいる――」

{	Stand("st優愛_制服_通常","shock", 200, @+250);
	FadeStand("st優愛_制服_通常_shock", 300, true);
	DeleteStand("st優愛_制服_通常_worry", 0, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900180yu">
「ち、違う、違うわ……っ」

{	Stand("st優愛_制服_通常左手下","worry", 200, @+250);
	DeleteStand("st優愛_制服_通常_shock", 500, false);
	FadeStand("st優愛_制服_通常左手下_worry", 500, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900190yu">
「わたしは、優愛よ……」

//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900200ma">
「誰が、それを証明するの？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900210yu">
「わたしは、優愛……のはず」

{	Stand("st美愛_私服_通常左手下","normal", 200, @-250);
	FadeStand("st美愛_私服_通常左手下_normal", 300, true);
	DeleteStand("st美愛_私服_通常左手下_hard", 0, true);}
//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900220ma">
「でも、確信が持てない」

{	Stand("st優愛_制服_通常","worry", 200, @+250);
	DeleteStand("st優愛_制服_通常左手下_worry", 500, false);
	FadeStand("st優愛_制服_通常_worry", 500, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900230yu">
「わたしを、わたしだと証明するものって、なに？」

//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900240ma">
「顔？　名前？　記憶？」

{	Stand("st優愛_制服_通常","sad", 200, @+250);
	FadeStand("st優愛_制服_通常_sad", 300, true);
	DeleteStand("st優愛_制服_通常_worry", 0, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900250yu">
「自分のことなのに……」

//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900260ma">
「自分で自分を証明するなんて、不可能よ」

{	Stand("st優愛_制服_通常","worry", 200, @+250);
	FadeStand("st優愛_制服_通常_worry", 300, true);
	DeleteStand("st優愛_制服_通常_sad", 0, true);}
//◆※ここはわざと「美愛ちゃん」とは呼びません
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900270yu">
「わたしが、美愛だっていう可能性も、あるの……？」

//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900280ma">
「あなたは、いろいろと調べていたじゃない」

{	Stand("st美愛_私服_通常左手下","hard", 200, @-250);
	FadeStand("st美愛_私服_通常左手下_hard", 300, true);
	DeleteStand("st美愛_私服_通常左手下_normal", 0, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900290yu">
「多重人格……夢遊病……」

//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900300ma">
「記憶捏造、それから……妄想」

優愛自身がこれまでに調べてきた事柄が、“記憶”あるいは“思い出”というものの曖昧さを、現実として突きつけてくる。

自分が分からなくなる――
自分って、なに？

優愛は頭を抱え、いやいやをするように首を振った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――


//※同時音声出し可能なら、テキスト表示は以下のようにしようかと思うのですがいかがでしょう？
//美愛のセリフ→画面中央に表示
//優愛のセリフ→メッセージウインドウに通常通り表示
//他にもっと適切なアイデアがあればそちらに変更します

	Delete("@text004");

	PrintBG(100);

	CreateColor("back04", 200, 0, 0, 1280, 720, "Black");
	Fade("back04", 0, 0, null, false);
	Fade("back04", 100, 1000, null, true);

		if(#SYSTEM_auto_text_break_voice){
			Fade("Config1a_SVoiceOFF02",0,1000,null,false);
		}else{
			Fade("Config1a_SVoiceON02",0,1000,null,false);
		}

	CreateVOICE("美愛","ch09/18900320ma");
//	CreateVOICE("優愛","ch09/18900310yu");


//【美愛】
//<voice name="美愛" class="美愛" src="voice/ch09/18900320ma">
//「あなたは、誰？」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 200, center, Middle, Auto, Auto, "「あなたは、誰？」");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);


	SetBacklog("「あなたは、誰？」", "voice/ch09/18900320ma", 美愛);
	SetBacklog("「わたしは、誰？」", "voice/ch09/18900310yu", 優愛);

	SoundPlay("美愛",0,1000,false);
//	SoundPlay("優愛",0,1000,false);

//以下のセリフ、同時に音声出したいです
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900310yu">
「わたしは、誰？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
//	TypeBegin10();//――――――――――――――――――――――――――――――
	Request("@text005", NoLog);
	TypeBeginEX();//――――――――――――――――――――――――――――――



				if(#SYSTEM_click_break_voice){
//				SoundStop2("優愛");
				SoundStop2("美愛");
				}
				else{
				}


	FadeDelete("テキスト１", 0, false);
	FadeDelete("back04", 300, true);

//以上のセリフ、同時に音声出したいです

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
いつもいい子ぶって、親に自動的に誉められ自動的に愛されてきた優愛なのか。

いつも悪い子ぶって、親に能動的に嫌われ、自業自得なのに、姉に羨望と憎悪の眼差しを向けてきた美愛なのか。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


	CreateColor("back04", 200, 0, 0, 1280, 720, "Black");
	Fade("back04", 0, 0, null, false);
	Fade("back04", 100, 1000, null, true);

	CreateVOICE("美愛２","ch09/18900340ma");
//	CreateVOICE("優愛２","ch09/18900330yu");
//	SoundStop2("優愛");
	SoundStop2("美愛");

//【美愛】
//<voice name="美愛" class="美愛" src="voice/ch09/18900340ma">
//「さあ、あなたも」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 200, center, Middle, Auto, Auto, "「さあ、あなたも」");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);


	SetBacklog("「さあ、あなたも」", "voice/ch09/18900340ma", 美愛);
	SetBacklog("「さあ、わたしも」", "voice/ch09/18900330yu", 優愛);

	SoundPlay("美愛２",0,1000,false);
//	SoundPlay("優愛２",0,1000,false);

//以下のセリフ、同時に音声出したいです
//※美愛のセリフは画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900330yu">
「さあ、わたしも」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
//	TypeBegin10();//――――――――――――――――――――――――――――――
	Request("@text007", NoLog);
	TypeBeginEX();//――――――――――――――――――――――――――――――
//以上のセリフ、同時に音声出したいです

				if(#SYSTEM_click_break_voice){
//				SoundStop2("優愛２");
				SoundStop2("美愛２");
				}
				else{
				}

	FadeDelete("テキスト１", 0, false);
	FadeDelete("back04", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
美愛――あるいは優愛――が、優愛――あるいは美愛――を、先導するように。音もなく歩き出す。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateColor("back04", 200, 0, 0, 1280, 720, "Black");
	Fade("back04", 0, 0, null, false);
	Fade("back04", 100, 1000, null, true);

	CreateVOICE("美愛３","ch09/18900360ma");
//	CreateVOICE("優愛３","ch09/18900350yu");
//	SoundStop2("優愛２");
	SoundStop2("美愛２");

//【美愛】
//<voice name="美愛" class="美愛" src="voice/ch09/18900360ma">
//「わたしと同じ目にあいなさい」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 200, center, Middle, Auto, Auto, "「わたしと同じ目にあいなさい」");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SoundPlay("美愛３",0,1000,false);
//	SoundPlay("優愛３",0,1000,false);

	SetBacklog("「わたしと同じ目にあいなさい」", "voice/ch09/18900360ma", 美愛);
	SetBacklog("「あなたと同じ目にあいなさい」", "voice/ch09/18900350yu", 優愛);


//以下のセリフ、同時に音声出したいです
//※美愛のセリフは画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900350yu">
「あなたと同じ目にあいなさい」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
//	TypeBegin10();//――――――――――――――――――――――――――――――
	Request("@text009", NoLog);
	TypeBeginEX();//――――――――――――――――――――――――――――――
//以上のセリフ、同時に音声出したいです

				if(#SYSTEM_click_break_voice){
//				SoundStop2("優愛３");
				SoundStop2("美愛３");
				}
				else{
				}

	FadeDelete("テキスト１", 0, false);
	FadeDelete("back04", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
優愛と美愛。
顔がうり二つの、一卵性双生児。
その境界が、曖昧になっていく――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH13", 1000, 0, NULL);

	ClearAll(1000);
	Wait(500);

//～～Ｆ・Ｏ


//ＢＧ//ＡＨ東京総合病院・病棟屋上//夜
//ＳＥ//風の音

	CreateSE("SE10","SE_自然_風音_強_LOOP");
	MusicStart("SE10", 500, 1000, 0, 1000, null, true);

	CreateBG(100, 1000, 0, 0, "cg/bg/bg198_01_3_病棟屋上_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
闇の中に突き立った、二棟の巨大な箱。

けれどそれは、すぐ近くにそびえる新宿の摩天楼に比べれば、さながら大人を見上げる子供のよう。

病棟の屋上。
美愛に誘われて優愛が辿り着いたのは、そこだった。

高くそびえるフェンスは、誰の仕業なのか、一角だけ人がひとり通れるほどの大きさで破られてしまっている。

その破られた箇所からフェンスの外側に出た美愛と優愛は、屋上の縁に立った。

正面には、外来棟。
病棟よりも低いため、その屋上庭園を一望できる。

とは言っても、ライトアップされているわけではないので誰かがいても優愛には分からないだろう。

屋上は風が強い。
その強い風が、優愛と美愛の長く柔らかな髪を、服の裾を、激しくはためかせた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateColor("back04", 200, 0, 0, 1280, 720, "Black");
	Fade("back04", 0, 0, null, false);
	Fade("back04", 100, 1000, null, true);

//【美愛】
//<voice name="美愛" class="美愛" src="voice/ch09/18900380ma">
//「わたしたちは、元々、ひとつだったんだから」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 200, center, Middle, Auto, Auto, "「わたしたちは、元々、ひとつだったんだから」");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);


	CreateVOICE("美愛４","ch09/18900380ma");
//	CreateVOICE("優愛４","ch09/18900370yu");
//	SoundStop2("優愛３");
	SoundStop2("美愛３");
	SoundPlay("美愛４",0,1000,false);
//	SoundPlay("優愛４",0,1000,false);

	SetBacklog("「わたしたちは、元々、ひとつだったんだから」", "voice/ch09/18900380ma", 美愛);
	SetBacklog("「わたしたちは、元々、ひとつだったんだから」", "voice/ch09/18900370yu", 優愛);

//以下のセリフ、同時に音声出したいです
//※美愛のセリフは画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900370yu">
「わたしたちは、元々、ひとつだったんだから」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
//	TypeBegin10();//――――――――――――――――――――――――――――――
	Request("@text012", NoLog);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Delete("テキスト１");


//【美愛】
//<voice name="美愛" class="美愛" src="voice/ch09/18900400ma">
//「また、戻るだけ」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 200, center, Middle, Auto, Auto, "「また、戻るだけ」");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);


	CreateVOICE("美愛５","ch09/18900400ma");
//	CreateVOICE("優愛５","ch09/18900390yu");
//	SoundStop2("優愛４");
	SoundStop2("美愛４");
	SoundPlay("美愛５",0,1000,false);
//	SoundPlay("優愛５",0,1000,false);

	SetBacklog("「また、戻るだけ」", "voice/ch09/18900400ma", 美愛);
	SetBacklog("「また、戻るだけ」", "voice/ch09/18900390yu", 優愛);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900390yu">
「また、戻るだけ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
//	TypeBegin10();//――――――――――――――――――――――――――――――
	Request("@text013", NoLog);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Delete("テキスト１");

//【美愛】
//<voice name="美愛" class="美愛" src="voice/ch09/18900420ma">
//「一歩を、踏み出せば」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 200, center, Middle, Auto, Auto, "「一歩を、踏み出せば」");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	CreateVOICE("美愛６","ch09/18900420ma");
//	CreateVOICE("優愛６","ch09/18900410yu");
//	SoundStop2("優愛５");
	SoundStop2("美愛５");
	SoundPlay("美愛６",0,1000,false);
//	SoundPlay("優愛６",0,1000,false);

	SetBacklog("「一歩を、踏み出せば」", "voice/ch09/18900420ma", 美愛);
	SetBacklog("「一歩を、踏み出せば」", "voice/ch09/18900410yu", 優愛);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900410yu">
「一歩を、踏み出せば」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
//	TypeBegin10();//――――――――――――――――――――――――――――――
	Request("@text014", NoLog);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Delete("テキスト１");

//【美愛】
//<voice name="美愛" class="美愛" src="voice/ch09/18900440ma">
//「あなたはわたしになる」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 200, center, Middle, Auto, Auto, "「あなたはわたしになる」");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	CreateVOICE("美愛７","ch09/18900440ma");
//	CreateVOICE("優愛７","ch09/18900430yu");
//	SoundStop2("優愛６");
	SoundStop2("美愛６");
	SoundPlay("美愛７",0,1000,false);
//	SoundPlay("優愛７",0,1000,false);

	SetBacklog("「あなたはわたしになる」", "voice/ch09/18900440ma", 美愛);
	SetBacklog("「わたしはあなたになる」", "voice/ch09/18900430yu", 優愛);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900430yu">
「わたしはあなたになる」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
//	TypeBegin10();//――――――――――――――――――――――――――――――
	Request("@text015", NoLog);
	TypeBeginEX();//――――――――――――――――――――――――――――――
//以上のセリフ、同時に音声出したいです

				if(#SYSTEM_click_break_voice){
//				SoundStop2("優愛７");
				SoundStop2("美愛７");
				}
				else{
				}

	FadeDelete("テキスト１", 0, false);
	FadeDelete("back04", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
優愛は、虚ろな瞳をして、感情のない言葉を、機械的につぶやく。

バランスを取るように両手を広げ、吹き上がってくる風の勢いに耐える。

すぐ横で、同じように手を広げた美愛が、優愛の方を向きながら笑った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//	SoundStop2("優愛７");
	SoundStop2("美愛７");
	Stand("st美愛_私服_通常左手下","mad", 200, @-150);
	FadeStand("st美愛_私服_通常左手下_mad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601016]
//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900450ma">
「耐える必要なんて、ないよ」

//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900460ma">
「あなたは、わたしの痛みを、知らなくちゃならない」

//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900470ma">
「さあ、飛んで」

//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900480ma">
「そうすれば、わたしもあなたも、同じ痛みを共有するわ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900490yu">
「わたしは、どっちなの？　わたし？　あなた？」

{	Stand("st美愛_私服_通常左手下","smile", 200, @-150);
	FadeStand("st美愛_私服_通常左手下_smile", 300, true);
	DeleteStand("st美愛_私服_通常左手下_mad", 0, true);}
//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900500ma">
「ふふ」

//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900510ma">
「それを聞いても意味はないわ」

//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900520ma">
「どっちにしたって――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Delete("@text016");

	CreateColor("back04", 500, 0, 0, 1280, 720, "Black");
	Fade("back04", 0, 0, null, false);
	Fade("back04", 100, 1000, null, true);

//【美愛】
//<voice name="美愛" class="美愛" src="voice/ch09/18900530ma">
//「あなたは飛ぶ」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 500, center, Middle, Auto, Auto, "「あなたは飛ぶ」");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	CreateVOICE("美愛８","ch09/18900530ma");
//	CreateVOICE("優愛８","ch09/18900540yu");
	SoundPlay("美愛８",0,1000,false);
//	SoundPlay("優愛８",0,1000,false);

	SetBacklog("「あなたは飛ぶ」", "voice/ch09/18900530ma", 美愛);
	SetBacklog("「わたしは飛ぶ」", "voice/ch09/18900540yu", 優愛);

	DeleteStand("st美愛_私服_通常左手下_smile", 0, false);

//以下のセリフ、同時に音声出したいです
//※美愛のセリフは画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900540yu">
「わたしは飛ぶ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
//	TypeBegin10();//――――――――――――――――――――――――――――――
	Request("@text017", NoLog);
	TypeBeginEX();//――――――――――――――――――――――――――――――
//以上のセリフ、同時に音声出したいです

				if(#SYSTEM_click_break_voice){
//				SoundStop2("優愛８");
				SoundStop2("美愛８");
				}
				else{
				}

	FadeDelete("テキスト１", 0, false);

	CreateSE("SE01","SE_じん体_動作_足_走る_LOOP");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
	WaitAction("SE01", 200);

	SetVolume("SE01", 0, 0, NULL);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
優愛からは一切の躊躇が消え、
自らの足を一歩、前へ踏み出そうとした――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//銃声
	CreateSE("SE02","SE_衝撃_じゅう声響く");
	MusicStart("SE02", 0, 600, 0, 1000, null, false);

	Wait(1000);

	FadeDelete("back04", 0, null);

	SoundStop2("優愛８");
	SoundStop2("美愛８");
	CreateSE("SE360101","SE_じん体_動作_足_蹴る_イス");
	CreateSE("SE360202","SE_衝撃_ひととぶつかる");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900550yu">
「……！」

闇夜を切り裂く銃声。

優愛はハッとして、我に返った。
そして足許を見て悲鳴を上げる。

自らが立つ場所のあまりの高さに目がくらむ。

{	MusicStart("SE360101",0,300,0,1000,null,false);
	MusicStart("SE360202", 0, 1000, 0, 1000, null, false);}
バランスが崩れ、落ちそうになる。必死で背後のフェンスへ手を伸ばし、しがみつくことで落下を免れた。

銃声は、外来棟の屋上の方から聞こえた。
改めてそちらへ目を向ける。

屋上庭園の中央にある円形の広場に、かろうじて人影が見えた。

数はふたつ。
ひとりが倒れ、もうひとりがそのそばに立っている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常","shock", 200, @+150);
	FadeStand("st優愛_制服_通常_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601019]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900560yu">
「判さん……？」

あの刑事が誰かを射殺したのか。
あるいは、あの刑事が誰かに射殺されたのか。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st美愛_私服_通常左手下","hard", 190, @-150);
	FadeStand("st美愛_私服_通常左手下_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602019]
//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900570ma">
「なにをしてるの？」

//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900580ma">
「どうして、わたしと同じ痛みを味わおうとしないの？」

{	Stand("st美愛_私服_通常左手下","sad", 190, @-150);
	FadeStand("st美愛_私服_通常左手下_sad", 300, true);
	DeleteStand("st美愛_私服_通常左手下_hard", 0, true);}
//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900590ma">
「そんなの卑怯よ。ずるいわ……」

{	Stand("st優愛_制服_通常","worry", 200, @+150);
	FadeStand("st優愛_制服_通常_worry", 300, true);
	DeleteStand("st優愛_制服_通常_shock", 0, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900600yu">
「美愛ちゃん……」

{	Stand("st美愛_私服_通常左手下","hard", 190, @-150);
	FadeStand("st美愛_私服_通常左手下_hard", 300, true);
	DeleteStand("st美愛_私服_通常左手下_sad", 0, true);}
//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900610ma">
「違うわ。わたしは優愛よ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900620yu">
「優愛は、わたし……」

//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900630ma">
「美愛は、あなた」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900640yu">
「あなたは、いったい、なんなの……？」

//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900650ma">
「わたしはあなたの望んだもの」

//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900660ma">
「あなたはわたしの望んだもの」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	DeleteStand("st優愛_制服_通常_worry", 300, false);
	DeleteStand("st美愛_私服_通常左手下_hard", 300, true);
	CreateSE("SE02","SE_衝撃_衝撃音03");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	BGMPlay360("CH10", 500, 1000, true);
	Stand("bu美愛_私服_通常左手下","cool", 200, @0);
	Move("bu美愛_私服_通常左手下_cool*", 0, @0, @50, null, true);
	Move("bu美愛_私服_通常左手下_cool*", 200, @0, @-50, null, false);
	FadeStand("bu美愛_私服_通常左手下_cool", 200, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603019]
美愛がつかみかかってくる。
優愛の首に両手をかけ、絞め付けてくる。

喉に強い圧迫感。
息ができなくなる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	CreateColor("back04", 100, 0, 0, 1280, 720, "Black");
	Fade("back04", 0, 0, null, false);
	Fade("back04", 2000, 1000, null, false);


	Wait(700);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
//◆苦痛
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900670yu">
「ぁ……う……ぎ……」

美愛は亡霊ではなかった。
確かにそこに肉体があって。
優愛の首を絞めていた。

//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900680ma">
「お願い、死んでよ」

//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900690ma">
「今日ぐらいわたしのお願いを聞いて」

//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900700ma">
「いつも我慢してきたんだから」

{	CreateColor("red", 500, 0, 0, 1280, 720, "RED");
	Fade("red", 0, 0, null, false);
	Fade("red", 500, 200, null, true):}
優愛の視界が赤くなる。
両手を中空へとさまよわせる。
けれどなにもつかめない。

殺される――

{	CreateSE("SE02","SE_じん体_動作_のぞく");
	MusicStart("SE02", 0, 1000, 0, 1000, null, true);
	CreateSE("SE03","SE_じん体_動作_滑って転ぶ");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);}
その極限的な恐怖を前にして、優愛は自分でも思わぬ力で、全身を使って美愛を振りほどこうともがく。

けれど美愛の力は強く、まったく歯が立たない。

{	Fade("red", 500, 500, null, true):}
思考までが赤く染まる。
意識がどろっとした血に覆われたかのように感じる。

{	CreateSE("SE03","SE_じん体_動作_滑って転ぶ");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);}
激しく頭を振っていたら眼鏡が外れてしまった。
もはや傍目には、優愛と美愛の見分けは付かない。

どっちがどっちを殺したって、結果は任意に選べる。優愛が死んだなら美愛が優愛になればいい。

美愛が死んだなら優愛が美愛になればいい。

優愛の心にじんわりと広がっていく、あきらめの気持ち。
目の前に、憎悪ににじんだ美愛――あるいは優愛――の顔。
それを見たくなくて、顔を背けた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu美愛_私服_通常左手下_cool", 0, true);

	SetVolume("SE02", 500, 0, NULL);

//イメージＢＧ//屋上庭園の植え込み＋優愛ディソード
	CreateTextureEX("優愛剣取り出し", 120, 0, 0, "cg/bg/bg245_01_6_chnディソード全体_優愛_a.png");
	CreateTextureEX("back03", 100, 0, 0, "cg/bg/bg107_03_3_外来棟屋上_a.jpg");
	Request("優愛剣取り出し", AddRender);
	Request("back03", Smoothing);
//	SetShade("back03", HEAVY);
	Fade("back03", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text021]
赤い視界に飛び込んでいたのは、植え込み。
屋上庭園を彩っている花たち。

{	Fade("優愛剣取り出し", 500, 200, null, true);}
その花の中に、異質な影が混じっているような気がした。
眼鏡を落としてしまったせいで見た、目の錯覚かもしれない。

でも――

もはや呼吸もできず。
苦しみの中にかすかな安らぎがせり上がってきて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Zoom("back03", 1000, 1300, 1300, AxlDxl, false);
	Zoom("優愛剣取り出し", 1000, 1300, 1300, AxlDxl, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601021]
このまま楽になってもいいかもしれないとは思いながらも、死にたくないという本能の欲求が、その安らぎを拒絶し。

優愛に、その異質な影へと手を伸ばさせていた。

植え込みまでの距離はおよそ２メートル。この状態で手を伸ばしたところで、届くはずはない。

それなのに。

指先が、硬く冷たいなにかに触れた。

つかむ。
ほとんど無意識に。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――



	SetVolume360("CH10", 500, 0, NULL);
	CreateTextureEX("Preback03", 100, 0, 0, "cg/bg/bg107_01_3_外来棟屋上_a.jpg");
	Fade("優愛剣取り出し", 500, 0, null, false);
	Fade("back04", 0, 0, null, false);
	Fade("red", 300, 0, null, false);
	Fade("Preback03", 300, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602021]
直後、消失しかけていた楠優愛の意識が、霧が晴れたかのように明瞭になる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Wait(250);

	Fade("Preback03", 1, 0, null, false);
	Fade("back03", 1, 0, null, true);
	Delete("red");
	Delete("back03");
	Delete("Preback03");
	Delete("back04");

	Wait(250);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text921]
//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900710ma">
「……！？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	CreateColor("白１", 700, 0, 0, 1280, 720, "White");
	Fade("白１", 0, 0, null, false);
	Request("白１", AddRender);

	CreateColor("色１", 1000, 0, 0, 1280, 720, "BLACK");
	Fade("色１", 0, 0, null, true);

	CreateSE("SE03","SE_衝撃_衝撃は_リアルぶーと");
	CreateSE("SE02","SE_擬音_ディそーど_具現化直前_Loop");
	CreateSE("SE00","SE_えい像_ゆあでぃそーど");

//画面エフェクト//赤い花びらのようなものが舞う
	CreateMovie360("ムービー", 500, Center, Middle, true, false, "dx/mv花びら.avi");
	Zoom("ムービー", 0, 4000, 4000, Dxl2, true);
	Fade("ムービー", 0, 0, null, false);
//	Request("ムービー", Play);


	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	MusicStart("SE02", 0, 1000, 0, 1000, null, true);

	Fade("白１", 2000, 1000, null, true);
	Fade("ムービー", 0, 1000, null, true);
	Zoom("ムービー", 300, 2000, 2000, Dxl2, false);
	Fade("白１", 300, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
目に見えない強烈な衝撃が発せられ。

花びらにも見える赤い光が舞い、覆い被さっていた双子の妹が、弾き飛ばされる。

咳き込みながら、よろよろと立ち上がった優愛は、自らが握りしめているものを見て、目を見張った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＧ//優愛・ディソード顕現
//※すでに剣は発現済み。顕現アクションはナシ。優愛は眼鏡かけてない

	SetVolume("SE02", 500, 0, null);
	SetVolume("SE03", 500, 0, null);

	MusicStart("SE00", 2000, 1000, 0, 1000, null, true);


	Fade("色１", 500, 1000, null, true);

	CreateMovie360("ムービー１", 600, Center, middle, true, false, "dx/mvそーど02_a.avi");
//	Request("ムービー１", Play);
	Delete("ムービー");

//25秒
	Fade("色１", 1000, 0, null, false);
//	Move("ムービー１", 30000, @0, 0, Dxl1, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
それは、一振りの剣。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


//あまりにも、犀利。
	SetFont("ＭＳ ゴシック", 26, #000000, #FFFFFF, 500, NULL);
	CreateText("テキスト１", 1000, center, Middle, Auto, Auto, "あまりにも、犀利。");
	Request("テキスト１", NoLog);
	SetBacklog("あまりにも、犀利。", "null", null);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//	WaitAction("テキスト１", null);
//	WaitKey();


//以下のテキスト、同時に出したいです
//※「あまりにも犀利。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text024]
あまりにも、優美。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Delete("テキスト１");

//	CreateColor("色１", 1000, 0, 0, 1280, 720, "BLACK");
//	Fade("色１", 0, 0, null, true);
	Fade("色１", 500, 1000, null, true);

	Delete("ムービー１");

	CreateMovie360("ムービー２", 600, Center, middle, true, false, "dx/mvそーど02_b.avi");
//	Request("ムービー２", Play);

	Fade("色１", 500, 0, null, true);


//あまりにも、精悍。
	SetFont("ＭＳ ゴシック", 26, #000000, #FFFFFF, 500, NULL);
	CreateText("テキスト１", 1000, center, Middle, Auto, Auto, "あまりにも、精悍。");
	Request("テキスト１", NoLog);
	SetBacklog("あまりにも、精悍。", "null", null);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//※「あまりにも精悍。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text025]
あまりにも、清楚。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Delete("テキスト１");

	Fade("色１", 500, 1000, null, true);

	Delete("ムービー２");

	CreateMovie360("ムービー３", 600, Center, middle, true, false, "dx/mvそーど02_c.avi");
//	Request("ムービー３", Play);

	Fade("色１", 500, 0, null, true);

//あまりにも、幽玄で得体が知れず。
	SetFont("ＭＳ ゴシック", 26, #000000, #FFFFFF, 500, NULL);
	CreateText("テキスト１", 1000, center, Middle, Auto, Auto, "あまりにも、幽玄で得体が知れず。");
	Request("テキスト１", NoLog);
	SetBacklog("あまりにも、幽玄で得体が知れず。", "null", null);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//※「あまりにも、幽玄で得体が知れず。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text026]
あまりにも、繊細で傷つきやすく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Delete("テキスト１");

	Fade("色１", 500, 1000, null, true);

	Delete("ムービー３");

	CreateMovie360("ムービー４", 600, Center, middle, true, false, "dx/mvそーど02_d.avi");
//	Request("ムービー４", Play);

	Fade("色１", 500, 0, null, true);

//そして、涙が出るほどに美しい。
	SetFont("ＭＳ ゴシック", 26, #000000, #FFFFFF, 500, NULL);
	CreateText("テキスト１", 1000, center, Middle, Auto, Auto, "そして、涙が出るほどに美しい。");
	Request("テキスト１", NoLog);
	SetBacklog("そして、涙が出るほどに美しい。", "null", null);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text027]
そして、涙が出るほどに美しい。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――
//以上のテキスト、同時に出したいです
	FadeDelete("テキスト１", 0, false);

	Fade("白１", 2000, 1000, null, true);

	Delete("ムービー４");

	CreateTexture360("back10", 100, Center, -480, "cg/ev/ev083_01_3_優愛ディソード_a.jpg");

	Fade("白１", 1000, 0, null, false);
	Move("back10", 2000, @0, @480, Dxl3, false);

//	FadeDelete("back04", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text028]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900720yu">
「これ……は……！」

自らの手の中にあるもの。

そこから優愛が連想したものは、かつて地下道で見たあやせの剣であり、判が話していたセナという少女の剣。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE00", 1000, 0, null);
	CreateBG(100, 500, 0, 0, "cg/bg/bg107_01_3_外来棟屋上_a.jpg");
	Stand("st美愛_私服_通常左手下","cool", 200, @0);
	FadeStand("st美愛_私服_通常左手下_cool", 500, true);
	CreateSE("SE10","SE_自然_風音_強_LOOP");
	MusicStart("SE10", 1000, 700, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601028]
//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900730ma">
「う……今のは、なに……？」

さっきの謎の衝撃波に飛ばされ、植え込みに埋もれるようになっていた美愛が、頭を押さえながら這い出てくる。

//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900740ma">
「あなたは、なにをしたの……？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900750yu">
「わたしは……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900760yu">
「美愛ちゃん、わたし、やっと分かったわ。どうして、ここまで一生懸命、あなたの死の真相を調べていたのか」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//―――――――――――――――――――――――――――――

//	Delete("@text028");

//	CreateVOICE("美愛９","ch09/18900770ma");
//	SoundPlay("美愛９",0,1000,false);

//	SetBacklog("「わたしを殺そうとしたの？　わたしはまた殺されるところだったの？　また？」", "voice/ch09/18900770ma", 美愛);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text900]
//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900770ma">
「わたしを殺そうとしたの？
　わたしはまた殺されるところだったの？
　また？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
//	TypeBegin10();//―――――――――――――――――――――――――――――
	TypeBeginEX();//―――――――――――――――――――――――――――――

//	SoundStop2("美愛９");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text901]
//◆涙声
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900780yu">
「結局、わたしはあなたが怖かったのよ……。当てつけに死なれたと思ったの。あなたが、分からなかったの」

//◆涙声
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900790yu">
「あなたが死んだ理由は、わたしのせいじゃないって証明して、安心したかった」

//◆涙声
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900800yu">
「最低の、お姉ちゃんね――」

//【美愛】
<voice name="美愛" class="美愛" src="voice/ch09/18900810ma">
「どうして、死んでくれないのよぉっ！」

もはや話は通じなかった。
始まりが同一であった２人の心は、いまや完全に乖離し、永遠に戻ることはない。

{	DeleteStand("st美愛_私服_通常左手下_cool", 300, true);
	CreateSE("SE02","SE_衝撃_衝撃音03");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Stand("bu美愛_私服_通常左手下","mad", 200, @0);
	FadeStand("bu美愛_私服_通常左手下_mad", 300, true);}
美愛がまたもつかみかかってくる。
先ほどの苦しみを思い出し、恐怖に震えた優愛は――

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900820yu">
「いやっ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE10", 0, 0, NULL);

//ＳＥ//剣を振る
	CreateSE("SE02","SE_擬音_ディそーど_人を切る");

	CreateMovie360("ムービー", 200, Center, Middle, false, false, "dx/mv軌跡01.avi");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//	Request("ムービー", Play);

	DeleteStand("bu美愛_私服_通常左手下_mad", 0, true);

	WaitAction("ムービー", null);

	Delete("ムービー");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text029]
一閃する。
手にした剣は、鋭い軌跡を描き。
亡霊を両断した。

美愛の動きが止まる。
愕然とした表情を見せて、

左の脇腹下から右肩へかけてえぐられた傷を、手で探るようにした。

血は、出ていない。

//◆涙声
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900830yu">
「美愛ちゃんは……２ヶ月前に死にました……」

//◆涙声
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900840yu">
「そ、それなら、あなたは、誰なんですか……？」

美愛の身体から、目に見えるほどの大きな粒子が無数ににじみ出す。

{	CreateSE("SE03","SE_擬音_七海消滅");
	MusicStart("SE03", 0, 500, 0, 1000, null, false);}
泡に包まれた彼女の肉体は徐々に崩壊し、その輪郭が薄れていく。

そして、別のものへと変貌していく。

信じられない思いで、優愛はそれを見ていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//ヒュンヒュンという機械音
//以下、ＳＥはしばらく続く
	CreateSE("SE02","SE_擬音_きかい_ひゅんひゅん2_LOOP");
	MusicStart("SE02", 500, 300, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text030]
やがて美愛の代わりに現れたのは、恰幅のいい男。デニムのシャツを着て、汚いジーパンを穿き、背にはリュック。

優愛の見たこともない男だった。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900850yu">
「誰……？　あなた、誰……？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900860yu">
「どうして、美愛ちゃんの姿に……？　どうやって……」

優愛は混乱し、ディソードを手にしたまま後ずさる。
男の方も、自らの姿が露わになることを想定していなかったらしく、慌てた態度を見せた。

//【ポーターＡ】
<voice name="ポーターＡ" class="ポーターＡ" src="voice/ch09/18900870pa">
「お前こそ、なんで……」

//【ポーターＡ】
<voice name="ポーターＡ" class="ポーターＡ" src="voice/ch09/18900880pa">
「まさかこのガキ、ギガロマニアックスか……！？
聞いてないぞ……！」

//【ポーターＡ】
<voice name="ポーターＡ" class="ポーターＡ" src="voice/ch09/18900889pa">
「くっそ、どうしたら……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//剣が高速で投擲された音
//ＳＥ//剣がモデムに突き刺さる
/*森島ＳＥダミー*/
	CreateSE("SE03","SE_擬音_ディそーど_空を切る2");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	WaitAction("SE03", null);

	SetVolume("SE02", 0, 0, NULL);
	CreateSE("SE04","SE_擬音_きかい切る音");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text031]
“それ”は、重力を無視して、ほぼ水平に飛来した。

//【ポーターＡ】
<voice name="ポーターＡ" class="ポーターＡ" src="voice/ch09/18900900pa">
「あ？」

男が背中を振り返ったときには、すでに“それ”は彼が背負っていたリュックに突き刺さっており、

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);

	PrintBG(100);

//ＳＥ//感電
	CreateSE("SE01","SE_擬音_ディそーど_コンクリート砕く");
	CreateSE("SE360301","SE_戦闘_でん撃_でん気火花");
	CreateSE("SE04","SE_衝撃_どあに激突");
	MusicStart("SE01",0,1000,0,1000,null,false);
	MusicStart("SE360301",0,1000,0,1000,null,true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text032]
//【ポーターＡ】
<voice name="ポーターＡ" class="ポーターＡ" src="voice/ch09/18900910pa">
「っ！」

そのリュックから、青白い閃光が迸った。

{	MusicStart("SE04", 0, 1000, 0, 1000, null, false);}
男は感電したかのように身体を突っ張らせ、白目をむいてうつぶせに倒れ込んだ。

口からは泡を吹き、びくんびくんと痙攣している。

そのリュックに突き刺さっていたもの。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateBG(100, 500, 0, 0, "cg/bg/bg205_01_3_あやせディソードリアルブート_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601032]
//イメージＢＧ//あやせのディソード
//リアルブート済み
優愛がついさっき手に入れたものととても似ている、曲線の美しい剣。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900920yu">
「これ……」

優愛はその剣に見覚えがあった。
以前にも一度、目にしたことがある。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE360301", 1000, 0, null);

//ＢＧ//ＡＨ東京総合病院・屋上庭園//夜
//ＳＥ//スリッパを履いた足音
//おがみ：SE：追加したいかも
	CreateBG(100, 500, 0, 0, "cg/bg/bg107_01_3_外来棟屋上_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text033]
人の気配がひとつ、近づいてくる。
優愛は顔を上げた。

薄暗がりの中から現れた、その姿。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	Stand("stあやせ_パジャマ_通常","normal", 200, @-250);
	FadeStand("stあやせ_パジャマ_通常_normal", 500, true);
	Wait(200);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601033]
//※あやせはパジャマ姿
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch09/18900930ay">
「何事かと思ったら、こんな騒ぎになっていたのね」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900940yu">
「岸本……さん……」

無表情のまま、あやせは優愛が持つ剣を一瞥した。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch09/18900950ay">
「感じる、大いなる意志を。私がこの病院に居続けた意味は、
こういうことだったんだわ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18900960yu">
「え……？」

{	DeleteStand("stあやせ_パジャマ_通常_normal", 500, true);}
あやせは、落ちていた眼鏡を拾い上げると、呆然とへたり込んでいる優愛の前に膝をつき、顔をのぞき込んできた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buあやせ_パジャマ_通常","normal", 200, @-250);
	FadeStand("buあやせ_パジャマ_通常_normal", 500, true);
	Stand("bu優愛_制服_通常左手下","shock", 200, @+250);
	FadeStand("bu優愛_制服_通常左手下_shock", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602033]
その細い指で、優愛の髪を優しくかき上げ、そっと眼鏡をかけてくれる。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch09/18900970ay">
「キミも、グラジオールの黒騎士だったのね」

そして、儚げに微笑んだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE*", 1000, 0, null);
	ClearAll(1000);

	Wait(3000);

//～～Ｆ・Ｏ

//■インターミッション４６終了

}


//■TypeBegin10
