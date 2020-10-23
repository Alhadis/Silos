//<continuation number="280">




chapter main
{

	$PreGameName = "boot_第九章";

	if($GameStart != 1)
	{
		$GameName = "ch09_186_インターミッション４５";
		$GameContiune = 1;
		Reset();
	}

		ch09_186_インターミッション４５();
}


function ch09_186_インターミッション４５()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	IntermissionIn();

//合流３
//アイキャッチ
//■インターミッション４５
//ＢＧ//ＡＨ総合病院・ロビー//夜

	DeleteAll();

	CreateTextureEX("back01", 100, 0, 0, "cg/bg/bg098_01_3_AHロビー_a.jpg");
	Fade("back01", 0, 1000, null, true);

	Stand("st安二_スーツ_通常","hard", 200, @-150);
	FadeStand("st安二_スーツ_通常_hard", 0, true);

	IntermissionIn2();

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
夜の病院からは人の気配が急速に薄れる。

それはさながら、昼間に生と死を受け入れ過ぎたがために、この時間を使ってバランスを取っているかのようだ。

この時間の病院には、生の匂いも死の匂いも存在しない。あるのは、空虚な静謐さだけ。

{	Stand("st安二_スーツ_通常","normal", 200, @-150);
	FadeStand("st安二_スーツ_通常_normal", 300, true);
	DeleteStand("st安二_スーツ_通常_hard", 0, true);}
そんなことを考えている自らの異質さに、判安二は苦笑した。

だがそれにしても、今日は特別に静かに思える。

まだ消灯時間にはなっていないはずだが、廊下の照明は落とされ、看護師の姿もまったく見られない。

判はロビーに足を踏み入れた直後から、イヤな予感をひしひしと感じていた。
その予感に根拠はない。いわば刑事の勘というものであるが、

{	Stand("st安二_スーツ_通常","pride", 200, @-150);
	FadeStand("st安二_スーツ_通常_pride", 300, true);
	DeleteStand("st安二_スーツ_通常_normal", 0, true);}
――俺の勘はよく当たるんだよな。

妙に宗教的とも言えることを考えてしまったのも、そのイヤな予感をごまかすためかもしれない。

この病院にタクシーで乗り付ける間に、諏訪のケータイには何度か連絡をした。

しかしいずれも不通であり、それこそが後輩の危機的状況を端的に示していた。

{	Stand("st安二_スーツ_通常","hard", 200, @-150);
	FadeStand("st安二_スーツ_通常_hard", 300, true);
	DeleteStand("st安二_スーツ_通常_pride", 0, true);}
のんびりはしていられなかった。
この広い病院内から、一刻も早く諏訪が捕らえられている場所を見つけ、救い出さなければならない。

しかも誘拐犯に気取られることなく、だ。

リノリウム製の床は靴音が響く。
判はロビーに入る前に、履いている革靴をあらかじめ脱ぎ捨てていた。

冬が間近に迫るこの季節。靴下越しに伝わってくる床の冷たさに、判はたまらず身震いした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//自動扉が開く
	CreateSE("SE01","SE_日常_びょういん_自動どあ開く");
	MusicStart("SE01", 0, 600, 0, 1000, null, false);

	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆小声
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18600010yu">
「判さん……！」

正面入り口の自動扉が開く音が、ロビーに響き渡った。
続いて判の名を呼びかける少女の声。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//自動扉が開く
	CreateSE("SE01","SE_日常_びょういん_自動どあ開く");
	MusicStart("SE01", 0, 600, 0, 1000, null, false);

	Wait(1000);

	CreateTextureEX("back05", 500, 0, 0, "cg/bg/bg098_01_3_AHロビー_a.jpg");
	Fade("back05", 500, 1000, null, true);
	DeleteStand("st安二_スーツ_通常_hard", 0, true);
	Stand("st優愛_制服_通常左手下","worry", 200, @+240);
	FadeStand("st優愛_制服_通常左手下_worry", 0, true);
	Fade("back05", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
楠優愛がロビーへと入ってきたのを見て、判は驚きのあまり言葉を失った。
{	DeleteStand("st優愛_制服_通常左手下_worry", 500, true);
	Stand("bu優愛_制服_通常左手下","worry", 200, @+400);
	Stand("bu安二_スーツ_通常","hard", 200, @-400);
	FadeStand("bu安二_スーツ_通常_hard", 500, false);
	FadeStand("bu優愛_制服_通常左手下_worry", 500, true);}
慌てて少女へと駆け寄る。

優愛は、メガネの奥の瞳を不安げに周囲へと巡らせた。

//◆小声
//【判】
<voice name="判" class="判" src="voice/ch09/18600020bn">
「おい、なんで付いてきたんだ。身を隠せって言っただろうに」

//◆小声
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18600030yu">
「すみません……でも、わたし……」

判は百瀬の姿を探す。だが彼女はどこにもいない。

この少女はひとりで来たのだと悟り、判は困惑顔で頭を掻きむしった。

//◆小声
//【判】
<voice name="判" class="判" src="voice/ch09/18600040bn">
「今すぐ戻れ。これは遊びじゃねえんだぞ」

//◆小声
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18600050yu">
「そ、それは、分かっている、つもりです……っ」

//◆小声
//【判】
<voice name="判" class="判" src="voice/ch09/18600060bn">
「分かってるなら帰るんだ――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//車椅子の軋む音「キィ……」
	CreateSE("SE01","SE_日常_車椅す");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	Wait(500);

	Stand("bu優愛_制服_通常左手下","shock", 200, @+400);
	Stand("bu安二_スーツ_通常","shock", 200, @-400);
	FadeStand("bu安二_スーツ_通常_shock", 300, true);
	FadeStand("bu優愛_制服_通常左手下_shock", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_worry", 0, true);
	DeleteStand("bu安二_スーツ_通常_hard", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
そのとき、ロビーの先に伸びる廊下から、軋むような音が聞こえてきた。

誰もいない、薄暗い廊下。
その真ん中を、ゆっくりと判たちの方へと進んでくる、無人の車椅子。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_日常_かわ靴階だん遠ざかる");
	MusicStart("SE01", 0, 500, 0, 1000, null, true);
	Wait(300);
	SetVolume("SE01", 5000, 0, NULL);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//ＳＥ//階段を駆け上る革靴の靴音
ほぼ同時に、何者かが階段を駆け上がっていく音もした。

{	Stand("bu安二_スーツ_通常","hard", 200, @-400);
	FadeStand("bu安二_スーツ_通常_hard", 300, true);
	DeleteStand("bu安二_スーツ_通常_shock", 0, true);}
//【判】
<voice name="判" class="判" src="voice/ch09/18600070bn">
「とにかく優愛ちゃんは帰れ！　いいな！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE36001","SE_日常_かわ靴階だん遠ざかる");
	MusicStart("SE36001", 0, 500, 0, 1000, null, false);

	DeleteStand("bu安二_スーツ_通常_hard", 300, false);
	DeleteStand("bu優愛_制服_通常左手下_shock", 300, true);
	Stand("st優愛_制服_通常左手下","shock", 200, @+400);
	FadeStand("st優愛_制服_通常左手下_shock", 300, true);

	Wait(300);
	SetVolume("SE36001", 5000, 0, NULL);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
そう釘を刺しながら、すでに判は走り出していた。優愛の返事を聞かず、靴音を追って階段を駆け上がる。

普段のやる気のなさからはとても想像できないほど、
その身のこなしは素早かった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 500, 0, NULL);
	SetVolume("SE36001", 500, 0, NULL);

	PrintBG(100);

	CreateColor("back10", 100, 0, 0, 1280, 720, "Black");
	DrawTransition("back10", 500, 0, 1000, 100, null, "cg/data/right2.png", true);

	Wait(2000);


//ＢＧ//ＡＨ総合病院屋上//夜
//ＳＥ//風の音
	CreateSE("SE02","SE_自然_風音_LOOP");
	MusicStart("SE02", 500, 1000, 0, 1000, null, true);

	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg107_01_3_外来棟屋上_a.jpg");
	DrawTransition("back03", 1000, 0, 1000, 100, null, "cg/data/right2.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg107_01_3_外来棟屋上_a.jpg");

	Wait(1000);

	Stand("st安二_スーツ_通常","hard", 200, @-400);
	FadeStand("st安二_スーツ_通常_hard", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
靴音を追いかけて辿り着いたのは、外来棟の屋上だった。

庭園のように植え込みが設けられている。

患者の心を癒す空間なのだろうが、あいにくライトアップのサービスはしていないらしく、どんな花が咲いているのか確かめることはできない。

//【判】
<voice name="判" class="判" src="voice/ch09/18600080bn">
「…………」

屋上ということもあって、風が強い。
息を切らしながら、判は周囲へ素早く注意を払った。

靴音の男は間違いなくここへと逃げ込んだはずだったが、今その姿は忽然と消えてしまった。

――まんまと誘い出されたか？

わざとらしいほどの音を立てて逃げた男。
それが意味するのは、判をこの場所へと誘おうとした意図以外に考えられない。

判は今、銃を持っていなかった。丸腰は不安なので、武器になりそうなものを探すが、めぼしいものは見つからない。

ゴクリと息を呑んだ。
額ににじむ汗を指で払う。

一歩ずつ、庭園の中央へと足を進めていく。

植え込みやベンチの陰など、身を隠せそうな場所はあちこちにあった。

どこから襲いかかられても対応できるように、判は全神経を尖らせる。

庭園中央は円形の広場になっており、その外周に沿う形でいくつかのベンチが設けてあった。

順番に目を凝らしていく。
と、そのうちのひとつに、怪しい物体が置かれているのを見つけた。

なおも慎重に周囲に気を配りつつ、ゆっくりとそのベンチへと歩み寄る。
近づくにつれて、その形が判の目にはっきり認識できるようになった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateTextureEX("back10", 400, Center, Middle, "cg/bg/bg208_01_3_ベンチの上の物体_a.jpg");
	Fade("back10", 500, 1000, null, true);
	DeleteStand("st安二_スーツ_通常_hard", 0, false);
	Request("back10", Smoothing);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
それはサッカーボールほどの大きさで。
丸く。
黒い。

//※ベンチに置かれているのはダーススパイダーのヘルメットです
首から切断された人間の頭――

バラバラ殺人事件を何度か担当したことのある判は、かつて写真で目にしたことのあるそれをすぐに連想した。

イヤな予感はますます強まっている。

後輩刑事の首だったらと考えると、犯人に対する怒りや悔しさが沸々とこみ上げてくる。

{	Zoom("back10", 2000, 1500, 1500, AxlAuto, false);}
判はギリリと歯噛みした。
さらにベンチへと近づく。
置かれた物体はピクリとも動かない。

冷たい夜風が吹き抜け。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	WaitAction("back10", null);

	SetVolume("SE02", 0, 0, NULL);

	CreateSE("SE03","SE_衝撃_じゅう声2");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

//ＳＥ//銃声
	Shake("back10", 500, 0, 5, 0, 0, 500, Dxl3, false);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
そこで判は、銃声を耳にした。

あまりに突然のことに身がすくむ。
本来なら身体を伏せ、音がした方向を探るべきなのだろうが、その動作すらできない。

いや。

正確に言えば。

その動作をする必要は、すでになかった。

胸元に、焼けるような熱を感じて、判は自らの手で触れてみる。

{	CreateSE("SE02","SE_じん体_動作_と血");
	MusicStart("SE02", 0, 300, 0, 1000, null, false);}
ぬるりとした感触。

なにかが、彼の身体から流れ出ている。
独特の生臭い匂い。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("back11", 500, 0, 0, 1280, 720, "RED");
	Fade("back11", 0, 0, null, false);
	Fade("back11", 100, 500, null, true);
	FadeDelete("back11", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
判の脳が、銃声から少し遅れて認識し始めた、痛み。

撃たれた――

そう自覚した瞬間、足から力が抜けた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Move("back10", 3000, @0, @-160, Axl2, false);

//ＳＥ//人が倒れる音

	CreateColor("back11", 500, 0, 0, 1280, 720, "Black");
	DrawTransition("back11", 2000, 0, 1000, 100, Axl1, "cg/data/down2.png", true);
	CreateSE("SE02","SE_衝撃_どさっ");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Delete("back10");

	CreateTexture360("back03", 100, Center, Middle, "cg/ev/ev081_01_3_判死_a.jpg");
	Zoom("back03", 0, 2000, 2000, null, true);
	Move("back03", 0, -240, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
立っていられず、その場に肩から倒れ込む。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_じん体_動作_足_歩く");
	MusicStart("SE03", 6000, 1000, 0, 1000, null, false);
	WaitAction("SE03", 3000);
	Fade("back11", 2000, 0, null, true);
	Delete("back11");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
//ＳＥ//近づいてくる靴音
さっきの靴音が、判へと近づいてくる。
早くもかすみ始めた目で、判は必死にその男を見上げた。

黒い、影。
手には、拳銃。
暗いせいで、その顔を認識できない。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch09/18600090su">
「あーあ」

声がした。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch09/18600100su">
「手を引けって、言ったのに」

聞き覚えがあった。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch09/18600110su">
「残念ッスよ、先輩」

無様に倒れ伏す判のすぐ横を通り過ぎて。
諏訪護は、嘲るようにそうつぶやく。

//【判】
<voice name="判" class="判" src="voice/ch09/18600120bn">
「諏訪……か……」

//【判】
<voice name="判" class="判" src="voice/ch09/18600130bn">
「お前が、俺を……？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch09/18600140su">
「そうッス。いやあ、祝、初発砲ってところッスか」

笑いながら、諏訪はベンチに置かれてある“物体”を無造作に拾い上げた。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch09/18600150su">
「ちなみに先輩、やけにこれに注目してたッスけど、そんなに珍しかったんスか？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("back10", 500, 0, 0, "cg/bg/bg168_01_3_ダーススパイダーメット_a.jpg");
	Fade("back10", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602007]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch09/18600160su">
「ダーススパイダーのヘルメット」

判の傍らに戻ってきた諏訪は、これ見よがしにその黒いヘルメットを判の眼前に持ってくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("back03", 100, Center, Middle, "cg/ev/ev081_01_3_判死_a.jpg");

	CreateSE("SE02","SE_自然_風音_LOOP");
	MusicStart("SE02", 500, 500, 0, 1000, null, true);

	FadeDelete("back10", 500, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【判】
<voice name="判" class="判" src="voice/ch09/18600170bn">
「は、は……ざまあねえ……」

苦笑する判の視界は、もはやほとんどぼやけていた。
手足の先の感覚がやけに冷たい。
胸の痛みはあるが苦痛というわけでもない。

強烈な“視線”の気配を感じるが、それが諏訪からのものなのか、それ以外の誰かからのものなのか、判断する力も失われていた。

己の命があと数分ももたないと知った判は、急激に重くなっていく自分の身体を、無理矢理仰向けにひっくり返した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("back10", 100, Center, Middle, "cg/bg/bg206_01_3_夜空_a.jpg");
	Fade("back10", 1000, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
大の字に寝そべると、頭上には夜空。

だが雲がかかっていて、星は見えない。
もっとも、星が出ていたとしてももはや判からはそれを見る視力が失われていた。

{	CreateSE("SE03","SE_じん体_動作_と血");
	MusicStart("SE03", 500, 500, 0, 1000, null, false);}
//◆血を吐く
//【判】
<voice name="判" class="判" src="voice/ch09/18600180bn">
「げほ、げほ……」

咳き込むと、口の中に血の味が広がる。

//◆「す、わ」＝「諏訪」
//【判】
<voice name="判" class="判" src="voice/ch09/18600190bn">
「なあ、す、わ……」

//◆刑事＝デカと読んでください
//【判】
<voice name="判" class="判" src="voice/ch09/18600200bn">
「お前は……バ、バカだ。ま、まだ、まだ、ガキで、どうし、ようもない、くらいのバ、カな、刑事だ……」

//◆苦笑
//【判】
<voice name="判" class="判" src="voice/ch09/18600210bn">
「だが……お、俺は、お前のこと……けっこう、買ってた……ぜ……」

//◆嘲笑う
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch09/18600220su">
「自分は先輩が鬱陶しくてしょうがなかったッスよ」

//【判】
<voice name="判" class="判" src="voice/ch09/18600230bn">
「は、は……」

//【判】
<voice name="判" class="判" src="voice/ch09/18600240bn">
「ま、き、気持ちは、分かる……」

判の呼吸が徐々に浅くなっていく。ヒューヒューと喉から息が漏れている。
もはやその瞳は、なにも捉えてはいない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE02", 500, 0, NULL);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【判】
<voice name="判" class="判" src="voice/ch09/18600250bn">
「何者……なんだ、お前……」

意識が途切れかけている判の、最期の問い。
それに、諏訪は銃口を向けながら答えた。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch09/18600260su">
「魔法使いッス」

//【判】
<voice name="判" class="判" src="voice/ch09/18600270bn">
「……は……バカが……」

いつの間にか、風は止んでいた。
急速に凪いだ闇の中。
動きが止まる、ふたつの人影。

だがそれも刹那。

トリガーにかけた諏訪の指に、ゆっくりと力が込められた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("黒１", 500, 0, 0, 1280, 720, "Black");
	Fade("黒１", 0, 0, null, false);
	Fade("黒１", 1000, 1000, null, true);
	Delete("back*");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
//ＢＧ//黒
//◆※このフレーズは天成神光会の信者がよく使う言葉。３章にて倉持が、８章にて葉月が口にしています。
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch09/18600280su">
「先輩に、神光の救いあれ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Wait(500);

//ＳＥ//銃声
	CreateSE("SE02","SE_衝撃_じゅう声");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	WaitAction("SE02", null);

//５秒ほどウエイト

	ClearAll(0);
	DeleteAll();
	Wait(1500);

//■インターミッション４５終了

}